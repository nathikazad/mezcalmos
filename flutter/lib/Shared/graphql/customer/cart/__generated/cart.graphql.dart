import '../../../__generated/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Variables$Mutation$addItemToCart {
  factory Variables$Mutation$addItemToCart(
          {required Input$restaurant_cart_item_insert_input item}) =>
      Variables$Mutation$addItemToCart._({
        r'item': item,
      });

  Variables$Mutation$addItemToCart._(this._$data);

  factory Variables$Mutation$addItemToCart.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$item = data['item'];
    result$data['item'] = Input$restaurant_cart_item_insert_input.fromJson(
        (l$item as Map<String, dynamic>));
    return Variables$Mutation$addItemToCart._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$restaurant_cart_item_insert_input get item =>
      (_$data['item'] as Input$restaurant_cart_item_insert_input);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$item = item;
    result$data['item'] = l$item.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$addItemToCart<Variables$Mutation$addItemToCart>
      get copyWith => CopyWith$Variables$Mutation$addItemToCart(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$addItemToCart) ||
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

abstract class CopyWith$Variables$Mutation$addItemToCart<TRes> {
  factory CopyWith$Variables$Mutation$addItemToCart(
    Variables$Mutation$addItemToCart instance,
    TRes Function(Variables$Mutation$addItemToCart) then,
  ) = _CopyWithImpl$Variables$Mutation$addItemToCart;

  factory CopyWith$Variables$Mutation$addItemToCart.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$addItemToCart;

  TRes call({Input$restaurant_cart_item_insert_input? item});
}

class _CopyWithImpl$Variables$Mutation$addItemToCart<TRes>
    implements CopyWith$Variables$Mutation$addItemToCart<TRes> {
  _CopyWithImpl$Variables$Mutation$addItemToCart(
    this._instance,
    this._then,
  );

  final Variables$Mutation$addItemToCart _instance;

  final TRes Function(Variables$Mutation$addItemToCart) _then;

  static const _undefined = {};

  TRes call({Object? item = _undefined}) =>
      _then(Variables$Mutation$addItemToCart._({
        ..._instance._$data,
        if (item != _undefined && item != null)
          'item': (item as Input$restaurant_cart_item_insert_input),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$addItemToCart<TRes>
    implements CopyWith$Variables$Mutation$addItemToCart<TRes> {
  _CopyWithStubImpl$Variables$Mutation$addItemToCart(this._res);

  TRes _res;

  call({Input$restaurant_cart_item_insert_input? item}) => _res;
}

class Mutation$addItemToCart {
  Mutation$addItemToCart({
    this.insert_restaurant_cart_item_one,
    required this.$__typename,
  });

  factory Mutation$addItemToCart.fromJson(Map<String, dynamic> json) {
    final l$insert_restaurant_cart_item_one =
        json['insert_restaurant_cart_item_one'];
    final l$$__typename = json['__typename'];
    return Mutation$addItemToCart(
      insert_restaurant_cart_item_one: l$insert_restaurant_cart_item_one == null
          ? null
          : Mutation$addItemToCart$insert_restaurant_cart_item_one.fromJson(
              (l$insert_restaurant_cart_item_one as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$addItemToCart$insert_restaurant_cart_item_one?
      insert_restaurant_cart_item_one;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insert_restaurant_cart_item_one = insert_restaurant_cart_item_one;
    _resultData['insert_restaurant_cart_item_one'] =
        l$insert_restaurant_cart_item_one?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insert_restaurant_cart_item_one = insert_restaurant_cart_item_one;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$insert_restaurant_cart_item_one,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$addItemToCart) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$insert_restaurant_cart_item_one = insert_restaurant_cart_item_one;
    final lOther$insert_restaurant_cart_item_one =
        other.insert_restaurant_cart_item_one;
    if (l$insert_restaurant_cart_item_one !=
        lOther$insert_restaurant_cart_item_one) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$addItemToCart on Mutation$addItemToCart {
  CopyWith$Mutation$addItemToCart<Mutation$addItemToCart> get copyWith =>
      CopyWith$Mutation$addItemToCart(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$addItemToCart<TRes> {
  factory CopyWith$Mutation$addItemToCart(
    Mutation$addItemToCart instance,
    TRes Function(Mutation$addItemToCart) then,
  ) = _CopyWithImpl$Mutation$addItemToCart;

  factory CopyWith$Mutation$addItemToCart.stub(TRes res) =
      _CopyWithStubImpl$Mutation$addItemToCart;

  TRes call({
    Mutation$addItemToCart$insert_restaurant_cart_item_one?
        insert_restaurant_cart_item_one,
    String? $__typename,
  });
  CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one<TRes>
      get insert_restaurant_cart_item_one;
}

class _CopyWithImpl$Mutation$addItemToCart<TRes>
    implements CopyWith$Mutation$addItemToCart<TRes> {
  _CopyWithImpl$Mutation$addItemToCart(
    this._instance,
    this._then,
  );

  final Mutation$addItemToCart _instance;

  final TRes Function(Mutation$addItemToCart) _then;

  static const _undefined = {};

  TRes call({
    Object? insert_restaurant_cart_item_one = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$addItemToCart(
        insert_restaurant_cart_item_one:
            insert_restaurant_cart_item_one == _undefined
                ? _instance.insert_restaurant_cart_item_one
                : (insert_restaurant_cart_item_one
                    as Mutation$addItemToCart$insert_restaurant_cart_item_one?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one<TRes>
      get insert_restaurant_cart_item_one {
    final local$insert_restaurant_cart_item_one =
        _instance.insert_restaurant_cart_item_one;
    return local$insert_restaurant_cart_item_one == null
        ? CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one.stub(
            _then(_instance))
        : CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one(
            local$insert_restaurant_cart_item_one,
            (e) => call(insert_restaurant_cart_item_one: e));
  }
}

class _CopyWithStubImpl$Mutation$addItemToCart<TRes>
    implements CopyWith$Mutation$addItemToCart<TRes> {
  _CopyWithStubImpl$Mutation$addItemToCart(this._res);

  TRes _res;

  call({
    Mutation$addItemToCart$insert_restaurant_cart_item_one?
        insert_restaurant_cart_item_one,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one<TRes>
      get insert_restaurant_cart_item_one =>
          CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one.stub(
              _res);
}

const documentNodeMutationaddItemToCart = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'addItemToCart'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'item')),
        type: NamedTypeNode(
          name: NameNode(value: 'restaurant_cart_item_insert_input'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'insert_restaurant_cart_item_one'),
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
            name: NameNode(value: 'restaurant_cart'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'items_aggregate'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'aggregate'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'sum'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                            name: NameNode(value: 'cost_per_one'),
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
Mutation$addItemToCart _parserFn$Mutation$addItemToCart(
        Map<String, dynamic> data) =>
    Mutation$addItemToCart.fromJson(data);
typedef OnMutationCompleted$Mutation$addItemToCart = FutureOr<void> Function(
  dynamic,
  Mutation$addItemToCart?,
);

class Options$Mutation$addItemToCart
    extends graphql.MutationOptions<Mutation$addItemToCart> {
  Options$Mutation$addItemToCart({
    String? operationName,
    required Variables$Mutation$addItemToCart variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$addItemToCart? onCompleted,
    graphql.OnMutationUpdate<Mutation$addItemToCart>? update,
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
                        : _parserFn$Mutation$addItemToCart(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationaddItemToCart,
          parserFn: _parserFn$Mutation$addItemToCart,
        );

  final OnMutationCompleted$Mutation$addItemToCart? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$addItemToCart
    extends graphql.WatchQueryOptions<Mutation$addItemToCart> {
  WatchOptions$Mutation$addItemToCart({
    String? operationName,
    required Variables$Mutation$addItemToCart variables,
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
          document: documentNodeMutationaddItemToCart,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$addItemToCart,
        );
}

extension ClientExtension$Mutation$addItemToCart on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$addItemToCart>> mutate$addItemToCart(
          Options$Mutation$addItemToCart options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$addItemToCart> watchMutation$addItemToCart(
          WatchOptions$Mutation$addItemToCart options) =>
      this.watchMutation(options);
}

class Mutation$addItemToCart$insert_restaurant_cart_item_one {
  Mutation$addItemToCart$insert_restaurant_cart_item_one({
    required this.id,
    required this.restaurant_cart,
    required this.$__typename,
  });

  factory Mutation$addItemToCart$insert_restaurant_cart_item_one.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$restaurant_cart = json['restaurant_cart'];
    final l$$__typename = json['__typename'];
    return Mutation$addItemToCart$insert_restaurant_cart_item_one(
      id: (l$id as int),
      restaurant_cart:
          Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart
              .fromJson((l$restaurant_cart as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart
      restaurant_cart;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$restaurant_cart = restaurant_cart;
    _resultData['restaurant_cart'] = l$restaurant_cart.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$restaurant_cart = restaurant_cart;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$restaurant_cart,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$addItemToCart$insert_restaurant_cart_item_one) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$restaurant_cart = restaurant_cart;
    final lOther$restaurant_cart = other.restaurant_cart;
    if (l$restaurant_cart != lOther$restaurant_cart) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$addItemToCart$insert_restaurant_cart_item_one
    on Mutation$addItemToCart$insert_restaurant_cart_item_one {
  CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one<
          Mutation$addItemToCart$insert_restaurant_cart_item_one>
      get copyWith =>
          CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one<
    TRes> {
  factory CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one(
    Mutation$addItemToCart$insert_restaurant_cart_item_one instance,
    TRes Function(Mutation$addItemToCart$insert_restaurant_cart_item_one) then,
  ) = _CopyWithImpl$Mutation$addItemToCart$insert_restaurant_cart_item_one;

  factory CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$addItemToCart$insert_restaurant_cart_item_one;

  TRes call({
    int? id,
    Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart?
        restaurant_cart,
    String? $__typename,
  });
  CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart<
      TRes> get restaurant_cart;
}

class _CopyWithImpl$Mutation$addItemToCart$insert_restaurant_cart_item_one<TRes>
    implements
        CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one<TRes> {
  _CopyWithImpl$Mutation$addItemToCart$insert_restaurant_cart_item_one(
    this._instance,
    this._then,
  );

  final Mutation$addItemToCart$insert_restaurant_cart_item_one _instance;

  final TRes Function(Mutation$addItemToCart$insert_restaurant_cart_item_one)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? restaurant_cart = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$addItemToCart$insert_restaurant_cart_item_one(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        restaurant_cart: restaurant_cart == _undefined ||
                restaurant_cart == null
            ? _instance.restaurant_cart
            : (restaurant_cart
                as Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart<
      TRes> get restaurant_cart {
    final local$restaurant_cart = _instance.restaurant_cart;
    return CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart(
        local$restaurant_cart, (e) => call(restaurant_cart: e));
  }
}

class _CopyWithStubImpl$Mutation$addItemToCart$insert_restaurant_cart_item_one<
        TRes>
    implements
        CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one<TRes> {
  _CopyWithStubImpl$Mutation$addItemToCart$insert_restaurant_cart_item_one(
      this._res);

  TRes _res;

  call({
    int? id,
    Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart?
        restaurant_cart,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart<
          TRes>
      get restaurant_cart =>
          CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart
              .stub(_res);
}

class Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart {
  Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart({
    required this.items_aggregate,
    required this.$__typename,
  });

  factory Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart.fromJson(
      Map<String, dynamic> json) {
    final l$items_aggregate = json['items_aggregate'];
    final l$$__typename = json['__typename'];
    return Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart(
      items_aggregate:
          Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate
              .fromJson((l$items_aggregate as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate
      items_aggregate;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$items_aggregate = items_aggregate;
    _resultData['items_aggregate'] = l$items_aggregate.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$items_aggregate = items_aggregate;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$items_aggregate,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$items_aggregate = items_aggregate;
    final lOther$items_aggregate = other.items_aggregate;
    if (l$items_aggregate != lOther$items_aggregate) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart
    on Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart {
  CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart<
          Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart>
      get copyWith =>
          CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart<
    TRes> {
  factory CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart(
    Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart
        instance,
    TRes Function(
            Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart)
        then,
  ) = _CopyWithImpl$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart;

  factory CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart;

  TRes call({
    Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate?
        items_aggregate,
    String? $__typename,
  });
  CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate<
      TRes> get items_aggregate;
}

class _CopyWithImpl$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart<
        TRes>
    implements
        CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart<
            TRes> {
  _CopyWithImpl$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart(
    this._instance,
    this._then,
  );

  final Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart
      _instance;

  final TRes Function(
          Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart)
      _then;

  static const _undefined = {};

  TRes call({
    Object? items_aggregate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart(
        items_aggregate: items_aggregate == _undefined ||
                items_aggregate == null
            ? _instance.items_aggregate
            : (items_aggregate
                as Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate<
      TRes> get items_aggregate {
    final local$items_aggregate = _instance.items_aggregate;
    return CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate(
        local$items_aggregate, (e) => call(items_aggregate: e));
  }
}

class _CopyWithStubImpl$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart<
        TRes>
    implements
        CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart<
            TRes> {
  _CopyWithStubImpl$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart(
      this._res);

  TRes _res;

  call({
    Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate?
        items_aggregate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate<
          TRes>
      get items_aggregate =>
          CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate
              .stub(_res);
}

class Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate {
  Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate({
    this.aggregate,
    required this.$__typename,
  });

  factory Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$aggregate = json['aggregate'];
    final l$$__typename = json['__typename'];
    return Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate(
      aggregate: l$aggregate == null
          ? null
          : Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate
              .fromJson((l$aggregate as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate?
      aggregate;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$aggregate = aggregate;
    _resultData['aggregate'] = l$aggregate?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$aggregate = aggregate;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$aggregate,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$aggregate = aggregate;
    final lOther$aggregate = other.aggregate;
    if (l$aggregate != lOther$aggregate) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate
    on Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate {
  CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate<
          Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate>
      get copyWith =>
          CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate<
    TRes> {
  factory CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate(
    Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate
        instance,
    TRes Function(
            Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate)
        then,
  ) = _CopyWithImpl$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate;

  factory CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate;

  TRes call({
    Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate?
        aggregate,
    String? $__typename,
  });
  CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate<
      TRes> get aggregate;
}

class _CopyWithImpl$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate<
        TRes>
    implements
        CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate<
            TRes> {
  _CopyWithImpl$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate(
    this._instance,
    this._then,
  );

  final Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate
      _instance;

  final TRes Function(
          Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate)
      _then;

  static const _undefined = {};

  TRes call({
    Object? aggregate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate(
        aggregate: aggregate == _undefined
            ? _instance.aggregate
            : (aggregate
                as Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate<
      TRes> get aggregate {
    final local$aggregate = _instance.aggregate;
    return local$aggregate == null
        ? CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate
            .stub(_then(_instance))
        : CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate(
            local$aggregate, (e) => call(aggregate: e));
  }
}

class _CopyWithStubImpl$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate<
        TRes>
    implements
        CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate<
            TRes> {
  _CopyWithStubImpl$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate(
      this._res);

  TRes _res;

  call({
    Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate?
        aggregate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate<
          TRes>
      get aggregate =>
          CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate
              .stub(_res);
}

class Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate {
  Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate({
    this.sum,
    required this.$__typename,
  });

  factory Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$sum = json['sum'];
    final l$$__typename = json['__typename'];
    return Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate(
      sum: l$sum == null
          ? null
          : Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate$sum
              .fromJson((l$sum as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate$sum?
      sum;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$sum = sum;
    _resultData['sum'] = l$sum?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$sum = sum;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$sum,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$sum = sum;
    final lOther$sum = other.sum;
    if (l$sum != lOther$sum) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate
    on Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate {
  CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate<
          Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate>
      get copyWith =>
          CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate<
    TRes> {
  factory CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate(
    Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate
        instance,
    TRes Function(
            Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate)
        then,
  ) = _CopyWithImpl$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate;

  factory CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate;

  TRes call({
    Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate$sum?
        sum,
    String? $__typename,
  });
  CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate$sum<
      TRes> get sum;
}

class _CopyWithImpl$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate<
            TRes> {
  _CopyWithImpl$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate(
    this._instance,
    this._then,
  );

  final Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate
      _instance;

  final TRes Function(
          Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate)
      _then;

  static const _undefined = {};

  TRes call({
    Object? sum = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate(
        sum: sum == _undefined
            ? _instance.sum
            : (sum
                as Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate$sum?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate$sum<
      TRes> get sum {
    final local$sum = _instance.sum;
    return local$sum == null
        ? CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate$sum
            .stub(_then(_instance))
        : CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate$sum(
            local$sum, (e) => call(sum: e));
  }
}

class _CopyWithStubImpl$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate<
            TRes> {
  _CopyWithStubImpl$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate(
      this._res);

  TRes _res;

  call({
    Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate$sum?
        sum,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate$sum<
          TRes>
      get sum =>
          CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate$sum
              .stub(_res);
}

class Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate$sum {
  Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate$sum({
    this.cost_per_one,
    required this.$__typename,
  });

  factory Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate$sum.fromJson(
      Map<String, dynamic> json) {
    final l$cost_per_one = json['cost_per_one'];
    final l$$__typename = json['__typename'];
    return Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate$sum(
      cost_per_one:
          l$cost_per_one == null ? null : MoneyFromJson(l$cost_per_one),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final double? cost_per_one;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$cost_per_one = cost_per_one;
    _resultData['cost_per_one'] =
        l$cost_per_one == null ? null : MoneyToJson(l$cost_per_one);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$cost_per_one = cost_per_one;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$cost_per_one,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate$sum) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$cost_per_one = cost_per_one;
    final lOther$cost_per_one = other.cost_per_one;
    if (l$cost_per_one != lOther$cost_per_one) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate$sum
    on Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate$sum {
  CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate$sum<
          Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate$sum>
      get copyWith =>
          CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate$sum(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate$sum<
    TRes> {
  factory CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate$sum(
    Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate$sum
        instance,
    TRes Function(
            Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate$sum)
        then,
  ) = _CopyWithImpl$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate$sum;

  factory CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate$sum.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate$sum;

  TRes call({
    double? cost_per_one,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate$sum<
        TRes>
    implements
        CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate$sum<
            TRes> {
  _CopyWithImpl$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate$sum(
    this._instance,
    this._then,
  );

  final Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate$sum
      _instance;

  final TRes Function(
          Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate$sum)
      _then;

  static const _undefined = {};

  TRes call({
    Object? cost_per_one = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate$sum(
        cost_per_one: cost_per_one == _undefined
            ? _instance.cost_per_one
            : (cost_per_one as double?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate$sum<
        TRes>
    implements
        CopyWith$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate$sum<
            TRes> {
  _CopyWithStubImpl$Mutation$addItemToCart$insert_restaurant_cart_item_one$restaurant_cart$items_aggregate$aggregate$sum(
      this._res);

  TRes _res;

  call({
    double? cost_per_one,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$removeItemFromCart {
  factory Variables$Mutation$removeItemFromCart({required int item_id}) =>
      Variables$Mutation$removeItemFromCart._({
        r'item_id': item_id,
      });

  Variables$Mutation$removeItemFromCart._(this._$data);

  factory Variables$Mutation$removeItemFromCart.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$item_id = data['item_id'];
    result$data['item_id'] = (l$item_id as int);
    return Variables$Mutation$removeItemFromCart._(result$data);
  }

  Map<String, dynamic> _$data;

  int get item_id => (_$data['item_id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$item_id = item_id;
    result$data['item_id'] = l$item_id;
    return result$data;
  }

  CopyWith$Variables$Mutation$removeItemFromCart<
          Variables$Mutation$removeItemFromCart>
      get copyWith => CopyWith$Variables$Mutation$removeItemFromCart(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$removeItemFromCart) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$item_id = item_id;
    final lOther$item_id = other.item_id;
    if (l$item_id != lOther$item_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$item_id = item_id;
    return Object.hashAll([l$item_id]);
  }
}

abstract class CopyWith$Variables$Mutation$removeItemFromCart<TRes> {
  factory CopyWith$Variables$Mutation$removeItemFromCart(
    Variables$Mutation$removeItemFromCart instance,
    TRes Function(Variables$Mutation$removeItemFromCart) then,
  ) = _CopyWithImpl$Variables$Mutation$removeItemFromCart;

  factory CopyWith$Variables$Mutation$removeItemFromCart.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$removeItemFromCart;

  TRes call({int? item_id});
}

class _CopyWithImpl$Variables$Mutation$removeItemFromCart<TRes>
    implements CopyWith$Variables$Mutation$removeItemFromCart<TRes> {
  _CopyWithImpl$Variables$Mutation$removeItemFromCart(
    this._instance,
    this._then,
  );

  final Variables$Mutation$removeItemFromCart _instance;

  final TRes Function(Variables$Mutation$removeItemFromCart) _then;

  static const _undefined = {};

  TRes call({Object? item_id = _undefined}) =>
      _then(Variables$Mutation$removeItemFromCart._({
        ..._instance._$data,
        if (item_id != _undefined && item_id != null)
          'item_id': (item_id as int),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$removeItemFromCart<TRes>
    implements CopyWith$Variables$Mutation$removeItemFromCart<TRes> {
  _CopyWithStubImpl$Variables$Mutation$removeItemFromCart(this._res);

  TRes _res;

  call({int? item_id}) => _res;
}

class Mutation$removeItemFromCart {
  Mutation$removeItemFromCart({
    this.delete_restaurant_cart_item_by_pk,
    required this.$__typename,
  });

  factory Mutation$removeItemFromCart.fromJson(Map<String, dynamic> json) {
    final l$delete_restaurant_cart_item_by_pk =
        json['delete_restaurant_cart_item_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$removeItemFromCart(
      delete_restaurant_cart_item_by_pk:
          l$delete_restaurant_cart_item_by_pk == null
              ? null
              : Mutation$removeItemFromCart$delete_restaurant_cart_item_by_pk
                  .fromJson((l$delete_restaurant_cart_item_by_pk
                      as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$removeItemFromCart$delete_restaurant_cart_item_by_pk?
      delete_restaurant_cart_item_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delete_restaurant_cart_item_by_pk =
        delete_restaurant_cart_item_by_pk;
    _resultData['delete_restaurant_cart_item_by_pk'] =
        l$delete_restaurant_cart_item_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delete_restaurant_cart_item_by_pk =
        delete_restaurant_cart_item_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$delete_restaurant_cart_item_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$removeItemFromCart) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delete_restaurant_cart_item_by_pk =
        delete_restaurant_cart_item_by_pk;
    final lOther$delete_restaurant_cart_item_by_pk =
        other.delete_restaurant_cart_item_by_pk;
    if (l$delete_restaurant_cart_item_by_pk !=
        lOther$delete_restaurant_cart_item_by_pk) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$removeItemFromCart
    on Mutation$removeItemFromCart {
  CopyWith$Mutation$removeItemFromCart<Mutation$removeItemFromCart>
      get copyWith => CopyWith$Mutation$removeItemFromCart(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$removeItemFromCart<TRes> {
  factory CopyWith$Mutation$removeItemFromCart(
    Mutation$removeItemFromCart instance,
    TRes Function(Mutation$removeItemFromCart) then,
  ) = _CopyWithImpl$Mutation$removeItemFromCart;

  factory CopyWith$Mutation$removeItemFromCart.stub(TRes res) =
      _CopyWithStubImpl$Mutation$removeItemFromCart;

  TRes call({
    Mutation$removeItemFromCart$delete_restaurant_cart_item_by_pk?
        delete_restaurant_cart_item_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$removeItemFromCart$delete_restaurant_cart_item_by_pk<TRes>
      get delete_restaurant_cart_item_by_pk;
}

class _CopyWithImpl$Mutation$removeItemFromCart<TRes>
    implements CopyWith$Mutation$removeItemFromCart<TRes> {
  _CopyWithImpl$Mutation$removeItemFromCart(
    this._instance,
    this._then,
  );

  final Mutation$removeItemFromCart _instance;

  final TRes Function(Mutation$removeItemFromCart) _then;

  static const _undefined = {};

  TRes call({
    Object? delete_restaurant_cart_item_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$removeItemFromCart(
        delete_restaurant_cart_item_by_pk: delete_restaurant_cart_item_by_pk ==
                _undefined
            ? _instance.delete_restaurant_cart_item_by_pk
            : (delete_restaurant_cart_item_by_pk
                as Mutation$removeItemFromCart$delete_restaurant_cart_item_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$removeItemFromCart$delete_restaurant_cart_item_by_pk<TRes>
      get delete_restaurant_cart_item_by_pk {
    final local$delete_restaurant_cart_item_by_pk =
        _instance.delete_restaurant_cart_item_by_pk;
    return local$delete_restaurant_cart_item_by_pk == null
        ? CopyWith$Mutation$removeItemFromCart$delete_restaurant_cart_item_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$removeItemFromCart$delete_restaurant_cart_item_by_pk(
            local$delete_restaurant_cart_item_by_pk,
            (e) => call(delete_restaurant_cart_item_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$removeItemFromCart<TRes>
    implements CopyWith$Mutation$removeItemFromCart<TRes> {
  _CopyWithStubImpl$Mutation$removeItemFromCart(this._res);

  TRes _res;

  call({
    Mutation$removeItemFromCart$delete_restaurant_cart_item_by_pk?
        delete_restaurant_cart_item_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$removeItemFromCart$delete_restaurant_cart_item_by_pk<TRes>
      get delete_restaurant_cart_item_by_pk =>
          CopyWith$Mutation$removeItemFromCart$delete_restaurant_cart_item_by_pk
              .stub(_res);
}

const documentNodeMutationremoveItemFromCart = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'removeItemFromCart'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'item_id')),
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
        name: NameNode(value: 'delete_restaurant_cart_item_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'item_id')),
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
Mutation$removeItemFromCart _parserFn$Mutation$removeItemFromCart(
        Map<String, dynamic> data) =>
    Mutation$removeItemFromCart.fromJson(data);
typedef OnMutationCompleted$Mutation$removeItemFromCart = FutureOr<void>
    Function(
  dynamic,
  Mutation$removeItemFromCart?,
);

class Options$Mutation$removeItemFromCart
    extends graphql.MutationOptions<Mutation$removeItemFromCart> {
  Options$Mutation$removeItemFromCart({
    String? operationName,
    required Variables$Mutation$removeItemFromCart variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$removeItemFromCart? onCompleted,
    graphql.OnMutationUpdate<Mutation$removeItemFromCart>? update,
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
                        : _parserFn$Mutation$removeItemFromCart(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationremoveItemFromCart,
          parserFn: _parserFn$Mutation$removeItemFromCart,
        );

  final OnMutationCompleted$Mutation$removeItemFromCart? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$removeItemFromCart
    extends graphql.WatchQueryOptions<Mutation$removeItemFromCart> {
  WatchOptions$Mutation$removeItemFromCart({
    String? operationName,
    required Variables$Mutation$removeItemFromCart variables,
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
          document: documentNodeMutationremoveItemFromCart,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$removeItemFromCart,
        );
}

extension ClientExtension$Mutation$removeItemFromCart on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$removeItemFromCart>>
      mutate$removeItemFromCart(
              Options$Mutation$removeItemFromCart options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$removeItemFromCart>
      watchMutation$removeItemFromCart(
              WatchOptions$Mutation$removeItemFromCart options) =>
          this.watchMutation(options);
}

class Mutation$removeItemFromCart$delete_restaurant_cart_item_by_pk {
  Mutation$removeItemFromCart$delete_restaurant_cart_item_by_pk({
    required this.id,
    required this.$__typename,
  });

  factory Mutation$removeItemFromCart$delete_restaurant_cart_item_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$removeItemFromCart$delete_restaurant_cart_item_by_pk(
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
            is Mutation$removeItemFromCart$delete_restaurant_cart_item_by_pk) ||
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

extension UtilityExtension$Mutation$removeItemFromCart$delete_restaurant_cart_item_by_pk
    on Mutation$removeItemFromCart$delete_restaurant_cart_item_by_pk {
  CopyWith$Mutation$removeItemFromCart$delete_restaurant_cart_item_by_pk<
          Mutation$removeItemFromCart$delete_restaurant_cart_item_by_pk>
      get copyWith =>
          CopyWith$Mutation$removeItemFromCart$delete_restaurant_cart_item_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$removeItemFromCart$delete_restaurant_cart_item_by_pk<
    TRes> {
  factory CopyWith$Mutation$removeItemFromCart$delete_restaurant_cart_item_by_pk(
    Mutation$removeItemFromCart$delete_restaurant_cart_item_by_pk instance,
    TRes Function(Mutation$removeItemFromCart$delete_restaurant_cart_item_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$removeItemFromCart$delete_restaurant_cart_item_by_pk;

  factory CopyWith$Mutation$removeItemFromCart$delete_restaurant_cart_item_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$removeItemFromCart$delete_restaurant_cart_item_by_pk;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$removeItemFromCart$delete_restaurant_cart_item_by_pk<
        TRes>
    implements
        CopyWith$Mutation$removeItemFromCart$delete_restaurant_cart_item_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$removeItemFromCart$delete_restaurant_cart_item_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$removeItemFromCart$delete_restaurant_cart_item_by_pk _instance;

  final TRes Function(
      Mutation$removeItemFromCart$delete_restaurant_cart_item_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$removeItemFromCart$delete_restaurant_cart_item_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$removeItemFromCart$delete_restaurant_cart_item_by_pk<
        TRes>
    implements
        CopyWith$Mutation$removeItemFromCart$delete_restaurant_cart_item_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$removeItemFromCart$delete_restaurant_cart_item_by_pk(
      this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$clearCart {
  factory Variables$Mutation$clearCart({required int customer_id}) =>
      Variables$Mutation$clearCart._({
        r'customer_id': customer_id,
      });

  Variables$Mutation$clearCart._(this._$data);

  factory Variables$Mutation$clearCart.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$customer_id = data['customer_id'];
    result$data['customer_id'] = (l$customer_id as int);
    return Variables$Mutation$clearCart._(result$data);
  }

  Map<String, dynamic> _$data;

  int get customer_id => (_$data['customer_id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$customer_id = customer_id;
    result$data['customer_id'] = l$customer_id;
    return result$data;
  }

  CopyWith$Variables$Mutation$clearCart<Variables$Mutation$clearCart>
      get copyWith => CopyWith$Variables$Mutation$clearCart(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$clearCart) ||
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

abstract class CopyWith$Variables$Mutation$clearCart<TRes> {
  factory CopyWith$Variables$Mutation$clearCart(
    Variables$Mutation$clearCart instance,
    TRes Function(Variables$Mutation$clearCart) then,
  ) = _CopyWithImpl$Variables$Mutation$clearCart;

  factory CopyWith$Variables$Mutation$clearCart.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$clearCart;

  TRes call({int? customer_id});
}

class _CopyWithImpl$Variables$Mutation$clearCart<TRes>
    implements CopyWith$Variables$Mutation$clearCart<TRes> {
  _CopyWithImpl$Variables$Mutation$clearCart(
    this._instance,
    this._then,
  );

  final Variables$Mutation$clearCart _instance;

  final TRes Function(Variables$Mutation$clearCart) _then;

  static const _undefined = {};

  TRes call({Object? customer_id = _undefined}) =>
      _then(Variables$Mutation$clearCart._({
        ..._instance._$data,
        if (customer_id != _undefined && customer_id != null)
          'customer_id': (customer_id as int),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$clearCart<TRes>
    implements CopyWith$Variables$Mutation$clearCart<TRes> {
  _CopyWithStubImpl$Variables$Mutation$clearCart(this._res);

  TRes _res;

  call({int? customer_id}) => _res;
}

class Mutation$clearCart {
  Mutation$clearCart({
    this.delete_restaurant_cart,
    required this.$__typename,
  });

  factory Mutation$clearCart.fromJson(Map<String, dynamic> json) {
    final l$delete_restaurant_cart = json['delete_restaurant_cart'];
    final l$$__typename = json['__typename'];
    return Mutation$clearCart(
      delete_restaurant_cart: l$delete_restaurant_cart == null
          ? null
          : Mutation$clearCart$delete_restaurant_cart.fromJson(
              (l$delete_restaurant_cart as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$clearCart$delete_restaurant_cart? delete_restaurant_cart;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delete_restaurant_cart = delete_restaurant_cart;
    _resultData['delete_restaurant_cart'] = l$delete_restaurant_cart?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delete_restaurant_cart = delete_restaurant_cart;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$delete_restaurant_cart,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$clearCart) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$delete_restaurant_cart = delete_restaurant_cart;
    final lOther$delete_restaurant_cart = other.delete_restaurant_cart;
    if (l$delete_restaurant_cart != lOther$delete_restaurant_cart) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$clearCart on Mutation$clearCart {
  CopyWith$Mutation$clearCart<Mutation$clearCart> get copyWith =>
      CopyWith$Mutation$clearCart(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$clearCart<TRes> {
  factory CopyWith$Mutation$clearCart(
    Mutation$clearCart instance,
    TRes Function(Mutation$clearCart) then,
  ) = _CopyWithImpl$Mutation$clearCart;

  factory CopyWith$Mutation$clearCart.stub(TRes res) =
      _CopyWithStubImpl$Mutation$clearCart;

  TRes call({
    Mutation$clearCart$delete_restaurant_cart? delete_restaurant_cart,
    String? $__typename,
  });
  CopyWith$Mutation$clearCart$delete_restaurant_cart<TRes>
      get delete_restaurant_cart;
}

class _CopyWithImpl$Mutation$clearCart<TRes>
    implements CopyWith$Mutation$clearCart<TRes> {
  _CopyWithImpl$Mutation$clearCart(
    this._instance,
    this._then,
  );

  final Mutation$clearCart _instance;

  final TRes Function(Mutation$clearCart) _then;

  static const _undefined = {};

  TRes call({
    Object? delete_restaurant_cart = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$clearCart(
        delete_restaurant_cart: delete_restaurant_cart == _undefined
            ? _instance.delete_restaurant_cart
            : (delete_restaurant_cart
                as Mutation$clearCart$delete_restaurant_cart?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$clearCart$delete_restaurant_cart<TRes>
      get delete_restaurant_cart {
    final local$delete_restaurant_cart = _instance.delete_restaurant_cart;
    return local$delete_restaurant_cart == null
        ? CopyWith$Mutation$clearCart$delete_restaurant_cart.stub(
            _then(_instance))
        : CopyWith$Mutation$clearCart$delete_restaurant_cart(
            local$delete_restaurant_cart,
            (e) => call(delete_restaurant_cart: e));
  }
}

class _CopyWithStubImpl$Mutation$clearCart<TRes>
    implements CopyWith$Mutation$clearCart<TRes> {
  _CopyWithStubImpl$Mutation$clearCart(this._res);

  TRes _res;

  call({
    Mutation$clearCart$delete_restaurant_cart? delete_restaurant_cart,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$clearCart$delete_restaurant_cart<TRes>
      get delete_restaurant_cart =>
          CopyWith$Mutation$clearCart$delete_restaurant_cart.stub(_res);
}

const documentNodeMutationclearCart = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'clearCart'),
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
        name: NameNode(value: 'delete_restaurant_cart'),
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
            name: NameNode(value: 'returning'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'items_aggregate'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'aggregate'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'count'),
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
Mutation$clearCart _parserFn$Mutation$clearCart(Map<String, dynamic> data) =>
    Mutation$clearCart.fromJson(data);
typedef OnMutationCompleted$Mutation$clearCart = FutureOr<void> Function(
  dynamic,
  Mutation$clearCart?,
);

class Options$Mutation$clearCart
    extends graphql.MutationOptions<Mutation$clearCart> {
  Options$Mutation$clearCart({
    String? operationName,
    required Variables$Mutation$clearCart variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$clearCart? onCompleted,
    graphql.OnMutationUpdate<Mutation$clearCart>? update,
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
                    data == null ? null : _parserFn$Mutation$clearCart(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationclearCart,
          parserFn: _parserFn$Mutation$clearCart,
        );

  final OnMutationCompleted$Mutation$clearCart? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$clearCart
    extends graphql.WatchQueryOptions<Mutation$clearCart> {
  WatchOptions$Mutation$clearCart({
    String? operationName,
    required Variables$Mutation$clearCart variables,
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
          document: documentNodeMutationclearCart,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$clearCart,
        );
}

extension ClientExtension$Mutation$clearCart on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$clearCart>> mutate$clearCart(
          Options$Mutation$clearCart options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$clearCart> watchMutation$clearCart(
          WatchOptions$Mutation$clearCart options) =>
      this.watchMutation(options);
}

class Mutation$clearCart$delete_restaurant_cart {
  Mutation$clearCart$delete_restaurant_cart({
    required this.returning,
    required this.$__typename,
  });

  factory Mutation$clearCart$delete_restaurant_cart.fromJson(
      Map<String, dynamic> json) {
    final l$returning = json['returning'];
    final l$$__typename = json['__typename'];
    return Mutation$clearCart$delete_restaurant_cart(
      returning: (l$returning as List<dynamic>)
          .map((e) =>
              Mutation$clearCart$delete_restaurant_cart$returning.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Mutation$clearCart$delete_restaurant_cart$returning> returning;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$returning = returning;
    _resultData['returning'] = l$returning.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$returning = returning;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$returning.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$clearCart$delete_restaurant_cart) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Mutation$clearCart$delete_restaurant_cart
    on Mutation$clearCart$delete_restaurant_cart {
  CopyWith$Mutation$clearCart$delete_restaurant_cart<
          Mutation$clearCart$delete_restaurant_cart>
      get copyWith => CopyWith$Mutation$clearCart$delete_restaurant_cart(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$clearCart$delete_restaurant_cart<TRes> {
  factory CopyWith$Mutation$clearCart$delete_restaurant_cart(
    Mutation$clearCart$delete_restaurant_cart instance,
    TRes Function(Mutation$clearCart$delete_restaurant_cart) then,
  ) = _CopyWithImpl$Mutation$clearCart$delete_restaurant_cart;

  factory CopyWith$Mutation$clearCart$delete_restaurant_cart.stub(TRes res) =
      _CopyWithStubImpl$Mutation$clearCart$delete_restaurant_cart;

  TRes call({
    List<Mutation$clearCart$delete_restaurant_cart$returning>? returning,
    String? $__typename,
  });
  TRes returning(
      Iterable<Mutation$clearCart$delete_restaurant_cart$returning> Function(
              Iterable<
                  CopyWith$Mutation$clearCart$delete_restaurant_cart$returning<
                      Mutation$clearCart$delete_restaurant_cart$returning>>)
          _fn);
}

class _CopyWithImpl$Mutation$clearCart$delete_restaurant_cart<TRes>
    implements CopyWith$Mutation$clearCart$delete_restaurant_cart<TRes> {
  _CopyWithImpl$Mutation$clearCart$delete_restaurant_cart(
    this._instance,
    this._then,
  );

  final Mutation$clearCart$delete_restaurant_cart _instance;

  final TRes Function(Mutation$clearCart$delete_restaurant_cart) _then;

  static const _undefined = {};

  TRes call({
    Object? returning = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$clearCart$delete_restaurant_cart(
        returning: returning == _undefined || returning == null
            ? _instance.returning
            : (returning
                as List<Mutation$clearCart$delete_restaurant_cart$returning>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes returning(
          Iterable<Mutation$clearCart$delete_restaurant_cart$returning> Function(
                  Iterable<
                      CopyWith$Mutation$clearCart$delete_restaurant_cart$returning<
                          Mutation$clearCart$delete_restaurant_cart$returning>>)
              _fn) =>
      call(
          returning: _fn(_instance.returning.map((e) =>
              CopyWith$Mutation$clearCart$delete_restaurant_cart$returning(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Mutation$clearCart$delete_restaurant_cart<TRes>
    implements CopyWith$Mutation$clearCart$delete_restaurant_cart<TRes> {
  _CopyWithStubImpl$Mutation$clearCart$delete_restaurant_cart(this._res);

  TRes _res;

  call({
    List<Mutation$clearCart$delete_restaurant_cart$returning>? returning,
    String? $__typename,
  }) =>
      _res;
  returning(_fn) => _res;
}

class Mutation$clearCart$delete_restaurant_cart$returning {
  Mutation$clearCart$delete_restaurant_cart$returning({
    required this.items_aggregate,
    required this.$__typename,
  });

  factory Mutation$clearCart$delete_restaurant_cart$returning.fromJson(
      Map<String, dynamic> json) {
    final l$items_aggregate = json['items_aggregate'];
    final l$$__typename = json['__typename'];
    return Mutation$clearCart$delete_restaurant_cart$returning(
      items_aggregate:
          Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate
              .fromJson((l$items_aggregate as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate
      items_aggregate;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$items_aggregate = items_aggregate;
    _resultData['items_aggregate'] = l$items_aggregate.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$items_aggregate = items_aggregate;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$items_aggregate,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$clearCart$delete_restaurant_cart$returning) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$items_aggregate = items_aggregate;
    final lOther$items_aggregate = other.items_aggregate;
    if (l$items_aggregate != lOther$items_aggregate) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$clearCart$delete_restaurant_cart$returning
    on Mutation$clearCart$delete_restaurant_cart$returning {
  CopyWith$Mutation$clearCart$delete_restaurant_cart$returning<
          Mutation$clearCart$delete_restaurant_cart$returning>
      get copyWith =>
          CopyWith$Mutation$clearCart$delete_restaurant_cart$returning(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$clearCart$delete_restaurant_cart$returning<
    TRes> {
  factory CopyWith$Mutation$clearCart$delete_restaurant_cart$returning(
    Mutation$clearCart$delete_restaurant_cart$returning instance,
    TRes Function(Mutation$clearCart$delete_restaurant_cart$returning) then,
  ) = _CopyWithImpl$Mutation$clearCart$delete_restaurant_cart$returning;

  factory CopyWith$Mutation$clearCart$delete_restaurant_cart$returning.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$clearCart$delete_restaurant_cart$returning;

  TRes call({
    Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate?
        items_aggregate,
    String? $__typename,
  });
  CopyWith$Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate<
      TRes> get items_aggregate;
}

class _CopyWithImpl$Mutation$clearCart$delete_restaurant_cart$returning<TRes>
    implements
        CopyWith$Mutation$clearCart$delete_restaurant_cart$returning<TRes> {
  _CopyWithImpl$Mutation$clearCart$delete_restaurant_cart$returning(
    this._instance,
    this._then,
  );

  final Mutation$clearCart$delete_restaurant_cart$returning _instance;

  final TRes Function(Mutation$clearCart$delete_restaurant_cart$returning)
      _then;

  static const _undefined = {};

  TRes call({
    Object? items_aggregate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$clearCart$delete_restaurant_cart$returning(
        items_aggregate: items_aggregate == _undefined ||
                items_aggregate == null
            ? _instance.items_aggregate
            : (items_aggregate
                as Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate<
      TRes> get items_aggregate {
    final local$items_aggregate = _instance.items_aggregate;
    return CopyWith$Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate(
        local$items_aggregate, (e) => call(items_aggregate: e));
  }
}

class _CopyWithStubImpl$Mutation$clearCart$delete_restaurant_cart$returning<
        TRes>
    implements
        CopyWith$Mutation$clearCart$delete_restaurant_cart$returning<TRes> {
  _CopyWithStubImpl$Mutation$clearCart$delete_restaurant_cart$returning(
      this._res);

  TRes _res;

  call({
    Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate?
        items_aggregate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate<
          TRes>
      get items_aggregate =>
          CopyWith$Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate
              .stub(_res);
}

class Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate {
  Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate({
    this.aggregate,
    required this.$__typename,
  });

  factory Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$aggregate = json['aggregate'];
    final l$$__typename = json['__typename'];
    return Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate(
      aggregate: l$aggregate == null
          ? null
          : Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate$aggregate
              .fromJson((l$aggregate as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate$aggregate?
      aggregate;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$aggregate = aggregate;
    _resultData['aggregate'] = l$aggregate?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$aggregate = aggregate;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$aggregate,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$aggregate = aggregate;
    final lOther$aggregate = other.aggregate;
    if (l$aggregate != lOther$aggregate) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate
    on Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate {
  CopyWith$Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate<
          Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate>
      get copyWith =>
          CopyWith$Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate<
    TRes> {
  factory CopyWith$Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate(
    Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate
        instance,
    TRes Function(
            Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate)
        then,
  ) = _CopyWithImpl$Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate;

  factory CopyWith$Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate;

  TRes call({
    Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate$aggregate?
        aggregate,
    String? $__typename,
  });
  CopyWith$Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate$aggregate<
      TRes> get aggregate;
}

class _CopyWithImpl$Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate<
        TRes>
    implements
        CopyWith$Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate<
            TRes> {
  _CopyWithImpl$Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate(
    this._instance,
    this._then,
  );

  final Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate
      _instance;

  final TRes Function(
          Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate)
      _then;

  static const _undefined = {};

  TRes call({
    Object? aggregate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate(
        aggregate: aggregate == _undefined
            ? _instance.aggregate
            : (aggregate
                as Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate$aggregate?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate$aggregate<
      TRes> get aggregate {
    final local$aggregate = _instance.aggregate;
    return local$aggregate == null
        ? CopyWith$Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate$aggregate
            .stub(_then(_instance))
        : CopyWith$Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate$aggregate(
            local$aggregate, (e) => call(aggregate: e));
  }
}

class _CopyWithStubImpl$Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate<
        TRes>
    implements
        CopyWith$Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate<
            TRes> {
  _CopyWithStubImpl$Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate(
      this._res);

  TRes _res;

  call({
    Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate$aggregate?
        aggregate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate$aggregate<
          TRes>
      get aggregate =>
          CopyWith$Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate$aggregate
              .stub(_res);
}

class Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate$aggregate {
  Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate$aggregate({
    required this.count,
    required this.$__typename,
  });

  factory Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate$aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$count = json['count'];
    final l$$__typename = json['__typename'];
    return Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate$aggregate(
      count: (l$count as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int count;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$count = count;
    _resultData['count'] = l$count;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$count = count;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$count,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate$aggregate) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$count = count;
    final lOther$count = other.count;
    if (l$count != lOther$count) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate$aggregate
    on Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate$aggregate {
  CopyWith$Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate$aggregate<
          Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate$aggregate>
      get copyWith =>
          CopyWith$Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate$aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate$aggregate<
    TRes> {
  factory CopyWith$Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate$aggregate(
    Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate$aggregate
        instance,
    TRes Function(
            Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate$aggregate)
        then,
  ) = _CopyWithImpl$Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate$aggregate;

  factory CopyWith$Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate$aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate$aggregate;

  TRes call({
    int? count,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate$aggregate<
            TRes> {
  _CopyWithImpl$Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate$aggregate(
    this._instance,
    this._then,
  );

  final Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate$aggregate
      _instance;

  final TRes Function(
          Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate$aggregate)
      _then;

  static const _undefined = {};

  TRes call({
    Object? count = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate$aggregate(
        count: count == _undefined || count == null
            ? _instance.count
            : (count as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate$aggregate<
            TRes> {
  _CopyWithStubImpl$Mutation$clearCart$delete_restaurant_cart$returning$items_aggregate$aggregate(
      this._res);

  TRes _res;

  call({
    int? count,
    String? $__typename,
  }) =>
      _res;
}
