import '../../__generated/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$addItem {
  factory Variables$Mutation$addItem(
          {required Input$restaurant_item_insert_input item}) =>
      Variables$Mutation$addItem._({
        r'item': item,
      });

  Variables$Mutation$addItem._(this._$data);

  factory Variables$Mutation$addItem.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$item = data['item'];
    result$data['item'] = Input$restaurant_item_insert_input.fromJson(
        (l$item as Map<String, dynamic>));
    return Variables$Mutation$addItem._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$restaurant_item_insert_input get item =>
      (_$data['item'] as Input$restaurant_item_insert_input);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$item = item;
    result$data['item'] = l$item.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$addItem<Variables$Mutation$addItem>
      get copyWith => CopyWith$Variables$Mutation$addItem(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$addItem) ||
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

abstract class CopyWith$Variables$Mutation$addItem<TRes> {
  factory CopyWith$Variables$Mutation$addItem(
    Variables$Mutation$addItem instance,
    TRes Function(Variables$Mutation$addItem) then,
  ) = _CopyWithImpl$Variables$Mutation$addItem;

  factory CopyWith$Variables$Mutation$addItem.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$addItem;

  TRes call({Input$restaurant_item_insert_input? item});
}

class _CopyWithImpl$Variables$Mutation$addItem<TRes>
    implements CopyWith$Variables$Mutation$addItem<TRes> {
  _CopyWithImpl$Variables$Mutation$addItem(
    this._instance,
    this._then,
  );

  final Variables$Mutation$addItem _instance;

  final TRes Function(Variables$Mutation$addItem) _then;

  static const _undefined = {};

  TRes call({Object? item = _undefined}) => _then(Variables$Mutation$addItem._({
        ..._instance._$data,
        if (item != _undefined && item != null)
          'item': (item as Input$restaurant_item_insert_input),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$addItem<TRes>
    implements CopyWith$Variables$Mutation$addItem<TRes> {
  _CopyWithStubImpl$Variables$Mutation$addItem(this._res);

  TRes _res;

  call({Input$restaurant_item_insert_input? item}) => _res;
}

class Mutation$addItem {
  Mutation$addItem({
    this.insert_restaurant_item_one,
    required this.$__typename,
  });

  factory Mutation$addItem.fromJson(Map<String, dynamic> json) {
    final l$insert_restaurant_item_one = json['insert_restaurant_item_one'];
    final l$$__typename = json['__typename'];
    return Mutation$addItem(
      insert_restaurant_item_one: l$insert_restaurant_item_one == null
          ? null
          : Mutation$addItem$insert_restaurant_item_one.fromJson(
              (l$insert_restaurant_item_one as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$addItem$insert_restaurant_item_one? insert_restaurant_item_one;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insert_restaurant_item_one = insert_restaurant_item_one;
    _resultData['insert_restaurant_item_one'] =
        l$insert_restaurant_item_one?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insert_restaurant_item_one = insert_restaurant_item_one;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$insert_restaurant_item_one,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$addItem) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$insert_restaurant_item_one = insert_restaurant_item_one;
    final lOther$insert_restaurant_item_one = other.insert_restaurant_item_one;
    if (l$insert_restaurant_item_one != lOther$insert_restaurant_item_one) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$addItem on Mutation$addItem {
  CopyWith$Mutation$addItem<Mutation$addItem> get copyWith =>
      CopyWith$Mutation$addItem(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$addItem<TRes> {
  factory CopyWith$Mutation$addItem(
    Mutation$addItem instance,
    TRes Function(Mutation$addItem) then,
  ) = _CopyWithImpl$Mutation$addItem;

  factory CopyWith$Mutation$addItem.stub(TRes res) =
      _CopyWithStubImpl$Mutation$addItem;

  TRes call({
    Mutation$addItem$insert_restaurant_item_one? insert_restaurant_item_one,
    String? $__typename,
  });
  CopyWith$Mutation$addItem$insert_restaurant_item_one<TRes>
      get insert_restaurant_item_one;
}

class _CopyWithImpl$Mutation$addItem<TRes>
    implements CopyWith$Mutation$addItem<TRes> {
  _CopyWithImpl$Mutation$addItem(
    this._instance,
    this._then,
  );

  final Mutation$addItem _instance;

  final TRes Function(Mutation$addItem) _then;

  static const _undefined = {};

  TRes call({
    Object? insert_restaurant_item_one = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$addItem(
        insert_restaurant_item_one: insert_restaurant_item_one == _undefined
            ? _instance.insert_restaurant_item_one
            : (insert_restaurant_item_one
                as Mutation$addItem$insert_restaurant_item_one?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$addItem$insert_restaurant_item_one<TRes>
      get insert_restaurant_item_one {
    final local$insert_restaurant_item_one =
        _instance.insert_restaurant_item_one;
    return local$insert_restaurant_item_one == null
        ? CopyWith$Mutation$addItem$insert_restaurant_item_one.stub(
            _then(_instance))
        : CopyWith$Mutation$addItem$insert_restaurant_item_one(
            local$insert_restaurant_item_one,
            (e) => call(insert_restaurant_item_one: e));
  }
}

class _CopyWithStubImpl$Mutation$addItem<TRes>
    implements CopyWith$Mutation$addItem<TRes> {
  _CopyWithStubImpl$Mutation$addItem(this._res);

  TRes _res;

  call({
    Mutation$addItem$insert_restaurant_item_one? insert_restaurant_item_one,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$addItem$insert_restaurant_item_one<TRes>
      get insert_restaurant_item_one =>
          CopyWith$Mutation$addItem$insert_restaurant_item_one.stub(_res);
}

const documentNodeMutationaddItem = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'addItem'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'item')),
        type: NamedTypeNode(
          name: NameNode(value: 'restaurant_item_insert_input'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'insert_restaurant_item_one'),
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
Mutation$addItem _parserFn$Mutation$addItem(Map<String, dynamic> data) =>
    Mutation$addItem.fromJson(data);
typedef OnMutationCompleted$Mutation$addItem = FutureOr<void> Function(
  dynamic,
  Mutation$addItem?,
);

class Options$Mutation$addItem
    extends graphql.MutationOptions<Mutation$addItem> {
  Options$Mutation$addItem({
    String? operationName,
    required Variables$Mutation$addItem variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$addItem? onCompleted,
    graphql.OnMutationUpdate<Mutation$addItem>? update,
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
                    data == null ? null : _parserFn$Mutation$addItem(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationaddItem,
          parserFn: _parserFn$Mutation$addItem,
        );

  final OnMutationCompleted$Mutation$addItem? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$addItem
    extends graphql.WatchQueryOptions<Mutation$addItem> {
  WatchOptions$Mutation$addItem({
    String? operationName,
    required Variables$Mutation$addItem variables,
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
          document: documentNodeMutationaddItem,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$addItem,
        );
}

extension ClientExtension$Mutation$addItem on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$addItem>> mutate$addItem(
          Options$Mutation$addItem options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$addItem> watchMutation$addItem(
          WatchOptions$Mutation$addItem options) =>
      this.watchMutation(options);
}

class Mutation$addItem$insert_restaurant_item_one {
  Mutation$addItem$insert_restaurant_item_one({
    required this.id,
    required this.$__typename,
  });

  factory Mutation$addItem$insert_restaurant_item_one.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$addItem$insert_restaurant_item_one(
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
    if (!(other is Mutation$addItem$insert_restaurant_item_one) ||
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

extension UtilityExtension$Mutation$addItem$insert_restaurant_item_one
    on Mutation$addItem$insert_restaurant_item_one {
  CopyWith$Mutation$addItem$insert_restaurant_item_one<
          Mutation$addItem$insert_restaurant_item_one>
      get copyWith => CopyWith$Mutation$addItem$insert_restaurant_item_one(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$addItem$insert_restaurant_item_one<TRes> {
  factory CopyWith$Mutation$addItem$insert_restaurant_item_one(
    Mutation$addItem$insert_restaurant_item_one instance,
    TRes Function(Mutation$addItem$insert_restaurant_item_one) then,
  ) = _CopyWithImpl$Mutation$addItem$insert_restaurant_item_one;

  factory CopyWith$Mutation$addItem$insert_restaurant_item_one.stub(TRes res) =
      _CopyWithStubImpl$Mutation$addItem$insert_restaurant_item_one;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$addItem$insert_restaurant_item_one<TRes>
    implements CopyWith$Mutation$addItem$insert_restaurant_item_one<TRes> {
  _CopyWithImpl$Mutation$addItem$insert_restaurant_item_one(
    this._instance,
    this._then,
  );

  final Mutation$addItem$insert_restaurant_item_one _instance;

  final TRes Function(Mutation$addItem$insert_restaurant_item_one) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$addItem$insert_restaurant_item_one(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$addItem$insert_restaurant_item_one<TRes>
    implements CopyWith$Mutation$addItem$insert_restaurant_item_one<TRes> {
  _CopyWithStubImpl$Mutation$addItem$insert_restaurant_item_one(this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}
