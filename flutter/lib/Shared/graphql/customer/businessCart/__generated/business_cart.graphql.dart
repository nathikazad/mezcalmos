import '../../../__generated/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Variables$Query$getBusinessCart {
  factory Variables$Query$getBusinessCart({required int customer_id}) =>
      Variables$Query$getBusinessCart._({
        r'customer_id': customer_id,
      });

  Variables$Query$getBusinessCart._(this._$data);

  factory Variables$Query$getBusinessCart.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$customer_id = data['customer_id'];
    result$data['customer_id'] = (l$customer_id as int);
    return Variables$Query$getBusinessCart._(result$data);
  }

  Map<String, dynamic> _$data;

  int get customer_id => (_$data['customer_id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$customer_id = customer_id;
    result$data['customer_id'] = l$customer_id;
    return result$data;
  }

  CopyWith$Variables$Query$getBusinessCart<Variables$Query$getBusinessCart>
      get copyWith => CopyWith$Variables$Query$getBusinessCart(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getBusinessCart) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$customer_id = customer_id;
    final lOther$customer_id = other.customer_id;
    if (l$customer_id != lOther$customer_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$customer_id = customer_id;
    return Object.hashAll([l$customer_id]);
  }
}

abstract class CopyWith$Variables$Query$getBusinessCart<TRes> {
  factory CopyWith$Variables$Query$getBusinessCart(
    Variables$Query$getBusinessCart instance,
    TRes Function(Variables$Query$getBusinessCart) then,
  ) = _CopyWithImpl$Variables$Query$getBusinessCart;

  factory CopyWith$Variables$Query$getBusinessCart.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getBusinessCart;

  TRes call({int? customer_id});
}

class _CopyWithImpl$Variables$Query$getBusinessCart<TRes>
    implements CopyWith$Variables$Query$getBusinessCart<TRes> {
  _CopyWithImpl$Variables$Query$getBusinessCart(
    this._instance,
    this._then,
  );

  final Variables$Query$getBusinessCart _instance;

  final TRes Function(Variables$Query$getBusinessCart) _then;

  static const _undefined = {};

  TRes call({Object? customer_id = _undefined}) =>
      _then(Variables$Query$getBusinessCart._({
        ..._instance._$data,
        if (customer_id != _undefined && customer_id != null)
          'customer_id': (customer_id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getBusinessCart<TRes>
    implements CopyWith$Variables$Query$getBusinessCart<TRes> {
  _CopyWithStubImpl$Variables$Query$getBusinessCart(this._res);

  TRes _res;

  call({int? customer_id}) => _res;
}

class Query$getBusinessCart {
  Query$getBusinessCart({
    required this.business_cart,
    required this.$__typename,
  });

  factory Query$getBusinessCart.fromJson(Map<String, dynamic> json) {
    final l$business_cart = json['business_cart'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessCart(
      business_cart: (l$business_cart as List<dynamic>)
          .map((e) => Query$getBusinessCart$business_cart.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getBusinessCart$business_cart> business_cart;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$business_cart = business_cart;
    _resultData['business_cart'] =
        l$business_cart.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$business_cart = business_cart;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$business_cart.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getBusinessCart) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$business_cart = business_cart;
    final lOther$business_cart = other.business_cart;
    if (l$business_cart.length != lOther$business_cart.length) {
      return false;
    }
    for (int i = 0; i < l$business_cart.length; i++) {
      final l$business_cart$entry = l$business_cart[i];
      final lOther$business_cart$entry = lOther$business_cart[i];
      if (l$business_cart$entry != lOther$business_cart$entry) {
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

extension UtilityExtension$Query$getBusinessCart on Query$getBusinessCart {
  CopyWith$Query$getBusinessCart<Query$getBusinessCart> get copyWith =>
      CopyWith$Query$getBusinessCart(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getBusinessCart<TRes> {
  factory CopyWith$Query$getBusinessCart(
    Query$getBusinessCart instance,
    TRes Function(Query$getBusinessCart) then,
  ) = _CopyWithImpl$Query$getBusinessCart;

  factory CopyWith$Query$getBusinessCart.stub(TRes res) =
      _CopyWithStubImpl$Query$getBusinessCart;

  TRes call({
    List<Query$getBusinessCart$business_cart>? business_cart,
    String? $__typename,
  });
  TRes business_cart(
      Iterable<Query$getBusinessCart$business_cart> Function(
              Iterable<
                  CopyWith$Query$getBusinessCart$business_cart<
                      Query$getBusinessCart$business_cart>>)
          _fn);
}

class _CopyWithImpl$Query$getBusinessCart<TRes>
    implements CopyWith$Query$getBusinessCart<TRes> {
  _CopyWithImpl$Query$getBusinessCart(
    this._instance,
    this._then,
  );

  final Query$getBusinessCart _instance;

  final TRes Function(Query$getBusinessCart) _then;

  static const _undefined = {};

  TRes call({
    Object? business_cart = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getBusinessCart(
        business_cart: business_cart == _undefined || business_cart == null
            ? _instance.business_cart
            : (business_cart as List<Query$getBusinessCart$business_cart>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes business_cart(
          Iterable<Query$getBusinessCart$business_cart> Function(
                  Iterable<
                      CopyWith$Query$getBusinessCart$business_cart<
                          Query$getBusinessCart$business_cart>>)
              _fn) =>
      call(
          business_cart: _fn(_instance.business_cart
              .map((e) => CopyWith$Query$getBusinessCart$business_cart(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getBusinessCart<TRes>
    implements CopyWith$Query$getBusinessCart<TRes> {
  _CopyWithStubImpl$Query$getBusinessCart(this._res);

  TRes _res;

  call({
    List<Query$getBusinessCart$business_cart>? business_cart,
    String? $__typename,
  }) =>
      _res;
  business_cart(_fn) => _res;
}

const documentNodeQuerygetBusinessCart = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getBusinessCart'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'customer_id')),
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
        name: NameNode(value: 'business_cart'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'customer_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'customer_id')),
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
                name: NameNode(value: 'cost'),
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
                name: NameNode(value: 'home'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'available_for'),
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
                        name: NameNode(value: 'name_id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'description_id'),
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
                        name: NameNode(value: 'available'),
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
                    name: NameNode(value: 'id'),
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
                            name: NameNode(value: 'online_ordering'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: 'accepted_payments'),
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
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ]),
                  ),
                  FieldNode(
                    name: NameNode(value: 'bathrooms'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'bedrooms'),
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
                        name: NameNode(value: 'address'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'gps'),
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
                    name: NameNode(value: 'available_for'),
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
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
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
                        name: NameNode(value: 'name_id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'description_id'),
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
                        name: NameNode(value: 'available'),
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
                    name: NameNode(value: 'business'),
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
                            name: NameNode(value: 'online_ordering'),
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
                            name: NameNode(value: 'accepted_payments'),
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
              FieldNode(
                name: NameNode(value: 'product'),
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
                    name: NameNode(value: 'business'),
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
                            name: NameNode(value: 'online_ordering'),
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
                            name: NameNode(value: 'accepted_payments'),
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
                    name: NameNode(value: 'details'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'additional_parameters'),
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
                        name: NameNode(value: 'name_id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'description_id'),
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
                        name: NameNode(value: 'tags'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
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
                name: NameNode(value: 'service'),
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
                    name: NameNode(value: 'business'),
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
                            name: NameNode(value: 'id'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: 'accepted_payments'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: 'online_ordering'),
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
                    name: NameNode(value: 'details'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'additional_parameters'),
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
                        name: NameNode(value: 'category1'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'name_id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'description_id'),
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
                        name: NameNode(value: 'tags'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
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
                name: NameNode(value: 'event'),
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
                    name: NameNode(value: 'business'),
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
                            name: NameNode(value: 'online_ordering'),
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
                            name: NameNode(value: 'accepted_payments'),
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
                    name: NameNode(value: 'details'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'name_id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'description_id'),
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
                        name: NameNode(value: 'available'),
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
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'schedule_type'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'schedule'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'starts_at'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'ends_at'),
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
      
    ]),
  ),
]);
Query$getBusinessCart _parserFn$Query$getBusinessCart(
        Map<String, dynamic> data) =>
    Query$getBusinessCart.fromJson(data);

class Options$Query$getBusinessCart
    extends graphql.QueryOptions<Query$getBusinessCart> {
  Options$Query$getBusinessCart({
    String? operationName,
    required Variables$Query$getBusinessCart variables,
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
          document: documentNodeQuerygetBusinessCart,
          parserFn: _parserFn$Query$getBusinessCart,
        );
}

class WatchOptions$Query$getBusinessCart
    extends graphql.WatchQueryOptions<Query$getBusinessCart> {
  WatchOptions$Query$getBusinessCart({
    String? operationName,
    required Variables$Query$getBusinessCart variables,
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
          document: documentNodeQuerygetBusinessCart,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getBusinessCart,
        );
}

class FetchMoreOptions$Query$getBusinessCart extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getBusinessCart({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getBusinessCart variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetBusinessCart,
        );
}

extension ClientExtension$Query$getBusinessCart on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getBusinessCart>> query$getBusinessCart(
          Options$Query$getBusinessCart options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$getBusinessCart> watchQuery$getBusinessCart(
          WatchOptions$Query$getBusinessCart options) =>
      this.watchQuery(options);
  void writeQuery$getBusinessCart({
    required Query$getBusinessCart data,
    required Variables$Query$getBusinessCart variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerygetBusinessCart),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getBusinessCart? readQuery$getBusinessCart({
    required Variables$Query$getBusinessCart variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetBusinessCart),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getBusinessCart.fromJson(result);
  }
}

class Query$getBusinessCart$business_cart {
  Query$getBusinessCart$business_cart({
    required this.items,
    this.business_id,
    required this.customer_id,
    this.cost,
    required this.$__typename,
  });

  factory Query$getBusinessCart$business_cart.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$business_id = json['business_id'];
    final l$customer_id = json['customer_id'];
    final l$cost = json['cost'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessCart$business_cart(
      items: (l$items as List<dynamic>)
          .map((e) => Query$getBusinessCart$business_cart$items.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      business_id: (l$business_id as int?),
      customer_id: (l$customer_id as int),
      cost: l$cost == null ? null : moneyFromJson(l$cost),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getBusinessCart$business_cart$items> items;

  final int? business_id;

  final int customer_id;

  final double? cost;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$items = items;
    _resultData['items'] = l$items.map((e) => e.toJson()).toList();
    final l$business_id = business_id;
    _resultData['business_id'] = l$business_id;
    final l$customer_id = customer_id;
    _resultData['customer_id'] = l$customer_id;
    final l$cost = cost;
    _resultData['cost'] = l$cost == null ? null : moneyToJson(l$cost);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$items = items;
    final l$business_id = business_id;
    final l$customer_id = customer_id;
    final l$cost = cost;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$items.map((v) => v)),
      l$business_id,
      l$customer_id,
      l$cost,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getBusinessCart$business_cart) ||
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

extension UtilityExtension$Query$getBusinessCart$business_cart
    on Query$getBusinessCart$business_cart {
  CopyWith$Query$getBusinessCart$business_cart<
          Query$getBusinessCart$business_cart>
      get copyWith => CopyWith$Query$getBusinessCart$business_cart(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessCart$business_cart<TRes> {
  factory CopyWith$Query$getBusinessCart$business_cart(
    Query$getBusinessCart$business_cart instance,
    TRes Function(Query$getBusinessCart$business_cart) then,
  ) = _CopyWithImpl$Query$getBusinessCart$business_cart;

  factory CopyWith$Query$getBusinessCart$business_cart.stub(TRes res) =
      _CopyWithStubImpl$Query$getBusinessCart$business_cart;

  TRes call({
    List<Query$getBusinessCart$business_cart$items>? items,
    int? business_id,
    int? customer_id,
    double? cost,
    String? $__typename,
  });
  TRes items(
      Iterable<Query$getBusinessCart$business_cart$items> Function(
              Iterable<
                  CopyWith$Query$getBusinessCart$business_cart$items<
                      Query$getBusinessCart$business_cart$items>>)
          _fn);
}

class _CopyWithImpl$Query$getBusinessCart$business_cart<TRes>
    implements CopyWith$Query$getBusinessCart$business_cart<TRes> {
  _CopyWithImpl$Query$getBusinessCart$business_cart(
    this._instance,
    this._then,
  );

  final Query$getBusinessCart$business_cart _instance;

  final TRes Function(Query$getBusinessCart$business_cart) _then;

  static const _undefined = {};

  TRes call({
    Object? items = _undefined,
    Object? business_id = _undefined,
    Object? customer_id = _undefined,
    Object? cost = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getBusinessCart$business_cart(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Query$getBusinessCart$business_cart$items>),
        business_id: business_id == _undefined
            ? _instance.business_id
            : (business_id as int?),
        customer_id: customer_id == _undefined || customer_id == null
            ? _instance.customer_id
            : (customer_id as int),
        cost: cost == _undefined ? _instance.cost : (cost as double?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Query$getBusinessCart$business_cart$items> Function(
                  Iterable<
                      CopyWith$Query$getBusinessCart$business_cart$items<
                          Query$getBusinessCart$business_cart$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items
              .map((e) => CopyWith$Query$getBusinessCart$business_cart$items(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getBusinessCart$business_cart<TRes>
    implements CopyWith$Query$getBusinessCart$business_cart<TRes> {
  _CopyWithStubImpl$Query$getBusinessCart$business_cart(this._res);

  TRes _res;

  call({
    List<Query$getBusinessCart$business_cart$items>? items,
    int? business_id,
    int? customer_id,
    double? cost,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Query$getBusinessCart$business_cart$items {
  Query$getBusinessCart$business_cart$items({
    required this.id,
    required this.parameters,
    required this.cost,
    required this.item_id,
    required this.offering_type,
    this.time,
    this.home,
    this.rental,
    this.product,
    this.service,
    this.event,
    required this.$__typename,
  });

  factory Query$getBusinessCart$business_cart$items.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$parameters = json['parameters'];
    final l$cost = json['cost'];
    final l$item_id = json['item_id'];
    final l$offering_type = json['offering_type'];
    final l$time = json['time'];
    final l$home = json['home'];
    final l$rental = json['rental'];
    final l$product = json['product'];
    final l$service = json['service'];
    final l$event = json['event'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessCart$business_cart$items(
      id: (l$id as int),
      parameters: mapFromJson(l$parameters),
      cost: moneyFromJson(l$cost),
      item_id: (l$item_id as int),
      offering_type: (l$offering_type as String),
      time: (l$time as String?),
      home: l$home == null
          ? null
          : Query$getBusinessCart$business_cart$items$home.fromJson(
              (l$home as Map<String, dynamic>)),
      rental: l$rental == null
          ? null
          : Query$getBusinessCart$business_cart$items$rental.fromJson(
              (l$rental as Map<String, dynamic>)),
      product: l$product == null
          ? null
          : Query$getBusinessCart$business_cart$items$product.fromJson(
              (l$product as Map<String, dynamic>)),
      service: l$service == null
          ? null
          : Query$getBusinessCart$business_cart$items$service.fromJson(
              (l$service as Map<String, dynamic>)),
      event: l$event == null
          ? null
          : Query$getBusinessCart$business_cart$items$event.fromJson(
              (l$event as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final dynamic parameters;

  final double cost;

  final int item_id;

  final String offering_type;

  final String? time;

  final Query$getBusinessCart$business_cart$items$home? home;

  final Query$getBusinessCart$business_cart$items$rental? rental;

  final Query$getBusinessCart$business_cart$items$product? product;

  final Query$getBusinessCart$business_cart$items$service? service;

  final Query$getBusinessCart$business_cart$items$event? event;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$parameters = parameters;
    _resultData['parameters'] = mapToJson(l$parameters);
    final l$cost = cost;
    _resultData['cost'] = moneyToJson(l$cost);
    final l$item_id = item_id;
    _resultData['item_id'] = l$item_id;
    final l$offering_type = offering_type;
    _resultData['offering_type'] = l$offering_type;
    final l$time = time;
    _resultData['time'] = l$time;
    final l$home = home;
    _resultData['home'] = l$home?.toJson();
    final l$rental = rental;
    _resultData['rental'] = l$rental?.toJson();
    final l$product = product;
    _resultData['product'] = l$product?.toJson();
    final l$service = service;
    _resultData['service'] = l$service?.toJson();
    final l$event = event;
    _resultData['event'] = l$event?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$parameters = parameters;
    final l$cost = cost;
    final l$item_id = item_id;
    final l$offering_type = offering_type;
    final l$time = time;
    final l$home = home;
    final l$rental = rental;
    final l$product = product;
    final l$service = service;
    final l$event = event;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$parameters,
      l$cost,
      l$item_id,
      l$offering_type,
      l$time,
      l$home,
      l$rental,
      l$product,
      l$service,
      l$event,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getBusinessCart$business_cart$items) ||
        runtimeType != other.runtimeType) {
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
    final l$cost = cost;
    final lOther$cost = other.cost;
    if (l$cost != lOther$cost) {
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
    final l$time = time;
    final lOther$time = other.time;
    if (l$time != lOther$time) {
      return false;
    }
    final l$home = home;
    final lOther$home = other.home;
    if (l$home != lOther$home) {
      return false;
    }
    final l$rental = rental;
    final lOther$rental = other.rental;
    if (l$rental != lOther$rental) {
      return false;
    }
    final l$product = product;
    final lOther$product = other.product;
    if (l$product != lOther$product) {
      return false;
    }
    final l$service = service;
    final lOther$service = other.service;
    if (l$service != lOther$service) {
      return false;
    }
    final l$event = event;
    final lOther$event = other.event;
    if (l$event != lOther$event) {
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

extension UtilityExtension$Query$getBusinessCart$business_cart$items
    on Query$getBusinessCart$business_cart$items {
  CopyWith$Query$getBusinessCart$business_cart$items<
          Query$getBusinessCart$business_cart$items>
      get copyWith => CopyWith$Query$getBusinessCart$business_cart$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessCart$business_cart$items<TRes> {
  factory CopyWith$Query$getBusinessCart$business_cart$items(
    Query$getBusinessCart$business_cart$items instance,
    TRes Function(Query$getBusinessCart$business_cart$items) then,
  ) = _CopyWithImpl$Query$getBusinessCart$business_cart$items;

  factory CopyWith$Query$getBusinessCart$business_cart$items.stub(TRes res) =
      _CopyWithStubImpl$Query$getBusinessCart$business_cart$items;

  TRes call({
    int? id,
    dynamic? parameters,
    double? cost,
    int? item_id,
    String? offering_type,
    String? time,
    Query$getBusinessCart$business_cart$items$home? home,
    Query$getBusinessCart$business_cart$items$rental? rental,
    Query$getBusinessCart$business_cart$items$product? product,
    Query$getBusinessCart$business_cart$items$service? service,
    Query$getBusinessCart$business_cart$items$event? event,
    String? $__typename,
  });
  CopyWith$Query$getBusinessCart$business_cart$items$home<TRes> get home;
  CopyWith$Query$getBusinessCart$business_cart$items$rental<TRes> get rental;
  CopyWith$Query$getBusinessCart$business_cart$items$product<TRes> get product;
  CopyWith$Query$getBusinessCart$business_cart$items$service<TRes> get service;
  CopyWith$Query$getBusinessCart$business_cart$items$event<TRes> get event;
}

class _CopyWithImpl$Query$getBusinessCart$business_cart$items<TRes>
    implements CopyWith$Query$getBusinessCart$business_cart$items<TRes> {
  _CopyWithImpl$Query$getBusinessCart$business_cart$items(
    this._instance,
    this._then,
  );

  final Query$getBusinessCart$business_cart$items _instance;

  final TRes Function(Query$getBusinessCart$business_cart$items) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? parameters = _undefined,
    Object? cost = _undefined,
    Object? item_id = _undefined,
    Object? offering_type = _undefined,
    Object? time = _undefined,
    Object? home = _undefined,
    Object? rental = _undefined,
    Object? product = _undefined,
    Object? service = _undefined,
    Object? event = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getBusinessCart$business_cart$items(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        parameters: parameters == _undefined || parameters == null
            ? _instance.parameters
            : (parameters as dynamic),
        cost: cost == _undefined || cost == null
            ? _instance.cost
            : (cost as double),
        item_id: item_id == _undefined || item_id == null
            ? _instance.item_id
            : (item_id as int),
        offering_type: offering_type == _undefined || offering_type == null
            ? _instance.offering_type
            : (offering_type as String),
        time: time == _undefined ? _instance.time : (time as String?),
        home: home == _undefined
            ? _instance.home
            : (home as Query$getBusinessCart$business_cart$items$home?),
        rental: rental == _undefined
            ? _instance.rental
            : (rental as Query$getBusinessCart$business_cart$items$rental?),
        product: product == _undefined
            ? _instance.product
            : (product as Query$getBusinessCart$business_cart$items$product?),
        service: service == _undefined
            ? _instance.service
            : (service as Query$getBusinessCart$business_cart$items$service?),
        event: event == _undefined
            ? _instance.event
            : (event as Query$getBusinessCart$business_cart$items$event?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getBusinessCart$business_cart$items$home<TRes> get home {
    final local$home = _instance.home;
    return local$home == null
        ? CopyWith$Query$getBusinessCart$business_cart$items$home.stub(
            _then(_instance))
        : CopyWith$Query$getBusinessCart$business_cart$items$home(
            local$home, (e) => call(home: e));
  }

  CopyWith$Query$getBusinessCart$business_cart$items$rental<TRes> get rental {
    final local$rental = _instance.rental;
    return local$rental == null
        ? CopyWith$Query$getBusinessCart$business_cart$items$rental.stub(
            _then(_instance))
        : CopyWith$Query$getBusinessCart$business_cart$items$rental(
            local$rental, (e) => call(rental: e));
  }

  CopyWith$Query$getBusinessCart$business_cart$items$product<TRes> get product {
    final local$product = _instance.product;
    return local$product == null
        ? CopyWith$Query$getBusinessCart$business_cart$items$product.stub(
            _then(_instance))
        : CopyWith$Query$getBusinessCart$business_cart$items$product(
            local$product, (e) => call(product: e));
  }

  CopyWith$Query$getBusinessCart$business_cart$items$service<TRes> get service {
    final local$service = _instance.service;
    return local$service == null
        ? CopyWith$Query$getBusinessCart$business_cart$items$service.stub(
            _then(_instance))
        : CopyWith$Query$getBusinessCart$business_cart$items$service(
            local$service, (e) => call(service: e));
  }

  CopyWith$Query$getBusinessCart$business_cart$items$event<TRes> get event {
    final local$event = _instance.event;
    return local$event == null
        ? CopyWith$Query$getBusinessCart$business_cart$items$event.stub(
            _then(_instance))
        : CopyWith$Query$getBusinessCart$business_cart$items$event(
            local$event, (e) => call(event: e));
  }
}

class _CopyWithStubImpl$Query$getBusinessCart$business_cart$items<TRes>
    implements CopyWith$Query$getBusinessCart$business_cart$items<TRes> {
  _CopyWithStubImpl$Query$getBusinessCart$business_cart$items(this._res);

  TRes _res;

  call({
    int? id,
    dynamic? parameters,
    double? cost,
    int? item_id,
    String? offering_type,
    String? time,
    Query$getBusinessCart$business_cart$items$home? home,
    Query$getBusinessCart$business_cart$items$rental? rental,
    Query$getBusinessCart$business_cart$items$product? product,
    Query$getBusinessCart$business_cart$items$service? service,
    Query$getBusinessCart$business_cart$items$event? event,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getBusinessCart$business_cart$items$home<TRes> get home =>
      CopyWith$Query$getBusinessCart$business_cart$items$home.stub(_res);
  CopyWith$Query$getBusinessCart$business_cart$items$rental<TRes> get rental =>
      CopyWith$Query$getBusinessCart$business_cart$items$rental.stub(_res);
  CopyWith$Query$getBusinessCart$business_cart$items$product<TRes>
      get product =>
          CopyWith$Query$getBusinessCart$business_cart$items$product.stub(_res);
  CopyWith$Query$getBusinessCart$business_cart$items$service<TRes>
      get service =>
          CopyWith$Query$getBusinessCart$business_cart$items$service.stub(_res);
  CopyWith$Query$getBusinessCart$business_cart$items$event<TRes> get event =>
      CopyWith$Query$getBusinessCart$business_cart$items$event.stub(_res);
}

class Query$getBusinessCart$business_cart$items$home {
  Query$getBusinessCart$business_cart$items$home({
    required this.available_for,
    this.details,
    required this.id,
    this.business,
    required this.bathrooms,
    required this.bedrooms,
    this.location,
    required this.offering_type,
    required this.$__typename,
  });

  factory Query$getBusinessCart$business_cart$items$home.fromJson(
      Map<String, dynamic> json) {
    final l$available_for = json['available_for'];
    final l$details = json['details'];
    final l$id = json['id'];
    final l$business = json['business'];
    final l$bathrooms = json['bathrooms'];
    final l$bedrooms = json['bedrooms'];
    final l$location = json['location'];
    final l$offering_type = json['offering_type'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessCart$business_cart$items$home(
      available_for: (l$available_for as String),
      details: l$details == null
          ? null
          : Query$getBusinessCart$business_cart$items$home$details.fromJson(
              (l$details as Map<String, dynamic>)),
      id: (l$id as int),
      business: l$business == null
          ? null
          : Query$getBusinessCart$business_cart$items$home$business.fromJson(
              (l$business as Map<String, dynamic>)),
      bathrooms: (l$bathrooms as int),
      bedrooms: (l$bedrooms as int),
      location: l$location == null
          ? null
          : Query$getBusinessCart$business_cart$items$home$location.fromJson(
              (l$location as Map<String, dynamic>)),
      offering_type: (l$offering_type as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String available_for;

  final Query$getBusinessCart$business_cart$items$home$details? details;

  final int id;

  final Query$getBusinessCart$business_cart$items$home$business? business;

  final int bathrooms;

  final int bedrooms;

  final Query$getBusinessCart$business_cart$items$home$location? location;

  final String offering_type;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$available_for = available_for;
    _resultData['available_for'] = l$available_for;
    final l$details = details;
    _resultData['details'] = l$details?.toJson();
    final l$id = id;
    _resultData['id'] = l$id;
    final l$business = business;
    _resultData['business'] = l$business?.toJson();
    final l$bathrooms = bathrooms;
    _resultData['bathrooms'] = l$bathrooms;
    final l$bedrooms = bedrooms;
    _resultData['bedrooms'] = l$bedrooms;
    final l$location = location;
    _resultData['location'] = l$location?.toJson();
    final l$offering_type = offering_type;
    _resultData['offering_type'] = l$offering_type;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$available_for = available_for;
    final l$details = details;
    final l$id = id;
    final l$business = business;
    final l$bathrooms = bathrooms;
    final l$bedrooms = bedrooms;
    final l$location = location;
    final l$offering_type = offering_type;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$available_for,
      l$details,
      l$id,
      l$business,
      l$bathrooms,
      l$bedrooms,
      l$location,
      l$offering_type,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getBusinessCart$business_cart$items$home) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$available_for = available_for;
    final lOther$available_for = other.available_for;
    if (l$available_for != lOther$available_for) {
      return false;
    }
    final l$details = details;
    final lOther$details = other.details;
    if (l$details != lOther$details) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$business = business;
    final lOther$business = other.business;
    if (l$business != lOther$business) {
      return false;
    }
    final l$bathrooms = bathrooms;
    final lOther$bathrooms = other.bathrooms;
    if (l$bathrooms != lOther$bathrooms) {
      return false;
    }
    final l$bedrooms = bedrooms;
    final lOther$bedrooms = other.bedrooms;
    if (l$bedrooms != lOther$bedrooms) {
      return false;
    }
    final l$location = location;
    final lOther$location = other.location;
    if (l$location != lOther$location) {
      return false;
    }
    final l$offering_type = offering_type;
    final lOther$offering_type = other.offering_type;
    if (l$offering_type != lOther$offering_type) {
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

extension UtilityExtension$Query$getBusinessCart$business_cart$items$home
    on Query$getBusinessCart$business_cart$items$home {
  CopyWith$Query$getBusinessCart$business_cart$items$home<
          Query$getBusinessCart$business_cart$items$home>
      get copyWith => CopyWith$Query$getBusinessCart$business_cart$items$home(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessCart$business_cart$items$home<TRes> {
  factory CopyWith$Query$getBusinessCart$business_cart$items$home(
    Query$getBusinessCart$business_cart$items$home instance,
    TRes Function(Query$getBusinessCart$business_cart$items$home) then,
  ) = _CopyWithImpl$Query$getBusinessCart$business_cart$items$home;

  factory CopyWith$Query$getBusinessCart$business_cart$items$home.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$home;

  TRes call({
    String? available_for,
    Query$getBusinessCart$business_cart$items$home$details? details,
    int? id,
    Query$getBusinessCart$business_cart$items$home$business? business,
    int? bathrooms,
    int? bedrooms,
    Query$getBusinessCart$business_cart$items$home$location? location,
    String? offering_type,
    String? $__typename,
  });
  CopyWith$Query$getBusinessCart$business_cart$items$home$details<TRes>
      get details;
  CopyWith$Query$getBusinessCart$business_cart$items$home$business<TRes>
      get business;
  CopyWith$Query$getBusinessCart$business_cart$items$home$location<TRes>
      get location;
}

class _CopyWithImpl$Query$getBusinessCart$business_cart$items$home<TRes>
    implements CopyWith$Query$getBusinessCart$business_cart$items$home<TRes> {
  _CopyWithImpl$Query$getBusinessCart$business_cart$items$home(
    this._instance,
    this._then,
  );

  final Query$getBusinessCart$business_cart$items$home _instance;

  final TRes Function(Query$getBusinessCart$business_cart$items$home) _then;

  static const _undefined = {};

  TRes call({
    Object? available_for = _undefined,
    Object? details = _undefined,
    Object? id = _undefined,
    Object? business = _undefined,
    Object? bathrooms = _undefined,
    Object? bedrooms = _undefined,
    Object? location = _undefined,
    Object? offering_type = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getBusinessCart$business_cart$items$home(
        available_for: available_for == _undefined || available_for == null
            ? _instance.available_for
            : (available_for as String),
        details: details == _undefined
            ? _instance.details
            : (details
                as Query$getBusinessCart$business_cart$items$home$details?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        business: business == _undefined
            ? _instance.business
            : (business
                as Query$getBusinessCart$business_cart$items$home$business?),
        bathrooms: bathrooms == _undefined || bathrooms == null
            ? _instance.bathrooms
            : (bathrooms as int),
        bedrooms: bedrooms == _undefined || bedrooms == null
            ? _instance.bedrooms
            : (bedrooms as int),
        location: location == _undefined
            ? _instance.location
            : (location
                as Query$getBusinessCart$business_cart$items$home$location?),
        offering_type: offering_type == _undefined || offering_type == null
            ? _instance.offering_type
            : (offering_type as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getBusinessCart$business_cart$items$home$details<TRes>
      get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$getBusinessCart$business_cart$items$home$details.stub(
            _then(_instance))
        : CopyWith$Query$getBusinessCart$business_cart$items$home$details(
            local$details, (e) => call(details: e));
  }

  CopyWith$Query$getBusinessCart$business_cart$items$home$business<TRes>
      get business {
    final local$business = _instance.business;
    return local$business == null
        ? CopyWith$Query$getBusinessCart$business_cart$items$home$business.stub(
            _then(_instance))
        : CopyWith$Query$getBusinessCart$business_cart$items$home$business(
            local$business, (e) => call(business: e));
  }

  CopyWith$Query$getBusinessCart$business_cart$items$home$location<TRes>
      get location {
    final local$location = _instance.location;
    return local$location == null
        ? CopyWith$Query$getBusinessCart$business_cart$items$home$location.stub(
            _then(_instance))
        : CopyWith$Query$getBusinessCart$business_cart$items$home$location(
            local$location, (e) => call(location: e));
  }
}

class _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$home<TRes>
    implements CopyWith$Query$getBusinessCart$business_cart$items$home<TRes> {
  _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$home(this._res);

  TRes _res;

  call({
    String? available_for,
    Query$getBusinessCart$business_cart$items$home$details? details,
    int? id,
    Query$getBusinessCart$business_cart$items$home$business? business,
    int? bathrooms,
    int? bedrooms,
    Query$getBusinessCart$business_cart$items$home$location? location,
    String? offering_type,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getBusinessCart$business_cart$items$home$details<TRes>
      get details =>
          CopyWith$Query$getBusinessCart$business_cart$items$home$details.stub(
              _res);
  CopyWith$Query$getBusinessCart$business_cart$items$home$business<TRes>
      get business =>
          CopyWith$Query$getBusinessCart$business_cart$items$home$business.stub(
              _res);
  CopyWith$Query$getBusinessCart$business_cart$items$home$location<TRes>
      get location =>
          CopyWith$Query$getBusinessCart$business_cart$items$home$location.stub(
              _res);
}

class Query$getBusinessCart$business_cart$items$home$details {
  Query$getBusinessCart$business_cart$items$home$details({
    required this.name_id,
    this.description_id,
    required this.id,
    required this.name,
    this.additional_parameters,
    required this.available,
    required this.category1,
    required this.category2,
    required this.cost,
    this.image,
    required this.position,
    required this.tags,
    required this.$__typename,
  });

  factory Query$getBusinessCart$business_cart$items$home$details.fromJson(
      Map<String, dynamic> json) {
    final l$name_id = json['name_id'];
    final l$description_id = json['description_id'];
    final l$id = json['id'];
    final l$name = json['name'];
    final l$additional_parameters = json['additional_parameters'];
    final l$available = json['available'];
    final l$category1 = json['category1'];
    final l$category2 = json['category2'];
    final l$cost = json['cost'];
    final l$image = json['image'];
    final l$position = json['position'];
    final l$tags = json['tags'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessCart$business_cart$items$home$details(
      name_id: (l$name_id as int),
      description_id: (l$description_id as int?),
      id: (l$id as int),
      name:
          Query$getBusinessCart$business_cart$items$home$details$name.fromJson(
              (l$name as Map<String, dynamic>)),
      additional_parameters: l$additional_parameters == null
          ? null
          : mapFromJson(l$additional_parameters),
      available: (l$available as bool),
      category1: (l$category1 as String),
      category2: (l$category2 as String),
      cost: mapFromJson(l$cost),
      image: l$image == null ? null : mapFromJson(l$image),
      position: (l$position as int),
      tags: mapFromJson(l$tags),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int name_id;

  final int? description_id;

  final int id;

  final Query$getBusinessCart$business_cart$items$home$details$name name;

  final dynamic? additional_parameters;

  final bool available;

  final String category1;

  final String category2;

  final dynamic cost;

  final dynamic? image;

  final int position;

  final dynamic tags;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name_id = name_id;
    _resultData['name_id'] = l$name_id;
    final l$description_id = description_id;
    _resultData['description_id'] = l$description_id;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$additional_parameters = additional_parameters;
    _resultData['additional_parameters'] = l$additional_parameters == null
        ? null
        : mapToJson(l$additional_parameters);
    final l$available = available;
    _resultData['available'] = l$available;
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
    final l$name_id = name_id;
    final l$description_id = description_id;
    final l$id = id;
    final l$name = name;
    final l$additional_parameters = additional_parameters;
    final l$available = available;
    final l$category1 = category1;
    final l$category2 = category2;
    final l$cost = cost;
    final l$image = image;
    final l$position = position;
    final l$tags = tags;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name_id,
      l$description_id,
      l$id,
      l$name,
      l$additional_parameters,
      l$available,
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
    if (!(other is Query$getBusinessCart$business_cart$items$home$details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name_id = name_id;
    final lOther$name_id = other.name_id;
    if (l$name_id != lOther$name_id) {
      return false;
    }
    final l$description_id = description_id;
    final lOther$description_id = other.description_id;
    if (l$description_id != lOther$description_id) {
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
    final l$available = available;
    final lOther$available = other.available;
    if (l$available != lOther$available) {
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

extension UtilityExtension$Query$getBusinessCart$business_cart$items$home$details
    on Query$getBusinessCart$business_cart$items$home$details {
  CopyWith$Query$getBusinessCart$business_cart$items$home$details<
          Query$getBusinessCart$business_cart$items$home$details>
      get copyWith =>
          CopyWith$Query$getBusinessCart$business_cart$items$home$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessCart$business_cart$items$home$details<
    TRes> {
  factory CopyWith$Query$getBusinessCart$business_cart$items$home$details(
    Query$getBusinessCart$business_cart$items$home$details instance,
    TRes Function(Query$getBusinessCart$business_cart$items$home$details) then,
  ) = _CopyWithImpl$Query$getBusinessCart$business_cart$items$home$details;

  factory CopyWith$Query$getBusinessCart$business_cart$items$home$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$home$details;

  TRes call({
    int? name_id,
    int? description_id,
    int? id,
    Query$getBusinessCart$business_cart$items$home$details$name? name,
    dynamic? additional_parameters,
    bool? available,
    String? category1,
    String? category2,
    dynamic? cost,
    dynamic? image,
    int? position,
    dynamic? tags,
    String? $__typename,
  });
  CopyWith$Query$getBusinessCart$business_cart$items$home$details$name<TRes>
      get name;
}

class _CopyWithImpl$Query$getBusinessCart$business_cart$items$home$details<TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$home$details<TRes> {
  _CopyWithImpl$Query$getBusinessCart$business_cart$items$home$details(
    this._instance,
    this._then,
  );

  final Query$getBusinessCart$business_cart$items$home$details _instance;

  final TRes Function(Query$getBusinessCart$business_cart$items$home$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name_id = _undefined,
    Object? description_id = _undefined,
    Object? id = _undefined,
    Object? name = _undefined,
    Object? additional_parameters = _undefined,
    Object? available = _undefined,
    Object? category1 = _undefined,
    Object? category2 = _undefined,
    Object? cost = _undefined,
    Object? image = _undefined,
    Object? position = _undefined,
    Object? tags = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getBusinessCart$business_cart$items$home$details(
        name_id: name_id == _undefined || name_id == null
            ? _instance.name_id
            : (name_id as int),
        description_id: description_id == _undefined
            ? _instance.description_id
            : (description_id as int?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Query$getBusinessCart$business_cart$items$home$details$name),
        additional_parameters: additional_parameters == _undefined
            ? _instance.additional_parameters
            : (additional_parameters as dynamic?),
        available: available == _undefined || available == null
            ? _instance.available
            : (available as bool),
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
  CopyWith$Query$getBusinessCart$business_cart$items$home$details$name<TRes>
      get name {
    final local$name = _instance.name;
    return CopyWith$Query$getBusinessCart$business_cart$items$home$details$name(
        local$name, (e) => call(name: e));
  }
}

class _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$home$details<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$home$details<TRes> {
  _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$home$details(
      this._res);

  TRes _res;

  call({
    int? name_id,
    int? description_id,
    int? id,
    Query$getBusinessCart$business_cart$items$home$details$name? name,
    dynamic? additional_parameters,
    bool? available,
    String? category1,
    String? category2,
    dynamic? cost,
    dynamic? image,
    int? position,
    dynamic? tags,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getBusinessCart$business_cart$items$home$details$name<TRes>
      get name =>
          CopyWith$Query$getBusinessCart$business_cart$items$home$details$name
              .stub(_res);
}

class Query$getBusinessCart$business_cart$items$home$details$name {
  Query$getBusinessCart$business_cart$items$home$details$name({
    required this.translations,
    required this.$__typename,
  });

  factory Query$getBusinessCart$business_cart$items$home$details$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessCart$business_cart$items$home$details$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getBusinessCart$business_cart$items$home$details$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$getBusinessCart$business_cart$items$home$details$name$translations>
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
            is Query$getBusinessCart$business_cart$items$home$details$name) ||
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

extension UtilityExtension$Query$getBusinessCart$business_cart$items$home$details$name
    on Query$getBusinessCart$business_cart$items$home$details$name {
  CopyWith$Query$getBusinessCart$business_cart$items$home$details$name<
          Query$getBusinessCart$business_cart$items$home$details$name>
      get copyWith =>
          CopyWith$Query$getBusinessCart$business_cart$items$home$details$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessCart$business_cart$items$home$details$name<
    TRes> {
  factory CopyWith$Query$getBusinessCart$business_cart$items$home$details$name(
    Query$getBusinessCart$business_cart$items$home$details$name instance,
    TRes Function(Query$getBusinessCart$business_cart$items$home$details$name)
        then,
  ) = _CopyWithImpl$Query$getBusinessCart$business_cart$items$home$details$name;

  factory CopyWith$Query$getBusinessCart$business_cart$items$home$details$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$home$details$name;

  TRes call({
    List<Query$getBusinessCart$business_cart$items$home$details$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getBusinessCart$business_cart$items$home$details$name$translations> Function(
              Iterable<
                  CopyWith$Query$getBusinessCart$business_cart$items$home$details$name$translations<
                      Query$getBusinessCart$business_cart$items$home$details$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getBusinessCart$business_cart$items$home$details$name<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$home$details$name<
            TRes> {
  _CopyWithImpl$Query$getBusinessCart$business_cart$items$home$details$name(
    this._instance,
    this._then,
  );

  final Query$getBusinessCart$business_cart$items$home$details$name _instance;

  final TRes Function(
      Query$getBusinessCart$business_cart$items$home$details$name) _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getBusinessCart$business_cart$items$home$details$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getBusinessCart$business_cart$items$home$details$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getBusinessCart$business_cart$items$home$details$name$translations> Function(
                  Iterable<
                      CopyWith$Query$getBusinessCart$business_cart$items$home$details$name$translations<
                          Query$getBusinessCart$business_cart$items$home$details$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getBusinessCart$business_cart$items$home$details$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$home$details$name<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$home$details$name<
            TRes> {
  _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$home$details$name(
      this._res);

  TRes _res;

  call({
    List<Query$getBusinessCart$business_cart$items$home$details$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getBusinessCart$business_cart$items$home$details$name$translations {
  Query$getBusinessCart$business_cart$items$home$details$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getBusinessCart$business_cart$items$home$details$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessCart$business_cart$items$home$details$name$translations(
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
            is Query$getBusinessCart$business_cart$items$home$details$name$translations) ||
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

extension UtilityExtension$Query$getBusinessCart$business_cart$items$home$details$name$translations
    on Query$getBusinessCart$business_cart$items$home$details$name$translations {
  CopyWith$Query$getBusinessCart$business_cart$items$home$details$name$translations<
          Query$getBusinessCart$business_cart$items$home$details$name$translations>
      get copyWith =>
          CopyWith$Query$getBusinessCart$business_cart$items$home$details$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessCart$business_cart$items$home$details$name$translations<
    TRes> {
  factory CopyWith$Query$getBusinessCart$business_cart$items$home$details$name$translations(
    Query$getBusinessCart$business_cart$items$home$details$name$translations
        instance,
    TRes Function(
            Query$getBusinessCart$business_cart$items$home$details$name$translations)
        then,
  ) = _CopyWithImpl$Query$getBusinessCart$business_cart$items$home$details$name$translations;

  factory CopyWith$Query$getBusinessCart$business_cart$items$home$details$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$home$details$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getBusinessCart$business_cart$items$home$details$name$translations<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$home$details$name$translations<
            TRes> {
  _CopyWithImpl$Query$getBusinessCart$business_cart$items$home$details$name$translations(
    this._instance,
    this._then,
  );

  final Query$getBusinessCart$business_cart$items$home$details$name$translations
      _instance;

  final TRes Function(
          Query$getBusinessCart$business_cart$items$home$details$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getBusinessCart$business_cart$items$home$details$name$translations(
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

class _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$home$details$name$translations<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$home$details$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$home$details$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$getBusinessCart$business_cart$items$home$business {
  Query$getBusinessCart$business_cart$items$home$business({
    required this.id,
    required this.details,
    required this.$__typename,
  });

  factory Query$getBusinessCart$business_cart$items$home$business.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessCart$business_cart$items$home$business(
      id: (l$id as int),
      details: Query$getBusinessCart$business_cart$items$home$business$details
          .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$getBusinessCart$business_cart$items$home$business$details details;

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
    if (!(other is Query$getBusinessCart$business_cart$items$home$business) ||
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

extension UtilityExtension$Query$getBusinessCart$business_cart$items$home$business
    on Query$getBusinessCart$business_cart$items$home$business {
  CopyWith$Query$getBusinessCart$business_cart$items$home$business<
          Query$getBusinessCart$business_cart$items$home$business>
      get copyWith =>
          CopyWith$Query$getBusinessCart$business_cart$items$home$business(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessCart$business_cart$items$home$business<
    TRes> {
  factory CopyWith$Query$getBusinessCart$business_cart$items$home$business(
    Query$getBusinessCart$business_cart$items$home$business instance,
    TRes Function(Query$getBusinessCart$business_cart$items$home$business) then,
  ) = _CopyWithImpl$Query$getBusinessCart$business_cart$items$home$business;

  factory CopyWith$Query$getBusinessCart$business_cart$items$home$business.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$home$business;

  TRes call({
    int? id,
    Query$getBusinessCart$business_cart$items$home$business$details? details,
    String? $__typename,
  });
  CopyWith$Query$getBusinessCart$business_cart$items$home$business$details<TRes>
      get details;
}

class _CopyWithImpl$Query$getBusinessCart$business_cart$items$home$business<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$home$business<TRes> {
  _CopyWithImpl$Query$getBusinessCart$business_cart$items$home$business(
    this._instance,
    this._then,
  );

  final Query$getBusinessCart$business_cart$items$home$business _instance;

  final TRes Function(Query$getBusinessCart$business_cart$items$home$business)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getBusinessCart$business_cart$items$home$business(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Query$getBusinessCart$business_cart$items$home$business$details),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getBusinessCart$business_cart$items$home$business$details<TRes>
      get details {
    final local$details = _instance.details;
    return CopyWith$Query$getBusinessCart$business_cart$items$home$business$details(
        local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$home$business<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$home$business<TRes> {
  _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$home$business(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$getBusinessCart$business_cart$items$home$business$details? details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getBusinessCart$business_cart$items$home$business$details<TRes>
      get details =>
          CopyWith$Query$getBusinessCart$business_cart$items$home$business$details
              .stub(_res);
}

class Query$getBusinessCart$business_cart$items$home$business$details {
  Query$getBusinessCart$business_cart$items$home$business$details({
    required this.id,
    required this.name,
    required this.currency,
    required this.online_ordering,
    required this.accepted_payments,
    required this.image,
    required this.location,
    required this.$__typename,
  });

  factory Query$getBusinessCart$business_cart$items$home$business$details.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$currency = json['currency'];
    final l$online_ordering = json['online_ordering'];
    final l$accepted_payments = json['accepted_payments'];
    final l$image = json['image'];
    final l$location = json['location'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessCart$business_cart$items$home$business$details(
      id: (l$id as int),
      name: (l$name as String),
      currency: (l$currency as String),
      online_ordering: (l$online_ordering as bool),
      accepted_payments: mapFromJson(l$accepted_payments),
      image: (l$image as String),
      location:
          Query$getBusinessCart$business_cart$items$home$business$details$location
              .fromJson((l$location as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String name;

  final String currency;

  final bool online_ordering;

  final dynamic accepted_payments;

  final String image;

  final Query$getBusinessCart$business_cart$items$home$business$details$location
      location;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$currency = currency;
    _resultData['currency'] = l$currency;
    final l$online_ordering = online_ordering;
    _resultData['online_ordering'] = l$online_ordering;
    final l$accepted_payments = accepted_payments;
    _resultData['accepted_payments'] = mapToJson(l$accepted_payments);
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
    final l$id = id;
    final l$name = name;
    final l$currency = currency;
    final l$online_ordering = online_ordering;
    final l$accepted_payments = accepted_payments;
    final l$image = image;
    final l$location = location;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$currency,
      l$online_ordering,
      l$accepted_payments,
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
            is Query$getBusinessCart$business_cart$items$home$business$details) ||
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
    final l$currency = currency;
    final lOther$currency = other.currency;
    if (l$currency != lOther$currency) {
      return false;
    }
    final l$online_ordering = online_ordering;
    final lOther$online_ordering = other.online_ordering;
    if (l$online_ordering != lOther$online_ordering) {
      return false;
    }
    final l$accepted_payments = accepted_payments;
    final lOther$accepted_payments = other.accepted_payments;
    if (l$accepted_payments != lOther$accepted_payments) {
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

extension UtilityExtension$Query$getBusinessCart$business_cart$items$home$business$details
    on Query$getBusinessCart$business_cart$items$home$business$details {
  CopyWith$Query$getBusinessCart$business_cart$items$home$business$details<
          Query$getBusinessCart$business_cart$items$home$business$details>
      get copyWith =>
          CopyWith$Query$getBusinessCart$business_cart$items$home$business$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessCart$business_cart$items$home$business$details<
    TRes> {
  factory CopyWith$Query$getBusinessCart$business_cart$items$home$business$details(
    Query$getBusinessCart$business_cart$items$home$business$details instance,
    TRes Function(
            Query$getBusinessCart$business_cart$items$home$business$details)
        then,
  ) = _CopyWithImpl$Query$getBusinessCart$business_cart$items$home$business$details;

  factory CopyWith$Query$getBusinessCart$business_cart$items$home$business$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$home$business$details;

  TRes call({
    int? id,
    String? name,
    String? currency,
    bool? online_ordering,
    dynamic? accepted_payments,
    String? image,
    Query$getBusinessCart$business_cart$items$home$business$details$location?
        location,
    String? $__typename,
  });
  CopyWith$Query$getBusinessCart$business_cart$items$home$business$details$location<
      TRes> get location;
}

class _CopyWithImpl$Query$getBusinessCart$business_cart$items$home$business$details<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$home$business$details<
            TRes> {
  _CopyWithImpl$Query$getBusinessCart$business_cart$items$home$business$details(
    this._instance,
    this._then,
  );

  final Query$getBusinessCart$business_cart$items$home$business$details
      _instance;

  final TRes Function(
      Query$getBusinessCart$business_cart$items$home$business$details) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? currency = _undefined,
    Object? online_ordering = _undefined,
    Object? accepted_payments = _undefined,
    Object? image = _undefined,
    Object? location = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getBusinessCart$business_cart$items$home$business$details(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        currency: currency == _undefined || currency == null
            ? _instance.currency
            : (currency as String),
        online_ordering:
            online_ordering == _undefined || online_ordering == null
                ? _instance.online_ordering
                : (online_ordering as bool),
        accepted_payments:
            accepted_payments == _undefined || accepted_payments == null
                ? _instance.accepted_payments
                : (accepted_payments as dynamic),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        location: location == _undefined || location == null
            ? _instance.location
            : (location
                as Query$getBusinessCart$business_cart$items$home$business$details$location),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getBusinessCart$business_cart$items$home$business$details$location<
      TRes> get location {
    final local$location = _instance.location;
    return CopyWith$Query$getBusinessCart$business_cart$items$home$business$details$location(
        local$location, (e) => call(location: e));
  }
}

class _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$home$business$details<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$home$business$details<
            TRes> {
  _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$home$business$details(
      this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    String? currency,
    bool? online_ordering,
    dynamic? accepted_payments,
    String? image,
    Query$getBusinessCart$business_cart$items$home$business$details$location?
        location,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getBusinessCart$business_cart$items$home$business$details$location<
          TRes>
      get location =>
          CopyWith$Query$getBusinessCart$business_cart$items$home$business$details$location
              .stub(_res);
}

class Query$getBusinessCart$business_cart$items$home$business$details$location {
  Query$getBusinessCart$business_cart$items$home$business$details$location({
    required this.gps,
    required this.address,
    required this.$__typename,
  });

  factory Query$getBusinessCart$business_cart$items$home$business$details$location.fromJson(
      Map<String, dynamic> json) {
    final l$gps = json['gps'];
    final l$address = json['address'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessCart$business_cart$items$home$business$details$location(
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
            is Query$getBusinessCart$business_cart$items$home$business$details$location) ||
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

extension UtilityExtension$Query$getBusinessCart$business_cart$items$home$business$details$location
    on Query$getBusinessCart$business_cart$items$home$business$details$location {
  CopyWith$Query$getBusinessCart$business_cart$items$home$business$details$location<
          Query$getBusinessCart$business_cart$items$home$business$details$location>
      get copyWith =>
          CopyWith$Query$getBusinessCart$business_cart$items$home$business$details$location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessCart$business_cart$items$home$business$details$location<
    TRes> {
  factory CopyWith$Query$getBusinessCart$business_cart$items$home$business$details$location(
    Query$getBusinessCart$business_cart$items$home$business$details$location
        instance,
    TRes Function(
            Query$getBusinessCart$business_cart$items$home$business$details$location)
        then,
  ) = _CopyWithImpl$Query$getBusinessCart$business_cart$items$home$business$details$location;

  factory CopyWith$Query$getBusinessCart$business_cart$items$home$business$details$location.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$home$business$details$location;

  TRes call({
    Geography? gps,
    String? address,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getBusinessCart$business_cart$items$home$business$details$location<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$home$business$details$location<
            TRes> {
  _CopyWithImpl$Query$getBusinessCart$business_cart$items$home$business$details$location(
    this._instance,
    this._then,
  );

  final Query$getBusinessCart$business_cart$items$home$business$details$location
      _instance;

  final TRes Function(
          Query$getBusinessCart$business_cart$items$home$business$details$location)
      _then;

  static const _undefined = {};

  TRes call({
    Object? gps = _undefined,
    Object? address = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getBusinessCart$business_cart$items$home$business$details$location(
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

class _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$home$business$details$location<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$home$business$details$location<
            TRes> {
  _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$home$business$details$location(
      this._res);

  TRes _res;

  call({
    Geography? gps,
    String? address,
    String? $__typename,
  }) =>
      _res;
}

class Query$getBusinessCart$business_cart$items$home$location {
  Query$getBusinessCart$business_cart$items$home$location({
    required this.address,
    required this.gps,
    required this.name,
    required this.$__typename,
  });

  factory Query$getBusinessCart$business_cart$items$home$location.fromJson(
      Map<String, dynamic> json) {
    final l$address = json['address'];
    final l$gps = json['gps'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessCart$business_cart$items$home$location(
      address: (l$address as String),
      gps: geographyFromJson(l$gps),
      name: (l$name as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String address;

  final Geography gps;

  final String name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$address = address;
    _resultData['address'] = l$address;
    final l$gps = gps;
    _resultData['gps'] = geographyToJson(l$gps);
    final l$name = name;
    _resultData['name'] = l$name;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$address = address;
    final l$gps = gps;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$address,
      l$gps,
      l$name,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getBusinessCart$business_cart$items$home$location) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$address = address;
    final lOther$address = other.address;
    if (l$address != lOther$address) {
      return false;
    }
    final l$gps = gps;
    final lOther$gps = other.gps;
    if (l$gps != lOther$gps) {
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

extension UtilityExtension$Query$getBusinessCart$business_cart$items$home$location
    on Query$getBusinessCart$business_cart$items$home$location {
  CopyWith$Query$getBusinessCart$business_cart$items$home$location<
          Query$getBusinessCart$business_cart$items$home$location>
      get copyWith =>
          CopyWith$Query$getBusinessCart$business_cart$items$home$location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessCart$business_cart$items$home$location<
    TRes> {
  factory CopyWith$Query$getBusinessCart$business_cart$items$home$location(
    Query$getBusinessCart$business_cart$items$home$location instance,
    TRes Function(Query$getBusinessCart$business_cart$items$home$location) then,
  ) = _CopyWithImpl$Query$getBusinessCart$business_cart$items$home$location;

  factory CopyWith$Query$getBusinessCart$business_cart$items$home$location.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$home$location;

  TRes call({
    String? address,
    Geography? gps,
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getBusinessCart$business_cart$items$home$location<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$home$location<TRes> {
  _CopyWithImpl$Query$getBusinessCart$business_cart$items$home$location(
    this._instance,
    this._then,
  );

  final Query$getBusinessCart$business_cart$items$home$location _instance;

  final TRes Function(Query$getBusinessCart$business_cart$items$home$location)
      _then;

  static const _undefined = {};

  TRes call({
    Object? address = _undefined,
    Object? gps = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getBusinessCart$business_cart$items$home$location(
        address: address == _undefined || address == null
            ? _instance.address
            : (address as String),
        gps: gps == _undefined || gps == null
            ? _instance.gps
            : (gps as Geography),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$home$location<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$home$location<TRes> {
  _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$home$location(
      this._res);

  TRes _res;

  call({
    String? address,
    Geography? gps,
    String? name,
    String? $__typename,
  }) =>
      _res;
}

class Query$getBusinessCart$business_cart$items$rental {
  Query$getBusinessCart$business_cart$items$rental({
    required this.id,
    required this.details,
    required this.business,
    required this.$__typename,
  });

  factory Query$getBusinessCart$business_cart$items$rental.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$details = json['details'];
    final l$business = json['business'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessCart$business_cart$items$rental(
      id: (l$id as int),
      details:
          Query$getBusinessCart$business_cart$items$rental$details.fromJson(
              (l$details as Map<String, dynamic>)),
      business:
          Query$getBusinessCart$business_cart$items$rental$business.fromJson(
              (l$business as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$getBusinessCart$business_cart$items$rental$details details;

  final Query$getBusinessCart$business_cart$items$rental$business business;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$details = details;
    _resultData['details'] = l$details.toJson();
    final l$business = business;
    _resultData['business'] = l$business.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$details = details;
    final l$business = business;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$details,
      l$business,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getBusinessCart$business_cart$items$rental) ||
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
    final l$business = business;
    final lOther$business = other.business;
    if (l$business != lOther$business) {
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

extension UtilityExtension$Query$getBusinessCart$business_cart$items$rental
    on Query$getBusinessCart$business_cart$items$rental {
  CopyWith$Query$getBusinessCart$business_cart$items$rental<
          Query$getBusinessCart$business_cart$items$rental>
      get copyWith => CopyWith$Query$getBusinessCart$business_cart$items$rental(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessCart$business_cart$items$rental<TRes> {
  factory CopyWith$Query$getBusinessCart$business_cart$items$rental(
    Query$getBusinessCart$business_cart$items$rental instance,
    TRes Function(Query$getBusinessCart$business_cart$items$rental) then,
  ) = _CopyWithImpl$Query$getBusinessCart$business_cart$items$rental;

  factory CopyWith$Query$getBusinessCart$business_cart$items$rental.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$rental;

  TRes call({
    int? id,
    Query$getBusinessCart$business_cart$items$rental$details? details,
    Query$getBusinessCart$business_cart$items$rental$business? business,
    String? $__typename,
  });
  CopyWith$Query$getBusinessCart$business_cart$items$rental$details<TRes>
      get details;
  CopyWith$Query$getBusinessCart$business_cart$items$rental$business<TRes>
      get business;
}

class _CopyWithImpl$Query$getBusinessCart$business_cart$items$rental<TRes>
    implements CopyWith$Query$getBusinessCart$business_cart$items$rental<TRes> {
  _CopyWithImpl$Query$getBusinessCart$business_cart$items$rental(
    this._instance,
    this._then,
  );

  final Query$getBusinessCart$business_cart$items$rental _instance;

  final TRes Function(Query$getBusinessCart$business_cart$items$rental) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? details = _undefined,
    Object? business = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getBusinessCart$business_cart$items$rental(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Query$getBusinessCart$business_cart$items$rental$details),
        business: business == _undefined || business == null
            ? _instance.business
            : (business
                as Query$getBusinessCart$business_cart$items$rental$business),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getBusinessCart$business_cart$items$rental$details<TRes>
      get details {
    final local$details = _instance.details;
    return CopyWith$Query$getBusinessCart$business_cart$items$rental$details(
        local$details, (e) => call(details: e));
  }

  CopyWith$Query$getBusinessCart$business_cart$items$rental$business<TRes>
      get business {
    final local$business = _instance.business;
    return CopyWith$Query$getBusinessCart$business_cart$items$rental$business(
        local$business, (e) => call(business: e));
  }
}

class _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$rental<TRes>
    implements CopyWith$Query$getBusinessCart$business_cart$items$rental<TRes> {
  _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$rental(this._res);

  TRes _res;

  call({
    int? id,
    Query$getBusinessCart$business_cart$items$rental$details? details,
    Query$getBusinessCart$business_cart$items$rental$business? business,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getBusinessCart$business_cart$items$rental$details<TRes>
      get details =>
          CopyWith$Query$getBusinessCart$business_cart$items$rental$details
              .stub(_res);
  CopyWith$Query$getBusinessCart$business_cart$items$rental$business<TRes>
      get business =>
          CopyWith$Query$getBusinessCart$business_cart$items$rental$business
              .stub(_res);
}

class Query$getBusinessCart$business_cart$items$rental$details {
  Query$getBusinessCart$business_cart$items$rental$details({
    required this.name_id,
    this.description_id,
    required this.id,
    required this.name,
    this.additional_parameters,
    required this.available,
    required this.category1,
    required this.category2,
    required this.cost,
    this.image,
    required this.position,
    required this.tags,
    required this.$__typename,
  });

  factory Query$getBusinessCart$business_cart$items$rental$details.fromJson(
      Map<String, dynamic> json) {
    final l$name_id = json['name_id'];
    final l$description_id = json['description_id'];
    final l$id = json['id'];
    final l$name = json['name'];
    final l$additional_parameters = json['additional_parameters'];
    final l$available = json['available'];
    final l$category1 = json['category1'];
    final l$category2 = json['category2'];
    final l$cost = json['cost'];
    final l$image = json['image'];
    final l$position = json['position'];
    final l$tags = json['tags'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessCart$business_cart$items$rental$details(
      name_id: (l$name_id as int),
      description_id: (l$description_id as int?),
      id: (l$id as int),
      name: Query$getBusinessCart$business_cart$items$rental$details$name
          .fromJson((l$name as Map<String, dynamic>)),
      additional_parameters: l$additional_parameters == null
          ? null
          : mapFromJson(l$additional_parameters),
      available: (l$available as bool),
      category1: (l$category1 as String),
      category2: (l$category2 as String),
      cost: mapFromJson(l$cost),
      image: l$image == null ? null : mapFromJson(l$image),
      position: (l$position as int),
      tags: mapFromJson(l$tags),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int name_id;

  final int? description_id;

  final int id;

  final Query$getBusinessCart$business_cart$items$rental$details$name name;

  final dynamic? additional_parameters;

  final bool available;

  final String category1;

  final String category2;

  final dynamic cost;

  final dynamic? image;

  final int position;

  final dynamic tags;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name_id = name_id;
    _resultData['name_id'] = l$name_id;
    final l$description_id = description_id;
    _resultData['description_id'] = l$description_id;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$additional_parameters = additional_parameters;
    _resultData['additional_parameters'] = l$additional_parameters == null
        ? null
        : mapToJson(l$additional_parameters);
    final l$available = available;
    _resultData['available'] = l$available;
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
    final l$name_id = name_id;
    final l$description_id = description_id;
    final l$id = id;
    final l$name = name;
    final l$additional_parameters = additional_parameters;
    final l$available = available;
    final l$category1 = category1;
    final l$category2 = category2;
    final l$cost = cost;
    final l$image = image;
    final l$position = position;
    final l$tags = tags;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name_id,
      l$description_id,
      l$id,
      l$name,
      l$additional_parameters,
      l$available,
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
    if (!(other is Query$getBusinessCart$business_cart$items$rental$details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name_id = name_id;
    final lOther$name_id = other.name_id;
    if (l$name_id != lOther$name_id) {
      return false;
    }
    final l$description_id = description_id;
    final lOther$description_id = other.description_id;
    if (l$description_id != lOther$description_id) {
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
    final l$available = available;
    final lOther$available = other.available;
    if (l$available != lOther$available) {
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

extension UtilityExtension$Query$getBusinessCart$business_cart$items$rental$details
    on Query$getBusinessCart$business_cart$items$rental$details {
  CopyWith$Query$getBusinessCart$business_cart$items$rental$details<
          Query$getBusinessCart$business_cart$items$rental$details>
      get copyWith =>
          CopyWith$Query$getBusinessCart$business_cart$items$rental$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessCart$business_cart$items$rental$details<
    TRes> {
  factory CopyWith$Query$getBusinessCart$business_cart$items$rental$details(
    Query$getBusinessCart$business_cart$items$rental$details instance,
    TRes Function(Query$getBusinessCart$business_cart$items$rental$details)
        then,
  ) = _CopyWithImpl$Query$getBusinessCart$business_cart$items$rental$details;

  factory CopyWith$Query$getBusinessCart$business_cart$items$rental$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$rental$details;

  TRes call({
    int? name_id,
    int? description_id,
    int? id,
    Query$getBusinessCart$business_cart$items$rental$details$name? name,
    dynamic? additional_parameters,
    bool? available,
    String? category1,
    String? category2,
    dynamic? cost,
    dynamic? image,
    int? position,
    dynamic? tags,
    String? $__typename,
  });
  CopyWith$Query$getBusinessCart$business_cart$items$rental$details$name<TRes>
      get name;
}

class _CopyWithImpl$Query$getBusinessCart$business_cart$items$rental$details<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$rental$details<
            TRes> {
  _CopyWithImpl$Query$getBusinessCart$business_cart$items$rental$details(
    this._instance,
    this._then,
  );

  final Query$getBusinessCart$business_cart$items$rental$details _instance;

  final TRes Function(Query$getBusinessCart$business_cart$items$rental$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name_id = _undefined,
    Object? description_id = _undefined,
    Object? id = _undefined,
    Object? name = _undefined,
    Object? additional_parameters = _undefined,
    Object? available = _undefined,
    Object? category1 = _undefined,
    Object? category2 = _undefined,
    Object? cost = _undefined,
    Object? image = _undefined,
    Object? position = _undefined,
    Object? tags = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getBusinessCart$business_cart$items$rental$details(
        name_id: name_id == _undefined || name_id == null
            ? _instance.name_id
            : (name_id as int),
        description_id: description_id == _undefined
            ? _instance.description_id
            : (description_id as int?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Query$getBusinessCart$business_cart$items$rental$details$name),
        additional_parameters: additional_parameters == _undefined
            ? _instance.additional_parameters
            : (additional_parameters as dynamic?),
        available: available == _undefined || available == null
            ? _instance.available
            : (available as bool),
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
  CopyWith$Query$getBusinessCart$business_cart$items$rental$details$name<TRes>
      get name {
    final local$name = _instance.name;
    return CopyWith$Query$getBusinessCart$business_cart$items$rental$details$name(
        local$name, (e) => call(name: e));
  }
}

class _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$rental$details<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$rental$details<
            TRes> {
  _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$rental$details(
      this._res);

  TRes _res;

  call({
    int? name_id,
    int? description_id,
    int? id,
    Query$getBusinessCart$business_cart$items$rental$details$name? name,
    dynamic? additional_parameters,
    bool? available,
    String? category1,
    String? category2,
    dynamic? cost,
    dynamic? image,
    int? position,
    dynamic? tags,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getBusinessCart$business_cart$items$rental$details$name<TRes>
      get name =>
          CopyWith$Query$getBusinessCart$business_cart$items$rental$details$name
              .stub(_res);
}

class Query$getBusinessCart$business_cart$items$rental$details$name {
  Query$getBusinessCart$business_cart$items$rental$details$name({
    required this.translations,
    required this.$__typename,
  });

  factory Query$getBusinessCart$business_cart$items$rental$details$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessCart$business_cart$items$rental$details$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getBusinessCart$business_cart$items$rental$details$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$getBusinessCart$business_cart$items$rental$details$name$translations>
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
            is Query$getBusinessCart$business_cart$items$rental$details$name) ||
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

extension UtilityExtension$Query$getBusinessCart$business_cart$items$rental$details$name
    on Query$getBusinessCart$business_cart$items$rental$details$name {
  CopyWith$Query$getBusinessCart$business_cart$items$rental$details$name<
          Query$getBusinessCart$business_cart$items$rental$details$name>
      get copyWith =>
          CopyWith$Query$getBusinessCart$business_cart$items$rental$details$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessCart$business_cart$items$rental$details$name<
    TRes> {
  factory CopyWith$Query$getBusinessCart$business_cart$items$rental$details$name(
    Query$getBusinessCart$business_cart$items$rental$details$name instance,
    TRes Function(Query$getBusinessCart$business_cart$items$rental$details$name)
        then,
  ) = _CopyWithImpl$Query$getBusinessCart$business_cart$items$rental$details$name;

  factory CopyWith$Query$getBusinessCart$business_cart$items$rental$details$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$rental$details$name;

  TRes call({
    List<Query$getBusinessCart$business_cart$items$rental$details$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getBusinessCart$business_cart$items$rental$details$name$translations> Function(
              Iterable<
                  CopyWith$Query$getBusinessCart$business_cart$items$rental$details$name$translations<
                      Query$getBusinessCart$business_cart$items$rental$details$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getBusinessCart$business_cart$items$rental$details$name<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$rental$details$name<
            TRes> {
  _CopyWithImpl$Query$getBusinessCart$business_cart$items$rental$details$name(
    this._instance,
    this._then,
  );

  final Query$getBusinessCart$business_cart$items$rental$details$name _instance;

  final TRes Function(
      Query$getBusinessCart$business_cart$items$rental$details$name) _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getBusinessCart$business_cart$items$rental$details$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getBusinessCart$business_cart$items$rental$details$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getBusinessCart$business_cart$items$rental$details$name$translations> Function(
                  Iterable<
                      CopyWith$Query$getBusinessCart$business_cart$items$rental$details$name$translations<
                          Query$getBusinessCart$business_cart$items$rental$details$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getBusinessCart$business_cart$items$rental$details$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$rental$details$name<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$rental$details$name<
            TRes> {
  _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$rental$details$name(
      this._res);

  TRes _res;

  call({
    List<Query$getBusinessCart$business_cart$items$rental$details$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getBusinessCart$business_cart$items$rental$details$name$translations {
  Query$getBusinessCart$business_cart$items$rental$details$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getBusinessCart$business_cart$items$rental$details$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessCart$business_cart$items$rental$details$name$translations(
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
            is Query$getBusinessCart$business_cart$items$rental$details$name$translations) ||
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

extension UtilityExtension$Query$getBusinessCart$business_cart$items$rental$details$name$translations
    on Query$getBusinessCart$business_cart$items$rental$details$name$translations {
  CopyWith$Query$getBusinessCart$business_cart$items$rental$details$name$translations<
          Query$getBusinessCart$business_cart$items$rental$details$name$translations>
      get copyWith =>
          CopyWith$Query$getBusinessCart$business_cart$items$rental$details$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessCart$business_cart$items$rental$details$name$translations<
    TRes> {
  factory CopyWith$Query$getBusinessCart$business_cart$items$rental$details$name$translations(
    Query$getBusinessCart$business_cart$items$rental$details$name$translations
        instance,
    TRes Function(
            Query$getBusinessCart$business_cart$items$rental$details$name$translations)
        then,
  ) = _CopyWithImpl$Query$getBusinessCart$business_cart$items$rental$details$name$translations;

  factory CopyWith$Query$getBusinessCart$business_cart$items$rental$details$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$rental$details$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getBusinessCart$business_cart$items$rental$details$name$translations<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$rental$details$name$translations<
            TRes> {
  _CopyWithImpl$Query$getBusinessCart$business_cart$items$rental$details$name$translations(
    this._instance,
    this._then,
  );

  final Query$getBusinessCart$business_cart$items$rental$details$name$translations
      _instance;

  final TRes Function(
          Query$getBusinessCart$business_cart$items$rental$details$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getBusinessCart$business_cart$items$rental$details$name$translations(
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

class _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$rental$details$name$translations<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$rental$details$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$rental$details$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$getBusinessCart$business_cart$items$rental$business {
  Query$getBusinessCart$business_cart$items$rental$business({
    required this.details,
    required this.$__typename,
  });

  factory Query$getBusinessCart$business_cart$items$rental$business.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessCart$business_cart$items$rental$business(
      details: Query$getBusinessCart$business_cart$items$rental$business$details
          .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getBusinessCart$business_cart$items$rental$business$details
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
    if (!(other is Query$getBusinessCart$business_cart$items$rental$business) ||
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

extension UtilityExtension$Query$getBusinessCart$business_cart$items$rental$business
    on Query$getBusinessCart$business_cart$items$rental$business {
  CopyWith$Query$getBusinessCart$business_cart$items$rental$business<
          Query$getBusinessCart$business_cart$items$rental$business>
      get copyWith =>
          CopyWith$Query$getBusinessCart$business_cart$items$rental$business(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessCart$business_cart$items$rental$business<
    TRes> {
  factory CopyWith$Query$getBusinessCart$business_cart$items$rental$business(
    Query$getBusinessCart$business_cart$items$rental$business instance,
    TRes Function(Query$getBusinessCart$business_cart$items$rental$business)
        then,
  ) = _CopyWithImpl$Query$getBusinessCart$business_cart$items$rental$business;

  factory CopyWith$Query$getBusinessCart$business_cart$items$rental$business.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$rental$business;

  TRes call({
    Query$getBusinessCart$business_cart$items$rental$business$details? details,
    String? $__typename,
  });
  CopyWith$Query$getBusinessCart$business_cart$items$rental$business$details<
      TRes> get details;
}

class _CopyWithImpl$Query$getBusinessCart$business_cart$items$rental$business<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$rental$business<
            TRes> {
  _CopyWithImpl$Query$getBusinessCart$business_cart$items$rental$business(
    this._instance,
    this._then,
  );

  final Query$getBusinessCart$business_cart$items$rental$business _instance;

  final TRes Function(Query$getBusinessCart$business_cart$items$rental$business)
      _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getBusinessCart$business_cart$items$rental$business(
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Query$getBusinessCart$business_cart$items$rental$business$details),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getBusinessCart$business_cart$items$rental$business$details<
      TRes> get details {
    final local$details = _instance.details;
    return CopyWith$Query$getBusinessCart$business_cart$items$rental$business$details(
        local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$rental$business<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$rental$business<
            TRes> {
  _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$rental$business(
      this._res);

  TRes _res;

  call({
    Query$getBusinessCart$business_cart$items$rental$business$details? details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getBusinessCart$business_cart$items$rental$business$details<
          TRes>
      get details =>
          CopyWith$Query$getBusinessCart$business_cart$items$rental$business$details
              .stub(_res);
}

class Query$getBusinessCart$business_cart$items$rental$business$details {
  Query$getBusinessCart$business_cart$items$rental$business$details({
    required this.name,
    required this.currency,
    required this.online_ordering,
    required this.id,
    required this.accepted_payments,
    required this.image,
    required this.$__typename,
  });

  factory Query$getBusinessCart$business_cart$items$rental$business$details.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$currency = json['currency'];
    final l$online_ordering = json['online_ordering'];
    final l$id = json['id'];
    final l$accepted_payments = json['accepted_payments'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessCart$business_cart$items$rental$business$details(
      name: (l$name as String),
      currency: (l$currency as String),
      online_ordering: (l$online_ordering as bool),
      id: (l$id as int),
      accepted_payments: mapFromJson(l$accepted_payments),
      image: (l$image as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String name;

  final String currency;

  final bool online_ordering;

  final int id;

  final dynamic accepted_payments;

  final String image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$currency = currency;
    _resultData['currency'] = l$currency;
    final l$online_ordering = online_ordering;
    _resultData['online_ordering'] = l$online_ordering;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$accepted_payments = accepted_payments;
    _resultData['accepted_payments'] = mapToJson(l$accepted_payments);
    final l$image = image;
    _resultData['image'] = l$image;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$currency = currency;
    final l$online_ordering = online_ordering;
    final l$id = id;
    final l$accepted_payments = accepted_payments;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$currency,
      l$online_ordering,
      l$id,
      l$accepted_payments,
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
            is Query$getBusinessCart$business_cart$items$rental$business$details) ||
        runtimeType != other.runtimeType) {
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
    final l$online_ordering = online_ordering;
    final lOther$online_ordering = other.online_ordering;
    if (l$online_ordering != lOther$online_ordering) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$accepted_payments = accepted_payments;
    final lOther$accepted_payments = other.accepted_payments;
    if (l$accepted_payments != lOther$accepted_payments) {
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

extension UtilityExtension$Query$getBusinessCart$business_cart$items$rental$business$details
    on Query$getBusinessCart$business_cart$items$rental$business$details {
  CopyWith$Query$getBusinessCart$business_cart$items$rental$business$details<
          Query$getBusinessCart$business_cart$items$rental$business$details>
      get copyWith =>
          CopyWith$Query$getBusinessCart$business_cart$items$rental$business$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessCart$business_cart$items$rental$business$details<
    TRes> {
  factory CopyWith$Query$getBusinessCart$business_cart$items$rental$business$details(
    Query$getBusinessCart$business_cart$items$rental$business$details instance,
    TRes Function(
            Query$getBusinessCart$business_cart$items$rental$business$details)
        then,
  ) = _CopyWithImpl$Query$getBusinessCart$business_cart$items$rental$business$details;

  factory CopyWith$Query$getBusinessCart$business_cart$items$rental$business$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$rental$business$details;

  TRes call({
    String? name,
    String? currency,
    bool? online_ordering,
    int? id,
    dynamic? accepted_payments,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getBusinessCart$business_cart$items$rental$business$details<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$rental$business$details<
            TRes> {
  _CopyWithImpl$Query$getBusinessCart$business_cart$items$rental$business$details(
    this._instance,
    this._then,
  );

  final Query$getBusinessCart$business_cart$items$rental$business$details
      _instance;

  final TRes Function(
      Query$getBusinessCart$business_cart$items$rental$business$details) _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? currency = _undefined,
    Object? online_ordering = _undefined,
    Object? id = _undefined,
    Object? accepted_payments = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getBusinessCart$business_cart$items$rental$business$details(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        currency: currency == _undefined || currency == null
            ? _instance.currency
            : (currency as String),
        online_ordering:
            online_ordering == _undefined || online_ordering == null
                ? _instance.online_ordering
                : (online_ordering as bool),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        accepted_payments:
            accepted_payments == _undefined || accepted_payments == null
                ? _instance.accepted_payments
                : (accepted_payments as dynamic),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$rental$business$details<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$rental$business$details<
            TRes> {
  _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$rental$business$details(
      this._res);

  TRes _res;

  call({
    String? name,
    String? currency,
    bool? online_ordering,
    int? id,
    dynamic? accepted_payments,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Query$getBusinessCart$business_cart$items$product {
  Query$getBusinessCart$business_cart$items$product({
    required this.id,
    required this.business,
    required this.details,
    required this.$__typename,
  });

  factory Query$getBusinessCart$business_cart$items$product.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$business = json['business'];
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessCart$business_cart$items$product(
      id: (l$id as int),
      business:
          Query$getBusinessCart$business_cart$items$product$business.fromJson(
              (l$business as Map<String, dynamic>)),
      details:
          Query$getBusinessCart$business_cart$items$product$details.fromJson(
              (l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$getBusinessCart$business_cart$items$product$business business;

  final Query$getBusinessCart$business_cart$items$product$details details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$business = business;
    _resultData['business'] = l$business.toJson();
    final l$details = details;
    _resultData['details'] = l$details.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$business = business;
    final l$details = details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$business,
      l$details,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getBusinessCart$business_cart$items$product) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$business = business;
    final lOther$business = other.business;
    if (l$business != lOther$business) {
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

extension UtilityExtension$Query$getBusinessCart$business_cart$items$product
    on Query$getBusinessCart$business_cart$items$product {
  CopyWith$Query$getBusinessCart$business_cart$items$product<
          Query$getBusinessCart$business_cart$items$product>
      get copyWith =>
          CopyWith$Query$getBusinessCart$business_cart$items$product(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessCart$business_cart$items$product<
    TRes> {
  factory CopyWith$Query$getBusinessCart$business_cart$items$product(
    Query$getBusinessCart$business_cart$items$product instance,
    TRes Function(Query$getBusinessCart$business_cart$items$product) then,
  ) = _CopyWithImpl$Query$getBusinessCart$business_cart$items$product;

  factory CopyWith$Query$getBusinessCart$business_cart$items$product.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$product;

  TRes call({
    int? id,
    Query$getBusinessCart$business_cart$items$product$business? business,
    Query$getBusinessCart$business_cart$items$product$details? details,
    String? $__typename,
  });
  CopyWith$Query$getBusinessCart$business_cart$items$product$business<TRes>
      get business;
  CopyWith$Query$getBusinessCart$business_cart$items$product$details<TRes>
      get details;
}

class _CopyWithImpl$Query$getBusinessCart$business_cart$items$product<TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$product<TRes> {
  _CopyWithImpl$Query$getBusinessCart$business_cart$items$product(
    this._instance,
    this._then,
  );

  final Query$getBusinessCart$business_cart$items$product _instance;

  final TRes Function(Query$getBusinessCart$business_cart$items$product) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? business = _undefined,
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getBusinessCart$business_cart$items$product(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        business: business == _undefined || business == null
            ? _instance.business
            : (business
                as Query$getBusinessCart$business_cart$items$product$business),
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Query$getBusinessCart$business_cart$items$product$details),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getBusinessCart$business_cart$items$product$business<TRes>
      get business {
    final local$business = _instance.business;
    return CopyWith$Query$getBusinessCart$business_cart$items$product$business(
        local$business, (e) => call(business: e));
  }

  CopyWith$Query$getBusinessCart$business_cart$items$product$details<TRes>
      get details {
    final local$details = _instance.details;
    return CopyWith$Query$getBusinessCart$business_cart$items$product$details(
        local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$product<TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$product<TRes> {
  _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$product(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$getBusinessCart$business_cart$items$product$business? business,
    Query$getBusinessCart$business_cart$items$product$details? details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getBusinessCart$business_cart$items$product$business<TRes>
      get business =>
          CopyWith$Query$getBusinessCart$business_cart$items$product$business
              .stub(_res);
  CopyWith$Query$getBusinessCart$business_cart$items$product$details<TRes>
      get details =>
          CopyWith$Query$getBusinessCart$business_cart$items$product$details
              .stub(_res);
}

class Query$getBusinessCart$business_cart$items$product$business {
  Query$getBusinessCart$business_cart$items$product$business({
    required this.details,
    required this.$__typename,
  });

  factory Query$getBusinessCart$business_cart$items$product$business.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessCart$business_cart$items$product$business(
      details:
          Query$getBusinessCart$business_cart$items$product$business$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getBusinessCart$business_cart$items$product$business$details
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
            is Query$getBusinessCart$business_cart$items$product$business) ||
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

extension UtilityExtension$Query$getBusinessCart$business_cart$items$product$business
    on Query$getBusinessCart$business_cart$items$product$business {
  CopyWith$Query$getBusinessCart$business_cart$items$product$business<
          Query$getBusinessCart$business_cart$items$product$business>
      get copyWith =>
          CopyWith$Query$getBusinessCart$business_cart$items$product$business(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessCart$business_cart$items$product$business<
    TRes> {
  factory CopyWith$Query$getBusinessCart$business_cart$items$product$business(
    Query$getBusinessCart$business_cart$items$product$business instance,
    TRes Function(Query$getBusinessCart$business_cart$items$product$business)
        then,
  ) = _CopyWithImpl$Query$getBusinessCart$business_cart$items$product$business;

  factory CopyWith$Query$getBusinessCart$business_cart$items$product$business.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$product$business;

  TRes call({
    Query$getBusinessCart$business_cart$items$product$business$details? details,
    String? $__typename,
  });
  CopyWith$Query$getBusinessCart$business_cart$items$product$business$details<
      TRes> get details;
}

class _CopyWithImpl$Query$getBusinessCart$business_cart$items$product$business<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$product$business<
            TRes> {
  _CopyWithImpl$Query$getBusinessCart$business_cart$items$product$business(
    this._instance,
    this._then,
  );

  final Query$getBusinessCart$business_cart$items$product$business _instance;

  final TRes Function(
      Query$getBusinessCart$business_cart$items$product$business) _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getBusinessCart$business_cart$items$product$business(
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Query$getBusinessCart$business_cart$items$product$business$details),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getBusinessCart$business_cart$items$product$business$details<
      TRes> get details {
    final local$details = _instance.details;
    return CopyWith$Query$getBusinessCart$business_cart$items$product$business$details(
        local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$product$business<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$product$business<
            TRes> {
  _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$product$business(
      this._res);

  TRes _res;

  call({
    Query$getBusinessCart$business_cart$items$product$business$details? details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getBusinessCart$business_cart$items$product$business$details<
          TRes>
      get details =>
          CopyWith$Query$getBusinessCart$business_cart$items$product$business$details
              .stub(_res);
}

class Query$getBusinessCart$business_cart$items$product$business$details {
  Query$getBusinessCart$business_cart$items$product$business$details({
    required this.name,
    required this.currency,
    required this.online_ordering,
    required this.id,
    required this.accepted_payments,
    required this.image,
    required this.$__typename,
  });

  factory Query$getBusinessCart$business_cart$items$product$business$details.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$currency = json['currency'];
    final l$online_ordering = json['online_ordering'];
    final l$id = json['id'];
    final l$accepted_payments = json['accepted_payments'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessCart$business_cart$items$product$business$details(
      name: (l$name as String),
      currency: (l$currency as String),
      online_ordering: (l$online_ordering as bool),
      id: (l$id as int),
      accepted_payments: mapFromJson(l$accepted_payments),
      image: (l$image as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String name;

  final String currency;

  final bool online_ordering;

  final int id;

  final dynamic accepted_payments;

  final String image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$currency = currency;
    _resultData['currency'] = l$currency;
    final l$online_ordering = online_ordering;
    _resultData['online_ordering'] = l$online_ordering;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$accepted_payments = accepted_payments;
    _resultData['accepted_payments'] = mapToJson(l$accepted_payments);
    final l$image = image;
    _resultData['image'] = l$image;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$currency = currency;
    final l$online_ordering = online_ordering;
    final l$id = id;
    final l$accepted_payments = accepted_payments;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$currency,
      l$online_ordering,
      l$id,
      l$accepted_payments,
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
            is Query$getBusinessCart$business_cart$items$product$business$details) ||
        runtimeType != other.runtimeType) {
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
    final l$online_ordering = online_ordering;
    final lOther$online_ordering = other.online_ordering;
    if (l$online_ordering != lOther$online_ordering) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$accepted_payments = accepted_payments;
    final lOther$accepted_payments = other.accepted_payments;
    if (l$accepted_payments != lOther$accepted_payments) {
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

extension UtilityExtension$Query$getBusinessCart$business_cart$items$product$business$details
    on Query$getBusinessCart$business_cart$items$product$business$details {
  CopyWith$Query$getBusinessCart$business_cart$items$product$business$details<
          Query$getBusinessCart$business_cart$items$product$business$details>
      get copyWith =>
          CopyWith$Query$getBusinessCart$business_cart$items$product$business$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessCart$business_cart$items$product$business$details<
    TRes> {
  factory CopyWith$Query$getBusinessCart$business_cart$items$product$business$details(
    Query$getBusinessCart$business_cart$items$product$business$details instance,
    TRes Function(
            Query$getBusinessCart$business_cart$items$product$business$details)
        then,
  ) = _CopyWithImpl$Query$getBusinessCart$business_cart$items$product$business$details;

  factory CopyWith$Query$getBusinessCart$business_cart$items$product$business$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$product$business$details;

  TRes call({
    String? name,
    String? currency,
    bool? online_ordering,
    int? id,
    dynamic? accepted_payments,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getBusinessCart$business_cart$items$product$business$details<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$product$business$details<
            TRes> {
  _CopyWithImpl$Query$getBusinessCart$business_cart$items$product$business$details(
    this._instance,
    this._then,
  );

  final Query$getBusinessCart$business_cart$items$product$business$details
      _instance;

  final TRes Function(
      Query$getBusinessCart$business_cart$items$product$business$details) _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? currency = _undefined,
    Object? online_ordering = _undefined,
    Object? id = _undefined,
    Object? accepted_payments = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getBusinessCart$business_cart$items$product$business$details(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        currency: currency == _undefined || currency == null
            ? _instance.currency
            : (currency as String),
        online_ordering:
            online_ordering == _undefined || online_ordering == null
                ? _instance.online_ordering
                : (online_ordering as bool),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        accepted_payments:
            accepted_payments == _undefined || accepted_payments == null
                ? _instance.accepted_payments
                : (accepted_payments as dynamic),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$product$business$details<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$product$business$details<
            TRes> {
  _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$product$business$details(
      this._res);

  TRes _res;

  call({
    String? name,
    String? currency,
    bool? online_ordering,
    int? id,
    dynamic? accepted_payments,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Query$getBusinessCart$business_cart$items$product$details {
  Query$getBusinessCart$business_cart$items$product$details({
    this.additional_parameters,
    required this.available,
    required this.category1,
    required this.category2,
    required this.name_id,
    this.description_id,
    required this.cost,
    required this.tags,
    this.description,
    required this.id,
    this.image,
    required this.name,
    required this.$__typename,
  });

  factory Query$getBusinessCart$business_cart$items$product$details.fromJson(
      Map<String, dynamic> json) {
    final l$additional_parameters = json['additional_parameters'];
    final l$available = json['available'];
    final l$category1 = json['category1'];
    final l$category2 = json['category2'];
    final l$name_id = json['name_id'];
    final l$description_id = json['description_id'];
    final l$cost = json['cost'];
    final l$tags = json['tags'];
    final l$description = json['description'];
    final l$id = json['id'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessCart$business_cart$items$product$details(
      additional_parameters: l$additional_parameters == null
          ? null
          : mapFromJson(l$additional_parameters),
      available: (l$available as bool),
      category1: (l$category1 as String),
      category2: (l$category2 as String),
      name_id: (l$name_id as int),
      description_id: (l$description_id as int?),
      cost: mapFromJson(l$cost),
      tags: mapFromJson(l$tags),
      description: l$description == null
          ? null
          : Query$getBusinessCart$business_cart$items$product$details$description
              .fromJson((l$description as Map<String, dynamic>)),
      id: (l$id as int),
      image: l$image == null ? null : mapFromJson(l$image),
      name: Query$getBusinessCart$business_cart$items$product$details$name
          .fromJson((l$name as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final dynamic? additional_parameters;

  final bool available;

  final String category1;

  final String category2;

  final int name_id;

  final int? description_id;

  final dynamic cost;

  final dynamic tags;

  final Query$getBusinessCart$business_cart$items$product$details$description?
      description;

  final int id;

  final dynamic? image;

  final Query$getBusinessCart$business_cart$items$product$details$name name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$additional_parameters = additional_parameters;
    _resultData['additional_parameters'] = l$additional_parameters == null
        ? null
        : mapToJson(l$additional_parameters);
    final l$available = available;
    _resultData['available'] = l$available;
    final l$category1 = category1;
    _resultData['category1'] = l$category1;
    final l$category2 = category2;
    _resultData['category2'] = l$category2;
    final l$name_id = name_id;
    _resultData['name_id'] = l$name_id;
    final l$description_id = description_id;
    _resultData['description_id'] = l$description_id;
    final l$cost = cost;
    _resultData['cost'] = mapToJson(l$cost);
    final l$tags = tags;
    _resultData['tags'] = mapToJson(l$tags);
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
    final l$id = id;
    _resultData['id'] = l$id;
    final l$image = image;
    _resultData['image'] = l$image == null ? null : mapToJson(l$image);
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$additional_parameters = additional_parameters;
    final l$available = available;
    final l$category1 = category1;
    final l$category2 = category2;
    final l$name_id = name_id;
    final l$description_id = description_id;
    final l$cost = cost;
    final l$tags = tags;
    final l$description = description;
    final l$id = id;
    final l$image = image;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$additional_parameters,
      l$available,
      l$category1,
      l$category2,
      l$name_id,
      l$description_id,
      l$cost,
      l$tags,
      l$description,
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
    if (!(other is Query$getBusinessCart$business_cart$items$product$details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$additional_parameters = additional_parameters;
    final lOther$additional_parameters = other.additional_parameters;
    if (l$additional_parameters != lOther$additional_parameters) {
      return false;
    }
    final l$available = available;
    final lOther$available = other.available;
    if (l$available != lOther$available) {
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
    final l$name_id = name_id;
    final lOther$name_id = other.name_id;
    if (l$name_id != lOther$name_id) {
      return false;
    }
    final l$description_id = description_id;
    final lOther$description_id = other.description_id;
    if (l$description_id != lOther$description_id) {
      return false;
    }
    final l$cost = cost;
    final lOther$cost = other.cost;
    if (l$cost != lOther$cost) {
      return false;
    }
    final l$tags = tags;
    final lOther$tags = other.tags;
    if (l$tags != lOther$tags) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
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

extension UtilityExtension$Query$getBusinessCart$business_cart$items$product$details
    on Query$getBusinessCart$business_cart$items$product$details {
  CopyWith$Query$getBusinessCart$business_cart$items$product$details<
          Query$getBusinessCart$business_cart$items$product$details>
      get copyWith =>
          CopyWith$Query$getBusinessCart$business_cart$items$product$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessCart$business_cart$items$product$details<
    TRes> {
  factory CopyWith$Query$getBusinessCart$business_cart$items$product$details(
    Query$getBusinessCart$business_cart$items$product$details instance,
    TRes Function(Query$getBusinessCart$business_cart$items$product$details)
        then,
  ) = _CopyWithImpl$Query$getBusinessCart$business_cart$items$product$details;

  factory CopyWith$Query$getBusinessCart$business_cart$items$product$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$product$details;

  TRes call({
    dynamic? additional_parameters,
    bool? available,
    String? category1,
    String? category2,
    int? name_id,
    int? description_id,
    dynamic? cost,
    dynamic? tags,
    Query$getBusinessCart$business_cart$items$product$details$description?
        description,
    int? id,
    dynamic? image,
    Query$getBusinessCart$business_cart$items$product$details$name? name,
    String? $__typename,
  });
  CopyWith$Query$getBusinessCart$business_cart$items$product$details$description<
      TRes> get description;
  CopyWith$Query$getBusinessCart$business_cart$items$product$details$name<TRes>
      get name;
}

class _CopyWithImpl$Query$getBusinessCart$business_cart$items$product$details<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$product$details<
            TRes> {
  _CopyWithImpl$Query$getBusinessCart$business_cart$items$product$details(
    this._instance,
    this._then,
  );

  final Query$getBusinessCart$business_cart$items$product$details _instance;

  final TRes Function(Query$getBusinessCart$business_cart$items$product$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? additional_parameters = _undefined,
    Object? available = _undefined,
    Object? category1 = _undefined,
    Object? category2 = _undefined,
    Object? name_id = _undefined,
    Object? description_id = _undefined,
    Object? cost = _undefined,
    Object? tags = _undefined,
    Object? description = _undefined,
    Object? id = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getBusinessCart$business_cart$items$product$details(
        additional_parameters: additional_parameters == _undefined
            ? _instance.additional_parameters
            : (additional_parameters as dynamic?),
        available: available == _undefined || available == null
            ? _instance.available
            : (available as bool),
        category1: category1 == _undefined || category1 == null
            ? _instance.category1
            : (category1 as String),
        category2: category2 == _undefined || category2 == null
            ? _instance.category2
            : (category2 as String),
        name_id: name_id == _undefined || name_id == null
            ? _instance.name_id
            : (name_id as int),
        description_id: description_id == _undefined
            ? _instance.description_id
            : (description_id as int?),
        cost: cost == _undefined || cost == null
            ? _instance.cost
            : (cost as dynamic),
        tags: tags == _undefined || tags == null
            ? _instance.tags
            : (tags as dynamic),
        description: description == _undefined
            ? _instance.description
            : (description
                as Query$getBusinessCart$business_cart$items$product$details$description?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        image: image == _undefined ? _instance.image : (image as dynamic?),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Query$getBusinessCart$business_cart$items$product$details$name),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getBusinessCart$business_cart$items$product$details$description<
      TRes> get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Query$getBusinessCart$business_cart$items$product$details$description
            .stub(_then(_instance))
        : CopyWith$Query$getBusinessCart$business_cart$items$product$details$description(
            local$description, (e) => call(description: e));
  }

  CopyWith$Query$getBusinessCart$business_cart$items$product$details$name<TRes>
      get name {
    final local$name = _instance.name;
    return CopyWith$Query$getBusinessCart$business_cart$items$product$details$name(
        local$name, (e) => call(name: e));
  }
}

class _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$product$details<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$product$details<
            TRes> {
  _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$product$details(
      this._res);

  TRes _res;

  call({
    dynamic? additional_parameters,
    bool? available,
    String? category1,
    String? category2,
    int? name_id,
    int? description_id,
    dynamic? cost,
    dynamic? tags,
    Query$getBusinessCart$business_cart$items$product$details$description?
        description,
    int? id,
    dynamic? image,
    Query$getBusinessCart$business_cart$items$product$details$name? name,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getBusinessCart$business_cart$items$product$details$description<
          TRes>
      get description =>
          CopyWith$Query$getBusinessCart$business_cart$items$product$details$description
              .stub(_res);
  CopyWith$Query$getBusinessCart$business_cart$items$product$details$name<TRes>
      get name =>
          CopyWith$Query$getBusinessCart$business_cart$items$product$details$name
              .stub(_res);
}

class Query$getBusinessCart$business_cart$items$product$details$description {
  Query$getBusinessCart$business_cart$items$product$details$description({
    required this.translations,
    required this.$__typename,
  });

  factory Query$getBusinessCart$business_cart$items$product$details$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessCart$business_cart$items$product$details$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getBusinessCart$business_cart$items$product$details$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$getBusinessCart$business_cart$items$product$details$description$translations>
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
            is Query$getBusinessCart$business_cart$items$product$details$description) ||
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

extension UtilityExtension$Query$getBusinessCart$business_cart$items$product$details$description
    on Query$getBusinessCart$business_cart$items$product$details$description {
  CopyWith$Query$getBusinessCart$business_cart$items$product$details$description<
          Query$getBusinessCart$business_cart$items$product$details$description>
      get copyWith =>
          CopyWith$Query$getBusinessCart$business_cart$items$product$details$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessCart$business_cart$items$product$details$description<
    TRes> {
  factory CopyWith$Query$getBusinessCart$business_cart$items$product$details$description(
    Query$getBusinessCart$business_cart$items$product$details$description
        instance,
    TRes Function(
            Query$getBusinessCart$business_cart$items$product$details$description)
        then,
  ) = _CopyWithImpl$Query$getBusinessCart$business_cart$items$product$details$description;

  factory CopyWith$Query$getBusinessCart$business_cart$items$product$details$description.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$product$details$description;

  TRes call({
    List<Query$getBusinessCart$business_cart$items$product$details$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getBusinessCart$business_cart$items$product$details$description$translations> Function(
              Iterable<
                  CopyWith$Query$getBusinessCart$business_cart$items$product$details$description$translations<
                      Query$getBusinessCart$business_cart$items$product$details$description$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getBusinessCart$business_cart$items$product$details$description<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$product$details$description<
            TRes> {
  _CopyWithImpl$Query$getBusinessCart$business_cart$items$product$details$description(
    this._instance,
    this._then,
  );

  final Query$getBusinessCart$business_cart$items$product$details$description
      _instance;

  final TRes Function(
          Query$getBusinessCart$business_cart$items$product$details$description)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getBusinessCart$business_cart$items$product$details$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getBusinessCart$business_cart$items$product$details$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getBusinessCart$business_cart$items$product$details$description$translations> Function(
                  Iterable<
                      CopyWith$Query$getBusinessCart$business_cart$items$product$details$description$translations<
                          Query$getBusinessCart$business_cart$items$product$details$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getBusinessCart$business_cart$items$product$details$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$product$details$description<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$product$details$description<
            TRes> {
  _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$product$details$description(
      this._res);

  TRes _res;

  call({
    List<Query$getBusinessCart$business_cart$items$product$details$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getBusinessCart$business_cart$items$product$details$description$translations {
  Query$getBusinessCart$business_cart$items$product$details$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getBusinessCart$business_cart$items$product$details$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessCart$business_cart$items$product$details$description$translations(
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
            is Query$getBusinessCart$business_cart$items$product$details$description$translations) ||
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

extension UtilityExtension$Query$getBusinessCart$business_cart$items$product$details$description$translations
    on Query$getBusinessCart$business_cart$items$product$details$description$translations {
  CopyWith$Query$getBusinessCart$business_cart$items$product$details$description$translations<
          Query$getBusinessCart$business_cart$items$product$details$description$translations>
      get copyWith =>
          CopyWith$Query$getBusinessCart$business_cart$items$product$details$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessCart$business_cart$items$product$details$description$translations<
    TRes> {
  factory CopyWith$Query$getBusinessCart$business_cart$items$product$details$description$translations(
    Query$getBusinessCart$business_cart$items$product$details$description$translations
        instance,
    TRes Function(
            Query$getBusinessCart$business_cart$items$product$details$description$translations)
        then,
  ) = _CopyWithImpl$Query$getBusinessCart$business_cart$items$product$details$description$translations;

  factory CopyWith$Query$getBusinessCart$business_cart$items$product$details$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$product$details$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getBusinessCart$business_cart$items$product$details$description$translations<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$product$details$description$translations<
            TRes> {
  _CopyWithImpl$Query$getBusinessCart$business_cart$items$product$details$description$translations(
    this._instance,
    this._then,
  );

  final Query$getBusinessCart$business_cart$items$product$details$description$translations
      _instance;

  final TRes Function(
          Query$getBusinessCart$business_cart$items$product$details$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getBusinessCart$business_cart$items$product$details$description$translations(
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

class _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$product$details$description$translations<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$product$details$description$translations<
            TRes> {
  _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$product$details$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$getBusinessCart$business_cart$items$product$details$name {
  Query$getBusinessCart$business_cart$items$product$details$name({
    required this.translations,
    required this.$__typename,
  });

  factory Query$getBusinessCart$business_cart$items$product$details$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessCart$business_cart$items$product$details$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getBusinessCart$business_cart$items$product$details$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$getBusinessCart$business_cart$items$product$details$name$translations>
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
            is Query$getBusinessCart$business_cart$items$product$details$name) ||
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

extension UtilityExtension$Query$getBusinessCart$business_cart$items$product$details$name
    on Query$getBusinessCart$business_cart$items$product$details$name {
  CopyWith$Query$getBusinessCart$business_cart$items$product$details$name<
          Query$getBusinessCart$business_cart$items$product$details$name>
      get copyWith =>
          CopyWith$Query$getBusinessCart$business_cart$items$product$details$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessCart$business_cart$items$product$details$name<
    TRes> {
  factory CopyWith$Query$getBusinessCart$business_cart$items$product$details$name(
    Query$getBusinessCart$business_cart$items$product$details$name instance,
    TRes Function(
            Query$getBusinessCart$business_cart$items$product$details$name)
        then,
  ) = _CopyWithImpl$Query$getBusinessCart$business_cart$items$product$details$name;

  factory CopyWith$Query$getBusinessCart$business_cart$items$product$details$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$product$details$name;

  TRes call({
    List<Query$getBusinessCart$business_cart$items$product$details$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getBusinessCart$business_cart$items$product$details$name$translations> Function(
              Iterable<
                  CopyWith$Query$getBusinessCart$business_cart$items$product$details$name$translations<
                      Query$getBusinessCart$business_cart$items$product$details$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getBusinessCart$business_cart$items$product$details$name<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$product$details$name<
            TRes> {
  _CopyWithImpl$Query$getBusinessCart$business_cart$items$product$details$name(
    this._instance,
    this._then,
  );

  final Query$getBusinessCart$business_cart$items$product$details$name
      _instance;

  final TRes Function(
      Query$getBusinessCart$business_cart$items$product$details$name) _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getBusinessCart$business_cart$items$product$details$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getBusinessCart$business_cart$items$product$details$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getBusinessCart$business_cart$items$product$details$name$translations> Function(
                  Iterable<
                      CopyWith$Query$getBusinessCart$business_cart$items$product$details$name$translations<
                          Query$getBusinessCart$business_cart$items$product$details$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getBusinessCart$business_cart$items$product$details$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$product$details$name<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$product$details$name<
            TRes> {
  _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$product$details$name(
      this._res);

  TRes _res;

  call({
    List<Query$getBusinessCart$business_cart$items$product$details$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getBusinessCart$business_cart$items$product$details$name$translations {
  Query$getBusinessCart$business_cart$items$product$details$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getBusinessCart$business_cart$items$product$details$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessCart$business_cart$items$product$details$name$translations(
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
            is Query$getBusinessCart$business_cart$items$product$details$name$translations) ||
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

extension UtilityExtension$Query$getBusinessCart$business_cart$items$product$details$name$translations
    on Query$getBusinessCart$business_cart$items$product$details$name$translations {
  CopyWith$Query$getBusinessCart$business_cart$items$product$details$name$translations<
          Query$getBusinessCart$business_cart$items$product$details$name$translations>
      get copyWith =>
          CopyWith$Query$getBusinessCart$business_cart$items$product$details$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessCart$business_cart$items$product$details$name$translations<
    TRes> {
  factory CopyWith$Query$getBusinessCart$business_cart$items$product$details$name$translations(
    Query$getBusinessCart$business_cart$items$product$details$name$translations
        instance,
    TRes Function(
            Query$getBusinessCart$business_cart$items$product$details$name$translations)
        then,
  ) = _CopyWithImpl$Query$getBusinessCart$business_cart$items$product$details$name$translations;

  factory CopyWith$Query$getBusinessCart$business_cart$items$product$details$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$product$details$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getBusinessCart$business_cart$items$product$details$name$translations<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$product$details$name$translations<
            TRes> {
  _CopyWithImpl$Query$getBusinessCart$business_cart$items$product$details$name$translations(
    this._instance,
    this._then,
  );

  final Query$getBusinessCart$business_cart$items$product$details$name$translations
      _instance;

  final TRes Function(
          Query$getBusinessCart$business_cart$items$product$details$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getBusinessCart$business_cart$items$product$details$name$translations(
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

class _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$product$details$name$translations<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$product$details$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$product$details$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$getBusinessCart$business_cart$items$service {
  Query$getBusinessCart$business_cart$items$service({
    required this.id,
    required this.business,
    required this.details,
    required this.$__typename,
  });

  factory Query$getBusinessCart$business_cart$items$service.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$business = json['business'];
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessCart$business_cart$items$service(
      id: (l$id as int),
      business:
          Query$getBusinessCart$business_cart$items$service$business.fromJson(
              (l$business as Map<String, dynamic>)),
      details:
          Query$getBusinessCart$business_cart$items$service$details.fromJson(
              (l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$getBusinessCart$business_cart$items$service$business business;

  final Query$getBusinessCart$business_cart$items$service$details details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$business = business;
    _resultData['business'] = l$business.toJson();
    final l$details = details;
    _resultData['details'] = l$details.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$business = business;
    final l$details = details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$business,
      l$details,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getBusinessCart$business_cart$items$service) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$business = business;
    final lOther$business = other.business;
    if (l$business != lOther$business) {
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

extension UtilityExtension$Query$getBusinessCart$business_cart$items$service
    on Query$getBusinessCart$business_cart$items$service {
  CopyWith$Query$getBusinessCart$business_cart$items$service<
          Query$getBusinessCart$business_cart$items$service>
      get copyWith =>
          CopyWith$Query$getBusinessCart$business_cart$items$service(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessCart$business_cart$items$service<
    TRes> {
  factory CopyWith$Query$getBusinessCart$business_cart$items$service(
    Query$getBusinessCart$business_cart$items$service instance,
    TRes Function(Query$getBusinessCart$business_cart$items$service) then,
  ) = _CopyWithImpl$Query$getBusinessCart$business_cart$items$service;

  factory CopyWith$Query$getBusinessCart$business_cart$items$service.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$service;

  TRes call({
    int? id,
    Query$getBusinessCart$business_cart$items$service$business? business,
    Query$getBusinessCart$business_cart$items$service$details? details,
    String? $__typename,
  });
  CopyWith$Query$getBusinessCart$business_cart$items$service$business<TRes>
      get business;
  CopyWith$Query$getBusinessCart$business_cart$items$service$details<TRes>
      get details;
}

class _CopyWithImpl$Query$getBusinessCart$business_cart$items$service<TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$service<TRes> {
  _CopyWithImpl$Query$getBusinessCart$business_cart$items$service(
    this._instance,
    this._then,
  );

  final Query$getBusinessCart$business_cart$items$service _instance;

  final TRes Function(Query$getBusinessCart$business_cart$items$service) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? business = _undefined,
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getBusinessCart$business_cart$items$service(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        business: business == _undefined || business == null
            ? _instance.business
            : (business
                as Query$getBusinessCart$business_cart$items$service$business),
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Query$getBusinessCart$business_cart$items$service$details),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getBusinessCart$business_cart$items$service$business<TRes>
      get business {
    final local$business = _instance.business;
    return CopyWith$Query$getBusinessCart$business_cart$items$service$business(
        local$business, (e) => call(business: e));
  }

  CopyWith$Query$getBusinessCart$business_cart$items$service$details<TRes>
      get details {
    final local$details = _instance.details;
    return CopyWith$Query$getBusinessCart$business_cart$items$service$details(
        local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$service<TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$service<TRes> {
  _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$service(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$getBusinessCart$business_cart$items$service$business? business,
    Query$getBusinessCart$business_cart$items$service$details? details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getBusinessCart$business_cart$items$service$business<TRes>
      get business =>
          CopyWith$Query$getBusinessCart$business_cart$items$service$business
              .stub(_res);
  CopyWith$Query$getBusinessCart$business_cart$items$service$details<TRes>
      get details =>
          CopyWith$Query$getBusinessCart$business_cart$items$service$details
              .stub(_res);
}

class Query$getBusinessCart$business_cart$items$service$business {
  Query$getBusinessCart$business_cart$items$service$business({
    required this.details,
    required this.$__typename,
  });

  factory Query$getBusinessCart$business_cart$items$service$business.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessCart$business_cart$items$service$business(
      details:
          Query$getBusinessCart$business_cart$items$service$business$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getBusinessCart$business_cart$items$service$business$details
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
            is Query$getBusinessCart$business_cart$items$service$business) ||
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

extension UtilityExtension$Query$getBusinessCart$business_cart$items$service$business
    on Query$getBusinessCart$business_cart$items$service$business {
  CopyWith$Query$getBusinessCart$business_cart$items$service$business<
          Query$getBusinessCart$business_cart$items$service$business>
      get copyWith =>
          CopyWith$Query$getBusinessCart$business_cart$items$service$business(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessCart$business_cart$items$service$business<
    TRes> {
  factory CopyWith$Query$getBusinessCart$business_cart$items$service$business(
    Query$getBusinessCart$business_cart$items$service$business instance,
    TRes Function(Query$getBusinessCart$business_cart$items$service$business)
        then,
  ) = _CopyWithImpl$Query$getBusinessCart$business_cart$items$service$business;

  factory CopyWith$Query$getBusinessCart$business_cart$items$service$business.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$service$business;

  TRes call({
    Query$getBusinessCart$business_cart$items$service$business$details? details,
    String? $__typename,
  });
  CopyWith$Query$getBusinessCart$business_cart$items$service$business$details<
      TRes> get details;
}

class _CopyWithImpl$Query$getBusinessCart$business_cart$items$service$business<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$service$business<
            TRes> {
  _CopyWithImpl$Query$getBusinessCart$business_cart$items$service$business(
    this._instance,
    this._then,
  );

  final Query$getBusinessCart$business_cart$items$service$business _instance;

  final TRes Function(
      Query$getBusinessCart$business_cart$items$service$business) _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getBusinessCart$business_cart$items$service$business(
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Query$getBusinessCart$business_cart$items$service$business$details),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getBusinessCart$business_cart$items$service$business$details<
      TRes> get details {
    final local$details = _instance.details;
    return CopyWith$Query$getBusinessCart$business_cart$items$service$business$details(
        local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$service$business<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$service$business<
            TRes> {
  _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$service$business(
      this._res);

  TRes _res;

  call({
    Query$getBusinessCart$business_cart$items$service$business$details? details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getBusinessCart$business_cart$items$service$business$details<
          TRes>
      get details =>
          CopyWith$Query$getBusinessCart$business_cart$items$service$business$details
              .stub(_res);
}

class Query$getBusinessCart$business_cart$items$service$business$details {
  Query$getBusinessCart$business_cart$items$service$business$details({
    required this.name,
    required this.currency,
    required this.id,
    required this.accepted_payments,
    required this.online_ordering,
    required this.image,
    required this.$__typename,
  });

  factory Query$getBusinessCart$business_cart$items$service$business$details.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$currency = json['currency'];
    final l$id = json['id'];
    final l$accepted_payments = json['accepted_payments'];
    final l$online_ordering = json['online_ordering'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessCart$business_cart$items$service$business$details(
      name: (l$name as String),
      currency: (l$currency as String),
      id: (l$id as int),
      accepted_payments: mapFromJson(l$accepted_payments),
      online_ordering: (l$online_ordering as bool),
      image: (l$image as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String name;

  final String currency;

  final int id;

  final dynamic accepted_payments;

  final bool online_ordering;

  final String image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$currency = currency;
    _resultData['currency'] = l$currency;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$accepted_payments = accepted_payments;
    _resultData['accepted_payments'] = mapToJson(l$accepted_payments);
    final l$online_ordering = online_ordering;
    _resultData['online_ordering'] = l$online_ordering;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$currency = currency;
    final l$id = id;
    final l$accepted_payments = accepted_payments;
    final l$online_ordering = online_ordering;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$currency,
      l$id,
      l$accepted_payments,
      l$online_ordering,
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
            is Query$getBusinessCart$business_cart$items$service$business$details) ||
        runtimeType != other.runtimeType) {
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
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$accepted_payments = accepted_payments;
    final lOther$accepted_payments = other.accepted_payments;
    if (l$accepted_payments != lOther$accepted_payments) {
      return false;
    }
    final l$online_ordering = online_ordering;
    final lOther$online_ordering = other.online_ordering;
    if (l$online_ordering != lOther$online_ordering) {
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

extension UtilityExtension$Query$getBusinessCart$business_cart$items$service$business$details
    on Query$getBusinessCart$business_cart$items$service$business$details {
  CopyWith$Query$getBusinessCart$business_cart$items$service$business$details<
          Query$getBusinessCart$business_cart$items$service$business$details>
      get copyWith =>
          CopyWith$Query$getBusinessCart$business_cart$items$service$business$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessCart$business_cart$items$service$business$details<
    TRes> {
  factory CopyWith$Query$getBusinessCart$business_cart$items$service$business$details(
    Query$getBusinessCart$business_cart$items$service$business$details instance,
    TRes Function(
            Query$getBusinessCart$business_cart$items$service$business$details)
        then,
  ) = _CopyWithImpl$Query$getBusinessCart$business_cart$items$service$business$details;

  factory CopyWith$Query$getBusinessCart$business_cart$items$service$business$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$service$business$details;

  TRes call({
    String? name,
    String? currency,
    int? id,
    dynamic? accepted_payments,
    bool? online_ordering,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getBusinessCart$business_cart$items$service$business$details<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$service$business$details<
            TRes> {
  _CopyWithImpl$Query$getBusinessCart$business_cart$items$service$business$details(
    this._instance,
    this._then,
  );

  final Query$getBusinessCart$business_cart$items$service$business$details
      _instance;

  final TRes Function(
      Query$getBusinessCart$business_cart$items$service$business$details) _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? currency = _undefined,
    Object? id = _undefined,
    Object? accepted_payments = _undefined,
    Object? online_ordering = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getBusinessCart$business_cart$items$service$business$details(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        currency: currency == _undefined || currency == null
            ? _instance.currency
            : (currency as String),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        accepted_payments:
            accepted_payments == _undefined || accepted_payments == null
                ? _instance.accepted_payments
                : (accepted_payments as dynamic),
        online_ordering:
            online_ordering == _undefined || online_ordering == null
                ? _instance.online_ordering
                : (online_ordering as bool),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$service$business$details<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$service$business$details<
            TRes> {
  _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$service$business$details(
      this._res);

  TRes _res;

  call({
    String? name,
    String? currency,
    int? id,
    dynamic? accepted_payments,
    bool? online_ordering,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Query$getBusinessCart$business_cart$items$service$details {
  Query$getBusinessCart$business_cart$items$service$details({
    this.additional_parameters,
    required this.available,
    required this.category1,
    required this.name_id,
    this.description_id,
    required this.category2,
    required this.cost,
    required this.tags,
    this.description,
    required this.id,
    this.image,
    required this.name,
    required this.$__typename,
  });

  factory Query$getBusinessCart$business_cart$items$service$details.fromJson(
      Map<String, dynamic> json) {
    final l$additional_parameters = json['additional_parameters'];
    final l$available = json['available'];
    final l$category1 = json['category1'];
    final l$name_id = json['name_id'];
    final l$description_id = json['description_id'];
    final l$category2 = json['category2'];
    final l$cost = json['cost'];
    final l$tags = json['tags'];
    final l$description = json['description'];
    final l$id = json['id'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessCart$business_cart$items$service$details(
      additional_parameters: l$additional_parameters == null
          ? null
          : mapFromJson(l$additional_parameters),
      available: (l$available as bool),
      category1: (l$category1 as String),
      name_id: (l$name_id as int),
      description_id: (l$description_id as int?),
      category2: (l$category2 as String),
      cost: mapFromJson(l$cost),
      tags: mapFromJson(l$tags),
      description: l$description == null
          ? null
          : Query$getBusinessCart$business_cart$items$service$details$description
              .fromJson((l$description as Map<String, dynamic>)),
      id: (l$id as int),
      image: l$image == null ? null : mapFromJson(l$image),
      name: Query$getBusinessCart$business_cart$items$service$details$name
          .fromJson((l$name as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final dynamic? additional_parameters;

  final bool available;

  final String category1;

  final int name_id;

  final int? description_id;

  final String category2;

  final dynamic cost;

  final dynamic tags;

  final Query$getBusinessCart$business_cart$items$service$details$description?
      description;

  final int id;

  final dynamic? image;

  final Query$getBusinessCart$business_cart$items$service$details$name name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$additional_parameters = additional_parameters;
    _resultData['additional_parameters'] = l$additional_parameters == null
        ? null
        : mapToJson(l$additional_parameters);
    final l$available = available;
    _resultData['available'] = l$available;
    final l$category1 = category1;
    _resultData['category1'] = l$category1;
    final l$name_id = name_id;
    _resultData['name_id'] = l$name_id;
    final l$description_id = description_id;
    _resultData['description_id'] = l$description_id;
    final l$category2 = category2;
    _resultData['category2'] = l$category2;
    final l$cost = cost;
    _resultData['cost'] = mapToJson(l$cost);
    final l$tags = tags;
    _resultData['tags'] = mapToJson(l$tags);
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
    final l$id = id;
    _resultData['id'] = l$id;
    final l$image = image;
    _resultData['image'] = l$image == null ? null : mapToJson(l$image);
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$additional_parameters = additional_parameters;
    final l$available = available;
    final l$category1 = category1;
    final l$name_id = name_id;
    final l$description_id = description_id;
    final l$category2 = category2;
    final l$cost = cost;
    final l$tags = tags;
    final l$description = description;
    final l$id = id;
    final l$image = image;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$additional_parameters,
      l$available,
      l$category1,
      l$name_id,
      l$description_id,
      l$category2,
      l$cost,
      l$tags,
      l$description,
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
    if (!(other is Query$getBusinessCart$business_cart$items$service$details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$additional_parameters = additional_parameters;
    final lOther$additional_parameters = other.additional_parameters;
    if (l$additional_parameters != lOther$additional_parameters) {
      return false;
    }
    final l$available = available;
    final lOther$available = other.available;
    if (l$available != lOther$available) {
      return false;
    }
    final l$category1 = category1;
    final lOther$category1 = other.category1;
    if (l$category1 != lOther$category1) {
      return false;
    }
    final l$name_id = name_id;
    final lOther$name_id = other.name_id;
    if (l$name_id != lOther$name_id) {
      return false;
    }
    final l$description_id = description_id;
    final lOther$description_id = other.description_id;
    if (l$description_id != lOther$description_id) {
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
    final l$tags = tags;
    final lOther$tags = other.tags;
    if (l$tags != lOther$tags) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
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

extension UtilityExtension$Query$getBusinessCart$business_cart$items$service$details
    on Query$getBusinessCart$business_cart$items$service$details {
  CopyWith$Query$getBusinessCart$business_cart$items$service$details<
          Query$getBusinessCart$business_cart$items$service$details>
      get copyWith =>
          CopyWith$Query$getBusinessCart$business_cart$items$service$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessCart$business_cart$items$service$details<
    TRes> {
  factory CopyWith$Query$getBusinessCart$business_cart$items$service$details(
    Query$getBusinessCart$business_cart$items$service$details instance,
    TRes Function(Query$getBusinessCart$business_cart$items$service$details)
        then,
  ) = _CopyWithImpl$Query$getBusinessCart$business_cart$items$service$details;

  factory CopyWith$Query$getBusinessCart$business_cart$items$service$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$service$details;

  TRes call({
    dynamic? additional_parameters,
    bool? available,
    String? category1,
    int? name_id,
    int? description_id,
    String? category2,
    dynamic? cost,
    dynamic? tags,
    Query$getBusinessCart$business_cart$items$service$details$description?
        description,
    int? id,
    dynamic? image,
    Query$getBusinessCart$business_cart$items$service$details$name? name,
    String? $__typename,
  });
  CopyWith$Query$getBusinessCart$business_cart$items$service$details$description<
      TRes> get description;
  CopyWith$Query$getBusinessCart$business_cart$items$service$details$name<TRes>
      get name;
}

class _CopyWithImpl$Query$getBusinessCart$business_cart$items$service$details<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$service$details<
            TRes> {
  _CopyWithImpl$Query$getBusinessCart$business_cart$items$service$details(
    this._instance,
    this._then,
  );

  final Query$getBusinessCart$business_cart$items$service$details _instance;

  final TRes Function(Query$getBusinessCart$business_cart$items$service$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? additional_parameters = _undefined,
    Object? available = _undefined,
    Object? category1 = _undefined,
    Object? name_id = _undefined,
    Object? description_id = _undefined,
    Object? category2 = _undefined,
    Object? cost = _undefined,
    Object? tags = _undefined,
    Object? description = _undefined,
    Object? id = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getBusinessCart$business_cart$items$service$details(
        additional_parameters: additional_parameters == _undefined
            ? _instance.additional_parameters
            : (additional_parameters as dynamic?),
        available: available == _undefined || available == null
            ? _instance.available
            : (available as bool),
        category1: category1 == _undefined || category1 == null
            ? _instance.category1
            : (category1 as String),
        name_id: name_id == _undefined || name_id == null
            ? _instance.name_id
            : (name_id as int),
        description_id: description_id == _undefined
            ? _instance.description_id
            : (description_id as int?),
        category2: category2 == _undefined || category2 == null
            ? _instance.category2
            : (category2 as String),
        cost: cost == _undefined || cost == null
            ? _instance.cost
            : (cost as dynamic),
        tags: tags == _undefined || tags == null
            ? _instance.tags
            : (tags as dynamic),
        description: description == _undefined
            ? _instance.description
            : (description
                as Query$getBusinessCart$business_cart$items$service$details$description?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        image: image == _undefined ? _instance.image : (image as dynamic?),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Query$getBusinessCart$business_cart$items$service$details$name),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getBusinessCart$business_cart$items$service$details$description<
      TRes> get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Query$getBusinessCart$business_cart$items$service$details$description
            .stub(_then(_instance))
        : CopyWith$Query$getBusinessCart$business_cart$items$service$details$description(
            local$description, (e) => call(description: e));
  }

  CopyWith$Query$getBusinessCart$business_cart$items$service$details$name<TRes>
      get name {
    final local$name = _instance.name;
    return CopyWith$Query$getBusinessCart$business_cart$items$service$details$name(
        local$name, (e) => call(name: e));
  }
}

class _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$service$details<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$service$details<
            TRes> {
  _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$service$details(
      this._res);

  TRes _res;

  call({
    dynamic? additional_parameters,
    bool? available,
    String? category1,
    int? name_id,
    int? description_id,
    String? category2,
    dynamic? cost,
    dynamic? tags,
    Query$getBusinessCart$business_cart$items$service$details$description?
        description,
    int? id,
    dynamic? image,
    Query$getBusinessCart$business_cart$items$service$details$name? name,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getBusinessCart$business_cart$items$service$details$description<
          TRes>
      get description =>
          CopyWith$Query$getBusinessCart$business_cart$items$service$details$description
              .stub(_res);
  CopyWith$Query$getBusinessCart$business_cart$items$service$details$name<TRes>
      get name =>
          CopyWith$Query$getBusinessCart$business_cart$items$service$details$name
              .stub(_res);
}

class Query$getBusinessCart$business_cart$items$service$details$description {
  Query$getBusinessCart$business_cart$items$service$details$description({
    required this.translations,
    required this.$__typename,
  });

  factory Query$getBusinessCart$business_cart$items$service$details$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessCart$business_cart$items$service$details$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getBusinessCart$business_cart$items$service$details$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$getBusinessCart$business_cart$items$service$details$description$translations>
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
            is Query$getBusinessCart$business_cart$items$service$details$description) ||
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

extension UtilityExtension$Query$getBusinessCart$business_cart$items$service$details$description
    on Query$getBusinessCart$business_cart$items$service$details$description {
  CopyWith$Query$getBusinessCart$business_cart$items$service$details$description<
          Query$getBusinessCart$business_cart$items$service$details$description>
      get copyWith =>
          CopyWith$Query$getBusinessCart$business_cart$items$service$details$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessCart$business_cart$items$service$details$description<
    TRes> {
  factory CopyWith$Query$getBusinessCart$business_cart$items$service$details$description(
    Query$getBusinessCart$business_cart$items$service$details$description
        instance,
    TRes Function(
            Query$getBusinessCart$business_cart$items$service$details$description)
        then,
  ) = _CopyWithImpl$Query$getBusinessCart$business_cart$items$service$details$description;

  factory CopyWith$Query$getBusinessCart$business_cart$items$service$details$description.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$service$details$description;

  TRes call({
    List<Query$getBusinessCart$business_cart$items$service$details$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getBusinessCart$business_cart$items$service$details$description$translations> Function(
              Iterable<
                  CopyWith$Query$getBusinessCart$business_cart$items$service$details$description$translations<
                      Query$getBusinessCart$business_cart$items$service$details$description$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getBusinessCart$business_cart$items$service$details$description<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$service$details$description<
            TRes> {
  _CopyWithImpl$Query$getBusinessCart$business_cart$items$service$details$description(
    this._instance,
    this._then,
  );

  final Query$getBusinessCart$business_cart$items$service$details$description
      _instance;

  final TRes Function(
          Query$getBusinessCart$business_cart$items$service$details$description)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getBusinessCart$business_cart$items$service$details$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getBusinessCart$business_cart$items$service$details$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getBusinessCart$business_cart$items$service$details$description$translations> Function(
                  Iterable<
                      CopyWith$Query$getBusinessCart$business_cart$items$service$details$description$translations<
                          Query$getBusinessCart$business_cart$items$service$details$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getBusinessCart$business_cart$items$service$details$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$service$details$description<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$service$details$description<
            TRes> {
  _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$service$details$description(
      this._res);

  TRes _res;

  call({
    List<Query$getBusinessCart$business_cart$items$service$details$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getBusinessCart$business_cart$items$service$details$description$translations {
  Query$getBusinessCart$business_cart$items$service$details$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getBusinessCart$business_cart$items$service$details$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessCart$business_cart$items$service$details$description$translations(
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
            is Query$getBusinessCart$business_cart$items$service$details$description$translations) ||
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

extension UtilityExtension$Query$getBusinessCart$business_cart$items$service$details$description$translations
    on Query$getBusinessCart$business_cart$items$service$details$description$translations {
  CopyWith$Query$getBusinessCart$business_cart$items$service$details$description$translations<
          Query$getBusinessCart$business_cart$items$service$details$description$translations>
      get copyWith =>
          CopyWith$Query$getBusinessCart$business_cart$items$service$details$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessCart$business_cart$items$service$details$description$translations<
    TRes> {
  factory CopyWith$Query$getBusinessCart$business_cart$items$service$details$description$translations(
    Query$getBusinessCart$business_cart$items$service$details$description$translations
        instance,
    TRes Function(
            Query$getBusinessCart$business_cart$items$service$details$description$translations)
        then,
  ) = _CopyWithImpl$Query$getBusinessCart$business_cart$items$service$details$description$translations;

  factory CopyWith$Query$getBusinessCart$business_cart$items$service$details$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$service$details$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getBusinessCart$business_cart$items$service$details$description$translations<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$service$details$description$translations<
            TRes> {
  _CopyWithImpl$Query$getBusinessCart$business_cart$items$service$details$description$translations(
    this._instance,
    this._then,
  );

  final Query$getBusinessCart$business_cart$items$service$details$description$translations
      _instance;

  final TRes Function(
          Query$getBusinessCart$business_cart$items$service$details$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getBusinessCart$business_cart$items$service$details$description$translations(
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

class _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$service$details$description$translations<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$service$details$description$translations<
            TRes> {
  _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$service$details$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$getBusinessCart$business_cart$items$service$details$name {
  Query$getBusinessCart$business_cart$items$service$details$name({
    required this.translations,
    required this.$__typename,
  });

  factory Query$getBusinessCart$business_cart$items$service$details$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessCart$business_cart$items$service$details$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getBusinessCart$business_cart$items$service$details$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$getBusinessCart$business_cart$items$service$details$name$translations>
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
            is Query$getBusinessCart$business_cart$items$service$details$name) ||
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

extension UtilityExtension$Query$getBusinessCart$business_cart$items$service$details$name
    on Query$getBusinessCart$business_cart$items$service$details$name {
  CopyWith$Query$getBusinessCart$business_cart$items$service$details$name<
          Query$getBusinessCart$business_cart$items$service$details$name>
      get copyWith =>
          CopyWith$Query$getBusinessCart$business_cart$items$service$details$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessCart$business_cart$items$service$details$name<
    TRes> {
  factory CopyWith$Query$getBusinessCart$business_cart$items$service$details$name(
    Query$getBusinessCart$business_cart$items$service$details$name instance,
    TRes Function(
            Query$getBusinessCart$business_cart$items$service$details$name)
        then,
  ) = _CopyWithImpl$Query$getBusinessCart$business_cart$items$service$details$name;

  factory CopyWith$Query$getBusinessCart$business_cart$items$service$details$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$service$details$name;

  TRes call({
    List<Query$getBusinessCart$business_cart$items$service$details$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getBusinessCart$business_cart$items$service$details$name$translations> Function(
              Iterable<
                  CopyWith$Query$getBusinessCart$business_cart$items$service$details$name$translations<
                      Query$getBusinessCart$business_cart$items$service$details$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getBusinessCart$business_cart$items$service$details$name<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$service$details$name<
            TRes> {
  _CopyWithImpl$Query$getBusinessCart$business_cart$items$service$details$name(
    this._instance,
    this._then,
  );

  final Query$getBusinessCart$business_cart$items$service$details$name
      _instance;

  final TRes Function(
      Query$getBusinessCart$business_cart$items$service$details$name) _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getBusinessCart$business_cart$items$service$details$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getBusinessCart$business_cart$items$service$details$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getBusinessCart$business_cart$items$service$details$name$translations> Function(
                  Iterable<
                      CopyWith$Query$getBusinessCart$business_cart$items$service$details$name$translations<
                          Query$getBusinessCart$business_cart$items$service$details$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getBusinessCart$business_cart$items$service$details$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$service$details$name<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$service$details$name<
            TRes> {
  _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$service$details$name(
      this._res);

  TRes _res;

  call({
    List<Query$getBusinessCart$business_cart$items$service$details$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getBusinessCart$business_cart$items$service$details$name$translations {
  Query$getBusinessCart$business_cart$items$service$details$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getBusinessCart$business_cart$items$service$details$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessCart$business_cart$items$service$details$name$translations(
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
            is Query$getBusinessCart$business_cart$items$service$details$name$translations) ||
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

extension UtilityExtension$Query$getBusinessCart$business_cart$items$service$details$name$translations
    on Query$getBusinessCart$business_cart$items$service$details$name$translations {
  CopyWith$Query$getBusinessCart$business_cart$items$service$details$name$translations<
          Query$getBusinessCart$business_cart$items$service$details$name$translations>
      get copyWith =>
          CopyWith$Query$getBusinessCart$business_cart$items$service$details$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessCart$business_cart$items$service$details$name$translations<
    TRes> {
  factory CopyWith$Query$getBusinessCart$business_cart$items$service$details$name$translations(
    Query$getBusinessCart$business_cart$items$service$details$name$translations
        instance,
    TRes Function(
            Query$getBusinessCart$business_cart$items$service$details$name$translations)
        then,
  ) = _CopyWithImpl$Query$getBusinessCart$business_cart$items$service$details$name$translations;

  factory CopyWith$Query$getBusinessCart$business_cart$items$service$details$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$service$details$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getBusinessCart$business_cart$items$service$details$name$translations<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$service$details$name$translations<
            TRes> {
  _CopyWithImpl$Query$getBusinessCart$business_cart$items$service$details$name$translations(
    this._instance,
    this._then,
  );

  final Query$getBusinessCart$business_cart$items$service$details$name$translations
      _instance;

  final TRes Function(
          Query$getBusinessCart$business_cart$items$service$details$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getBusinessCart$business_cart$items$service$details$name$translations(
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

class _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$service$details$name$translations<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$service$details$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$service$details$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$getBusinessCart$business_cart$items$event {
  Query$getBusinessCart$business_cart$items$event({
    required this.id,
    required this.business,
    required this.details,
    required this.schedule_type,
    this.schedule,
    this.starts_at,
    this.ends_at,
    required this.$__typename,
  });

  factory Query$getBusinessCart$business_cart$items$event.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$business = json['business'];
    final l$details = json['details'];
    final l$schedule_type = json['schedule_type'];
    final l$schedule = json['schedule'];
    final l$starts_at = json['starts_at'];
    final l$ends_at = json['ends_at'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessCart$business_cart$items$event(
      id: (l$id as int),
      business:
          Query$getBusinessCart$business_cart$items$event$business.fromJson(
              (l$business as Map<String, dynamic>)),
      details: Query$getBusinessCart$business_cart$items$event$details.fromJson(
          (l$details as Map<String, dynamic>)),
      schedule_type: (l$schedule_type as String),
      schedule: l$schedule == null ? null : mapFromJson(l$schedule),
      starts_at: (l$starts_at as String?),
      ends_at: (l$ends_at as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$getBusinessCart$business_cart$items$event$business business;

  final Query$getBusinessCart$business_cart$items$event$details details;

  final String schedule_type;

  final dynamic? schedule;

  final String? starts_at;

  final String? ends_at;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$business = business;
    _resultData['business'] = l$business.toJson();
    final l$details = details;
    _resultData['details'] = l$details.toJson();
    final l$schedule_type = schedule_type;
    _resultData['schedule_type'] = l$schedule_type;
    final l$schedule = schedule;
    _resultData['schedule'] = l$schedule == null ? null : mapToJson(l$schedule);
    final l$starts_at = starts_at;
    _resultData['starts_at'] = l$starts_at;
    final l$ends_at = ends_at;
    _resultData['ends_at'] = l$ends_at;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$business = business;
    final l$details = details;
    final l$schedule_type = schedule_type;
    final l$schedule = schedule;
    final l$starts_at = starts_at;
    final l$ends_at = ends_at;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$business,
      l$details,
      l$schedule_type,
      l$schedule,
      l$starts_at,
      l$ends_at,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getBusinessCart$business_cart$items$event) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$business = business;
    final lOther$business = other.business;
    if (l$business != lOther$business) {
      return false;
    }
    final l$details = details;
    final lOther$details = other.details;
    if (l$details != lOther$details) {
      return false;
    }
    final l$schedule_type = schedule_type;
    final lOther$schedule_type = other.schedule_type;
    if (l$schedule_type != lOther$schedule_type) {
      return false;
    }
    final l$schedule = schedule;
    final lOther$schedule = other.schedule;
    if (l$schedule != lOther$schedule) {
      return false;
    }
    final l$starts_at = starts_at;
    final lOther$starts_at = other.starts_at;
    if (l$starts_at != lOther$starts_at) {
      return false;
    }
    final l$ends_at = ends_at;
    final lOther$ends_at = other.ends_at;
    if (l$ends_at != lOther$ends_at) {
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

extension UtilityExtension$Query$getBusinessCart$business_cart$items$event
    on Query$getBusinessCart$business_cart$items$event {
  CopyWith$Query$getBusinessCart$business_cart$items$event<
          Query$getBusinessCart$business_cart$items$event>
      get copyWith => CopyWith$Query$getBusinessCart$business_cart$items$event(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessCart$business_cart$items$event<TRes> {
  factory CopyWith$Query$getBusinessCart$business_cart$items$event(
    Query$getBusinessCart$business_cart$items$event instance,
    TRes Function(Query$getBusinessCart$business_cart$items$event) then,
  ) = _CopyWithImpl$Query$getBusinessCart$business_cart$items$event;

  factory CopyWith$Query$getBusinessCart$business_cart$items$event.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$event;

  TRes call({
    int? id,
    Query$getBusinessCart$business_cart$items$event$business? business,
    Query$getBusinessCart$business_cart$items$event$details? details,
    String? schedule_type,
    dynamic? schedule,
    String? starts_at,
    String? ends_at,
    String? $__typename,
  });
  CopyWith$Query$getBusinessCart$business_cart$items$event$business<TRes>
      get business;
  CopyWith$Query$getBusinessCart$business_cart$items$event$details<TRes>
      get details;
}

class _CopyWithImpl$Query$getBusinessCart$business_cart$items$event<TRes>
    implements CopyWith$Query$getBusinessCart$business_cart$items$event<TRes> {
  _CopyWithImpl$Query$getBusinessCart$business_cart$items$event(
    this._instance,
    this._then,
  );

  final Query$getBusinessCart$business_cart$items$event _instance;

  final TRes Function(Query$getBusinessCart$business_cart$items$event) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? business = _undefined,
    Object? details = _undefined,
    Object? schedule_type = _undefined,
    Object? schedule = _undefined,
    Object? starts_at = _undefined,
    Object? ends_at = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getBusinessCart$business_cart$items$event(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        business: business == _undefined || business == null
            ? _instance.business
            : (business
                as Query$getBusinessCart$business_cart$items$event$business),
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Query$getBusinessCart$business_cart$items$event$details),
        schedule_type: schedule_type == _undefined || schedule_type == null
            ? _instance.schedule_type
            : (schedule_type as String),
        schedule: schedule == _undefined
            ? _instance.schedule
            : (schedule as dynamic?),
        starts_at: starts_at == _undefined
            ? _instance.starts_at
            : (starts_at as String?),
        ends_at:
            ends_at == _undefined ? _instance.ends_at : (ends_at as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getBusinessCart$business_cart$items$event$business<TRes>
      get business {
    final local$business = _instance.business;
    return CopyWith$Query$getBusinessCart$business_cart$items$event$business(
        local$business, (e) => call(business: e));
  }

  CopyWith$Query$getBusinessCart$business_cart$items$event$details<TRes>
      get details {
    final local$details = _instance.details;
    return CopyWith$Query$getBusinessCart$business_cart$items$event$details(
        local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$event<TRes>
    implements CopyWith$Query$getBusinessCart$business_cart$items$event<TRes> {
  _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$event(this._res);

  TRes _res;

  call({
    int? id,
    Query$getBusinessCart$business_cart$items$event$business? business,
    Query$getBusinessCart$business_cart$items$event$details? details,
    String? schedule_type,
    dynamic? schedule,
    String? starts_at,
    String? ends_at,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getBusinessCart$business_cart$items$event$business<TRes>
      get business =>
          CopyWith$Query$getBusinessCart$business_cart$items$event$business
              .stub(_res);
  CopyWith$Query$getBusinessCart$business_cart$items$event$details<TRes>
      get details =>
          CopyWith$Query$getBusinessCart$business_cart$items$event$details.stub(
              _res);
}

class Query$getBusinessCart$business_cart$items$event$business {
  Query$getBusinessCart$business_cart$items$event$business({
    required this.details,
    required this.$__typename,
  });

  factory Query$getBusinessCart$business_cart$items$event$business.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessCart$business_cart$items$event$business(
      details: Query$getBusinessCart$business_cart$items$event$business$details
          .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getBusinessCart$business_cart$items$event$business$details
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
    if (!(other is Query$getBusinessCart$business_cart$items$event$business) ||
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

extension UtilityExtension$Query$getBusinessCart$business_cart$items$event$business
    on Query$getBusinessCart$business_cart$items$event$business {
  CopyWith$Query$getBusinessCart$business_cart$items$event$business<
          Query$getBusinessCart$business_cart$items$event$business>
      get copyWith =>
          CopyWith$Query$getBusinessCart$business_cart$items$event$business(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessCart$business_cart$items$event$business<
    TRes> {
  factory CopyWith$Query$getBusinessCart$business_cart$items$event$business(
    Query$getBusinessCart$business_cart$items$event$business instance,
    TRes Function(Query$getBusinessCart$business_cart$items$event$business)
        then,
  ) = _CopyWithImpl$Query$getBusinessCart$business_cart$items$event$business;

  factory CopyWith$Query$getBusinessCart$business_cart$items$event$business.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$event$business;

  TRes call({
    Query$getBusinessCart$business_cart$items$event$business$details? details,
    String? $__typename,
  });
  CopyWith$Query$getBusinessCart$business_cart$items$event$business$details<
      TRes> get details;
}

class _CopyWithImpl$Query$getBusinessCart$business_cart$items$event$business<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$event$business<
            TRes> {
  _CopyWithImpl$Query$getBusinessCart$business_cart$items$event$business(
    this._instance,
    this._then,
  );

  final Query$getBusinessCart$business_cart$items$event$business _instance;

  final TRes Function(Query$getBusinessCart$business_cart$items$event$business)
      _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getBusinessCart$business_cart$items$event$business(
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Query$getBusinessCart$business_cart$items$event$business$details),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getBusinessCart$business_cart$items$event$business$details<
      TRes> get details {
    final local$details = _instance.details;
    return CopyWith$Query$getBusinessCart$business_cart$items$event$business$details(
        local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$event$business<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$event$business<
            TRes> {
  _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$event$business(
      this._res);

  TRes _res;

  call({
    Query$getBusinessCart$business_cart$items$event$business$details? details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getBusinessCart$business_cart$items$event$business$details<
          TRes>
      get details =>
          CopyWith$Query$getBusinessCart$business_cart$items$event$business$details
              .stub(_res);
}

class Query$getBusinessCart$business_cart$items$event$business$details {
  Query$getBusinessCart$business_cart$items$event$business$details({
    required this.name,
    required this.currency,
    required this.online_ordering,
    required this.id,
    required this.accepted_payments,
    required this.image,
    required this.$__typename,
  });

  factory Query$getBusinessCart$business_cart$items$event$business$details.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$currency = json['currency'];
    final l$online_ordering = json['online_ordering'];
    final l$id = json['id'];
    final l$accepted_payments = json['accepted_payments'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessCart$business_cart$items$event$business$details(
      name: (l$name as String),
      currency: (l$currency as String),
      online_ordering: (l$online_ordering as bool),
      id: (l$id as int),
      accepted_payments: mapFromJson(l$accepted_payments),
      image: (l$image as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String name;

  final String currency;

  final bool online_ordering;

  final int id;

  final dynamic accepted_payments;

  final String image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$currency = currency;
    _resultData['currency'] = l$currency;
    final l$online_ordering = online_ordering;
    _resultData['online_ordering'] = l$online_ordering;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$accepted_payments = accepted_payments;
    _resultData['accepted_payments'] = mapToJson(l$accepted_payments);
    final l$image = image;
    _resultData['image'] = l$image;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$currency = currency;
    final l$online_ordering = online_ordering;
    final l$id = id;
    final l$accepted_payments = accepted_payments;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$currency,
      l$online_ordering,
      l$id,
      l$accepted_payments,
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
            is Query$getBusinessCart$business_cart$items$event$business$details) ||
        runtimeType != other.runtimeType) {
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
    final l$online_ordering = online_ordering;
    final lOther$online_ordering = other.online_ordering;
    if (l$online_ordering != lOther$online_ordering) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$accepted_payments = accepted_payments;
    final lOther$accepted_payments = other.accepted_payments;
    if (l$accepted_payments != lOther$accepted_payments) {
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

extension UtilityExtension$Query$getBusinessCart$business_cart$items$event$business$details
    on Query$getBusinessCart$business_cart$items$event$business$details {
  CopyWith$Query$getBusinessCart$business_cart$items$event$business$details<
          Query$getBusinessCart$business_cart$items$event$business$details>
      get copyWith =>
          CopyWith$Query$getBusinessCart$business_cart$items$event$business$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessCart$business_cart$items$event$business$details<
    TRes> {
  factory CopyWith$Query$getBusinessCart$business_cart$items$event$business$details(
    Query$getBusinessCart$business_cart$items$event$business$details instance,
    TRes Function(
            Query$getBusinessCart$business_cart$items$event$business$details)
        then,
  ) = _CopyWithImpl$Query$getBusinessCart$business_cart$items$event$business$details;

  factory CopyWith$Query$getBusinessCart$business_cart$items$event$business$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$event$business$details;

  TRes call({
    String? name,
    String? currency,
    bool? online_ordering,
    int? id,
    dynamic? accepted_payments,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getBusinessCart$business_cart$items$event$business$details<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$event$business$details<
            TRes> {
  _CopyWithImpl$Query$getBusinessCart$business_cart$items$event$business$details(
    this._instance,
    this._then,
  );

  final Query$getBusinessCart$business_cart$items$event$business$details
      _instance;

  final TRes Function(
      Query$getBusinessCart$business_cart$items$event$business$details) _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? currency = _undefined,
    Object? online_ordering = _undefined,
    Object? id = _undefined,
    Object? accepted_payments = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getBusinessCart$business_cart$items$event$business$details(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        currency: currency == _undefined || currency == null
            ? _instance.currency
            : (currency as String),
        online_ordering:
            online_ordering == _undefined || online_ordering == null
                ? _instance.online_ordering
                : (online_ordering as bool),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        accepted_payments:
            accepted_payments == _undefined || accepted_payments == null
                ? _instance.accepted_payments
                : (accepted_payments as dynamic),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$event$business$details<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$event$business$details<
            TRes> {
  _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$event$business$details(
      this._res);

  TRes _res;

  call({
    String? name,
    String? currency,
    bool? online_ordering,
    int? id,
    dynamic? accepted_payments,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Query$getBusinessCart$business_cart$items$event$details {
  Query$getBusinessCart$business_cart$items$event$details({
    required this.name_id,
    this.description_id,
    required this.id,
    required this.name,
    this.additional_parameters,
    required this.available,
    required this.category1,
    required this.category2,
    required this.cost,
    this.image,
    required this.position,
    required this.tags,
    required this.$__typename,
  });

  factory Query$getBusinessCart$business_cart$items$event$details.fromJson(
      Map<String, dynamic> json) {
    final l$name_id = json['name_id'];
    final l$description_id = json['description_id'];
    final l$id = json['id'];
    final l$name = json['name'];
    final l$additional_parameters = json['additional_parameters'];
    final l$available = json['available'];
    final l$category1 = json['category1'];
    final l$category2 = json['category2'];
    final l$cost = json['cost'];
    final l$image = json['image'];
    final l$position = json['position'];
    final l$tags = json['tags'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessCart$business_cart$items$event$details(
      name_id: (l$name_id as int),
      description_id: (l$description_id as int?),
      id: (l$id as int),
      name:
          Query$getBusinessCart$business_cart$items$event$details$name.fromJson(
              (l$name as Map<String, dynamic>)),
      additional_parameters: l$additional_parameters == null
          ? null
          : mapFromJson(l$additional_parameters),
      available: (l$available as bool),
      category1: (l$category1 as String),
      category2: (l$category2 as String),
      cost: mapFromJson(l$cost),
      image: l$image == null ? null : mapFromJson(l$image),
      position: (l$position as int),
      tags: mapFromJson(l$tags),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int name_id;

  final int? description_id;

  final int id;

  final Query$getBusinessCart$business_cart$items$event$details$name name;

  final dynamic? additional_parameters;

  final bool available;

  final String category1;

  final String category2;

  final dynamic cost;

  final dynamic? image;

  final int position;

  final dynamic tags;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name_id = name_id;
    _resultData['name_id'] = l$name_id;
    final l$description_id = description_id;
    _resultData['description_id'] = l$description_id;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$additional_parameters = additional_parameters;
    _resultData['additional_parameters'] = l$additional_parameters == null
        ? null
        : mapToJson(l$additional_parameters);
    final l$available = available;
    _resultData['available'] = l$available;
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
    final l$name_id = name_id;
    final l$description_id = description_id;
    final l$id = id;
    final l$name = name;
    final l$additional_parameters = additional_parameters;
    final l$available = available;
    final l$category1 = category1;
    final l$category2 = category2;
    final l$cost = cost;
    final l$image = image;
    final l$position = position;
    final l$tags = tags;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name_id,
      l$description_id,
      l$id,
      l$name,
      l$additional_parameters,
      l$available,
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
    if (!(other is Query$getBusinessCart$business_cart$items$event$details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name_id = name_id;
    final lOther$name_id = other.name_id;
    if (l$name_id != lOther$name_id) {
      return false;
    }
    final l$description_id = description_id;
    final lOther$description_id = other.description_id;
    if (l$description_id != lOther$description_id) {
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
    final l$available = available;
    final lOther$available = other.available;
    if (l$available != lOther$available) {
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

extension UtilityExtension$Query$getBusinessCart$business_cart$items$event$details
    on Query$getBusinessCart$business_cart$items$event$details {
  CopyWith$Query$getBusinessCart$business_cart$items$event$details<
          Query$getBusinessCart$business_cart$items$event$details>
      get copyWith =>
          CopyWith$Query$getBusinessCart$business_cart$items$event$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessCart$business_cart$items$event$details<
    TRes> {
  factory CopyWith$Query$getBusinessCart$business_cart$items$event$details(
    Query$getBusinessCart$business_cart$items$event$details instance,
    TRes Function(Query$getBusinessCart$business_cart$items$event$details) then,
  ) = _CopyWithImpl$Query$getBusinessCart$business_cart$items$event$details;

  factory CopyWith$Query$getBusinessCart$business_cart$items$event$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$event$details;

  TRes call({
    int? name_id,
    int? description_id,
    int? id,
    Query$getBusinessCart$business_cart$items$event$details$name? name,
    dynamic? additional_parameters,
    bool? available,
    String? category1,
    String? category2,
    dynamic? cost,
    dynamic? image,
    int? position,
    dynamic? tags,
    String? $__typename,
  });
  CopyWith$Query$getBusinessCart$business_cart$items$event$details$name<TRes>
      get name;
}

class _CopyWithImpl$Query$getBusinessCart$business_cart$items$event$details<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$event$details<TRes> {
  _CopyWithImpl$Query$getBusinessCart$business_cart$items$event$details(
    this._instance,
    this._then,
  );

  final Query$getBusinessCart$business_cart$items$event$details _instance;

  final TRes Function(Query$getBusinessCart$business_cart$items$event$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name_id = _undefined,
    Object? description_id = _undefined,
    Object? id = _undefined,
    Object? name = _undefined,
    Object? additional_parameters = _undefined,
    Object? available = _undefined,
    Object? category1 = _undefined,
    Object? category2 = _undefined,
    Object? cost = _undefined,
    Object? image = _undefined,
    Object? position = _undefined,
    Object? tags = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getBusinessCart$business_cart$items$event$details(
        name_id: name_id == _undefined || name_id == null
            ? _instance.name_id
            : (name_id as int),
        description_id: description_id == _undefined
            ? _instance.description_id
            : (description_id as int?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Query$getBusinessCart$business_cart$items$event$details$name),
        additional_parameters: additional_parameters == _undefined
            ? _instance.additional_parameters
            : (additional_parameters as dynamic?),
        available: available == _undefined || available == null
            ? _instance.available
            : (available as bool),
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
  CopyWith$Query$getBusinessCart$business_cart$items$event$details$name<TRes>
      get name {
    final local$name = _instance.name;
    return CopyWith$Query$getBusinessCart$business_cart$items$event$details$name(
        local$name, (e) => call(name: e));
  }
}

class _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$event$details<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$event$details<TRes> {
  _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$event$details(
      this._res);

  TRes _res;

  call({
    int? name_id,
    int? description_id,
    int? id,
    Query$getBusinessCart$business_cart$items$event$details$name? name,
    dynamic? additional_parameters,
    bool? available,
    String? category1,
    String? category2,
    dynamic? cost,
    dynamic? image,
    int? position,
    dynamic? tags,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getBusinessCart$business_cart$items$event$details$name<TRes>
      get name =>
          CopyWith$Query$getBusinessCart$business_cart$items$event$details$name
              .stub(_res);
}

class Query$getBusinessCart$business_cart$items$event$details$name {
  Query$getBusinessCart$business_cart$items$event$details$name({
    required this.translations,
    required this.$__typename,
  });

  factory Query$getBusinessCart$business_cart$items$event$details$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessCart$business_cart$items$event$details$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getBusinessCart$business_cart$items$event$details$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$getBusinessCart$business_cart$items$event$details$name$translations>
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
            is Query$getBusinessCart$business_cart$items$event$details$name) ||
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

extension UtilityExtension$Query$getBusinessCart$business_cart$items$event$details$name
    on Query$getBusinessCart$business_cart$items$event$details$name {
  CopyWith$Query$getBusinessCart$business_cart$items$event$details$name<
          Query$getBusinessCart$business_cart$items$event$details$name>
      get copyWith =>
          CopyWith$Query$getBusinessCart$business_cart$items$event$details$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessCart$business_cart$items$event$details$name<
    TRes> {
  factory CopyWith$Query$getBusinessCart$business_cart$items$event$details$name(
    Query$getBusinessCart$business_cart$items$event$details$name instance,
    TRes Function(Query$getBusinessCart$business_cart$items$event$details$name)
        then,
  ) = _CopyWithImpl$Query$getBusinessCart$business_cart$items$event$details$name;

  factory CopyWith$Query$getBusinessCart$business_cart$items$event$details$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$event$details$name;

  TRes call({
    List<Query$getBusinessCart$business_cart$items$event$details$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getBusinessCart$business_cart$items$event$details$name$translations> Function(
              Iterable<
                  CopyWith$Query$getBusinessCart$business_cart$items$event$details$name$translations<
                      Query$getBusinessCart$business_cart$items$event$details$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getBusinessCart$business_cart$items$event$details$name<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$event$details$name<
            TRes> {
  _CopyWithImpl$Query$getBusinessCart$business_cart$items$event$details$name(
    this._instance,
    this._then,
  );

  final Query$getBusinessCart$business_cart$items$event$details$name _instance;

  final TRes Function(
      Query$getBusinessCart$business_cart$items$event$details$name) _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getBusinessCart$business_cart$items$event$details$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getBusinessCart$business_cart$items$event$details$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getBusinessCart$business_cart$items$event$details$name$translations> Function(
                  Iterable<
                      CopyWith$Query$getBusinessCart$business_cart$items$event$details$name$translations<
                          Query$getBusinessCart$business_cart$items$event$details$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getBusinessCart$business_cart$items$event$details$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$event$details$name<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$event$details$name<
            TRes> {
  _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$event$details$name(
      this._res);

  TRes _res;

  call({
    List<Query$getBusinessCart$business_cart$items$event$details$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getBusinessCart$business_cart$items$event$details$name$translations {
  Query$getBusinessCart$business_cart$items$event$details$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getBusinessCart$business_cart$items$event$details$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessCart$business_cart$items$event$details$name$translations(
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
            is Query$getBusinessCart$business_cart$items$event$details$name$translations) ||
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

extension UtilityExtension$Query$getBusinessCart$business_cart$items$event$details$name$translations
    on Query$getBusinessCart$business_cart$items$event$details$name$translations {
  CopyWith$Query$getBusinessCart$business_cart$items$event$details$name$translations<
          Query$getBusinessCart$business_cart$items$event$details$name$translations>
      get copyWith =>
          CopyWith$Query$getBusinessCart$business_cart$items$event$details$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessCart$business_cart$items$event$details$name$translations<
    TRes> {
  factory CopyWith$Query$getBusinessCart$business_cart$items$event$details$name$translations(
    Query$getBusinessCart$business_cart$items$event$details$name$translations
        instance,
    TRes Function(
            Query$getBusinessCart$business_cart$items$event$details$name$translations)
        then,
  ) = _CopyWithImpl$Query$getBusinessCart$business_cart$items$event$details$name$translations;

  factory CopyWith$Query$getBusinessCart$business_cart$items$event$details$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$event$details$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getBusinessCart$business_cart$items$event$details$name$translations<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$event$details$name$translations<
            TRes> {
  _CopyWithImpl$Query$getBusinessCart$business_cart$items$event$details$name$translations(
    this._instance,
    this._then,
  );

  final Query$getBusinessCart$business_cart$items$event$details$name$translations
      _instance;

  final TRes Function(
          Query$getBusinessCart$business_cart$items$event$details$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getBusinessCart$business_cart$items$event$details$name$translations(
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

class _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$event$details$name$translations<
        TRes>
    implements
        CopyWith$Query$getBusinessCart$business_cart$items$event$details$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$getBusinessCart$business_cart$items$event$details$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$insert_business_cart {
  factory Variables$Mutation$insert_business_cart(
          {required Input$business_cart_insert_input cart}) =>
      Variables$Mutation$insert_business_cart._({
        r'cart': cart,
      });

  Variables$Mutation$insert_business_cart._(this._$data);

  factory Variables$Mutation$insert_business_cart.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$cart = data['cart'];
    result$data['cart'] = Input$business_cart_insert_input.fromJson(
        (l$cart as Map<String, dynamic>));
    return Variables$Mutation$insert_business_cart._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$business_cart_insert_input get cart =>
      (_$data['cart'] as Input$business_cart_insert_input);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$cart = cart;
    result$data['cart'] = l$cart.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$insert_business_cart<
          Variables$Mutation$insert_business_cart>
      get copyWith => CopyWith$Variables$Mutation$insert_business_cart(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$insert_business_cart) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$cart = cart;
    final lOther$cart = other.cart;
    if (l$cart != lOther$cart) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$cart = cart;
    return Object.hashAll([l$cart]);
  }
}

abstract class CopyWith$Variables$Mutation$insert_business_cart<TRes> {
  factory CopyWith$Variables$Mutation$insert_business_cart(
    Variables$Mutation$insert_business_cart instance,
    TRes Function(Variables$Mutation$insert_business_cart) then,
  ) = _CopyWithImpl$Variables$Mutation$insert_business_cart;

  factory CopyWith$Variables$Mutation$insert_business_cart.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$insert_business_cart;

  TRes call({Input$business_cart_insert_input? cart});
}

class _CopyWithImpl$Variables$Mutation$insert_business_cart<TRes>
    implements CopyWith$Variables$Mutation$insert_business_cart<TRes> {
  _CopyWithImpl$Variables$Mutation$insert_business_cart(
    this._instance,
    this._then,
  );

  final Variables$Mutation$insert_business_cart _instance;

  final TRes Function(Variables$Mutation$insert_business_cart) _then;

  static const _undefined = {};

  TRes call({Object? cart = _undefined}) =>
      _then(Variables$Mutation$insert_business_cart._({
        ..._instance._$data,
        if (cart != _undefined && cart != null)
          'cart': (cart as Input$business_cart_insert_input),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$insert_business_cart<TRes>
    implements CopyWith$Variables$Mutation$insert_business_cart<TRes> {
  _CopyWithStubImpl$Variables$Mutation$insert_business_cart(this._res);

  TRes _res;

  call({Input$business_cart_insert_input? cart}) => _res;
}

class Mutation$insert_business_cart {
  Mutation$insert_business_cart({
    this.insert_business_cart_one,
    required this.$__typename,
  });

  factory Mutation$insert_business_cart.fromJson(Map<String, dynamic> json) {
    final l$insert_business_cart_one = json['insert_business_cart_one'];
    final l$$__typename = json['__typename'];
    return Mutation$insert_business_cart(
      insert_business_cart_one: l$insert_business_cart_one == null
          ? null
          : Mutation$insert_business_cart$insert_business_cart_one.fromJson(
              (l$insert_business_cart_one as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$insert_business_cart$insert_business_cart_one?
      insert_business_cart_one;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insert_business_cart_one = insert_business_cart_one;
    _resultData['insert_business_cart_one'] =
        l$insert_business_cart_one?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insert_business_cart_one = insert_business_cart_one;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$insert_business_cart_one,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$insert_business_cart) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$insert_business_cart_one = insert_business_cart_one;
    final lOther$insert_business_cart_one = other.insert_business_cart_one;
    if (l$insert_business_cart_one != lOther$insert_business_cart_one) {
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

extension UtilityExtension$Mutation$insert_business_cart
    on Mutation$insert_business_cart {
  CopyWith$Mutation$insert_business_cart<Mutation$insert_business_cart>
      get copyWith => CopyWith$Mutation$insert_business_cart(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$insert_business_cart<TRes> {
  factory CopyWith$Mutation$insert_business_cart(
    Mutation$insert_business_cart instance,
    TRes Function(Mutation$insert_business_cart) then,
  ) = _CopyWithImpl$Mutation$insert_business_cart;

  factory CopyWith$Mutation$insert_business_cart.stub(TRes res) =
      _CopyWithStubImpl$Mutation$insert_business_cart;

  TRes call({
    Mutation$insert_business_cart$insert_business_cart_one?
        insert_business_cart_one,
    String? $__typename,
  });
  CopyWith$Mutation$insert_business_cart$insert_business_cart_one<TRes>
      get insert_business_cart_one;
}

class _CopyWithImpl$Mutation$insert_business_cart<TRes>
    implements CopyWith$Mutation$insert_business_cart<TRes> {
  _CopyWithImpl$Mutation$insert_business_cart(
    this._instance,
    this._then,
  );

  final Mutation$insert_business_cart _instance;

  final TRes Function(Mutation$insert_business_cart) _then;

  static const _undefined = {};

  TRes call({
    Object? insert_business_cart_one = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$insert_business_cart(
        insert_business_cart_one: insert_business_cart_one == _undefined
            ? _instance.insert_business_cart_one
            : (insert_business_cart_one
                as Mutation$insert_business_cart$insert_business_cart_one?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$insert_business_cart$insert_business_cart_one<TRes>
      get insert_business_cart_one {
    final local$insert_business_cart_one = _instance.insert_business_cart_one;
    return local$insert_business_cart_one == null
        ? CopyWith$Mutation$insert_business_cart$insert_business_cart_one.stub(
            _then(_instance))
        : CopyWith$Mutation$insert_business_cart$insert_business_cart_one(
            local$insert_business_cart_one,
            (e) => call(insert_business_cart_one: e));
  }
}

class _CopyWithStubImpl$Mutation$insert_business_cart<TRes>
    implements CopyWith$Mutation$insert_business_cart<TRes> {
  _CopyWithStubImpl$Mutation$insert_business_cart(this._res);

  TRes _res;

  call({
    Mutation$insert_business_cart$insert_business_cart_one?
        insert_business_cart_one,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$insert_business_cart$insert_business_cart_one<TRes>
      get insert_business_cart_one =>
          CopyWith$Mutation$insert_business_cart$insert_business_cart_one.stub(
              _res);
}

const documentNodeMutationinsert_business_cart = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'insert_business_cart'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'cart')),
        type: NamedTypeNode(
          name: NameNode(value: 'business_cart_insert_input'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'insert_business_cart_one'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'object'),
            value: VariableNode(name: NameNode(value: 'cart')),
          ),
          ArgumentNode(
            name: NameNode(value: 'on_conflict'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'constraint'),
                value: EnumValueNode(name: NameNode(value: 'cart_pkey')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'update_columns'),
                value: EnumValueNode(name: NameNode(value: 'business_id')),
              ),
            ]),
          ),
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
            name: NameNode(value: 'business_id'),
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
Mutation$insert_business_cart _parserFn$Mutation$insert_business_cart(
        Map<String, dynamic> data) =>
    Mutation$insert_business_cart.fromJson(data);
typedef OnMutationCompleted$Mutation$insert_business_cart = FutureOr<void>
    Function(
  dynamic,
  Mutation$insert_business_cart?,
);

class Options$Mutation$insert_business_cart
    extends graphql.MutationOptions<Mutation$insert_business_cart> {
  Options$Mutation$insert_business_cart({
    String? operationName,
    required Variables$Mutation$insert_business_cart variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$insert_business_cart? onCompleted,
    graphql.OnMutationUpdate<Mutation$insert_business_cart>? update,
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
                        : _parserFn$Mutation$insert_business_cart(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationinsert_business_cart,
          parserFn: _parserFn$Mutation$insert_business_cart,
        );

  final OnMutationCompleted$Mutation$insert_business_cart?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$insert_business_cart
    extends graphql.WatchQueryOptions<Mutation$insert_business_cart> {
  WatchOptions$Mutation$insert_business_cart({
    String? operationName,
    required Variables$Mutation$insert_business_cart variables,
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
          document: documentNodeMutationinsert_business_cart,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$insert_business_cart,
        );
}

extension ClientExtension$Mutation$insert_business_cart
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$insert_business_cart>>
      mutate$insert_business_cart(
              Options$Mutation$insert_business_cart options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$insert_business_cart>
      watchMutation$insert_business_cart(
              WatchOptions$Mutation$insert_business_cart options) =>
          this.watchMutation(options);
}

class Mutation$insert_business_cart$insert_business_cart_one {
  Mutation$insert_business_cart$insert_business_cart_one({
    required this.customer_id,
    this.business_id,
    required this.$__typename,
  });

  factory Mutation$insert_business_cart$insert_business_cart_one.fromJson(
      Map<String, dynamic> json) {
    final l$customer_id = json['customer_id'];
    final l$business_id = json['business_id'];
    final l$$__typename = json['__typename'];
    return Mutation$insert_business_cart$insert_business_cart_one(
      customer_id: (l$customer_id as int),
      business_id: (l$business_id as int?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int customer_id;

  final int? business_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$customer_id = customer_id;
    _resultData['customer_id'] = l$customer_id;
    final l$business_id = business_id;
    _resultData['business_id'] = l$business_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$customer_id = customer_id;
    final l$business_id = business_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$customer_id,
      l$business_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$insert_business_cart$insert_business_cart_one) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$customer_id = customer_id;
    final lOther$customer_id = other.customer_id;
    if (l$customer_id != lOther$customer_id) {
      return false;
    }
    final l$business_id = business_id;
    final lOther$business_id = other.business_id;
    if (l$business_id != lOther$business_id) {
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

extension UtilityExtension$Mutation$insert_business_cart$insert_business_cart_one
    on Mutation$insert_business_cart$insert_business_cart_one {
  CopyWith$Mutation$insert_business_cart$insert_business_cart_one<
          Mutation$insert_business_cart$insert_business_cart_one>
      get copyWith =>
          CopyWith$Mutation$insert_business_cart$insert_business_cart_one(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$insert_business_cart$insert_business_cart_one<
    TRes> {
  factory CopyWith$Mutation$insert_business_cart$insert_business_cart_one(
    Mutation$insert_business_cart$insert_business_cart_one instance,
    TRes Function(Mutation$insert_business_cart$insert_business_cart_one) then,
  ) = _CopyWithImpl$Mutation$insert_business_cart$insert_business_cart_one;

  factory CopyWith$Mutation$insert_business_cart$insert_business_cart_one.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$insert_business_cart$insert_business_cart_one;

  TRes call({
    int? customer_id,
    int? business_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$insert_business_cart$insert_business_cart_one<TRes>
    implements
        CopyWith$Mutation$insert_business_cart$insert_business_cart_one<TRes> {
  _CopyWithImpl$Mutation$insert_business_cart$insert_business_cart_one(
    this._instance,
    this._then,
  );

  final Mutation$insert_business_cart$insert_business_cart_one _instance;

  final TRes Function(Mutation$insert_business_cart$insert_business_cart_one)
      _then;

  static const _undefined = {};

  TRes call({
    Object? customer_id = _undefined,
    Object? business_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$insert_business_cart$insert_business_cart_one(
        customer_id: customer_id == _undefined || customer_id == null
            ? _instance.customer_id
            : (customer_id as int),
        business_id: business_id == _undefined
            ? _instance.business_id
            : (business_id as int?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$insert_business_cart$insert_business_cart_one<
        TRes>
    implements
        CopyWith$Mutation$insert_business_cart$insert_business_cart_one<TRes> {
  _CopyWithStubImpl$Mutation$insert_business_cart$insert_business_cart_one(
      this._res);

  TRes _res;

  call({
    int? customer_id,
    int? business_id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$addItemToBusinessCart {
  factory Variables$Mutation$addItemToBusinessCart(
          {required Input$business_cart_item_insert_input item}) =>
      Variables$Mutation$addItemToBusinessCart._({
        r'item': item,
      });

  Variables$Mutation$addItemToBusinessCart._(this._$data);

  factory Variables$Mutation$addItemToBusinessCart.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$item = data['item'];
    result$data['item'] = Input$business_cart_item_insert_input.fromJson(
        (l$item as Map<String, dynamic>));
    return Variables$Mutation$addItemToBusinessCart._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$business_cart_item_insert_input get item =>
      (_$data['item'] as Input$business_cart_item_insert_input);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$item = item;
    result$data['item'] = l$item.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$addItemToBusinessCart<
          Variables$Mutation$addItemToBusinessCart>
      get copyWith => CopyWith$Variables$Mutation$addItemToBusinessCart(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$addItemToBusinessCart) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$item = item;
    final lOther$item = other.item;
    if (l$item != lOther$item) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$item = item;
    return Object.hashAll([l$item]);
  }
}

abstract class CopyWith$Variables$Mutation$addItemToBusinessCart<TRes> {
  factory CopyWith$Variables$Mutation$addItemToBusinessCart(
    Variables$Mutation$addItemToBusinessCart instance,
    TRes Function(Variables$Mutation$addItemToBusinessCart) then,
  ) = _CopyWithImpl$Variables$Mutation$addItemToBusinessCart;

  factory CopyWith$Variables$Mutation$addItemToBusinessCart.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$addItemToBusinessCart;

  TRes call({Input$business_cart_item_insert_input? item});
}

class _CopyWithImpl$Variables$Mutation$addItemToBusinessCart<TRes>
    implements CopyWith$Variables$Mutation$addItemToBusinessCart<TRes> {
  _CopyWithImpl$Variables$Mutation$addItemToBusinessCart(
    this._instance,
    this._then,
  );

  final Variables$Mutation$addItemToBusinessCart _instance;

  final TRes Function(Variables$Mutation$addItemToBusinessCart) _then;

  static const _undefined = {};

  TRes call({Object? item = _undefined}) =>
      _then(Variables$Mutation$addItemToBusinessCart._({
        ..._instance._$data,
        if (item != _undefined && item != null)
          'item': (item as Input$business_cart_item_insert_input),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$addItemToBusinessCart<TRes>
    implements CopyWith$Variables$Mutation$addItemToBusinessCart<TRes> {
  _CopyWithStubImpl$Variables$Mutation$addItemToBusinessCart(this._res);

  TRes _res;

  call({Input$business_cart_item_insert_input? item}) => _res;
}

class Mutation$addItemToBusinessCart {
  Mutation$addItemToBusinessCart({
    this.insert_business_cart_item_one,
    required this.$__typename,
  });

  factory Mutation$addItemToBusinessCart.fromJson(Map<String, dynamic> json) {
    final l$insert_business_cart_item_one =
        json['insert_business_cart_item_one'];
    final l$$__typename = json['__typename'];
    return Mutation$addItemToBusinessCart(
      insert_business_cart_item_one: l$insert_business_cart_item_one == null
          ? null
          : Mutation$addItemToBusinessCart$insert_business_cart_item_one
              .fromJson(
                  (l$insert_business_cart_item_one as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$addItemToBusinessCart$insert_business_cart_item_one?
      insert_business_cart_item_one;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insert_business_cart_item_one = insert_business_cart_item_one;
    _resultData['insert_business_cart_item_one'] =
        l$insert_business_cart_item_one?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insert_business_cart_item_one = insert_business_cart_item_one;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$insert_business_cart_item_one,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$addItemToBusinessCart) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$insert_business_cart_item_one = insert_business_cart_item_one;
    final lOther$insert_business_cart_item_one =
        other.insert_business_cart_item_one;
    if (l$insert_business_cart_item_one !=
        lOther$insert_business_cart_item_one) {
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

extension UtilityExtension$Mutation$addItemToBusinessCart
    on Mutation$addItemToBusinessCart {
  CopyWith$Mutation$addItemToBusinessCart<Mutation$addItemToBusinessCart>
      get copyWith => CopyWith$Mutation$addItemToBusinessCart(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$addItemToBusinessCart<TRes> {
  factory CopyWith$Mutation$addItemToBusinessCart(
    Mutation$addItemToBusinessCart instance,
    TRes Function(Mutation$addItemToBusinessCart) then,
  ) = _CopyWithImpl$Mutation$addItemToBusinessCart;

  factory CopyWith$Mutation$addItemToBusinessCart.stub(TRes res) =
      _CopyWithStubImpl$Mutation$addItemToBusinessCart;

  TRes call({
    Mutation$addItemToBusinessCart$insert_business_cart_item_one?
        insert_business_cart_item_one,
    String? $__typename,
  });
  CopyWith$Mutation$addItemToBusinessCart$insert_business_cart_item_one<TRes>
      get insert_business_cart_item_one;
}

class _CopyWithImpl$Mutation$addItemToBusinessCart<TRes>
    implements CopyWith$Mutation$addItemToBusinessCart<TRes> {
  _CopyWithImpl$Mutation$addItemToBusinessCart(
    this._instance,
    this._then,
  );

  final Mutation$addItemToBusinessCart _instance;

  final TRes Function(Mutation$addItemToBusinessCart) _then;

  static const _undefined = {};

  TRes call({
    Object? insert_business_cart_item_one = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$addItemToBusinessCart(
        insert_business_cart_item_one: insert_business_cart_item_one ==
                _undefined
            ? _instance.insert_business_cart_item_one
            : (insert_business_cart_item_one
                as Mutation$addItemToBusinessCart$insert_business_cart_item_one?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$addItemToBusinessCart$insert_business_cart_item_one<TRes>
      get insert_business_cart_item_one {
    final local$insert_business_cart_item_one =
        _instance.insert_business_cart_item_one;
    return local$insert_business_cart_item_one == null
        ? CopyWith$Mutation$addItemToBusinessCart$insert_business_cart_item_one
            .stub(_then(_instance))
        : CopyWith$Mutation$addItemToBusinessCart$insert_business_cart_item_one(
            local$insert_business_cart_item_one,
            (e) => call(insert_business_cart_item_one: e));
  }
}

class _CopyWithStubImpl$Mutation$addItemToBusinessCart<TRes>
    implements CopyWith$Mutation$addItemToBusinessCart<TRes> {
  _CopyWithStubImpl$Mutation$addItemToBusinessCart(this._res);

  TRes _res;

  call({
    Mutation$addItemToBusinessCart$insert_business_cart_item_one?
        insert_business_cart_item_one,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$addItemToBusinessCart$insert_business_cart_item_one<TRes>
      get insert_business_cart_item_one =>
          CopyWith$Mutation$addItemToBusinessCart$insert_business_cart_item_one
              .stub(_res);
}

const documentNodeMutationaddItemToBusinessCart = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'addItemToBusinessCart'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'item')),
        type: NamedTypeNode(
          name: NameNode(value: 'business_cart_item_insert_input'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'insert_business_cart_item_one'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'object'),
            value: VariableNode(name: NameNode(value: 'item')),
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
            name: NameNode(value: 'customer_id'),
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
            name: NameNode(value: 'parameters'),
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
      
    ]),
  ),
]);
Mutation$addItemToBusinessCart _parserFn$Mutation$addItemToBusinessCart(
        Map<String, dynamic> data) =>
    Mutation$addItemToBusinessCart.fromJson(data);
typedef OnMutationCompleted$Mutation$addItemToBusinessCart = FutureOr<void>
    Function(
  dynamic,
  Mutation$addItemToBusinessCart?,
);

class Options$Mutation$addItemToBusinessCart
    extends graphql.MutationOptions<Mutation$addItemToBusinessCart> {
  Options$Mutation$addItemToBusinessCart({
    String? operationName,
    required Variables$Mutation$addItemToBusinessCart variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$addItemToBusinessCart? onCompleted,
    graphql.OnMutationUpdate<Mutation$addItemToBusinessCart>? update,
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
                        : _parserFn$Mutation$addItemToBusinessCart(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationaddItemToBusinessCart,
          parserFn: _parserFn$Mutation$addItemToBusinessCart,
        );

  final OnMutationCompleted$Mutation$addItemToBusinessCart?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$addItemToBusinessCart
    extends graphql.WatchQueryOptions<Mutation$addItemToBusinessCart> {
  WatchOptions$Mutation$addItemToBusinessCart({
    String? operationName,
    required Variables$Mutation$addItemToBusinessCart variables,
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
          document: documentNodeMutationaddItemToBusinessCart,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$addItemToBusinessCart,
        );
}

extension ClientExtension$Mutation$addItemToBusinessCart
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$addItemToBusinessCart>>
      mutate$addItemToBusinessCart(
              Options$Mutation$addItemToBusinessCart options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$addItemToBusinessCart>
      watchMutation$addItemToBusinessCart(
              WatchOptions$Mutation$addItemToBusinessCart options) =>
          this.watchMutation(options);
}

class Mutation$addItemToBusinessCart$insert_business_cart_item_one {
  Mutation$addItemToBusinessCart$insert_business_cart_item_one({
    required this.id,
    required this.customer_id,
    this.time,
    required this.parameters,
    required this.offering_type,
    required this.item_id,
    required this.cost,
    required this.$__typename,
  });

  factory Mutation$addItemToBusinessCart$insert_business_cart_item_one.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$customer_id = json['customer_id'];
    final l$time = json['time'];
    final l$parameters = json['parameters'];
    final l$offering_type = json['offering_type'];
    final l$item_id = json['item_id'];
    final l$cost = json['cost'];
    final l$$__typename = json['__typename'];
    return Mutation$addItemToBusinessCart$insert_business_cart_item_one(
      id: (l$id as int),
      customer_id: (l$customer_id as int),
      time: (l$time as String?),
      parameters: mapFromJson(l$parameters),
      offering_type: (l$offering_type as String),
      item_id: (l$item_id as int),
      cost: moneyFromJson(l$cost),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final int customer_id;

  final String? time;

  final dynamic parameters;

  final String offering_type;

  final int item_id;

  final double cost;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$customer_id = customer_id;
    _resultData['customer_id'] = l$customer_id;
    final l$time = time;
    _resultData['time'] = l$time;
    final l$parameters = parameters;
    _resultData['parameters'] = mapToJson(l$parameters);
    final l$offering_type = offering_type;
    _resultData['offering_type'] = l$offering_type;
    final l$item_id = item_id;
    _resultData['item_id'] = l$item_id;
    final l$cost = cost;
    _resultData['cost'] = moneyToJson(l$cost);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$customer_id = customer_id;
    final l$time = time;
    final l$parameters = parameters;
    final l$offering_type = offering_type;
    final l$item_id = item_id;
    final l$cost = cost;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$customer_id,
      l$time,
      l$parameters,
      l$offering_type,
      l$item_id,
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
            is Mutation$addItemToBusinessCart$insert_business_cart_item_one) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$customer_id = customer_id;
    final lOther$customer_id = other.customer_id;
    if (l$customer_id != lOther$customer_id) {
      return false;
    }
    final l$time = time;
    final lOther$time = other.time;
    if (l$time != lOther$time) {
      return false;
    }
    final l$parameters = parameters;
    final lOther$parameters = other.parameters;
    if (l$parameters != lOther$parameters) {
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

extension UtilityExtension$Mutation$addItemToBusinessCart$insert_business_cart_item_one
    on Mutation$addItemToBusinessCart$insert_business_cart_item_one {
  CopyWith$Mutation$addItemToBusinessCart$insert_business_cart_item_one<
          Mutation$addItemToBusinessCart$insert_business_cart_item_one>
      get copyWith =>
          CopyWith$Mutation$addItemToBusinessCart$insert_business_cart_item_one(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$addItemToBusinessCart$insert_business_cart_item_one<
    TRes> {
  factory CopyWith$Mutation$addItemToBusinessCart$insert_business_cart_item_one(
    Mutation$addItemToBusinessCart$insert_business_cart_item_one instance,
    TRes Function(Mutation$addItemToBusinessCart$insert_business_cart_item_one)
        then,
  ) = _CopyWithImpl$Mutation$addItemToBusinessCart$insert_business_cart_item_one;

  factory CopyWith$Mutation$addItemToBusinessCart$insert_business_cart_item_one.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$addItemToBusinessCart$insert_business_cart_item_one;

  TRes call({
    int? id,
    int? customer_id,
    String? time,
    dynamic? parameters,
    String? offering_type,
    int? item_id,
    double? cost,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$addItemToBusinessCart$insert_business_cart_item_one<
        TRes>
    implements
        CopyWith$Mutation$addItemToBusinessCart$insert_business_cart_item_one<
            TRes> {
  _CopyWithImpl$Mutation$addItemToBusinessCart$insert_business_cart_item_one(
    this._instance,
    this._then,
  );

  final Mutation$addItemToBusinessCart$insert_business_cart_item_one _instance;

  final TRes Function(
      Mutation$addItemToBusinessCart$insert_business_cart_item_one) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? customer_id = _undefined,
    Object? time = _undefined,
    Object? parameters = _undefined,
    Object? offering_type = _undefined,
    Object? item_id = _undefined,
    Object? cost = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$addItemToBusinessCart$insert_business_cart_item_one(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        customer_id: customer_id == _undefined || customer_id == null
            ? _instance.customer_id
            : (customer_id as int),
        time: time == _undefined ? _instance.time : (time as String?),
        parameters: parameters == _undefined || parameters == null
            ? _instance.parameters
            : (parameters as dynamic),
        offering_type: offering_type == _undefined || offering_type == null
            ? _instance.offering_type
            : (offering_type as String),
        item_id: item_id == _undefined || item_id == null
            ? _instance.item_id
            : (item_id as int),
        cost: cost == _undefined || cost == null
            ? _instance.cost
            : (cost as double),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$addItemToBusinessCart$insert_business_cart_item_one<
        TRes>
    implements
        CopyWith$Mutation$addItemToBusinessCart$insert_business_cart_item_one<
            TRes> {
  _CopyWithStubImpl$Mutation$addItemToBusinessCart$insert_business_cart_item_one(
      this._res);

  TRes _res;

  call({
    int? id,
    int? customer_id,
    String? time,
    dynamic? parameters,
    String? offering_type,
    int? item_id,
    double? cost,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$update_business_cart_item {
  factory Variables$Mutation$update_business_cart_item({
    required int id,
    required double cost,
    required dynamic parameters,
    required String time,
  }) =>
      Variables$Mutation$update_business_cart_item._({
        r'id': id,
        r'cost': cost,
        r'parameters': parameters,
        r'time': time,
      });

  Variables$Mutation$update_business_cart_item._(this._$data);

  factory Variables$Mutation$update_business_cart_item.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    final l$cost = data['cost'];
    result$data['cost'] = moneyFromJson(l$cost);
    final l$parameters = data['parameters'];
    result$data['parameters'] = mapFromJson(l$parameters);
    final l$time = data['time'];
    result$data['time'] = (l$time as String);
    return Variables$Mutation$update_business_cart_item._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  double get cost => (_$data['cost'] as double);
  dynamic get parameters => (_$data['parameters'] as dynamic);
  String get time => (_$data['time'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$cost = cost;
    result$data['cost'] = moneyToJson(l$cost);
    final l$parameters = parameters;
    result$data['parameters'] = mapToJson(l$parameters);
    final l$time = time;
    result$data['time'] = l$time;
    return result$data;
  }

  CopyWith$Variables$Mutation$update_business_cart_item<
          Variables$Mutation$update_business_cart_item>
      get copyWith => CopyWith$Variables$Mutation$update_business_cart_item(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$update_business_cart_item) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$cost = cost;
    final lOther$cost = other.cost;
    if (l$cost != lOther$cost) {
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
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$cost = cost;
    final l$parameters = parameters;
    final l$time = time;
    return Object.hashAll([
      l$id,
      l$cost,
      l$parameters,
      l$time,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$update_business_cart_item<TRes> {
  factory CopyWith$Variables$Mutation$update_business_cart_item(
    Variables$Mutation$update_business_cart_item instance,
    TRes Function(Variables$Mutation$update_business_cart_item) then,
  ) = _CopyWithImpl$Variables$Mutation$update_business_cart_item;

  factory CopyWith$Variables$Mutation$update_business_cart_item.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$update_business_cart_item;

  TRes call({
    int? id,
    double? cost,
    dynamic? parameters,
    String? time,
  });
}

class _CopyWithImpl$Variables$Mutation$update_business_cart_item<TRes>
    implements CopyWith$Variables$Mutation$update_business_cart_item<TRes> {
  _CopyWithImpl$Variables$Mutation$update_business_cart_item(
    this._instance,
    this._then,
  );

  final Variables$Mutation$update_business_cart_item _instance;

  final TRes Function(Variables$Mutation$update_business_cart_item) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? cost = _undefined,
    Object? parameters = _undefined,
    Object? time = _undefined,
  }) =>
      _then(Variables$Mutation$update_business_cart_item._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
        if (cost != _undefined && cost != null) 'cost': (cost as double),
        if (parameters != _undefined && parameters != null)
          'parameters': (parameters as dynamic),
        if (time != _undefined && time != null) 'time': (time as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$update_business_cart_item<TRes>
    implements CopyWith$Variables$Mutation$update_business_cart_item<TRes> {
  _CopyWithStubImpl$Variables$Mutation$update_business_cart_item(this._res);

  TRes _res;

  call({
    int? id,
    double? cost,
    dynamic? parameters,
    String? time,
  }) =>
      _res;
}

class Mutation$update_business_cart_item {
  Mutation$update_business_cart_item({
    this.update_business_cart_item_by_pk,
    required this.$__typename,
  });

  factory Mutation$update_business_cart_item.fromJson(
      Map<String, dynamic> json) {
    final l$update_business_cart_item_by_pk =
        json['update_business_cart_item_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$update_business_cart_item(
      update_business_cart_item_by_pk: l$update_business_cart_item_by_pk == null
          ? null
          : Mutation$update_business_cart_item$update_business_cart_item_by_pk
              .fromJson(
                  (l$update_business_cart_item_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$update_business_cart_item$update_business_cart_item_by_pk?
      update_business_cart_item_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_business_cart_item_by_pk = update_business_cart_item_by_pk;
    _resultData['update_business_cart_item_by_pk'] =
        l$update_business_cart_item_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_business_cart_item_by_pk = update_business_cart_item_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_business_cart_item_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$update_business_cart_item) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_business_cart_item_by_pk = update_business_cart_item_by_pk;
    final lOther$update_business_cart_item_by_pk =
        other.update_business_cart_item_by_pk;
    if (l$update_business_cart_item_by_pk !=
        lOther$update_business_cart_item_by_pk) {
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

extension UtilityExtension$Mutation$update_business_cart_item
    on Mutation$update_business_cart_item {
  CopyWith$Mutation$update_business_cart_item<
          Mutation$update_business_cart_item>
      get copyWith => CopyWith$Mutation$update_business_cart_item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$update_business_cart_item<TRes> {
  factory CopyWith$Mutation$update_business_cart_item(
    Mutation$update_business_cart_item instance,
    TRes Function(Mutation$update_business_cart_item) then,
  ) = _CopyWithImpl$Mutation$update_business_cart_item;

  factory CopyWith$Mutation$update_business_cart_item.stub(TRes res) =
      _CopyWithStubImpl$Mutation$update_business_cart_item;

  TRes call({
    Mutation$update_business_cart_item$update_business_cart_item_by_pk?
        update_business_cart_item_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$update_business_cart_item$update_business_cart_item_by_pk<
      TRes> get update_business_cart_item_by_pk;
}

class _CopyWithImpl$Mutation$update_business_cart_item<TRes>
    implements CopyWith$Mutation$update_business_cart_item<TRes> {
  _CopyWithImpl$Mutation$update_business_cart_item(
    this._instance,
    this._then,
  );

  final Mutation$update_business_cart_item _instance;

  final TRes Function(Mutation$update_business_cart_item) _then;

  static const _undefined = {};

  TRes call({
    Object? update_business_cart_item_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$update_business_cart_item(
        update_business_cart_item_by_pk: update_business_cart_item_by_pk ==
                _undefined
            ? _instance.update_business_cart_item_by_pk
            : (update_business_cart_item_by_pk
                as Mutation$update_business_cart_item$update_business_cart_item_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$update_business_cart_item$update_business_cart_item_by_pk<
      TRes> get update_business_cart_item_by_pk {
    final local$update_business_cart_item_by_pk =
        _instance.update_business_cart_item_by_pk;
    return local$update_business_cart_item_by_pk == null
        ? CopyWith$Mutation$update_business_cart_item$update_business_cart_item_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$update_business_cart_item$update_business_cart_item_by_pk(
            local$update_business_cart_item_by_pk,
            (e) => call(update_business_cart_item_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$update_business_cart_item<TRes>
    implements CopyWith$Mutation$update_business_cart_item<TRes> {
  _CopyWithStubImpl$Mutation$update_business_cart_item(this._res);

  TRes _res;

  call({
    Mutation$update_business_cart_item$update_business_cart_item_by_pk?
        update_business_cart_item_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$update_business_cart_item$update_business_cart_item_by_pk<
          TRes>
      get update_business_cart_item_by_pk =>
          CopyWith$Mutation$update_business_cart_item$update_business_cart_item_by_pk
              .stub(_res);
}

const documentNodeMutationupdate_business_cart_item =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'update_business_cart_item'),
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
        variable: VariableNode(name: NameNode(value: 'cost')),
        type: NamedTypeNode(
          name: NameNode(value: 'money'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'parameters')),
        type: NamedTypeNode(
          name: NameNode(value: 'jsonb'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'time')),
        type: NamedTypeNode(
          name: NameNode(value: 'timestamp'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'update_business_cart_item_by_pk'),
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
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'cost'),
                value: VariableNode(name: NameNode(value: 'cost')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'parameters'),
                value: VariableNode(name: NameNode(value: 'parameters')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'time'),
                value: VariableNode(name: NameNode(value: 'time')),
              ),
            ]),
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
Mutation$update_business_cart_item _parserFn$Mutation$update_business_cart_item(
        Map<String, dynamic> data) =>
    Mutation$update_business_cart_item.fromJson(data);
typedef OnMutationCompleted$Mutation$update_business_cart_item = FutureOr<void>
    Function(
  dynamic,
  Mutation$update_business_cart_item?,
);

class Options$Mutation$update_business_cart_item
    extends graphql.MutationOptions<Mutation$update_business_cart_item> {
  Options$Mutation$update_business_cart_item({
    String? operationName,
    required Variables$Mutation$update_business_cart_item variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$update_business_cart_item? onCompleted,
    graphql.OnMutationUpdate<Mutation$update_business_cart_item>? update,
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
                        : _parserFn$Mutation$update_business_cart_item(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdate_business_cart_item,
          parserFn: _parserFn$Mutation$update_business_cart_item,
        );

  final OnMutationCompleted$Mutation$update_business_cart_item?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$update_business_cart_item
    extends graphql.WatchQueryOptions<Mutation$update_business_cart_item> {
  WatchOptions$Mutation$update_business_cart_item({
    String? operationName,
    required Variables$Mutation$update_business_cart_item variables,
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
          document: documentNodeMutationupdate_business_cart_item,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$update_business_cart_item,
        );
}

extension ClientExtension$Mutation$update_business_cart_item
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$update_business_cart_item>>
      mutate$update_business_cart_item(
              Options$Mutation$update_business_cart_item options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$update_business_cart_item>
      watchMutation$update_business_cart_item(
              WatchOptions$Mutation$update_business_cart_item options) =>
          this.watchMutation(options);
}

class Mutation$update_business_cart_item$update_business_cart_item_by_pk {
  Mutation$update_business_cart_item$update_business_cart_item_by_pk({
    required this.id,
    required this.$__typename,
  });

  factory Mutation$update_business_cart_item$update_business_cart_item_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$update_business_cart_item$update_business_cart_item_by_pk(
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
    if (!(other
            is Mutation$update_business_cart_item$update_business_cart_item_by_pk) ||
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

extension UtilityExtension$Mutation$update_business_cart_item$update_business_cart_item_by_pk
    on Mutation$update_business_cart_item$update_business_cart_item_by_pk {
  CopyWith$Mutation$update_business_cart_item$update_business_cart_item_by_pk<
          Mutation$update_business_cart_item$update_business_cart_item_by_pk>
      get copyWith =>
          CopyWith$Mutation$update_business_cart_item$update_business_cart_item_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$update_business_cart_item$update_business_cart_item_by_pk<
    TRes> {
  factory CopyWith$Mutation$update_business_cart_item$update_business_cart_item_by_pk(
    Mutation$update_business_cart_item$update_business_cart_item_by_pk instance,
    TRes Function(
            Mutation$update_business_cart_item$update_business_cart_item_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$update_business_cart_item$update_business_cart_item_by_pk;

  factory CopyWith$Mutation$update_business_cart_item$update_business_cart_item_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$update_business_cart_item$update_business_cart_item_by_pk;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$update_business_cart_item$update_business_cart_item_by_pk<
        TRes>
    implements
        CopyWith$Mutation$update_business_cart_item$update_business_cart_item_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$update_business_cart_item$update_business_cart_item_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$update_business_cart_item$update_business_cart_item_by_pk
      _instance;

  final TRes Function(
      Mutation$update_business_cart_item$update_business_cart_item_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$update_business_cart_item$update_business_cart_item_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$update_business_cart_item$update_business_cart_item_by_pk<
        TRes>
    implements
        CopyWith$Mutation$update_business_cart_item$update_business_cart_item_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$update_business_cart_item$update_business_cart_item_by_pk(
      this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$set_cart_business_id {
  factory Variables$Mutation$set_cart_business_id({
    int? business_id,
    required int customer_id,
  }) =>
      Variables$Mutation$set_cart_business_id._({
        if (business_id != null) r'business_id': business_id,
        r'customer_id': customer_id,
      });

  Variables$Mutation$set_cart_business_id._(this._$data);

  factory Variables$Mutation$set_cart_business_id.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('business_id')) {
      final l$business_id = data['business_id'];
      result$data['business_id'] = (l$business_id as int?);
    }
    final l$customer_id = data['customer_id'];
    result$data['customer_id'] = (l$customer_id as int);
    return Variables$Mutation$set_cart_business_id._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get business_id => (_$data['business_id'] as int?);
  int get customer_id => (_$data['customer_id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('business_id')) {
      final l$business_id = business_id;
      result$data['business_id'] = l$business_id;
    }
    final l$customer_id = customer_id;
    result$data['customer_id'] = l$customer_id;
    return result$data;
  }

  CopyWith$Variables$Mutation$set_cart_business_id<
          Variables$Mutation$set_cart_business_id>
      get copyWith => CopyWith$Variables$Mutation$set_cart_business_id(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$set_cart_business_id) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$business_id = business_id;
    final lOther$business_id = other.business_id;
    if (_$data.containsKey('business_id') !=
        other._$data.containsKey('business_id')) {
      return false;
    }
    if (l$business_id != lOther$business_id) {
      return false;
    }
    final l$customer_id = customer_id;
    final lOther$customer_id = other.customer_id;
    if (l$customer_id != lOther$customer_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$business_id = business_id;
    final l$customer_id = customer_id;
    return Object.hashAll([
      _$data.containsKey('business_id') ? l$business_id : const {},
      l$customer_id,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$set_cart_business_id<TRes> {
  factory CopyWith$Variables$Mutation$set_cart_business_id(
    Variables$Mutation$set_cart_business_id instance,
    TRes Function(Variables$Mutation$set_cart_business_id) then,
  ) = _CopyWithImpl$Variables$Mutation$set_cart_business_id;

  factory CopyWith$Variables$Mutation$set_cart_business_id.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$set_cart_business_id;

  TRes call({
    int? business_id,
    int? customer_id,
  });
}

class _CopyWithImpl$Variables$Mutation$set_cart_business_id<TRes>
    implements CopyWith$Variables$Mutation$set_cart_business_id<TRes> {
  _CopyWithImpl$Variables$Mutation$set_cart_business_id(
    this._instance,
    this._then,
  );

  final Variables$Mutation$set_cart_business_id _instance;

  final TRes Function(Variables$Mutation$set_cart_business_id) _then;

  static const _undefined = {};

  TRes call({
    Object? business_id = _undefined,
    Object? customer_id = _undefined,
  }) =>
      _then(Variables$Mutation$set_cart_business_id._({
        ..._instance._$data,
        if (business_id != _undefined) 'business_id': (business_id as int?),
        if (customer_id != _undefined && customer_id != null)
          'customer_id': (customer_id as int),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$set_cart_business_id<TRes>
    implements CopyWith$Variables$Mutation$set_cart_business_id<TRes> {
  _CopyWithStubImpl$Variables$Mutation$set_cart_business_id(this._res);

  TRes _res;

  call({
    int? business_id,
    int? customer_id,
  }) =>
      _res;
}

class Mutation$set_cart_business_id {
  Mutation$set_cart_business_id({
    this.update_business_cart_by_pk,
    required this.$__typename,
  });

  factory Mutation$set_cart_business_id.fromJson(Map<String, dynamic> json) {
    final l$update_business_cart_by_pk = json['update_business_cart_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$set_cart_business_id(
      update_business_cart_by_pk: l$update_business_cart_by_pk == null
          ? null
          : Mutation$set_cart_business_id$update_business_cart_by_pk.fromJson(
              (l$update_business_cart_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$set_cart_business_id$update_business_cart_by_pk?
      update_business_cart_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_business_cart_by_pk = update_business_cart_by_pk;
    _resultData['update_business_cart_by_pk'] =
        l$update_business_cart_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_business_cart_by_pk = update_business_cart_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_business_cart_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$set_cart_business_id) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_business_cart_by_pk = update_business_cart_by_pk;
    final lOther$update_business_cart_by_pk = other.update_business_cart_by_pk;
    if (l$update_business_cart_by_pk != lOther$update_business_cart_by_pk) {
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

extension UtilityExtension$Mutation$set_cart_business_id
    on Mutation$set_cart_business_id {
  CopyWith$Mutation$set_cart_business_id<Mutation$set_cart_business_id>
      get copyWith => CopyWith$Mutation$set_cart_business_id(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$set_cart_business_id<TRes> {
  factory CopyWith$Mutation$set_cart_business_id(
    Mutation$set_cart_business_id instance,
    TRes Function(Mutation$set_cart_business_id) then,
  ) = _CopyWithImpl$Mutation$set_cart_business_id;

  factory CopyWith$Mutation$set_cart_business_id.stub(TRes res) =
      _CopyWithStubImpl$Mutation$set_cart_business_id;

  TRes call({
    Mutation$set_cart_business_id$update_business_cart_by_pk?
        update_business_cart_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$set_cart_business_id$update_business_cart_by_pk<TRes>
      get update_business_cart_by_pk;
}

class _CopyWithImpl$Mutation$set_cart_business_id<TRes>
    implements CopyWith$Mutation$set_cart_business_id<TRes> {
  _CopyWithImpl$Mutation$set_cart_business_id(
    this._instance,
    this._then,
  );

  final Mutation$set_cart_business_id _instance;

  final TRes Function(Mutation$set_cart_business_id) _then;

  static const _undefined = {};

  TRes call({
    Object? update_business_cart_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$set_cart_business_id(
        update_business_cart_by_pk: update_business_cart_by_pk == _undefined
            ? _instance.update_business_cart_by_pk
            : (update_business_cart_by_pk
                as Mutation$set_cart_business_id$update_business_cart_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$set_cart_business_id$update_business_cart_by_pk<TRes>
      get update_business_cart_by_pk {
    final local$update_business_cart_by_pk =
        _instance.update_business_cart_by_pk;
    return local$update_business_cart_by_pk == null
        ? CopyWith$Mutation$set_cart_business_id$update_business_cart_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$set_cart_business_id$update_business_cart_by_pk(
            local$update_business_cart_by_pk,
            (e) => call(update_business_cart_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$set_cart_business_id<TRes>
    implements CopyWith$Mutation$set_cart_business_id<TRes> {
  _CopyWithStubImpl$Mutation$set_cart_business_id(this._res);

  TRes _res;

  call({
    Mutation$set_cart_business_id$update_business_cart_by_pk?
        update_business_cart_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$set_cart_business_id$update_business_cart_by_pk<TRes>
      get update_business_cart_by_pk =>
          CopyWith$Mutation$set_cart_business_id$update_business_cart_by_pk
              .stub(_res);
}

const documentNodeMutationset_cart_business_id = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'set_cart_business_id'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'business_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'customer_id')),
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
        name: NameNode(value: 'update_business_cart_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'pk_columns'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'customer_id'),
                value: VariableNode(name: NameNode(value: 'customer_id')),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: '_set'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'business_id'),
                value: VariableNode(name: NameNode(value: 'business_id')),
              )
            ]),
          ),
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
Mutation$set_cart_business_id _parserFn$Mutation$set_cart_business_id(
        Map<String, dynamic> data) =>
    Mutation$set_cart_business_id.fromJson(data);
typedef OnMutationCompleted$Mutation$set_cart_business_id = FutureOr<void>
    Function(
  dynamic,
  Mutation$set_cart_business_id?,
);

class Options$Mutation$set_cart_business_id
    extends graphql.MutationOptions<Mutation$set_cart_business_id> {
  Options$Mutation$set_cart_business_id({
    String? operationName,
    required Variables$Mutation$set_cart_business_id variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$set_cart_business_id? onCompleted,
    graphql.OnMutationUpdate<Mutation$set_cart_business_id>? update,
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
                        : _parserFn$Mutation$set_cart_business_id(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationset_cart_business_id,
          parserFn: _parserFn$Mutation$set_cart_business_id,
        );

  final OnMutationCompleted$Mutation$set_cart_business_id?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$set_cart_business_id
    extends graphql.WatchQueryOptions<Mutation$set_cart_business_id> {
  WatchOptions$Mutation$set_cart_business_id({
    String? operationName,
    required Variables$Mutation$set_cart_business_id variables,
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
          document: documentNodeMutationset_cart_business_id,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$set_cart_business_id,
        );
}

extension ClientExtension$Mutation$set_cart_business_id
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$set_cart_business_id>>
      mutate$set_cart_business_id(
              Options$Mutation$set_cart_business_id options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$set_cart_business_id>
      watchMutation$set_cart_business_id(
              WatchOptions$Mutation$set_cart_business_id options) =>
          this.watchMutation(options);
}

class Mutation$set_cart_business_id$update_business_cart_by_pk {
  Mutation$set_cart_business_id$update_business_cart_by_pk({
    this.business_id,
    required this.$__typename,
  });

  factory Mutation$set_cart_business_id$update_business_cart_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$business_id = json['business_id'];
    final l$$__typename = json['__typename'];
    return Mutation$set_cart_business_id$update_business_cart_by_pk(
      business_id: (l$business_id as int?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int? business_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$business_id = business_id;
    _resultData['business_id'] = l$business_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$business_id = business_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$business_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$set_cart_business_id$update_business_cart_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$business_id = business_id;
    final lOther$business_id = other.business_id;
    if (l$business_id != lOther$business_id) {
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

extension UtilityExtension$Mutation$set_cart_business_id$update_business_cart_by_pk
    on Mutation$set_cart_business_id$update_business_cart_by_pk {
  CopyWith$Mutation$set_cart_business_id$update_business_cart_by_pk<
          Mutation$set_cart_business_id$update_business_cart_by_pk>
      get copyWith =>
          CopyWith$Mutation$set_cart_business_id$update_business_cart_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$set_cart_business_id$update_business_cart_by_pk<
    TRes> {
  factory CopyWith$Mutation$set_cart_business_id$update_business_cart_by_pk(
    Mutation$set_cart_business_id$update_business_cart_by_pk instance,
    TRes Function(Mutation$set_cart_business_id$update_business_cart_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$set_cart_business_id$update_business_cart_by_pk;

  factory CopyWith$Mutation$set_cart_business_id$update_business_cart_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$set_cart_business_id$update_business_cart_by_pk;

  TRes call({
    int? business_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$set_cart_business_id$update_business_cart_by_pk<
        TRes>
    implements
        CopyWith$Mutation$set_cart_business_id$update_business_cart_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$set_cart_business_id$update_business_cart_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$set_cart_business_id$update_business_cart_by_pk _instance;

  final TRes Function(Mutation$set_cart_business_id$update_business_cart_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? business_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$set_cart_business_id$update_business_cart_by_pk(
        business_id: business_id == _undefined
            ? _instance.business_id
            : (business_id as int?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$set_cart_business_id$update_business_cart_by_pk<
        TRes>
    implements
        CopyWith$Mutation$set_cart_business_id$update_business_cart_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$set_cart_business_id$update_business_cart_by_pk(
      this._res);

  TRes _res;

  call({
    int? business_id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$delete_business_cart_item {
  factory Variables$Mutation$delete_business_cart_item({required int $_id}) =>
      Variables$Mutation$delete_business_cart_item._({
        r'_id': $_id,
      });

  Variables$Mutation$delete_business_cart_item._(this._$data);

  factory Variables$Mutation$delete_business_cart_item.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$$_id = data['_id'];
    result$data['_id'] = (l$$_id as int);
    return Variables$Mutation$delete_business_cart_item._(result$data);
  }

  Map<String, dynamic> _$data;

  int get $_id => (_$data['_id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$$_id = $_id;
    result$data['_id'] = l$$_id;
    return result$data;
  }

  CopyWith$Variables$Mutation$delete_business_cart_item<
          Variables$Mutation$delete_business_cart_item>
      get copyWith => CopyWith$Variables$Mutation$delete_business_cart_item(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$delete_business_cart_item) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$_id = $_id;
    final lOther$$_id = other.$_id;
    if (l$$_id != lOther$$_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$$_id = $_id;
    return Object.hashAll([l$$_id]);
  }
}

abstract class CopyWith$Variables$Mutation$delete_business_cart_item<TRes> {
  factory CopyWith$Variables$Mutation$delete_business_cart_item(
    Variables$Mutation$delete_business_cart_item instance,
    TRes Function(Variables$Mutation$delete_business_cart_item) then,
  ) = _CopyWithImpl$Variables$Mutation$delete_business_cart_item;

  factory CopyWith$Variables$Mutation$delete_business_cart_item.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$delete_business_cart_item;

  TRes call({int? $_id});
}

class _CopyWithImpl$Variables$Mutation$delete_business_cart_item<TRes>
    implements CopyWith$Variables$Mutation$delete_business_cart_item<TRes> {
  _CopyWithImpl$Variables$Mutation$delete_business_cart_item(
    this._instance,
    this._then,
  );

  final Variables$Mutation$delete_business_cart_item _instance;

  final TRes Function(Variables$Mutation$delete_business_cart_item) _then;

  static const _undefined = {};

  TRes call({Object? $_id = _undefined}) =>
      _then(Variables$Mutation$delete_business_cart_item._({
        ..._instance._$data,
        if ($_id != _undefined && $_id != null) '_id': ($_id as int),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$delete_business_cart_item<TRes>
    implements CopyWith$Variables$Mutation$delete_business_cart_item<TRes> {
  _CopyWithStubImpl$Variables$Mutation$delete_business_cart_item(this._res);

  TRes _res;

  call({int? $_id}) => _res;
}

class Mutation$delete_business_cart_item {
  Mutation$delete_business_cart_item({
    this.delete_business_cart_item,
    required this.$__typename,
  });

  factory Mutation$delete_business_cart_item.fromJson(
      Map<String, dynamic> json) {
    final l$delete_business_cart_item = json['delete_business_cart_item'];
    final l$$__typename = json['__typename'];
    return Mutation$delete_business_cart_item(
      delete_business_cart_item: l$delete_business_cart_item == null
          ? null
          : Mutation$delete_business_cart_item$delete_business_cart_item
              .fromJson((l$delete_business_cart_item as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$delete_business_cart_item$delete_business_cart_item?
      delete_business_cart_item;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delete_business_cart_item = delete_business_cart_item;
    _resultData['delete_business_cart_item'] =
        l$delete_business_cart_item?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delete_business_cart_item = delete_business_cart_item;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$delete_business_cart_item,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$delete_business_cart_item) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delete_business_cart_item = delete_business_cart_item;
    final lOther$delete_business_cart_item = other.delete_business_cart_item;
    if (l$delete_business_cart_item != lOther$delete_business_cart_item) {
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

extension UtilityExtension$Mutation$delete_business_cart_item
    on Mutation$delete_business_cart_item {
  CopyWith$Mutation$delete_business_cart_item<
          Mutation$delete_business_cart_item>
      get copyWith => CopyWith$Mutation$delete_business_cart_item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$delete_business_cart_item<TRes> {
  factory CopyWith$Mutation$delete_business_cart_item(
    Mutation$delete_business_cart_item instance,
    TRes Function(Mutation$delete_business_cart_item) then,
  ) = _CopyWithImpl$Mutation$delete_business_cart_item;

  factory CopyWith$Mutation$delete_business_cart_item.stub(TRes res) =
      _CopyWithStubImpl$Mutation$delete_business_cart_item;

  TRes call({
    Mutation$delete_business_cart_item$delete_business_cart_item?
        delete_business_cart_item,
    String? $__typename,
  });
  CopyWith$Mutation$delete_business_cart_item$delete_business_cart_item<TRes>
      get delete_business_cart_item;
}

class _CopyWithImpl$Mutation$delete_business_cart_item<TRes>
    implements CopyWith$Mutation$delete_business_cart_item<TRes> {
  _CopyWithImpl$Mutation$delete_business_cart_item(
    this._instance,
    this._then,
  );

  final Mutation$delete_business_cart_item _instance;

  final TRes Function(Mutation$delete_business_cart_item) _then;

  static const _undefined = {};

  TRes call({
    Object? delete_business_cart_item = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$delete_business_cart_item(
        delete_business_cart_item: delete_business_cart_item == _undefined
            ? _instance.delete_business_cart_item
            : (delete_business_cart_item
                as Mutation$delete_business_cart_item$delete_business_cart_item?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$delete_business_cart_item$delete_business_cart_item<TRes>
      get delete_business_cart_item {
    final local$delete_business_cart_item = _instance.delete_business_cart_item;
    return local$delete_business_cart_item == null
        ? CopyWith$Mutation$delete_business_cart_item$delete_business_cart_item
            .stub(_then(_instance))
        : CopyWith$Mutation$delete_business_cart_item$delete_business_cart_item(
            local$delete_business_cart_item,
            (e) => call(delete_business_cart_item: e));
  }
}

class _CopyWithStubImpl$Mutation$delete_business_cart_item<TRes>
    implements CopyWith$Mutation$delete_business_cart_item<TRes> {
  _CopyWithStubImpl$Mutation$delete_business_cart_item(this._res);

  TRes _res;

  call({
    Mutation$delete_business_cart_item$delete_business_cart_item?
        delete_business_cart_item,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$delete_business_cart_item$delete_business_cart_item<TRes>
      get delete_business_cart_item =>
          CopyWith$Mutation$delete_business_cart_item$delete_business_cart_item
              .stub(_res);
}

const documentNodeMutationdelete_business_cart_item =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'delete_business_cart_item'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: '_id')),
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
        name: NameNode(value: 'delete_business_cart_item'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: '_id')),
                  )
                ]),
              )
            ]),
          )
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
Mutation$delete_business_cart_item _parserFn$Mutation$delete_business_cart_item(
        Map<String, dynamic> data) =>
    Mutation$delete_business_cart_item.fromJson(data);
typedef OnMutationCompleted$Mutation$delete_business_cart_item = FutureOr<void>
    Function(
  dynamic,
  Mutation$delete_business_cart_item?,
);

class Options$Mutation$delete_business_cart_item
    extends graphql.MutationOptions<Mutation$delete_business_cart_item> {
  Options$Mutation$delete_business_cart_item({
    String? operationName,
    required Variables$Mutation$delete_business_cart_item variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$delete_business_cart_item? onCompleted,
    graphql.OnMutationUpdate<Mutation$delete_business_cart_item>? update,
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
                        : _parserFn$Mutation$delete_business_cart_item(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationdelete_business_cart_item,
          parserFn: _parserFn$Mutation$delete_business_cart_item,
        );

  final OnMutationCompleted$Mutation$delete_business_cart_item?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$delete_business_cart_item
    extends graphql.WatchQueryOptions<Mutation$delete_business_cart_item> {
  WatchOptions$Mutation$delete_business_cart_item({
    String? operationName,
    required Variables$Mutation$delete_business_cart_item variables,
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
          document: documentNodeMutationdelete_business_cart_item,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$delete_business_cart_item,
        );
}

extension ClientExtension$Mutation$delete_business_cart_item
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$delete_business_cart_item>>
      mutate$delete_business_cart_item(
              Options$Mutation$delete_business_cart_item options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$delete_business_cart_item>
      watchMutation$delete_business_cart_item(
              WatchOptions$Mutation$delete_business_cart_item options) =>
          this.watchMutation(options);
}

class Mutation$delete_business_cart_item$delete_business_cart_item {
  Mutation$delete_business_cart_item$delete_business_cart_item({
    required this.affected_rows,
    required this.$__typename,
  });

  factory Mutation$delete_business_cart_item$delete_business_cart_item.fromJson(
      Map<String, dynamic> json) {
    final l$affected_rows = json['affected_rows'];
    final l$$__typename = json['__typename'];
    return Mutation$delete_business_cart_item$delete_business_cart_item(
      affected_rows: (l$affected_rows as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int affected_rows;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$affected_rows = affected_rows;
    _resultData['affected_rows'] = l$affected_rows;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$affected_rows = affected_rows;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$affected_rows,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$delete_business_cart_item$delete_business_cart_item) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$affected_rows = affected_rows;
    final lOther$affected_rows = other.affected_rows;
    if (l$affected_rows != lOther$affected_rows) {
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

extension UtilityExtension$Mutation$delete_business_cart_item$delete_business_cart_item
    on Mutation$delete_business_cart_item$delete_business_cart_item {
  CopyWith$Mutation$delete_business_cart_item$delete_business_cart_item<
          Mutation$delete_business_cart_item$delete_business_cart_item>
      get copyWith =>
          CopyWith$Mutation$delete_business_cart_item$delete_business_cart_item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$delete_business_cart_item$delete_business_cart_item<
    TRes> {
  factory CopyWith$Mutation$delete_business_cart_item$delete_business_cart_item(
    Mutation$delete_business_cart_item$delete_business_cart_item instance,
    TRes Function(Mutation$delete_business_cart_item$delete_business_cart_item)
        then,
  ) = _CopyWithImpl$Mutation$delete_business_cart_item$delete_business_cart_item;

  factory CopyWith$Mutation$delete_business_cart_item$delete_business_cart_item.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$delete_business_cart_item$delete_business_cart_item;

  TRes call({
    int? affected_rows,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$delete_business_cart_item$delete_business_cart_item<
        TRes>
    implements
        CopyWith$Mutation$delete_business_cart_item$delete_business_cart_item<
            TRes> {
  _CopyWithImpl$Mutation$delete_business_cart_item$delete_business_cart_item(
    this._instance,
    this._then,
  );

  final Mutation$delete_business_cart_item$delete_business_cart_item _instance;

  final TRes Function(
      Mutation$delete_business_cart_item$delete_business_cart_item) _then;

  static const _undefined = {};

  TRes call({
    Object? affected_rows = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$delete_business_cart_item$delete_business_cart_item(
        affected_rows: affected_rows == _undefined || affected_rows == null
            ? _instance.affected_rows
            : (affected_rows as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$delete_business_cart_item$delete_business_cart_item<
        TRes>
    implements
        CopyWith$Mutation$delete_business_cart_item$delete_business_cart_item<
            TRes> {
  _CopyWithStubImpl$Mutation$delete_business_cart_item$delete_business_cart_item(
      this._res);

  TRes _res;

  call({
    int? affected_rows,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Subscription$listen_on_business_order_request {
  factory Variables$Subscription$listen_on_business_order_request(
          {required int $_id}) =>
      Variables$Subscription$listen_on_business_order_request._({
        r'_id': $_id,
      });

  Variables$Subscription$listen_on_business_order_request._(this._$data);

  factory Variables$Subscription$listen_on_business_order_request.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$$_id = data['_id'];
    result$data['_id'] = (l$$_id as int);
    return Variables$Subscription$listen_on_business_order_request._(
        result$data);
  }

  Map<String, dynamic> _$data;

  int get $_id => (_$data['_id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$$_id = $_id;
    result$data['_id'] = l$$_id;
    return result$data;
  }

  CopyWith$Variables$Subscription$listen_on_business_order_request<
          Variables$Subscription$listen_on_business_order_request>
      get copyWith =>
          CopyWith$Variables$Subscription$listen_on_business_order_request(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Subscription$listen_on_business_order_request) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$_id = $_id;
    final lOther$$_id = other.$_id;
    if (l$$_id != lOther$$_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$$_id = $_id;
    return Object.hashAll([l$$_id]);
  }
}

abstract class CopyWith$Variables$Subscription$listen_on_business_order_request<
    TRes> {
  factory CopyWith$Variables$Subscription$listen_on_business_order_request(
    Variables$Subscription$listen_on_business_order_request instance,
    TRes Function(Variables$Subscription$listen_on_business_order_request) then,
  ) = _CopyWithImpl$Variables$Subscription$listen_on_business_order_request;

  factory CopyWith$Variables$Subscription$listen_on_business_order_request.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Subscription$listen_on_business_order_request;

  TRes call({int? $_id});
}

class _CopyWithImpl$Variables$Subscription$listen_on_business_order_request<
        TRes>
    implements
        CopyWith$Variables$Subscription$listen_on_business_order_request<TRes> {
  _CopyWithImpl$Variables$Subscription$listen_on_business_order_request(
    this._instance,
    this._then,
  );

  final Variables$Subscription$listen_on_business_order_request _instance;

  final TRes Function(Variables$Subscription$listen_on_business_order_request)
      _then;

  static const _undefined = {};

  TRes call({Object? $_id = _undefined}) =>
      _then(Variables$Subscription$listen_on_business_order_request._({
        ..._instance._$data,
        if ($_id != _undefined && $_id != null) '_id': ($_id as int),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$listen_on_business_order_request<
        TRes>
    implements
        CopyWith$Variables$Subscription$listen_on_business_order_request<TRes> {
  _CopyWithStubImpl$Variables$Subscription$listen_on_business_order_request(
      this._res);

  TRes _res;

  call({int? $_id}) => _res;
}

class Subscription$listen_on_business_order_request {
  Subscription$listen_on_business_order_request({
    required this.business_order_request,
    required this.$__typename,
  });

  factory Subscription$listen_on_business_order_request.fromJson(
      Map<String, dynamic> json) {
    final l$business_order_request = json['business_order_request'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_business_order_request(
      business_order_request: (l$business_order_request as List<dynamic>)
          .map((e) =>
              Subscription$listen_on_business_order_request$business_order_request
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Subscription$listen_on_business_order_request$business_order_request>
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
    if (!(other is Subscription$listen_on_business_order_request) ||
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

extension UtilityExtension$Subscription$listen_on_business_order_request
    on Subscription$listen_on_business_order_request {
  CopyWith$Subscription$listen_on_business_order_request<
          Subscription$listen_on_business_order_request>
      get copyWith => CopyWith$Subscription$listen_on_business_order_request(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_business_order_request<TRes> {
  factory CopyWith$Subscription$listen_on_business_order_request(
    Subscription$listen_on_business_order_request instance,
    TRes Function(Subscription$listen_on_business_order_request) then,
  ) = _CopyWithImpl$Subscription$listen_on_business_order_request;

  factory CopyWith$Subscription$listen_on_business_order_request.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_business_order_request;

  TRes call({
    List<Subscription$listen_on_business_order_request$business_order_request>?
        business_order_request,
    String? $__typename,
  });
  TRes business_order_request(
      Iterable<Subscription$listen_on_business_order_request$business_order_request> Function(
              Iterable<
                  CopyWith$Subscription$listen_on_business_order_request$business_order_request<
                      Subscription$listen_on_business_order_request$business_order_request>>)
          _fn);
}

class _CopyWithImpl$Subscription$listen_on_business_order_request<TRes>
    implements CopyWith$Subscription$listen_on_business_order_request<TRes> {
  _CopyWithImpl$Subscription$listen_on_business_order_request(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_business_order_request _instance;

  final TRes Function(Subscription$listen_on_business_order_request) _then;

  static const _undefined = {};

  TRes call({
    Object? business_order_request = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listen_on_business_order_request(
        business_order_request: business_order_request == _undefined ||
                business_order_request == null
            ? _instance.business_order_request
            : (business_order_request as List<
                Subscription$listen_on_business_order_request$business_order_request>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes business_order_request(
          Iterable<Subscription$listen_on_business_order_request$business_order_request> Function(
                  Iterable<
                      CopyWith$Subscription$listen_on_business_order_request$business_order_request<
                          Subscription$listen_on_business_order_request$business_order_request>>)
              _fn) =>
      call(
          business_order_request: _fn(_instance.business_order_request.map((e) =>
              CopyWith$Subscription$listen_on_business_order_request$business_order_request(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$listen_on_business_order_request<TRes>
    implements CopyWith$Subscription$listen_on_business_order_request<TRes> {
  _CopyWithStubImpl$Subscription$listen_on_business_order_request(this._res);

  TRes _res;

  call({
    List<Subscription$listen_on_business_order_request$business_order_request>?
        business_order_request,
    String? $__typename,
  }) =>
      _res;
  business_order_request(_fn) => _res;
}

const documentNodeSubscriptionlisten_on_business_order_request =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'listen_on_business_order_request'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: '_id')),
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
                name: NameNode(value: 'customer_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: '_id')),
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
                name: NameNode(value: 'cost'),
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
                name: NameNode(value: 'home'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'available_for'),
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
                        name: NameNode(value: 'name_id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'description_id'),
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
                        name: NameNode(value: 'available'),
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
                    name: NameNode(value: 'id'),
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
                            name: NameNode(value: 'online_ordering'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: 'accepted_payments'),
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
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ]),
                  ),
                  FieldNode(
                    name: NameNode(value: 'bathrooms'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'bedrooms'),
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
                        name: NameNode(value: 'address'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'gps'),
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
                    name: NameNode(value: 'available_for'),
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
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
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
                        name: NameNode(value: 'name_id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'description_id'),
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
                        name: NameNode(value: 'available'),
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
                    name: NameNode(value: 'business'),
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
                            name: NameNode(value: 'name'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: 'online_ordering'),
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
                            name: NameNode(value: 'id'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: 'accepted_payments'),
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
              FieldNode(
                name: NameNode(value: 'product'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'business'),
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
                            name: NameNode(value: 'id'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: 'online_ordering'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: 'accepted_payments'),
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
                    name: NameNode(value: 'details'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'additional_parameters'),
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
                        name: NameNode(value: 'name_id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'description_id'),
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
                        name: NameNode(value: 'tags'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
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
                name: NameNode(value: 'service'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'business'),
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
                            name: NameNode(value: 'id'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: 'accepted_payments'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: 'online_ordering'),
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
                    name: NameNode(value: 'details'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'additional_parameters'),
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
                        name: NameNode(value: 'category1'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'name_id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'description_id'),
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
                        name: NameNode(value: 'tags'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
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
                name: NameNode(value: 'event'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'business'),
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
                            name: NameNode(value: 'id'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: 'accepted_payments'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: 'online_ordering'),
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
                    name: NameNode(value: 'details'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'name_id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'description_id'),
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
                        name: NameNode(value: 'available'),
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
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'schedule_type'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'schedule'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'starts_at'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'ends_at'),
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
            name: NameNode(value: 'business_id'),
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
            name: NameNode(value: 'customer_id'),
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
            name: NameNode(value: 'cancellation_time'),
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
            name: NameNode(value: 'chat_id'),
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
Subscription$listen_on_business_order_request
    _parserFn$Subscription$listen_on_business_order_request(
            Map<String, dynamic> data) =>
        Subscription$listen_on_business_order_request.fromJson(data);

class Options$Subscription$listen_on_business_order_request extends graphql
    .SubscriptionOptions<Subscription$listen_on_business_order_request> {
  Options$Subscription$listen_on_business_order_request({
    String? operationName,
    required Variables$Subscription$listen_on_business_order_request variables,
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
          document: documentNodeSubscriptionlisten_on_business_order_request,
          parserFn: _parserFn$Subscription$listen_on_business_order_request,
        );
}

class WatchOptions$Subscription$listen_on_business_order_request extends graphql
    .WatchQueryOptions<Subscription$listen_on_business_order_request> {
  WatchOptions$Subscription$listen_on_business_order_request({
    String? operationName,
    required Variables$Subscription$listen_on_business_order_request variables,
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
          document: documentNodeSubscriptionlisten_on_business_order_request,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$listen_on_business_order_request,
        );
}

class FetchMoreOptions$Subscription$listen_on_business_order_request
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$listen_on_business_order_request({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$listen_on_business_order_request variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptionlisten_on_business_order_request,
        );
}

extension ClientExtension$Subscription$listen_on_business_order_request
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$listen_on_business_order_request>>
      subscribe$listen_on_business_order_request(
              Options$Subscription$listen_on_business_order_request options) =>
          this.subscribe(options);
  graphql.ObservableQuery<Subscription$listen_on_business_order_request>
      watchSubscription$listen_on_business_order_request(
              WatchOptions$Subscription$listen_on_business_order_request
                  options) =>
          this.watchQuery(options);
}

class Subscription$listen_on_business_order_request$business_order_request {
  Subscription$listen_on_business_order_request$business_order_request({
    required this.items,
    required this.business_id,
    required this.status,
    required this.customer_id,
    this.cost,
    this.cancellation_time,
    required this.id,
    this.chat_id,
    required this.$__typename,
  });

  factory Subscription$listen_on_business_order_request$business_order_request.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$business_id = json['business_id'];
    final l$status = json['status'];
    final l$customer_id = json['customer_id'];
    final l$cost = json['cost'];
    final l$cancellation_time = json['cancellation_time'];
    final l$id = json['id'];
    final l$chat_id = json['chat_id'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_business_order_request$business_order_request(
      items: (l$items as List<dynamic>)
          .map((e) =>
              Subscription$listen_on_business_order_request$business_order_request$items
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      business_id: (l$business_id as int),
      status: (l$status as String),
      customer_id: (l$customer_id as int),
      cost: l$cost == null ? null : moneyFromJson(l$cost),
      cancellation_time: (l$cancellation_time as String?),
      id: (l$id as int),
      chat_id: (l$chat_id as int?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Subscription$listen_on_business_order_request$business_order_request$items>
      items;

  final int business_id;

  final String status;

  final int customer_id;

  final double? cost;

  final String? cancellation_time;

  final int id;

  final int? chat_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$items = items;
    _resultData['items'] = l$items.map((e) => e.toJson()).toList();
    final l$business_id = business_id;
    _resultData['business_id'] = l$business_id;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$customer_id = customer_id;
    _resultData['customer_id'] = l$customer_id;
    final l$cost = cost;
    _resultData['cost'] = l$cost == null ? null : moneyToJson(l$cost);
    final l$cancellation_time = cancellation_time;
    _resultData['cancellation_time'] = l$cancellation_time;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$chat_id = chat_id;
    _resultData['chat_id'] = l$chat_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$items = items;
    final l$business_id = business_id;
    final l$status = status;
    final l$customer_id = customer_id;
    final l$cost = cost;
    final l$cancellation_time = cancellation_time;
    final l$id = id;
    final l$chat_id = chat_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$items.map((v) => v)),
      l$business_id,
      l$status,
      l$customer_id,
      l$cost,
      l$cancellation_time,
      l$id,
      l$chat_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$listen_on_business_order_request$business_order_request) ||
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
    final l$business_id = business_id;
    final lOther$business_id = other.business_id;
    if (l$business_id != lOther$business_id) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$customer_id = customer_id;
    final lOther$customer_id = other.customer_id;
    if (l$customer_id != lOther$customer_id) {
      return false;
    }
    final l$cost = cost;
    final lOther$cost = other.cost;
    if (l$cost != lOther$cost) {
      return false;
    }
    final l$cancellation_time = cancellation_time;
    final lOther$cancellation_time = other.cancellation_time;
    if (l$cancellation_time != lOther$cancellation_time) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$chat_id = chat_id;
    final lOther$chat_id = other.chat_id;
    if (l$chat_id != lOther$chat_id) {
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

extension UtilityExtension$Subscription$listen_on_business_order_request$business_order_request
    on Subscription$listen_on_business_order_request$business_order_request {
  CopyWith$Subscription$listen_on_business_order_request$business_order_request<
          Subscription$listen_on_business_order_request$business_order_request>
      get copyWith =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_business_order_request$business_order_request<
    TRes> {
  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request(
    Subscription$listen_on_business_order_request$business_order_request
        instance,
    TRes Function(
            Subscription$listen_on_business_order_request$business_order_request)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request;

  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request;

  TRes call({
    List<Subscription$listen_on_business_order_request$business_order_request$items>?
        items,
    int? business_id,
    String? status,
    int? customer_id,
    double? cost,
    String? cancellation_time,
    int? id,
    int? chat_id,
    String? $__typename,
  });
  TRes items(
      Iterable<Subscription$listen_on_business_order_request$business_order_request$items> Function(
              Iterable<
                  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items<
                      Subscription$listen_on_business_order_request$business_order_request$items>>)
          _fn);
}

class _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_business_order_request$business_order_request
      _instance;

  final TRes Function(
          Subscription$listen_on_business_order_request$business_order_request)
      _then;

  static const _undefined = {};

  TRes call({
    Object? items = _undefined,
    Object? business_id = _undefined,
    Object? status = _undefined,
    Object? customer_id = _undefined,
    Object? cost = _undefined,
    Object? cancellation_time = _undefined,
    Object? id = _undefined,
    Object? chat_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_business_order_request$business_order_request(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<
                Subscription$listen_on_business_order_request$business_order_request$items>),
        business_id: business_id == _undefined || business_id == null
            ? _instance.business_id
            : (business_id as int),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        customer_id: customer_id == _undefined || customer_id == null
            ? _instance.customer_id
            : (customer_id as int),
        cost: cost == _undefined ? _instance.cost : (cost as double?),
        cancellation_time: cancellation_time == _undefined
            ? _instance.cancellation_time
            : (cancellation_time as String?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        chat_id: chat_id == _undefined ? _instance.chat_id : (chat_id as int?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Subscription$listen_on_business_order_request$business_order_request$items> Function(
                  Iterable<
                      CopyWith$Subscription$listen_on_business_order_request$business_order_request$items<
                          Subscription$listen_on_business_order_request$business_order_request$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) =>
              CopyWith$Subscription$listen_on_business_order_request$business_order_request$items(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request(
      this._res);

  TRes _res;

  call({
    List<Subscription$listen_on_business_order_request$business_order_request$items>?
        items,
    int? business_id,
    String? status,
    int? customer_id,
    double? cost,
    String? cancellation_time,
    int? id,
    int? chat_id,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Subscription$listen_on_business_order_request$business_order_request$items {
  Subscription$listen_on_business_order_request$business_order_request$items({
    required this.id,
    required this.parameters,
    required this.cost,
    required this.item_id,
    required this.offering_type,
    this.time,
    this.home,
    this.rental,
    this.product,
    this.service,
    this.event,
    required this.$__typename,
  });

  factory Subscription$listen_on_business_order_request$business_order_request$items.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$parameters = json['parameters'];
    final l$cost = json['cost'];
    final l$item_id = json['item_id'];
    final l$offering_type = json['offering_type'];
    final l$time = json['time'];
    final l$home = json['home'];
    final l$rental = json['rental'];
    final l$product = json['product'];
    final l$service = json['service'];
    final l$event = json['event'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_business_order_request$business_order_request$items(
      id: (l$id as int),
      parameters: mapFromJson(l$parameters),
      cost: moneyFromJson(l$cost),
      item_id: (l$item_id as int),
      offering_type: (l$offering_type as String),
      time: (l$time as String?),
      home: l$home == null
          ? null
          : Subscription$listen_on_business_order_request$business_order_request$items$home
              .fromJson((l$home as Map<String, dynamic>)),
      rental: l$rental == null
          ? null
          : Subscription$listen_on_business_order_request$business_order_request$items$rental
              .fromJson((l$rental as Map<String, dynamic>)),
      product: l$product == null
          ? null
          : Subscription$listen_on_business_order_request$business_order_request$items$product
              .fromJson((l$product as Map<String, dynamic>)),
      service: l$service == null
          ? null
          : Subscription$listen_on_business_order_request$business_order_request$items$service
              .fromJson((l$service as Map<String, dynamic>)),
      event: l$event == null
          ? null
          : Subscription$listen_on_business_order_request$business_order_request$items$event
              .fromJson((l$event as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final dynamic parameters;

  final double cost;

  final int item_id;

  final String offering_type;

  final String? time;

  final Subscription$listen_on_business_order_request$business_order_request$items$home?
      home;

  final Subscription$listen_on_business_order_request$business_order_request$items$rental?
      rental;

  final Subscription$listen_on_business_order_request$business_order_request$items$product?
      product;

  final Subscription$listen_on_business_order_request$business_order_request$items$service?
      service;

  final Subscription$listen_on_business_order_request$business_order_request$items$event?
      event;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$parameters = parameters;
    _resultData['parameters'] = mapToJson(l$parameters);
    final l$cost = cost;
    _resultData['cost'] = moneyToJson(l$cost);
    final l$item_id = item_id;
    _resultData['item_id'] = l$item_id;
    final l$offering_type = offering_type;
    _resultData['offering_type'] = l$offering_type;
    final l$time = time;
    _resultData['time'] = l$time;
    final l$home = home;
    _resultData['home'] = l$home?.toJson();
    final l$rental = rental;
    _resultData['rental'] = l$rental?.toJson();
    final l$product = product;
    _resultData['product'] = l$product?.toJson();
    final l$service = service;
    _resultData['service'] = l$service?.toJson();
    final l$event = event;
    _resultData['event'] = l$event?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$parameters = parameters;
    final l$cost = cost;
    final l$item_id = item_id;
    final l$offering_type = offering_type;
    final l$time = time;
    final l$home = home;
    final l$rental = rental;
    final l$product = product;
    final l$service = service;
    final l$event = event;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$parameters,
      l$cost,
      l$item_id,
      l$offering_type,
      l$time,
      l$home,
      l$rental,
      l$product,
      l$service,
      l$event,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$listen_on_business_order_request$business_order_request$items) ||
        runtimeType != other.runtimeType) {
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
    final l$cost = cost;
    final lOther$cost = other.cost;
    if (l$cost != lOther$cost) {
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
    final l$time = time;
    final lOther$time = other.time;
    if (l$time != lOther$time) {
      return false;
    }
    final l$home = home;
    final lOther$home = other.home;
    if (l$home != lOther$home) {
      return false;
    }
    final l$rental = rental;
    final lOther$rental = other.rental;
    if (l$rental != lOther$rental) {
      return false;
    }
    final l$product = product;
    final lOther$product = other.product;
    if (l$product != lOther$product) {
      return false;
    }
    final l$service = service;
    final lOther$service = other.service;
    if (l$service != lOther$service) {
      return false;
    }
    final l$event = event;
    final lOther$event = other.event;
    if (l$event != lOther$event) {
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

extension UtilityExtension$Subscription$listen_on_business_order_request$business_order_request$items
    on Subscription$listen_on_business_order_request$business_order_request$items {
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items<
          Subscription$listen_on_business_order_request$business_order_request$items>
      get copyWith =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_business_order_request$business_order_request$items<
    TRes> {
  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items(
    Subscription$listen_on_business_order_request$business_order_request$items
        instance,
    TRes Function(
            Subscription$listen_on_business_order_request$business_order_request$items)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items;

  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items;

  TRes call({
    int? id,
    dynamic? parameters,
    double? cost,
    int? item_id,
    String? offering_type,
    String? time,
    Subscription$listen_on_business_order_request$business_order_request$items$home?
        home,
    Subscription$listen_on_business_order_request$business_order_request$items$rental?
        rental,
    Subscription$listen_on_business_order_request$business_order_request$items$product?
        product,
    Subscription$listen_on_business_order_request$business_order_request$items$service?
        service,
    Subscription$listen_on_business_order_request$business_order_request$items$event?
        event,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home<
      TRes> get home;
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental<
      TRes> get rental;
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product<
      TRes> get product;
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service<
      TRes> get service;
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event<
      TRes> get event;
}

class _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_business_order_request$business_order_request$items
      _instance;

  final TRes Function(
          Subscription$listen_on_business_order_request$business_order_request$items)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? parameters = _undefined,
    Object? cost = _undefined,
    Object? item_id = _undefined,
    Object? offering_type = _undefined,
    Object? time = _undefined,
    Object? home = _undefined,
    Object? rental = _undefined,
    Object? product = _undefined,
    Object? service = _undefined,
    Object? event = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_business_order_request$business_order_request$items(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        parameters: parameters == _undefined || parameters == null
            ? _instance.parameters
            : (parameters as dynamic),
        cost: cost == _undefined || cost == null
            ? _instance.cost
            : (cost as double),
        item_id: item_id == _undefined || item_id == null
            ? _instance.item_id
            : (item_id as int),
        offering_type: offering_type == _undefined || offering_type == null
            ? _instance.offering_type
            : (offering_type as String),
        time: time == _undefined ? _instance.time : (time as String?),
        home: home == _undefined
            ? _instance.home
            : (home
                as Subscription$listen_on_business_order_request$business_order_request$items$home?),
        rental: rental == _undefined
            ? _instance.rental
            : (rental
                as Subscription$listen_on_business_order_request$business_order_request$items$rental?),
        product: product == _undefined
            ? _instance.product
            : (product
                as Subscription$listen_on_business_order_request$business_order_request$items$product?),
        service: service == _undefined
            ? _instance.service
            : (service
                as Subscription$listen_on_business_order_request$business_order_request$items$service?),
        event: event == _undefined
            ? _instance.event
            : (event
                as Subscription$listen_on_business_order_request$business_order_request$items$event?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home<
      TRes> get home {
    final local$home = _instance.home;
    return local$home == null
        ? CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home
            .stub(_then(_instance))
        : CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home(
            local$home, (e) => call(home: e));
  }

  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental<
      TRes> get rental {
    final local$rental = _instance.rental;
    return local$rental == null
        ? CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental
            .stub(_then(_instance))
        : CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental(
            local$rental, (e) => call(rental: e));
  }

  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product<
      TRes> get product {
    final local$product = _instance.product;
    return local$product == null
        ? CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product
            .stub(_then(_instance))
        : CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product(
            local$product, (e) => call(product: e));
  }

  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service<
      TRes> get service {
    final local$service = _instance.service;
    return local$service == null
        ? CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service
            .stub(_then(_instance))
        : CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service(
            local$service, (e) => call(service: e));
  }

  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event<
      TRes> get event {
    final local$event = _instance.event;
    return local$event == null
        ? CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event
            .stub(_then(_instance))
        : CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event(
            local$event, (e) => call(event: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items(
      this._res);

  TRes _res;

  call({
    int? id,
    dynamic? parameters,
    double? cost,
    int? item_id,
    String? offering_type,
    String? time,
    Subscription$listen_on_business_order_request$business_order_request$items$home?
        home,
    Subscription$listen_on_business_order_request$business_order_request$items$rental?
        rental,
    Subscription$listen_on_business_order_request$business_order_request$items$product?
        product,
    Subscription$listen_on_business_order_request$business_order_request$items$service?
        service,
    Subscription$listen_on_business_order_request$business_order_request$items$event?
        event,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home<
          TRes>
      get home =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home
              .stub(_res);
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental<
          TRes>
      get rental =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental
              .stub(_res);
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product<
          TRes>
      get product =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product
              .stub(_res);
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service<
          TRes>
      get service =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service
              .stub(_res);
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event<
          TRes>
      get event =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event
              .stub(_res);
}

class Subscription$listen_on_business_order_request$business_order_request$items$home {
  Subscription$listen_on_business_order_request$business_order_request$items$home({
    required this.available_for,
    this.details,
    required this.id,
    this.business,
    required this.bathrooms,
    required this.bedrooms,
    this.location,
    required this.offering_type,
    required this.$__typename,
  });

  factory Subscription$listen_on_business_order_request$business_order_request$items$home.fromJson(
      Map<String, dynamic> json) {
    final l$available_for = json['available_for'];
    final l$details = json['details'];
    final l$id = json['id'];
    final l$business = json['business'];
    final l$bathrooms = json['bathrooms'];
    final l$bedrooms = json['bedrooms'];
    final l$location = json['location'];
    final l$offering_type = json['offering_type'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_business_order_request$business_order_request$items$home(
      available_for: (l$available_for as String),
      details: l$details == null
          ? null
          : Subscription$listen_on_business_order_request$business_order_request$items$home$details
              .fromJson((l$details as Map<String, dynamic>)),
      id: (l$id as int),
      business: l$business == null
          ? null
          : Subscription$listen_on_business_order_request$business_order_request$items$home$business
              .fromJson((l$business as Map<String, dynamic>)),
      bathrooms: (l$bathrooms as int),
      bedrooms: (l$bedrooms as int),
      location: l$location == null
          ? null
          : Subscription$listen_on_business_order_request$business_order_request$items$home$location
              .fromJson((l$location as Map<String, dynamic>)),
      offering_type: (l$offering_type as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String available_for;

  final Subscription$listen_on_business_order_request$business_order_request$items$home$details?
      details;

  final int id;

  final Subscription$listen_on_business_order_request$business_order_request$items$home$business?
      business;

  final int bathrooms;

  final int bedrooms;

  final Subscription$listen_on_business_order_request$business_order_request$items$home$location?
      location;

  final String offering_type;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$available_for = available_for;
    _resultData['available_for'] = l$available_for;
    final l$details = details;
    _resultData['details'] = l$details?.toJson();
    final l$id = id;
    _resultData['id'] = l$id;
    final l$business = business;
    _resultData['business'] = l$business?.toJson();
    final l$bathrooms = bathrooms;
    _resultData['bathrooms'] = l$bathrooms;
    final l$bedrooms = bedrooms;
    _resultData['bedrooms'] = l$bedrooms;
    final l$location = location;
    _resultData['location'] = l$location?.toJson();
    final l$offering_type = offering_type;
    _resultData['offering_type'] = l$offering_type;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$available_for = available_for;
    final l$details = details;
    final l$id = id;
    final l$business = business;
    final l$bathrooms = bathrooms;
    final l$bedrooms = bedrooms;
    final l$location = location;
    final l$offering_type = offering_type;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$available_for,
      l$details,
      l$id,
      l$business,
      l$bathrooms,
      l$bedrooms,
      l$location,
      l$offering_type,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$listen_on_business_order_request$business_order_request$items$home) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$available_for = available_for;
    final lOther$available_for = other.available_for;
    if (l$available_for != lOther$available_for) {
      return false;
    }
    final l$details = details;
    final lOther$details = other.details;
    if (l$details != lOther$details) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$business = business;
    final lOther$business = other.business;
    if (l$business != lOther$business) {
      return false;
    }
    final l$bathrooms = bathrooms;
    final lOther$bathrooms = other.bathrooms;
    if (l$bathrooms != lOther$bathrooms) {
      return false;
    }
    final l$bedrooms = bedrooms;
    final lOther$bedrooms = other.bedrooms;
    if (l$bedrooms != lOther$bedrooms) {
      return false;
    }
    final l$location = location;
    final lOther$location = other.location;
    if (l$location != lOther$location) {
      return false;
    }
    final l$offering_type = offering_type;
    final lOther$offering_type = other.offering_type;
    if (l$offering_type != lOther$offering_type) {
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

extension UtilityExtension$Subscription$listen_on_business_order_request$business_order_request$items$home
    on Subscription$listen_on_business_order_request$business_order_request$items$home {
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home<
          Subscription$listen_on_business_order_request$business_order_request$items$home>
      get copyWith =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home<
    TRes> {
  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home(
    Subscription$listen_on_business_order_request$business_order_request$items$home
        instance,
    TRes Function(
            Subscription$listen_on_business_order_request$business_order_request$items$home)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$home;

  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$home;

  TRes call({
    String? available_for,
    Subscription$listen_on_business_order_request$business_order_request$items$home$details?
        details,
    int? id,
    Subscription$listen_on_business_order_request$business_order_request$items$home$business?
        business,
    int? bathrooms,
    int? bedrooms,
    Subscription$listen_on_business_order_request$business_order_request$items$home$location?
        location,
    String? offering_type,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$details<
      TRes> get details;
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$business<
      TRes> get business;
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$location<
      TRes> get location;
}

class _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$home<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$home(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_business_order_request$business_order_request$items$home
      _instance;

  final TRes Function(
          Subscription$listen_on_business_order_request$business_order_request$items$home)
      _then;

  static const _undefined = {};

  TRes call({
    Object? available_for = _undefined,
    Object? details = _undefined,
    Object? id = _undefined,
    Object? business = _undefined,
    Object? bathrooms = _undefined,
    Object? bedrooms = _undefined,
    Object? location = _undefined,
    Object? offering_type = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_business_order_request$business_order_request$items$home(
        available_for: available_for == _undefined || available_for == null
            ? _instance.available_for
            : (available_for as String),
        details: details == _undefined
            ? _instance.details
            : (details
                as Subscription$listen_on_business_order_request$business_order_request$items$home$details?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        business: business == _undefined
            ? _instance.business
            : (business
                as Subscription$listen_on_business_order_request$business_order_request$items$home$business?),
        bathrooms: bathrooms == _undefined || bathrooms == null
            ? _instance.bathrooms
            : (bathrooms as int),
        bedrooms: bedrooms == _undefined || bedrooms == null
            ? _instance.bedrooms
            : (bedrooms as int),
        location: location == _undefined
            ? _instance.location
            : (location
                as Subscription$listen_on_business_order_request$business_order_request$items$home$location?),
        offering_type: offering_type == _undefined || offering_type == null
            ? _instance.offering_type
            : (offering_type as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$details<
      TRes> get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$details
            .stub(_then(_instance))
        : CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$details(
            local$details, (e) => call(details: e));
  }

  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$business<
      TRes> get business {
    final local$business = _instance.business;
    return local$business == null
        ? CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$business
            .stub(_then(_instance))
        : CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$business(
            local$business, (e) => call(business: e));
  }

  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$location<
      TRes> get location {
    final local$location = _instance.location;
    return local$location == null
        ? CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$location
            .stub(_then(_instance))
        : CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$location(
            local$location, (e) => call(location: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$home<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$home(
      this._res);

  TRes _res;

  call({
    String? available_for,
    Subscription$listen_on_business_order_request$business_order_request$items$home$details?
        details,
    int? id,
    Subscription$listen_on_business_order_request$business_order_request$items$home$business?
        business,
    int? bathrooms,
    int? bedrooms,
    Subscription$listen_on_business_order_request$business_order_request$items$home$location?
        location,
    String? offering_type,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$details<
          TRes>
      get details =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$details
              .stub(_res);
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$business<
          TRes>
      get business =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$business
              .stub(_res);
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$location<
          TRes>
      get location =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$location
              .stub(_res);
}

class Subscription$listen_on_business_order_request$business_order_request$items$home$details {
  Subscription$listen_on_business_order_request$business_order_request$items$home$details({
    required this.name_id,
    this.description_id,
    required this.id,
    required this.name,
    this.additional_parameters,
    required this.available,
    required this.category1,
    required this.category2,
    required this.cost,
    this.image,
    required this.position,
    required this.tags,
    required this.$__typename,
  });

  factory Subscription$listen_on_business_order_request$business_order_request$items$home$details.fromJson(
      Map<String, dynamic> json) {
    final l$name_id = json['name_id'];
    final l$description_id = json['description_id'];
    final l$id = json['id'];
    final l$name = json['name'];
    final l$additional_parameters = json['additional_parameters'];
    final l$available = json['available'];
    final l$category1 = json['category1'];
    final l$category2 = json['category2'];
    final l$cost = json['cost'];
    final l$image = json['image'];
    final l$position = json['position'];
    final l$tags = json['tags'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_business_order_request$business_order_request$items$home$details(
      name_id: (l$name_id as int),
      description_id: (l$description_id as int?),
      id: (l$id as int),
      name:
          Subscription$listen_on_business_order_request$business_order_request$items$home$details$name
              .fromJson((l$name as Map<String, dynamic>)),
      additional_parameters: l$additional_parameters == null
          ? null
          : mapFromJson(l$additional_parameters),
      available: (l$available as bool),
      category1: (l$category1 as String),
      category2: (l$category2 as String),
      cost: mapFromJson(l$cost),
      image: l$image == null ? null : mapFromJson(l$image),
      position: (l$position as int),
      tags: mapFromJson(l$tags),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int name_id;

  final int? description_id;

  final int id;

  final Subscription$listen_on_business_order_request$business_order_request$items$home$details$name
      name;

  final dynamic? additional_parameters;

  final bool available;

  final String category1;

  final String category2;

  final dynamic cost;

  final dynamic? image;

  final int position;

  final dynamic tags;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name_id = name_id;
    _resultData['name_id'] = l$name_id;
    final l$description_id = description_id;
    _resultData['description_id'] = l$description_id;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$additional_parameters = additional_parameters;
    _resultData['additional_parameters'] = l$additional_parameters == null
        ? null
        : mapToJson(l$additional_parameters);
    final l$available = available;
    _resultData['available'] = l$available;
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
    final l$name_id = name_id;
    final l$description_id = description_id;
    final l$id = id;
    final l$name = name;
    final l$additional_parameters = additional_parameters;
    final l$available = available;
    final l$category1 = category1;
    final l$category2 = category2;
    final l$cost = cost;
    final l$image = image;
    final l$position = position;
    final l$tags = tags;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name_id,
      l$description_id,
      l$id,
      l$name,
      l$additional_parameters,
      l$available,
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
            is Subscription$listen_on_business_order_request$business_order_request$items$home$details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name_id = name_id;
    final lOther$name_id = other.name_id;
    if (l$name_id != lOther$name_id) {
      return false;
    }
    final l$description_id = description_id;
    final lOther$description_id = other.description_id;
    if (l$description_id != lOther$description_id) {
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
    final l$available = available;
    final lOther$available = other.available;
    if (l$available != lOther$available) {
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

extension UtilityExtension$Subscription$listen_on_business_order_request$business_order_request$items$home$details
    on Subscription$listen_on_business_order_request$business_order_request$items$home$details {
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$details<
          Subscription$listen_on_business_order_request$business_order_request$items$home$details>
      get copyWith =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$details<
    TRes> {
  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$details(
    Subscription$listen_on_business_order_request$business_order_request$items$home$details
        instance,
    TRes Function(
            Subscription$listen_on_business_order_request$business_order_request$items$home$details)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$home$details;

  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$details.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$home$details;

  TRes call({
    int? name_id,
    int? description_id,
    int? id,
    Subscription$listen_on_business_order_request$business_order_request$items$home$details$name?
        name,
    dynamic? additional_parameters,
    bool? available,
    String? category1,
    String? category2,
    dynamic? cost,
    dynamic? image,
    int? position,
    dynamic? tags,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$details$name<
      TRes> get name;
}

class _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$home$details<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$details<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$home$details(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_business_order_request$business_order_request$items$home$details
      _instance;

  final TRes Function(
          Subscription$listen_on_business_order_request$business_order_request$items$home$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name_id = _undefined,
    Object? description_id = _undefined,
    Object? id = _undefined,
    Object? name = _undefined,
    Object? additional_parameters = _undefined,
    Object? available = _undefined,
    Object? category1 = _undefined,
    Object? category2 = _undefined,
    Object? cost = _undefined,
    Object? image = _undefined,
    Object? position = _undefined,
    Object? tags = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_business_order_request$business_order_request$items$home$details(
        name_id: name_id == _undefined || name_id == null
            ? _instance.name_id
            : (name_id as int),
        description_id: description_id == _undefined
            ? _instance.description_id
            : (description_id as int?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Subscription$listen_on_business_order_request$business_order_request$items$home$details$name),
        additional_parameters: additional_parameters == _undefined
            ? _instance.additional_parameters
            : (additional_parameters as dynamic?),
        available: available == _undefined || available == null
            ? _instance.available
            : (available as bool),
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
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$details$name<
      TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$details$name(
        local$name, (e) => call(name: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$home$details<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$details<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$home$details(
      this._res);

  TRes _res;

  call({
    int? name_id,
    int? description_id,
    int? id,
    Subscription$listen_on_business_order_request$business_order_request$items$home$details$name?
        name,
    dynamic? additional_parameters,
    bool? available,
    String? category1,
    String? category2,
    dynamic? cost,
    dynamic? image,
    int? position,
    dynamic? tags,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$details$name<
          TRes>
      get name =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$details$name
              .stub(_res);
}

class Subscription$listen_on_business_order_request$business_order_request$items$home$details$name {
  Subscription$listen_on_business_order_request$business_order_request$items$home$details$name({
    required this.translations,
    required this.$__typename,
  });

  factory Subscription$listen_on_business_order_request$business_order_request$items$home$details$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_business_order_request$business_order_request$items$home$details$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Subscription$listen_on_business_order_request$business_order_request$items$home$details$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Subscription$listen_on_business_order_request$business_order_request$items$home$details$name$translations>
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
            is Subscription$listen_on_business_order_request$business_order_request$items$home$details$name) ||
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

extension UtilityExtension$Subscription$listen_on_business_order_request$business_order_request$items$home$details$name
    on Subscription$listen_on_business_order_request$business_order_request$items$home$details$name {
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$details$name<
          Subscription$listen_on_business_order_request$business_order_request$items$home$details$name>
      get copyWith =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$details$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$details$name<
    TRes> {
  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$details$name(
    Subscription$listen_on_business_order_request$business_order_request$items$home$details$name
        instance,
    TRes Function(
            Subscription$listen_on_business_order_request$business_order_request$items$home$details$name)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$home$details$name;

  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$details$name.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$home$details$name;

  TRes call({
    List<Subscription$listen_on_business_order_request$business_order_request$items$home$details$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Subscription$listen_on_business_order_request$business_order_request$items$home$details$name$translations> Function(
              Iterable<
                  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$details$name$translations<
                      Subscription$listen_on_business_order_request$business_order_request$items$home$details$name$translations>>)
          _fn);
}

class _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$home$details$name<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$details$name<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$home$details$name(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_business_order_request$business_order_request$items$home$details$name
      _instance;

  final TRes Function(
          Subscription$listen_on_business_order_request$business_order_request$items$home$details$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_business_order_request$business_order_request$items$home$details$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Subscription$listen_on_business_order_request$business_order_request$items$home$details$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Subscription$listen_on_business_order_request$business_order_request$items$home$details$name$translations> Function(
                  Iterable<
                      CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$details$name$translations<
                          Subscription$listen_on_business_order_request$business_order_request$items$home$details$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$details$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$home$details$name<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$details$name<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$home$details$name(
      this._res);

  TRes _res;

  call({
    List<Subscription$listen_on_business_order_request$business_order_request$items$home$details$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Subscription$listen_on_business_order_request$business_order_request$items$home$details$name$translations {
  Subscription$listen_on_business_order_request$business_order_request$items$home$details$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Subscription$listen_on_business_order_request$business_order_request$items$home$details$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_business_order_request$business_order_request$items$home$details$name$translations(
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
            is Subscription$listen_on_business_order_request$business_order_request$items$home$details$name$translations) ||
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

extension UtilityExtension$Subscription$listen_on_business_order_request$business_order_request$items$home$details$name$translations
    on Subscription$listen_on_business_order_request$business_order_request$items$home$details$name$translations {
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$details$name$translations<
          Subscription$listen_on_business_order_request$business_order_request$items$home$details$name$translations>
      get copyWith =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$details$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$details$name$translations<
    TRes> {
  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$details$name$translations(
    Subscription$listen_on_business_order_request$business_order_request$items$home$details$name$translations
        instance,
    TRes Function(
            Subscription$listen_on_business_order_request$business_order_request$items$home$details$name$translations)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$home$details$name$translations;

  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$details$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$home$details$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$home$details$name$translations<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$details$name$translations<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$home$details$name$translations(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_business_order_request$business_order_request$items$home$details$name$translations
      _instance;

  final TRes Function(
          Subscription$listen_on_business_order_request$business_order_request$items$home$details$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_business_order_request$business_order_request$items$home$details$name$translations(
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

class _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$home$details$name$translations<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$details$name$translations<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$home$details$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$listen_on_business_order_request$business_order_request$items$home$business {
  Subscription$listen_on_business_order_request$business_order_request$items$home$business({
    required this.id,
    required this.details,
    required this.$__typename,
  });

  factory Subscription$listen_on_business_order_request$business_order_request$items$home$business.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_business_order_request$business_order_request$items$home$business(
      id: (l$id as int),
      details:
          Subscription$listen_on_business_order_request$business_order_request$items$home$business$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Subscription$listen_on_business_order_request$business_order_request$items$home$business$details
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
            is Subscription$listen_on_business_order_request$business_order_request$items$home$business) ||
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

extension UtilityExtension$Subscription$listen_on_business_order_request$business_order_request$items$home$business
    on Subscription$listen_on_business_order_request$business_order_request$items$home$business {
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$business<
          Subscription$listen_on_business_order_request$business_order_request$items$home$business>
      get copyWith =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$business(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$business<
    TRes> {
  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$business(
    Subscription$listen_on_business_order_request$business_order_request$items$home$business
        instance,
    TRes Function(
            Subscription$listen_on_business_order_request$business_order_request$items$home$business)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$home$business;

  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$business.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$home$business;

  TRes call({
    int? id,
    Subscription$listen_on_business_order_request$business_order_request$items$home$business$details?
        details,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$business$details<
      TRes> get details;
}

class _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$home$business<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$business<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$home$business(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_business_order_request$business_order_request$items$home$business
      _instance;

  final TRes Function(
          Subscription$listen_on_business_order_request$business_order_request$items$home$business)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_business_order_request$business_order_request$items$home$business(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Subscription$listen_on_business_order_request$business_order_request$items$home$business$details),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$business$details<
      TRes> get details {
    final local$details = _instance.details;
    return CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$business$details(
        local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$home$business<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$business<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$home$business(
      this._res);

  TRes _res;

  call({
    int? id,
    Subscription$listen_on_business_order_request$business_order_request$items$home$business$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$business$details<
          TRes>
      get details =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$business$details
              .stub(_res);
}

class Subscription$listen_on_business_order_request$business_order_request$items$home$business$details {
  Subscription$listen_on_business_order_request$business_order_request$items$home$business$details({
    required this.id,
    required this.name,
    required this.currency,
    required this.online_ordering,
    required this.accepted_payments,
    required this.image,
    required this.location,
    required this.$__typename,
  });

  factory Subscription$listen_on_business_order_request$business_order_request$items$home$business$details.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$currency = json['currency'];
    final l$online_ordering = json['online_ordering'];
    final l$accepted_payments = json['accepted_payments'];
    final l$image = json['image'];
    final l$location = json['location'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_business_order_request$business_order_request$items$home$business$details(
      id: (l$id as int),
      name: (l$name as String),
      currency: (l$currency as String),
      online_ordering: (l$online_ordering as bool),
      accepted_payments: mapFromJson(l$accepted_payments),
      image: (l$image as String),
      location:
          Subscription$listen_on_business_order_request$business_order_request$items$home$business$details$location
              .fromJson((l$location as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String name;

  final String currency;

  final bool online_ordering;

  final dynamic accepted_payments;

  final String image;

  final Subscription$listen_on_business_order_request$business_order_request$items$home$business$details$location
      location;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$currency = currency;
    _resultData['currency'] = l$currency;
    final l$online_ordering = online_ordering;
    _resultData['online_ordering'] = l$online_ordering;
    final l$accepted_payments = accepted_payments;
    _resultData['accepted_payments'] = mapToJson(l$accepted_payments);
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
    final l$id = id;
    final l$name = name;
    final l$currency = currency;
    final l$online_ordering = online_ordering;
    final l$accepted_payments = accepted_payments;
    final l$image = image;
    final l$location = location;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$currency,
      l$online_ordering,
      l$accepted_payments,
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
            is Subscription$listen_on_business_order_request$business_order_request$items$home$business$details) ||
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
    final l$currency = currency;
    final lOther$currency = other.currency;
    if (l$currency != lOther$currency) {
      return false;
    }
    final l$online_ordering = online_ordering;
    final lOther$online_ordering = other.online_ordering;
    if (l$online_ordering != lOther$online_ordering) {
      return false;
    }
    final l$accepted_payments = accepted_payments;
    final lOther$accepted_payments = other.accepted_payments;
    if (l$accepted_payments != lOther$accepted_payments) {
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

extension UtilityExtension$Subscription$listen_on_business_order_request$business_order_request$items$home$business$details
    on Subscription$listen_on_business_order_request$business_order_request$items$home$business$details {
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$business$details<
          Subscription$listen_on_business_order_request$business_order_request$items$home$business$details>
      get copyWith =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$business$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$business$details<
    TRes> {
  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$business$details(
    Subscription$listen_on_business_order_request$business_order_request$items$home$business$details
        instance,
    TRes Function(
            Subscription$listen_on_business_order_request$business_order_request$items$home$business$details)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$home$business$details;

  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$business$details.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$home$business$details;

  TRes call({
    int? id,
    String? name,
    String? currency,
    bool? online_ordering,
    dynamic? accepted_payments,
    String? image,
    Subscription$listen_on_business_order_request$business_order_request$items$home$business$details$location?
        location,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$business$details$location<
      TRes> get location;
}

class _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$home$business$details<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$business$details<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$home$business$details(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_business_order_request$business_order_request$items$home$business$details
      _instance;

  final TRes Function(
          Subscription$listen_on_business_order_request$business_order_request$items$home$business$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? currency = _undefined,
    Object? online_ordering = _undefined,
    Object? accepted_payments = _undefined,
    Object? image = _undefined,
    Object? location = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_business_order_request$business_order_request$items$home$business$details(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        currency: currency == _undefined || currency == null
            ? _instance.currency
            : (currency as String),
        online_ordering:
            online_ordering == _undefined || online_ordering == null
                ? _instance.online_ordering
                : (online_ordering as bool),
        accepted_payments:
            accepted_payments == _undefined || accepted_payments == null
                ? _instance.accepted_payments
                : (accepted_payments as dynamic),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        location: location == _undefined || location == null
            ? _instance.location
            : (location
                as Subscription$listen_on_business_order_request$business_order_request$items$home$business$details$location),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$business$details$location<
      TRes> get location {
    final local$location = _instance.location;
    return CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$business$details$location(
        local$location, (e) => call(location: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$home$business$details<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$business$details<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$home$business$details(
      this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    String? currency,
    bool? online_ordering,
    dynamic? accepted_payments,
    String? image,
    Subscription$listen_on_business_order_request$business_order_request$items$home$business$details$location?
        location,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$business$details$location<
          TRes>
      get location =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$business$details$location
              .stub(_res);
}

class Subscription$listen_on_business_order_request$business_order_request$items$home$business$details$location {
  Subscription$listen_on_business_order_request$business_order_request$items$home$business$details$location({
    required this.gps,
    required this.address,
    required this.$__typename,
  });

  factory Subscription$listen_on_business_order_request$business_order_request$items$home$business$details$location.fromJson(
      Map<String, dynamic> json) {
    final l$gps = json['gps'];
    final l$address = json['address'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_business_order_request$business_order_request$items$home$business$details$location(
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
            is Subscription$listen_on_business_order_request$business_order_request$items$home$business$details$location) ||
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

extension UtilityExtension$Subscription$listen_on_business_order_request$business_order_request$items$home$business$details$location
    on Subscription$listen_on_business_order_request$business_order_request$items$home$business$details$location {
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$business$details$location<
          Subscription$listen_on_business_order_request$business_order_request$items$home$business$details$location>
      get copyWith =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$business$details$location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$business$details$location<
    TRes> {
  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$business$details$location(
    Subscription$listen_on_business_order_request$business_order_request$items$home$business$details$location
        instance,
    TRes Function(
            Subscription$listen_on_business_order_request$business_order_request$items$home$business$details$location)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$home$business$details$location;

  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$business$details$location.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$home$business$details$location;

  TRes call({
    Geography? gps,
    String? address,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$home$business$details$location<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$business$details$location<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$home$business$details$location(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_business_order_request$business_order_request$items$home$business$details$location
      _instance;

  final TRes Function(
          Subscription$listen_on_business_order_request$business_order_request$items$home$business$details$location)
      _then;

  static const _undefined = {};

  TRes call({
    Object? gps = _undefined,
    Object? address = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_business_order_request$business_order_request$items$home$business$details$location(
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

class _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$home$business$details$location<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$business$details$location<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$home$business$details$location(
      this._res);

  TRes _res;

  call({
    Geography? gps,
    String? address,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$listen_on_business_order_request$business_order_request$items$home$location {
  Subscription$listen_on_business_order_request$business_order_request$items$home$location({
    required this.address,
    required this.gps,
    required this.name,
    required this.$__typename,
  });

  factory Subscription$listen_on_business_order_request$business_order_request$items$home$location.fromJson(
      Map<String, dynamic> json) {
    final l$address = json['address'];
    final l$gps = json['gps'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_business_order_request$business_order_request$items$home$location(
      address: (l$address as String),
      gps: geographyFromJson(l$gps),
      name: (l$name as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String address;

  final Geography gps;

  final String name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$address = address;
    _resultData['address'] = l$address;
    final l$gps = gps;
    _resultData['gps'] = geographyToJson(l$gps);
    final l$name = name;
    _resultData['name'] = l$name;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$address = address;
    final l$gps = gps;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$address,
      l$gps,
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
            is Subscription$listen_on_business_order_request$business_order_request$items$home$location) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$address = address;
    final lOther$address = other.address;
    if (l$address != lOther$address) {
      return false;
    }
    final l$gps = gps;
    final lOther$gps = other.gps;
    if (l$gps != lOther$gps) {
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

extension UtilityExtension$Subscription$listen_on_business_order_request$business_order_request$items$home$location
    on Subscription$listen_on_business_order_request$business_order_request$items$home$location {
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$location<
          Subscription$listen_on_business_order_request$business_order_request$items$home$location>
      get copyWith =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$location<
    TRes> {
  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$location(
    Subscription$listen_on_business_order_request$business_order_request$items$home$location
        instance,
    TRes Function(
            Subscription$listen_on_business_order_request$business_order_request$items$home$location)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$home$location;

  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$location.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$home$location;

  TRes call({
    String? address,
    Geography? gps,
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$home$location<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$location<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$home$location(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_business_order_request$business_order_request$items$home$location
      _instance;

  final TRes Function(
          Subscription$listen_on_business_order_request$business_order_request$items$home$location)
      _then;

  static const _undefined = {};

  TRes call({
    Object? address = _undefined,
    Object? gps = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_business_order_request$business_order_request$items$home$location(
        address: address == _undefined || address == null
            ? _instance.address
            : (address as String),
        gps: gps == _undefined || gps == null
            ? _instance.gps
            : (gps as Geography),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$home$location<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$home$location<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$home$location(
      this._res);

  TRes _res;

  call({
    String? address,
    Geography? gps,
    String? name,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$listen_on_business_order_request$business_order_request$items$rental {
  Subscription$listen_on_business_order_request$business_order_request$items$rental({
    required this.details,
    required this.business,
    required this.$__typename,
  });

  factory Subscription$listen_on_business_order_request$business_order_request$items$rental.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$business = json['business'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_business_order_request$business_order_request$items$rental(
      details:
          Subscription$listen_on_business_order_request$business_order_request$items$rental$details
              .fromJson((l$details as Map<String, dynamic>)),
      business:
          Subscription$listen_on_business_order_request$business_order_request$items$rental$business
              .fromJson((l$business as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$listen_on_business_order_request$business_order_request$items$rental$details
      details;

  final Subscription$listen_on_business_order_request$business_order_request$items$rental$business
      business;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$details = details;
    _resultData['details'] = l$details.toJson();
    final l$business = business;
    _resultData['business'] = l$business.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$details = details;
    final l$business = business;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$details,
      l$business,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$listen_on_business_order_request$business_order_request$items$rental) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$details = details;
    final lOther$details = other.details;
    if (l$details != lOther$details) {
      return false;
    }
    final l$business = business;
    final lOther$business = other.business;
    if (l$business != lOther$business) {
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

extension UtilityExtension$Subscription$listen_on_business_order_request$business_order_request$items$rental
    on Subscription$listen_on_business_order_request$business_order_request$items$rental {
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental<
          Subscription$listen_on_business_order_request$business_order_request$items$rental>
      get copyWith =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental<
    TRes> {
  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental(
    Subscription$listen_on_business_order_request$business_order_request$items$rental
        instance,
    TRes Function(
            Subscription$listen_on_business_order_request$business_order_request$items$rental)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$rental;

  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$rental;

  TRes call({
    Subscription$listen_on_business_order_request$business_order_request$items$rental$details?
        details,
    Subscription$listen_on_business_order_request$business_order_request$items$rental$business?
        business,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$details<
      TRes> get details;
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$business<
      TRes> get business;
}

class _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$rental<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$rental(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_business_order_request$business_order_request$items$rental
      _instance;

  final TRes Function(
          Subscription$listen_on_business_order_request$business_order_request$items$rental)
      _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? business = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_business_order_request$business_order_request$items$rental(
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Subscription$listen_on_business_order_request$business_order_request$items$rental$details),
        business: business == _undefined || business == null
            ? _instance.business
            : (business
                as Subscription$listen_on_business_order_request$business_order_request$items$rental$business),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$details<
      TRes> get details {
    final local$details = _instance.details;
    return CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$details(
        local$details, (e) => call(details: e));
  }

  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$business<
      TRes> get business {
    final local$business = _instance.business;
    return CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$business(
        local$business, (e) => call(business: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$rental<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$rental(
      this._res);

  TRes _res;

  call({
    Subscription$listen_on_business_order_request$business_order_request$items$rental$details?
        details,
    Subscription$listen_on_business_order_request$business_order_request$items$rental$business?
        business,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$details<
          TRes>
      get details =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$details
              .stub(_res);
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$business<
          TRes>
      get business =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$business
              .stub(_res);
}

class Subscription$listen_on_business_order_request$business_order_request$items$rental$details {
  Subscription$listen_on_business_order_request$business_order_request$items$rental$details({
    required this.name_id,
    this.description_id,
    required this.id,
    required this.name,
    this.additional_parameters,
    required this.available,
    required this.category1,
    required this.category2,
    required this.cost,
    this.image,
    required this.position,
    required this.tags,
    required this.$__typename,
  });

  factory Subscription$listen_on_business_order_request$business_order_request$items$rental$details.fromJson(
      Map<String, dynamic> json) {
    final l$name_id = json['name_id'];
    final l$description_id = json['description_id'];
    final l$id = json['id'];
    final l$name = json['name'];
    final l$additional_parameters = json['additional_parameters'];
    final l$available = json['available'];
    final l$category1 = json['category1'];
    final l$category2 = json['category2'];
    final l$cost = json['cost'];
    final l$image = json['image'];
    final l$position = json['position'];
    final l$tags = json['tags'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_business_order_request$business_order_request$items$rental$details(
      name_id: (l$name_id as int),
      description_id: (l$description_id as int?),
      id: (l$id as int),
      name:
          Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name
              .fromJson((l$name as Map<String, dynamic>)),
      additional_parameters: l$additional_parameters == null
          ? null
          : mapFromJson(l$additional_parameters),
      available: (l$available as bool),
      category1: (l$category1 as String),
      category2: (l$category2 as String),
      cost: mapFromJson(l$cost),
      image: l$image == null ? null : mapFromJson(l$image),
      position: (l$position as int),
      tags: mapFromJson(l$tags),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int name_id;

  final int? description_id;

  final int id;

  final Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name
      name;

  final dynamic? additional_parameters;

  final bool available;

  final String category1;

  final String category2;

  final dynamic cost;

  final dynamic? image;

  final int position;

  final dynamic tags;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name_id = name_id;
    _resultData['name_id'] = l$name_id;
    final l$description_id = description_id;
    _resultData['description_id'] = l$description_id;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$additional_parameters = additional_parameters;
    _resultData['additional_parameters'] = l$additional_parameters == null
        ? null
        : mapToJson(l$additional_parameters);
    final l$available = available;
    _resultData['available'] = l$available;
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
    final l$name_id = name_id;
    final l$description_id = description_id;
    final l$id = id;
    final l$name = name;
    final l$additional_parameters = additional_parameters;
    final l$available = available;
    final l$category1 = category1;
    final l$category2 = category2;
    final l$cost = cost;
    final l$image = image;
    final l$position = position;
    final l$tags = tags;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name_id,
      l$description_id,
      l$id,
      l$name,
      l$additional_parameters,
      l$available,
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
            is Subscription$listen_on_business_order_request$business_order_request$items$rental$details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name_id = name_id;
    final lOther$name_id = other.name_id;
    if (l$name_id != lOther$name_id) {
      return false;
    }
    final l$description_id = description_id;
    final lOther$description_id = other.description_id;
    if (l$description_id != lOther$description_id) {
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
    final l$available = available;
    final lOther$available = other.available;
    if (l$available != lOther$available) {
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

extension UtilityExtension$Subscription$listen_on_business_order_request$business_order_request$items$rental$details
    on Subscription$listen_on_business_order_request$business_order_request$items$rental$details {
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$details<
          Subscription$listen_on_business_order_request$business_order_request$items$rental$details>
      get copyWith =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$details<
    TRes> {
  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$details(
    Subscription$listen_on_business_order_request$business_order_request$items$rental$details
        instance,
    TRes Function(
            Subscription$listen_on_business_order_request$business_order_request$items$rental$details)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$rental$details;

  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$details.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$rental$details;

  TRes call({
    int? name_id,
    int? description_id,
    int? id,
    Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name?
        name,
    dynamic? additional_parameters,
    bool? available,
    String? category1,
    String? category2,
    dynamic? cost,
    dynamic? image,
    int? position,
    dynamic? tags,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name<
      TRes> get name;
}

class _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$rental$details<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$details<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$rental$details(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_business_order_request$business_order_request$items$rental$details
      _instance;

  final TRes Function(
          Subscription$listen_on_business_order_request$business_order_request$items$rental$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name_id = _undefined,
    Object? description_id = _undefined,
    Object? id = _undefined,
    Object? name = _undefined,
    Object? additional_parameters = _undefined,
    Object? available = _undefined,
    Object? category1 = _undefined,
    Object? category2 = _undefined,
    Object? cost = _undefined,
    Object? image = _undefined,
    Object? position = _undefined,
    Object? tags = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_business_order_request$business_order_request$items$rental$details(
        name_id: name_id == _undefined || name_id == null
            ? _instance.name_id
            : (name_id as int),
        description_id: description_id == _undefined
            ? _instance.description_id
            : (description_id as int?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name),
        additional_parameters: additional_parameters == _undefined
            ? _instance.additional_parameters
            : (additional_parameters as dynamic?),
        available: available == _undefined || available == null
            ? _instance.available
            : (available as bool),
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
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name<
      TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name(
        local$name, (e) => call(name: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$rental$details<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$details<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$rental$details(
      this._res);

  TRes _res;

  call({
    int? name_id,
    int? description_id,
    int? id,
    Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name?
        name,
    dynamic? additional_parameters,
    bool? available,
    String? category1,
    String? category2,
    dynamic? cost,
    dynamic? image,
    int? position,
    dynamic? tags,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name<
          TRes>
      get name =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name
              .stub(_res);
}

class Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name {
  Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name({
    required this.translations,
    required this.$__typename,
  });

  factory Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name$translations>
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
            is Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name) ||
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

extension UtilityExtension$Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name
    on Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name {
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name<
          Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name>
      get copyWith =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name<
    TRes> {
  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name(
    Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name
        instance,
    TRes Function(
            Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name;

  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name;

  TRes call({
    List<Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name$translations> Function(
              Iterable<
                  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name$translations<
                      Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name$translations>>)
          _fn);
}

class _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name
      _instance;

  final TRes Function(
          Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name$translations> Function(
                  Iterable<
                      CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name$translations<
                          Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name(
      this._res);

  TRes _res;

  call({
    List<Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name$translations {
  Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name$translations(
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
            is Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name$translations) ||
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

extension UtilityExtension$Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name$translations
    on Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name$translations {
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name$translations<
          Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name$translations>
      get copyWith =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name$translations<
    TRes> {
  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name$translations(
    Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name$translations
        instance,
    TRes Function(
            Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name$translations)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name$translations;

  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name$translations<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name$translations<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name$translations(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name$translations
      _instance;

  final TRes Function(
          Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name$translations(
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

class _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name$translations<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name$translations<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$rental$details$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$listen_on_business_order_request$business_order_request$items$rental$business {
  Subscription$listen_on_business_order_request$business_order_request$items$rental$business({
    required this.details,
    required this.$__typename,
  });

  factory Subscription$listen_on_business_order_request$business_order_request$items$rental$business.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_business_order_request$business_order_request$items$rental$business(
      details:
          Subscription$listen_on_business_order_request$business_order_request$items$rental$business$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$listen_on_business_order_request$business_order_request$items$rental$business$details
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
            is Subscription$listen_on_business_order_request$business_order_request$items$rental$business) ||
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

extension UtilityExtension$Subscription$listen_on_business_order_request$business_order_request$items$rental$business
    on Subscription$listen_on_business_order_request$business_order_request$items$rental$business {
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$business<
          Subscription$listen_on_business_order_request$business_order_request$items$rental$business>
      get copyWith =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$business(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$business<
    TRes> {
  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$business(
    Subscription$listen_on_business_order_request$business_order_request$items$rental$business
        instance,
    TRes Function(
            Subscription$listen_on_business_order_request$business_order_request$items$rental$business)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$rental$business;

  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$business.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$rental$business;

  TRes call({
    Subscription$listen_on_business_order_request$business_order_request$items$rental$business$details?
        details,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$business$details<
      TRes> get details;
}

class _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$rental$business<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$business<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$rental$business(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_business_order_request$business_order_request$items$rental$business
      _instance;

  final TRes Function(
          Subscription$listen_on_business_order_request$business_order_request$items$rental$business)
      _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_business_order_request$business_order_request$items$rental$business(
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Subscription$listen_on_business_order_request$business_order_request$items$rental$business$details),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$business$details<
      TRes> get details {
    final local$details = _instance.details;
    return CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$business$details(
        local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$rental$business<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$business<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$rental$business(
      this._res);

  TRes _res;

  call({
    Subscription$listen_on_business_order_request$business_order_request$items$rental$business$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$business$details<
          TRes>
      get details =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$business$details
              .stub(_res);
}

class Subscription$listen_on_business_order_request$business_order_request$items$rental$business$details {
  Subscription$listen_on_business_order_request$business_order_request$items$rental$business$details({
    required this.name,
    required this.online_ordering,
    required this.currency,
    required this.id,
    required this.accepted_payments,
    required this.image,
    required this.$__typename,
  });

  factory Subscription$listen_on_business_order_request$business_order_request$items$rental$business$details.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$online_ordering = json['online_ordering'];
    final l$currency = json['currency'];
    final l$id = json['id'];
    final l$accepted_payments = json['accepted_payments'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_business_order_request$business_order_request$items$rental$business$details(
      name: (l$name as String),
      online_ordering: (l$online_ordering as bool),
      currency: (l$currency as String),
      id: (l$id as int),
      accepted_payments: mapFromJson(l$accepted_payments),
      image: (l$image as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String name;

  final bool online_ordering;

  final String currency;

  final int id;

  final dynamic accepted_payments;

  final String image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$online_ordering = online_ordering;
    _resultData['online_ordering'] = l$online_ordering;
    final l$currency = currency;
    _resultData['currency'] = l$currency;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$accepted_payments = accepted_payments;
    _resultData['accepted_payments'] = mapToJson(l$accepted_payments);
    final l$image = image;
    _resultData['image'] = l$image;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$online_ordering = online_ordering;
    final l$currency = currency;
    final l$id = id;
    final l$accepted_payments = accepted_payments;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$online_ordering,
      l$currency,
      l$id,
      l$accepted_payments,
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
            is Subscription$listen_on_business_order_request$business_order_request$items$rental$business$details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$online_ordering = online_ordering;
    final lOther$online_ordering = other.online_ordering;
    if (l$online_ordering != lOther$online_ordering) {
      return false;
    }
    final l$currency = currency;
    final lOther$currency = other.currency;
    if (l$currency != lOther$currency) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$accepted_payments = accepted_payments;
    final lOther$accepted_payments = other.accepted_payments;
    if (l$accepted_payments != lOther$accepted_payments) {
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

extension UtilityExtension$Subscription$listen_on_business_order_request$business_order_request$items$rental$business$details
    on Subscription$listen_on_business_order_request$business_order_request$items$rental$business$details {
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$business$details<
          Subscription$listen_on_business_order_request$business_order_request$items$rental$business$details>
      get copyWith =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$business$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$business$details<
    TRes> {
  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$business$details(
    Subscription$listen_on_business_order_request$business_order_request$items$rental$business$details
        instance,
    TRes Function(
            Subscription$listen_on_business_order_request$business_order_request$items$rental$business$details)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$rental$business$details;

  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$business$details.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$rental$business$details;

  TRes call({
    String? name,
    bool? online_ordering,
    String? currency,
    int? id,
    dynamic? accepted_payments,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$rental$business$details<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$business$details<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$rental$business$details(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_business_order_request$business_order_request$items$rental$business$details
      _instance;

  final TRes Function(
          Subscription$listen_on_business_order_request$business_order_request$items$rental$business$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? online_ordering = _undefined,
    Object? currency = _undefined,
    Object? id = _undefined,
    Object? accepted_payments = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_business_order_request$business_order_request$items$rental$business$details(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        online_ordering:
            online_ordering == _undefined || online_ordering == null
                ? _instance.online_ordering
                : (online_ordering as bool),
        currency: currency == _undefined || currency == null
            ? _instance.currency
            : (currency as String),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        accepted_payments:
            accepted_payments == _undefined || accepted_payments == null
                ? _instance.accepted_payments
                : (accepted_payments as dynamic),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$rental$business$details<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$rental$business$details<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$rental$business$details(
      this._res);

  TRes _res;

  call({
    String? name,
    bool? online_ordering,
    String? currency,
    int? id,
    dynamic? accepted_payments,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$listen_on_business_order_request$business_order_request$items$product {
  Subscription$listen_on_business_order_request$business_order_request$items$product({
    required this.business,
    required this.details,
    required this.$__typename,
  });

  factory Subscription$listen_on_business_order_request$business_order_request$items$product.fromJson(
      Map<String, dynamic> json) {
    final l$business = json['business'];
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_business_order_request$business_order_request$items$product(
      business:
          Subscription$listen_on_business_order_request$business_order_request$items$product$business
              .fromJson((l$business as Map<String, dynamic>)),
      details:
          Subscription$listen_on_business_order_request$business_order_request$items$product$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$listen_on_business_order_request$business_order_request$items$product$business
      business;

  final Subscription$listen_on_business_order_request$business_order_request$items$product$details
      details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$business = business;
    _resultData['business'] = l$business.toJson();
    final l$details = details;
    _resultData['details'] = l$details.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$business = business;
    final l$details = details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$business,
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
            is Subscription$listen_on_business_order_request$business_order_request$items$product) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$business = business;
    final lOther$business = other.business;
    if (l$business != lOther$business) {
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

extension UtilityExtension$Subscription$listen_on_business_order_request$business_order_request$items$product
    on Subscription$listen_on_business_order_request$business_order_request$items$product {
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product<
          Subscription$listen_on_business_order_request$business_order_request$items$product>
      get copyWith =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product<
    TRes> {
  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product(
    Subscription$listen_on_business_order_request$business_order_request$items$product
        instance,
    TRes Function(
            Subscription$listen_on_business_order_request$business_order_request$items$product)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$product;

  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$product;

  TRes call({
    Subscription$listen_on_business_order_request$business_order_request$items$product$business?
        business,
    Subscription$listen_on_business_order_request$business_order_request$items$product$details?
        details,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$business<
      TRes> get business;
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details<
      TRes> get details;
}

class _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$product<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$product(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_business_order_request$business_order_request$items$product
      _instance;

  final TRes Function(
          Subscription$listen_on_business_order_request$business_order_request$items$product)
      _then;

  static const _undefined = {};

  TRes call({
    Object? business = _undefined,
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_business_order_request$business_order_request$items$product(
        business: business == _undefined || business == null
            ? _instance.business
            : (business
                as Subscription$listen_on_business_order_request$business_order_request$items$product$business),
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Subscription$listen_on_business_order_request$business_order_request$items$product$details),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$business<
      TRes> get business {
    final local$business = _instance.business;
    return CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$business(
        local$business, (e) => call(business: e));
  }

  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details<
      TRes> get details {
    final local$details = _instance.details;
    return CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details(
        local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$product<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$product(
      this._res);

  TRes _res;

  call({
    Subscription$listen_on_business_order_request$business_order_request$items$product$business?
        business,
    Subscription$listen_on_business_order_request$business_order_request$items$product$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$business<
          TRes>
      get business =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$business
              .stub(_res);
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details<
          TRes>
      get details =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details
              .stub(_res);
}

class Subscription$listen_on_business_order_request$business_order_request$items$product$business {
  Subscription$listen_on_business_order_request$business_order_request$items$product$business({
    required this.details,
    required this.$__typename,
  });

  factory Subscription$listen_on_business_order_request$business_order_request$items$product$business.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_business_order_request$business_order_request$items$product$business(
      details:
          Subscription$listen_on_business_order_request$business_order_request$items$product$business$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$listen_on_business_order_request$business_order_request$items$product$business$details
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
            is Subscription$listen_on_business_order_request$business_order_request$items$product$business) ||
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

extension UtilityExtension$Subscription$listen_on_business_order_request$business_order_request$items$product$business
    on Subscription$listen_on_business_order_request$business_order_request$items$product$business {
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$business<
          Subscription$listen_on_business_order_request$business_order_request$items$product$business>
      get copyWith =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$business(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$business<
    TRes> {
  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$business(
    Subscription$listen_on_business_order_request$business_order_request$items$product$business
        instance,
    TRes Function(
            Subscription$listen_on_business_order_request$business_order_request$items$product$business)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$product$business;

  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$business.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$product$business;

  TRes call({
    Subscription$listen_on_business_order_request$business_order_request$items$product$business$details?
        details,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$business$details<
      TRes> get details;
}

class _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$product$business<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$business<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$product$business(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_business_order_request$business_order_request$items$product$business
      _instance;

  final TRes Function(
          Subscription$listen_on_business_order_request$business_order_request$items$product$business)
      _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_business_order_request$business_order_request$items$product$business(
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Subscription$listen_on_business_order_request$business_order_request$items$product$business$details),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$business$details<
      TRes> get details {
    final local$details = _instance.details;
    return CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$business$details(
        local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$product$business<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$business<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$product$business(
      this._res);

  TRes _res;

  call({
    Subscription$listen_on_business_order_request$business_order_request$items$product$business$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$business$details<
          TRes>
      get details =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$business$details
              .stub(_res);
}

class Subscription$listen_on_business_order_request$business_order_request$items$product$business$details {
  Subscription$listen_on_business_order_request$business_order_request$items$product$business$details({
    required this.name,
    required this.currency,
    required this.id,
    required this.online_ordering,
    required this.accepted_payments,
    required this.image,
    required this.$__typename,
  });

  factory Subscription$listen_on_business_order_request$business_order_request$items$product$business$details.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$currency = json['currency'];
    final l$id = json['id'];
    final l$online_ordering = json['online_ordering'];
    final l$accepted_payments = json['accepted_payments'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_business_order_request$business_order_request$items$product$business$details(
      name: (l$name as String),
      currency: (l$currency as String),
      id: (l$id as int),
      online_ordering: (l$online_ordering as bool),
      accepted_payments: mapFromJson(l$accepted_payments),
      image: (l$image as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String name;

  final String currency;

  final int id;

  final bool online_ordering;

  final dynamic accepted_payments;

  final String image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$currency = currency;
    _resultData['currency'] = l$currency;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$online_ordering = online_ordering;
    _resultData['online_ordering'] = l$online_ordering;
    final l$accepted_payments = accepted_payments;
    _resultData['accepted_payments'] = mapToJson(l$accepted_payments);
    final l$image = image;
    _resultData['image'] = l$image;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$currency = currency;
    final l$id = id;
    final l$online_ordering = online_ordering;
    final l$accepted_payments = accepted_payments;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$currency,
      l$id,
      l$online_ordering,
      l$accepted_payments,
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
            is Subscription$listen_on_business_order_request$business_order_request$items$product$business$details) ||
        runtimeType != other.runtimeType) {
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
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$online_ordering = online_ordering;
    final lOther$online_ordering = other.online_ordering;
    if (l$online_ordering != lOther$online_ordering) {
      return false;
    }
    final l$accepted_payments = accepted_payments;
    final lOther$accepted_payments = other.accepted_payments;
    if (l$accepted_payments != lOther$accepted_payments) {
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

extension UtilityExtension$Subscription$listen_on_business_order_request$business_order_request$items$product$business$details
    on Subscription$listen_on_business_order_request$business_order_request$items$product$business$details {
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$business$details<
          Subscription$listen_on_business_order_request$business_order_request$items$product$business$details>
      get copyWith =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$business$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$business$details<
    TRes> {
  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$business$details(
    Subscription$listen_on_business_order_request$business_order_request$items$product$business$details
        instance,
    TRes Function(
            Subscription$listen_on_business_order_request$business_order_request$items$product$business$details)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$product$business$details;

  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$business$details.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$product$business$details;

  TRes call({
    String? name,
    String? currency,
    int? id,
    bool? online_ordering,
    dynamic? accepted_payments,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$product$business$details<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$business$details<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$product$business$details(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_business_order_request$business_order_request$items$product$business$details
      _instance;

  final TRes Function(
          Subscription$listen_on_business_order_request$business_order_request$items$product$business$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? currency = _undefined,
    Object? id = _undefined,
    Object? online_ordering = _undefined,
    Object? accepted_payments = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_business_order_request$business_order_request$items$product$business$details(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        currency: currency == _undefined || currency == null
            ? _instance.currency
            : (currency as String),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        online_ordering:
            online_ordering == _undefined || online_ordering == null
                ? _instance.online_ordering
                : (online_ordering as bool),
        accepted_payments:
            accepted_payments == _undefined || accepted_payments == null
                ? _instance.accepted_payments
                : (accepted_payments as dynamic),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$product$business$details<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$business$details<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$product$business$details(
      this._res);

  TRes _res;

  call({
    String? name,
    String? currency,
    int? id,
    bool? online_ordering,
    dynamic? accepted_payments,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$listen_on_business_order_request$business_order_request$items$product$details {
  Subscription$listen_on_business_order_request$business_order_request$items$product$details({
    this.additional_parameters,
    required this.available,
    required this.category1,
    required this.category2,
    required this.name_id,
    this.description_id,
    required this.cost,
    required this.tags,
    this.description,
    required this.id,
    this.image,
    required this.name,
    required this.$__typename,
  });

  factory Subscription$listen_on_business_order_request$business_order_request$items$product$details.fromJson(
      Map<String, dynamic> json) {
    final l$additional_parameters = json['additional_parameters'];
    final l$available = json['available'];
    final l$category1 = json['category1'];
    final l$category2 = json['category2'];
    final l$name_id = json['name_id'];
    final l$description_id = json['description_id'];
    final l$cost = json['cost'];
    final l$tags = json['tags'];
    final l$description = json['description'];
    final l$id = json['id'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_business_order_request$business_order_request$items$product$details(
      additional_parameters: l$additional_parameters == null
          ? null
          : mapFromJson(l$additional_parameters),
      available: (l$available as bool),
      category1: (l$category1 as String),
      category2: (l$category2 as String),
      name_id: (l$name_id as int),
      description_id: (l$description_id as int?),
      cost: mapFromJson(l$cost),
      tags: mapFromJson(l$tags),
      description: l$description == null
          ? null
          : Subscription$listen_on_business_order_request$business_order_request$items$product$details$description
              .fromJson((l$description as Map<String, dynamic>)),
      id: (l$id as int),
      image: l$image == null ? null : mapFromJson(l$image),
      name:
          Subscription$listen_on_business_order_request$business_order_request$items$product$details$name
              .fromJson((l$name as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final dynamic? additional_parameters;

  final bool available;

  final String category1;

  final String category2;

  final int name_id;

  final int? description_id;

  final dynamic cost;

  final dynamic tags;

  final Subscription$listen_on_business_order_request$business_order_request$items$product$details$description?
      description;

  final int id;

  final dynamic? image;

  final Subscription$listen_on_business_order_request$business_order_request$items$product$details$name
      name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$additional_parameters = additional_parameters;
    _resultData['additional_parameters'] = l$additional_parameters == null
        ? null
        : mapToJson(l$additional_parameters);
    final l$available = available;
    _resultData['available'] = l$available;
    final l$category1 = category1;
    _resultData['category1'] = l$category1;
    final l$category2 = category2;
    _resultData['category2'] = l$category2;
    final l$name_id = name_id;
    _resultData['name_id'] = l$name_id;
    final l$description_id = description_id;
    _resultData['description_id'] = l$description_id;
    final l$cost = cost;
    _resultData['cost'] = mapToJson(l$cost);
    final l$tags = tags;
    _resultData['tags'] = mapToJson(l$tags);
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
    final l$id = id;
    _resultData['id'] = l$id;
    final l$image = image;
    _resultData['image'] = l$image == null ? null : mapToJson(l$image);
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$additional_parameters = additional_parameters;
    final l$available = available;
    final l$category1 = category1;
    final l$category2 = category2;
    final l$name_id = name_id;
    final l$description_id = description_id;
    final l$cost = cost;
    final l$tags = tags;
    final l$description = description;
    final l$id = id;
    final l$image = image;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$additional_parameters,
      l$available,
      l$category1,
      l$category2,
      l$name_id,
      l$description_id,
      l$cost,
      l$tags,
      l$description,
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
            is Subscription$listen_on_business_order_request$business_order_request$items$product$details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$additional_parameters = additional_parameters;
    final lOther$additional_parameters = other.additional_parameters;
    if (l$additional_parameters != lOther$additional_parameters) {
      return false;
    }
    final l$available = available;
    final lOther$available = other.available;
    if (l$available != lOther$available) {
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
    final l$name_id = name_id;
    final lOther$name_id = other.name_id;
    if (l$name_id != lOther$name_id) {
      return false;
    }
    final l$description_id = description_id;
    final lOther$description_id = other.description_id;
    if (l$description_id != lOther$description_id) {
      return false;
    }
    final l$cost = cost;
    final lOther$cost = other.cost;
    if (l$cost != lOther$cost) {
      return false;
    }
    final l$tags = tags;
    final lOther$tags = other.tags;
    if (l$tags != lOther$tags) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
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

extension UtilityExtension$Subscription$listen_on_business_order_request$business_order_request$items$product$details
    on Subscription$listen_on_business_order_request$business_order_request$items$product$details {
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details<
          Subscription$listen_on_business_order_request$business_order_request$items$product$details>
      get copyWith =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details<
    TRes> {
  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details(
    Subscription$listen_on_business_order_request$business_order_request$items$product$details
        instance,
    TRes Function(
            Subscription$listen_on_business_order_request$business_order_request$items$product$details)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$product$details;

  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$product$details;

  TRes call({
    dynamic? additional_parameters,
    bool? available,
    String? category1,
    String? category2,
    int? name_id,
    int? description_id,
    dynamic? cost,
    dynamic? tags,
    Subscription$listen_on_business_order_request$business_order_request$items$product$details$description?
        description,
    int? id,
    dynamic? image,
    Subscription$listen_on_business_order_request$business_order_request$items$product$details$name?
        name,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details$description<
      TRes> get description;
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details$name<
      TRes> get name;
}

class _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$product$details<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$product$details(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_business_order_request$business_order_request$items$product$details
      _instance;

  final TRes Function(
          Subscription$listen_on_business_order_request$business_order_request$items$product$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? additional_parameters = _undefined,
    Object? available = _undefined,
    Object? category1 = _undefined,
    Object? category2 = _undefined,
    Object? name_id = _undefined,
    Object? description_id = _undefined,
    Object? cost = _undefined,
    Object? tags = _undefined,
    Object? description = _undefined,
    Object? id = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_business_order_request$business_order_request$items$product$details(
        additional_parameters: additional_parameters == _undefined
            ? _instance.additional_parameters
            : (additional_parameters as dynamic?),
        available: available == _undefined || available == null
            ? _instance.available
            : (available as bool),
        category1: category1 == _undefined || category1 == null
            ? _instance.category1
            : (category1 as String),
        category2: category2 == _undefined || category2 == null
            ? _instance.category2
            : (category2 as String),
        name_id: name_id == _undefined || name_id == null
            ? _instance.name_id
            : (name_id as int),
        description_id: description_id == _undefined
            ? _instance.description_id
            : (description_id as int?),
        cost: cost == _undefined || cost == null
            ? _instance.cost
            : (cost as dynamic),
        tags: tags == _undefined || tags == null
            ? _instance.tags
            : (tags as dynamic),
        description: description == _undefined
            ? _instance.description
            : (description
                as Subscription$listen_on_business_order_request$business_order_request$items$product$details$description?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        image: image == _undefined ? _instance.image : (image as dynamic?),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Subscription$listen_on_business_order_request$business_order_request$items$product$details$name),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details$description<
      TRes> get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details$description
            .stub(_then(_instance))
        : CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details$description(
            local$description, (e) => call(description: e));
  }

  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details$name<
      TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details$name(
        local$name, (e) => call(name: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$product$details<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$product$details(
      this._res);

  TRes _res;

  call({
    dynamic? additional_parameters,
    bool? available,
    String? category1,
    String? category2,
    int? name_id,
    int? description_id,
    dynamic? cost,
    dynamic? tags,
    Subscription$listen_on_business_order_request$business_order_request$items$product$details$description?
        description,
    int? id,
    dynamic? image,
    Subscription$listen_on_business_order_request$business_order_request$items$product$details$name?
        name,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details$description<
          TRes>
      get description =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details$description
              .stub(_res);
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details$name<
          TRes>
      get name =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details$name
              .stub(_res);
}

class Subscription$listen_on_business_order_request$business_order_request$items$product$details$description {
  Subscription$listen_on_business_order_request$business_order_request$items$product$details$description({
    required this.translations,
    required this.$__typename,
  });

  factory Subscription$listen_on_business_order_request$business_order_request$items$product$details$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_business_order_request$business_order_request$items$product$details$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Subscription$listen_on_business_order_request$business_order_request$items$product$details$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Subscription$listen_on_business_order_request$business_order_request$items$product$details$description$translations>
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
            is Subscription$listen_on_business_order_request$business_order_request$items$product$details$description) ||
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

extension UtilityExtension$Subscription$listen_on_business_order_request$business_order_request$items$product$details$description
    on Subscription$listen_on_business_order_request$business_order_request$items$product$details$description {
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details$description<
          Subscription$listen_on_business_order_request$business_order_request$items$product$details$description>
      get copyWith =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details$description<
    TRes> {
  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details$description(
    Subscription$listen_on_business_order_request$business_order_request$items$product$details$description
        instance,
    TRes Function(
            Subscription$listen_on_business_order_request$business_order_request$items$product$details$description)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$product$details$description;

  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details$description.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$product$details$description;

  TRes call({
    List<Subscription$listen_on_business_order_request$business_order_request$items$product$details$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Subscription$listen_on_business_order_request$business_order_request$items$product$details$description$translations> Function(
              Iterable<
                  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details$description$translations<
                      Subscription$listen_on_business_order_request$business_order_request$items$product$details$description$translations>>)
          _fn);
}

class _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$product$details$description<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details$description<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$product$details$description(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_business_order_request$business_order_request$items$product$details$description
      _instance;

  final TRes Function(
          Subscription$listen_on_business_order_request$business_order_request$items$product$details$description)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_business_order_request$business_order_request$items$product$details$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Subscription$listen_on_business_order_request$business_order_request$items$product$details$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Subscription$listen_on_business_order_request$business_order_request$items$product$details$description$translations> Function(
                  Iterable<
                      CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details$description$translations<
                          Subscription$listen_on_business_order_request$business_order_request$items$product$details$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$product$details$description<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details$description<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$product$details$description(
      this._res);

  TRes _res;

  call({
    List<Subscription$listen_on_business_order_request$business_order_request$items$product$details$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Subscription$listen_on_business_order_request$business_order_request$items$product$details$description$translations {
  Subscription$listen_on_business_order_request$business_order_request$items$product$details$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Subscription$listen_on_business_order_request$business_order_request$items$product$details$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_business_order_request$business_order_request$items$product$details$description$translations(
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
            is Subscription$listen_on_business_order_request$business_order_request$items$product$details$description$translations) ||
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

extension UtilityExtension$Subscription$listen_on_business_order_request$business_order_request$items$product$details$description$translations
    on Subscription$listen_on_business_order_request$business_order_request$items$product$details$description$translations {
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details$description$translations<
          Subscription$listen_on_business_order_request$business_order_request$items$product$details$description$translations>
      get copyWith =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details$description$translations<
    TRes> {
  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details$description$translations(
    Subscription$listen_on_business_order_request$business_order_request$items$product$details$description$translations
        instance,
    TRes Function(
            Subscription$listen_on_business_order_request$business_order_request$items$product$details$description$translations)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$product$details$description$translations;

  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$product$details$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$product$details$description$translations<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details$description$translations<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$product$details$description$translations(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_business_order_request$business_order_request$items$product$details$description$translations
      _instance;

  final TRes Function(
          Subscription$listen_on_business_order_request$business_order_request$items$product$details$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_business_order_request$business_order_request$items$product$details$description$translations(
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

class _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$product$details$description$translations<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details$description$translations<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$product$details$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$listen_on_business_order_request$business_order_request$items$product$details$name {
  Subscription$listen_on_business_order_request$business_order_request$items$product$details$name({
    required this.translations,
    required this.$__typename,
  });

  factory Subscription$listen_on_business_order_request$business_order_request$items$product$details$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_business_order_request$business_order_request$items$product$details$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Subscription$listen_on_business_order_request$business_order_request$items$product$details$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Subscription$listen_on_business_order_request$business_order_request$items$product$details$name$translations>
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
            is Subscription$listen_on_business_order_request$business_order_request$items$product$details$name) ||
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

extension UtilityExtension$Subscription$listen_on_business_order_request$business_order_request$items$product$details$name
    on Subscription$listen_on_business_order_request$business_order_request$items$product$details$name {
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details$name<
          Subscription$listen_on_business_order_request$business_order_request$items$product$details$name>
      get copyWith =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details$name<
    TRes> {
  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details$name(
    Subscription$listen_on_business_order_request$business_order_request$items$product$details$name
        instance,
    TRes Function(
            Subscription$listen_on_business_order_request$business_order_request$items$product$details$name)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$product$details$name;

  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details$name.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$product$details$name;

  TRes call({
    List<Subscription$listen_on_business_order_request$business_order_request$items$product$details$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Subscription$listen_on_business_order_request$business_order_request$items$product$details$name$translations> Function(
              Iterable<
                  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details$name$translations<
                      Subscription$listen_on_business_order_request$business_order_request$items$product$details$name$translations>>)
          _fn);
}

class _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$product$details$name<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details$name<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$product$details$name(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_business_order_request$business_order_request$items$product$details$name
      _instance;

  final TRes Function(
          Subscription$listen_on_business_order_request$business_order_request$items$product$details$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_business_order_request$business_order_request$items$product$details$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Subscription$listen_on_business_order_request$business_order_request$items$product$details$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Subscription$listen_on_business_order_request$business_order_request$items$product$details$name$translations> Function(
                  Iterable<
                      CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details$name$translations<
                          Subscription$listen_on_business_order_request$business_order_request$items$product$details$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$product$details$name<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details$name<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$product$details$name(
      this._res);

  TRes _res;

  call({
    List<Subscription$listen_on_business_order_request$business_order_request$items$product$details$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Subscription$listen_on_business_order_request$business_order_request$items$product$details$name$translations {
  Subscription$listen_on_business_order_request$business_order_request$items$product$details$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Subscription$listen_on_business_order_request$business_order_request$items$product$details$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_business_order_request$business_order_request$items$product$details$name$translations(
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
            is Subscription$listen_on_business_order_request$business_order_request$items$product$details$name$translations) ||
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

extension UtilityExtension$Subscription$listen_on_business_order_request$business_order_request$items$product$details$name$translations
    on Subscription$listen_on_business_order_request$business_order_request$items$product$details$name$translations {
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details$name$translations<
          Subscription$listen_on_business_order_request$business_order_request$items$product$details$name$translations>
      get copyWith =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details$name$translations<
    TRes> {
  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details$name$translations(
    Subscription$listen_on_business_order_request$business_order_request$items$product$details$name$translations
        instance,
    TRes Function(
            Subscription$listen_on_business_order_request$business_order_request$items$product$details$name$translations)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$product$details$name$translations;

  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$product$details$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$product$details$name$translations<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details$name$translations<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$product$details$name$translations(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_business_order_request$business_order_request$items$product$details$name$translations
      _instance;

  final TRes Function(
          Subscription$listen_on_business_order_request$business_order_request$items$product$details$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_business_order_request$business_order_request$items$product$details$name$translations(
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

class _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$product$details$name$translations<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$product$details$name$translations<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$product$details$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$listen_on_business_order_request$business_order_request$items$service {
  Subscription$listen_on_business_order_request$business_order_request$items$service({
    required this.business,
    required this.details,
    required this.$__typename,
  });

  factory Subscription$listen_on_business_order_request$business_order_request$items$service.fromJson(
      Map<String, dynamic> json) {
    final l$business = json['business'];
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_business_order_request$business_order_request$items$service(
      business:
          Subscription$listen_on_business_order_request$business_order_request$items$service$business
              .fromJson((l$business as Map<String, dynamic>)),
      details:
          Subscription$listen_on_business_order_request$business_order_request$items$service$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$listen_on_business_order_request$business_order_request$items$service$business
      business;

  final Subscription$listen_on_business_order_request$business_order_request$items$service$details
      details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$business = business;
    _resultData['business'] = l$business.toJson();
    final l$details = details;
    _resultData['details'] = l$details.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$business = business;
    final l$details = details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$business,
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
            is Subscription$listen_on_business_order_request$business_order_request$items$service) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$business = business;
    final lOther$business = other.business;
    if (l$business != lOther$business) {
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

extension UtilityExtension$Subscription$listen_on_business_order_request$business_order_request$items$service
    on Subscription$listen_on_business_order_request$business_order_request$items$service {
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service<
          Subscription$listen_on_business_order_request$business_order_request$items$service>
      get copyWith =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service<
    TRes> {
  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service(
    Subscription$listen_on_business_order_request$business_order_request$items$service
        instance,
    TRes Function(
            Subscription$listen_on_business_order_request$business_order_request$items$service)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$service;

  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$service;

  TRes call({
    Subscription$listen_on_business_order_request$business_order_request$items$service$business?
        business,
    Subscription$listen_on_business_order_request$business_order_request$items$service$details?
        details,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$business<
      TRes> get business;
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details<
      TRes> get details;
}

class _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$service<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$service(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_business_order_request$business_order_request$items$service
      _instance;

  final TRes Function(
          Subscription$listen_on_business_order_request$business_order_request$items$service)
      _then;

  static const _undefined = {};

  TRes call({
    Object? business = _undefined,
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_business_order_request$business_order_request$items$service(
        business: business == _undefined || business == null
            ? _instance.business
            : (business
                as Subscription$listen_on_business_order_request$business_order_request$items$service$business),
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Subscription$listen_on_business_order_request$business_order_request$items$service$details),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$business<
      TRes> get business {
    final local$business = _instance.business;
    return CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$business(
        local$business, (e) => call(business: e));
  }

  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details<
      TRes> get details {
    final local$details = _instance.details;
    return CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details(
        local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$service<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$service(
      this._res);

  TRes _res;

  call({
    Subscription$listen_on_business_order_request$business_order_request$items$service$business?
        business,
    Subscription$listen_on_business_order_request$business_order_request$items$service$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$business<
          TRes>
      get business =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$business
              .stub(_res);
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details<
          TRes>
      get details =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details
              .stub(_res);
}

class Subscription$listen_on_business_order_request$business_order_request$items$service$business {
  Subscription$listen_on_business_order_request$business_order_request$items$service$business({
    required this.details,
    required this.$__typename,
  });

  factory Subscription$listen_on_business_order_request$business_order_request$items$service$business.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_business_order_request$business_order_request$items$service$business(
      details:
          Subscription$listen_on_business_order_request$business_order_request$items$service$business$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$listen_on_business_order_request$business_order_request$items$service$business$details
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
            is Subscription$listen_on_business_order_request$business_order_request$items$service$business) ||
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

extension UtilityExtension$Subscription$listen_on_business_order_request$business_order_request$items$service$business
    on Subscription$listen_on_business_order_request$business_order_request$items$service$business {
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$business<
          Subscription$listen_on_business_order_request$business_order_request$items$service$business>
      get copyWith =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$business(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$business<
    TRes> {
  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$business(
    Subscription$listen_on_business_order_request$business_order_request$items$service$business
        instance,
    TRes Function(
            Subscription$listen_on_business_order_request$business_order_request$items$service$business)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$service$business;

  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$business.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$service$business;

  TRes call({
    Subscription$listen_on_business_order_request$business_order_request$items$service$business$details?
        details,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$business$details<
      TRes> get details;
}

class _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$service$business<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$business<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$service$business(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_business_order_request$business_order_request$items$service$business
      _instance;

  final TRes Function(
          Subscription$listen_on_business_order_request$business_order_request$items$service$business)
      _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_business_order_request$business_order_request$items$service$business(
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Subscription$listen_on_business_order_request$business_order_request$items$service$business$details),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$business$details<
      TRes> get details {
    final local$details = _instance.details;
    return CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$business$details(
        local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$service$business<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$business<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$service$business(
      this._res);

  TRes _res;

  call({
    Subscription$listen_on_business_order_request$business_order_request$items$service$business$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$business$details<
          TRes>
      get details =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$business$details
              .stub(_res);
}

class Subscription$listen_on_business_order_request$business_order_request$items$service$business$details {
  Subscription$listen_on_business_order_request$business_order_request$items$service$business$details({
    required this.name,
    required this.currency,
    required this.id,
    required this.accepted_payments,
    required this.online_ordering,
    required this.image,
    required this.$__typename,
  });

  factory Subscription$listen_on_business_order_request$business_order_request$items$service$business$details.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$currency = json['currency'];
    final l$id = json['id'];
    final l$accepted_payments = json['accepted_payments'];
    final l$online_ordering = json['online_ordering'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_business_order_request$business_order_request$items$service$business$details(
      name: (l$name as String),
      currency: (l$currency as String),
      id: (l$id as int),
      accepted_payments: mapFromJson(l$accepted_payments),
      online_ordering: (l$online_ordering as bool),
      image: (l$image as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String name;

  final String currency;

  final int id;

  final dynamic accepted_payments;

  final bool online_ordering;

  final String image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$currency = currency;
    _resultData['currency'] = l$currency;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$accepted_payments = accepted_payments;
    _resultData['accepted_payments'] = mapToJson(l$accepted_payments);
    final l$online_ordering = online_ordering;
    _resultData['online_ordering'] = l$online_ordering;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$currency = currency;
    final l$id = id;
    final l$accepted_payments = accepted_payments;
    final l$online_ordering = online_ordering;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$currency,
      l$id,
      l$accepted_payments,
      l$online_ordering,
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
            is Subscription$listen_on_business_order_request$business_order_request$items$service$business$details) ||
        runtimeType != other.runtimeType) {
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
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$accepted_payments = accepted_payments;
    final lOther$accepted_payments = other.accepted_payments;
    if (l$accepted_payments != lOther$accepted_payments) {
      return false;
    }
    final l$online_ordering = online_ordering;
    final lOther$online_ordering = other.online_ordering;
    if (l$online_ordering != lOther$online_ordering) {
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

extension UtilityExtension$Subscription$listen_on_business_order_request$business_order_request$items$service$business$details
    on Subscription$listen_on_business_order_request$business_order_request$items$service$business$details {
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$business$details<
          Subscription$listen_on_business_order_request$business_order_request$items$service$business$details>
      get copyWith =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$business$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$business$details<
    TRes> {
  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$business$details(
    Subscription$listen_on_business_order_request$business_order_request$items$service$business$details
        instance,
    TRes Function(
            Subscription$listen_on_business_order_request$business_order_request$items$service$business$details)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$service$business$details;

  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$business$details.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$service$business$details;

  TRes call({
    String? name,
    String? currency,
    int? id,
    dynamic? accepted_payments,
    bool? online_ordering,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$service$business$details<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$business$details<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$service$business$details(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_business_order_request$business_order_request$items$service$business$details
      _instance;

  final TRes Function(
          Subscription$listen_on_business_order_request$business_order_request$items$service$business$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? currency = _undefined,
    Object? id = _undefined,
    Object? accepted_payments = _undefined,
    Object? online_ordering = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_business_order_request$business_order_request$items$service$business$details(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        currency: currency == _undefined || currency == null
            ? _instance.currency
            : (currency as String),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        accepted_payments:
            accepted_payments == _undefined || accepted_payments == null
                ? _instance.accepted_payments
                : (accepted_payments as dynamic),
        online_ordering:
            online_ordering == _undefined || online_ordering == null
                ? _instance.online_ordering
                : (online_ordering as bool),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$service$business$details<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$business$details<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$service$business$details(
      this._res);

  TRes _res;

  call({
    String? name,
    String? currency,
    int? id,
    dynamic? accepted_payments,
    bool? online_ordering,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$listen_on_business_order_request$business_order_request$items$service$details {
  Subscription$listen_on_business_order_request$business_order_request$items$service$details({
    this.additional_parameters,
    required this.available,
    required this.category1,
    required this.name_id,
    this.description_id,
    required this.category2,
    required this.cost,
    required this.tags,
    this.description,
    required this.id,
    this.image,
    required this.name,
    required this.$__typename,
  });

  factory Subscription$listen_on_business_order_request$business_order_request$items$service$details.fromJson(
      Map<String, dynamic> json) {
    final l$additional_parameters = json['additional_parameters'];
    final l$available = json['available'];
    final l$category1 = json['category1'];
    final l$name_id = json['name_id'];
    final l$description_id = json['description_id'];
    final l$category2 = json['category2'];
    final l$cost = json['cost'];
    final l$tags = json['tags'];
    final l$description = json['description'];
    final l$id = json['id'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_business_order_request$business_order_request$items$service$details(
      additional_parameters: l$additional_parameters == null
          ? null
          : mapFromJson(l$additional_parameters),
      available: (l$available as bool),
      category1: (l$category1 as String),
      name_id: (l$name_id as int),
      description_id: (l$description_id as int?),
      category2: (l$category2 as String),
      cost: mapFromJson(l$cost),
      tags: mapFromJson(l$tags),
      description: l$description == null
          ? null
          : Subscription$listen_on_business_order_request$business_order_request$items$service$details$description
              .fromJson((l$description as Map<String, dynamic>)),
      id: (l$id as int),
      image: l$image == null ? null : mapFromJson(l$image),
      name:
          Subscription$listen_on_business_order_request$business_order_request$items$service$details$name
              .fromJson((l$name as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final dynamic? additional_parameters;

  final bool available;

  final String category1;

  final int name_id;

  final int? description_id;

  final String category2;

  final dynamic cost;

  final dynamic tags;

  final Subscription$listen_on_business_order_request$business_order_request$items$service$details$description?
      description;

  final int id;

  final dynamic? image;

  final Subscription$listen_on_business_order_request$business_order_request$items$service$details$name
      name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$additional_parameters = additional_parameters;
    _resultData['additional_parameters'] = l$additional_parameters == null
        ? null
        : mapToJson(l$additional_parameters);
    final l$available = available;
    _resultData['available'] = l$available;
    final l$category1 = category1;
    _resultData['category1'] = l$category1;
    final l$name_id = name_id;
    _resultData['name_id'] = l$name_id;
    final l$description_id = description_id;
    _resultData['description_id'] = l$description_id;
    final l$category2 = category2;
    _resultData['category2'] = l$category2;
    final l$cost = cost;
    _resultData['cost'] = mapToJson(l$cost);
    final l$tags = tags;
    _resultData['tags'] = mapToJson(l$tags);
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
    final l$id = id;
    _resultData['id'] = l$id;
    final l$image = image;
    _resultData['image'] = l$image == null ? null : mapToJson(l$image);
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$additional_parameters = additional_parameters;
    final l$available = available;
    final l$category1 = category1;
    final l$name_id = name_id;
    final l$description_id = description_id;
    final l$category2 = category2;
    final l$cost = cost;
    final l$tags = tags;
    final l$description = description;
    final l$id = id;
    final l$image = image;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$additional_parameters,
      l$available,
      l$category1,
      l$name_id,
      l$description_id,
      l$category2,
      l$cost,
      l$tags,
      l$description,
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
            is Subscription$listen_on_business_order_request$business_order_request$items$service$details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$additional_parameters = additional_parameters;
    final lOther$additional_parameters = other.additional_parameters;
    if (l$additional_parameters != lOther$additional_parameters) {
      return false;
    }
    final l$available = available;
    final lOther$available = other.available;
    if (l$available != lOther$available) {
      return false;
    }
    final l$category1 = category1;
    final lOther$category1 = other.category1;
    if (l$category1 != lOther$category1) {
      return false;
    }
    final l$name_id = name_id;
    final lOther$name_id = other.name_id;
    if (l$name_id != lOther$name_id) {
      return false;
    }
    final l$description_id = description_id;
    final lOther$description_id = other.description_id;
    if (l$description_id != lOther$description_id) {
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
    final l$tags = tags;
    final lOther$tags = other.tags;
    if (l$tags != lOther$tags) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
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

extension UtilityExtension$Subscription$listen_on_business_order_request$business_order_request$items$service$details
    on Subscription$listen_on_business_order_request$business_order_request$items$service$details {
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details<
          Subscription$listen_on_business_order_request$business_order_request$items$service$details>
      get copyWith =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details<
    TRes> {
  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details(
    Subscription$listen_on_business_order_request$business_order_request$items$service$details
        instance,
    TRes Function(
            Subscription$listen_on_business_order_request$business_order_request$items$service$details)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$service$details;

  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$service$details;

  TRes call({
    dynamic? additional_parameters,
    bool? available,
    String? category1,
    int? name_id,
    int? description_id,
    String? category2,
    dynamic? cost,
    dynamic? tags,
    Subscription$listen_on_business_order_request$business_order_request$items$service$details$description?
        description,
    int? id,
    dynamic? image,
    Subscription$listen_on_business_order_request$business_order_request$items$service$details$name?
        name,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details$description<
      TRes> get description;
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details$name<
      TRes> get name;
}

class _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$service$details<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$service$details(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_business_order_request$business_order_request$items$service$details
      _instance;

  final TRes Function(
          Subscription$listen_on_business_order_request$business_order_request$items$service$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? additional_parameters = _undefined,
    Object? available = _undefined,
    Object? category1 = _undefined,
    Object? name_id = _undefined,
    Object? description_id = _undefined,
    Object? category2 = _undefined,
    Object? cost = _undefined,
    Object? tags = _undefined,
    Object? description = _undefined,
    Object? id = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_business_order_request$business_order_request$items$service$details(
        additional_parameters: additional_parameters == _undefined
            ? _instance.additional_parameters
            : (additional_parameters as dynamic?),
        available: available == _undefined || available == null
            ? _instance.available
            : (available as bool),
        category1: category1 == _undefined || category1 == null
            ? _instance.category1
            : (category1 as String),
        name_id: name_id == _undefined || name_id == null
            ? _instance.name_id
            : (name_id as int),
        description_id: description_id == _undefined
            ? _instance.description_id
            : (description_id as int?),
        category2: category2 == _undefined || category2 == null
            ? _instance.category2
            : (category2 as String),
        cost: cost == _undefined || cost == null
            ? _instance.cost
            : (cost as dynamic),
        tags: tags == _undefined || tags == null
            ? _instance.tags
            : (tags as dynamic),
        description: description == _undefined
            ? _instance.description
            : (description
                as Subscription$listen_on_business_order_request$business_order_request$items$service$details$description?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        image: image == _undefined ? _instance.image : (image as dynamic?),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Subscription$listen_on_business_order_request$business_order_request$items$service$details$name),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details$description<
      TRes> get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details$description
            .stub(_then(_instance))
        : CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details$description(
            local$description, (e) => call(description: e));
  }

  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details$name<
      TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details$name(
        local$name, (e) => call(name: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$service$details<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$service$details(
      this._res);

  TRes _res;

  call({
    dynamic? additional_parameters,
    bool? available,
    String? category1,
    int? name_id,
    int? description_id,
    String? category2,
    dynamic? cost,
    dynamic? tags,
    Subscription$listen_on_business_order_request$business_order_request$items$service$details$description?
        description,
    int? id,
    dynamic? image,
    Subscription$listen_on_business_order_request$business_order_request$items$service$details$name?
        name,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details$description<
          TRes>
      get description =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details$description
              .stub(_res);
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details$name<
          TRes>
      get name =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details$name
              .stub(_res);
}

class Subscription$listen_on_business_order_request$business_order_request$items$service$details$description {
  Subscription$listen_on_business_order_request$business_order_request$items$service$details$description({
    required this.translations,
    required this.$__typename,
  });

  factory Subscription$listen_on_business_order_request$business_order_request$items$service$details$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_business_order_request$business_order_request$items$service$details$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Subscription$listen_on_business_order_request$business_order_request$items$service$details$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Subscription$listen_on_business_order_request$business_order_request$items$service$details$description$translations>
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
            is Subscription$listen_on_business_order_request$business_order_request$items$service$details$description) ||
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

extension UtilityExtension$Subscription$listen_on_business_order_request$business_order_request$items$service$details$description
    on Subscription$listen_on_business_order_request$business_order_request$items$service$details$description {
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details$description<
          Subscription$listen_on_business_order_request$business_order_request$items$service$details$description>
      get copyWith =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details$description<
    TRes> {
  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details$description(
    Subscription$listen_on_business_order_request$business_order_request$items$service$details$description
        instance,
    TRes Function(
            Subscription$listen_on_business_order_request$business_order_request$items$service$details$description)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$service$details$description;

  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details$description.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$service$details$description;

  TRes call({
    List<Subscription$listen_on_business_order_request$business_order_request$items$service$details$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Subscription$listen_on_business_order_request$business_order_request$items$service$details$description$translations> Function(
              Iterable<
                  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details$description$translations<
                      Subscription$listen_on_business_order_request$business_order_request$items$service$details$description$translations>>)
          _fn);
}

class _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$service$details$description<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details$description<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$service$details$description(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_business_order_request$business_order_request$items$service$details$description
      _instance;

  final TRes Function(
          Subscription$listen_on_business_order_request$business_order_request$items$service$details$description)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_business_order_request$business_order_request$items$service$details$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Subscription$listen_on_business_order_request$business_order_request$items$service$details$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Subscription$listen_on_business_order_request$business_order_request$items$service$details$description$translations> Function(
                  Iterable<
                      CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details$description$translations<
                          Subscription$listen_on_business_order_request$business_order_request$items$service$details$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$service$details$description<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details$description<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$service$details$description(
      this._res);

  TRes _res;

  call({
    List<Subscription$listen_on_business_order_request$business_order_request$items$service$details$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Subscription$listen_on_business_order_request$business_order_request$items$service$details$description$translations {
  Subscription$listen_on_business_order_request$business_order_request$items$service$details$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Subscription$listen_on_business_order_request$business_order_request$items$service$details$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_business_order_request$business_order_request$items$service$details$description$translations(
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
            is Subscription$listen_on_business_order_request$business_order_request$items$service$details$description$translations) ||
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

extension UtilityExtension$Subscription$listen_on_business_order_request$business_order_request$items$service$details$description$translations
    on Subscription$listen_on_business_order_request$business_order_request$items$service$details$description$translations {
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details$description$translations<
          Subscription$listen_on_business_order_request$business_order_request$items$service$details$description$translations>
      get copyWith =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details$description$translations<
    TRes> {
  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details$description$translations(
    Subscription$listen_on_business_order_request$business_order_request$items$service$details$description$translations
        instance,
    TRes Function(
            Subscription$listen_on_business_order_request$business_order_request$items$service$details$description$translations)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$service$details$description$translations;

  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$service$details$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$service$details$description$translations<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details$description$translations<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$service$details$description$translations(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_business_order_request$business_order_request$items$service$details$description$translations
      _instance;

  final TRes Function(
          Subscription$listen_on_business_order_request$business_order_request$items$service$details$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_business_order_request$business_order_request$items$service$details$description$translations(
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

class _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$service$details$description$translations<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details$description$translations<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$service$details$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$listen_on_business_order_request$business_order_request$items$service$details$name {
  Subscription$listen_on_business_order_request$business_order_request$items$service$details$name({
    required this.translations,
    required this.$__typename,
  });

  factory Subscription$listen_on_business_order_request$business_order_request$items$service$details$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_business_order_request$business_order_request$items$service$details$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Subscription$listen_on_business_order_request$business_order_request$items$service$details$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Subscription$listen_on_business_order_request$business_order_request$items$service$details$name$translations>
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
            is Subscription$listen_on_business_order_request$business_order_request$items$service$details$name) ||
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

extension UtilityExtension$Subscription$listen_on_business_order_request$business_order_request$items$service$details$name
    on Subscription$listen_on_business_order_request$business_order_request$items$service$details$name {
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details$name<
          Subscription$listen_on_business_order_request$business_order_request$items$service$details$name>
      get copyWith =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details$name<
    TRes> {
  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details$name(
    Subscription$listen_on_business_order_request$business_order_request$items$service$details$name
        instance,
    TRes Function(
            Subscription$listen_on_business_order_request$business_order_request$items$service$details$name)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$service$details$name;

  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details$name.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$service$details$name;

  TRes call({
    List<Subscription$listen_on_business_order_request$business_order_request$items$service$details$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Subscription$listen_on_business_order_request$business_order_request$items$service$details$name$translations> Function(
              Iterable<
                  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details$name$translations<
                      Subscription$listen_on_business_order_request$business_order_request$items$service$details$name$translations>>)
          _fn);
}

class _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$service$details$name<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details$name<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$service$details$name(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_business_order_request$business_order_request$items$service$details$name
      _instance;

  final TRes Function(
          Subscription$listen_on_business_order_request$business_order_request$items$service$details$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_business_order_request$business_order_request$items$service$details$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Subscription$listen_on_business_order_request$business_order_request$items$service$details$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Subscription$listen_on_business_order_request$business_order_request$items$service$details$name$translations> Function(
                  Iterable<
                      CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details$name$translations<
                          Subscription$listen_on_business_order_request$business_order_request$items$service$details$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$service$details$name<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details$name<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$service$details$name(
      this._res);

  TRes _res;

  call({
    List<Subscription$listen_on_business_order_request$business_order_request$items$service$details$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Subscription$listen_on_business_order_request$business_order_request$items$service$details$name$translations {
  Subscription$listen_on_business_order_request$business_order_request$items$service$details$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Subscription$listen_on_business_order_request$business_order_request$items$service$details$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_business_order_request$business_order_request$items$service$details$name$translations(
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
            is Subscription$listen_on_business_order_request$business_order_request$items$service$details$name$translations) ||
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

extension UtilityExtension$Subscription$listen_on_business_order_request$business_order_request$items$service$details$name$translations
    on Subscription$listen_on_business_order_request$business_order_request$items$service$details$name$translations {
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details$name$translations<
          Subscription$listen_on_business_order_request$business_order_request$items$service$details$name$translations>
      get copyWith =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details$name$translations<
    TRes> {
  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details$name$translations(
    Subscription$listen_on_business_order_request$business_order_request$items$service$details$name$translations
        instance,
    TRes Function(
            Subscription$listen_on_business_order_request$business_order_request$items$service$details$name$translations)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$service$details$name$translations;

  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$service$details$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$service$details$name$translations<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details$name$translations<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$service$details$name$translations(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_business_order_request$business_order_request$items$service$details$name$translations
      _instance;

  final TRes Function(
          Subscription$listen_on_business_order_request$business_order_request$items$service$details$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_business_order_request$business_order_request$items$service$details$name$translations(
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

class _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$service$details$name$translations<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$service$details$name$translations<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$service$details$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$listen_on_business_order_request$business_order_request$items$event {
  Subscription$listen_on_business_order_request$business_order_request$items$event({
    required this.business,
    required this.details,
    required this.id,
    required this.schedule_type,
    this.schedule,
    this.starts_at,
    this.ends_at,
    required this.$__typename,
  });

  factory Subscription$listen_on_business_order_request$business_order_request$items$event.fromJson(
      Map<String, dynamic> json) {
    final l$business = json['business'];
    final l$details = json['details'];
    final l$id = json['id'];
    final l$schedule_type = json['schedule_type'];
    final l$schedule = json['schedule'];
    final l$starts_at = json['starts_at'];
    final l$ends_at = json['ends_at'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_business_order_request$business_order_request$items$event(
      business:
          Subscription$listen_on_business_order_request$business_order_request$items$event$business
              .fromJson((l$business as Map<String, dynamic>)),
      details:
          Subscription$listen_on_business_order_request$business_order_request$items$event$details
              .fromJson((l$details as Map<String, dynamic>)),
      id: (l$id as int),
      schedule_type: (l$schedule_type as String),
      schedule: l$schedule == null ? null : mapFromJson(l$schedule),
      starts_at: (l$starts_at as String?),
      ends_at: (l$ends_at as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$listen_on_business_order_request$business_order_request$items$event$business
      business;

  final Subscription$listen_on_business_order_request$business_order_request$items$event$details
      details;

  final int id;

  final String schedule_type;

  final dynamic? schedule;

  final String? starts_at;

  final String? ends_at;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$business = business;
    _resultData['business'] = l$business.toJson();
    final l$details = details;
    _resultData['details'] = l$details.toJson();
    final l$id = id;
    _resultData['id'] = l$id;
    final l$schedule_type = schedule_type;
    _resultData['schedule_type'] = l$schedule_type;
    final l$schedule = schedule;
    _resultData['schedule'] = l$schedule == null ? null : mapToJson(l$schedule);
    final l$starts_at = starts_at;
    _resultData['starts_at'] = l$starts_at;
    final l$ends_at = ends_at;
    _resultData['ends_at'] = l$ends_at;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$business = business;
    final l$details = details;
    final l$id = id;
    final l$schedule_type = schedule_type;
    final l$schedule = schedule;
    final l$starts_at = starts_at;
    final l$ends_at = ends_at;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$business,
      l$details,
      l$id,
      l$schedule_type,
      l$schedule,
      l$starts_at,
      l$ends_at,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$listen_on_business_order_request$business_order_request$items$event) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$business = business;
    final lOther$business = other.business;
    if (l$business != lOther$business) {
      return false;
    }
    final l$details = details;
    final lOther$details = other.details;
    if (l$details != lOther$details) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$schedule_type = schedule_type;
    final lOther$schedule_type = other.schedule_type;
    if (l$schedule_type != lOther$schedule_type) {
      return false;
    }
    final l$schedule = schedule;
    final lOther$schedule = other.schedule;
    if (l$schedule != lOther$schedule) {
      return false;
    }
    final l$starts_at = starts_at;
    final lOther$starts_at = other.starts_at;
    if (l$starts_at != lOther$starts_at) {
      return false;
    }
    final l$ends_at = ends_at;
    final lOther$ends_at = other.ends_at;
    if (l$ends_at != lOther$ends_at) {
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

extension UtilityExtension$Subscription$listen_on_business_order_request$business_order_request$items$event
    on Subscription$listen_on_business_order_request$business_order_request$items$event {
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event<
          Subscription$listen_on_business_order_request$business_order_request$items$event>
      get copyWith =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event<
    TRes> {
  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event(
    Subscription$listen_on_business_order_request$business_order_request$items$event
        instance,
    TRes Function(
            Subscription$listen_on_business_order_request$business_order_request$items$event)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$event;

  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$event;

  TRes call({
    Subscription$listen_on_business_order_request$business_order_request$items$event$business?
        business,
    Subscription$listen_on_business_order_request$business_order_request$items$event$details?
        details,
    int? id,
    String? schedule_type,
    dynamic? schedule,
    String? starts_at,
    String? ends_at,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$business<
      TRes> get business;
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$details<
      TRes> get details;
}

class _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$event<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$event(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_business_order_request$business_order_request$items$event
      _instance;

  final TRes Function(
          Subscription$listen_on_business_order_request$business_order_request$items$event)
      _then;

  static const _undefined = {};

  TRes call({
    Object? business = _undefined,
    Object? details = _undefined,
    Object? id = _undefined,
    Object? schedule_type = _undefined,
    Object? schedule = _undefined,
    Object? starts_at = _undefined,
    Object? ends_at = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_business_order_request$business_order_request$items$event(
        business: business == _undefined || business == null
            ? _instance.business
            : (business
                as Subscription$listen_on_business_order_request$business_order_request$items$event$business),
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Subscription$listen_on_business_order_request$business_order_request$items$event$details),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        schedule_type: schedule_type == _undefined || schedule_type == null
            ? _instance.schedule_type
            : (schedule_type as String),
        schedule: schedule == _undefined
            ? _instance.schedule
            : (schedule as dynamic?),
        starts_at: starts_at == _undefined
            ? _instance.starts_at
            : (starts_at as String?),
        ends_at:
            ends_at == _undefined ? _instance.ends_at : (ends_at as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$business<
      TRes> get business {
    final local$business = _instance.business;
    return CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$business(
        local$business, (e) => call(business: e));
  }

  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$details<
      TRes> get details {
    final local$details = _instance.details;
    return CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$details(
        local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$event<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$event(
      this._res);

  TRes _res;

  call({
    Subscription$listen_on_business_order_request$business_order_request$items$event$business?
        business,
    Subscription$listen_on_business_order_request$business_order_request$items$event$details?
        details,
    int? id,
    String? schedule_type,
    dynamic? schedule,
    String? starts_at,
    String? ends_at,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$business<
          TRes>
      get business =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$business
              .stub(_res);
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$details<
          TRes>
      get details =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$details
              .stub(_res);
}

class Subscription$listen_on_business_order_request$business_order_request$items$event$business {
  Subscription$listen_on_business_order_request$business_order_request$items$event$business({
    required this.details,
    required this.$__typename,
  });

  factory Subscription$listen_on_business_order_request$business_order_request$items$event$business.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_business_order_request$business_order_request$items$event$business(
      details:
          Subscription$listen_on_business_order_request$business_order_request$items$event$business$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$listen_on_business_order_request$business_order_request$items$event$business$details
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
            is Subscription$listen_on_business_order_request$business_order_request$items$event$business) ||
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

extension UtilityExtension$Subscription$listen_on_business_order_request$business_order_request$items$event$business
    on Subscription$listen_on_business_order_request$business_order_request$items$event$business {
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$business<
          Subscription$listen_on_business_order_request$business_order_request$items$event$business>
      get copyWith =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$business(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$business<
    TRes> {
  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$business(
    Subscription$listen_on_business_order_request$business_order_request$items$event$business
        instance,
    TRes Function(
            Subscription$listen_on_business_order_request$business_order_request$items$event$business)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$event$business;

  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$business.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$event$business;

  TRes call({
    Subscription$listen_on_business_order_request$business_order_request$items$event$business$details?
        details,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$business$details<
      TRes> get details;
}

class _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$event$business<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$business<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$event$business(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_business_order_request$business_order_request$items$event$business
      _instance;

  final TRes Function(
          Subscription$listen_on_business_order_request$business_order_request$items$event$business)
      _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_business_order_request$business_order_request$items$event$business(
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Subscription$listen_on_business_order_request$business_order_request$items$event$business$details),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$business$details<
      TRes> get details {
    final local$details = _instance.details;
    return CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$business$details(
        local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$event$business<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$business<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$event$business(
      this._res);

  TRes _res;

  call({
    Subscription$listen_on_business_order_request$business_order_request$items$event$business$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$business$details<
          TRes>
      get details =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$business$details
              .stub(_res);
}

class Subscription$listen_on_business_order_request$business_order_request$items$event$business$details {
  Subscription$listen_on_business_order_request$business_order_request$items$event$business$details({
    required this.name,
    required this.currency,
    required this.id,
    required this.accepted_payments,
    required this.online_ordering,
    required this.image,
    required this.$__typename,
  });

  factory Subscription$listen_on_business_order_request$business_order_request$items$event$business$details.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$currency = json['currency'];
    final l$id = json['id'];
    final l$accepted_payments = json['accepted_payments'];
    final l$online_ordering = json['online_ordering'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_business_order_request$business_order_request$items$event$business$details(
      name: (l$name as String),
      currency: (l$currency as String),
      id: (l$id as int),
      accepted_payments: mapFromJson(l$accepted_payments),
      online_ordering: (l$online_ordering as bool),
      image: (l$image as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String name;

  final String currency;

  final int id;

  final dynamic accepted_payments;

  final bool online_ordering;

  final String image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$currency = currency;
    _resultData['currency'] = l$currency;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$accepted_payments = accepted_payments;
    _resultData['accepted_payments'] = mapToJson(l$accepted_payments);
    final l$online_ordering = online_ordering;
    _resultData['online_ordering'] = l$online_ordering;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$currency = currency;
    final l$id = id;
    final l$accepted_payments = accepted_payments;
    final l$online_ordering = online_ordering;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$currency,
      l$id,
      l$accepted_payments,
      l$online_ordering,
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
            is Subscription$listen_on_business_order_request$business_order_request$items$event$business$details) ||
        runtimeType != other.runtimeType) {
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
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$accepted_payments = accepted_payments;
    final lOther$accepted_payments = other.accepted_payments;
    if (l$accepted_payments != lOther$accepted_payments) {
      return false;
    }
    final l$online_ordering = online_ordering;
    final lOther$online_ordering = other.online_ordering;
    if (l$online_ordering != lOther$online_ordering) {
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

extension UtilityExtension$Subscription$listen_on_business_order_request$business_order_request$items$event$business$details
    on Subscription$listen_on_business_order_request$business_order_request$items$event$business$details {
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$business$details<
          Subscription$listen_on_business_order_request$business_order_request$items$event$business$details>
      get copyWith =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$business$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$business$details<
    TRes> {
  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$business$details(
    Subscription$listen_on_business_order_request$business_order_request$items$event$business$details
        instance,
    TRes Function(
            Subscription$listen_on_business_order_request$business_order_request$items$event$business$details)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$event$business$details;

  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$business$details.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$event$business$details;

  TRes call({
    String? name,
    String? currency,
    int? id,
    dynamic? accepted_payments,
    bool? online_ordering,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$event$business$details<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$business$details<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$event$business$details(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_business_order_request$business_order_request$items$event$business$details
      _instance;

  final TRes Function(
          Subscription$listen_on_business_order_request$business_order_request$items$event$business$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? currency = _undefined,
    Object? id = _undefined,
    Object? accepted_payments = _undefined,
    Object? online_ordering = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_business_order_request$business_order_request$items$event$business$details(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        currency: currency == _undefined || currency == null
            ? _instance.currency
            : (currency as String),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        accepted_payments:
            accepted_payments == _undefined || accepted_payments == null
                ? _instance.accepted_payments
                : (accepted_payments as dynamic),
        online_ordering:
            online_ordering == _undefined || online_ordering == null
                ? _instance.online_ordering
                : (online_ordering as bool),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$event$business$details<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$business$details<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$event$business$details(
      this._res);

  TRes _res;

  call({
    String? name,
    String? currency,
    int? id,
    dynamic? accepted_payments,
    bool? online_ordering,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$listen_on_business_order_request$business_order_request$items$event$details {
  Subscription$listen_on_business_order_request$business_order_request$items$event$details({
    required this.name_id,
    this.description_id,
    required this.id,
    required this.name,
    this.additional_parameters,
    required this.available,
    required this.category1,
    required this.category2,
    required this.cost,
    this.image,
    required this.position,
    required this.tags,
    required this.$__typename,
  });

  factory Subscription$listen_on_business_order_request$business_order_request$items$event$details.fromJson(
      Map<String, dynamic> json) {
    final l$name_id = json['name_id'];
    final l$description_id = json['description_id'];
    final l$id = json['id'];
    final l$name = json['name'];
    final l$additional_parameters = json['additional_parameters'];
    final l$available = json['available'];
    final l$category1 = json['category1'];
    final l$category2 = json['category2'];
    final l$cost = json['cost'];
    final l$image = json['image'];
    final l$position = json['position'];
    final l$tags = json['tags'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_business_order_request$business_order_request$items$event$details(
      name_id: (l$name_id as int),
      description_id: (l$description_id as int?),
      id: (l$id as int),
      name:
          Subscription$listen_on_business_order_request$business_order_request$items$event$details$name
              .fromJson((l$name as Map<String, dynamic>)),
      additional_parameters: l$additional_parameters == null
          ? null
          : mapFromJson(l$additional_parameters),
      available: (l$available as bool),
      category1: (l$category1 as String),
      category2: (l$category2 as String),
      cost: mapFromJson(l$cost),
      image: l$image == null ? null : mapFromJson(l$image),
      position: (l$position as int),
      tags: mapFromJson(l$tags),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int name_id;

  final int? description_id;

  final int id;

  final Subscription$listen_on_business_order_request$business_order_request$items$event$details$name
      name;

  final dynamic? additional_parameters;

  final bool available;

  final String category1;

  final String category2;

  final dynamic cost;

  final dynamic? image;

  final int position;

  final dynamic tags;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name_id = name_id;
    _resultData['name_id'] = l$name_id;
    final l$description_id = description_id;
    _resultData['description_id'] = l$description_id;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$additional_parameters = additional_parameters;
    _resultData['additional_parameters'] = l$additional_parameters == null
        ? null
        : mapToJson(l$additional_parameters);
    final l$available = available;
    _resultData['available'] = l$available;
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
    final l$name_id = name_id;
    final l$description_id = description_id;
    final l$id = id;
    final l$name = name;
    final l$additional_parameters = additional_parameters;
    final l$available = available;
    final l$category1 = category1;
    final l$category2 = category2;
    final l$cost = cost;
    final l$image = image;
    final l$position = position;
    final l$tags = tags;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name_id,
      l$description_id,
      l$id,
      l$name,
      l$additional_parameters,
      l$available,
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
            is Subscription$listen_on_business_order_request$business_order_request$items$event$details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name_id = name_id;
    final lOther$name_id = other.name_id;
    if (l$name_id != lOther$name_id) {
      return false;
    }
    final l$description_id = description_id;
    final lOther$description_id = other.description_id;
    if (l$description_id != lOther$description_id) {
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
    final l$available = available;
    final lOther$available = other.available;
    if (l$available != lOther$available) {
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

extension UtilityExtension$Subscription$listen_on_business_order_request$business_order_request$items$event$details
    on Subscription$listen_on_business_order_request$business_order_request$items$event$details {
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$details<
          Subscription$listen_on_business_order_request$business_order_request$items$event$details>
      get copyWith =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$details<
    TRes> {
  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$details(
    Subscription$listen_on_business_order_request$business_order_request$items$event$details
        instance,
    TRes Function(
            Subscription$listen_on_business_order_request$business_order_request$items$event$details)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$event$details;

  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$details.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$event$details;

  TRes call({
    int? name_id,
    int? description_id,
    int? id,
    Subscription$listen_on_business_order_request$business_order_request$items$event$details$name?
        name,
    dynamic? additional_parameters,
    bool? available,
    String? category1,
    String? category2,
    dynamic? cost,
    dynamic? image,
    int? position,
    dynamic? tags,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$details$name<
      TRes> get name;
}

class _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$event$details<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$details<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$event$details(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_business_order_request$business_order_request$items$event$details
      _instance;

  final TRes Function(
          Subscription$listen_on_business_order_request$business_order_request$items$event$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name_id = _undefined,
    Object? description_id = _undefined,
    Object? id = _undefined,
    Object? name = _undefined,
    Object? additional_parameters = _undefined,
    Object? available = _undefined,
    Object? category1 = _undefined,
    Object? category2 = _undefined,
    Object? cost = _undefined,
    Object? image = _undefined,
    Object? position = _undefined,
    Object? tags = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_business_order_request$business_order_request$items$event$details(
        name_id: name_id == _undefined || name_id == null
            ? _instance.name_id
            : (name_id as int),
        description_id: description_id == _undefined
            ? _instance.description_id
            : (description_id as int?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Subscription$listen_on_business_order_request$business_order_request$items$event$details$name),
        additional_parameters: additional_parameters == _undefined
            ? _instance.additional_parameters
            : (additional_parameters as dynamic?),
        available: available == _undefined || available == null
            ? _instance.available
            : (available as bool),
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
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$details$name<
      TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$details$name(
        local$name, (e) => call(name: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$event$details<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$details<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$event$details(
      this._res);

  TRes _res;

  call({
    int? name_id,
    int? description_id,
    int? id,
    Subscription$listen_on_business_order_request$business_order_request$items$event$details$name?
        name,
    dynamic? additional_parameters,
    bool? available,
    String? category1,
    String? category2,
    dynamic? cost,
    dynamic? image,
    int? position,
    dynamic? tags,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$details$name<
          TRes>
      get name =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$details$name
              .stub(_res);
}

class Subscription$listen_on_business_order_request$business_order_request$items$event$details$name {
  Subscription$listen_on_business_order_request$business_order_request$items$event$details$name({
    required this.translations,
    required this.$__typename,
  });

  factory Subscription$listen_on_business_order_request$business_order_request$items$event$details$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_business_order_request$business_order_request$items$event$details$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Subscription$listen_on_business_order_request$business_order_request$items$event$details$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Subscription$listen_on_business_order_request$business_order_request$items$event$details$name$translations>
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
            is Subscription$listen_on_business_order_request$business_order_request$items$event$details$name) ||
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

extension UtilityExtension$Subscription$listen_on_business_order_request$business_order_request$items$event$details$name
    on Subscription$listen_on_business_order_request$business_order_request$items$event$details$name {
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$details$name<
          Subscription$listen_on_business_order_request$business_order_request$items$event$details$name>
      get copyWith =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$details$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$details$name<
    TRes> {
  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$details$name(
    Subscription$listen_on_business_order_request$business_order_request$items$event$details$name
        instance,
    TRes Function(
            Subscription$listen_on_business_order_request$business_order_request$items$event$details$name)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$event$details$name;

  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$details$name.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$event$details$name;

  TRes call({
    List<Subscription$listen_on_business_order_request$business_order_request$items$event$details$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Subscription$listen_on_business_order_request$business_order_request$items$event$details$name$translations> Function(
              Iterable<
                  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$details$name$translations<
                      Subscription$listen_on_business_order_request$business_order_request$items$event$details$name$translations>>)
          _fn);
}

class _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$event$details$name<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$details$name<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$event$details$name(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_business_order_request$business_order_request$items$event$details$name
      _instance;

  final TRes Function(
          Subscription$listen_on_business_order_request$business_order_request$items$event$details$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_business_order_request$business_order_request$items$event$details$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Subscription$listen_on_business_order_request$business_order_request$items$event$details$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Subscription$listen_on_business_order_request$business_order_request$items$event$details$name$translations> Function(
                  Iterable<
                      CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$details$name$translations<
                          Subscription$listen_on_business_order_request$business_order_request$items$event$details$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$details$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$event$details$name<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$details$name<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$event$details$name(
      this._res);

  TRes _res;

  call({
    List<Subscription$listen_on_business_order_request$business_order_request$items$event$details$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Subscription$listen_on_business_order_request$business_order_request$items$event$details$name$translations {
  Subscription$listen_on_business_order_request$business_order_request$items$event$details$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Subscription$listen_on_business_order_request$business_order_request$items$event$details$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_business_order_request$business_order_request$items$event$details$name$translations(
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
            is Subscription$listen_on_business_order_request$business_order_request$items$event$details$name$translations) ||
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

extension UtilityExtension$Subscription$listen_on_business_order_request$business_order_request$items$event$details$name$translations
    on Subscription$listen_on_business_order_request$business_order_request$items$event$details$name$translations {
  CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$details$name$translations<
          Subscription$listen_on_business_order_request$business_order_request$items$event$details$name$translations>
      get copyWith =>
          CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$details$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$details$name$translations<
    TRes> {
  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$details$name$translations(
    Subscription$listen_on_business_order_request$business_order_request$items$event$details$name$translations
        instance,
    TRes Function(
            Subscription$listen_on_business_order_request$business_order_request$items$event$details$name$translations)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$event$details$name$translations;

  factory CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$details$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$event$details$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$event$details$name$translations<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$details$name$translations<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_business_order_request$business_order_request$items$event$details$name$translations(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_business_order_request$business_order_request$items$event$details$name$translations
      _instance;

  final TRes Function(
          Subscription$listen_on_business_order_request$business_order_request$items$event$details$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_business_order_request$business_order_request$items$event$details$name$translations(
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

class _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$event$details$name$translations<
        TRes>
    implements
        CopyWith$Subscription$listen_on_business_order_request$business_order_request$items$event$details$name$translations<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_business_order_request$business_order_request$items$event$details$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$update_product_item_count {
  factory Variables$Mutation$update_product_item_count({
    required int id,
    required dynamic parameters,
    required double cost,
  }) =>
      Variables$Mutation$update_product_item_count._({
        r'id': id,
        r'parameters': parameters,
        r'cost': cost,
      });

  Variables$Mutation$update_product_item_count._(this._$data);

  factory Variables$Mutation$update_product_item_count.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    final l$parameters = data['parameters'];
    result$data['parameters'] = mapFromJson(l$parameters);
    final l$cost = data['cost'];
    result$data['cost'] = moneyFromJson(l$cost);
    return Variables$Mutation$update_product_item_count._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  dynamic get parameters => (_$data['parameters'] as dynamic);
  double get cost => (_$data['cost'] as double);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$parameters = parameters;
    result$data['parameters'] = mapToJson(l$parameters);
    final l$cost = cost;
    result$data['cost'] = moneyToJson(l$cost);
    return result$data;
  }

  CopyWith$Variables$Mutation$update_product_item_count<
          Variables$Mutation$update_product_item_count>
      get copyWith => CopyWith$Variables$Mutation$update_product_item_count(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$update_product_item_count) ||
        runtimeType != other.runtimeType) {
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
    final l$cost = cost;
    final lOther$cost = other.cost;
    if (l$cost != lOther$cost) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$parameters = parameters;
    final l$cost = cost;
    return Object.hashAll([
      l$id,
      l$parameters,
      l$cost,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$update_product_item_count<TRes> {
  factory CopyWith$Variables$Mutation$update_product_item_count(
    Variables$Mutation$update_product_item_count instance,
    TRes Function(Variables$Mutation$update_product_item_count) then,
  ) = _CopyWithImpl$Variables$Mutation$update_product_item_count;

  factory CopyWith$Variables$Mutation$update_product_item_count.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$update_product_item_count;

  TRes call({
    int? id,
    dynamic? parameters,
    double? cost,
  });
}

class _CopyWithImpl$Variables$Mutation$update_product_item_count<TRes>
    implements CopyWith$Variables$Mutation$update_product_item_count<TRes> {
  _CopyWithImpl$Variables$Mutation$update_product_item_count(
    this._instance,
    this._then,
  );

  final Variables$Mutation$update_product_item_count _instance;

  final TRes Function(Variables$Mutation$update_product_item_count) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? parameters = _undefined,
    Object? cost = _undefined,
  }) =>
      _then(Variables$Mutation$update_product_item_count._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
        if (parameters != _undefined && parameters != null)
          'parameters': (parameters as dynamic),
        if (cost != _undefined && cost != null) 'cost': (cost as double),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$update_product_item_count<TRes>
    implements CopyWith$Variables$Mutation$update_product_item_count<TRes> {
  _CopyWithStubImpl$Variables$Mutation$update_product_item_count(this._res);

  TRes _res;

  call({
    int? id,
    dynamic? parameters,
    double? cost,
  }) =>
      _res;
}

class Mutation$update_product_item_count {
  Mutation$update_product_item_count({
    this.update_business_cart_item,
    required this.$__typename,
  });

  factory Mutation$update_product_item_count.fromJson(
      Map<String, dynamic> json) {
    final l$update_business_cart_item = json['update_business_cart_item'];
    final l$$__typename = json['__typename'];
    return Mutation$update_product_item_count(
      update_business_cart_item: l$update_business_cart_item == null
          ? null
          : Mutation$update_product_item_count$update_business_cart_item
              .fromJson((l$update_business_cart_item as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$update_product_item_count$update_business_cart_item?
      update_business_cart_item;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_business_cart_item = update_business_cart_item;
    _resultData['update_business_cart_item'] =
        l$update_business_cart_item?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_business_cart_item = update_business_cart_item;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_business_cart_item,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$update_product_item_count) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_business_cart_item = update_business_cart_item;
    final lOther$update_business_cart_item = other.update_business_cart_item;
    if (l$update_business_cart_item != lOther$update_business_cart_item) {
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

extension UtilityExtension$Mutation$update_product_item_count
    on Mutation$update_product_item_count {
  CopyWith$Mutation$update_product_item_count<
          Mutation$update_product_item_count>
      get copyWith => CopyWith$Mutation$update_product_item_count(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$update_product_item_count<TRes> {
  factory CopyWith$Mutation$update_product_item_count(
    Mutation$update_product_item_count instance,
    TRes Function(Mutation$update_product_item_count) then,
  ) = _CopyWithImpl$Mutation$update_product_item_count;

  factory CopyWith$Mutation$update_product_item_count.stub(TRes res) =
      _CopyWithStubImpl$Mutation$update_product_item_count;

  TRes call({
    Mutation$update_product_item_count$update_business_cart_item?
        update_business_cart_item,
    String? $__typename,
  });
  CopyWith$Mutation$update_product_item_count$update_business_cart_item<TRes>
      get update_business_cart_item;
}

class _CopyWithImpl$Mutation$update_product_item_count<TRes>
    implements CopyWith$Mutation$update_product_item_count<TRes> {
  _CopyWithImpl$Mutation$update_product_item_count(
    this._instance,
    this._then,
  );

  final Mutation$update_product_item_count _instance;

  final TRes Function(Mutation$update_product_item_count) _then;

  static const _undefined = {};

  TRes call({
    Object? update_business_cart_item = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$update_product_item_count(
        update_business_cart_item: update_business_cart_item == _undefined
            ? _instance.update_business_cart_item
            : (update_business_cart_item
                as Mutation$update_product_item_count$update_business_cart_item?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$update_product_item_count$update_business_cart_item<TRes>
      get update_business_cart_item {
    final local$update_business_cart_item = _instance.update_business_cart_item;
    return local$update_business_cart_item == null
        ? CopyWith$Mutation$update_product_item_count$update_business_cart_item
            .stub(_then(_instance))
        : CopyWith$Mutation$update_product_item_count$update_business_cart_item(
            local$update_business_cart_item,
            (e) => call(update_business_cart_item: e));
  }
}

class _CopyWithStubImpl$Mutation$update_product_item_count<TRes>
    implements CopyWith$Mutation$update_product_item_count<TRes> {
  _CopyWithStubImpl$Mutation$update_product_item_count(this._res);

  TRes _res;

  call({
    Mutation$update_product_item_count$update_business_cart_item?
        update_business_cart_item,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$update_product_item_count$update_business_cart_item<TRes>
      get update_business_cart_item =>
          CopyWith$Mutation$update_product_item_count$update_business_cart_item
              .stub(_res);
}

const documentNodeMutationupdate_product_item_count =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'update_product_item_count'),
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
        variable: VariableNode(name: NameNode(value: 'parameters')),
        type: NamedTypeNode(
          name: NameNode(value: 'jsonb'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'cost')),
        type: NamedTypeNode(
          name: NameNode(value: 'money'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'update_business_cart_item'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'id')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'offering_type'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: StringValueNode(
                      value: 'product',
                      isBlock: false,
                    ),
                  )
                ]),
              ),
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: '_set'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'parameters'),
                value: VariableNode(name: NameNode(value: 'parameters')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'cost'),
                value: VariableNode(name: NameNode(value: 'cost')),
              ),
            ]),
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
Mutation$update_product_item_count _parserFn$Mutation$update_product_item_count(
        Map<String, dynamic> data) =>
    Mutation$update_product_item_count.fromJson(data);
typedef OnMutationCompleted$Mutation$update_product_item_count = FutureOr<void>
    Function(
  dynamic,
  Mutation$update_product_item_count?,
);

class Options$Mutation$update_product_item_count
    extends graphql.MutationOptions<Mutation$update_product_item_count> {
  Options$Mutation$update_product_item_count({
    String? operationName,
    required Variables$Mutation$update_product_item_count variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$update_product_item_count? onCompleted,
    graphql.OnMutationUpdate<Mutation$update_product_item_count>? update,
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
                        : _parserFn$Mutation$update_product_item_count(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdate_product_item_count,
          parserFn: _parserFn$Mutation$update_product_item_count,
        );

  final OnMutationCompleted$Mutation$update_product_item_count?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$update_product_item_count
    extends graphql.WatchQueryOptions<Mutation$update_product_item_count> {
  WatchOptions$Mutation$update_product_item_count({
    String? operationName,
    required Variables$Mutation$update_product_item_count variables,
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
          document: documentNodeMutationupdate_product_item_count,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$update_product_item_count,
        );
}

extension ClientExtension$Mutation$update_product_item_count
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$update_product_item_count>>
      mutate$update_product_item_count(
              Options$Mutation$update_product_item_count options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$update_product_item_count>
      watchMutation$update_product_item_count(
              WatchOptions$Mutation$update_product_item_count options) =>
          this.watchMutation(options);
}

class Mutation$update_product_item_count$update_business_cart_item {
  Mutation$update_product_item_count$update_business_cart_item({
    required this.affected_rows,
    required this.$__typename,
  });

  factory Mutation$update_product_item_count$update_business_cart_item.fromJson(
      Map<String, dynamic> json) {
    final l$affected_rows = json['affected_rows'];
    final l$$__typename = json['__typename'];
    return Mutation$update_product_item_count$update_business_cart_item(
      affected_rows: (l$affected_rows as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int affected_rows;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$affected_rows = affected_rows;
    _resultData['affected_rows'] = l$affected_rows;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$affected_rows = affected_rows;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$affected_rows,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$update_product_item_count$update_business_cart_item) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$affected_rows = affected_rows;
    final lOther$affected_rows = other.affected_rows;
    if (l$affected_rows != lOther$affected_rows) {
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

extension UtilityExtension$Mutation$update_product_item_count$update_business_cart_item
    on Mutation$update_product_item_count$update_business_cart_item {
  CopyWith$Mutation$update_product_item_count$update_business_cart_item<
          Mutation$update_product_item_count$update_business_cart_item>
      get copyWith =>
          CopyWith$Mutation$update_product_item_count$update_business_cart_item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$update_product_item_count$update_business_cart_item<
    TRes> {
  factory CopyWith$Mutation$update_product_item_count$update_business_cart_item(
    Mutation$update_product_item_count$update_business_cart_item instance,
    TRes Function(Mutation$update_product_item_count$update_business_cart_item)
        then,
  ) = _CopyWithImpl$Mutation$update_product_item_count$update_business_cart_item;

  factory CopyWith$Mutation$update_product_item_count$update_business_cart_item.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$update_product_item_count$update_business_cart_item;

  TRes call({
    int? affected_rows,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$update_product_item_count$update_business_cart_item<
        TRes>
    implements
        CopyWith$Mutation$update_product_item_count$update_business_cart_item<
            TRes> {
  _CopyWithImpl$Mutation$update_product_item_count$update_business_cart_item(
    this._instance,
    this._then,
  );

  final Mutation$update_product_item_count$update_business_cart_item _instance;

  final TRes Function(
      Mutation$update_product_item_count$update_business_cart_item) _then;

  static const _undefined = {};

  TRes call({
    Object? affected_rows = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$update_product_item_count$update_business_cart_item(
        affected_rows: affected_rows == _undefined || affected_rows == null
            ? _instance.affected_rows
            : (affected_rows as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$update_product_item_count$update_business_cart_item<
        TRes>
    implements
        CopyWith$Mutation$update_product_item_count$update_business_cart_item<
            TRes> {
  _CopyWithStubImpl$Mutation$update_product_item_count$update_business_cart_item(
      this._res);

  TRes _res;

  call({
    int? affected_rows,
    String? $__typename,
  }) =>
      _res;
}
