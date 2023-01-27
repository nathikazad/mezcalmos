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
            name: NameNode(value: 'cost_per_one'),
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
            name: NameNode(value: 'note'),
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
            name: NameNode(value: 'restaurant_item_id'),
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
    required this.cost_per_one,
    required this.customer_id,
    this.note,
    required this.quantity,
    required this.restaurant_item_id,
    required this.$__typename,
  });

  factory Mutation$addItemToCart$insert_restaurant_cart_item_one.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$cost_per_one = json['cost_per_one'];
    final l$customer_id = json['customer_id'];
    final l$note = json['note'];
    final l$quantity = json['quantity'];
    final l$restaurant_item_id = json['restaurant_item_id'];
    final l$$__typename = json['__typename'];
    return Mutation$addItemToCart$insert_restaurant_cart_item_one(
      id: (l$id as int),
      cost_per_one: moneyFromJson(l$cost_per_one),
      customer_id: (l$customer_id as int),
      note: (l$note as String?),
      quantity: (l$quantity as int),
      restaurant_item_id: (l$restaurant_item_id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final double cost_per_one;

  final int customer_id;

  final String? note;

  final int quantity;

  final int restaurant_item_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$cost_per_one = cost_per_one;
    _resultData['cost_per_one'] = moneyToJson(l$cost_per_one);
    final l$customer_id = customer_id;
    _resultData['customer_id'] = l$customer_id;
    final l$note = note;
    _resultData['note'] = l$note;
    final l$quantity = quantity;
    _resultData['quantity'] = l$quantity;
    final l$restaurant_item_id = restaurant_item_id;
    _resultData['restaurant_item_id'] = l$restaurant_item_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$cost_per_one = cost_per_one;
    final l$customer_id = customer_id;
    final l$note = note;
    final l$quantity = quantity;
    final l$restaurant_item_id = restaurant_item_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$cost_per_one,
      l$customer_id,
      l$note,
      l$quantity,
      l$restaurant_item_id,
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
    final l$cost_per_one = cost_per_one;
    final lOther$cost_per_one = other.cost_per_one;
    if (l$cost_per_one != lOther$cost_per_one) {
      return false;
    }
    final l$customer_id = customer_id;
    final lOther$customer_id = other.customer_id;
    if (l$customer_id != lOther$customer_id) {
      return false;
    }
    final l$note = note;
    final lOther$note = other.note;
    if (l$note != lOther$note) {
      return false;
    }
    final l$quantity = quantity;
    final lOther$quantity = other.quantity;
    if (l$quantity != lOther$quantity) {
      return false;
    }
    final l$restaurant_item_id = restaurant_item_id;
    final lOther$restaurant_item_id = other.restaurant_item_id;
    if (l$restaurant_item_id != lOther$restaurant_item_id) {
      return false;
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
    double? cost_per_one,
    int? customer_id,
    String? note,
    int? quantity,
    int? restaurant_item_id,
    String? $__typename,
  });
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
    Object? cost_per_one = _undefined,
    Object? customer_id = _undefined,
    Object? note = _undefined,
    Object? quantity = _undefined,
    Object? restaurant_item_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$addItemToCart$insert_restaurant_cart_item_one(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        cost_per_one: cost_per_one == _undefined || cost_per_one == null
            ? _instance.cost_per_one
            : (cost_per_one as double),
        customer_id: customer_id == _undefined || customer_id == null
            ? _instance.customer_id
            : (customer_id as int),
        note: note == _undefined ? _instance.note : (note as String?),
        quantity: quantity == _undefined || quantity == null
            ? _instance.quantity
            : (quantity as int),
        restaurant_item_id:
            restaurant_item_id == _undefined || restaurant_item_id == null
                ? _instance.restaurant_item_id
                : (restaurant_item_id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
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
    double? cost_per_one,
    int? customer_id,
    String? note,
    int? quantity,
    int? restaurant_item_id,
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

class Variables$Mutation$set_cart_restaurant_id {
  factory Variables$Mutation$set_cart_restaurant_id({
    required int restaurant_id,
    required int customer_id,
  }) =>
      Variables$Mutation$set_cart_restaurant_id._({
        r'restaurant_id': restaurant_id,
        r'customer_id': customer_id,
      });

  Variables$Mutation$set_cart_restaurant_id._(this._$data);

  factory Variables$Mutation$set_cart_restaurant_id.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$restaurant_id = data['restaurant_id'];
    result$data['restaurant_id'] = (l$restaurant_id as int);
    final l$customer_id = data['customer_id'];
    result$data['customer_id'] = (l$customer_id as int);
    return Variables$Mutation$set_cart_restaurant_id._(result$data);
  }

  Map<String, dynamic> _$data;

  int get restaurant_id => (_$data['restaurant_id'] as int);
  int get customer_id => (_$data['customer_id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$restaurant_id = restaurant_id;
    result$data['restaurant_id'] = l$restaurant_id;
    final l$customer_id = customer_id;
    result$data['customer_id'] = l$customer_id;
    return result$data;
  }

  CopyWith$Variables$Mutation$set_cart_restaurant_id<
          Variables$Mutation$set_cart_restaurant_id>
      get copyWith => CopyWith$Variables$Mutation$set_cart_restaurant_id(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$set_cart_restaurant_id) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_id = restaurant_id;
    final lOther$restaurant_id = other.restaurant_id;
    if (l$restaurant_id != lOther$restaurant_id) {
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
    final l$restaurant_id = restaurant_id;
    final l$customer_id = customer_id;
    return Object.hashAll([
      l$restaurant_id,
      l$customer_id,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$set_cart_restaurant_id<TRes> {
  factory CopyWith$Variables$Mutation$set_cart_restaurant_id(
    Variables$Mutation$set_cart_restaurant_id instance,
    TRes Function(Variables$Mutation$set_cart_restaurant_id) then,
  ) = _CopyWithImpl$Variables$Mutation$set_cart_restaurant_id;

  factory CopyWith$Variables$Mutation$set_cart_restaurant_id.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$set_cart_restaurant_id;

  TRes call({
    int? restaurant_id,
    int? customer_id,
  });
}

class _CopyWithImpl$Variables$Mutation$set_cart_restaurant_id<TRes>
    implements CopyWith$Variables$Mutation$set_cart_restaurant_id<TRes> {
  _CopyWithImpl$Variables$Mutation$set_cart_restaurant_id(
    this._instance,
    this._then,
  );

  final Variables$Mutation$set_cart_restaurant_id _instance;

  final TRes Function(Variables$Mutation$set_cart_restaurant_id) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_id = _undefined,
    Object? customer_id = _undefined,
  }) =>
      _then(Variables$Mutation$set_cart_restaurant_id._({
        ..._instance._$data,
        if (restaurant_id != _undefined && restaurant_id != null)
          'restaurant_id': (restaurant_id as int),
        if (customer_id != _undefined && customer_id != null)
          'customer_id': (customer_id as int),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$set_cart_restaurant_id<TRes>
    implements CopyWith$Variables$Mutation$set_cart_restaurant_id<TRes> {
  _CopyWithStubImpl$Variables$Mutation$set_cart_restaurant_id(this._res);

  TRes _res;

  call({
    int? restaurant_id,
    int? customer_id,
  }) =>
      _res;
}

class Mutation$set_cart_restaurant_id {
  Mutation$set_cart_restaurant_id({
    this.update_restaurant_cart_by_pk,
    required this.$__typename,
  });

  factory Mutation$set_cart_restaurant_id.fromJson(Map<String, dynamic> json) {
    final l$update_restaurant_cart_by_pk = json['update_restaurant_cart_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$set_cart_restaurant_id(
      update_restaurant_cart_by_pk: l$update_restaurant_cart_by_pk == null
          ? null
          : Mutation$set_cart_restaurant_id$update_restaurant_cart_by_pk
              .fromJson(
                  (l$update_restaurant_cart_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$set_cart_restaurant_id$update_restaurant_cart_by_pk?
      update_restaurant_cart_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_restaurant_cart_by_pk = update_restaurant_cart_by_pk;
    _resultData['update_restaurant_cart_by_pk'] =
        l$update_restaurant_cart_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_restaurant_cart_by_pk = update_restaurant_cart_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_restaurant_cart_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$set_cart_restaurant_id) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_restaurant_cart_by_pk = update_restaurant_cart_by_pk;
    final lOther$update_restaurant_cart_by_pk =
        other.update_restaurant_cart_by_pk;
    if (l$update_restaurant_cart_by_pk != lOther$update_restaurant_cart_by_pk) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$set_cart_restaurant_id
    on Mutation$set_cart_restaurant_id {
  CopyWith$Mutation$set_cart_restaurant_id<Mutation$set_cart_restaurant_id>
      get copyWith => CopyWith$Mutation$set_cart_restaurant_id(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$set_cart_restaurant_id<TRes> {
  factory CopyWith$Mutation$set_cart_restaurant_id(
    Mutation$set_cart_restaurant_id instance,
    TRes Function(Mutation$set_cart_restaurant_id) then,
  ) = _CopyWithImpl$Mutation$set_cart_restaurant_id;

  factory CopyWith$Mutation$set_cart_restaurant_id.stub(TRes res) =
      _CopyWithStubImpl$Mutation$set_cart_restaurant_id;

  TRes call({
    Mutation$set_cart_restaurant_id$update_restaurant_cart_by_pk?
        update_restaurant_cart_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$set_cart_restaurant_id$update_restaurant_cart_by_pk<TRes>
      get update_restaurant_cart_by_pk;
}

class _CopyWithImpl$Mutation$set_cart_restaurant_id<TRes>
    implements CopyWith$Mutation$set_cart_restaurant_id<TRes> {
  _CopyWithImpl$Mutation$set_cart_restaurant_id(
    this._instance,
    this._then,
  );

  final Mutation$set_cart_restaurant_id _instance;

  final TRes Function(Mutation$set_cart_restaurant_id) _then;

  static const _undefined = {};

  TRes call({
    Object? update_restaurant_cart_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$set_cart_restaurant_id(
        update_restaurant_cart_by_pk: update_restaurant_cart_by_pk == _undefined
            ? _instance.update_restaurant_cart_by_pk
            : (update_restaurant_cart_by_pk
                as Mutation$set_cart_restaurant_id$update_restaurant_cart_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$set_cart_restaurant_id$update_restaurant_cart_by_pk<TRes>
      get update_restaurant_cart_by_pk {
    final local$update_restaurant_cart_by_pk =
        _instance.update_restaurant_cart_by_pk;
    return local$update_restaurant_cart_by_pk == null
        ? CopyWith$Mutation$set_cart_restaurant_id$update_restaurant_cart_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$set_cart_restaurant_id$update_restaurant_cart_by_pk(
            local$update_restaurant_cart_by_pk,
            (e) => call(update_restaurant_cart_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$set_cart_restaurant_id<TRes>
    implements CopyWith$Mutation$set_cart_restaurant_id<TRes> {
  _CopyWithStubImpl$Mutation$set_cart_restaurant_id(this._res);

  TRes _res;

  call({
    Mutation$set_cart_restaurant_id$update_restaurant_cart_by_pk?
        update_restaurant_cart_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$set_cart_restaurant_id$update_restaurant_cart_by_pk<TRes>
      get update_restaurant_cart_by_pk =>
          CopyWith$Mutation$set_cart_restaurant_id$update_restaurant_cart_by_pk
              .stub(_res);
}

const documentNodeMutationset_cart_restaurant_id = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'set_cart_restaurant_id'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'restaurant_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
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
        name: NameNode(value: 'update_restaurant_cart_by_pk'),
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
                name: NameNode(value: 'restaurant_id'),
                value: VariableNode(name: NameNode(value: 'restaurant_id')),
              )
            ]),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'restaurant_id'),
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
Mutation$set_cart_restaurant_id _parserFn$Mutation$set_cart_restaurant_id(
        Map<String, dynamic> data) =>
    Mutation$set_cart_restaurant_id.fromJson(data);
typedef OnMutationCompleted$Mutation$set_cart_restaurant_id = FutureOr<void>
    Function(
  dynamic,
  Mutation$set_cart_restaurant_id?,
);

class Options$Mutation$set_cart_restaurant_id
    extends graphql.MutationOptions<Mutation$set_cart_restaurant_id> {
  Options$Mutation$set_cart_restaurant_id({
    String? operationName,
    required Variables$Mutation$set_cart_restaurant_id variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$set_cart_restaurant_id? onCompleted,
    graphql.OnMutationUpdate<Mutation$set_cart_restaurant_id>? update,
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
                        : _parserFn$Mutation$set_cart_restaurant_id(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationset_cart_restaurant_id,
          parserFn: _parserFn$Mutation$set_cart_restaurant_id,
        );

  final OnMutationCompleted$Mutation$set_cart_restaurant_id?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$set_cart_restaurant_id
    extends graphql.WatchQueryOptions<Mutation$set_cart_restaurant_id> {
  WatchOptions$Mutation$set_cart_restaurant_id({
    String? operationName,
    required Variables$Mutation$set_cart_restaurant_id variables,
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
          document: documentNodeMutationset_cart_restaurant_id,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$set_cart_restaurant_id,
        );
}

extension ClientExtension$Mutation$set_cart_restaurant_id
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$set_cart_restaurant_id>>
      mutate$set_cart_restaurant_id(
              Options$Mutation$set_cart_restaurant_id options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$set_cart_restaurant_id>
      watchMutation$set_cart_restaurant_id(
              WatchOptions$Mutation$set_cart_restaurant_id options) =>
          this.watchMutation(options);
}

class Mutation$set_cart_restaurant_id$update_restaurant_cart_by_pk {
  Mutation$set_cart_restaurant_id$update_restaurant_cart_by_pk({
    this.restaurant_id,
    required this.$__typename,
  });

  factory Mutation$set_cart_restaurant_id$update_restaurant_cart_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$restaurant_id = json['restaurant_id'];
    final l$$__typename = json['__typename'];
    return Mutation$set_cart_restaurant_id$update_restaurant_cart_by_pk(
      restaurant_id: (l$restaurant_id as int?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int? restaurant_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_id = restaurant_id;
    _resultData['restaurant_id'] = l$restaurant_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_id = restaurant_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$restaurant_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$set_cart_restaurant_id$update_restaurant_cart_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_id = restaurant_id;
    final lOther$restaurant_id = other.restaurant_id;
    if (l$restaurant_id != lOther$restaurant_id) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$set_cart_restaurant_id$update_restaurant_cart_by_pk
    on Mutation$set_cart_restaurant_id$update_restaurant_cart_by_pk {
  CopyWith$Mutation$set_cart_restaurant_id$update_restaurant_cart_by_pk<
          Mutation$set_cart_restaurant_id$update_restaurant_cart_by_pk>
      get copyWith =>
          CopyWith$Mutation$set_cart_restaurant_id$update_restaurant_cart_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$set_cart_restaurant_id$update_restaurant_cart_by_pk<
    TRes> {
  factory CopyWith$Mutation$set_cart_restaurant_id$update_restaurant_cart_by_pk(
    Mutation$set_cart_restaurant_id$update_restaurant_cart_by_pk instance,
    TRes Function(Mutation$set_cart_restaurant_id$update_restaurant_cart_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$set_cart_restaurant_id$update_restaurant_cart_by_pk;

  factory CopyWith$Mutation$set_cart_restaurant_id$update_restaurant_cart_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$set_cart_restaurant_id$update_restaurant_cart_by_pk;

  TRes call({
    int? restaurant_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$set_cart_restaurant_id$update_restaurant_cart_by_pk<
        TRes>
    implements
        CopyWith$Mutation$set_cart_restaurant_id$update_restaurant_cart_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$set_cart_restaurant_id$update_restaurant_cart_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$set_cart_restaurant_id$update_restaurant_cart_by_pk _instance;

  final TRes Function(
      Mutation$set_cart_restaurant_id$update_restaurant_cart_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$set_cart_restaurant_id$update_restaurant_cart_by_pk(
        restaurant_id: restaurant_id == _undefined
            ? _instance.restaurant_id
            : (restaurant_id as int?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$set_cart_restaurant_id$update_restaurant_cart_by_pk<
        TRes>
    implements
        CopyWith$Mutation$set_cart_restaurant_id$update_restaurant_cart_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$set_cart_restaurant_id$update_restaurant_cart_by_pk(
      this._res);

  TRes _res;

  call({
    int? restaurant_id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getCustomerCart {
  factory Variables$Query$getCustomerCart({required int customer_id}) =>
      Variables$Query$getCustomerCart._({
        r'customer_id': customer_id,
      });

  Variables$Query$getCustomerCart._(this._$data);

  factory Variables$Query$getCustomerCart.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$customer_id = data['customer_id'];
    result$data['customer_id'] = (l$customer_id as int);
    return Variables$Query$getCustomerCart._(result$data);
  }

  Map<String, dynamic> _$data;

  int get customer_id => (_$data['customer_id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$customer_id = customer_id;
    result$data['customer_id'] = l$customer_id;
    return result$data;
  }

  CopyWith$Variables$Query$getCustomerCart<Variables$Query$getCustomerCart>
      get copyWith => CopyWith$Variables$Query$getCustomerCart(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getCustomerCart) ||
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

abstract class CopyWith$Variables$Query$getCustomerCart<TRes> {
  factory CopyWith$Variables$Query$getCustomerCart(
    Variables$Query$getCustomerCart instance,
    TRes Function(Variables$Query$getCustomerCart) then,
  ) = _CopyWithImpl$Variables$Query$getCustomerCart;

  factory CopyWith$Variables$Query$getCustomerCart.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getCustomerCart;

  TRes call({int? customer_id});
}

class _CopyWithImpl$Variables$Query$getCustomerCart<TRes>
    implements CopyWith$Variables$Query$getCustomerCart<TRes> {
  _CopyWithImpl$Variables$Query$getCustomerCart(
    this._instance,
    this._then,
  );

  final Variables$Query$getCustomerCart _instance;

  final TRes Function(Variables$Query$getCustomerCart) _then;

  static const _undefined = {};

  TRes call({Object? customer_id = _undefined}) =>
      _then(Variables$Query$getCustomerCart._({
        ..._instance._$data,
        if (customer_id != _undefined && customer_id != null)
          'customer_id': (customer_id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getCustomerCart<TRes>
    implements CopyWith$Variables$Query$getCustomerCart<TRes> {
  _CopyWithStubImpl$Variables$Query$getCustomerCart(this._res);

  TRes _res;

  call({int? customer_id}) => _res;
}

class Query$getCustomerCart {
  Query$getCustomerCart({
    this.customer_customer_by_pk,
    required this.$__typename,
  });

  factory Query$getCustomerCart.fromJson(Map<String, dynamic> json) {
    final l$customer_customer_by_pk = json['customer_customer_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerCart(
      customer_customer_by_pk: l$customer_customer_by_pk == null
          ? null
          : Query$getCustomerCart$customer_customer_by_pk.fromJson(
              (l$customer_customer_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getCustomerCart$customer_customer_by_pk? customer_customer_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$customer_customer_by_pk = customer_customer_by_pk;
    _resultData['customer_customer_by_pk'] =
        l$customer_customer_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$customer_customer_by_pk = customer_customer_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$customer_customer_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getCustomerCart) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$customer_customer_by_pk = customer_customer_by_pk;
    final lOther$customer_customer_by_pk = other.customer_customer_by_pk;
    if (l$customer_customer_by_pk != lOther$customer_customer_by_pk) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getCustomerCart on Query$getCustomerCart {
  CopyWith$Query$getCustomerCart<Query$getCustomerCart> get copyWith =>
      CopyWith$Query$getCustomerCart(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getCustomerCart<TRes> {
  factory CopyWith$Query$getCustomerCart(
    Query$getCustomerCart instance,
    TRes Function(Query$getCustomerCart) then,
  ) = _CopyWithImpl$Query$getCustomerCart;

  factory CopyWith$Query$getCustomerCart.stub(TRes res) =
      _CopyWithStubImpl$Query$getCustomerCart;

  TRes call({
    Query$getCustomerCart$customer_customer_by_pk? customer_customer_by_pk,
    String? $__typename,
  });
  CopyWith$Query$getCustomerCart$customer_customer_by_pk<TRes>
      get customer_customer_by_pk;
}

class _CopyWithImpl$Query$getCustomerCart<TRes>
    implements CopyWith$Query$getCustomerCart<TRes> {
  _CopyWithImpl$Query$getCustomerCart(
    this._instance,
    this._then,
  );

  final Query$getCustomerCart _instance;

  final TRes Function(Query$getCustomerCart) _then;

  static const _undefined = {};

  TRes call({
    Object? customer_customer_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getCustomerCart(
        customer_customer_by_pk: customer_customer_by_pk == _undefined
            ? _instance.customer_customer_by_pk
            : (customer_customer_by_pk
                as Query$getCustomerCart$customer_customer_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getCustomerCart$customer_customer_by_pk<TRes>
      get customer_customer_by_pk {
    final local$customer_customer_by_pk = _instance.customer_customer_by_pk;
    return local$customer_customer_by_pk == null
        ? CopyWith$Query$getCustomerCart$customer_customer_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$getCustomerCart$customer_customer_by_pk(
            local$customer_customer_by_pk,
            (e) => call(customer_customer_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$getCustomerCart<TRes>
    implements CopyWith$Query$getCustomerCart<TRes> {
  _CopyWithStubImpl$Query$getCustomerCart(this._res);

  TRes _res;

  call({
    Query$getCustomerCart$customer_customer_by_pk? customer_customer_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getCustomerCart$customer_customer_by_pk<TRes>
      get customer_customer_by_pk =>
          CopyWith$Query$getCustomerCart$customer_customer_by_pk.stub(_res);
}

const documentNodeQuerygetCustomerCart = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getCustomerCart'),
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
        name: NameNode(value: 'customer_customer_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'user_id'),
            value: VariableNode(name: NameNode(value: 'customer_id')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'cart'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
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
                    name: NameNode(value: 'stripe_info'),
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
                    name: NameNode(value: 'delivery_details_id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'delivery_details_of_deliverer'),
                    alias: null,
                    arguments: [],
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
                        name: NameNode(value: 'radius'),
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
                    name: NameNode(value: 'description_id'),
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
                    name: NameNode(value: 'self_delivery'),
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
                    name: NameNode(value: 'approved'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'open_status'),
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
                    name: NameNode(value: 'id'),
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
                        name: NameNode(value: 'id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
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
                        name: NameNode(value: 'options'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                            name: NameNode(value: 'item_options'),
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
                                name: NameNode(value: 'free_choice'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null,
                              ),
                              FieldNode(
                                name: NameNode(value: 'cost_per_extra'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null,
                              ),
                              FieldNode(
                                name: NameNode(value: 'option_type'),
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
                                name: NameNode(value: 'maximum_choice'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null,
                              ),
                              FieldNode(
                                name: NameNode(value: 'minimum_choice'),
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
                                    name: NameNode(value: 'id'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null,
                                  ),
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
                                name: NameNode(value: 'choices'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FieldNode(
                                    name: NameNode(value: 'option_choices'),
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
                                        selectionSet:
                                            SelectionSetNode(selections: [
                                          FieldNode(
                                            name: NameNode(value: 'id'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null,
                                          ),
                                          FieldNode(
                                            name:
                                                NameNode(value: 'translations'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet:
                                                SelectionSetNode(selections: [
                                              FieldNode(
                                                name: NameNode(
                                                    value: 'language_id'),
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
                                                name: NameNode(
                                                    value: '__typename'),
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
                          FieldNode(
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
                    name: NameNode(value: 'note'),
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
                    name: NameNode(value: 'selected_options'),
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
Query$getCustomerCart _parserFn$Query$getCustomerCart(
        Map<String, dynamic> data) =>
    Query$getCustomerCart.fromJson(data);

class Options$Query$getCustomerCart
    extends graphql.QueryOptions<Query$getCustomerCart> {
  Options$Query$getCustomerCart({
    String? operationName,
    required Variables$Query$getCustomerCart variables,
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
          document: documentNodeQuerygetCustomerCart,
          parserFn: _parserFn$Query$getCustomerCart,
        );
}

class WatchOptions$Query$getCustomerCart
    extends graphql.WatchQueryOptions<Query$getCustomerCart> {
  WatchOptions$Query$getCustomerCart({
    String? operationName,
    required Variables$Query$getCustomerCart variables,
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
          document: documentNodeQuerygetCustomerCart,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getCustomerCart,
        );
}

class FetchMoreOptions$Query$getCustomerCart extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getCustomerCart({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getCustomerCart variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetCustomerCart,
        );
}

extension ClientExtension$Query$getCustomerCart on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getCustomerCart>> query$getCustomerCart(
          Options$Query$getCustomerCart options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$getCustomerCart> watchQuery$getCustomerCart(
          WatchOptions$Query$getCustomerCart options) =>
      this.watchQuery(options);
  void writeQuery$getCustomerCart({
    required Query$getCustomerCart data,
    required Variables$Query$getCustomerCart variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerygetCustomerCart),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getCustomerCart? readQuery$getCustomerCart({
    required Variables$Query$getCustomerCart variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetCustomerCart),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getCustomerCart.fromJson(result);
  }
}

class Query$getCustomerCart$customer_customer_by_pk {
  Query$getCustomerCart$customer_customer_by_pk({
    this.cart,
    required this.$__typename,
  });

  factory Query$getCustomerCart$customer_customer_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$cart = json['cart'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerCart$customer_customer_by_pk(
      cart: l$cart == null
          ? null
          : Query$getCustomerCart$customer_customer_by_pk$cart.fromJson(
              (l$cart as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getCustomerCart$customer_customer_by_pk$cart? cart;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$cart = cart;
    _resultData['cart'] = l$cart?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$cart = cart;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$cart,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getCustomerCart$customer_customer_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$cart = cart;
    final lOther$cart = other.cart;
    if (l$cart != lOther$cart) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getCustomerCart$customer_customer_by_pk
    on Query$getCustomerCart$customer_customer_by_pk {
  CopyWith$Query$getCustomerCart$customer_customer_by_pk<
          Query$getCustomerCart$customer_customer_by_pk>
      get copyWith => CopyWith$Query$getCustomerCart$customer_customer_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerCart$customer_customer_by_pk<TRes> {
  factory CopyWith$Query$getCustomerCart$customer_customer_by_pk(
    Query$getCustomerCart$customer_customer_by_pk instance,
    TRes Function(Query$getCustomerCart$customer_customer_by_pk) then,
  ) = _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk;

  factory CopyWith$Query$getCustomerCart$customer_customer_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk;

  TRes call({
    Query$getCustomerCart$customer_customer_by_pk$cart? cart,
    String? $__typename,
  });
  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart<TRes> get cart;
}

class _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk<TRes>
    implements CopyWith$Query$getCustomerCart$customer_customer_by_pk<TRes> {
  _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk(
    this._instance,
    this._then,
  );

  final Query$getCustomerCart$customer_customer_by_pk _instance;

  final TRes Function(Query$getCustomerCart$customer_customer_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? cart = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getCustomerCart$customer_customer_by_pk(
        cart: cart == _undefined
            ? _instance.cart
            : (cart as Query$getCustomerCart$customer_customer_by_pk$cart?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart<TRes> get cart {
    final local$cart = _instance.cart;
    return local$cart == null
        ? CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart.stub(
            _then(_instance))
        : CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart(
            local$cart, (e) => call(cart: e));
  }
}

class _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk<TRes>
    implements CopyWith$Query$getCustomerCart$customer_customer_by_pk<TRes> {
  _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk(this._res);

  TRes _res;

  call({
    Query$getCustomerCart$customer_customer_by_pk$cart? cart,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart<TRes> get cart =>
      CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart.stub(_res);
}

class Query$getCustomerCart$customer_customer_by_pk$cart {
  Query$getCustomerCart$customer_customer_by_pk$cart({
    this.restaurant,
    required this.items,
    required this.$__typename,
  });

  factory Query$getCustomerCart$customer_customer_by_pk$cart.fromJson(
      Map<String, dynamic> json) {
    final l$restaurant = json['restaurant'];
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerCart$customer_customer_by_pk$cart(
      restaurant: l$restaurant == null
          ? null
          : Query$getCustomerCart$customer_customer_by_pk$cart$restaurant
              .fromJson((l$restaurant as Map<String, dynamic>)),
      items: (l$items as List<dynamic>)
          .map((e) =>
              Query$getCustomerCart$customer_customer_by_pk$cart$items.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getCustomerCart$customer_customer_by_pk$cart$restaurant?
      restaurant;

  final List<Query$getCustomerCart$customer_customer_by_pk$cart$items> items;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant?.toJson();
    final l$items = items;
    _resultData['items'] = l$items.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant = restaurant;
    final l$items = items;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$restaurant,
      Object.hashAll(l$items.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getCustomerCart$customer_customer_by_pk$cart) ||
        runtimeType != other.runtimeType) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getCustomerCart$customer_customer_by_pk$cart
    on Query$getCustomerCart$customer_customer_by_pk$cart {
  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart<
          Query$getCustomerCart$customer_customer_by_pk$cart>
      get copyWith =>
          CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart<
    TRes> {
  factory CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart(
    Query$getCustomerCart$customer_customer_by_pk$cart instance,
    TRes Function(Query$getCustomerCart$customer_customer_by_pk$cart) then,
  ) = _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart;

  factory CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart;

  TRes call({
    Query$getCustomerCart$customer_customer_by_pk$cart$restaurant? restaurant,
    List<Query$getCustomerCart$customer_customer_by_pk$cart$items>? items,
    String? $__typename,
  });
  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant<TRes>
      get restaurant;
  TRes items(
      Iterable<Query$getCustomerCart$customer_customer_by_pk$cart$items> Function(
              Iterable<
                  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items<
                      Query$getCustomerCart$customer_customer_by_pk$cart$items>>)
          _fn);
}

class _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart<TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart<TRes> {
  _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart(
    this._instance,
    this._then,
  );

  final Query$getCustomerCart$customer_customer_by_pk$cart _instance;

  final TRes Function(Query$getCustomerCart$customer_customer_by_pk$cart) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant = _undefined,
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getCustomerCart$customer_customer_by_pk$cart(
        restaurant: restaurant == _undefined
            ? _instance.restaurant
            : (restaurant
                as Query$getCustomerCart$customer_customer_by_pk$cart$restaurant?),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<
                Query$getCustomerCart$customer_customer_by_pk$cart$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant<TRes>
      get restaurant {
    final local$restaurant = _instance.restaurant;
    return local$restaurant == null
        ? CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant
            .stub(_then(_instance))
        : CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant(
            local$restaurant, (e) => call(restaurant: e));
  }

  TRes items(
          Iterable<Query$getCustomerCart$customer_customer_by_pk$cart$items> Function(
                  Iterable<
                      CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items<
                          Query$getCustomerCart$customer_customer_by_pk$cart$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) =>
              CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart<TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart<TRes> {
  _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart(
      this._res);

  TRes _res;

  call({
    Query$getCustomerCart$customer_customer_by_pk$cart$restaurant? restaurant,
    List<Query$getCustomerCart$customer_customer_by_pk$cart$items>? items,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant<TRes>
      get restaurant =>
          CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant
              .stub(_res);
  items(_fn) => _res;
}

class Query$getCustomerCart$customer_customer_by_pk$cart$restaurant {
  Query$getCustomerCart$customer_customer_by_pk$cart$restaurant({
    required this.id,
    this.stripe_info,
    this.accepted_payments,
    this.delivery_details_id,
    this.delivery_details_of_deliverer,
    this.firebase_id,
    required this.image,
    required this.language_id,
    this.description_id,
    required this.name,
    required this.location,
    required this.self_delivery,
    this.schedule,
    this.description,
    required this.approved,
    required this.open_status,
    required this.$__typename,
  });

  factory Query$getCustomerCart$customer_customer_by_pk$cart$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$stripe_info = json['stripe_info'];
    final l$accepted_payments = json['accepted_payments'];
    final l$delivery_details_id = json['delivery_details_id'];
    final l$delivery_details_of_deliverer =
        json['delivery_details_of_deliverer'];
    final l$firebase_id = json['firebase_id'];
    final l$image = json['image'];
    final l$language_id = json['language_id'];
    final l$description_id = json['description_id'];
    final l$name = json['name'];
    final l$location = json['location'];
    final l$self_delivery = json['self_delivery'];
    final l$schedule = json['schedule'];
    final l$description = json['description'];
    final l$approved = json['approved'];
    final l$open_status = json['open_status'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerCart$customer_customer_by_pk$cart$restaurant(
      id: (l$id as int),
      stripe_info: l$stripe_info == null ? null : mapFromJson(l$stripe_info),
      accepted_payments:
          l$accepted_payments == null ? null : mapFromJson(l$accepted_payments),
      delivery_details_id: (l$delivery_details_id as int?),
      delivery_details_of_deliverer: (l$delivery_details_of_deliverer
              as List<dynamic>?)
          ?.map((e) =>
              Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      firebase_id: (l$firebase_id as String?),
      image: (l$image as String),
      language_id: (l$language_id as String),
      description_id: (l$description_id as int?),
      name: (l$name as String),
      location:
          Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$location
              .fromJson((l$location as Map<String, dynamic>)),
      self_delivery: (l$self_delivery as bool),
      schedule: l$schedule == null ? null : mapFromJson(l$schedule),
      description: l$description == null
          ? null
          : Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description
              .fromJson((l$description as Map<String, dynamic>)),
      approved: (l$approved as bool),
      open_status: (l$open_status as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final dynamic? stripe_info;

  final dynamic? accepted_payments;

  final int? delivery_details_id;

  final List<
          Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer>?
      delivery_details_of_deliverer;

  final String? firebase_id;

  final String image;

  final String language_id;

  final int? description_id;

  final String name;

  final Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$location
      location;

  final bool self_delivery;

  final dynamic? schedule;

  final Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description?
      description;

  final bool approved;

  final String open_status;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$stripe_info = stripe_info;
    _resultData['stripe_info'] =
        l$stripe_info == null ? null : mapToJson(l$stripe_info);
    final l$accepted_payments = accepted_payments;
    _resultData['accepted_payments'] =
        l$accepted_payments == null ? null : mapToJson(l$accepted_payments);
    final l$delivery_details_id = delivery_details_id;
    _resultData['delivery_details_id'] = l$delivery_details_id;
    final l$delivery_details_of_deliverer = delivery_details_of_deliverer;
    _resultData['delivery_details_of_deliverer'] =
        l$delivery_details_of_deliverer?.map((e) => e.toJson()).toList();
    final l$firebase_id = firebase_id;
    _resultData['firebase_id'] = l$firebase_id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
    final l$description_id = description_id;
    _resultData['description_id'] = l$description_id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$location = location;
    _resultData['location'] = l$location.toJson();
    final l$self_delivery = self_delivery;
    _resultData['self_delivery'] = l$self_delivery;
    final l$schedule = schedule;
    _resultData['schedule'] = l$schedule == null ? null : mapToJson(l$schedule);
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
    final l$approved = approved;
    _resultData['approved'] = l$approved;
    final l$open_status = open_status;
    _resultData['open_status'] = l$open_status;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$stripe_info = stripe_info;
    final l$accepted_payments = accepted_payments;
    final l$delivery_details_id = delivery_details_id;
    final l$delivery_details_of_deliverer = delivery_details_of_deliverer;
    final l$firebase_id = firebase_id;
    final l$image = image;
    final l$language_id = language_id;
    final l$description_id = description_id;
    final l$name = name;
    final l$location = location;
    final l$self_delivery = self_delivery;
    final l$schedule = schedule;
    final l$description = description;
    final l$approved = approved;
    final l$open_status = open_status;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$stripe_info,
      l$accepted_payments,
      l$delivery_details_id,
      l$delivery_details_of_deliverer == null
          ? null
          : Object.hashAll(l$delivery_details_of_deliverer.map((v) => v)),
      l$firebase_id,
      l$image,
      l$language_id,
      l$description_id,
      l$name,
      l$location,
      l$self_delivery,
      l$schedule,
      l$description,
      l$approved,
      l$open_status,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getCustomerCart$customer_customer_by_pk$cart$restaurant) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$stripe_info = stripe_info;
    final lOther$stripe_info = other.stripe_info;
    if (l$stripe_info != lOther$stripe_info) {
      return false;
    }
    final l$accepted_payments = accepted_payments;
    final lOther$accepted_payments = other.accepted_payments;
    if (l$accepted_payments != lOther$accepted_payments) {
      return false;
    }
    final l$delivery_details_id = delivery_details_id;
    final lOther$delivery_details_id = other.delivery_details_id;
    if (l$delivery_details_id != lOther$delivery_details_id) {
      return false;
    }
    final l$delivery_details_of_deliverer = delivery_details_of_deliverer;
    final lOther$delivery_details_of_deliverer =
        other.delivery_details_of_deliverer;
    if (l$delivery_details_of_deliverer != null &&
        lOther$delivery_details_of_deliverer != null) {
      if (l$delivery_details_of_deliverer.length !=
          lOther$delivery_details_of_deliverer.length) {
        return false;
      }
      for (int i = 0; i < l$delivery_details_of_deliverer.length; i++) {
        final l$delivery_details_of_deliverer$entry =
            l$delivery_details_of_deliverer[i];
        final lOther$delivery_details_of_deliverer$entry =
            lOther$delivery_details_of_deliverer[i];
        if (l$delivery_details_of_deliverer$entry !=
            lOther$delivery_details_of_deliverer$entry) {
          return false;
        }
      }
    } else if (l$delivery_details_of_deliverer !=
        lOther$delivery_details_of_deliverer) {
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
    final l$description_id = description_id;
    final lOther$description_id = other.description_id;
    if (l$description_id != lOther$description_id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$location = location;
    final lOther$location = other.location;
    if (l$location != lOther$location) {
      return false;
    }
    final l$self_delivery = self_delivery;
    final lOther$self_delivery = other.self_delivery;
    if (l$self_delivery != lOther$self_delivery) {
      return false;
    }
    final l$schedule = schedule;
    final lOther$schedule = other.schedule;
    if (l$schedule != lOther$schedule) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$approved = approved;
    final lOther$approved = other.approved;
    if (l$approved != lOther$approved) {
      return false;
    }
    final l$open_status = open_status;
    final lOther$open_status = other.open_status;
    if (l$open_status != lOther$open_status) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant
    on Query$getCustomerCart$customer_customer_by_pk$cart$restaurant {
  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant<
          Query$getCustomerCart$customer_customer_by_pk$cart$restaurant>
      get copyWith =>
          CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant<
    TRes> {
  factory CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant(
    Query$getCustomerCart$customer_customer_by_pk$cart$restaurant instance,
    TRes Function(Query$getCustomerCart$customer_customer_by_pk$cart$restaurant)
        then,
  ) = _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant;

  factory CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant;

  TRes call({
    int? id,
    dynamic? stripe_info,
    dynamic? accepted_payments,
    int? delivery_details_id,
    List<Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer>?
        delivery_details_of_deliverer,
    String? firebase_id,
    String? image,
    String? language_id,
    int? description_id,
    String? name,
    Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$location?
        location,
    bool? self_delivery,
    dynamic? schedule,
    Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description?
        description,
    bool? approved,
    String? open_status,
    String? $__typename,
  });
  TRes delivery_details_of_deliverer(
      Iterable<Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer>? Function(
              Iterable<
                  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer<
                      Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer>>?)
          _fn);
  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$location<
      TRes> get location;
  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description<
      TRes> get description;
}

class _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant<
            TRes> {
  _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant(
    this._instance,
    this._then,
  );

  final Query$getCustomerCart$customer_customer_by_pk$cart$restaurant _instance;

  final TRes Function(
      Query$getCustomerCart$customer_customer_by_pk$cart$restaurant) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? stripe_info = _undefined,
    Object? accepted_payments = _undefined,
    Object? delivery_details_id = _undefined,
    Object? delivery_details_of_deliverer = _undefined,
    Object? firebase_id = _undefined,
    Object? image = _undefined,
    Object? language_id = _undefined,
    Object? description_id = _undefined,
    Object? name = _undefined,
    Object? location = _undefined,
    Object? self_delivery = _undefined,
    Object? schedule = _undefined,
    Object? description = _undefined,
    Object? approved = _undefined,
    Object? open_status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getCustomerCart$customer_customer_by_pk$cart$restaurant(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        stripe_info: stripe_info == _undefined
            ? _instance.stripe_info
            : (stripe_info as dynamic?),
        accepted_payments: accepted_payments == _undefined
            ? _instance.accepted_payments
            : (accepted_payments as dynamic?),
        delivery_details_id: delivery_details_id == _undefined
            ? _instance.delivery_details_id
            : (delivery_details_id as int?),
        delivery_details_of_deliverer: delivery_details_of_deliverer ==
                _undefined
            ? _instance.delivery_details_of_deliverer
            : (delivery_details_of_deliverer as List<
                Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer>?),
        firebase_id: firebase_id == _undefined
            ? _instance.firebase_id
            : (firebase_id as String?),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        description_id: description_id == _undefined
            ? _instance.description_id
            : (description_id as int?),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        location: location == _undefined || location == null
            ? _instance.location
            : (location
                as Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$location),
        self_delivery: self_delivery == _undefined || self_delivery == null
            ? _instance.self_delivery
            : (self_delivery as bool),
        schedule: schedule == _undefined
            ? _instance.schedule
            : (schedule as dynamic?),
        description: description == _undefined
            ? _instance.description
            : (description
                as Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description?),
        approved: approved == _undefined || approved == null
            ? _instance.approved
            : (approved as bool),
        open_status: open_status == _undefined || open_status == null
            ? _instance.open_status
            : (open_status as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes delivery_details_of_deliverer(
          Iterable<Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer>? Function(
                  Iterable<
                      CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer<
                          Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer>>?)
              _fn) =>
      call(
          delivery_details_of_deliverer: _fn(
              _instance.delivery_details_of_deliverer?.map((e) =>
                  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer(
                    e,
                    (i) => i,
                  )))?.toList());
  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$location<
      TRes> get location {
    final local$location = _instance.location;
    return CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$location(
        local$location, (e) => call(location: e));
  }

  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description<
      TRes> get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description
            .stub(_then(_instance))
        : CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description(
            local$description, (e) => call(description: e));
  }
}

class _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant<
            TRes> {
  _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant(
      this._res);

  TRes _res;

  call({
    int? id,
    dynamic? stripe_info,
    dynamic? accepted_payments,
    int? delivery_details_id,
    List<Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer>?
        delivery_details_of_deliverer,
    String? firebase_id,
    String? image,
    String? language_id,
    int? description_id,
    String? name,
    Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$location?
        location,
    bool? self_delivery,
    dynamic? schedule,
    Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description?
        description,
    bool? approved,
    String? open_status,
    String? $__typename,
  }) =>
      _res;
  delivery_details_of_deliverer(_fn) => _res;
  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$location<
          TRes>
      get location =>
          CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$location
              .stub(_res);
  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description<
          TRes>
      get description =>
          CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description
              .stub(_res);
}

class Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer {
  Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer({
    required this.cost_per_km,
    this.free_delivery_km_range,
    this.free_delivery_minimum_cost,
    required this.id,
    required this.minimum_cost,
    required this.radius,
    required this.$__typename,
  });

  factory Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer.fromJson(
      Map<String, dynamic> json) {
    final l$cost_per_km = json['cost_per_km'];
    final l$free_delivery_km_range = json['free_delivery_km_range'];
    final l$free_delivery_minimum_cost = json['free_delivery_minimum_cost'];
    final l$id = json['id'];
    final l$minimum_cost = json['minimum_cost'];
    final l$radius = json['radius'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer(
      cost_per_km: moneyFromJson(l$cost_per_km),
      free_delivery_km_range: (l$free_delivery_km_range as num?)?.toDouble(),
      free_delivery_minimum_cost: l$free_delivery_minimum_cost == null
          ? null
          : moneyFromJson(l$free_delivery_minimum_cost),
      id: (l$id as int),
      minimum_cost: moneyFromJson(l$minimum_cost),
      radius: (l$radius as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final double cost_per_km;

  final double? free_delivery_km_range;

  final double? free_delivery_minimum_cost;

  final int id;

  final double minimum_cost;

  final int radius;

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
    final l$radius = radius;
    _resultData['radius'] = l$radius;
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
    final l$radius = radius;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$cost_per_km,
      l$free_delivery_km_range,
      l$free_delivery_minimum_cost,
      l$id,
      l$minimum_cost,
      l$radius,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer) ||
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
    final l$radius = radius;
    final lOther$radius = other.radius;
    if (l$radius != lOther$radius) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer
    on Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer {
  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer<
          Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer>
      get copyWith =>
          CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer<
    TRes> {
  factory CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer(
    Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer
        instance,
    TRes Function(
            Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer)
        then,
  ) = _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer;

  factory CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer;

  TRes call({
    double? cost_per_km,
    double? free_delivery_km_range,
    double? free_delivery_minimum_cost,
    int? id,
    double? minimum_cost,
    int? radius,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer<
            TRes> {
  _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer(
    this._instance,
    this._then,
  );

  final Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer
      _instance;

  final TRes Function(
          Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? cost_per_km = _undefined,
    Object? free_delivery_km_range = _undefined,
    Object? free_delivery_minimum_cost = _undefined,
    Object? id = _undefined,
    Object? minimum_cost = _undefined,
    Object? radius = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer(
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
        radius: radius == _undefined || radius == null
            ? _instance.radius
            : (radius as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer<
            TRes> {
  _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer(
      this._res);

  TRes _res;

  call({
    double? cost_per_km,
    double? free_delivery_km_range,
    double? free_delivery_minimum_cost,
    int? id,
    double? minimum_cost,
    int? radius,
    String? $__typename,
  }) =>
      _res;
}

class Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$location {
  Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$location({
    required this.gps,
    this.address,
    required this.$__typename,
  });

  factory Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$location.fromJson(
      Map<String, dynamic> json) {
    final l$gps = json['gps'];
    final l$address = json['address'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$location(
      gps: geographyFromJson(l$gps),
      address: (l$address as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Geography gps;

  final String? address;

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
            is Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$location) ||
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

extension UtilityExtension$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$location
    on Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$location {
  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$location<
          Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$location>
      get copyWith =>
          CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$location<
    TRes> {
  factory CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$location(
    Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$location
        instance,
    TRes Function(
            Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$location)
        then,
  ) = _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$location;

  factory CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$location.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$location;

  TRes call({
    Geography? gps,
    String? address,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$location<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$location<
            TRes> {
  _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$location(
    this._instance,
    this._then,
  );

  final Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$location
      _instance;

  final TRes Function(
          Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$location)
      _then;

  static const _undefined = {};

  TRes call({
    Object? gps = _undefined,
    Object? address = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$location(
        gps: gps == _undefined || gps == null
            ? _instance.gps
            : (gps as Geography),
        address:
            address == _undefined ? _instance.address : (address as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$location<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$location<
            TRes> {
  _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$location(
      this._res);

  TRes _res;

  call({
    Geography? gps,
    String? address,
    String? $__typename,
  }) =>
      _res;
}

class Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description {
  Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description({
    required this.translations,
    required this.$__typename,
  });

  factory Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description$translations>
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
            is Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description) ||
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

extension UtilityExtension$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description
    on Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description {
  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description<
          Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description>
      get copyWith =>
          CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description<
    TRes> {
  factory CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description(
    Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description
        instance,
    TRes Function(
            Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description)
        then,
  ) = _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description;

  factory CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description;

  TRes call({
    List<Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description$translations> Function(
              Iterable<
                  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description$translations<
                      Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description<
            TRes> {
  _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description(
    this._instance,
    this._then,
  );

  final Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description
      _instance;

  final TRes Function(
          Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description$translations> Function(
                  Iterable<
                      CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description$translations<
                          Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description<
            TRes> {
  _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description(
      this._res);

  TRes _res;

  call({
    List<Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description$translations {
  Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description$translations(
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
            is Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description$translations) ||
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

extension UtilityExtension$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description$translations
    on Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description$translations {
  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description$translations<
          Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description$translations>
      get copyWith =>
          CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description$translations<
    TRes> {
  factory CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description$translations(
    Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description$translations
        instance,
    TRes Function(
            Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description$translations)
        then,
  ) = _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description$translations;

  factory CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description$translations<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description$translations<
            TRes> {
  _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description$translations(
    this._instance,
    this._then,
  );

  final Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description$translations
      _instance;

  final TRes Function(
          Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description$translations(
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

class _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description$translations<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description$translations<
            TRes> {
  _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$restaurant$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$getCustomerCart$customer_customer_by_pk$cart$items {
  Query$getCustomerCart$customer_customer_by_pk$cart$items({
    required this.id,
    required this.restaurant_item,
    required this.cost_per_one,
    this.note,
    required this.quantity,
    required this.selected_options,
    required this.$__typename,
  });

  factory Query$getCustomerCart$customer_customer_by_pk$cart$items.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$restaurant_item = json['restaurant_item'];
    final l$cost_per_one = json['cost_per_one'];
    final l$note = json['note'];
    final l$quantity = json['quantity'];
    final l$selected_options = json['selected_options'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerCart$customer_customer_by_pk$cart$items(
      id: (l$id as int),
      restaurant_item:
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item
              .fromJson((l$restaurant_item as Map<String, dynamic>)),
      cost_per_one: moneyFromJson(l$cost_per_one),
      note: (l$note as String?),
      quantity: (l$quantity as int),
      selected_options: mapFromJson(l$selected_options),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item
      restaurant_item;

  final double cost_per_one;

  final String? note;

  final int quantity;

  final dynamic selected_options;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$restaurant_item = restaurant_item;
    _resultData['restaurant_item'] = l$restaurant_item.toJson();
    final l$cost_per_one = cost_per_one;
    _resultData['cost_per_one'] = moneyToJson(l$cost_per_one);
    final l$note = note;
    _resultData['note'] = l$note;
    final l$quantity = quantity;
    _resultData['quantity'] = l$quantity;
    final l$selected_options = selected_options;
    _resultData['selected_options'] = mapToJson(l$selected_options);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$restaurant_item = restaurant_item;
    final l$cost_per_one = cost_per_one;
    final l$note = note;
    final l$quantity = quantity;
    final l$selected_options = selected_options;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$restaurant_item,
      l$cost_per_one,
      l$note,
      l$quantity,
      l$selected_options,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getCustomerCart$customer_customer_by_pk$cart$items) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
    final l$note = note;
    final lOther$note = other.note;
    if (l$note != lOther$note) {
      return false;
    }
    final l$quantity = quantity;
    final lOther$quantity = other.quantity;
    if (l$quantity != lOther$quantity) {
      return false;
    }
    final l$selected_options = selected_options;
    final lOther$selected_options = other.selected_options;
    if (l$selected_options != lOther$selected_options) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getCustomerCart$customer_customer_by_pk$cart$items
    on Query$getCustomerCart$customer_customer_by_pk$cart$items {
  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items<
          Query$getCustomerCart$customer_customer_by_pk$cart$items>
      get copyWith =>
          CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items<
    TRes> {
  factory CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items(
    Query$getCustomerCart$customer_customer_by_pk$cart$items instance,
    TRes Function(Query$getCustomerCart$customer_customer_by_pk$cart$items)
        then,
  ) = _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items;

  factory CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items;

  TRes call({
    int? id,
    Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item?
        restaurant_item,
    double? cost_per_one,
    String? note,
    int? quantity,
    dynamic? selected_options,
    String? $__typename,
  });
  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item<
      TRes> get restaurant_item;
}

class _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items<
            TRes> {
  _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items(
    this._instance,
    this._then,
  );

  final Query$getCustomerCart$customer_customer_by_pk$cart$items _instance;

  final TRes Function(Query$getCustomerCart$customer_customer_by_pk$cart$items)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? restaurant_item = _undefined,
    Object? cost_per_one = _undefined,
    Object? note = _undefined,
    Object? quantity = _undefined,
    Object? selected_options = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getCustomerCart$customer_customer_by_pk$cart$items(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        restaurant_item: restaurant_item == _undefined ||
                restaurant_item == null
            ? _instance.restaurant_item
            : (restaurant_item
                as Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item),
        cost_per_one: cost_per_one == _undefined || cost_per_one == null
            ? _instance.cost_per_one
            : (cost_per_one as double),
        note: note == _undefined ? _instance.note : (note as String?),
        quantity: quantity == _undefined || quantity == null
            ? _instance.quantity
            : (quantity as int),
        selected_options:
            selected_options == _undefined || selected_options == null
                ? _instance.selected_options
                : (selected_options as dynamic),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item<
      TRes> get restaurant_item {
    final local$restaurant_item = _instance.restaurant_item;
    return CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item(
        local$restaurant_item, (e) => call(restaurant_item: e));
  }
}

class _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items<
            TRes> {
  _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item?
        restaurant_item,
    double? cost_per_one,
    String? note,
    int? quantity,
    dynamic? selected_options,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item<
          TRes>
      get restaurant_item =>
          CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item
              .stub(_res);
}

class Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item {
  Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item({
    required this.id,
    required this.item_type,
    required this.name,
    this.description,
    required this.options,
    required this.position,
    this.category_id,
    required this.available,
    this.image,
    required this.restaurant_id,
    this.special_period_end,
    this.special_period_start,
    required this.archived,
    required this.cost,
    required this.$__typename,
  });

  factory Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$item_type = json['item_type'];
    final l$name = json['name'];
    final l$description = json['description'];
    final l$options = json['options'];
    final l$position = json['position'];
    final l$category_id = json['category_id'];
    final l$available = json['available'];
    final l$image = json['image'];
    final l$restaurant_id = json['restaurant_id'];
    final l$special_period_end = json['special_period_end'];
    final l$special_period_start = json['special_period_start'];
    final l$archived = json['archived'];
    final l$cost = json['cost'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item(
      id: (l$id as int),
      item_type: (l$item_type as String),
      name:
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name
              .fromJson((l$name as Map<String, dynamic>)),
      description: l$description == null
          ? null
          : Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description
              .fromJson((l$description as Map<String, dynamic>)),
      options: (l$options as List<dynamic>)
          .map((e) =>
              Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      position: (l$position as int),
      category_id: (l$category_id as int?),
      available: (l$available as bool),
      image: (l$image as String?),
      restaurant_id: (l$restaurant_id as int),
      special_period_end: (l$special_period_end as String?),
      special_period_start: (l$special_period_start as String?),
      archived: (l$archived as bool),
      cost: moneyFromJson(l$cost),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String item_type;

  final Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name
      name;

  final Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description?
      description;

  final List<
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options>
      options;

  final int position;

  final int? category_id;

  final bool available;

  final String? image;

  final int restaurant_id;

  final String? special_period_end;

  final String? special_period_start;

  final bool archived;

  final double cost;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$item_type = item_type;
    _resultData['item_type'] = l$item_type;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
    final l$options = options;
    _resultData['options'] = l$options.map((e) => e.toJson()).toList();
    final l$position = position;
    _resultData['position'] = l$position;
    final l$category_id = category_id;
    _resultData['category_id'] = l$category_id;
    final l$available = available;
    _resultData['available'] = l$available;
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
    final l$id = id;
    final l$item_type = item_type;
    final l$name = name;
    final l$description = description;
    final l$options = options;
    final l$position = position;
    final l$category_id = category_id;
    final l$available = available;
    final l$image = image;
    final l$restaurant_id = restaurant_id;
    final l$special_period_end = special_period_end;
    final l$special_period_start = special_period_start;
    final l$archived = archived;
    final l$cost = cost;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$item_type,
      l$name,
      l$description,
      Object.hashAll(l$options.map((v) => v)),
      l$position,
      l$category_id,
      l$available,
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
            is Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
    final l$options = options;
    final lOther$options = other.options;
    if (l$options.length != lOther$options.length) {
      return false;
    }
    for (int i = 0; i < l$options.length; i++) {
      final l$options$entry = l$options[i];
      final lOther$options$entry = lOther$options[i];
      if (l$options$entry != lOther$options$entry) {
        return false;
      }
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

extension UtilityExtension$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item
    on Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item {
  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item<
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item>
      get copyWith =>
          CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item<
    TRes> {
  factory CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item(
    Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item
        instance,
    TRes Function(
            Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item)
        then,
  ) = _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item;

  factory CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item;

  TRes call({
    int? id,
    String? item_type,
    Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name?
        name,
    Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description?
        description,
    List<Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options>?
        options,
    int? position,
    int? category_id,
    bool? available,
    String? image,
    int? restaurant_id,
    String? special_period_end,
    String? special_period_start,
    bool? archived,
    double? cost,
    String? $__typename,
  });
  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name<
      TRes> get name;
  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description<
      TRes> get description;
  TRes options(
      Iterable<Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options> Function(
              Iterable<
                  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options<
                      Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options>>)
          _fn);
}

class _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item<
            TRes> {
  _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item(
    this._instance,
    this._then,
  );

  final Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item
      _instance;

  final TRes Function(
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? item_type = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? options = _undefined,
    Object? position = _undefined,
    Object? category_id = _undefined,
    Object? available = _undefined,
    Object? image = _undefined,
    Object? restaurant_id = _undefined,
    Object? special_period_end = _undefined,
    Object? special_period_start = _undefined,
    Object? archived = _undefined,
    Object? cost = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        item_type: item_type == _undefined || item_type == null
            ? _instance.item_type
            : (item_type as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name),
        description: description == _undefined
            ? _instance.description
            : (description
                as Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description?),
        options: options == _undefined || options == null
            ? _instance.options
            : (options as List<
                Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options>),
        position: position == _undefined || position == null
            ? _instance.position
            : (position as int),
        category_id: category_id == _undefined
            ? _instance.category_id
            : (category_id as int?),
        available: available == _undefined || available == null
            ? _instance.available
            : (available as bool),
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
  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name<
      TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name(
        local$name, (e) => call(name: e));
  }

  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description<
      TRes> get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description
            .stub(_then(_instance))
        : CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description(
            local$description, (e) => call(description: e));
  }

  TRes options(
          Iterable<Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options> Function(
                  Iterable<
                      CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options<
                          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options>>)
              _fn) =>
      call(
          options: _fn(_instance.options.map((e) =>
              CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item<
            TRes> {
  _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item(
      this._res);

  TRes _res;

  call({
    int? id,
    String? item_type,
    Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name?
        name,
    Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description?
        description,
    List<Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options>?
        options,
    int? position,
    int? category_id,
    bool? available,
    String? image,
    int? restaurant_id,
    String? special_period_end,
    String? special_period_start,
    bool? archived,
    double? cost,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name<
          TRes>
      get name =>
          CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name
              .stub(_res);
  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description<
          TRes>
      get description =>
          CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description
              .stub(_res);
  options(_fn) => _res;
}

class Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name {
  Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name({
    required this.translations,
    required this.$__typename,
  });

  factory Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name$translations>
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
            is Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name) ||
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

extension UtilityExtension$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name
    on Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name {
  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name<
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name>
      get copyWith =>
          CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name<
    TRes> {
  factory CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name(
    Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name
        instance,
    TRes Function(
            Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name)
        then,
  ) = _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name;

  factory CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name;

  TRes call({
    List<Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name$translations> Function(
              Iterable<
                  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name$translations<
                      Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name<
            TRes> {
  _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name(
    this._instance,
    this._then,
  );

  final Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name
      _instance;

  final TRes Function(
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name$translations> Function(
                  Iterable<
                      CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name$translations<
                          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name<
            TRes> {
  _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name(
      this._res);

  TRes _res;

  call({
    List<Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name$translations {
  Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name$translations(
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
            is Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name$translations) ||
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

extension UtilityExtension$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name$translations
    on Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name$translations {
  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name$translations<
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name$translations>
      get copyWith =>
          CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name$translations<
    TRes> {
  factory CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name$translations(
    Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name$translations
        instance,
    TRes Function(
            Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name$translations)
        then,
  ) = _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name$translations;

  factory CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name$translations<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name$translations<
            TRes> {
  _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name$translations(
    this._instance,
    this._then,
  );

  final Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name$translations
      _instance;

  final TRes Function(
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name$translations(
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

class _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name$translations<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description {
  Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description({
    required this.translations,
    required this.$__typename,
  });

  factory Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description$translations>
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
            is Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description) ||
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

extension UtilityExtension$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description
    on Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description {
  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description<
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description>
      get copyWith =>
          CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description<
    TRes> {
  factory CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description(
    Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description
        instance,
    TRes Function(
            Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description)
        then,
  ) = _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description;

  factory CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description;

  TRes call({
    List<Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description$translations> Function(
              Iterable<
                  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description$translations<
                      Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description<
            TRes> {
  _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description(
    this._instance,
    this._then,
  );

  final Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description
      _instance;

  final TRes Function(
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description$translations> Function(
                  Iterable<
                      CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description$translations<
                          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description<
            TRes> {
  _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description(
      this._res);

  TRes _res;

  call({
    List<Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description$translations {
  Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description$translations(
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
            is Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description$translations) ||
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

extension UtilityExtension$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description$translations
    on Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description$translations {
  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description$translations<
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description$translations>
      get copyWith =>
          CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description$translations<
    TRes> {
  factory CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description$translations(
    Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description$translations
        instance,
    TRes Function(
            Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description$translations)
        then,
  ) = _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description$translations;

  factory CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description$translations<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description$translations<
            TRes> {
  _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description$translations(
    this._instance,
    this._then,
  );

  final Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description$translations
      _instance;

  final TRes Function(
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description$translations(
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

class _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description$translations<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description$translations<
            TRes> {
  _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options {
  Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options({
    required this.item_options,
    required this.$__typename,
  });

  factory Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options.fromJson(
      Map<String, dynamic> json) {
    final l$item_options = json['item_options'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options(
      item_options: (l$item_options as List<dynamic>)
          .map((e) =>
              Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options>
      item_options;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$item_options = item_options;
    _resultData['item_options'] =
        l$item_options.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$item_options = item_options;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$item_options.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$item_options = item_options;
    final lOther$item_options = other.item_options;
    if (l$item_options.length != lOther$item_options.length) {
      return false;
    }
    for (int i = 0; i < l$item_options.length; i++) {
      final l$item_options$entry = l$item_options[i];
      final lOther$item_options$entry = lOther$item_options[i];
      if (l$item_options$entry != lOther$item_options$entry) {
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

extension UtilityExtension$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options
    on Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options {
  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options<
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options>
      get copyWith =>
          CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options<
    TRes> {
  factory CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options(
    Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options
        instance,
    TRes Function(
            Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options)
        then,
  ) = _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options;

  factory CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options;

  TRes call({
    List<Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options>?
        item_options,
    String? $__typename,
  });
  TRes item_options(
      Iterable<Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options> Function(
              Iterable<
                  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options<
                      Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options>>)
          _fn);
}

class _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options<
            TRes> {
  _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options(
    this._instance,
    this._then,
  );

  final Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options
      _instance;

  final TRes Function(
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options)
      _then;

  static const _undefined = {};

  TRes call({
    Object? item_options = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options(
        item_options: item_options == _undefined || item_options == null
            ? _instance.item_options
            : (item_options as List<
                Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes item_options(
          Iterable<Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options> Function(
                  Iterable<
                      CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options<
                          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options>>)
              _fn) =>
      call(
          item_options: _fn(_instance.item_options.map((e) =>
              CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options<
            TRes> {
  _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options(
      this._res);

  TRes _res;

  call({
    List<Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options>?
        item_options,
    String? $__typename,
  }) =>
      _res;
  item_options(_fn) => _res;
}

class Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options {
  Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options({
    required this.id,
    required this.free_choice,
    required this.cost_per_extra,
    required this.option_type,
    required this.position,
    required this.maximum_choice,
    required this.minimum_choice,
    required this.name,
    required this.choices,
    required this.$__typename,
  });

  factory Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$free_choice = json['free_choice'];
    final l$cost_per_extra = json['cost_per_extra'];
    final l$option_type = json['option_type'];
    final l$position = json['position'];
    final l$maximum_choice = json['maximum_choice'];
    final l$minimum_choice = json['minimum_choice'];
    final l$name = json['name'];
    final l$choices = json['choices'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options(
      id: (l$id as int),
      free_choice: (l$free_choice as int),
      cost_per_extra: moneyFromJson(l$cost_per_extra),
      option_type: (l$option_type as String),
      position: (l$position as int),
      maximum_choice: (l$maximum_choice as int),
      minimum_choice: (l$minimum_choice as int),
      name:
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name
              .fromJson((l$name as Map<String, dynamic>)),
      choices: (l$choices as List<dynamic>)
          .map((e) =>
              Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final int free_choice;

  final double cost_per_extra;

  final String option_type;

  final int position;

  final int maximum_choice;

  final int minimum_choice;

  final Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name
      name;

  final List<
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices>
      choices;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$free_choice = free_choice;
    _resultData['free_choice'] = l$free_choice;
    final l$cost_per_extra = cost_per_extra;
    _resultData['cost_per_extra'] = moneyToJson(l$cost_per_extra);
    final l$option_type = option_type;
    _resultData['option_type'] = l$option_type;
    final l$position = position;
    _resultData['position'] = l$position;
    final l$maximum_choice = maximum_choice;
    _resultData['maximum_choice'] = l$maximum_choice;
    final l$minimum_choice = minimum_choice;
    _resultData['minimum_choice'] = l$minimum_choice;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$choices = choices;
    _resultData['choices'] = l$choices.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$free_choice = free_choice;
    final l$cost_per_extra = cost_per_extra;
    final l$option_type = option_type;
    final l$position = position;
    final l$maximum_choice = maximum_choice;
    final l$minimum_choice = minimum_choice;
    final l$name = name;
    final l$choices = choices;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$free_choice,
      l$cost_per_extra,
      l$option_type,
      l$position,
      l$maximum_choice,
      l$minimum_choice,
      l$name,
      Object.hashAll(l$choices.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$free_choice = free_choice;
    final lOther$free_choice = other.free_choice;
    if (l$free_choice != lOther$free_choice) {
      return false;
    }
    final l$cost_per_extra = cost_per_extra;
    final lOther$cost_per_extra = other.cost_per_extra;
    if (l$cost_per_extra != lOther$cost_per_extra) {
      return false;
    }
    final l$option_type = option_type;
    final lOther$option_type = other.option_type;
    if (l$option_type != lOther$option_type) {
      return false;
    }
    final l$position = position;
    final lOther$position = other.position;
    if (l$position != lOther$position) {
      return false;
    }
    final l$maximum_choice = maximum_choice;
    final lOther$maximum_choice = other.maximum_choice;
    if (l$maximum_choice != lOther$maximum_choice) {
      return false;
    }
    final l$minimum_choice = minimum_choice;
    final lOther$minimum_choice = other.minimum_choice;
    if (l$minimum_choice != lOther$minimum_choice) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$choices = choices;
    final lOther$choices = other.choices;
    if (l$choices.length != lOther$choices.length) {
      return false;
    }
    for (int i = 0; i < l$choices.length; i++) {
      final l$choices$entry = l$choices[i];
      final lOther$choices$entry = lOther$choices[i];
      if (l$choices$entry != lOther$choices$entry) {
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

extension UtilityExtension$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options
    on Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options {
  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options<
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options>
      get copyWith =>
          CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options<
    TRes> {
  factory CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options(
    Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options
        instance,
    TRes Function(
            Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options)
        then,
  ) = _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options;

  factory CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options;

  TRes call({
    int? id,
    int? free_choice,
    double? cost_per_extra,
    String? option_type,
    int? position,
    int? maximum_choice,
    int? minimum_choice,
    Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name?
        name,
    List<Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices>?
        choices,
    String? $__typename,
  });
  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name<
      TRes> get name;
  TRes choices(
      Iterable<Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices> Function(
              Iterable<
                  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices<
                      Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices>>)
          _fn);
}

class _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options<
            TRes> {
  _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options(
    this._instance,
    this._then,
  );

  final Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options
      _instance;

  final TRes Function(
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? free_choice = _undefined,
    Object? cost_per_extra = _undefined,
    Object? option_type = _undefined,
    Object? position = _undefined,
    Object? maximum_choice = _undefined,
    Object? minimum_choice = _undefined,
    Object? name = _undefined,
    Object? choices = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        free_choice: free_choice == _undefined || free_choice == null
            ? _instance.free_choice
            : (free_choice as int),
        cost_per_extra: cost_per_extra == _undefined || cost_per_extra == null
            ? _instance.cost_per_extra
            : (cost_per_extra as double),
        option_type: option_type == _undefined || option_type == null
            ? _instance.option_type
            : (option_type as String),
        position: position == _undefined || position == null
            ? _instance.position
            : (position as int),
        maximum_choice: maximum_choice == _undefined || maximum_choice == null
            ? _instance.maximum_choice
            : (maximum_choice as int),
        minimum_choice: minimum_choice == _undefined || minimum_choice == null
            ? _instance.minimum_choice
            : (minimum_choice as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name),
        choices: choices == _undefined || choices == null
            ? _instance.choices
            : (choices as List<
                Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name<
      TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name(
        local$name, (e) => call(name: e));
  }

  TRes choices(
          Iterable<Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices> Function(
                  Iterable<
                      CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices<
                          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices>>)
              _fn) =>
      call(
          choices: _fn(_instance.choices.map((e) =>
              CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options<
            TRes> {
  _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options(
      this._res);

  TRes _res;

  call({
    int? id,
    int? free_choice,
    double? cost_per_extra,
    String? option_type,
    int? position,
    int? maximum_choice,
    int? minimum_choice,
    Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name?
        name,
    List<Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices>?
        choices,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name<
          TRes>
      get name =>
          CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name
              .stub(_res);
  choices(_fn) => _res;
}

class Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name {
  Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name({
    required this.id,
    required this.translations,
    required this.$__typename,
  });

  factory Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name(
      id: (l$id as int),
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final List<
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations>
      translations;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$translations = translations;
    _resultData['translations'] =
        l$translations.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$translations = translations;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
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
            is Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name
    on Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name {
  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name<
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name>
      get copyWith =>
          CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name<
    TRes> {
  factory CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name(
    Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name
        instance,
    TRes Function(
            Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name)
        then,
  ) = _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name;

  factory CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name;

  TRes call({
    int? id,
    List<Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations> Function(
              Iterable<
                  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations<
                      Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name<
            TRes> {
  _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name(
    this._instance,
    this._then,
  );

  final Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name
      _instance;

  final TRes Function(
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations> Function(
                  Iterable<
                      CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations<
                          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name<
            TRes> {
  _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name(
      this._res);

  TRes _res;

  call({
    int? id,
    List<Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations {
  Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations(
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
            is Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations) ||
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

extension UtilityExtension$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations
    on Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations {
  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations<
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations>
      get copyWith =>
          CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations<
    TRes> {
  factory CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations(
    Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations
        instance,
    TRes Function(
            Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations)
        then,
  ) = _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations;

  factory CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations<
            TRes> {
  _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations(
    this._instance,
    this._then,
  );

  final Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations
      _instance;

  final TRes Function(
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations(
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

class _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices {
  Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices({
    required this.option_choices,
    required this.$__typename,
  });

  factory Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices.fromJson(
      Map<String, dynamic> json) {
    final l$option_choices = json['option_choices'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices(
      option_choices: (l$option_choices as List<dynamic>)
          .map((e) =>
              Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices>
      option_choices;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$option_choices = option_choices;
    _resultData['option_choices'] =
        l$option_choices.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$option_choices = option_choices;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$option_choices.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$option_choices = option_choices;
    final lOther$option_choices = other.option_choices;
    if (l$option_choices.length != lOther$option_choices.length) {
      return false;
    }
    for (int i = 0; i < l$option_choices.length; i++) {
      final l$option_choices$entry = l$option_choices[i];
      final lOther$option_choices$entry = lOther$option_choices[i];
      if (l$option_choices$entry != lOther$option_choices$entry) {
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

extension UtilityExtension$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices
    on Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices {
  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices<
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices>
      get copyWith =>
          CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices<
    TRes> {
  factory CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices(
    Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices
        instance,
    TRes Function(
            Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices)
        then,
  ) = _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices;

  factory CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices;

  TRes call({
    List<Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices>?
        option_choices,
    String? $__typename,
  });
  TRes option_choices(
      Iterable<Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices> Function(
              Iterable<
                  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices<
                      Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices>>)
          _fn);
}

class _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices<
            TRes> {
  _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices(
    this._instance,
    this._then,
  );

  final Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices
      _instance;

  final TRes Function(
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices)
      _then;

  static const _undefined = {};

  TRes call({
    Object? option_choices = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices(
        option_choices: option_choices == _undefined || option_choices == null
            ? _instance.option_choices
            : (option_choices as List<
                Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes option_choices(
          Iterable<Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices> Function(
                  Iterable<
                      CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices<
                          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices>>)
              _fn) =>
      call(
          option_choices: _fn(_instance.option_choices.map((e) =>
              CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices<
            TRes> {
  _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices(
      this._res);

  TRes _res;

  call({
    List<Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices>?
        option_choices,
    String? $__typename,
  }) =>
      _res;
  option_choices(_fn) => _res;
}

class Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices {
  Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices({
    required this.available,
    required this.cost,
    required this.id,
    required this.name,
    required this.$__typename,
  });

  factory Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices.fromJson(
      Map<String, dynamic> json) {
    final l$available = json['available'];
    final l$cost = json['cost'];
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices(
      available: (l$available as bool),
      cost: moneyFromJson(l$cost),
      id: (l$id as int),
      name:
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name
              .fromJson((l$name as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final bool available;

  final double cost;

  final int id;

  final Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name
      name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$available = available;
    _resultData['available'] = l$available;
    final l$cost = cost;
    _resultData['cost'] = moneyToJson(l$cost);
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$available = available;
    final l$cost = cost;
    final l$id = id;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$available,
      l$cost,
      l$id,
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
            is Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices) ||
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

extension UtilityExtension$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices
    on Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices {
  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices<
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices>
      get copyWith =>
          CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices<
    TRes> {
  factory CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices(
    Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices
        instance,
    TRes Function(
            Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices)
        then,
  ) = _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices;

  factory CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices;

  TRes call({
    bool? available,
    double? cost,
    int? id,
    Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name?
        name,
    String? $__typename,
  });
  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name<
      TRes> get name;
}

class _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices<
            TRes> {
  _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices(
    this._instance,
    this._then,
  );

  final Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices
      _instance;

  final TRes Function(
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices)
      _then;

  static const _undefined = {};

  TRes call({
    Object? available = _undefined,
    Object? cost = _undefined,
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices(
        available: available == _undefined || available == null
            ? _instance.available
            : (available as bool),
        cost: cost == _undefined || cost == null
            ? _instance.cost
            : (cost as double),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name<
      TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name(
        local$name, (e) => call(name: e));
  }
}

class _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices<
            TRes> {
  _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices(
      this._res);

  TRes _res;

  call({
    bool? available,
    double? cost,
    int? id,
    Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name?
        name,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name<
          TRes>
      get name =>
          CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name
              .stub(_res);
}

class Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name {
  Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name({
    required this.id,
    required this.translations,
    required this.$__typename,
  });

  factory Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name(
      id: (l$id as int),
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final List<
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations>
      translations;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$translations = translations;
    _resultData['translations'] =
        l$translations.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$translations = translations;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
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
            is Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name
    on Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name {
  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name<
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name>
      get copyWith =>
          CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name<
    TRes> {
  factory CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name(
    Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name
        instance,
    TRes Function(
            Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name)
        then,
  ) = _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name;

  factory CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name;

  TRes call({
    int? id,
    List<Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations> Function(
              Iterable<
                  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations<
                      Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name<
            TRes> {
  _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name(
    this._instance,
    this._then,
  );

  final Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name
      _instance;

  final TRes Function(
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations> Function(
                  Iterable<
                      CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations<
                          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name<
            TRes> {
  _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name(
      this._res);

  TRes _res;

  call({
    int? id,
    List<Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations {
  Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations(
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
            is Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations) ||
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

extension UtilityExtension$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations
    on Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations {
  CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations<
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations>
      get copyWith =>
          CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations<
    TRes> {
  factory CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations(
    Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations
        instance,
    TRes Function(
            Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations)
        then,
  ) = _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations;

  factory CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations<
            TRes> {
  _CopyWithImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations(
    this._instance,
    this._then,
  );

  final Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations
      _instance;

  final TRes Function(
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations(
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

class _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$getCustomerCart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$create_customer_cart {
  factory Variables$Mutation$create_customer_cart(
          {required Input$restaurant_cart_insert_input cart}) =>
      Variables$Mutation$create_customer_cart._({
        r'cart': cart,
      });

  Variables$Mutation$create_customer_cart._(this._$data);

  factory Variables$Mutation$create_customer_cart.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$cart = data['cart'];
    result$data['cart'] = Input$restaurant_cart_insert_input.fromJson(
        (l$cart as Map<String, dynamic>));
    return Variables$Mutation$create_customer_cart._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$restaurant_cart_insert_input get cart =>
      (_$data['cart'] as Input$restaurant_cart_insert_input);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$cart = cart;
    result$data['cart'] = l$cart.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$create_customer_cart<
          Variables$Mutation$create_customer_cart>
      get copyWith => CopyWith$Variables$Mutation$create_customer_cart(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$create_customer_cart) ||
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

abstract class CopyWith$Variables$Mutation$create_customer_cart<TRes> {
  factory CopyWith$Variables$Mutation$create_customer_cart(
    Variables$Mutation$create_customer_cart instance,
    TRes Function(Variables$Mutation$create_customer_cart) then,
  ) = _CopyWithImpl$Variables$Mutation$create_customer_cart;

  factory CopyWith$Variables$Mutation$create_customer_cart.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$create_customer_cart;

  TRes call({Input$restaurant_cart_insert_input? cart});
}

class _CopyWithImpl$Variables$Mutation$create_customer_cart<TRes>
    implements CopyWith$Variables$Mutation$create_customer_cart<TRes> {
  _CopyWithImpl$Variables$Mutation$create_customer_cart(
    this._instance,
    this._then,
  );

  final Variables$Mutation$create_customer_cart _instance;

  final TRes Function(Variables$Mutation$create_customer_cart) _then;

  static const _undefined = {};

  TRes call({Object? cart = _undefined}) =>
      _then(Variables$Mutation$create_customer_cart._({
        ..._instance._$data,
        if (cart != _undefined && cart != null)
          'cart': (cart as Input$restaurant_cart_insert_input),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$create_customer_cart<TRes>
    implements CopyWith$Variables$Mutation$create_customer_cart<TRes> {
  _CopyWithStubImpl$Variables$Mutation$create_customer_cart(this._res);

  TRes _res;

  call({Input$restaurant_cart_insert_input? cart}) => _res;
}

class Mutation$create_customer_cart {
  Mutation$create_customer_cart({
    this.insert_restaurant_cart_one,
    required this.$__typename,
  });

  factory Mutation$create_customer_cart.fromJson(Map<String, dynamic> json) {
    final l$insert_restaurant_cart_one = json['insert_restaurant_cart_one'];
    final l$$__typename = json['__typename'];
    return Mutation$create_customer_cart(
      insert_restaurant_cart_one: l$insert_restaurant_cart_one == null
          ? null
          : Mutation$create_customer_cart$insert_restaurant_cart_one.fromJson(
              (l$insert_restaurant_cart_one as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$create_customer_cart$insert_restaurant_cart_one?
      insert_restaurant_cart_one;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insert_restaurant_cart_one = insert_restaurant_cart_one;
    _resultData['insert_restaurant_cart_one'] =
        l$insert_restaurant_cart_one?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insert_restaurant_cart_one = insert_restaurant_cart_one;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$insert_restaurant_cart_one,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$create_customer_cart) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$insert_restaurant_cart_one = insert_restaurant_cart_one;
    final lOther$insert_restaurant_cart_one = other.insert_restaurant_cart_one;
    if (l$insert_restaurant_cart_one != lOther$insert_restaurant_cart_one) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$create_customer_cart
    on Mutation$create_customer_cart {
  CopyWith$Mutation$create_customer_cart<Mutation$create_customer_cart>
      get copyWith => CopyWith$Mutation$create_customer_cart(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$create_customer_cart<TRes> {
  factory CopyWith$Mutation$create_customer_cart(
    Mutation$create_customer_cart instance,
    TRes Function(Mutation$create_customer_cart) then,
  ) = _CopyWithImpl$Mutation$create_customer_cart;

  factory CopyWith$Mutation$create_customer_cart.stub(TRes res) =
      _CopyWithStubImpl$Mutation$create_customer_cart;

  TRes call({
    Mutation$create_customer_cart$insert_restaurant_cart_one?
        insert_restaurant_cart_one,
    String? $__typename,
  });
  CopyWith$Mutation$create_customer_cart$insert_restaurant_cart_one<TRes>
      get insert_restaurant_cart_one;
}

class _CopyWithImpl$Mutation$create_customer_cart<TRes>
    implements CopyWith$Mutation$create_customer_cart<TRes> {
  _CopyWithImpl$Mutation$create_customer_cart(
    this._instance,
    this._then,
  );

  final Mutation$create_customer_cart _instance;

  final TRes Function(Mutation$create_customer_cart) _then;

  static const _undefined = {};

  TRes call({
    Object? insert_restaurant_cart_one = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$create_customer_cart(
        insert_restaurant_cart_one: insert_restaurant_cart_one == _undefined
            ? _instance.insert_restaurant_cart_one
            : (insert_restaurant_cart_one
                as Mutation$create_customer_cart$insert_restaurant_cart_one?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$create_customer_cart$insert_restaurant_cart_one<TRes>
      get insert_restaurant_cart_one {
    final local$insert_restaurant_cart_one =
        _instance.insert_restaurant_cart_one;
    return local$insert_restaurant_cart_one == null
        ? CopyWith$Mutation$create_customer_cart$insert_restaurant_cart_one
            .stub(_then(_instance))
        : CopyWith$Mutation$create_customer_cart$insert_restaurant_cart_one(
            local$insert_restaurant_cart_one,
            (e) => call(insert_restaurant_cart_one: e));
  }
}

class _CopyWithStubImpl$Mutation$create_customer_cart<TRes>
    implements CopyWith$Mutation$create_customer_cart<TRes> {
  _CopyWithStubImpl$Mutation$create_customer_cart(this._res);

  TRes _res;

  call({
    Mutation$create_customer_cart$insert_restaurant_cart_one?
        insert_restaurant_cart_one,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$create_customer_cart$insert_restaurant_cart_one<TRes>
      get insert_restaurant_cart_one =>
          CopyWith$Mutation$create_customer_cart$insert_restaurant_cart_one
              .stub(_res);
}

const documentNodeMutationcreate_customer_cart = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'create_customer_cart'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'cart')),
        type: NamedTypeNode(
          name: NameNode(value: 'restaurant_cart_insert_input'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'insert_restaurant_cart_one'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'object'),
            value: VariableNode(name: NameNode(value: 'cart')),
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
            name: NameNode(value: 'restaurant_id'),
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
Mutation$create_customer_cart _parserFn$Mutation$create_customer_cart(
        Map<String, dynamic> data) =>
    Mutation$create_customer_cart.fromJson(data);
typedef OnMutationCompleted$Mutation$create_customer_cart = FutureOr<void>
    Function(
  dynamic,
  Mutation$create_customer_cart?,
);

class Options$Mutation$create_customer_cart
    extends graphql.MutationOptions<Mutation$create_customer_cart> {
  Options$Mutation$create_customer_cart({
    String? operationName,
    required Variables$Mutation$create_customer_cart variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$create_customer_cart? onCompleted,
    graphql.OnMutationUpdate<Mutation$create_customer_cart>? update,
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
                        : _parserFn$Mutation$create_customer_cart(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationcreate_customer_cart,
          parserFn: _parserFn$Mutation$create_customer_cart,
        );

  final OnMutationCompleted$Mutation$create_customer_cart?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$create_customer_cart
    extends graphql.WatchQueryOptions<Mutation$create_customer_cart> {
  WatchOptions$Mutation$create_customer_cart({
    String? operationName,
    required Variables$Mutation$create_customer_cart variables,
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
          document: documentNodeMutationcreate_customer_cart,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$create_customer_cart,
        );
}

extension ClientExtension$Mutation$create_customer_cart
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$create_customer_cart>>
      mutate$create_customer_cart(
              Options$Mutation$create_customer_cart options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$create_customer_cart>
      watchMutation$create_customer_cart(
              WatchOptions$Mutation$create_customer_cart options) =>
          this.watchMutation(options);
}

class Mutation$create_customer_cart$insert_restaurant_cart_one {
  Mutation$create_customer_cart$insert_restaurant_cart_one({
    required this.customer_id,
    this.restaurant_id,
    required this.$__typename,
  });

  factory Mutation$create_customer_cart$insert_restaurant_cart_one.fromJson(
      Map<String, dynamic> json) {
    final l$customer_id = json['customer_id'];
    final l$restaurant_id = json['restaurant_id'];
    final l$$__typename = json['__typename'];
    return Mutation$create_customer_cart$insert_restaurant_cart_one(
      customer_id: (l$customer_id as int),
      restaurant_id: (l$restaurant_id as int?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int customer_id;

  final int? restaurant_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$customer_id = customer_id;
    _resultData['customer_id'] = l$customer_id;
    final l$restaurant_id = restaurant_id;
    _resultData['restaurant_id'] = l$restaurant_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$customer_id = customer_id;
    final l$restaurant_id = restaurant_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$customer_id,
      l$restaurant_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$create_customer_cart$insert_restaurant_cart_one) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$customer_id = customer_id;
    final lOther$customer_id = other.customer_id;
    if (l$customer_id != lOther$customer_id) {
      return false;
    }
    final l$restaurant_id = restaurant_id;
    final lOther$restaurant_id = other.restaurant_id;
    if (l$restaurant_id != lOther$restaurant_id) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$create_customer_cart$insert_restaurant_cart_one
    on Mutation$create_customer_cart$insert_restaurant_cart_one {
  CopyWith$Mutation$create_customer_cart$insert_restaurant_cart_one<
          Mutation$create_customer_cart$insert_restaurant_cart_one>
      get copyWith =>
          CopyWith$Mutation$create_customer_cart$insert_restaurant_cart_one(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$create_customer_cart$insert_restaurant_cart_one<
    TRes> {
  factory CopyWith$Mutation$create_customer_cart$insert_restaurant_cart_one(
    Mutation$create_customer_cart$insert_restaurant_cart_one instance,
    TRes Function(Mutation$create_customer_cart$insert_restaurant_cart_one)
        then,
  ) = _CopyWithImpl$Mutation$create_customer_cart$insert_restaurant_cart_one;

  factory CopyWith$Mutation$create_customer_cart$insert_restaurant_cart_one.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$create_customer_cart$insert_restaurant_cart_one;

  TRes call({
    int? customer_id,
    int? restaurant_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$create_customer_cart$insert_restaurant_cart_one<
        TRes>
    implements
        CopyWith$Mutation$create_customer_cart$insert_restaurant_cart_one<
            TRes> {
  _CopyWithImpl$Mutation$create_customer_cart$insert_restaurant_cart_one(
    this._instance,
    this._then,
  );

  final Mutation$create_customer_cart$insert_restaurant_cart_one _instance;

  final TRes Function(Mutation$create_customer_cart$insert_restaurant_cart_one)
      _then;

  static const _undefined = {};

  TRes call({
    Object? customer_id = _undefined,
    Object? restaurant_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$create_customer_cart$insert_restaurant_cart_one(
        customer_id: customer_id == _undefined || customer_id == null
            ? _instance.customer_id
            : (customer_id as int),
        restaurant_id: restaurant_id == _undefined
            ? _instance.restaurant_id
            : (restaurant_id as int?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$create_customer_cart$insert_restaurant_cart_one<
        TRes>
    implements
        CopyWith$Mutation$create_customer_cart$insert_restaurant_cart_one<
            TRes> {
  _CopyWithStubImpl$Mutation$create_customer_cart$insert_restaurant_cart_one(
      this._res);

  TRes _res;

  call({
    int? customer_id,
    int? restaurant_id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Subscription$listen_on_customer_cart {
  factory Variables$Subscription$listen_on_customer_cart(
          {required int customer_id}) =>
      Variables$Subscription$listen_on_customer_cart._({
        r'customer_id': customer_id,
      });

  Variables$Subscription$listen_on_customer_cart._(this._$data);

  factory Variables$Subscription$listen_on_customer_cart.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$customer_id = data['customer_id'];
    result$data['customer_id'] = (l$customer_id as int);
    return Variables$Subscription$listen_on_customer_cart._(result$data);
  }

  Map<String, dynamic> _$data;

  int get customer_id => (_$data['customer_id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$customer_id = customer_id;
    result$data['customer_id'] = l$customer_id;
    return result$data;
  }

  CopyWith$Variables$Subscription$listen_on_customer_cart<
          Variables$Subscription$listen_on_customer_cart>
      get copyWith => CopyWith$Variables$Subscription$listen_on_customer_cart(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Subscription$listen_on_customer_cart) ||
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

abstract class CopyWith$Variables$Subscription$listen_on_customer_cart<TRes> {
  factory CopyWith$Variables$Subscription$listen_on_customer_cart(
    Variables$Subscription$listen_on_customer_cart instance,
    TRes Function(Variables$Subscription$listen_on_customer_cart) then,
  ) = _CopyWithImpl$Variables$Subscription$listen_on_customer_cart;

  factory CopyWith$Variables$Subscription$listen_on_customer_cart.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Subscription$listen_on_customer_cart;

  TRes call({int? customer_id});
}

class _CopyWithImpl$Variables$Subscription$listen_on_customer_cart<TRes>
    implements CopyWith$Variables$Subscription$listen_on_customer_cart<TRes> {
  _CopyWithImpl$Variables$Subscription$listen_on_customer_cart(
    this._instance,
    this._then,
  );

  final Variables$Subscription$listen_on_customer_cart _instance;

  final TRes Function(Variables$Subscription$listen_on_customer_cart) _then;

  static const _undefined = {};

  TRes call({Object? customer_id = _undefined}) =>
      _then(Variables$Subscription$listen_on_customer_cart._({
        ..._instance._$data,
        if (customer_id != _undefined && customer_id != null)
          'customer_id': (customer_id as int),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$listen_on_customer_cart<TRes>
    implements CopyWith$Variables$Subscription$listen_on_customer_cart<TRes> {
  _CopyWithStubImpl$Variables$Subscription$listen_on_customer_cart(this._res);

  TRes _res;

  call({int? customer_id}) => _res;
}

class Subscription$listen_on_customer_cart {
  Subscription$listen_on_customer_cart({
    this.customer_customer_by_pk,
    required this.$__typename,
  });

  factory Subscription$listen_on_customer_cart.fromJson(
      Map<String, dynamic> json) {
    final l$customer_customer_by_pk = json['customer_customer_by_pk'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_customer_cart(
      customer_customer_by_pk: l$customer_customer_by_pk == null
          ? null
          : Subscription$listen_on_customer_cart$customer_customer_by_pk
              .fromJson((l$customer_customer_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$listen_on_customer_cart$customer_customer_by_pk?
      customer_customer_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$customer_customer_by_pk = customer_customer_by_pk;
    _resultData['customer_customer_by_pk'] =
        l$customer_customer_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$customer_customer_by_pk = customer_customer_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$customer_customer_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$listen_on_customer_cart) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$customer_customer_by_pk = customer_customer_by_pk;
    final lOther$customer_customer_by_pk = other.customer_customer_by_pk;
    if (l$customer_customer_by_pk != lOther$customer_customer_by_pk) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$listen_on_customer_cart
    on Subscription$listen_on_customer_cart {
  CopyWith$Subscription$listen_on_customer_cart<
          Subscription$listen_on_customer_cart>
      get copyWith => CopyWith$Subscription$listen_on_customer_cart(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_customer_cart<TRes> {
  factory CopyWith$Subscription$listen_on_customer_cart(
    Subscription$listen_on_customer_cart instance,
    TRes Function(Subscription$listen_on_customer_cart) then,
  ) = _CopyWithImpl$Subscription$listen_on_customer_cart;

  factory CopyWith$Subscription$listen_on_customer_cart.stub(TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_customer_cart;

  TRes call({
    Subscription$listen_on_customer_cart$customer_customer_by_pk?
        customer_customer_by_pk,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk<TRes>
      get customer_customer_by_pk;
}

class _CopyWithImpl$Subscription$listen_on_customer_cart<TRes>
    implements CopyWith$Subscription$listen_on_customer_cart<TRes> {
  _CopyWithImpl$Subscription$listen_on_customer_cart(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_customer_cart _instance;

  final TRes Function(Subscription$listen_on_customer_cart) _then;

  static const _undefined = {};

  TRes call({
    Object? customer_customer_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listen_on_customer_cart(
        customer_customer_by_pk: customer_customer_by_pk == _undefined
            ? _instance.customer_customer_by_pk
            : (customer_customer_by_pk
                as Subscription$listen_on_customer_cart$customer_customer_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk<TRes>
      get customer_customer_by_pk {
    final local$customer_customer_by_pk = _instance.customer_customer_by_pk;
    return local$customer_customer_by_pk == null
        ? CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk
            .stub(_then(_instance))
        : CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk(
            local$customer_customer_by_pk,
            (e) => call(customer_customer_by_pk: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_customer_cart<TRes>
    implements CopyWith$Subscription$listen_on_customer_cart<TRes> {
  _CopyWithStubImpl$Subscription$listen_on_customer_cart(this._res);

  TRes _res;

  call({
    Subscription$listen_on_customer_cart$customer_customer_by_pk?
        customer_customer_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk<TRes>
      get customer_customer_by_pk =>
          CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk
              .stub(_res);
}

const documentNodeSubscriptionlisten_on_customer_cart =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'listen_on_customer_cart'),
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
        name: NameNode(value: 'customer_customer_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'user_id'),
            value: VariableNode(name: NameNode(value: 'customer_id')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'cart'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'restaurant_id'),
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
                    name: NameNode(value: 'delivery_details_id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'delivery_details_of_deliverer'),
                    alias: null,
                    arguments: [],
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
                        name: NameNode(value: 'radius'),
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
                    name: NameNode(value: 'firebase_id'),
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
                    name: NameNode(value: 'stripe_info'),
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
                    name: NameNode(value: 'language_id'),
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
                    name: NameNode(value: 'self_delivery'),
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
                    name: NameNode(value: 'approved'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'open_status'),
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
                        name: NameNode(value: 'options'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                            name: NameNode(value: 'item_options'),
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
                                name: NameNode(value: 'free_choice'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null,
                              ),
                              FieldNode(
                                name: NameNode(value: 'cost_per_extra'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null,
                              ),
                              FieldNode(
                                name: NameNode(value: 'option_type'),
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
                                name: NameNode(value: 'maximum_choice'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null,
                              ),
                              FieldNode(
                                name: NameNode(value: 'minimum_choice'),
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
                                    name: NameNode(value: 'id'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null,
                                  ),
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
                                name: NameNode(value: 'choices'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FieldNode(
                                    name: NameNode(value: 'option_choices'),
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
                                        selectionSet:
                                            SelectionSetNode(selections: [
                                          FieldNode(
                                            name: NameNode(value: 'id'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null,
                                          ),
                                          FieldNode(
                                            name:
                                                NameNode(value: 'translations'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet:
                                                SelectionSetNode(selections: [
                                              FieldNode(
                                                name: NameNode(
                                                    value: 'language_id'),
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
                                                name: NameNode(
                                                    value: '__typename'),
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
                          FieldNode(
                            name: NameNode(value: '__typename'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                        ]),
                      ),
                      FieldNode(
                        name: NameNode(value: 'item_type'),
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
                    name: NameNode(value: 'note'),
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
                    name: NameNode(value: 'selected_options'),
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
Subscription$listen_on_customer_cart
    _parserFn$Subscription$listen_on_customer_cart(Map<String, dynamic> data) =>
        Subscription$listen_on_customer_cart.fromJson(data);

class Options$Subscription$listen_on_customer_cart
    extends graphql.SubscriptionOptions<Subscription$listen_on_customer_cart> {
  Options$Subscription$listen_on_customer_cart({
    String? operationName,
    required Variables$Subscription$listen_on_customer_cart variables,
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
          document: documentNodeSubscriptionlisten_on_customer_cart,
          parserFn: _parserFn$Subscription$listen_on_customer_cart,
        );
}

class WatchOptions$Subscription$listen_on_customer_cart
    extends graphql.WatchQueryOptions<Subscription$listen_on_customer_cart> {
  WatchOptions$Subscription$listen_on_customer_cart({
    String? operationName,
    required Variables$Subscription$listen_on_customer_cart variables,
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
          document: documentNodeSubscriptionlisten_on_customer_cart,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$listen_on_customer_cart,
        );
}

class FetchMoreOptions$Subscription$listen_on_customer_cart
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$listen_on_customer_cart({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$listen_on_customer_cart variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptionlisten_on_customer_cart,
        );
}

extension ClientExtension$Subscription$listen_on_customer_cart
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$listen_on_customer_cart>>
      subscribe$listen_on_customer_cart(
              Options$Subscription$listen_on_customer_cart options) =>
          this.subscribe(options);
  graphql.ObservableQuery<Subscription$listen_on_customer_cart>
      watchSubscription$listen_on_customer_cart(
              WatchOptions$Subscription$listen_on_customer_cart options) =>
          this.watchQuery(options);
}

class Subscription$listen_on_customer_cart$customer_customer_by_pk {
  Subscription$listen_on_customer_cart$customer_customer_by_pk({
    this.cart,
    required this.$__typename,
  });

  factory Subscription$listen_on_customer_cart$customer_customer_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$cart = json['cart'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_customer_cart$customer_customer_by_pk(
      cart: l$cart == null
          ? null
          : Subscription$listen_on_customer_cart$customer_customer_by_pk$cart
              .fromJson((l$cart as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$listen_on_customer_cart$customer_customer_by_pk$cart? cart;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$cart = cart;
    _resultData['cart'] = l$cart?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$cart = cart;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$cart,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$listen_on_customer_cart$customer_customer_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$cart = cart;
    final lOther$cart = other.cart;
    if (l$cart != lOther$cart) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$listen_on_customer_cart$customer_customer_by_pk
    on Subscription$listen_on_customer_cart$customer_customer_by_pk {
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk<
          Subscription$listen_on_customer_cart$customer_customer_by_pk>
      get copyWith =>
          CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk<
    TRes> {
  factory CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk(
    Subscription$listen_on_customer_cart$customer_customer_by_pk instance,
    TRes Function(Subscription$listen_on_customer_cart$customer_customer_by_pk)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk;

  factory CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk;

  TRes call({
    Subscription$listen_on_customer_cart$customer_customer_by_pk$cart? cart,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart<
      TRes> get cart;
}

class _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_customer_cart$customer_customer_by_pk _instance;

  final TRes Function(
      Subscription$listen_on_customer_cart$customer_customer_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? cart = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listen_on_customer_cart$customer_customer_by_pk(
        cart: cart == _undefined
            ? _instance.cart
            : (cart
                as Subscription$listen_on_customer_cart$customer_customer_by_pk$cart?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart<
      TRes> get cart {
    final local$cart = _instance.cart;
    return local$cart == null
        ? CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart
            .stub(_then(_instance))
        : CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart(
            local$cart, (e) => call(cart: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk(
      this._res);

  TRes _res;

  call({
    Subscription$listen_on_customer_cart$customer_customer_by_pk$cart? cart,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart<
          TRes>
      get cart =>
          CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart
              .stub(_res);
}

class Subscription$listen_on_customer_cart$customer_customer_by_pk$cart {
  Subscription$listen_on_customer_cart$customer_customer_by_pk$cart({
    this.restaurant_id,
    this.restaurant,
    required this.items,
    required this.$__typename,
  });

  factory Subscription$listen_on_customer_cart$customer_customer_by_pk$cart.fromJson(
      Map<String, dynamic> json) {
    final l$restaurant_id = json['restaurant_id'];
    final l$restaurant = json['restaurant'];
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_customer_cart$customer_customer_by_pk$cart(
      restaurant_id: (l$restaurant_id as int?),
      restaurant: l$restaurant == null
          ? null
          : Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant
              .fromJson((l$restaurant as Map<String, dynamic>)),
      items: (l$items as List<dynamic>)
          .map((e) =>
              Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int? restaurant_id;

  final Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant?
      restaurant;

  final List<
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items>
      items;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_id = restaurant_id;
    _resultData['restaurant_id'] = l$restaurant_id;
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant?.toJson();
    final l$items = items;
    _resultData['items'] = l$items.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_id = restaurant_id;
    final l$restaurant = restaurant;
    final l$items = items;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$restaurant_id,
      l$restaurant,
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
            is Subscription$listen_on_customer_cart$customer_customer_by_pk$cart) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_id = restaurant_id;
    final lOther$restaurant_id = other.restaurant_id;
    if (l$restaurant_id != lOther$restaurant_id) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart
    on Subscription$listen_on_customer_cart$customer_customer_by_pk$cart {
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart<
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart>
      get copyWith =>
          CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart<
    TRes> {
  factory CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart(
    Subscription$listen_on_customer_cart$customer_customer_by_pk$cart instance,
    TRes Function(
            Subscription$listen_on_customer_cart$customer_customer_by_pk$cart)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart;

  factory CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart;

  TRes call({
    int? restaurant_id,
    Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant?
        restaurant,
    List<Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items>?
        items,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant<
      TRes> get restaurant;
  TRes items(
      Iterable<Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items> Function(
              Iterable<
                  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items<
                      Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items>>)
          _fn);
}

class _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_customer_cart$customer_customer_by_pk$cart
      _instance;

  final TRes Function(
      Subscription$listen_on_customer_cart$customer_customer_by_pk$cart) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_id = _undefined,
    Object? restaurant = _undefined,
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listen_on_customer_cart$customer_customer_by_pk$cart(
        restaurant_id: restaurant_id == _undefined
            ? _instance.restaurant_id
            : (restaurant_id as int?),
        restaurant: restaurant == _undefined
            ? _instance.restaurant
            : (restaurant
                as Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant?),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<
                Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant<
      TRes> get restaurant {
    final local$restaurant = _instance.restaurant;
    return local$restaurant == null
        ? CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant
            .stub(_then(_instance))
        : CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant(
            local$restaurant, (e) => call(restaurant: e));
  }

  TRes items(
          Iterable<Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items> Function(
                  Iterable<
                      CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items<
                          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) =>
              CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart(
      this._res);

  TRes _res;

  call({
    int? restaurant_id,
    Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant?
        restaurant,
    List<Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items>?
        items,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant<
          TRes>
      get restaurant =>
          CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant
              .stub(_res);
  items(_fn) => _res;
}

class Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant {
  Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant({
    required this.id,
    this.delivery_details_id,
    this.delivery_details_of_deliverer,
    this.firebase_id,
    required this.name,
    this.stripe_info,
    this.accepted_payments,
    required this.image,
    required this.language_id,
    this.description_id,
    required this.location,
    required this.self_delivery,
    this.schedule,
    this.description,
    required this.approved,
    required this.open_status,
    required this.$__typename,
  });

  factory Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$delivery_details_id = json['delivery_details_id'];
    final l$delivery_details_of_deliverer =
        json['delivery_details_of_deliverer'];
    final l$firebase_id = json['firebase_id'];
    final l$name = json['name'];
    final l$stripe_info = json['stripe_info'];
    final l$accepted_payments = json['accepted_payments'];
    final l$image = json['image'];
    final l$language_id = json['language_id'];
    final l$description_id = json['description_id'];
    final l$location = json['location'];
    final l$self_delivery = json['self_delivery'];
    final l$schedule = json['schedule'];
    final l$description = json['description'];
    final l$approved = json['approved'];
    final l$open_status = json['open_status'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant(
      id: (l$id as int),
      delivery_details_id: (l$delivery_details_id as int?),
      delivery_details_of_deliverer: (l$delivery_details_of_deliverer
              as List<dynamic>?)
          ?.map((e) =>
              Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      firebase_id: (l$firebase_id as String?),
      name: (l$name as String),
      stripe_info: l$stripe_info == null ? null : mapFromJson(l$stripe_info),
      accepted_payments:
          l$accepted_payments == null ? null : mapFromJson(l$accepted_payments),
      image: (l$image as String),
      language_id: (l$language_id as String),
      description_id: (l$description_id as int?),
      location:
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$location
              .fromJson((l$location as Map<String, dynamic>)),
      self_delivery: (l$self_delivery as bool),
      schedule: l$schedule == null ? null : mapFromJson(l$schedule),
      description: l$description == null
          ? null
          : Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description
              .fromJson((l$description as Map<String, dynamic>)),
      approved: (l$approved as bool),
      open_status: (l$open_status as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final int? delivery_details_id;

  final List<
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer>?
      delivery_details_of_deliverer;

  final String? firebase_id;

  final String name;

  final dynamic? stripe_info;

  final dynamic? accepted_payments;

  final String image;

  final String language_id;

  final int? description_id;

  final Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$location
      location;

  final bool self_delivery;

  final dynamic? schedule;

  final Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description?
      description;

  final bool approved;

  final String open_status;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$delivery_details_id = delivery_details_id;
    _resultData['delivery_details_id'] = l$delivery_details_id;
    final l$delivery_details_of_deliverer = delivery_details_of_deliverer;
    _resultData['delivery_details_of_deliverer'] =
        l$delivery_details_of_deliverer?.map((e) => e.toJson()).toList();
    final l$firebase_id = firebase_id;
    _resultData['firebase_id'] = l$firebase_id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$stripe_info = stripe_info;
    _resultData['stripe_info'] =
        l$stripe_info == null ? null : mapToJson(l$stripe_info);
    final l$accepted_payments = accepted_payments;
    _resultData['accepted_payments'] =
        l$accepted_payments == null ? null : mapToJson(l$accepted_payments);
    final l$image = image;
    _resultData['image'] = l$image;
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
    final l$description_id = description_id;
    _resultData['description_id'] = l$description_id;
    final l$location = location;
    _resultData['location'] = l$location.toJson();
    final l$self_delivery = self_delivery;
    _resultData['self_delivery'] = l$self_delivery;
    final l$schedule = schedule;
    _resultData['schedule'] = l$schedule == null ? null : mapToJson(l$schedule);
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
    final l$approved = approved;
    _resultData['approved'] = l$approved;
    final l$open_status = open_status;
    _resultData['open_status'] = l$open_status;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$delivery_details_id = delivery_details_id;
    final l$delivery_details_of_deliverer = delivery_details_of_deliverer;
    final l$firebase_id = firebase_id;
    final l$name = name;
    final l$stripe_info = stripe_info;
    final l$accepted_payments = accepted_payments;
    final l$image = image;
    final l$language_id = language_id;
    final l$description_id = description_id;
    final l$location = location;
    final l$self_delivery = self_delivery;
    final l$schedule = schedule;
    final l$description = description;
    final l$approved = approved;
    final l$open_status = open_status;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$delivery_details_id,
      l$delivery_details_of_deliverer == null
          ? null
          : Object.hashAll(l$delivery_details_of_deliverer.map((v) => v)),
      l$firebase_id,
      l$name,
      l$stripe_info,
      l$accepted_payments,
      l$image,
      l$language_id,
      l$description_id,
      l$location,
      l$self_delivery,
      l$schedule,
      l$description,
      l$approved,
      l$open_status,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$delivery_details_id = delivery_details_id;
    final lOther$delivery_details_id = other.delivery_details_id;
    if (l$delivery_details_id != lOther$delivery_details_id) {
      return false;
    }
    final l$delivery_details_of_deliverer = delivery_details_of_deliverer;
    final lOther$delivery_details_of_deliverer =
        other.delivery_details_of_deliverer;
    if (l$delivery_details_of_deliverer != null &&
        lOther$delivery_details_of_deliverer != null) {
      if (l$delivery_details_of_deliverer.length !=
          lOther$delivery_details_of_deliverer.length) {
        return false;
      }
      for (int i = 0; i < l$delivery_details_of_deliverer.length; i++) {
        final l$delivery_details_of_deliverer$entry =
            l$delivery_details_of_deliverer[i];
        final lOther$delivery_details_of_deliverer$entry =
            lOther$delivery_details_of_deliverer[i];
        if (l$delivery_details_of_deliverer$entry !=
            lOther$delivery_details_of_deliverer$entry) {
          return false;
        }
      }
    } else if (l$delivery_details_of_deliverer !=
        lOther$delivery_details_of_deliverer) {
      return false;
    }
    final l$firebase_id = firebase_id;
    final lOther$firebase_id = other.firebase_id;
    if (l$firebase_id != lOther$firebase_id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$stripe_info = stripe_info;
    final lOther$stripe_info = other.stripe_info;
    if (l$stripe_info != lOther$stripe_info) {
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
    final l$language_id = language_id;
    final lOther$language_id = other.language_id;
    if (l$language_id != lOther$language_id) {
      return false;
    }
    final l$description_id = description_id;
    final lOther$description_id = other.description_id;
    if (l$description_id != lOther$description_id) {
      return false;
    }
    final l$location = location;
    final lOther$location = other.location;
    if (l$location != lOther$location) {
      return false;
    }
    final l$self_delivery = self_delivery;
    final lOther$self_delivery = other.self_delivery;
    if (l$self_delivery != lOther$self_delivery) {
      return false;
    }
    final l$schedule = schedule;
    final lOther$schedule = other.schedule;
    if (l$schedule != lOther$schedule) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$approved = approved;
    final lOther$approved = other.approved;
    if (l$approved != lOther$approved) {
      return false;
    }
    final l$open_status = open_status;
    final lOther$open_status = other.open_status;
    if (l$open_status != lOther$open_status) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant
    on Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant {
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant<
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant>
      get copyWith =>
          CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant<
    TRes> {
  factory CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant(
    Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant
        instance,
    TRes Function(
            Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant;

  factory CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant;

  TRes call({
    int? id,
    int? delivery_details_id,
    List<Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer>?
        delivery_details_of_deliverer,
    String? firebase_id,
    String? name,
    dynamic? stripe_info,
    dynamic? accepted_payments,
    String? image,
    String? language_id,
    int? description_id,
    Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$location?
        location,
    bool? self_delivery,
    dynamic? schedule,
    Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description?
        description,
    bool? approved,
    String? open_status,
    String? $__typename,
  });
  TRes delivery_details_of_deliverer(
      Iterable<Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer>? Function(
              Iterable<
                  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer<
                      Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer>>?)
          _fn);
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$location<
      TRes> get location;
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description<
      TRes> get description;
}

class _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant
      _instance;

  final TRes Function(
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? delivery_details_id = _undefined,
    Object? delivery_details_of_deliverer = _undefined,
    Object? firebase_id = _undefined,
    Object? name = _undefined,
    Object? stripe_info = _undefined,
    Object? accepted_payments = _undefined,
    Object? image = _undefined,
    Object? language_id = _undefined,
    Object? description_id = _undefined,
    Object? location = _undefined,
    Object? self_delivery = _undefined,
    Object? schedule = _undefined,
    Object? description = _undefined,
    Object? approved = _undefined,
    Object? open_status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        delivery_details_id: delivery_details_id == _undefined
            ? _instance.delivery_details_id
            : (delivery_details_id as int?),
        delivery_details_of_deliverer: delivery_details_of_deliverer ==
                _undefined
            ? _instance.delivery_details_of_deliverer
            : (delivery_details_of_deliverer as List<
                Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer>?),
        firebase_id: firebase_id == _undefined
            ? _instance.firebase_id
            : (firebase_id as String?),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        stripe_info: stripe_info == _undefined
            ? _instance.stripe_info
            : (stripe_info as dynamic?),
        accepted_payments: accepted_payments == _undefined
            ? _instance.accepted_payments
            : (accepted_payments as dynamic?),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        description_id: description_id == _undefined
            ? _instance.description_id
            : (description_id as int?),
        location: location == _undefined || location == null
            ? _instance.location
            : (location
                as Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$location),
        self_delivery: self_delivery == _undefined || self_delivery == null
            ? _instance.self_delivery
            : (self_delivery as bool),
        schedule: schedule == _undefined
            ? _instance.schedule
            : (schedule as dynamic?),
        description: description == _undefined
            ? _instance.description
            : (description
                as Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description?),
        approved: approved == _undefined || approved == null
            ? _instance.approved
            : (approved as bool),
        open_status: open_status == _undefined || open_status == null
            ? _instance.open_status
            : (open_status as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes delivery_details_of_deliverer(
          Iterable<Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer>? Function(
                  Iterable<
                      CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer<
                          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer>>?)
              _fn) =>
      call(
          delivery_details_of_deliverer: _fn(
              _instance.delivery_details_of_deliverer?.map((e) =>
                  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer(
                    e,
                    (i) => i,
                  )))?.toList());
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$location<
      TRes> get location {
    final local$location = _instance.location;
    return CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$location(
        local$location, (e) => call(location: e));
  }

  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description<
      TRes> get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description
            .stub(_then(_instance))
        : CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description(
            local$description, (e) => call(description: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant(
      this._res);

  TRes _res;

  call({
    int? id,
    int? delivery_details_id,
    List<Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer>?
        delivery_details_of_deliverer,
    String? firebase_id,
    String? name,
    dynamic? stripe_info,
    dynamic? accepted_payments,
    String? image,
    String? language_id,
    int? description_id,
    Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$location?
        location,
    bool? self_delivery,
    dynamic? schedule,
    Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description?
        description,
    bool? approved,
    String? open_status,
    String? $__typename,
  }) =>
      _res;
  delivery_details_of_deliverer(_fn) => _res;
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$location<
          TRes>
      get location =>
          CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$location
              .stub(_res);
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description<
          TRes>
      get description =>
          CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description
              .stub(_res);
}

class Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer {
  Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer({
    required this.cost_per_km,
    this.free_delivery_km_range,
    this.free_delivery_minimum_cost,
    required this.id,
    required this.minimum_cost,
    required this.radius,
    required this.$__typename,
  });

  factory Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer.fromJson(
      Map<String, dynamic> json) {
    final l$cost_per_km = json['cost_per_km'];
    final l$free_delivery_km_range = json['free_delivery_km_range'];
    final l$free_delivery_minimum_cost = json['free_delivery_minimum_cost'];
    final l$id = json['id'];
    final l$minimum_cost = json['minimum_cost'];
    final l$radius = json['radius'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer(
      cost_per_km: moneyFromJson(l$cost_per_km),
      free_delivery_km_range: (l$free_delivery_km_range as num?)?.toDouble(),
      free_delivery_minimum_cost: l$free_delivery_minimum_cost == null
          ? null
          : moneyFromJson(l$free_delivery_minimum_cost),
      id: (l$id as int),
      minimum_cost: moneyFromJson(l$minimum_cost),
      radius: (l$radius as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final double cost_per_km;

  final double? free_delivery_km_range;

  final double? free_delivery_minimum_cost;

  final int id;

  final double minimum_cost;

  final int radius;

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
    final l$radius = radius;
    _resultData['radius'] = l$radius;
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
    final l$radius = radius;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$cost_per_km,
      l$free_delivery_km_range,
      l$free_delivery_minimum_cost,
      l$id,
      l$minimum_cost,
      l$radius,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer) ||
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
    final l$radius = radius;
    final lOther$radius = other.radius;
    if (l$radius != lOther$radius) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer
    on Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer {
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer<
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer>
      get copyWith =>
          CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer<
    TRes> {
  factory CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer(
    Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer
        instance,
    TRes Function(
            Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer;

  factory CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer;

  TRes call({
    double? cost_per_km,
    double? free_delivery_km_range,
    double? free_delivery_minimum_cost,
    int? id,
    double? minimum_cost,
    int? radius,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer
      _instance;

  final TRes Function(
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? cost_per_km = _undefined,
    Object? free_delivery_km_range = _undefined,
    Object? free_delivery_minimum_cost = _undefined,
    Object? id = _undefined,
    Object? minimum_cost = _undefined,
    Object? radius = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer(
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
        radius: radius == _undefined || radius == null
            ? _instance.radius
            : (radius as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$delivery_details_of_deliverer(
      this._res);

  TRes _res;

  call({
    double? cost_per_km,
    double? free_delivery_km_range,
    double? free_delivery_minimum_cost,
    int? id,
    double? minimum_cost,
    int? radius,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$location {
  Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$location({
    required this.gps,
    this.address,
    required this.$__typename,
  });

  factory Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$location.fromJson(
      Map<String, dynamic> json) {
    final l$gps = json['gps'];
    final l$address = json['address'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$location(
      gps: geographyFromJson(l$gps),
      address: (l$address as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Geography gps;

  final String? address;

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
            is Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$location) ||
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

extension UtilityExtension$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$location
    on Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$location {
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$location<
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$location>
      get copyWith =>
          CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$location<
    TRes> {
  factory CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$location(
    Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$location
        instance,
    TRes Function(
            Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$location)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$location;

  factory CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$location.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$location;

  TRes call({
    Geography? gps,
    String? address,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$location<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$location<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$location(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$location
      _instance;

  final TRes Function(
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$location)
      _then;

  static const _undefined = {};

  TRes call({
    Object? gps = _undefined,
    Object? address = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$location(
        gps: gps == _undefined || gps == null
            ? _instance.gps
            : (gps as Geography),
        address:
            address == _undefined ? _instance.address : (address as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$location<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$location<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$location(
      this._res);

  TRes _res;

  call({
    Geography? gps,
    String? address,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description {
  Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description({
    required this.translations,
    required this.$__typename,
  });

  factory Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description$translations>
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
            is Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description) ||
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

extension UtilityExtension$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description
    on Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description {
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description<
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description>
      get copyWith =>
          CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description<
    TRes> {
  factory CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description(
    Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description
        instance,
    TRes Function(
            Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description;

  factory CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description;

  TRes call({
    List<Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description$translations> Function(
              Iterable<
                  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description$translations<
                      Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description$translations>>)
          _fn);
}

class _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description
      _instance;

  final TRes Function(
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description$translations> Function(
                  Iterable<
                      CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description$translations<
                          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description(
      this._res);

  TRes _res;

  call({
    List<Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description$translations {
  Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description$translations(
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
            is Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description$translations) ||
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

extension UtilityExtension$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description$translations
    on Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description$translations {
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description$translations<
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description$translations>
      get copyWith =>
          CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description$translations<
    TRes> {
  factory CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description$translations(
    Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description$translations
        instance,
    TRes Function(
            Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description$translations)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description$translations;

  factory CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description$translations<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description$translations<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description$translations(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description$translations
      _instance;

  final TRes Function(
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description$translations(
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

class _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description$translations<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description$translations<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$restaurant$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items {
  Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items({
    required this.restaurant_item,
    required this.cost_per_one,
    required this.id,
    this.note,
    required this.quantity,
    required this.selected_options,
    required this.$__typename,
  });

  factory Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items.fromJson(
      Map<String, dynamic> json) {
    final l$restaurant_item = json['restaurant_item'];
    final l$cost_per_one = json['cost_per_one'];
    final l$id = json['id'];
    final l$note = json['note'];
    final l$quantity = json['quantity'];
    final l$selected_options = json['selected_options'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items(
      restaurant_item:
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item
              .fromJson((l$restaurant_item as Map<String, dynamic>)),
      cost_per_one: moneyFromJson(l$cost_per_one),
      id: (l$id as int),
      note: (l$note as String?),
      quantity: (l$quantity as int),
      selected_options: mapFromJson(l$selected_options),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item
      restaurant_item;

  final double cost_per_one;

  final int id;

  final String? note;

  final int quantity;

  final dynamic selected_options;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_item = restaurant_item;
    _resultData['restaurant_item'] = l$restaurant_item.toJson();
    final l$cost_per_one = cost_per_one;
    _resultData['cost_per_one'] = moneyToJson(l$cost_per_one);
    final l$id = id;
    _resultData['id'] = l$id;
    final l$note = note;
    _resultData['note'] = l$note;
    final l$quantity = quantity;
    _resultData['quantity'] = l$quantity;
    final l$selected_options = selected_options;
    _resultData['selected_options'] = mapToJson(l$selected_options);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_item = restaurant_item;
    final l$cost_per_one = cost_per_one;
    final l$id = id;
    final l$note = note;
    final l$quantity = quantity;
    final l$selected_options = selected_options;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$restaurant_item,
      l$cost_per_one,
      l$id,
      l$note,
      l$quantity,
      l$selected_options,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items) ||
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
    final l$note = note;
    final lOther$note = other.note;
    if (l$note != lOther$note) {
      return false;
    }
    final l$quantity = quantity;
    final lOther$quantity = other.quantity;
    if (l$quantity != lOther$quantity) {
      return false;
    }
    final l$selected_options = selected_options;
    final lOther$selected_options = other.selected_options;
    if (l$selected_options != lOther$selected_options) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items
    on Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items {
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items<
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items>
      get copyWith =>
          CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items<
    TRes> {
  factory CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items(
    Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items
        instance,
    TRes Function(
            Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items;

  factory CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items;

  TRes call({
    Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item?
        restaurant_item,
    double? cost_per_one,
    int? id,
    String? note,
    int? quantity,
    dynamic? selected_options,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item<
      TRes> get restaurant_item;
}

class _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items
      _instance;

  final TRes Function(
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items)
      _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_item = _undefined,
    Object? cost_per_one = _undefined,
    Object? id = _undefined,
    Object? note = _undefined,
    Object? quantity = _undefined,
    Object? selected_options = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items(
        restaurant_item: restaurant_item == _undefined ||
                restaurant_item == null
            ? _instance.restaurant_item
            : (restaurant_item
                as Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item),
        cost_per_one: cost_per_one == _undefined || cost_per_one == null
            ? _instance.cost_per_one
            : (cost_per_one as double),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        note: note == _undefined ? _instance.note : (note as String?),
        quantity: quantity == _undefined || quantity == null
            ? _instance.quantity
            : (quantity as int),
        selected_options:
            selected_options == _undefined || selected_options == null
                ? _instance.selected_options
                : (selected_options as dynamic),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item<
      TRes> get restaurant_item {
    final local$restaurant_item = _instance.restaurant_item;
    return CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item(
        local$restaurant_item, (e) => call(restaurant_item: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items(
      this._res);

  TRes _res;

  call({
    Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item?
        restaurant_item,
    double? cost_per_one,
    int? id,
    String? note,
    int? quantity,
    dynamic? selected_options,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item<
          TRes>
      get restaurant_item =>
          CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item
              .stub(_res);
}

class Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item {
  Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item({
    required this.options,
    required this.item_type,
    this.image,
    required this.id,
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

  factory Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item.fromJson(
      Map<String, dynamic> json) {
    final l$options = json['options'];
    final l$item_type = json['item_type'];
    final l$image = json['image'];
    final l$id = json['id'];
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
    return Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item(
      options: (l$options as List<dynamic>)
          .map((e) =>
              Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      item_type: (l$item_type as String),
      image: (l$image as String?),
      id: (l$id as int),
      name:
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name
              .fromJson((l$name as Map<String, dynamic>)),
      description: l$description == null
          ? null
          : Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description
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

  final List<
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options>
      options;

  final String item_type;

  final String? image;

  final int id;

  final Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name
      name;

  final Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description?
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
    final l$options = options;
    _resultData['options'] = l$options.map((e) => e.toJson()).toList();
    final l$item_type = item_type;
    _resultData['item_type'] = l$item_type;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$id = id;
    _resultData['id'] = l$id;
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
    final l$options = options;
    final l$item_type = item_type;
    final l$image = image;
    final l$id = id;
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
      Object.hashAll(l$options.map((v) => v)),
      l$item_type,
      l$image,
      l$id,
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
            is Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$options = options;
    final lOther$options = other.options;
    if (l$options.length != lOther$options.length) {
      return false;
    }
    for (int i = 0; i < l$options.length; i++) {
      final l$options$entry = l$options[i];
      final lOther$options$entry = lOther$options[i];
      if (l$options$entry != lOther$options$entry) {
        return false;
      }
    }
    final l$item_type = item_type;
    final lOther$item_type = other.item_type;
    if (l$item_type != lOther$item_type) {
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

extension UtilityExtension$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item
    on Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item {
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item<
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item>
      get copyWith =>
          CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item<
    TRes> {
  factory CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item(
    Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item
        instance,
    TRes Function(
            Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item;

  factory CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item;

  TRes call({
    List<Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options>?
        options,
    String? item_type,
    String? image,
    int? id,
    Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name?
        name,
    Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description?
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
  TRes options(
      Iterable<Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options> Function(
              Iterable<
                  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options<
                      Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options>>)
          _fn);
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name<
      TRes> get name;
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description<
      TRes> get description;
}

class _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item
      _instance;

  final TRes Function(
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item)
      _then;

  static const _undefined = {};

  TRes call({
    Object? options = _undefined,
    Object? item_type = _undefined,
    Object? image = _undefined,
    Object? id = _undefined,
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
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item(
        options: options == _undefined || options == null
            ? _instance.options
            : (options as List<
                Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options>),
        item_type: item_type == _undefined || item_type == null
            ? _instance.item_type
            : (item_type as String),
        image: image == _undefined ? _instance.image : (image as String?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name),
        description: description == _undefined
            ? _instance.description
            : (description
                as Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description?),
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
  TRes options(
          Iterable<Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options> Function(
                  Iterable<
                      CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options<
                          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options>>)
              _fn) =>
      call(
          options: _fn(_instance.options.map((e) =>
              CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options(
                e,
                (i) => i,
              ))).toList());
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name<
      TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name(
        local$name, (e) => call(name: e));
  }

  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description<
      TRes> get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description
            .stub(_then(_instance))
        : CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description(
            local$description, (e) => call(description: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item(
      this._res);

  TRes _res;

  call({
    List<Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options>?
        options,
    String? item_type,
    String? image,
    int? id,
    Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name?
        name,
    Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description?
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
  options(_fn) => _res;
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name<
          TRes>
      get name =>
          CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name
              .stub(_res);
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description<
          TRes>
      get description =>
          CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description
              .stub(_res);
}

class Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options {
  Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options({
    required this.item_options,
    required this.$__typename,
  });

  factory Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options.fromJson(
      Map<String, dynamic> json) {
    final l$item_options = json['item_options'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options(
      item_options: (l$item_options as List<dynamic>)
          .map((e) =>
              Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options>
      item_options;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$item_options = item_options;
    _resultData['item_options'] =
        l$item_options.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$item_options = item_options;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$item_options.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$item_options = item_options;
    final lOther$item_options = other.item_options;
    if (l$item_options.length != lOther$item_options.length) {
      return false;
    }
    for (int i = 0; i < l$item_options.length; i++) {
      final l$item_options$entry = l$item_options[i];
      final lOther$item_options$entry = lOther$item_options[i];
      if (l$item_options$entry != lOther$item_options$entry) {
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

extension UtilityExtension$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options
    on Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options {
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options<
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options>
      get copyWith =>
          CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options<
    TRes> {
  factory CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options(
    Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options
        instance,
    TRes Function(
            Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options;

  factory CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options;

  TRes call({
    List<Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options>?
        item_options,
    String? $__typename,
  });
  TRes item_options(
      Iterable<Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options> Function(
              Iterable<
                  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options<
                      Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options>>)
          _fn);
}

class _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options
      _instance;

  final TRes Function(
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options)
      _then;

  static const _undefined = {};

  TRes call({
    Object? item_options = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options(
        item_options: item_options == _undefined || item_options == null
            ? _instance.item_options
            : (item_options as List<
                Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes item_options(
          Iterable<Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options> Function(
                  Iterable<
                      CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options<
                          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options>>)
              _fn) =>
      call(
          item_options: _fn(_instance.item_options.map((e) =>
              CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options(
      this._res);

  TRes _res;

  call({
    List<Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options>?
        item_options,
    String? $__typename,
  }) =>
      _res;
  item_options(_fn) => _res;
}

class Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options {
  Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options({
    required this.id,
    required this.free_choice,
    required this.cost_per_extra,
    required this.option_type,
    required this.position,
    required this.maximum_choice,
    required this.minimum_choice,
    required this.name,
    required this.choices,
    required this.$__typename,
  });

  factory Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$free_choice = json['free_choice'];
    final l$cost_per_extra = json['cost_per_extra'];
    final l$option_type = json['option_type'];
    final l$position = json['position'];
    final l$maximum_choice = json['maximum_choice'];
    final l$minimum_choice = json['minimum_choice'];
    final l$name = json['name'];
    final l$choices = json['choices'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options(
      id: (l$id as int),
      free_choice: (l$free_choice as int),
      cost_per_extra: moneyFromJson(l$cost_per_extra),
      option_type: (l$option_type as String),
      position: (l$position as int),
      maximum_choice: (l$maximum_choice as int),
      minimum_choice: (l$minimum_choice as int),
      name:
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name
              .fromJson((l$name as Map<String, dynamic>)),
      choices: (l$choices as List<dynamic>)
          .map((e) =>
              Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final int free_choice;

  final double cost_per_extra;

  final String option_type;

  final int position;

  final int maximum_choice;

  final int minimum_choice;

  final Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name
      name;

  final List<
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices>
      choices;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$free_choice = free_choice;
    _resultData['free_choice'] = l$free_choice;
    final l$cost_per_extra = cost_per_extra;
    _resultData['cost_per_extra'] = moneyToJson(l$cost_per_extra);
    final l$option_type = option_type;
    _resultData['option_type'] = l$option_type;
    final l$position = position;
    _resultData['position'] = l$position;
    final l$maximum_choice = maximum_choice;
    _resultData['maximum_choice'] = l$maximum_choice;
    final l$minimum_choice = minimum_choice;
    _resultData['minimum_choice'] = l$minimum_choice;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$choices = choices;
    _resultData['choices'] = l$choices.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$free_choice = free_choice;
    final l$cost_per_extra = cost_per_extra;
    final l$option_type = option_type;
    final l$position = position;
    final l$maximum_choice = maximum_choice;
    final l$minimum_choice = minimum_choice;
    final l$name = name;
    final l$choices = choices;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$free_choice,
      l$cost_per_extra,
      l$option_type,
      l$position,
      l$maximum_choice,
      l$minimum_choice,
      l$name,
      Object.hashAll(l$choices.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$free_choice = free_choice;
    final lOther$free_choice = other.free_choice;
    if (l$free_choice != lOther$free_choice) {
      return false;
    }
    final l$cost_per_extra = cost_per_extra;
    final lOther$cost_per_extra = other.cost_per_extra;
    if (l$cost_per_extra != lOther$cost_per_extra) {
      return false;
    }
    final l$option_type = option_type;
    final lOther$option_type = other.option_type;
    if (l$option_type != lOther$option_type) {
      return false;
    }
    final l$position = position;
    final lOther$position = other.position;
    if (l$position != lOther$position) {
      return false;
    }
    final l$maximum_choice = maximum_choice;
    final lOther$maximum_choice = other.maximum_choice;
    if (l$maximum_choice != lOther$maximum_choice) {
      return false;
    }
    final l$minimum_choice = minimum_choice;
    final lOther$minimum_choice = other.minimum_choice;
    if (l$minimum_choice != lOther$minimum_choice) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$choices = choices;
    final lOther$choices = other.choices;
    if (l$choices.length != lOther$choices.length) {
      return false;
    }
    for (int i = 0; i < l$choices.length; i++) {
      final l$choices$entry = l$choices[i];
      final lOther$choices$entry = lOther$choices[i];
      if (l$choices$entry != lOther$choices$entry) {
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

extension UtilityExtension$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options
    on Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options {
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options<
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options>
      get copyWith =>
          CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options<
    TRes> {
  factory CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options(
    Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options
        instance,
    TRes Function(
            Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options;

  factory CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options;

  TRes call({
    int? id,
    int? free_choice,
    double? cost_per_extra,
    String? option_type,
    int? position,
    int? maximum_choice,
    int? minimum_choice,
    Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name?
        name,
    List<Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices>?
        choices,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name<
      TRes> get name;
  TRes choices(
      Iterable<Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices> Function(
              Iterable<
                  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices<
                      Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices>>)
          _fn);
}

class _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options
      _instance;

  final TRes Function(
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? free_choice = _undefined,
    Object? cost_per_extra = _undefined,
    Object? option_type = _undefined,
    Object? position = _undefined,
    Object? maximum_choice = _undefined,
    Object? minimum_choice = _undefined,
    Object? name = _undefined,
    Object? choices = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        free_choice: free_choice == _undefined || free_choice == null
            ? _instance.free_choice
            : (free_choice as int),
        cost_per_extra: cost_per_extra == _undefined || cost_per_extra == null
            ? _instance.cost_per_extra
            : (cost_per_extra as double),
        option_type: option_type == _undefined || option_type == null
            ? _instance.option_type
            : (option_type as String),
        position: position == _undefined || position == null
            ? _instance.position
            : (position as int),
        maximum_choice: maximum_choice == _undefined || maximum_choice == null
            ? _instance.maximum_choice
            : (maximum_choice as int),
        minimum_choice: minimum_choice == _undefined || minimum_choice == null
            ? _instance.minimum_choice
            : (minimum_choice as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name),
        choices: choices == _undefined || choices == null
            ? _instance.choices
            : (choices as List<
                Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name<
      TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name(
        local$name, (e) => call(name: e));
  }

  TRes choices(
          Iterable<Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices> Function(
                  Iterable<
                      CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices<
                          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices>>)
              _fn) =>
      call(
          choices: _fn(_instance.choices.map((e) =>
              CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options(
      this._res);

  TRes _res;

  call({
    int? id,
    int? free_choice,
    double? cost_per_extra,
    String? option_type,
    int? position,
    int? maximum_choice,
    int? minimum_choice,
    Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name?
        name,
    List<Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices>?
        choices,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name<
          TRes>
      get name =>
          CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name
              .stub(_res);
  choices(_fn) => _res;
}

class Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name {
  Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name({
    required this.id,
    required this.translations,
    required this.$__typename,
  });

  factory Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name(
      id: (l$id as int),
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final List<
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations>
      translations;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$translations = translations;
    _resultData['translations'] =
        l$translations.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$translations = translations;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
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
            is Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name
    on Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name {
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name<
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name>
      get copyWith =>
          CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name<
    TRes> {
  factory CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name(
    Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name
        instance,
    TRes Function(
            Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name;

  factory CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name;

  TRes call({
    int? id,
    List<Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations> Function(
              Iterable<
                  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations<
                      Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations>>)
          _fn);
}

class _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name
      _instance;

  final TRes Function(
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations> Function(
                  Iterable<
                      CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations<
                          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name(
      this._res);

  TRes _res;

  call({
    int? id,
    List<Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations {
  Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations(
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
            is Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations) ||
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

extension UtilityExtension$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations
    on Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations {
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations<
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations>
      get copyWith =>
          CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations<
    TRes> {
  factory CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations(
    Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations
        instance,
    TRes Function(
            Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations;

  factory CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations
      _instance;

  final TRes Function(
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations(
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

class _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices {
  Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices({
    required this.option_choices,
    required this.$__typename,
  });

  factory Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices.fromJson(
      Map<String, dynamic> json) {
    final l$option_choices = json['option_choices'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices(
      option_choices: (l$option_choices as List<dynamic>)
          .map((e) =>
              Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices>
      option_choices;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$option_choices = option_choices;
    _resultData['option_choices'] =
        l$option_choices.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$option_choices = option_choices;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$option_choices.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$option_choices = option_choices;
    final lOther$option_choices = other.option_choices;
    if (l$option_choices.length != lOther$option_choices.length) {
      return false;
    }
    for (int i = 0; i < l$option_choices.length; i++) {
      final l$option_choices$entry = l$option_choices[i];
      final lOther$option_choices$entry = lOther$option_choices[i];
      if (l$option_choices$entry != lOther$option_choices$entry) {
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

extension UtilityExtension$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices
    on Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices {
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices<
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices>
      get copyWith =>
          CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices<
    TRes> {
  factory CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices(
    Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices
        instance,
    TRes Function(
            Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices;

  factory CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices;

  TRes call({
    List<Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices>?
        option_choices,
    String? $__typename,
  });
  TRes option_choices(
      Iterable<Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices> Function(
              Iterable<
                  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices<
                      Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices>>)
          _fn);
}

class _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices
      _instance;

  final TRes Function(
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices)
      _then;

  static const _undefined = {};

  TRes call({
    Object? option_choices = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices(
        option_choices: option_choices == _undefined || option_choices == null
            ? _instance.option_choices
            : (option_choices as List<
                Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes option_choices(
          Iterable<Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices> Function(
                  Iterable<
                      CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices<
                          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices>>)
              _fn) =>
      call(
          option_choices: _fn(_instance.option_choices.map((e) =>
              CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices(
      this._res);

  TRes _res;

  call({
    List<Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices>?
        option_choices,
    String? $__typename,
  }) =>
      _res;
  option_choices(_fn) => _res;
}

class Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices {
  Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices({
    required this.available,
    required this.cost,
    required this.id,
    required this.name,
    required this.$__typename,
  });

  factory Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices.fromJson(
      Map<String, dynamic> json) {
    final l$available = json['available'];
    final l$cost = json['cost'];
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices(
      available: (l$available as bool),
      cost: moneyFromJson(l$cost),
      id: (l$id as int),
      name:
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name
              .fromJson((l$name as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final bool available;

  final double cost;

  final int id;

  final Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name
      name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$available = available;
    _resultData['available'] = l$available;
    final l$cost = cost;
    _resultData['cost'] = moneyToJson(l$cost);
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$available = available;
    final l$cost = cost;
    final l$id = id;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$available,
      l$cost,
      l$id,
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
            is Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices) ||
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

extension UtilityExtension$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices
    on Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices {
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices<
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices>
      get copyWith =>
          CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices<
    TRes> {
  factory CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices(
    Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices
        instance,
    TRes Function(
            Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices;

  factory CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices;

  TRes call({
    bool? available,
    double? cost,
    int? id,
    Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name?
        name,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name<
      TRes> get name;
}

class _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices
      _instance;

  final TRes Function(
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices)
      _then;

  static const _undefined = {};

  TRes call({
    Object? available = _undefined,
    Object? cost = _undefined,
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices(
        available: available == _undefined || available == null
            ? _instance.available
            : (available as bool),
        cost: cost == _undefined || cost == null
            ? _instance.cost
            : (cost as double),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name<
      TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name(
        local$name, (e) => call(name: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices(
      this._res);

  TRes _res;

  call({
    bool? available,
    double? cost,
    int? id,
    Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name?
        name,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name<
          TRes>
      get name =>
          CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name
              .stub(_res);
}

class Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name {
  Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name({
    required this.id,
    required this.translations,
    required this.$__typename,
  });

  factory Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name(
      id: (l$id as int),
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final List<
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations>
      translations;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$translations = translations;
    _resultData['translations'] =
        l$translations.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$translations = translations;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
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
            is Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name
    on Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name {
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name<
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name>
      get copyWith =>
          CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name<
    TRes> {
  factory CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name(
    Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name
        instance,
    TRes Function(
            Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name;

  factory CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name;

  TRes call({
    int? id,
    List<Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations> Function(
              Iterable<
                  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations<
                      Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations>>)
          _fn);
}

class _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name
      _instance;

  final TRes Function(
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations> Function(
                  Iterable<
                      CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations<
                          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name(
      this._res);

  TRes _res;

  call({
    int? id,
    List<Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations {
  Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations(
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
            is Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations) ||
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

extension UtilityExtension$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations
    on Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations {
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations<
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations>
      get copyWith =>
          CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations<
    TRes> {
  factory CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations(
    Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations
        instance,
    TRes Function(
            Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations;

  factory CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations
      _instance;

  final TRes Function(
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations(
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

class _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$options$item_options$choices$option_choices$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name {
  Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name({
    required this.translations,
    required this.$__typename,
  });

  factory Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name$translations>
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
            is Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name) ||
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

extension UtilityExtension$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name
    on Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name {
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name<
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name>
      get copyWith =>
          CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name<
    TRes> {
  factory CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name(
    Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name
        instance,
    TRes Function(
            Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name;

  factory CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name;

  TRes call({
    List<Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name$translations> Function(
              Iterable<
                  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name$translations<
                      Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name$translations>>)
          _fn);
}

class _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name
      _instance;

  final TRes Function(
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name$translations> Function(
                  Iterable<
                      CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name$translations<
                          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name(
      this._res);

  TRes _res;

  call({
    List<Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name$translations {
  Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name$translations(
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
            is Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name$translations) ||
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

extension UtilityExtension$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name$translations
    on Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name$translations {
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name$translations<
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name$translations>
      get copyWith =>
          CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name$translations<
    TRes> {
  factory CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name$translations(
    Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name$translations
        instance,
    TRes Function(
            Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name$translations)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name$translations;

  factory CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name$translations<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name$translations<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name$translations(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name$translations
      _instance;

  final TRes Function(
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name$translations(
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

class _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name$translations<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name$translations<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description {
  Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description({
    required this.translations,
    required this.$__typename,
  });

  factory Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description$translations>
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
            is Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description) ||
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

extension UtilityExtension$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description
    on Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description {
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description<
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description>
      get copyWith =>
          CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description<
    TRes> {
  factory CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description(
    Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description
        instance,
    TRes Function(
            Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description;

  factory CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description;

  TRes call({
    List<Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description$translations> Function(
              Iterable<
                  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description$translations<
                      Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description$translations>>)
          _fn);
}

class _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description
      _instance;

  final TRes Function(
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description$translations> Function(
                  Iterable<
                      CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description$translations<
                          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description(
      this._res);

  TRes _res;

  call({
    List<Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description$translations {
  Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description$translations(
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
            is Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description$translations) ||
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

extension UtilityExtension$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description$translations
    on Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description$translations {
  CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description$translations<
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description$translations>
      get copyWith =>
          CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description$translations<
    TRes> {
  factory CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description$translations(
    Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description$translations
        instance,
    TRes Function(
            Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description$translations)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description$translations;

  factory CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description$translations<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description$translations<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description$translations(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description$translations
      _instance;

  final TRes Function(
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description$translations(
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

class _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description$translations<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description$translations<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_customer_by_pk$cart$items$restaurant_item$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
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
    this.delete_restaurant_cart_item,
    required this.$__typename,
  });

  factory Mutation$clearCart.fromJson(Map<String, dynamic> json) {
    final l$delete_restaurant_cart_item = json['delete_restaurant_cart_item'];
    final l$$__typename = json['__typename'];
    return Mutation$clearCart(
      delete_restaurant_cart_item: l$delete_restaurant_cart_item == null
          ? null
          : Mutation$clearCart$delete_restaurant_cart_item.fromJson(
              (l$delete_restaurant_cart_item as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$clearCart$delete_restaurant_cart_item?
      delete_restaurant_cart_item;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delete_restaurant_cart_item = delete_restaurant_cart_item;
    _resultData['delete_restaurant_cart_item'] =
        l$delete_restaurant_cart_item?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delete_restaurant_cart_item = delete_restaurant_cart_item;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$delete_restaurant_cart_item,
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
    final l$delete_restaurant_cart_item = delete_restaurant_cart_item;
    final lOther$delete_restaurant_cart_item =
        other.delete_restaurant_cart_item;
    if (l$delete_restaurant_cart_item != lOther$delete_restaurant_cart_item) {
      return false;
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
    Mutation$clearCart$delete_restaurant_cart_item? delete_restaurant_cart_item,
    String? $__typename,
  });
  CopyWith$Mutation$clearCart$delete_restaurant_cart_item<TRes>
      get delete_restaurant_cart_item;
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
    Object? delete_restaurant_cart_item = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$clearCart(
        delete_restaurant_cart_item: delete_restaurant_cart_item == _undefined
            ? _instance.delete_restaurant_cart_item
            : (delete_restaurant_cart_item
                as Mutation$clearCart$delete_restaurant_cart_item?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$clearCart$delete_restaurant_cart_item<TRes>
      get delete_restaurant_cart_item {
    final local$delete_restaurant_cart_item =
        _instance.delete_restaurant_cart_item;
    return local$delete_restaurant_cart_item == null
        ? CopyWith$Mutation$clearCart$delete_restaurant_cart_item.stub(
            _then(_instance))
        : CopyWith$Mutation$clearCart$delete_restaurant_cart_item(
            local$delete_restaurant_cart_item,
            (e) => call(delete_restaurant_cart_item: e));
  }
}

class _CopyWithStubImpl$Mutation$clearCart<TRes>
    implements CopyWith$Mutation$clearCart<TRes> {
  _CopyWithStubImpl$Mutation$clearCart(this._res);

  TRes _res;

  call({
    Mutation$clearCart$delete_restaurant_cart_item? delete_restaurant_cart_item,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$clearCart$delete_restaurant_cart_item<TRes>
      get delete_restaurant_cart_item =>
          CopyWith$Mutation$clearCart$delete_restaurant_cart_item.stub(_res);
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
        name: NameNode(value: 'delete_restaurant_cart_item'),
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

class Mutation$clearCart$delete_restaurant_cart_item {
  Mutation$clearCart$delete_restaurant_cart_item({
    required this.affected_rows,
    required this.$__typename,
  });

  factory Mutation$clearCart$delete_restaurant_cart_item.fromJson(
      Map<String, dynamic> json) {
    final l$affected_rows = json['affected_rows'];
    final l$$__typename = json['__typename'];
    return Mutation$clearCart$delete_restaurant_cart_item(
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
    if (!(other is Mutation$clearCart$delete_restaurant_cart_item) ||
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

extension UtilityExtension$Mutation$clearCart$delete_restaurant_cart_item
    on Mutation$clearCart$delete_restaurant_cart_item {
  CopyWith$Mutation$clearCart$delete_restaurant_cart_item<
          Mutation$clearCart$delete_restaurant_cart_item>
      get copyWith => CopyWith$Mutation$clearCart$delete_restaurant_cart_item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$clearCart$delete_restaurant_cart_item<TRes> {
  factory CopyWith$Mutation$clearCart$delete_restaurant_cart_item(
    Mutation$clearCart$delete_restaurant_cart_item instance,
    TRes Function(Mutation$clearCart$delete_restaurant_cart_item) then,
  ) = _CopyWithImpl$Mutation$clearCart$delete_restaurant_cart_item;

  factory CopyWith$Mutation$clearCart$delete_restaurant_cart_item.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$clearCart$delete_restaurant_cart_item;

  TRes call({
    int? affected_rows,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$clearCart$delete_restaurant_cart_item<TRes>
    implements CopyWith$Mutation$clearCart$delete_restaurant_cart_item<TRes> {
  _CopyWithImpl$Mutation$clearCart$delete_restaurant_cart_item(
    this._instance,
    this._then,
  );

  final Mutation$clearCart$delete_restaurant_cart_item _instance;

  final TRes Function(Mutation$clearCart$delete_restaurant_cart_item) _then;

  static const _undefined = {};

  TRes call({
    Object? affected_rows = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$clearCart$delete_restaurant_cart_item(
        affected_rows: affected_rows == _undefined || affected_rows == null
            ? _instance.affected_rows
            : (affected_rows as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$clearCart$delete_restaurant_cart_item<TRes>
    implements CopyWith$Mutation$clearCart$delete_restaurant_cart_item<TRes> {
  _CopyWithStubImpl$Mutation$clearCart$delete_restaurant_cart_item(this._res);

  TRes _res;

  call({
    int? affected_rows,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$updateRestaurantCartItem {
  factory Variables$Mutation$updateRestaurantCartItem({
    required int itemId,
    Input$restaurant_cart_item_set_input? itemData,
  }) =>
      Variables$Mutation$updateRestaurantCartItem._({
        r'itemId': itemId,
        if (itemData != null) r'itemData': itemData,
      });

  Variables$Mutation$updateRestaurantCartItem._(this._$data);

  factory Variables$Mutation$updateRestaurantCartItem.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$itemId = data['itemId'];
    result$data['itemId'] = (l$itemId as int);
    if (data.containsKey('itemData')) {
      final l$itemData = data['itemData'];
      result$data['itemData'] = l$itemData == null
          ? null
          : Input$restaurant_cart_item_set_input.fromJson(
              (l$itemData as Map<String, dynamic>));
    }
    return Variables$Mutation$updateRestaurantCartItem._(result$data);
  }

  Map<String, dynamic> _$data;

  int get itemId => (_$data['itemId'] as int);
  Input$restaurant_cart_item_set_input? get itemData =>
      (_$data['itemData'] as Input$restaurant_cart_item_set_input?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$itemId = itemId;
    result$data['itemId'] = l$itemId;
    if (_$data.containsKey('itemData')) {
      final l$itemData = itemData;
      result$data['itemData'] = l$itemData?.toJson();
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$updateRestaurantCartItem<
          Variables$Mutation$updateRestaurantCartItem>
      get copyWith => CopyWith$Variables$Mutation$updateRestaurantCartItem(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$updateRestaurantCartItem) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$itemId = itemId;
    final lOther$itemId = other.itemId;
    if (l$itemId != lOther$itemId) {
      return false;
    }
    final l$itemData = itemData;
    final lOther$itemData = other.itemData;
    if (_$data.containsKey('itemData') !=
        other._$data.containsKey('itemData')) {
      return false;
    }
    if (l$itemData != lOther$itemData) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$itemId = itemId;
    final l$itemData = itemData;
    return Object.hashAll([
      l$itemId,
      _$data.containsKey('itemData') ? l$itemData : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$updateRestaurantCartItem<TRes> {
  factory CopyWith$Variables$Mutation$updateRestaurantCartItem(
    Variables$Mutation$updateRestaurantCartItem instance,
    TRes Function(Variables$Mutation$updateRestaurantCartItem) then,
  ) = _CopyWithImpl$Variables$Mutation$updateRestaurantCartItem;

  factory CopyWith$Variables$Mutation$updateRestaurantCartItem.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$updateRestaurantCartItem;

  TRes call({
    int? itemId,
    Input$restaurant_cart_item_set_input? itemData,
  });
}

class _CopyWithImpl$Variables$Mutation$updateRestaurantCartItem<TRes>
    implements CopyWith$Variables$Mutation$updateRestaurantCartItem<TRes> {
  _CopyWithImpl$Variables$Mutation$updateRestaurantCartItem(
    this._instance,
    this._then,
  );

  final Variables$Mutation$updateRestaurantCartItem _instance;

  final TRes Function(Variables$Mutation$updateRestaurantCartItem) _then;

  static const _undefined = {};

  TRes call({
    Object? itemId = _undefined,
    Object? itemData = _undefined,
  }) =>
      _then(Variables$Mutation$updateRestaurantCartItem._({
        ..._instance._$data,
        if (itemId != _undefined && itemId != null) 'itemId': (itemId as int),
        if (itemData != _undefined)
          'itemData': (itemData as Input$restaurant_cart_item_set_input?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$updateRestaurantCartItem<TRes>
    implements CopyWith$Variables$Mutation$updateRestaurantCartItem<TRes> {
  _CopyWithStubImpl$Variables$Mutation$updateRestaurantCartItem(this._res);

  TRes _res;

  call({
    int? itemId,
    Input$restaurant_cart_item_set_input? itemData,
  }) =>
      _res;
}

class Mutation$updateRestaurantCartItem {
  Mutation$updateRestaurantCartItem({
    this.update_restaurant_cart_item_by_pk,
    required this.$__typename,
  });

  factory Mutation$updateRestaurantCartItem.fromJson(
      Map<String, dynamic> json) {
    final l$update_restaurant_cart_item_by_pk =
        json['update_restaurant_cart_item_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$updateRestaurantCartItem(
      update_restaurant_cart_item_by_pk: l$update_restaurant_cart_item_by_pk ==
              null
          ? null
          : Mutation$updateRestaurantCartItem$update_restaurant_cart_item_by_pk
              .fromJson((l$update_restaurant_cart_item_by_pk
                  as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$updateRestaurantCartItem$update_restaurant_cart_item_by_pk?
      update_restaurant_cart_item_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_restaurant_cart_item_by_pk =
        update_restaurant_cart_item_by_pk;
    _resultData['update_restaurant_cart_item_by_pk'] =
        l$update_restaurant_cart_item_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_restaurant_cart_item_by_pk =
        update_restaurant_cart_item_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_restaurant_cart_item_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$updateRestaurantCartItem) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_restaurant_cart_item_by_pk =
        update_restaurant_cart_item_by_pk;
    final lOther$update_restaurant_cart_item_by_pk =
        other.update_restaurant_cart_item_by_pk;
    if (l$update_restaurant_cart_item_by_pk !=
        lOther$update_restaurant_cart_item_by_pk) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$updateRestaurantCartItem
    on Mutation$updateRestaurantCartItem {
  CopyWith$Mutation$updateRestaurantCartItem<Mutation$updateRestaurantCartItem>
      get copyWith => CopyWith$Mutation$updateRestaurantCartItem(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateRestaurantCartItem<TRes> {
  factory CopyWith$Mutation$updateRestaurantCartItem(
    Mutation$updateRestaurantCartItem instance,
    TRes Function(Mutation$updateRestaurantCartItem) then,
  ) = _CopyWithImpl$Mutation$updateRestaurantCartItem;

  factory CopyWith$Mutation$updateRestaurantCartItem.stub(TRes res) =
      _CopyWithStubImpl$Mutation$updateRestaurantCartItem;

  TRes call({
    Mutation$updateRestaurantCartItem$update_restaurant_cart_item_by_pk?
        update_restaurant_cart_item_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$updateRestaurantCartItem$update_restaurant_cart_item_by_pk<
      TRes> get update_restaurant_cart_item_by_pk;
}

class _CopyWithImpl$Mutation$updateRestaurantCartItem<TRes>
    implements CopyWith$Mutation$updateRestaurantCartItem<TRes> {
  _CopyWithImpl$Mutation$updateRestaurantCartItem(
    this._instance,
    this._then,
  );

  final Mutation$updateRestaurantCartItem _instance;

  final TRes Function(Mutation$updateRestaurantCartItem) _then;

  static const _undefined = {};

  TRes call({
    Object? update_restaurant_cart_item_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateRestaurantCartItem(
        update_restaurant_cart_item_by_pk: update_restaurant_cart_item_by_pk ==
                _undefined
            ? _instance.update_restaurant_cart_item_by_pk
            : (update_restaurant_cart_item_by_pk
                as Mutation$updateRestaurantCartItem$update_restaurant_cart_item_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$updateRestaurantCartItem$update_restaurant_cart_item_by_pk<
      TRes> get update_restaurant_cart_item_by_pk {
    final local$update_restaurant_cart_item_by_pk =
        _instance.update_restaurant_cart_item_by_pk;
    return local$update_restaurant_cart_item_by_pk == null
        ? CopyWith$Mutation$updateRestaurantCartItem$update_restaurant_cart_item_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$updateRestaurantCartItem$update_restaurant_cart_item_by_pk(
            local$update_restaurant_cart_item_by_pk,
            (e) => call(update_restaurant_cart_item_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$updateRestaurantCartItem<TRes>
    implements CopyWith$Mutation$updateRestaurantCartItem<TRes> {
  _CopyWithStubImpl$Mutation$updateRestaurantCartItem(this._res);

  TRes _res;

  call({
    Mutation$updateRestaurantCartItem$update_restaurant_cart_item_by_pk?
        update_restaurant_cart_item_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$updateRestaurantCartItem$update_restaurant_cart_item_by_pk<
          TRes>
      get update_restaurant_cart_item_by_pk =>
          CopyWith$Mutation$updateRestaurantCartItem$update_restaurant_cart_item_by_pk
              .stub(_res);
}

const documentNodeMutationupdateRestaurantCartItem = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'updateRestaurantCartItem'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'itemId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'itemData')),
        type: NamedTypeNode(
          name: NameNode(value: 'restaurant_cart_item_set_input'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'update_restaurant_cart_item_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'pk_columns'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'itemId')),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: '_set'),
            value: VariableNode(name: NameNode(value: 'itemData')),
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
Mutation$updateRestaurantCartItem _parserFn$Mutation$updateRestaurantCartItem(
        Map<String, dynamic> data) =>
    Mutation$updateRestaurantCartItem.fromJson(data);
typedef OnMutationCompleted$Mutation$updateRestaurantCartItem = FutureOr<void>
    Function(
  dynamic,
  Mutation$updateRestaurantCartItem?,
);

class Options$Mutation$updateRestaurantCartItem
    extends graphql.MutationOptions<Mutation$updateRestaurantCartItem> {
  Options$Mutation$updateRestaurantCartItem({
    String? operationName,
    required Variables$Mutation$updateRestaurantCartItem variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$updateRestaurantCartItem? onCompleted,
    graphql.OnMutationUpdate<Mutation$updateRestaurantCartItem>? update,
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
                        : _parserFn$Mutation$updateRestaurantCartItem(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdateRestaurantCartItem,
          parserFn: _parserFn$Mutation$updateRestaurantCartItem,
        );

  final OnMutationCompleted$Mutation$updateRestaurantCartItem?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$updateRestaurantCartItem
    extends graphql.WatchQueryOptions<Mutation$updateRestaurantCartItem> {
  WatchOptions$Mutation$updateRestaurantCartItem({
    String? operationName,
    required Variables$Mutation$updateRestaurantCartItem variables,
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
          document: documentNodeMutationupdateRestaurantCartItem,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$updateRestaurantCartItem,
        );
}

extension ClientExtension$Mutation$updateRestaurantCartItem
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$updateRestaurantCartItem>>
      mutate$updateRestaurantCartItem(
              Options$Mutation$updateRestaurantCartItem options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$updateRestaurantCartItem>
      watchMutation$updateRestaurantCartItem(
              WatchOptions$Mutation$updateRestaurantCartItem options) =>
          this.watchMutation(options);
}

class Mutation$updateRestaurantCartItem$update_restaurant_cart_item_by_pk {
  Mutation$updateRestaurantCartItem$update_restaurant_cart_item_by_pk({
    required this.id,
    required this.$__typename,
  });

  factory Mutation$updateRestaurantCartItem$update_restaurant_cart_item_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$updateRestaurantCartItem$update_restaurant_cart_item_by_pk(
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
            is Mutation$updateRestaurantCartItem$update_restaurant_cart_item_by_pk) ||
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

extension UtilityExtension$Mutation$updateRestaurantCartItem$update_restaurant_cart_item_by_pk
    on Mutation$updateRestaurantCartItem$update_restaurant_cart_item_by_pk {
  CopyWith$Mutation$updateRestaurantCartItem$update_restaurant_cart_item_by_pk<
          Mutation$updateRestaurantCartItem$update_restaurant_cart_item_by_pk>
      get copyWith =>
          CopyWith$Mutation$updateRestaurantCartItem$update_restaurant_cart_item_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateRestaurantCartItem$update_restaurant_cart_item_by_pk<
    TRes> {
  factory CopyWith$Mutation$updateRestaurantCartItem$update_restaurant_cart_item_by_pk(
    Mutation$updateRestaurantCartItem$update_restaurant_cart_item_by_pk
        instance,
    TRes Function(
            Mutation$updateRestaurantCartItem$update_restaurant_cart_item_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$updateRestaurantCartItem$update_restaurant_cart_item_by_pk;

  factory CopyWith$Mutation$updateRestaurantCartItem$update_restaurant_cart_item_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateRestaurantCartItem$update_restaurant_cart_item_by_pk;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$updateRestaurantCartItem$update_restaurant_cart_item_by_pk<
        TRes>
    implements
        CopyWith$Mutation$updateRestaurantCartItem$update_restaurant_cart_item_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$updateRestaurantCartItem$update_restaurant_cart_item_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$updateRestaurantCartItem$update_restaurant_cart_item_by_pk
      _instance;

  final TRes Function(
          Mutation$updateRestaurantCartItem$update_restaurant_cart_item_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateRestaurantCartItem$update_restaurant_cart_item_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$updateRestaurantCartItem$update_restaurant_cart_item_by_pk<
        TRes>
    implements
        CopyWith$Mutation$updateRestaurantCartItem$update_restaurant_cart_item_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$updateRestaurantCartItem$update_restaurant_cart_item_by_pk(
      this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}
