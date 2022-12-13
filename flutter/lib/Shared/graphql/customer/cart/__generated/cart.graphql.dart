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
    required this.$__typename,
  });

  factory Mutation$addItemToCart$insert_restaurant_cart_item_one.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$addItemToCart$insert_restaurant_cart_item_one(
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
    if (!(other is Mutation$addItemToCart$insert_restaurant_cart_item_one) ||
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
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$addItemToCart$insert_restaurant_cart_item_one(
        id: id == _undefined || id == null ? _instance.id : (id as int),
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
    this.customer_by_pk,
    required this.$__typename,
  });

  factory Query$getCustomerCart.fromJson(Map<String, dynamic> json) {
    final l$customer_by_pk = json['customer_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerCart(
      customer_by_pk: l$customer_by_pk == null
          ? null
          : Query$getCustomerCart$customer_by_pk.fromJson(
              (l$customer_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getCustomerCart$customer_by_pk? customer_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$customer_by_pk = customer_by_pk;
    _resultData['customer_by_pk'] = l$customer_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$customer_by_pk = customer_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$customer_by_pk,
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
    final l$customer_by_pk = customer_by_pk;
    final lOther$customer_by_pk = other.customer_by_pk;
    if (l$customer_by_pk != lOther$customer_by_pk) {
      return false;
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
    Query$getCustomerCart$customer_by_pk? customer_by_pk,
    String? $__typename,
  });
  CopyWith$Query$getCustomerCart$customer_by_pk<TRes> get customer_by_pk;
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
    Object? customer_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getCustomerCart(
        customer_by_pk: customer_by_pk == _undefined
            ? _instance.customer_by_pk
            : (customer_by_pk as Query$getCustomerCart$customer_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getCustomerCart$customer_by_pk<TRes> get customer_by_pk {
    final local$customer_by_pk = _instance.customer_by_pk;
    return local$customer_by_pk == null
        ? CopyWith$Query$getCustomerCart$customer_by_pk.stub(_then(_instance))
        : CopyWith$Query$getCustomerCart$customer_by_pk(
            local$customer_by_pk, (e) => call(customer_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$getCustomerCart<TRes>
    implements CopyWith$Query$getCustomerCart<TRes> {
  _CopyWithStubImpl$Query$getCustomerCart(this._res);

  TRes _res;

  call({
    Query$getCustomerCart$customer_by_pk? customer_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getCustomerCart$customer_by_pk<TRes> get customer_by_pk =>
      CopyWith$Query$getCustomerCart$customer_by_pk.stub(_res);
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
        name: NameNode(value: 'customer_by_pk'),
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

class Query$getCustomerCart$customer_by_pk {
  Query$getCustomerCart$customer_by_pk({
    this.cart,
    required this.$__typename,
  });

  factory Query$getCustomerCart$customer_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$cart = json['cart'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerCart$customer_by_pk(
      cart: l$cart == null
          ? null
          : Query$getCustomerCart$customer_by_pk$cart.fromJson(
              (l$cart as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getCustomerCart$customer_by_pk$cart? cart;

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
    if (!(other is Query$getCustomerCart$customer_by_pk) ||
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

extension UtilityExtension$Query$getCustomerCart$customer_by_pk
    on Query$getCustomerCart$customer_by_pk {
  CopyWith$Query$getCustomerCart$customer_by_pk<
          Query$getCustomerCart$customer_by_pk>
      get copyWith => CopyWith$Query$getCustomerCart$customer_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerCart$customer_by_pk<TRes> {
  factory CopyWith$Query$getCustomerCart$customer_by_pk(
    Query$getCustomerCart$customer_by_pk instance,
    TRes Function(Query$getCustomerCart$customer_by_pk) then,
  ) = _CopyWithImpl$Query$getCustomerCart$customer_by_pk;

  factory CopyWith$Query$getCustomerCart$customer_by_pk.stub(TRes res) =
      _CopyWithStubImpl$Query$getCustomerCart$customer_by_pk;

  TRes call({
    Query$getCustomerCart$customer_by_pk$cart? cart,
    String? $__typename,
  });
  CopyWith$Query$getCustomerCart$customer_by_pk$cart<TRes> get cart;
}

class _CopyWithImpl$Query$getCustomerCart$customer_by_pk<TRes>
    implements CopyWith$Query$getCustomerCart$customer_by_pk<TRes> {
  _CopyWithImpl$Query$getCustomerCart$customer_by_pk(
    this._instance,
    this._then,
  );

  final Query$getCustomerCart$customer_by_pk _instance;

  final TRes Function(Query$getCustomerCart$customer_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? cart = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getCustomerCart$customer_by_pk(
        cart: cart == _undefined
            ? _instance.cart
            : (cart as Query$getCustomerCart$customer_by_pk$cart?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getCustomerCart$customer_by_pk$cart<TRes> get cart {
    final local$cart = _instance.cart;
    return local$cart == null
        ? CopyWith$Query$getCustomerCart$customer_by_pk$cart.stub(
            _then(_instance))
        : CopyWith$Query$getCustomerCart$customer_by_pk$cart(
            local$cart, (e) => call(cart: e));
  }
}

class _CopyWithStubImpl$Query$getCustomerCart$customer_by_pk<TRes>
    implements CopyWith$Query$getCustomerCart$customer_by_pk<TRes> {
  _CopyWithStubImpl$Query$getCustomerCart$customer_by_pk(this._res);

  TRes _res;

  call({
    Query$getCustomerCart$customer_by_pk$cart? cart,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getCustomerCart$customer_by_pk$cart<TRes> get cart =>
      CopyWith$Query$getCustomerCart$customer_by_pk$cart.stub(_res);
}

class Query$getCustomerCart$customer_by_pk$cart {
  Query$getCustomerCart$customer_by_pk$cart({
    this.restaurant,
    required this.items,
    required this.$__typename,
  });

  factory Query$getCustomerCart$customer_by_pk$cart.fromJson(
      Map<String, dynamic> json) {
    final l$restaurant = json['restaurant'];
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerCart$customer_by_pk$cart(
      restaurant: l$restaurant == null
          ? null
          : Query$getCustomerCart$customer_by_pk$cart$restaurant.fromJson(
              (l$restaurant as Map<String, dynamic>)),
      items: (l$items as List<dynamic>)
          .map((e) => Query$getCustomerCart$customer_by_pk$cart$items.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getCustomerCart$customer_by_pk$cart$restaurant? restaurant;

  final List<Query$getCustomerCart$customer_by_pk$cart$items> items;

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
    if (!(other is Query$getCustomerCart$customer_by_pk$cart) ||
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

extension UtilityExtension$Query$getCustomerCart$customer_by_pk$cart
    on Query$getCustomerCart$customer_by_pk$cart {
  CopyWith$Query$getCustomerCart$customer_by_pk$cart<
          Query$getCustomerCart$customer_by_pk$cart>
      get copyWith => CopyWith$Query$getCustomerCart$customer_by_pk$cart(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerCart$customer_by_pk$cart<TRes> {
  factory CopyWith$Query$getCustomerCart$customer_by_pk$cart(
    Query$getCustomerCart$customer_by_pk$cart instance,
    TRes Function(Query$getCustomerCart$customer_by_pk$cart) then,
  ) = _CopyWithImpl$Query$getCustomerCart$customer_by_pk$cart;

  factory CopyWith$Query$getCustomerCart$customer_by_pk$cart.stub(TRes res) =
      _CopyWithStubImpl$Query$getCustomerCart$customer_by_pk$cart;

  TRes call({
    Query$getCustomerCart$customer_by_pk$cart$restaurant? restaurant,
    List<Query$getCustomerCart$customer_by_pk$cart$items>? items,
    String? $__typename,
  });
  CopyWith$Query$getCustomerCart$customer_by_pk$cart$restaurant<TRes>
      get restaurant;
  TRes items(
      Iterable<Query$getCustomerCart$customer_by_pk$cart$items> Function(
              Iterable<
                  CopyWith$Query$getCustomerCart$customer_by_pk$cart$items<
                      Query$getCustomerCart$customer_by_pk$cart$items>>)
          _fn);
}

class _CopyWithImpl$Query$getCustomerCart$customer_by_pk$cart<TRes>
    implements CopyWith$Query$getCustomerCart$customer_by_pk$cart<TRes> {
  _CopyWithImpl$Query$getCustomerCart$customer_by_pk$cart(
    this._instance,
    this._then,
  );

  final Query$getCustomerCart$customer_by_pk$cart _instance;

  final TRes Function(Query$getCustomerCart$customer_by_pk$cart) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant = _undefined,
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getCustomerCart$customer_by_pk$cart(
        restaurant: restaurant == _undefined
            ? _instance.restaurant
            : (restaurant
                as Query$getCustomerCart$customer_by_pk$cart$restaurant?),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Query$getCustomerCart$customer_by_pk$cart$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getCustomerCart$customer_by_pk$cart$restaurant<TRes>
      get restaurant {
    final local$restaurant = _instance.restaurant;
    return local$restaurant == null
        ? CopyWith$Query$getCustomerCart$customer_by_pk$cart$restaurant.stub(
            _then(_instance))
        : CopyWith$Query$getCustomerCart$customer_by_pk$cart$restaurant(
            local$restaurant, (e) => call(restaurant: e));
  }

  TRes items(
          Iterable<Query$getCustomerCart$customer_by_pk$cart$items> Function(
                  Iterable<
                      CopyWith$Query$getCustomerCart$customer_by_pk$cart$items<
                          Query$getCustomerCart$customer_by_pk$cart$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map(
              (e) => CopyWith$Query$getCustomerCart$customer_by_pk$cart$items(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getCustomerCart$customer_by_pk$cart<TRes>
    implements CopyWith$Query$getCustomerCart$customer_by_pk$cart<TRes> {
  _CopyWithStubImpl$Query$getCustomerCart$customer_by_pk$cart(this._res);

  TRes _res;

  call({
    Query$getCustomerCart$customer_by_pk$cart$restaurant? restaurant,
    List<Query$getCustomerCart$customer_by_pk$cart$items>? items,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getCustomerCart$customer_by_pk$cart$restaurant<TRes>
      get restaurant =>
          CopyWith$Query$getCustomerCart$customer_by_pk$cart$restaurant.stub(
              _res);
  items(_fn) => _res;
}

class Query$getCustomerCart$customer_by_pk$cart$restaurant {
  Query$getCustomerCart$customer_by_pk$cart$restaurant({
    required this.id,
    this.firebase_id,
    required this.image,
    required this.language_id,
    this.description_id,
    required this.location_gps,
    required this.location_text,
    required this.name,
    this.schedule,
    this.description,
    required this.approved,
    required this.open_status,
    required this.$__typename,
  });

  factory Query$getCustomerCart$customer_by_pk$cart$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$firebase_id = json['firebase_id'];
    final l$image = json['image'];
    final l$language_id = json['language_id'];
    final l$description_id = json['description_id'];
    final l$location_gps = json['location_gps'];
    final l$location_text = json['location_text'];
    final l$name = json['name'];
    final l$schedule = json['schedule'];
    final l$description = json['description'];
    final l$approved = json['approved'];
    final l$open_status = json['open_status'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerCart$customer_by_pk$cart$restaurant(
      id: (l$id as int),
      firebase_id: (l$firebase_id as String?),
      image: (l$image as String),
      language_id: (l$language_id as String),
      description_id: (l$description_id as int?),
      location_gps: geographyFromJson(l$location_gps),
      location_text: (l$location_text as String),
      name: (l$name as String),
      schedule: l$schedule == null ? null : mapFromJson(l$schedule),
      description: l$description == null
          ? null
          : Query$getCustomerCart$customer_by_pk$cart$restaurant$description
              .fromJson((l$description as Map<String, dynamic>)),
      approved: (l$approved as bool),
      open_status: (l$open_status as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? firebase_id;

  final String image;

  final String language_id;

  final int? description_id;

  final Geography location_gps;

  final String location_text;

  final String name;

  final dynamic? schedule;

  final Query$getCustomerCart$customer_by_pk$cart$restaurant$description?
      description;

  final bool approved;

  final String open_status;

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
    final l$description_id = description_id;
    _resultData['description_id'] = l$description_id;
    final l$location_gps = location_gps;
    _resultData['location_gps'] = geographyToJson(l$location_gps);
    final l$location_text = location_text;
    _resultData['location_text'] = l$location_text;
    final l$name = name;
    _resultData['name'] = l$name;
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
    final l$firebase_id = firebase_id;
    final l$image = image;
    final l$language_id = language_id;
    final l$description_id = description_id;
    final l$location_gps = location_gps;
    final l$location_text = location_text;
    final l$name = name;
    final l$schedule = schedule;
    final l$description = description;
    final l$approved = approved;
    final l$open_status = open_status;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$firebase_id,
      l$image,
      l$language_id,
      l$description_id,
      l$location_gps,
      l$location_text,
      l$name,
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
    if (!(other is Query$getCustomerCart$customer_by_pk$cart$restaurant) ||
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
    final l$description_id = description_id;
    final lOther$description_id = other.description_id;
    if (l$description_id != lOther$description_id) {
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

extension UtilityExtension$Query$getCustomerCart$customer_by_pk$cart$restaurant
    on Query$getCustomerCart$customer_by_pk$cart$restaurant {
  CopyWith$Query$getCustomerCart$customer_by_pk$cart$restaurant<
          Query$getCustomerCart$customer_by_pk$cart$restaurant>
      get copyWith =>
          CopyWith$Query$getCustomerCart$customer_by_pk$cart$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerCart$customer_by_pk$cart$restaurant<
    TRes> {
  factory CopyWith$Query$getCustomerCart$customer_by_pk$cart$restaurant(
    Query$getCustomerCart$customer_by_pk$cart$restaurant instance,
    TRes Function(Query$getCustomerCart$customer_by_pk$cart$restaurant) then,
  ) = _CopyWithImpl$Query$getCustomerCart$customer_by_pk$cart$restaurant;

  factory CopyWith$Query$getCustomerCart$customer_by_pk$cart$restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCustomerCart$customer_by_pk$cart$restaurant;

  TRes call({
    int? id,
    String? firebase_id,
    String? image,
    String? language_id,
    int? description_id,
    Geography? location_gps,
    String? location_text,
    String? name,
    dynamic? schedule,
    Query$getCustomerCart$customer_by_pk$cart$restaurant$description?
        description,
    bool? approved,
    String? open_status,
    String? $__typename,
  });
  CopyWith$Query$getCustomerCart$customer_by_pk$cart$restaurant$description<
      TRes> get description;
}

class _CopyWithImpl$Query$getCustomerCart$customer_by_pk$cart$restaurant<TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_by_pk$cart$restaurant<TRes> {
  _CopyWithImpl$Query$getCustomerCart$customer_by_pk$cart$restaurant(
    this._instance,
    this._then,
  );

  final Query$getCustomerCart$customer_by_pk$cart$restaurant _instance;

  final TRes Function(Query$getCustomerCart$customer_by_pk$cart$restaurant)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? firebase_id = _undefined,
    Object? image = _undefined,
    Object? language_id = _undefined,
    Object? description_id = _undefined,
    Object? location_gps = _undefined,
    Object? location_text = _undefined,
    Object? name = _undefined,
    Object? schedule = _undefined,
    Object? description = _undefined,
    Object? approved = _undefined,
    Object? open_status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getCustomerCart$customer_by_pk$cart$restaurant(
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
        description_id: description_id == _undefined
            ? _instance.description_id
            : (description_id as int?),
        location_gps: location_gps == _undefined || location_gps == null
            ? _instance.location_gps
            : (location_gps as Geography),
        location_text: location_text == _undefined || location_text == null
            ? _instance.location_text
            : (location_text as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        schedule: schedule == _undefined
            ? _instance.schedule
            : (schedule as dynamic?),
        description: description == _undefined
            ? _instance.description
            : (description
                as Query$getCustomerCart$customer_by_pk$cart$restaurant$description?),
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
  CopyWith$Query$getCustomerCart$customer_by_pk$cart$restaurant$description<
      TRes> get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Query$getCustomerCart$customer_by_pk$cart$restaurant$description
            .stub(_then(_instance))
        : CopyWith$Query$getCustomerCart$customer_by_pk$cart$restaurant$description(
            local$description, (e) => call(description: e));
  }
}

class _CopyWithStubImpl$Query$getCustomerCart$customer_by_pk$cart$restaurant<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_by_pk$cart$restaurant<TRes> {
  _CopyWithStubImpl$Query$getCustomerCart$customer_by_pk$cart$restaurant(
      this._res);

  TRes _res;

  call({
    int? id,
    String? firebase_id,
    String? image,
    String? language_id,
    int? description_id,
    Geography? location_gps,
    String? location_text,
    String? name,
    dynamic? schedule,
    Query$getCustomerCart$customer_by_pk$cart$restaurant$description?
        description,
    bool? approved,
    String? open_status,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getCustomerCart$customer_by_pk$cart$restaurant$description<
          TRes>
      get description =>
          CopyWith$Query$getCustomerCart$customer_by_pk$cart$restaurant$description
              .stub(_res);
}

class Query$getCustomerCart$customer_by_pk$cart$restaurant$description {
  Query$getCustomerCart$customer_by_pk$cart$restaurant$description({
    required this.translations,
    required this.$__typename,
  });

  factory Query$getCustomerCart$customer_by_pk$cart$restaurant$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerCart$customer_by_pk$cart$restaurant$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getCustomerCart$customer_by_pk$cart$restaurant$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$getCustomerCart$customer_by_pk$cart$restaurant$description$translations>
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
            is Query$getCustomerCart$customer_by_pk$cart$restaurant$description) ||
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

extension UtilityExtension$Query$getCustomerCart$customer_by_pk$cart$restaurant$description
    on Query$getCustomerCart$customer_by_pk$cart$restaurant$description {
  CopyWith$Query$getCustomerCart$customer_by_pk$cart$restaurant$description<
          Query$getCustomerCart$customer_by_pk$cart$restaurant$description>
      get copyWith =>
          CopyWith$Query$getCustomerCart$customer_by_pk$cart$restaurant$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerCart$customer_by_pk$cart$restaurant$description<
    TRes> {
  factory CopyWith$Query$getCustomerCart$customer_by_pk$cart$restaurant$description(
    Query$getCustomerCart$customer_by_pk$cart$restaurant$description instance,
    TRes Function(
            Query$getCustomerCart$customer_by_pk$cart$restaurant$description)
        then,
  ) = _CopyWithImpl$Query$getCustomerCart$customer_by_pk$cart$restaurant$description;

  factory CopyWith$Query$getCustomerCart$customer_by_pk$cart$restaurant$description.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCustomerCart$customer_by_pk$cart$restaurant$description;

  TRes call({
    List<Query$getCustomerCart$customer_by_pk$cart$restaurant$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getCustomerCart$customer_by_pk$cart$restaurant$description$translations> Function(
              Iterable<
                  CopyWith$Query$getCustomerCart$customer_by_pk$cart$restaurant$description$translations<
                      Query$getCustomerCart$customer_by_pk$cart$restaurant$description$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getCustomerCart$customer_by_pk$cart$restaurant$description<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_by_pk$cart$restaurant$description<
            TRes> {
  _CopyWithImpl$Query$getCustomerCart$customer_by_pk$cart$restaurant$description(
    this._instance,
    this._then,
  );

  final Query$getCustomerCart$customer_by_pk$cart$restaurant$description
      _instance;

  final TRes Function(
      Query$getCustomerCart$customer_by_pk$cart$restaurant$description) _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getCustomerCart$customer_by_pk$cart$restaurant$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getCustomerCart$customer_by_pk$cart$restaurant$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getCustomerCart$customer_by_pk$cart$restaurant$description$translations> Function(
                  Iterable<
                      CopyWith$Query$getCustomerCart$customer_by_pk$cart$restaurant$description$translations<
                          Query$getCustomerCart$customer_by_pk$cart$restaurant$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getCustomerCart$customer_by_pk$cart$restaurant$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getCustomerCart$customer_by_pk$cart$restaurant$description<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_by_pk$cart$restaurant$description<
            TRes> {
  _CopyWithStubImpl$Query$getCustomerCart$customer_by_pk$cart$restaurant$description(
      this._res);

  TRes _res;

  call({
    List<Query$getCustomerCart$customer_by_pk$cart$restaurant$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getCustomerCart$customer_by_pk$cart$restaurant$description$translations {
  Query$getCustomerCart$customer_by_pk$cart$restaurant$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getCustomerCart$customer_by_pk$cart$restaurant$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerCart$customer_by_pk$cart$restaurant$description$translations(
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
            is Query$getCustomerCart$customer_by_pk$cart$restaurant$description$translations) ||
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

extension UtilityExtension$Query$getCustomerCart$customer_by_pk$cart$restaurant$description$translations
    on Query$getCustomerCart$customer_by_pk$cart$restaurant$description$translations {
  CopyWith$Query$getCustomerCart$customer_by_pk$cart$restaurant$description$translations<
          Query$getCustomerCart$customer_by_pk$cart$restaurant$description$translations>
      get copyWith =>
          CopyWith$Query$getCustomerCart$customer_by_pk$cart$restaurant$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerCart$customer_by_pk$cart$restaurant$description$translations<
    TRes> {
  factory CopyWith$Query$getCustomerCart$customer_by_pk$cart$restaurant$description$translations(
    Query$getCustomerCart$customer_by_pk$cart$restaurant$description$translations
        instance,
    TRes Function(
            Query$getCustomerCart$customer_by_pk$cart$restaurant$description$translations)
        then,
  ) = _CopyWithImpl$Query$getCustomerCart$customer_by_pk$cart$restaurant$description$translations;

  factory CopyWith$Query$getCustomerCart$customer_by_pk$cart$restaurant$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCustomerCart$customer_by_pk$cart$restaurant$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getCustomerCart$customer_by_pk$cart$restaurant$description$translations<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_by_pk$cart$restaurant$description$translations<
            TRes> {
  _CopyWithImpl$Query$getCustomerCart$customer_by_pk$cart$restaurant$description$translations(
    this._instance,
    this._then,
  );

  final Query$getCustomerCart$customer_by_pk$cart$restaurant$description$translations
      _instance;

  final TRes Function(
          Query$getCustomerCart$customer_by_pk$cart$restaurant$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getCustomerCart$customer_by_pk$cart$restaurant$description$translations(
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

class _CopyWithStubImpl$Query$getCustomerCart$customer_by_pk$cart$restaurant$description$translations<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_by_pk$cart$restaurant$description$translations<
            TRes> {
  _CopyWithStubImpl$Query$getCustomerCart$customer_by_pk$cart$restaurant$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$getCustomerCart$customer_by_pk$cart$items {
  Query$getCustomerCart$customer_by_pk$cart$items({
    required this.restaurant_item,
    required this.cost_per_one,
    required this.id,
    this.note,
    required this.quantity,
    required this.$__typename,
  });

  factory Query$getCustomerCart$customer_by_pk$cart$items.fromJson(
      Map<String, dynamic> json) {
    final l$restaurant_item = json['restaurant_item'];
    final l$cost_per_one = json['cost_per_one'];
    final l$id = json['id'];
    final l$note = json['note'];
    final l$quantity = json['quantity'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerCart$customer_by_pk$cart$items(
      restaurant_item:
          Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item
              .fromJson((l$restaurant_item as Map<String, dynamic>)),
      cost_per_one: moneyFromJson(l$cost_per_one),
      id: (l$id as int),
      note: (l$note as String?),
      quantity: (l$quantity as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item
      restaurant_item;

  final double cost_per_one;

  final int id;

  final String? note;

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
    final l$note = note;
    _resultData['note'] = l$note;
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
    final l$note = note;
    final l$quantity = quantity;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$restaurant_item,
      l$cost_per_one,
      l$id,
      l$note,
      l$quantity,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getCustomerCart$customer_by_pk$cart$items) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getCustomerCart$customer_by_pk$cart$items
    on Query$getCustomerCart$customer_by_pk$cart$items {
  CopyWith$Query$getCustomerCart$customer_by_pk$cart$items<
          Query$getCustomerCart$customer_by_pk$cart$items>
      get copyWith => CopyWith$Query$getCustomerCart$customer_by_pk$cart$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerCart$customer_by_pk$cart$items<TRes> {
  factory CopyWith$Query$getCustomerCart$customer_by_pk$cart$items(
    Query$getCustomerCart$customer_by_pk$cart$items instance,
    TRes Function(Query$getCustomerCart$customer_by_pk$cart$items) then,
  ) = _CopyWithImpl$Query$getCustomerCart$customer_by_pk$cart$items;

  factory CopyWith$Query$getCustomerCart$customer_by_pk$cart$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCustomerCart$customer_by_pk$cart$items;

  TRes call({
    Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item?
        restaurant_item,
    double? cost_per_one,
    int? id,
    String? note,
    int? quantity,
    String? $__typename,
  });
  CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item<TRes>
      get restaurant_item;
}

class _CopyWithImpl$Query$getCustomerCart$customer_by_pk$cart$items<TRes>
    implements CopyWith$Query$getCustomerCart$customer_by_pk$cart$items<TRes> {
  _CopyWithImpl$Query$getCustomerCart$customer_by_pk$cart$items(
    this._instance,
    this._then,
  );

  final Query$getCustomerCart$customer_by_pk$cart$items _instance;

  final TRes Function(Query$getCustomerCart$customer_by_pk$cart$items) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_item = _undefined,
    Object? cost_per_one = _undefined,
    Object? id = _undefined,
    Object? note = _undefined,
    Object? quantity = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getCustomerCart$customer_by_pk$cart$items(
        restaurant_item: restaurant_item == _undefined ||
                restaurant_item == null
            ? _instance.restaurant_item
            : (restaurant_item
                as Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item),
        cost_per_one: cost_per_one == _undefined || cost_per_one == null
            ? _instance.cost_per_one
            : (cost_per_one as double),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        note: note == _undefined ? _instance.note : (note as String?),
        quantity: quantity == _undefined || quantity == null
            ? _instance.quantity
            : (quantity as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item<TRes>
      get restaurant_item {
    final local$restaurant_item = _instance.restaurant_item;
    return CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item(
        local$restaurant_item, (e) => call(restaurant_item: e));
  }
}

class _CopyWithStubImpl$Query$getCustomerCart$customer_by_pk$cart$items<TRes>
    implements CopyWith$Query$getCustomerCart$customer_by_pk$cart$items<TRes> {
  _CopyWithStubImpl$Query$getCustomerCart$customer_by_pk$cart$items(this._res);

  TRes _res;

  call({
    Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item?
        restaurant_item,
    double? cost_per_one,
    int? id,
    String? note,
    int? quantity,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item<TRes>
      get restaurant_item =>
          CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item
              .stub(_res);
}

class Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item {
  Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item({
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

  factory Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item.fromJson(
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
    return Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item(
      item_type: (l$item_type as String),
      name: Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name
          .fromJson((l$name as Map<String, dynamic>)),
      description: l$description == null
          ? null
          : Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description
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

  final Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name
      name;

  final Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description?
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
            is Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item) ||
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

extension UtilityExtension$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item
    on Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item {
  CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item<
          Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item>
      get copyWith =>
          CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item<
    TRes> {
  factory CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item(
    Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item instance,
    TRes Function(
            Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item)
        then,
  ) = _CopyWithImpl$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item;

  factory CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item;

  TRes call({
    String? item_type,
    Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name? name,
    Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description?
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
  CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name<
      TRes> get name;
  CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description<
      TRes> get description;
}

class _CopyWithImpl$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item<
            TRes> {
  _CopyWithImpl$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item(
    this._instance,
    this._then,
  );

  final Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item
      _instance;

  final TRes Function(
      Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item) _then;

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
      _then(Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item(
        item_type: item_type == _undefined || item_type == null
            ? _instance.item_type
            : (item_type as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name),
        description: description == _undefined
            ? _instance.description
            : (description
                as Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description?),
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
  CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name<
      TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name(
        local$name, (e) => call(name: e));
  }

  CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description<
      TRes> get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description
            .stub(_then(_instance))
        : CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description(
            local$description, (e) => call(description: e));
  }
}

class _CopyWithStubImpl$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item<
            TRes> {
  _CopyWithStubImpl$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item(
      this._res);

  TRes _res;

  call({
    String? item_type,
    Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name? name,
    Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description?
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
  CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name<
          TRes>
      get name =>
          CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name
              .stub(_res);
  CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description<
          TRes>
      get description =>
          CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description
              .stub(_res);
}

class Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name {
  Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name({
    required this.translations,
    required this.$__typename,
  });

  factory Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name$translations>
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
            is Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name) ||
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

extension UtilityExtension$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name
    on Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name {
  CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name<
          Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name>
      get copyWith =>
          CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name<
    TRes> {
  factory CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name(
    Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name
        instance,
    TRes Function(
            Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name)
        then,
  ) = _CopyWithImpl$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name;

  factory CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name;

  TRes call({
    List<Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name$translations> Function(
              Iterable<
                  CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name$translations<
                      Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name<
            TRes> {
  _CopyWithImpl$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name(
    this._instance,
    this._then,
  );

  final Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name
      _instance;

  final TRes Function(
          Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name$translations> Function(
                  Iterable<
                      CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name$translations<
                          Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name<
            TRes> {
  _CopyWithStubImpl$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name(
      this._res);

  TRes _res;

  call({
    List<Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name$translations {
  Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name$translations(
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
            is Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name$translations) ||
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

extension UtilityExtension$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name$translations
    on Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name$translations {
  CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name$translations<
          Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name$translations>
      get copyWith =>
          CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name$translations<
    TRes> {
  factory CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name$translations(
    Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name$translations
        instance,
    TRes Function(
            Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name$translations)
        then,
  ) = _CopyWithImpl$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name$translations;

  factory CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name$translations<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name$translations<
            TRes> {
  _CopyWithImpl$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name$translations(
    this._instance,
    this._then,
  );

  final Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name$translations
      _instance;

  final TRes Function(
          Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name$translations(
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

class _CopyWithStubImpl$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name$translations<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description {
  Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description({
    required this.translations,
    required this.$__typename,
  });

  factory Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description$translations>
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
            is Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description) ||
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

extension UtilityExtension$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description
    on Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description {
  CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description<
          Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description>
      get copyWith =>
          CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description<
    TRes> {
  factory CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description(
    Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description
        instance,
    TRes Function(
            Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description)
        then,
  ) = _CopyWithImpl$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description;

  factory CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description;

  TRes call({
    List<Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description$translations> Function(
              Iterable<
                  CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description$translations<
                      Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description<
            TRes> {
  _CopyWithImpl$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description(
    this._instance,
    this._then,
  );

  final Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description
      _instance;

  final TRes Function(
          Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description$translations> Function(
                  Iterable<
                      CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description$translations<
                          Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description<
            TRes> {
  _CopyWithStubImpl$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description(
      this._res);

  TRes _res;

  call({
    List<Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description$translations {
  Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description$translations(
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
            is Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description$translations) ||
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

extension UtilityExtension$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description$translations
    on Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description$translations {
  CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description$translations<
          Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description$translations>
      get copyWith =>
          CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description$translations<
    TRes> {
  factory CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description$translations(
    Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description$translations
        instance,
    TRes Function(
            Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description$translations)
        then,
  ) = _CopyWithImpl$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description$translations;

  factory CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description$translations<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description$translations<
            TRes> {
  _CopyWithImpl$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description$translations(
    this._instance,
    this._then,
  );

  final Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description$translations
      _instance;

  final TRes Function(
          Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description$translations(
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

class _CopyWithStubImpl$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description$translations<
        TRes>
    implements
        CopyWith$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description$translations<
            TRes> {
  _CopyWithStubImpl$Query$getCustomerCart$customer_by_pk$cart$items$restaurant_item$description$translations(
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
    this.customer_by_pk,
    required this.$__typename,
  });

  factory Subscription$listen_on_customer_cart.fromJson(
      Map<String, dynamic> json) {
    final l$customer_by_pk = json['customer_by_pk'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_customer_cart(
      customer_by_pk: l$customer_by_pk == null
          ? null
          : Subscription$listen_on_customer_cart$customer_by_pk.fromJson(
              (l$customer_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$listen_on_customer_cart$customer_by_pk? customer_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$customer_by_pk = customer_by_pk;
    _resultData['customer_by_pk'] = l$customer_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$customer_by_pk = customer_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$customer_by_pk,
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
    final l$customer_by_pk = customer_by_pk;
    final lOther$customer_by_pk = other.customer_by_pk;
    if (l$customer_by_pk != lOther$customer_by_pk) {
      return false;
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
    Subscription$listen_on_customer_cart$customer_by_pk? customer_by_pk,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_customer_cart$customer_by_pk<TRes>
      get customer_by_pk;
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
    Object? customer_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listen_on_customer_cart(
        customer_by_pk: customer_by_pk == _undefined
            ? _instance.customer_by_pk
            : (customer_by_pk
                as Subscription$listen_on_customer_cart$customer_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_customer_cart$customer_by_pk<TRes>
      get customer_by_pk {
    final local$customer_by_pk = _instance.customer_by_pk;
    return local$customer_by_pk == null
        ? CopyWith$Subscription$listen_on_customer_cart$customer_by_pk.stub(
            _then(_instance))
        : CopyWith$Subscription$listen_on_customer_cart$customer_by_pk(
            local$customer_by_pk, (e) => call(customer_by_pk: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_customer_cart<TRes>
    implements CopyWith$Subscription$listen_on_customer_cart<TRes> {
  _CopyWithStubImpl$Subscription$listen_on_customer_cart(this._res);

  TRes _res;

  call({
    Subscription$listen_on_customer_cart$customer_by_pk? customer_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_customer_cart$customer_by_pk<TRes>
      get customer_by_pk =>
          CopyWith$Subscription$listen_on_customer_cart$customer_by_pk.stub(
              _res);
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
        name: NameNode(value: 'customer_by_pk'),
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

class Subscription$listen_on_customer_cart$customer_by_pk {
  Subscription$listen_on_customer_cart$customer_by_pk({
    this.cart,
    required this.$__typename,
  });

  factory Subscription$listen_on_customer_cart$customer_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$cart = json['cart'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_customer_cart$customer_by_pk(
      cart: l$cart == null
          ? null
          : Subscription$listen_on_customer_cart$customer_by_pk$cart.fromJson(
              (l$cart as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$listen_on_customer_cart$customer_by_pk$cart? cart;

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
    if (!(other is Subscription$listen_on_customer_cart$customer_by_pk) ||
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

extension UtilityExtension$Subscription$listen_on_customer_cart$customer_by_pk
    on Subscription$listen_on_customer_cart$customer_by_pk {
  CopyWith$Subscription$listen_on_customer_cart$customer_by_pk<
          Subscription$listen_on_customer_cart$customer_by_pk>
      get copyWith =>
          CopyWith$Subscription$listen_on_customer_cart$customer_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_customer_cart$customer_by_pk<
    TRes> {
  factory CopyWith$Subscription$listen_on_customer_cart$customer_by_pk(
    Subscription$listen_on_customer_cart$customer_by_pk instance,
    TRes Function(Subscription$listen_on_customer_cart$customer_by_pk) then,
  ) = _CopyWithImpl$Subscription$listen_on_customer_cart$customer_by_pk;

  factory CopyWith$Subscription$listen_on_customer_cart$customer_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_by_pk;

  TRes call({
    Subscription$listen_on_customer_cart$customer_by_pk$cart? cart,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart<TRes>
      get cart;
}

class _CopyWithImpl$Subscription$listen_on_customer_cart$customer_by_pk<TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_by_pk<TRes> {
  _CopyWithImpl$Subscription$listen_on_customer_cart$customer_by_pk(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_customer_cart$customer_by_pk _instance;

  final TRes Function(Subscription$listen_on_customer_cart$customer_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? cart = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listen_on_customer_cart$customer_by_pk(
        cart: cart == _undefined
            ? _instance.cart
            : (cart
                as Subscription$listen_on_customer_cart$customer_by_pk$cart?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart<TRes>
      get cart {
    final local$cart = _instance.cart;
    return local$cart == null
        ? CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart
            .stub(_then(_instance))
        : CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart(
            local$cart, (e) => call(cart: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_by_pk<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_by_pk<TRes> {
  _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_by_pk(
      this._res);

  TRes _res;

  call({
    Subscription$listen_on_customer_cart$customer_by_pk$cart? cart,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart<TRes>
      get cart =>
          CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart
              .stub(_res);
}

class Subscription$listen_on_customer_cart$customer_by_pk$cart {
  Subscription$listen_on_customer_cart$customer_by_pk$cart({
    this.restaurant_id,
    required this.items,
    required this.$__typename,
  });

  factory Subscription$listen_on_customer_cart$customer_by_pk$cart.fromJson(
      Map<String, dynamic> json) {
    final l$restaurant_id = json['restaurant_id'];
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_customer_cart$customer_by_pk$cart(
      restaurant_id: (l$restaurant_id as int?),
      items: (l$items as List<dynamic>)
          .map((e) =>
              Subscription$listen_on_customer_cart$customer_by_pk$cart$items
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int? restaurant_id;

  final List<Subscription$listen_on_customer_cart$customer_by_pk$cart$items>
      items;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_id = restaurant_id;
    _resultData['restaurant_id'] = l$restaurant_id;
    final l$items = items;
    _resultData['items'] = l$items.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_id = restaurant_id;
    final l$items = items;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$restaurant_id,
      Object.hashAll(l$items.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$listen_on_customer_cart$customer_by_pk$cart) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_id = restaurant_id;
    final lOther$restaurant_id = other.restaurant_id;
    if (l$restaurant_id != lOther$restaurant_id) {
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

extension UtilityExtension$Subscription$listen_on_customer_cart$customer_by_pk$cart
    on Subscription$listen_on_customer_cart$customer_by_pk$cart {
  CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart<
          Subscription$listen_on_customer_cart$customer_by_pk$cart>
      get copyWith =>
          CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart<
    TRes> {
  factory CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart(
    Subscription$listen_on_customer_cart$customer_by_pk$cart instance,
    TRes Function(Subscription$listen_on_customer_cart$customer_by_pk$cart)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_customer_cart$customer_by_pk$cart;

  factory CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_by_pk$cart;

  TRes call({
    int? restaurant_id,
    List<Subscription$listen_on_customer_cart$customer_by_pk$cart$items>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Subscription$listen_on_customer_cart$customer_by_pk$cart$items> Function(
              Iterable<
                  CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items<
                      Subscription$listen_on_customer_cart$customer_by_pk$cart$items>>)
          _fn);
}

class _CopyWithImpl$Subscription$listen_on_customer_cart$customer_by_pk$cart<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_customer_cart$customer_by_pk$cart(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_customer_cart$customer_by_pk$cart _instance;

  final TRes Function(Subscription$listen_on_customer_cart$customer_by_pk$cart)
      _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_id = _undefined,
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listen_on_customer_cart$customer_by_pk$cart(
        restaurant_id: restaurant_id == _undefined
            ? _instance.restaurant_id
            : (restaurant_id as int?),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<
                Subscription$listen_on_customer_cart$customer_by_pk$cart$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Subscription$listen_on_customer_cart$customer_by_pk$cart$items> Function(
                  Iterable<
                      CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items<
                          Subscription$listen_on_customer_cart$customer_by_pk$cart$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) =>
              CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_by_pk$cart<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_by_pk$cart(
      this._res);

  TRes _res;

  call({
    int? restaurant_id,
    List<Subscription$listen_on_customer_cart$customer_by_pk$cart$items>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Subscription$listen_on_customer_cart$customer_by_pk$cart$items {
  Subscription$listen_on_customer_cart$customer_by_pk$cart$items({
    required this.restaurant_item,
    required this.cost_per_one,
    required this.id,
    this.note,
    required this.quantity,
    required this.$__typename,
  });

  factory Subscription$listen_on_customer_cart$customer_by_pk$cart$items.fromJson(
      Map<String, dynamic> json) {
    final l$restaurant_item = json['restaurant_item'];
    final l$cost_per_one = json['cost_per_one'];
    final l$id = json['id'];
    final l$note = json['note'];
    final l$quantity = json['quantity'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_customer_cart$customer_by_pk$cart$items(
      restaurant_item:
          Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item
              .fromJson((l$restaurant_item as Map<String, dynamic>)),
      cost_per_one: moneyFromJson(l$cost_per_one),
      id: (l$id as int),
      note: (l$note as String?),
      quantity: (l$quantity as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item
      restaurant_item;

  final double cost_per_one;

  final int id;

  final String? note;

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
    final l$note = note;
    _resultData['note'] = l$note;
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
    final l$note = note;
    final l$quantity = quantity;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$restaurant_item,
      l$cost_per_one,
      l$id,
      l$note,
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
            is Subscription$listen_on_customer_cart$customer_by_pk$cart$items) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$listen_on_customer_cart$customer_by_pk$cart$items
    on Subscription$listen_on_customer_cart$customer_by_pk$cart$items {
  CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items<
          Subscription$listen_on_customer_cart$customer_by_pk$cart$items>
      get copyWith =>
          CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items<
    TRes> {
  factory CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items(
    Subscription$listen_on_customer_cart$customer_by_pk$cart$items instance,
    TRes Function(
            Subscription$listen_on_customer_cart$customer_by_pk$cart$items)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_customer_cart$customer_by_pk$cart$items;

  factory CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_by_pk$cart$items;

  TRes call({
    Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item?
        restaurant_item,
    double? cost_per_one,
    int? id,
    String? note,
    int? quantity,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item<
      TRes> get restaurant_item;
}

class _CopyWithImpl$Subscription$listen_on_customer_cart$customer_by_pk$cart$items<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_customer_cart$customer_by_pk$cart$items(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_customer_cart$customer_by_pk$cart$items
      _instance;

  final TRes Function(
      Subscription$listen_on_customer_cart$customer_by_pk$cart$items) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_item = _undefined,
    Object? cost_per_one = _undefined,
    Object? id = _undefined,
    Object? note = _undefined,
    Object? quantity = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listen_on_customer_cart$customer_by_pk$cart$items(
        restaurant_item: restaurant_item == _undefined ||
                restaurant_item == null
            ? _instance.restaurant_item
            : (restaurant_item
                as Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item),
        cost_per_one: cost_per_one == _undefined || cost_per_one == null
            ? _instance.cost_per_one
            : (cost_per_one as double),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        note: note == _undefined ? _instance.note : (note as String?),
        quantity: quantity == _undefined || quantity == null
            ? _instance.quantity
            : (quantity as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item<
      TRes> get restaurant_item {
    final local$restaurant_item = _instance.restaurant_item;
    return CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item(
        local$restaurant_item, (e) => call(restaurant_item: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_by_pk$cart$items<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_by_pk$cart$items(
      this._res);

  TRes _res;

  call({
    Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item?
        restaurant_item,
    double? cost_per_one,
    int? id,
    String? note,
    int? quantity,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item<
          TRes>
      get restaurant_item =>
          CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item
              .stub(_res);
}

class Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item {
  Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item({
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

  factory Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item.fromJson(
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
    return Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item(
      item_type: (l$item_type as String),
      name:
          Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name
              .fromJson((l$name as Map<String, dynamic>)),
      description: l$description == null
          ? null
          : Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description
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

  final Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name
      name;

  final Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description?
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
            is Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item) ||
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

extension UtilityExtension$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item
    on Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item {
  CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item<
          Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item>
      get copyWith =>
          CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item<
    TRes> {
  factory CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item(
    Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item
        instance,
    TRes Function(
            Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item;

  factory CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item;

  TRes call({
    String? item_type,
    Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name?
        name,
    Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description?
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
  CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name<
      TRes> get name;
  CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description<
      TRes> get description;
}

class _CopyWithImpl$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item
      _instance;

  final TRes Function(
          Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item)
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
          Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item(
        item_type: item_type == _undefined || item_type == null
            ? _instance.item_type
            : (item_type as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name),
        description: description == _undefined
            ? _instance.description
            : (description
                as Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description?),
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
  CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name<
      TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name(
        local$name, (e) => call(name: e));
  }

  CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description<
      TRes> get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description
            .stub(_then(_instance))
        : CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description(
            local$description, (e) => call(description: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item(
      this._res);

  TRes _res;

  call({
    String? item_type,
    Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name?
        name,
    Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description?
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
  CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name<
          TRes>
      get name =>
          CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name
              .stub(_res);
  CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description<
          TRes>
      get description =>
          CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description
              .stub(_res);
}

class Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name {
  Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name({
    required this.translations,
    required this.$__typename,
  });

  factory Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name$translations>
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
            is Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name) ||
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

extension UtilityExtension$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name
    on Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name {
  CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name<
          Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name>
      get copyWith =>
          CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name<
    TRes> {
  factory CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name(
    Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name
        instance,
    TRes Function(
            Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name;

  factory CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name;

  TRes call({
    List<Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name$translations> Function(
              Iterable<
                  CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name$translations<
                      Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name$translations>>)
          _fn);
}

class _CopyWithImpl$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name
      _instance;

  final TRes Function(
          Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name$translations> Function(
                  Iterable<
                      CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name$translations<
                          Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name(
      this._res);

  TRes _res;

  call({
    List<Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name$translations {
  Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name$translations(
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
            is Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name$translations) ||
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

extension UtilityExtension$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name$translations
    on Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name$translations {
  CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name$translations<
          Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name$translations>
      get copyWith =>
          CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name$translations<
    TRes> {
  factory CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name$translations(
    Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name$translations
        instance,
    TRes Function(
            Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name$translations)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name$translations;

  factory CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name$translations<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name$translations<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name$translations(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name$translations
      _instance;

  final TRes Function(
          Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name$translations(
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

class _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name$translations<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name$translations<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description {
  Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description({
    required this.translations,
    required this.$__typename,
  });

  factory Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description$translations>
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
            is Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description) ||
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

extension UtilityExtension$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description
    on Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description {
  CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description<
          Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description>
      get copyWith =>
          CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description<
    TRes> {
  factory CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description(
    Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description
        instance,
    TRes Function(
            Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description;

  factory CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description;

  TRes call({
    List<Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description$translations> Function(
              Iterable<
                  CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description$translations<
                      Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description$translations>>)
          _fn);
}

class _CopyWithImpl$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description
      _instance;

  final TRes Function(
          Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description$translations> Function(
                  Iterable<
                      CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description$translations<
                          Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description(
      this._res);

  TRes _res;

  call({
    List<Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description$translations {
  Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description$translations(
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
            is Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description$translations) ||
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

extension UtilityExtension$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description$translations
    on Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description$translations {
  CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description$translations<
          Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description$translations>
      get copyWith =>
          CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description$translations<
    TRes> {
  factory CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description$translations(
    Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description$translations
        instance,
    TRes Function(
            Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description$translations)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description$translations;

  factory CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description$translations<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description$translations<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description$translations(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description$translations
      _instance;

  final TRes Function(
          Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description$translations(
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

class _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description$translations<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description$translations<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_customer_cart$customer_by_pk$cart$items$restaurant_item$description$translations(
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

class Mutation$clearCart$delete_restaurant_cart {
  Mutation$clearCart$delete_restaurant_cart({
    required this.affected_rows,
    required this.$__typename,
  });

  factory Mutation$clearCart$delete_restaurant_cart.fromJson(
      Map<String, dynamic> json) {
    final l$affected_rows = json['affected_rows'];
    final l$$__typename = json['__typename'];
    return Mutation$clearCart$delete_restaurant_cart(
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
    if (!(other is Mutation$clearCart$delete_restaurant_cart) ||
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
    int? affected_rows,
    String? $__typename,
  });
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
    Object? affected_rows = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$clearCart$delete_restaurant_cart(
        affected_rows: affected_rows == _undefined || affected_rows == null
            ? _instance.affected_rows
            : (affected_rows as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$clearCart$delete_restaurant_cart<TRes>
    implements CopyWith$Mutation$clearCart$delete_restaurant_cart<TRes> {
  _CopyWithStubImpl$Mutation$clearCart$delete_restaurant_cart(this._res);

  TRes _res;

  call({
    int? affected_rows,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$update_item_quantity {
  factory Variables$Mutation$update_item_quantity({
    required int customer_id,
    required int item_id,
    required int quantity,
  }) =>
      Variables$Mutation$update_item_quantity._({
        r'customer_id': customer_id,
        r'item_id': item_id,
        r'quantity': quantity,
      });

  Variables$Mutation$update_item_quantity._(this._$data);

  factory Variables$Mutation$update_item_quantity.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$customer_id = data['customer_id'];
    result$data['customer_id'] = (l$customer_id as int);
    final l$item_id = data['item_id'];
    result$data['item_id'] = (l$item_id as int);
    final l$quantity = data['quantity'];
    result$data['quantity'] = (l$quantity as int);
    return Variables$Mutation$update_item_quantity._(result$data);
  }

  Map<String, dynamic> _$data;

  int get customer_id => (_$data['customer_id'] as int);
  int get item_id => (_$data['item_id'] as int);
  int get quantity => (_$data['quantity'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$customer_id = customer_id;
    result$data['customer_id'] = l$customer_id;
    final l$item_id = item_id;
    result$data['item_id'] = l$item_id;
    final l$quantity = quantity;
    result$data['quantity'] = l$quantity;
    return result$data;
  }

  CopyWith$Variables$Mutation$update_item_quantity<
          Variables$Mutation$update_item_quantity>
      get copyWith => CopyWith$Variables$Mutation$update_item_quantity(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$update_item_quantity) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$customer_id = customer_id;
    final lOther$customer_id = other.customer_id;
    if (l$customer_id != lOther$customer_id) {
      return false;
    }
    final l$item_id = item_id;
    final lOther$item_id = other.item_id;
    if (l$item_id != lOther$item_id) {
      return false;
    }
    final l$quantity = quantity;
    final lOther$quantity = other.quantity;
    if (l$quantity != lOther$quantity) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$customer_id = customer_id;
    final l$item_id = item_id;
    final l$quantity = quantity;
    return Object.hashAll([
      l$customer_id,
      l$item_id,
      l$quantity,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$update_item_quantity<TRes> {
  factory CopyWith$Variables$Mutation$update_item_quantity(
    Variables$Mutation$update_item_quantity instance,
    TRes Function(Variables$Mutation$update_item_quantity) then,
  ) = _CopyWithImpl$Variables$Mutation$update_item_quantity;

  factory CopyWith$Variables$Mutation$update_item_quantity.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$update_item_quantity;

  TRes call({
    int? customer_id,
    int? item_id,
    int? quantity,
  });
}

class _CopyWithImpl$Variables$Mutation$update_item_quantity<TRes>
    implements CopyWith$Variables$Mutation$update_item_quantity<TRes> {
  _CopyWithImpl$Variables$Mutation$update_item_quantity(
    this._instance,
    this._then,
  );

  final Variables$Mutation$update_item_quantity _instance;

  final TRes Function(Variables$Mutation$update_item_quantity) _then;

  static const _undefined = {};

  TRes call({
    Object? customer_id = _undefined,
    Object? item_id = _undefined,
    Object? quantity = _undefined,
  }) =>
      _then(Variables$Mutation$update_item_quantity._({
        ..._instance._$data,
        if (customer_id != _undefined && customer_id != null)
          'customer_id': (customer_id as int),
        if (item_id != _undefined && item_id != null)
          'item_id': (item_id as int),
        if (quantity != _undefined && quantity != null)
          'quantity': (quantity as int),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$update_item_quantity<TRes>
    implements CopyWith$Variables$Mutation$update_item_quantity<TRes> {
  _CopyWithStubImpl$Variables$Mutation$update_item_quantity(this._res);

  TRes _res;

  call({
    int? customer_id,
    int? item_id,
    int? quantity,
  }) =>
      _res;
}

class Mutation$update_item_quantity {
  Mutation$update_item_quantity({
    this.update_restaurant_cart_item,
    required this.$__typename,
  });

  factory Mutation$update_item_quantity.fromJson(Map<String, dynamic> json) {
    final l$update_restaurant_cart_item = json['update_restaurant_cart_item'];
    final l$$__typename = json['__typename'];
    return Mutation$update_item_quantity(
      update_restaurant_cart_item: l$update_restaurant_cart_item == null
          ? null
          : Mutation$update_item_quantity$update_restaurant_cart_item.fromJson(
              (l$update_restaurant_cart_item as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$update_item_quantity$update_restaurant_cart_item?
      update_restaurant_cart_item;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_restaurant_cart_item = update_restaurant_cart_item;
    _resultData['update_restaurant_cart_item'] =
        l$update_restaurant_cart_item?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_restaurant_cart_item = update_restaurant_cart_item;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_restaurant_cart_item,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$update_item_quantity) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_restaurant_cart_item = update_restaurant_cart_item;
    final lOther$update_restaurant_cart_item =
        other.update_restaurant_cart_item;
    if (l$update_restaurant_cart_item != lOther$update_restaurant_cart_item) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$update_item_quantity
    on Mutation$update_item_quantity {
  CopyWith$Mutation$update_item_quantity<Mutation$update_item_quantity>
      get copyWith => CopyWith$Mutation$update_item_quantity(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$update_item_quantity<TRes> {
  factory CopyWith$Mutation$update_item_quantity(
    Mutation$update_item_quantity instance,
    TRes Function(Mutation$update_item_quantity) then,
  ) = _CopyWithImpl$Mutation$update_item_quantity;

  factory CopyWith$Mutation$update_item_quantity.stub(TRes res) =
      _CopyWithStubImpl$Mutation$update_item_quantity;

  TRes call({
    Mutation$update_item_quantity$update_restaurant_cart_item?
        update_restaurant_cart_item,
    String? $__typename,
  });
  CopyWith$Mutation$update_item_quantity$update_restaurant_cart_item<TRes>
      get update_restaurant_cart_item;
}

class _CopyWithImpl$Mutation$update_item_quantity<TRes>
    implements CopyWith$Mutation$update_item_quantity<TRes> {
  _CopyWithImpl$Mutation$update_item_quantity(
    this._instance,
    this._then,
  );

  final Mutation$update_item_quantity _instance;

  final TRes Function(Mutation$update_item_quantity) _then;

  static const _undefined = {};

  TRes call({
    Object? update_restaurant_cart_item = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$update_item_quantity(
        update_restaurant_cart_item: update_restaurant_cart_item == _undefined
            ? _instance.update_restaurant_cart_item
            : (update_restaurant_cart_item
                as Mutation$update_item_quantity$update_restaurant_cart_item?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$update_item_quantity$update_restaurant_cart_item<TRes>
      get update_restaurant_cart_item {
    final local$update_restaurant_cart_item =
        _instance.update_restaurant_cart_item;
    return local$update_restaurant_cart_item == null
        ? CopyWith$Mutation$update_item_quantity$update_restaurant_cart_item
            .stub(_then(_instance))
        : CopyWith$Mutation$update_item_quantity$update_restaurant_cart_item(
            local$update_restaurant_cart_item,
            (e) => call(update_restaurant_cart_item: e));
  }
}

class _CopyWithStubImpl$Mutation$update_item_quantity<TRes>
    implements CopyWith$Mutation$update_item_quantity<TRes> {
  _CopyWithStubImpl$Mutation$update_item_quantity(this._res);

  TRes _res;

  call({
    Mutation$update_item_quantity$update_restaurant_cart_item?
        update_restaurant_cart_item,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$update_item_quantity$update_restaurant_cart_item<TRes>
      get update_restaurant_cart_item =>
          CopyWith$Mutation$update_item_quantity$update_restaurant_cart_item
              .stub(_res);
}

const documentNodeMutationupdate_item_quantity = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'update_item_quantity'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'customer_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'item_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'quantity')),
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
        name: NameNode(value: 'update_restaurant_cart_item'),
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
                    value: VariableNode(name: NameNode(value: 'item_id')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: '_and'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'customer_id'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                        name: NameNode(value: '_eq'),
                        value:
                            VariableNode(name: NameNode(value: 'customer_id')),
                      )
                    ]),
                  )
                ]),
              ),
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: '_set'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'quantity'),
                value: VariableNode(name: NameNode(value: 'quantity')),
              )
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
Mutation$update_item_quantity _parserFn$Mutation$update_item_quantity(
        Map<String, dynamic> data) =>
    Mutation$update_item_quantity.fromJson(data);
typedef OnMutationCompleted$Mutation$update_item_quantity = FutureOr<void>
    Function(
  dynamic,
  Mutation$update_item_quantity?,
);

class Options$Mutation$update_item_quantity
    extends graphql.MutationOptions<Mutation$update_item_quantity> {
  Options$Mutation$update_item_quantity({
    String? operationName,
    required Variables$Mutation$update_item_quantity variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$update_item_quantity? onCompleted,
    graphql.OnMutationUpdate<Mutation$update_item_quantity>? update,
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
                        : _parserFn$Mutation$update_item_quantity(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdate_item_quantity,
          parserFn: _parserFn$Mutation$update_item_quantity,
        );

  final OnMutationCompleted$Mutation$update_item_quantity?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$update_item_quantity
    extends graphql.WatchQueryOptions<Mutation$update_item_quantity> {
  WatchOptions$Mutation$update_item_quantity({
    String? operationName,
    required Variables$Mutation$update_item_quantity variables,
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
          document: documentNodeMutationupdate_item_quantity,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$update_item_quantity,
        );
}

extension ClientExtension$Mutation$update_item_quantity
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$update_item_quantity>>
      mutate$update_item_quantity(
              Options$Mutation$update_item_quantity options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$update_item_quantity>
      watchMutation$update_item_quantity(
              WatchOptions$Mutation$update_item_quantity options) =>
          this.watchMutation(options);
}

class Mutation$update_item_quantity$update_restaurant_cart_item {
  Mutation$update_item_quantity$update_restaurant_cart_item({
    required this.affected_rows,
    required this.$__typename,
  });

  factory Mutation$update_item_quantity$update_restaurant_cart_item.fromJson(
      Map<String, dynamic> json) {
    final l$affected_rows = json['affected_rows'];
    final l$$__typename = json['__typename'];
    return Mutation$update_item_quantity$update_restaurant_cart_item(
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
    if (!(other is Mutation$update_item_quantity$update_restaurant_cart_item) ||
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

extension UtilityExtension$Mutation$update_item_quantity$update_restaurant_cart_item
    on Mutation$update_item_quantity$update_restaurant_cart_item {
  CopyWith$Mutation$update_item_quantity$update_restaurant_cart_item<
          Mutation$update_item_quantity$update_restaurant_cart_item>
      get copyWith =>
          CopyWith$Mutation$update_item_quantity$update_restaurant_cart_item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$update_item_quantity$update_restaurant_cart_item<
    TRes> {
  factory CopyWith$Mutation$update_item_quantity$update_restaurant_cart_item(
    Mutation$update_item_quantity$update_restaurant_cart_item instance,
    TRes Function(Mutation$update_item_quantity$update_restaurant_cart_item)
        then,
  ) = _CopyWithImpl$Mutation$update_item_quantity$update_restaurant_cart_item;

  factory CopyWith$Mutation$update_item_quantity$update_restaurant_cart_item.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$update_item_quantity$update_restaurant_cart_item;

  TRes call({
    int? affected_rows,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$update_item_quantity$update_restaurant_cart_item<
        TRes>
    implements
        CopyWith$Mutation$update_item_quantity$update_restaurant_cart_item<
            TRes> {
  _CopyWithImpl$Mutation$update_item_quantity$update_restaurant_cart_item(
    this._instance,
    this._then,
  );

  final Mutation$update_item_quantity$update_restaurant_cart_item _instance;

  final TRes Function(Mutation$update_item_quantity$update_restaurant_cart_item)
      _then;

  static const _undefined = {};

  TRes call({
    Object? affected_rows = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$update_item_quantity$update_restaurant_cart_item(
        affected_rows: affected_rows == _undefined || affected_rows == null
            ? _instance.affected_rows
            : (affected_rows as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$update_item_quantity$update_restaurant_cart_item<
        TRes>
    implements
        CopyWith$Mutation$update_item_quantity$update_restaurant_cart_item<
            TRes> {
  _CopyWithStubImpl$Mutation$update_item_quantity$update_restaurant_cart_item(
      this._res);

  TRes _res;

  call({
    int? affected_rows,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$updateCart {
  factory Variables$Mutation$updateCart({
    required int customer_id,
    int? restaurant_id,
    required List<Input$restaurant_cart_item_insert_input> items,
  }) =>
      Variables$Mutation$updateCart._({
        r'customer_id': customer_id,
        if (restaurant_id != null) r'restaurant_id': restaurant_id,
        r'items': items,
      });

  Variables$Mutation$updateCart._(this._$data);

  factory Variables$Mutation$updateCart.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$customer_id = data['customer_id'];
    result$data['customer_id'] = (l$customer_id as int);
    if (data.containsKey('restaurant_id')) {
      final l$restaurant_id = data['restaurant_id'];
      result$data['restaurant_id'] = (l$restaurant_id as int?);
    }
    final l$items = data['items'];
    result$data['items'] = (l$items as List<dynamic>)
        .map((e) => Input$restaurant_cart_item_insert_input.fromJson(
            (e as Map<String, dynamic>)))
        .toList();
    return Variables$Mutation$updateCart._(result$data);
  }

  Map<String, dynamic> _$data;

  int get customer_id => (_$data['customer_id'] as int);
  int? get restaurant_id => (_$data['restaurant_id'] as int?);
  List<Input$restaurant_cart_item_insert_input> get items =>
      (_$data['items'] as List<Input$restaurant_cart_item_insert_input>);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$customer_id = customer_id;
    result$data['customer_id'] = l$customer_id;
    if (_$data.containsKey('restaurant_id')) {
      final l$restaurant_id = restaurant_id;
      result$data['restaurant_id'] = l$restaurant_id;
    }
    final l$items = items;
    result$data['items'] = l$items.map((e) => e.toJson()).toList();
    return result$data;
  }

  CopyWith$Variables$Mutation$updateCart<Variables$Mutation$updateCart>
      get copyWith => CopyWith$Variables$Mutation$updateCart(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$updateCart) ||
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
    if (_$data.containsKey('restaurant_id') !=
        other._$data.containsKey('restaurant_id')) {
      return false;
    }
    if (l$restaurant_id != lOther$restaurant_id) {
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
    return true;
  }

  @override
  int get hashCode {
    final l$customer_id = customer_id;
    final l$restaurant_id = restaurant_id;
    final l$items = items;
    return Object.hashAll([
      l$customer_id,
      _$data.containsKey('restaurant_id') ? l$restaurant_id : const {},
      Object.hashAll(l$items.map((v) => v)),
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$updateCart<TRes> {
  factory CopyWith$Variables$Mutation$updateCart(
    Variables$Mutation$updateCart instance,
    TRes Function(Variables$Mutation$updateCart) then,
  ) = _CopyWithImpl$Variables$Mutation$updateCart;

  factory CopyWith$Variables$Mutation$updateCart.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$updateCart;

  TRes call({
    int? customer_id,
    int? restaurant_id,
    List<Input$restaurant_cart_item_insert_input>? items,
  });
}

class _CopyWithImpl$Variables$Mutation$updateCart<TRes>
    implements CopyWith$Variables$Mutation$updateCart<TRes> {
  _CopyWithImpl$Variables$Mutation$updateCart(
    this._instance,
    this._then,
  );

  final Variables$Mutation$updateCart _instance;

  final TRes Function(Variables$Mutation$updateCart) _then;

  static const _undefined = {};

  TRes call({
    Object? customer_id = _undefined,
    Object? restaurant_id = _undefined,
    Object? items = _undefined,
  }) =>
      _then(Variables$Mutation$updateCart._({
        ..._instance._$data,
        if (customer_id != _undefined && customer_id != null)
          'customer_id': (customer_id as int),
        if (restaurant_id != _undefined)
          'restaurant_id': (restaurant_id as int?),
        if (items != _undefined && items != null)
          'items': (items as List<Input$restaurant_cart_item_insert_input>),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$updateCart<TRes>
    implements CopyWith$Variables$Mutation$updateCart<TRes> {
  _CopyWithStubImpl$Variables$Mutation$updateCart(this._res);

  TRes _res;

  call({
    int? customer_id,
    int? restaurant_id,
    List<Input$restaurant_cart_item_insert_input>? items,
  }) =>
      _res;
}

class Mutation$updateCart {
  Mutation$updateCart({
    this.update_restaurant_cart,
    this.delete_restaurant_cart_item,
    this.insert_restaurant_cart_item,
    required this.$__typename,
  });

  factory Mutation$updateCart.fromJson(Map<String, dynamic> json) {
    final l$update_restaurant_cart = json['update_restaurant_cart'];
    final l$delete_restaurant_cart_item = json['delete_restaurant_cart_item'];
    final l$insert_restaurant_cart_item = json['insert_restaurant_cart_item'];
    final l$$__typename = json['__typename'];
    return Mutation$updateCart(
      update_restaurant_cart: l$update_restaurant_cart == null
          ? null
          : Mutation$updateCart$update_restaurant_cart.fromJson(
              (l$update_restaurant_cart as Map<String, dynamic>)),
      delete_restaurant_cart_item: l$delete_restaurant_cart_item == null
          ? null
          : Mutation$updateCart$delete_restaurant_cart_item.fromJson(
              (l$delete_restaurant_cart_item as Map<String, dynamic>)),
      insert_restaurant_cart_item: l$insert_restaurant_cart_item == null
          ? null
          : Mutation$updateCart$insert_restaurant_cart_item.fromJson(
              (l$insert_restaurant_cart_item as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$updateCart$update_restaurant_cart? update_restaurant_cart;

  final Mutation$updateCart$delete_restaurant_cart_item?
      delete_restaurant_cart_item;

  final Mutation$updateCart$insert_restaurant_cart_item?
      insert_restaurant_cart_item;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_restaurant_cart = update_restaurant_cart;
    _resultData['update_restaurant_cart'] = l$update_restaurant_cart?.toJson();
    final l$delete_restaurant_cart_item = delete_restaurant_cart_item;
    _resultData['delete_restaurant_cart_item'] =
        l$delete_restaurant_cart_item?.toJson();
    final l$insert_restaurant_cart_item = insert_restaurant_cart_item;
    _resultData['insert_restaurant_cart_item'] =
        l$insert_restaurant_cart_item?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_restaurant_cart = update_restaurant_cart;
    final l$delete_restaurant_cart_item = delete_restaurant_cart_item;
    final l$insert_restaurant_cart_item = insert_restaurant_cart_item;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_restaurant_cart,
      l$delete_restaurant_cart_item,
      l$insert_restaurant_cart_item,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$updateCart) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_restaurant_cart = update_restaurant_cart;
    final lOther$update_restaurant_cart = other.update_restaurant_cart;
    if (l$update_restaurant_cart != lOther$update_restaurant_cart) {
      return false;
    }
    final l$delete_restaurant_cart_item = delete_restaurant_cart_item;
    final lOther$delete_restaurant_cart_item =
        other.delete_restaurant_cart_item;
    if (l$delete_restaurant_cart_item != lOther$delete_restaurant_cart_item) {
      return false;
    }
    final l$insert_restaurant_cart_item = insert_restaurant_cart_item;
    final lOther$insert_restaurant_cart_item =
        other.insert_restaurant_cart_item;
    if (l$insert_restaurant_cart_item != lOther$insert_restaurant_cart_item) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$updateCart on Mutation$updateCart {
  CopyWith$Mutation$updateCart<Mutation$updateCart> get copyWith =>
      CopyWith$Mutation$updateCart(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$updateCart<TRes> {
  factory CopyWith$Mutation$updateCart(
    Mutation$updateCart instance,
    TRes Function(Mutation$updateCart) then,
  ) = _CopyWithImpl$Mutation$updateCart;

  factory CopyWith$Mutation$updateCart.stub(TRes res) =
      _CopyWithStubImpl$Mutation$updateCart;

  TRes call({
    Mutation$updateCart$update_restaurant_cart? update_restaurant_cart,
    Mutation$updateCart$delete_restaurant_cart_item?
        delete_restaurant_cart_item,
    Mutation$updateCart$insert_restaurant_cart_item?
        insert_restaurant_cart_item,
    String? $__typename,
  });
  CopyWith$Mutation$updateCart$update_restaurant_cart<TRes>
      get update_restaurant_cart;
  CopyWith$Mutation$updateCart$delete_restaurant_cart_item<TRes>
      get delete_restaurant_cart_item;
  CopyWith$Mutation$updateCart$insert_restaurant_cart_item<TRes>
      get insert_restaurant_cart_item;
}

class _CopyWithImpl$Mutation$updateCart<TRes>
    implements CopyWith$Mutation$updateCart<TRes> {
  _CopyWithImpl$Mutation$updateCart(
    this._instance,
    this._then,
  );

  final Mutation$updateCart _instance;

  final TRes Function(Mutation$updateCart) _then;

  static const _undefined = {};

  TRes call({
    Object? update_restaurant_cart = _undefined,
    Object? delete_restaurant_cart_item = _undefined,
    Object? insert_restaurant_cart_item = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateCart(
        update_restaurant_cart: update_restaurant_cart == _undefined
            ? _instance.update_restaurant_cart
            : (update_restaurant_cart
                as Mutation$updateCart$update_restaurant_cart?),
        delete_restaurant_cart_item: delete_restaurant_cart_item == _undefined
            ? _instance.delete_restaurant_cart_item
            : (delete_restaurant_cart_item
                as Mutation$updateCart$delete_restaurant_cart_item?),
        insert_restaurant_cart_item: insert_restaurant_cart_item == _undefined
            ? _instance.insert_restaurant_cart_item
            : (insert_restaurant_cart_item
                as Mutation$updateCart$insert_restaurant_cart_item?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$updateCart$update_restaurant_cart<TRes>
      get update_restaurant_cart {
    final local$update_restaurant_cart = _instance.update_restaurant_cart;
    return local$update_restaurant_cart == null
        ? CopyWith$Mutation$updateCart$update_restaurant_cart.stub(
            _then(_instance))
        : CopyWith$Mutation$updateCart$update_restaurant_cart(
            local$update_restaurant_cart,
            (e) => call(update_restaurant_cart: e));
  }

  CopyWith$Mutation$updateCart$delete_restaurant_cart_item<TRes>
      get delete_restaurant_cart_item {
    final local$delete_restaurant_cart_item =
        _instance.delete_restaurant_cart_item;
    return local$delete_restaurant_cart_item == null
        ? CopyWith$Mutation$updateCart$delete_restaurant_cart_item.stub(
            _then(_instance))
        : CopyWith$Mutation$updateCart$delete_restaurant_cart_item(
            local$delete_restaurant_cart_item,
            (e) => call(delete_restaurant_cart_item: e));
  }

  CopyWith$Mutation$updateCart$insert_restaurant_cart_item<TRes>
      get insert_restaurant_cart_item {
    final local$insert_restaurant_cart_item =
        _instance.insert_restaurant_cart_item;
    return local$insert_restaurant_cart_item == null
        ? CopyWith$Mutation$updateCart$insert_restaurant_cart_item.stub(
            _then(_instance))
        : CopyWith$Mutation$updateCart$insert_restaurant_cart_item(
            local$insert_restaurant_cart_item,
            (e) => call(insert_restaurant_cart_item: e));
  }
}

class _CopyWithStubImpl$Mutation$updateCart<TRes>
    implements CopyWith$Mutation$updateCart<TRes> {
  _CopyWithStubImpl$Mutation$updateCart(this._res);

  TRes _res;

  call({
    Mutation$updateCart$update_restaurant_cart? update_restaurant_cart,
    Mutation$updateCart$delete_restaurant_cart_item?
        delete_restaurant_cart_item,
    Mutation$updateCart$insert_restaurant_cart_item?
        insert_restaurant_cart_item,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$updateCart$update_restaurant_cart<TRes>
      get update_restaurant_cart =>
          CopyWith$Mutation$updateCart$update_restaurant_cart.stub(_res);
  CopyWith$Mutation$updateCart$delete_restaurant_cart_item<TRes>
      get delete_restaurant_cart_item =>
          CopyWith$Mutation$updateCart$delete_restaurant_cart_item.stub(_res);
  CopyWith$Mutation$updateCart$insert_restaurant_cart_item<TRes>
      get insert_restaurant_cart_item =>
          CopyWith$Mutation$updateCart$insert_restaurant_cart_item.stub(_res);
}

const documentNodeMutationupdateCart = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'updateCart'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'customer_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'restaurant_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'items')),
        type: ListTypeNode(
          type: NamedTypeNode(
            name: NameNode(value: 'restaurant_cart_item_insert_input'),
            isNonNull: true,
          ),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'update_restaurant_cart'),
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
            name: NameNode(value: 'returning'),
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
      FieldNode(
        name: NameNode(value: 'insert_restaurant_cart_item'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'objects'),
            value: VariableNode(name: NameNode(value: 'items')),
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
Mutation$updateCart _parserFn$Mutation$updateCart(Map<String, dynamic> data) =>
    Mutation$updateCart.fromJson(data);
typedef OnMutationCompleted$Mutation$updateCart = FutureOr<void> Function(
  dynamic,
  Mutation$updateCart?,
);

class Options$Mutation$updateCart
    extends graphql.MutationOptions<Mutation$updateCart> {
  Options$Mutation$updateCart({
    String? operationName,
    required Variables$Mutation$updateCart variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$updateCart? onCompleted,
    graphql.OnMutationUpdate<Mutation$updateCart>? update,
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
                    data == null ? null : _parserFn$Mutation$updateCart(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdateCart,
          parserFn: _parserFn$Mutation$updateCart,
        );

  final OnMutationCompleted$Mutation$updateCart? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$updateCart
    extends graphql.WatchQueryOptions<Mutation$updateCart> {
  WatchOptions$Mutation$updateCart({
    String? operationName,
    required Variables$Mutation$updateCart variables,
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
          document: documentNodeMutationupdateCart,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$updateCart,
        );
}

extension ClientExtension$Mutation$updateCart on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$updateCart>> mutate$updateCart(
          Options$Mutation$updateCart options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$updateCart> watchMutation$updateCart(
          WatchOptions$Mutation$updateCart options) =>
      this.watchMutation(options);
}

class Mutation$updateCart$update_restaurant_cart {
  Mutation$updateCart$update_restaurant_cart({
    required this.returning,
    required this.$__typename,
  });

  factory Mutation$updateCart$update_restaurant_cart.fromJson(
      Map<String, dynamic> json) {
    final l$returning = json['returning'];
    final l$$__typename = json['__typename'];
    return Mutation$updateCart$update_restaurant_cart(
      returning: (l$returning as List<dynamic>)
          .map((e) =>
              Mutation$updateCart$update_restaurant_cart$returning.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Mutation$updateCart$update_restaurant_cart$returning> returning;

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
    if (!(other is Mutation$updateCart$update_restaurant_cart) ||
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

extension UtilityExtension$Mutation$updateCart$update_restaurant_cart
    on Mutation$updateCart$update_restaurant_cart {
  CopyWith$Mutation$updateCart$update_restaurant_cart<
          Mutation$updateCart$update_restaurant_cart>
      get copyWith => CopyWith$Mutation$updateCart$update_restaurant_cart(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateCart$update_restaurant_cart<TRes> {
  factory CopyWith$Mutation$updateCart$update_restaurant_cart(
    Mutation$updateCart$update_restaurant_cart instance,
    TRes Function(Mutation$updateCart$update_restaurant_cart) then,
  ) = _CopyWithImpl$Mutation$updateCart$update_restaurant_cart;

  factory CopyWith$Mutation$updateCart$update_restaurant_cart.stub(TRes res) =
      _CopyWithStubImpl$Mutation$updateCart$update_restaurant_cart;

  TRes call({
    List<Mutation$updateCart$update_restaurant_cart$returning>? returning,
    String? $__typename,
  });
  TRes returning(
      Iterable<Mutation$updateCart$update_restaurant_cart$returning> Function(
              Iterable<
                  CopyWith$Mutation$updateCart$update_restaurant_cart$returning<
                      Mutation$updateCart$update_restaurant_cart$returning>>)
          _fn);
}

class _CopyWithImpl$Mutation$updateCart$update_restaurant_cart<TRes>
    implements CopyWith$Mutation$updateCart$update_restaurant_cart<TRes> {
  _CopyWithImpl$Mutation$updateCart$update_restaurant_cart(
    this._instance,
    this._then,
  );

  final Mutation$updateCart$update_restaurant_cart _instance;

  final TRes Function(Mutation$updateCart$update_restaurant_cart) _then;

  static const _undefined = {};

  TRes call({
    Object? returning = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateCart$update_restaurant_cart(
        returning: returning == _undefined || returning == null
            ? _instance.returning
            : (returning
                as List<Mutation$updateCart$update_restaurant_cart$returning>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes returning(
          Iterable<Mutation$updateCart$update_restaurant_cart$returning> Function(
                  Iterable<
                      CopyWith$Mutation$updateCart$update_restaurant_cart$returning<
                          Mutation$updateCart$update_restaurant_cart$returning>>)
              _fn) =>
      call(
          returning: _fn(_instance.returning.map((e) =>
              CopyWith$Mutation$updateCart$update_restaurant_cart$returning(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Mutation$updateCart$update_restaurant_cart<TRes>
    implements CopyWith$Mutation$updateCart$update_restaurant_cart<TRes> {
  _CopyWithStubImpl$Mutation$updateCart$update_restaurant_cart(this._res);

  TRes _res;

  call({
    List<Mutation$updateCart$update_restaurant_cart$returning>? returning,
    String? $__typename,
  }) =>
      _res;
  returning(_fn) => _res;
}

class Mutation$updateCart$update_restaurant_cart$returning {
  Mutation$updateCart$update_restaurant_cart$returning({
    this.restaurant,
    required this.$__typename,
  });

  factory Mutation$updateCart$update_restaurant_cart$returning.fromJson(
      Map<String, dynamic> json) {
    final l$restaurant = json['restaurant'];
    final l$$__typename = json['__typename'];
    return Mutation$updateCart$update_restaurant_cart$returning(
      restaurant: l$restaurant == null
          ? null
          : Mutation$updateCart$update_restaurant_cart$returning$restaurant
              .fromJson((l$restaurant as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$updateCart$update_restaurant_cart$returning$restaurant?
      restaurant;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant = restaurant;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$restaurant,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$updateCart$update_restaurant_cart$returning) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (l$restaurant != lOther$restaurant) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$updateCart$update_restaurant_cart$returning
    on Mutation$updateCart$update_restaurant_cart$returning {
  CopyWith$Mutation$updateCart$update_restaurant_cart$returning<
          Mutation$updateCart$update_restaurant_cart$returning>
      get copyWith =>
          CopyWith$Mutation$updateCart$update_restaurant_cart$returning(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateCart$update_restaurant_cart$returning<
    TRes> {
  factory CopyWith$Mutation$updateCart$update_restaurant_cart$returning(
    Mutation$updateCart$update_restaurant_cart$returning instance,
    TRes Function(Mutation$updateCart$update_restaurant_cart$returning) then,
  ) = _CopyWithImpl$Mutation$updateCart$update_restaurant_cart$returning;

  factory CopyWith$Mutation$updateCart$update_restaurant_cart$returning.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateCart$update_restaurant_cart$returning;

  TRes call({
    Mutation$updateCart$update_restaurant_cart$returning$restaurant? restaurant,
    String? $__typename,
  });
  CopyWith$Mutation$updateCart$update_restaurant_cart$returning$restaurant<TRes>
      get restaurant;
}

class _CopyWithImpl$Mutation$updateCart$update_restaurant_cart$returning<TRes>
    implements
        CopyWith$Mutation$updateCart$update_restaurant_cart$returning<TRes> {
  _CopyWithImpl$Mutation$updateCart$update_restaurant_cart$returning(
    this._instance,
    this._then,
  );

  final Mutation$updateCart$update_restaurant_cart$returning _instance;

  final TRes Function(Mutation$updateCart$update_restaurant_cart$returning)
      _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateCart$update_restaurant_cart$returning(
        restaurant: restaurant == _undefined
            ? _instance.restaurant
            : (restaurant
                as Mutation$updateCart$update_restaurant_cart$returning$restaurant?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$updateCart$update_restaurant_cart$returning$restaurant<TRes>
      get restaurant {
    final local$restaurant = _instance.restaurant;
    return local$restaurant == null
        ? CopyWith$Mutation$updateCart$update_restaurant_cart$returning$restaurant
            .stub(_then(_instance))
        : CopyWith$Mutation$updateCart$update_restaurant_cart$returning$restaurant(
            local$restaurant, (e) => call(restaurant: e));
  }
}

class _CopyWithStubImpl$Mutation$updateCart$update_restaurant_cart$returning<
        TRes>
    implements
        CopyWith$Mutation$updateCart$update_restaurant_cart$returning<TRes> {
  _CopyWithStubImpl$Mutation$updateCart$update_restaurant_cart$returning(
      this._res);

  TRes _res;

  call({
    Mutation$updateCart$update_restaurant_cart$returning$restaurant? restaurant,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$updateCart$update_restaurant_cart$returning$restaurant<TRes>
      get restaurant =>
          CopyWith$Mutation$updateCart$update_restaurant_cart$returning$restaurant
              .stub(_res);
}

class Mutation$updateCart$update_restaurant_cart$returning$restaurant {
  Mutation$updateCart$update_restaurant_cart$returning$restaurant({
    required this.id,
    this.firebase_id,
    required this.image,
    required this.language_id,
    this.description_id,
    required this.location_gps,
    required this.location_text,
    required this.name,
    this.schedule,
    this.description,
    required this.approved,
    required this.open_status,
    required this.$__typename,
  });

  factory Mutation$updateCart$update_restaurant_cart$returning$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$firebase_id = json['firebase_id'];
    final l$image = json['image'];
    final l$language_id = json['language_id'];
    final l$description_id = json['description_id'];
    final l$location_gps = json['location_gps'];
    final l$location_text = json['location_text'];
    final l$name = json['name'];
    final l$schedule = json['schedule'];
    final l$description = json['description'];
    final l$approved = json['approved'];
    final l$open_status = json['open_status'];
    final l$$__typename = json['__typename'];
    return Mutation$updateCart$update_restaurant_cart$returning$restaurant(
      id: (l$id as int),
      firebase_id: (l$firebase_id as String?),
      image: (l$image as String),
      language_id: (l$language_id as String),
      description_id: (l$description_id as int?),
      location_gps: geographyFromJson(l$location_gps),
      location_text: (l$location_text as String),
      name: (l$name as String),
      schedule: l$schedule == null ? null : mapFromJson(l$schedule),
      description: l$description == null
          ? null
          : Mutation$updateCart$update_restaurant_cart$returning$restaurant$description
              .fromJson((l$description as Map<String, dynamic>)),
      approved: (l$approved as bool),
      open_status: (l$open_status as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? firebase_id;

  final String image;

  final String language_id;

  final int? description_id;

  final Geography location_gps;

  final String location_text;

  final String name;

  final dynamic? schedule;

  final Mutation$updateCart$update_restaurant_cart$returning$restaurant$description?
      description;

  final bool approved;

  final String open_status;

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
    final l$description_id = description_id;
    _resultData['description_id'] = l$description_id;
    final l$location_gps = location_gps;
    _resultData['location_gps'] = geographyToJson(l$location_gps);
    final l$location_text = location_text;
    _resultData['location_text'] = l$location_text;
    final l$name = name;
    _resultData['name'] = l$name;
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
    final l$firebase_id = firebase_id;
    final l$image = image;
    final l$language_id = language_id;
    final l$description_id = description_id;
    final l$location_gps = location_gps;
    final l$location_text = location_text;
    final l$name = name;
    final l$schedule = schedule;
    final l$description = description;
    final l$approved = approved;
    final l$open_status = open_status;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$firebase_id,
      l$image,
      l$language_id,
      l$description_id,
      l$location_gps,
      l$location_text,
      l$name,
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
            is Mutation$updateCart$update_restaurant_cart$returning$restaurant) ||
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
    final l$description_id = description_id;
    final lOther$description_id = other.description_id;
    if (l$description_id != lOther$description_id) {
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

extension UtilityExtension$Mutation$updateCart$update_restaurant_cart$returning$restaurant
    on Mutation$updateCart$update_restaurant_cart$returning$restaurant {
  CopyWith$Mutation$updateCart$update_restaurant_cart$returning$restaurant<
          Mutation$updateCart$update_restaurant_cart$returning$restaurant>
      get copyWith =>
          CopyWith$Mutation$updateCart$update_restaurant_cart$returning$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateCart$update_restaurant_cart$returning$restaurant<
    TRes> {
  factory CopyWith$Mutation$updateCart$update_restaurant_cart$returning$restaurant(
    Mutation$updateCart$update_restaurant_cart$returning$restaurant instance,
    TRes Function(
            Mutation$updateCart$update_restaurant_cart$returning$restaurant)
        then,
  ) = _CopyWithImpl$Mutation$updateCart$update_restaurant_cart$returning$restaurant;

  factory CopyWith$Mutation$updateCart$update_restaurant_cart$returning$restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateCart$update_restaurant_cart$returning$restaurant;

  TRes call({
    int? id,
    String? firebase_id,
    String? image,
    String? language_id,
    int? description_id,
    Geography? location_gps,
    String? location_text,
    String? name,
    dynamic? schedule,
    Mutation$updateCart$update_restaurant_cart$returning$restaurant$description?
        description,
    bool? approved,
    String? open_status,
    String? $__typename,
  });
  CopyWith$Mutation$updateCart$update_restaurant_cart$returning$restaurant$description<
      TRes> get description;
}

class _CopyWithImpl$Mutation$updateCart$update_restaurant_cart$returning$restaurant<
        TRes>
    implements
        CopyWith$Mutation$updateCart$update_restaurant_cart$returning$restaurant<
            TRes> {
  _CopyWithImpl$Mutation$updateCart$update_restaurant_cart$returning$restaurant(
    this._instance,
    this._then,
  );

  final Mutation$updateCart$update_restaurant_cart$returning$restaurant
      _instance;

  final TRes Function(
      Mutation$updateCart$update_restaurant_cart$returning$restaurant) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? firebase_id = _undefined,
    Object? image = _undefined,
    Object? language_id = _undefined,
    Object? description_id = _undefined,
    Object? location_gps = _undefined,
    Object? location_text = _undefined,
    Object? name = _undefined,
    Object? schedule = _undefined,
    Object? description = _undefined,
    Object? approved = _undefined,
    Object? open_status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateCart$update_restaurant_cart$returning$restaurant(
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
        description_id: description_id == _undefined
            ? _instance.description_id
            : (description_id as int?),
        location_gps: location_gps == _undefined || location_gps == null
            ? _instance.location_gps
            : (location_gps as Geography),
        location_text: location_text == _undefined || location_text == null
            ? _instance.location_text
            : (location_text as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        schedule: schedule == _undefined
            ? _instance.schedule
            : (schedule as dynamic?),
        description: description == _undefined
            ? _instance.description
            : (description
                as Mutation$updateCart$update_restaurant_cart$returning$restaurant$description?),
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
  CopyWith$Mutation$updateCart$update_restaurant_cart$returning$restaurant$description<
      TRes> get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Mutation$updateCart$update_restaurant_cart$returning$restaurant$description
            .stub(_then(_instance))
        : CopyWith$Mutation$updateCart$update_restaurant_cart$returning$restaurant$description(
            local$description, (e) => call(description: e));
  }
}

class _CopyWithStubImpl$Mutation$updateCart$update_restaurant_cart$returning$restaurant<
        TRes>
    implements
        CopyWith$Mutation$updateCart$update_restaurant_cart$returning$restaurant<
            TRes> {
  _CopyWithStubImpl$Mutation$updateCart$update_restaurant_cart$returning$restaurant(
      this._res);

  TRes _res;

  call({
    int? id,
    String? firebase_id,
    String? image,
    String? language_id,
    int? description_id,
    Geography? location_gps,
    String? location_text,
    String? name,
    dynamic? schedule,
    Mutation$updateCart$update_restaurant_cart$returning$restaurant$description?
        description,
    bool? approved,
    String? open_status,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$updateCart$update_restaurant_cart$returning$restaurant$description<
          TRes>
      get description =>
          CopyWith$Mutation$updateCart$update_restaurant_cart$returning$restaurant$description
              .stub(_res);
}

class Mutation$updateCart$update_restaurant_cart$returning$restaurant$description {
  Mutation$updateCart$update_restaurant_cart$returning$restaurant$description({
    required this.translations,
    required this.$__typename,
  });

  factory Mutation$updateCart$update_restaurant_cart$returning$restaurant$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Mutation$updateCart$update_restaurant_cart$returning$restaurant$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Mutation$updateCart$update_restaurant_cart$returning$restaurant$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Mutation$updateCart$update_restaurant_cart$returning$restaurant$description$translations>
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
            is Mutation$updateCart$update_restaurant_cart$returning$restaurant$description) ||
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

extension UtilityExtension$Mutation$updateCart$update_restaurant_cart$returning$restaurant$description
    on Mutation$updateCart$update_restaurant_cart$returning$restaurant$description {
  CopyWith$Mutation$updateCart$update_restaurant_cart$returning$restaurant$description<
          Mutation$updateCart$update_restaurant_cart$returning$restaurant$description>
      get copyWith =>
          CopyWith$Mutation$updateCart$update_restaurant_cart$returning$restaurant$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateCart$update_restaurant_cart$returning$restaurant$description<
    TRes> {
  factory CopyWith$Mutation$updateCart$update_restaurant_cart$returning$restaurant$description(
    Mutation$updateCart$update_restaurant_cart$returning$restaurant$description
        instance,
    TRes Function(
            Mutation$updateCart$update_restaurant_cart$returning$restaurant$description)
        then,
  ) = _CopyWithImpl$Mutation$updateCart$update_restaurant_cart$returning$restaurant$description;

  factory CopyWith$Mutation$updateCart$update_restaurant_cart$returning$restaurant$description.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateCart$update_restaurant_cart$returning$restaurant$description;

  TRes call({
    List<Mutation$updateCart$update_restaurant_cart$returning$restaurant$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Mutation$updateCart$update_restaurant_cart$returning$restaurant$description$translations> Function(
              Iterable<
                  CopyWith$Mutation$updateCart$update_restaurant_cart$returning$restaurant$description$translations<
                      Mutation$updateCart$update_restaurant_cart$returning$restaurant$description$translations>>)
          _fn);
}

class _CopyWithImpl$Mutation$updateCart$update_restaurant_cart$returning$restaurant$description<
        TRes>
    implements
        CopyWith$Mutation$updateCart$update_restaurant_cart$returning$restaurant$description<
            TRes> {
  _CopyWithImpl$Mutation$updateCart$update_restaurant_cart$returning$restaurant$description(
    this._instance,
    this._then,
  );

  final Mutation$updateCart$update_restaurant_cart$returning$restaurant$description
      _instance;

  final TRes Function(
          Mutation$updateCart$update_restaurant_cart$returning$restaurant$description)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$updateCart$update_restaurant_cart$returning$restaurant$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Mutation$updateCart$update_restaurant_cart$returning$restaurant$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Mutation$updateCart$update_restaurant_cart$returning$restaurant$description$translations> Function(
                  Iterable<
                      CopyWith$Mutation$updateCart$update_restaurant_cart$returning$restaurant$description$translations<
                          Mutation$updateCart$update_restaurant_cart$returning$restaurant$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Mutation$updateCart$update_restaurant_cart$returning$restaurant$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Mutation$updateCart$update_restaurant_cart$returning$restaurant$description<
        TRes>
    implements
        CopyWith$Mutation$updateCart$update_restaurant_cart$returning$restaurant$description<
            TRes> {
  _CopyWithStubImpl$Mutation$updateCart$update_restaurant_cart$returning$restaurant$description(
      this._res);

  TRes _res;

  call({
    List<Mutation$updateCart$update_restaurant_cart$returning$restaurant$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Mutation$updateCart$update_restaurant_cart$returning$restaurant$description$translations {
  Mutation$updateCart$update_restaurant_cart$returning$restaurant$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Mutation$updateCart$update_restaurant_cart$returning$restaurant$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Mutation$updateCart$update_restaurant_cart$returning$restaurant$description$translations(
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
            is Mutation$updateCart$update_restaurant_cart$returning$restaurant$description$translations) ||
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

extension UtilityExtension$Mutation$updateCart$update_restaurant_cart$returning$restaurant$description$translations
    on Mutation$updateCart$update_restaurant_cart$returning$restaurant$description$translations {
  CopyWith$Mutation$updateCart$update_restaurant_cart$returning$restaurant$description$translations<
          Mutation$updateCart$update_restaurant_cart$returning$restaurant$description$translations>
      get copyWith =>
          CopyWith$Mutation$updateCart$update_restaurant_cart$returning$restaurant$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateCart$update_restaurant_cart$returning$restaurant$description$translations<
    TRes> {
  factory CopyWith$Mutation$updateCart$update_restaurant_cart$returning$restaurant$description$translations(
    Mutation$updateCart$update_restaurant_cart$returning$restaurant$description$translations
        instance,
    TRes Function(
            Mutation$updateCart$update_restaurant_cart$returning$restaurant$description$translations)
        then,
  ) = _CopyWithImpl$Mutation$updateCart$update_restaurant_cart$returning$restaurant$description$translations;

  factory CopyWith$Mutation$updateCart$update_restaurant_cart$returning$restaurant$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateCart$update_restaurant_cart$returning$restaurant$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$updateCart$update_restaurant_cart$returning$restaurant$description$translations<
        TRes>
    implements
        CopyWith$Mutation$updateCart$update_restaurant_cart$returning$restaurant$description$translations<
            TRes> {
  _CopyWithImpl$Mutation$updateCart$update_restaurant_cart$returning$restaurant$description$translations(
    this._instance,
    this._then,
  );

  final Mutation$updateCart$update_restaurant_cart$returning$restaurant$description$translations
      _instance;

  final TRes Function(
          Mutation$updateCart$update_restaurant_cart$returning$restaurant$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$updateCart$update_restaurant_cart$returning$restaurant$description$translations(
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

class _CopyWithStubImpl$Mutation$updateCart$update_restaurant_cart$returning$restaurant$description$translations<
        TRes>
    implements
        CopyWith$Mutation$updateCart$update_restaurant_cart$returning$restaurant$description$translations<
            TRes> {
  _CopyWithStubImpl$Mutation$updateCart$update_restaurant_cart$returning$restaurant$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Mutation$updateCart$delete_restaurant_cart_item {
  Mutation$updateCart$delete_restaurant_cart_item({
    required this.affected_rows,
    required this.$__typename,
  });

  factory Mutation$updateCart$delete_restaurant_cart_item.fromJson(
      Map<String, dynamic> json) {
    final l$affected_rows = json['affected_rows'];
    final l$$__typename = json['__typename'];
    return Mutation$updateCart$delete_restaurant_cart_item(
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
    if (!(other is Mutation$updateCart$delete_restaurant_cart_item) ||
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

extension UtilityExtension$Mutation$updateCart$delete_restaurant_cart_item
    on Mutation$updateCart$delete_restaurant_cart_item {
  CopyWith$Mutation$updateCart$delete_restaurant_cart_item<
          Mutation$updateCart$delete_restaurant_cart_item>
      get copyWith => CopyWith$Mutation$updateCart$delete_restaurant_cart_item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateCart$delete_restaurant_cart_item<TRes> {
  factory CopyWith$Mutation$updateCart$delete_restaurant_cart_item(
    Mutation$updateCart$delete_restaurant_cart_item instance,
    TRes Function(Mutation$updateCart$delete_restaurant_cart_item) then,
  ) = _CopyWithImpl$Mutation$updateCart$delete_restaurant_cart_item;

  factory CopyWith$Mutation$updateCart$delete_restaurant_cart_item.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateCart$delete_restaurant_cart_item;

  TRes call({
    int? affected_rows,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$updateCart$delete_restaurant_cart_item<TRes>
    implements CopyWith$Mutation$updateCart$delete_restaurant_cart_item<TRes> {
  _CopyWithImpl$Mutation$updateCart$delete_restaurant_cart_item(
    this._instance,
    this._then,
  );

  final Mutation$updateCart$delete_restaurant_cart_item _instance;

  final TRes Function(Mutation$updateCart$delete_restaurant_cart_item) _then;

  static const _undefined = {};

  TRes call({
    Object? affected_rows = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateCart$delete_restaurant_cart_item(
        affected_rows: affected_rows == _undefined || affected_rows == null
            ? _instance.affected_rows
            : (affected_rows as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$updateCart$delete_restaurant_cart_item<TRes>
    implements CopyWith$Mutation$updateCart$delete_restaurant_cart_item<TRes> {
  _CopyWithStubImpl$Mutation$updateCart$delete_restaurant_cart_item(this._res);

  TRes _res;

  call({
    int? affected_rows,
    String? $__typename,
  }) =>
      _res;
}

class Mutation$updateCart$insert_restaurant_cart_item {
  Mutation$updateCart$insert_restaurant_cart_item({
    required this.returning,
    required this.$__typename,
  });

  factory Mutation$updateCart$insert_restaurant_cart_item.fromJson(
      Map<String, dynamic> json) {
    final l$returning = json['returning'];
    final l$$__typename = json['__typename'];
    return Mutation$updateCart$insert_restaurant_cart_item(
      returning: (l$returning as List<dynamic>)
          .map((e) => Mutation$updateCart$insert_restaurant_cart_item$returning
              .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Mutation$updateCart$insert_restaurant_cart_item$returning>
      returning;

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
    if (!(other is Mutation$updateCart$insert_restaurant_cart_item) ||
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

extension UtilityExtension$Mutation$updateCart$insert_restaurant_cart_item
    on Mutation$updateCart$insert_restaurant_cart_item {
  CopyWith$Mutation$updateCart$insert_restaurant_cart_item<
          Mutation$updateCart$insert_restaurant_cart_item>
      get copyWith => CopyWith$Mutation$updateCart$insert_restaurant_cart_item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateCart$insert_restaurant_cart_item<TRes> {
  factory CopyWith$Mutation$updateCart$insert_restaurant_cart_item(
    Mutation$updateCart$insert_restaurant_cart_item instance,
    TRes Function(Mutation$updateCart$insert_restaurant_cart_item) then,
  ) = _CopyWithImpl$Mutation$updateCart$insert_restaurant_cart_item;

  factory CopyWith$Mutation$updateCart$insert_restaurant_cart_item.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateCart$insert_restaurant_cart_item;

  TRes call({
    List<Mutation$updateCart$insert_restaurant_cart_item$returning>? returning,
    String? $__typename,
  });
  TRes returning(
      Iterable<Mutation$updateCart$insert_restaurant_cart_item$returning> Function(
              Iterable<
                  CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning<
                      Mutation$updateCart$insert_restaurant_cart_item$returning>>)
          _fn);
}

class _CopyWithImpl$Mutation$updateCart$insert_restaurant_cart_item<TRes>
    implements CopyWith$Mutation$updateCart$insert_restaurant_cart_item<TRes> {
  _CopyWithImpl$Mutation$updateCart$insert_restaurant_cart_item(
    this._instance,
    this._then,
  );

  final Mutation$updateCart$insert_restaurant_cart_item _instance;

  final TRes Function(Mutation$updateCart$insert_restaurant_cart_item) _then;

  static const _undefined = {};

  TRes call({
    Object? returning = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateCart$insert_restaurant_cart_item(
        returning: returning == _undefined || returning == null
            ? _instance.returning
            : (returning as List<
                Mutation$updateCart$insert_restaurant_cart_item$returning>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes returning(
          Iterable<Mutation$updateCart$insert_restaurant_cart_item$returning> Function(
                  Iterable<
                      CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning<
                          Mutation$updateCart$insert_restaurant_cart_item$returning>>)
              _fn) =>
      call(
          returning: _fn(_instance.returning.map((e) =>
              CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Mutation$updateCart$insert_restaurant_cart_item<TRes>
    implements CopyWith$Mutation$updateCart$insert_restaurant_cart_item<TRes> {
  _CopyWithStubImpl$Mutation$updateCart$insert_restaurant_cart_item(this._res);

  TRes _res;

  call({
    List<Mutation$updateCart$insert_restaurant_cart_item$returning>? returning,
    String? $__typename,
  }) =>
      _res;
  returning(_fn) => _res;
}

class Mutation$updateCart$insert_restaurant_cart_item$returning {
  Mutation$updateCart$insert_restaurant_cart_item$returning({
    required this.restaurant_item,
    required this.cost_per_one,
    required this.id,
    this.note,
    required this.quantity,
    required this.$__typename,
  });

  factory Mutation$updateCart$insert_restaurant_cart_item$returning.fromJson(
      Map<String, dynamic> json) {
    final l$restaurant_item = json['restaurant_item'];
    final l$cost_per_one = json['cost_per_one'];
    final l$id = json['id'];
    final l$note = json['note'];
    final l$quantity = json['quantity'];
    final l$$__typename = json['__typename'];
    return Mutation$updateCart$insert_restaurant_cart_item$returning(
      restaurant_item:
          Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item
              .fromJson((l$restaurant_item as Map<String, dynamic>)),
      cost_per_one: moneyFromJson(l$cost_per_one),
      id: (l$id as int),
      note: (l$note as String?),
      quantity: (l$quantity as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item
      restaurant_item;

  final double cost_per_one;

  final int id;

  final String? note;

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
    final l$note = note;
    _resultData['note'] = l$note;
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
    final l$note = note;
    final l$quantity = quantity;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$restaurant_item,
      l$cost_per_one,
      l$id,
      l$note,
      l$quantity,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$updateCart$insert_restaurant_cart_item$returning) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$updateCart$insert_restaurant_cart_item$returning
    on Mutation$updateCart$insert_restaurant_cart_item$returning {
  CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning<
          Mutation$updateCart$insert_restaurant_cart_item$returning>
      get copyWith =>
          CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning<
    TRes> {
  factory CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning(
    Mutation$updateCart$insert_restaurant_cart_item$returning instance,
    TRes Function(Mutation$updateCart$insert_restaurant_cart_item$returning)
        then,
  ) = _CopyWithImpl$Mutation$updateCart$insert_restaurant_cart_item$returning;

  factory CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateCart$insert_restaurant_cart_item$returning;

  TRes call({
    Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item?
        restaurant_item,
    double? cost_per_one,
    int? id,
    String? note,
    int? quantity,
    String? $__typename,
  });
  CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item<
      TRes> get restaurant_item;
}

class _CopyWithImpl$Mutation$updateCart$insert_restaurant_cart_item$returning<
        TRes>
    implements
        CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning<
            TRes> {
  _CopyWithImpl$Mutation$updateCart$insert_restaurant_cart_item$returning(
    this._instance,
    this._then,
  );

  final Mutation$updateCart$insert_restaurant_cart_item$returning _instance;

  final TRes Function(Mutation$updateCart$insert_restaurant_cart_item$returning)
      _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_item = _undefined,
    Object? cost_per_one = _undefined,
    Object? id = _undefined,
    Object? note = _undefined,
    Object? quantity = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateCart$insert_restaurant_cart_item$returning(
        restaurant_item: restaurant_item == _undefined ||
                restaurant_item == null
            ? _instance.restaurant_item
            : (restaurant_item
                as Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item),
        cost_per_one: cost_per_one == _undefined || cost_per_one == null
            ? _instance.cost_per_one
            : (cost_per_one as double),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        note: note == _undefined ? _instance.note : (note as String?),
        quantity: quantity == _undefined || quantity == null
            ? _instance.quantity
            : (quantity as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item<
      TRes> get restaurant_item {
    final local$restaurant_item = _instance.restaurant_item;
    return CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item(
        local$restaurant_item, (e) => call(restaurant_item: e));
  }
}

class _CopyWithStubImpl$Mutation$updateCart$insert_restaurant_cart_item$returning<
        TRes>
    implements
        CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning<
            TRes> {
  _CopyWithStubImpl$Mutation$updateCart$insert_restaurant_cart_item$returning(
      this._res);

  TRes _res;

  call({
    Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item?
        restaurant_item,
    double? cost_per_one,
    int? id,
    String? note,
    int? quantity,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item<
          TRes>
      get restaurant_item =>
          CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item
              .stub(_res);
}

class Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item {
  Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item({
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

  factory Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item.fromJson(
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
    return Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item(
      item_type: (l$item_type as String),
      name:
          Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name
              .fromJson((l$name as Map<String, dynamic>)),
      description: l$description == null
          ? null
          : Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description
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

  final Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name
      name;

  final Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description?
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
            is Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item) ||
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

extension UtilityExtension$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item
    on Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item {
  CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item<
          Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item>
      get copyWith =>
          CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item<
    TRes> {
  factory CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item(
    Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item
        instance,
    TRes Function(
            Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item)
        then,
  ) = _CopyWithImpl$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item;

  factory CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item;

  TRes call({
    String? item_type,
    Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name?
        name,
    Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description?
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
  CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name<
      TRes> get name;
  CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description<
      TRes> get description;
}

class _CopyWithImpl$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item<
        TRes>
    implements
        CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item<
            TRes> {
  _CopyWithImpl$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item(
    this._instance,
    this._then,
  );

  final Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item
      _instance;

  final TRes Function(
          Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item)
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
          Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item(
        item_type: item_type == _undefined || item_type == null
            ? _instance.item_type
            : (item_type as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name),
        description: description == _undefined
            ? _instance.description
            : (description
                as Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description?),
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
  CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name<
      TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name(
        local$name, (e) => call(name: e));
  }

  CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description<
      TRes> get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description
            .stub(_then(_instance))
        : CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description(
            local$description, (e) => call(description: e));
  }
}

class _CopyWithStubImpl$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item<
        TRes>
    implements
        CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item<
            TRes> {
  _CopyWithStubImpl$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item(
      this._res);

  TRes _res;

  call({
    String? item_type,
    Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name?
        name,
    Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description?
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
  CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name<
          TRes>
      get name =>
          CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name
              .stub(_res);
  CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description<
          TRes>
      get description =>
          CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description
              .stub(_res);
}

class Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name {
  Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name({
    required this.translations,
    required this.$__typename,
  });

  factory Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name$translations>
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
            is Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name) ||
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

extension UtilityExtension$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name
    on Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name {
  CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name<
          Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name>
      get copyWith =>
          CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name<
    TRes> {
  factory CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name(
    Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name
        instance,
    TRes Function(
            Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name)
        then,
  ) = _CopyWithImpl$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name;

  factory CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name;

  TRes call({
    List<Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name$translations> Function(
              Iterable<
                  CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name$translations<
                      Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name$translations>>)
          _fn);
}

class _CopyWithImpl$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name<
        TRes>
    implements
        CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name<
            TRes> {
  _CopyWithImpl$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name(
    this._instance,
    this._then,
  );

  final Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name
      _instance;

  final TRes Function(
          Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name$translations> Function(
                  Iterable<
                      CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name$translations<
                          Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name<
        TRes>
    implements
        CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name<
            TRes> {
  _CopyWithStubImpl$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name(
      this._res);

  TRes _res;

  call({
    List<Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name$translations {
  Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name$translations(
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
            is Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name$translations) ||
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

extension UtilityExtension$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name$translations
    on Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name$translations {
  CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name$translations<
          Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name$translations>
      get copyWith =>
          CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name$translations<
    TRes> {
  factory CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name$translations(
    Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name$translations
        instance,
    TRes Function(
            Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name$translations)
        then,
  ) = _CopyWithImpl$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name$translations;

  factory CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name$translations<
        TRes>
    implements
        CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name$translations<
            TRes> {
  _CopyWithImpl$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name$translations(
    this._instance,
    this._then,
  );

  final Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name$translations
      _instance;

  final TRes Function(
          Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name$translations(
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

class _CopyWithStubImpl$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name$translations<
        TRes>
    implements
        CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name$translations<
            TRes> {
  _CopyWithStubImpl$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description {
  Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description({
    required this.translations,
    required this.$__typename,
  });

  factory Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description$translations>
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
            is Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description) ||
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

extension UtilityExtension$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description
    on Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description {
  CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description<
          Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description>
      get copyWith =>
          CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description<
    TRes> {
  factory CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description(
    Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description
        instance,
    TRes Function(
            Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description)
        then,
  ) = _CopyWithImpl$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description;

  factory CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description;

  TRes call({
    List<Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description$translations> Function(
              Iterable<
                  CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description$translations<
                      Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description$translations>>)
          _fn);
}

class _CopyWithImpl$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description<
        TRes>
    implements
        CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description<
            TRes> {
  _CopyWithImpl$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description(
    this._instance,
    this._then,
  );

  final Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description
      _instance;

  final TRes Function(
          Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description$translations> Function(
                  Iterable<
                      CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description$translations<
                          Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description<
        TRes>
    implements
        CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description<
            TRes> {
  _CopyWithStubImpl$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description(
      this._res);

  TRes _res;

  call({
    List<Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description$translations {
  Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description$translations(
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
            is Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description$translations) ||
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

extension UtilityExtension$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description$translations
    on Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description$translations {
  CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description$translations<
          Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description$translations>
      get copyWith =>
          CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description$translations<
    TRes> {
  factory CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description$translations(
    Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description$translations
        instance,
    TRes Function(
            Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description$translations)
        then,
  ) = _CopyWithImpl$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description$translations;

  factory CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description$translations<
        TRes>
    implements
        CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description$translations<
            TRes> {
  _CopyWithImpl$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description$translations(
    this._instance,
    this._then,
  );

  final Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description$translations
      _instance;

  final TRes Function(
          Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description$translations(
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

class _CopyWithStubImpl$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description$translations<
        TRes>
    implements
        CopyWith$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description$translations<
            TRes> {
  _CopyWithStubImpl$Mutation$updateCart$insert_restaurant_cart_item$returning$restaurant_item$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}
