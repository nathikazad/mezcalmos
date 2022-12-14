import '../../__generated/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

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
            name: NameNode(value: 'description'),
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
            name: NameNode(value: 'cost'),
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
            name: NameNode(value: 'category_id'),
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
    required this.name,
    this.description,
    required this.cost,
    required this.position,
    this.category_id,
    required this.item_type,
    required this.available,
    required this.restaurant_id,
    this.special_period_end,
    this.special_period_start,
    required this.$__typename,
  });

  factory Mutation$addItem$insert_restaurant_item_one.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$description = json['description'];
    final l$cost = json['cost'];
    final l$position = json['position'];
    final l$category_id = json['category_id'];
    final l$item_type = json['item_type'];
    final l$available = json['available'];
    final l$restaurant_id = json['restaurant_id'];
    final l$special_period_end = json['special_period_end'];
    final l$special_period_start = json['special_period_start'];
    final l$$__typename = json['__typename'];
    return Mutation$addItem$insert_restaurant_item_one(
      id: (l$id as int),
      name: Mutation$addItem$insert_restaurant_item_one$name.fromJson(
          (l$name as Map<String, dynamic>)),
      description: l$description == null
          ? null
          : Mutation$addItem$insert_restaurant_item_one$description.fromJson(
              (l$description as Map<String, dynamic>)),
      cost: moneyFromJson(l$cost),
      position: (l$position as int),
      category_id: (l$category_id as int?),
      item_type: (l$item_type as String),
      available: (l$available as bool),
      restaurant_id: (l$restaurant_id as int),
      special_period_end: (l$special_period_end as String?),
      special_period_start: (l$special_period_start as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Mutation$addItem$insert_restaurant_item_one$name name;

  final Mutation$addItem$insert_restaurant_item_one$description? description;

  final double cost;

  final int position;

  final int? category_id;

  final String item_type;

  final bool available;

  final int restaurant_id;

  final String? special_period_end;

  final String? special_period_start;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
    final l$cost = cost;
    _resultData['cost'] = moneyToJson(l$cost);
    final l$position = position;
    _resultData['position'] = l$position;
    final l$category_id = category_id;
    _resultData['category_id'] = l$category_id;
    final l$item_type = item_type;
    _resultData['item_type'] = l$item_type;
    final l$available = available;
    _resultData['available'] = l$available;
    final l$restaurant_id = restaurant_id;
    _resultData['restaurant_id'] = l$restaurant_id;
    final l$special_period_end = special_period_end;
    _resultData['special_period_end'] = l$special_period_end;
    final l$special_period_start = special_period_start;
    _resultData['special_period_start'] = l$special_period_start;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$description = description;
    final l$cost = cost;
    final l$position = position;
    final l$category_id = category_id;
    final l$item_type = item_type;
    final l$available = available;
    final l$restaurant_id = restaurant_id;
    final l$special_period_end = special_period_end;
    final l$special_period_start = special_period_start;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$description,
      l$cost,
      l$position,
      l$category_id,
      l$item_type,
      l$available,
      l$restaurant_id,
      l$special_period_end,
      l$special_period_start,
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
    final l$cost = cost;
    final lOther$cost = other.cost;
    if (l$cost != lOther$cost) {
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
    final l$item_type = item_type;
    final lOther$item_type = other.item_type;
    if (l$item_type != lOther$item_type) {
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
    Mutation$addItem$insert_restaurant_item_one$name? name,
    Mutation$addItem$insert_restaurant_item_one$description? description,
    double? cost,
    int? position,
    int? category_id,
    String? item_type,
    bool? available,
    int? restaurant_id,
    String? special_period_end,
    String? special_period_start,
    String? $__typename,
  });
  CopyWith$Mutation$addItem$insert_restaurant_item_one$name<TRes> get name;
  CopyWith$Mutation$addItem$insert_restaurant_item_one$description<TRes>
      get description;
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
    Object? name = _undefined,
    Object? description = _undefined,
    Object? cost = _undefined,
    Object? position = _undefined,
    Object? category_id = _undefined,
    Object? item_type = _undefined,
    Object? available = _undefined,
    Object? restaurant_id = _undefined,
    Object? special_period_end = _undefined,
    Object? special_period_start = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$addItem$insert_restaurant_item_one(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as Mutation$addItem$insert_restaurant_item_one$name),
        description: description == _undefined
            ? _instance.description
            : (description
                as Mutation$addItem$insert_restaurant_item_one$description?),
        cost: cost == _undefined || cost == null
            ? _instance.cost
            : (cost as double),
        position: position == _undefined || position == null
            ? _instance.position
            : (position as int),
        category_id: category_id == _undefined
            ? _instance.category_id
            : (category_id as int?),
        item_type: item_type == _undefined || item_type == null
            ? _instance.item_type
            : (item_type as String),
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
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$addItem$insert_restaurant_item_one$name<TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Mutation$addItem$insert_restaurant_item_one$name(
        local$name, (e) => call(name: e));
  }

  CopyWith$Mutation$addItem$insert_restaurant_item_one$description<TRes>
      get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Mutation$addItem$insert_restaurant_item_one$description.stub(
            _then(_instance))
        : CopyWith$Mutation$addItem$insert_restaurant_item_one$description(
            local$description, (e) => call(description: e));
  }
}

class _CopyWithStubImpl$Mutation$addItem$insert_restaurant_item_one<TRes>
    implements CopyWith$Mutation$addItem$insert_restaurant_item_one<TRes> {
  _CopyWithStubImpl$Mutation$addItem$insert_restaurant_item_one(this._res);

  TRes _res;

  call({
    int? id,
    Mutation$addItem$insert_restaurant_item_one$name? name,
    Mutation$addItem$insert_restaurant_item_one$description? description,
    double? cost,
    int? position,
    int? category_id,
    String? item_type,
    bool? available,
    int? restaurant_id,
    String? special_period_end,
    String? special_period_start,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$addItem$insert_restaurant_item_one$name<TRes> get name =>
      CopyWith$Mutation$addItem$insert_restaurant_item_one$name.stub(_res);
  CopyWith$Mutation$addItem$insert_restaurant_item_one$description<TRes>
      get description =>
          CopyWith$Mutation$addItem$insert_restaurant_item_one$description.stub(
              _res);
}

class Mutation$addItem$insert_restaurant_item_one$name {
  Mutation$addItem$insert_restaurant_item_one$name({
    required this.translations,
    required this.id,
    required this.$__typename,
  });

  factory Mutation$addItem$insert_restaurant_item_one$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$addItem$insert_restaurant_item_one$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Mutation$addItem$insert_restaurant_item_one$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      id: (l$id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Mutation$addItem$insert_restaurant_item_one$name$translations>
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
    if (!(other is Mutation$addItem$insert_restaurant_item_one$name) ||
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

extension UtilityExtension$Mutation$addItem$insert_restaurant_item_one$name
    on Mutation$addItem$insert_restaurant_item_one$name {
  CopyWith$Mutation$addItem$insert_restaurant_item_one$name<
          Mutation$addItem$insert_restaurant_item_one$name>
      get copyWith => CopyWith$Mutation$addItem$insert_restaurant_item_one$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$addItem$insert_restaurant_item_one$name<TRes> {
  factory CopyWith$Mutation$addItem$insert_restaurant_item_one$name(
    Mutation$addItem$insert_restaurant_item_one$name instance,
    TRes Function(Mutation$addItem$insert_restaurant_item_one$name) then,
  ) = _CopyWithImpl$Mutation$addItem$insert_restaurant_item_one$name;

  factory CopyWith$Mutation$addItem$insert_restaurant_item_one$name.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$addItem$insert_restaurant_item_one$name;

  TRes call({
    List<Mutation$addItem$insert_restaurant_item_one$name$translations>?
        translations,
    int? id,
    String? $__typename,
  });
  TRes translations(
      Iterable<Mutation$addItem$insert_restaurant_item_one$name$translations> Function(
              Iterable<
                  CopyWith$Mutation$addItem$insert_restaurant_item_one$name$translations<
                      Mutation$addItem$insert_restaurant_item_one$name$translations>>)
          _fn);
}

class _CopyWithImpl$Mutation$addItem$insert_restaurant_item_one$name<TRes>
    implements CopyWith$Mutation$addItem$insert_restaurant_item_one$name<TRes> {
  _CopyWithImpl$Mutation$addItem$insert_restaurant_item_one$name(
    this._instance,
    this._then,
  );

  final Mutation$addItem$insert_restaurant_item_one$name _instance;

  final TRes Function(Mutation$addItem$insert_restaurant_item_one$name) _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$addItem$insert_restaurant_item_one$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Mutation$addItem$insert_restaurant_item_one$name$translations>),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Mutation$addItem$insert_restaurant_item_one$name$translations> Function(
                  Iterable<
                      CopyWith$Mutation$addItem$insert_restaurant_item_one$name$translations<
                          Mutation$addItem$insert_restaurant_item_one$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Mutation$addItem$insert_restaurant_item_one$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Mutation$addItem$insert_restaurant_item_one$name<TRes>
    implements CopyWith$Mutation$addItem$insert_restaurant_item_one$name<TRes> {
  _CopyWithStubImpl$Mutation$addItem$insert_restaurant_item_one$name(this._res);

  TRes _res;

  call({
    List<Mutation$addItem$insert_restaurant_item_one$name$translations>?
        translations,
    int? id,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Mutation$addItem$insert_restaurant_item_one$name$translations {
  Mutation$addItem$insert_restaurant_item_one$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Mutation$addItem$insert_restaurant_item_one$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Mutation$addItem$insert_restaurant_item_one$name$translations(
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
            is Mutation$addItem$insert_restaurant_item_one$name$translations) ||
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

extension UtilityExtension$Mutation$addItem$insert_restaurant_item_one$name$translations
    on Mutation$addItem$insert_restaurant_item_one$name$translations {
  CopyWith$Mutation$addItem$insert_restaurant_item_one$name$translations<
          Mutation$addItem$insert_restaurant_item_one$name$translations>
      get copyWith =>
          CopyWith$Mutation$addItem$insert_restaurant_item_one$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$addItem$insert_restaurant_item_one$name$translations<
    TRes> {
  factory CopyWith$Mutation$addItem$insert_restaurant_item_one$name$translations(
    Mutation$addItem$insert_restaurant_item_one$name$translations instance,
    TRes Function(Mutation$addItem$insert_restaurant_item_one$name$translations)
        then,
  ) = _CopyWithImpl$Mutation$addItem$insert_restaurant_item_one$name$translations;

  factory CopyWith$Mutation$addItem$insert_restaurant_item_one$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$addItem$insert_restaurant_item_one$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$addItem$insert_restaurant_item_one$name$translations<
        TRes>
    implements
        CopyWith$Mutation$addItem$insert_restaurant_item_one$name$translations<
            TRes> {
  _CopyWithImpl$Mutation$addItem$insert_restaurant_item_one$name$translations(
    this._instance,
    this._then,
  );

  final Mutation$addItem$insert_restaurant_item_one$name$translations _instance;

  final TRes Function(
      Mutation$addItem$insert_restaurant_item_one$name$translations) _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$addItem$insert_restaurant_item_one$name$translations(
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

class _CopyWithStubImpl$Mutation$addItem$insert_restaurant_item_one$name$translations<
        TRes>
    implements
        CopyWith$Mutation$addItem$insert_restaurant_item_one$name$translations<
            TRes> {
  _CopyWithStubImpl$Mutation$addItem$insert_restaurant_item_one$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Mutation$addItem$insert_restaurant_item_one$description {
  Mutation$addItem$insert_restaurant_item_one$description({
    required this.id,
    required this.translations,
    required this.$__typename,
  });

  factory Mutation$addItem$insert_restaurant_item_one$description.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Mutation$addItem$insert_restaurant_item_one$description(
      id: (l$id as int),
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Mutation$addItem$insert_restaurant_item_one$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final List<
          Mutation$addItem$insert_restaurant_item_one$description$translations>
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
    if (!(other is Mutation$addItem$insert_restaurant_item_one$description) ||
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

extension UtilityExtension$Mutation$addItem$insert_restaurant_item_one$description
    on Mutation$addItem$insert_restaurant_item_one$description {
  CopyWith$Mutation$addItem$insert_restaurant_item_one$description<
          Mutation$addItem$insert_restaurant_item_one$description>
      get copyWith =>
          CopyWith$Mutation$addItem$insert_restaurant_item_one$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$addItem$insert_restaurant_item_one$description<
    TRes> {
  factory CopyWith$Mutation$addItem$insert_restaurant_item_one$description(
    Mutation$addItem$insert_restaurant_item_one$description instance,
    TRes Function(Mutation$addItem$insert_restaurant_item_one$description) then,
  ) = _CopyWithImpl$Mutation$addItem$insert_restaurant_item_one$description;

  factory CopyWith$Mutation$addItem$insert_restaurant_item_one$description.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$addItem$insert_restaurant_item_one$description;

  TRes call({
    int? id,
    List<Mutation$addItem$insert_restaurant_item_one$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Mutation$addItem$insert_restaurant_item_one$description$translations> Function(
              Iterable<
                  CopyWith$Mutation$addItem$insert_restaurant_item_one$description$translations<
                      Mutation$addItem$insert_restaurant_item_one$description$translations>>)
          _fn);
}

class _CopyWithImpl$Mutation$addItem$insert_restaurant_item_one$description<
        TRes>
    implements
        CopyWith$Mutation$addItem$insert_restaurant_item_one$description<TRes> {
  _CopyWithImpl$Mutation$addItem$insert_restaurant_item_one$description(
    this._instance,
    this._then,
  );

  final Mutation$addItem$insert_restaurant_item_one$description _instance;

  final TRes Function(Mutation$addItem$insert_restaurant_item_one$description)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$addItem$insert_restaurant_item_one$description(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Mutation$addItem$insert_restaurant_item_one$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Mutation$addItem$insert_restaurant_item_one$description$translations> Function(
                  Iterable<
                      CopyWith$Mutation$addItem$insert_restaurant_item_one$description$translations<
                          Mutation$addItem$insert_restaurant_item_one$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Mutation$addItem$insert_restaurant_item_one$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Mutation$addItem$insert_restaurant_item_one$description<
        TRes>
    implements
        CopyWith$Mutation$addItem$insert_restaurant_item_one$description<TRes> {
  _CopyWithStubImpl$Mutation$addItem$insert_restaurant_item_one$description(
      this._res);

  TRes _res;

  call({
    int? id,
    List<Mutation$addItem$insert_restaurant_item_one$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Mutation$addItem$insert_restaurant_item_one$description$translations {
  Mutation$addItem$insert_restaurant_item_one$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Mutation$addItem$insert_restaurant_item_one$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Mutation$addItem$insert_restaurant_item_one$description$translations(
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
            is Mutation$addItem$insert_restaurant_item_one$description$translations) ||
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

extension UtilityExtension$Mutation$addItem$insert_restaurant_item_one$description$translations
    on Mutation$addItem$insert_restaurant_item_one$description$translations {
  CopyWith$Mutation$addItem$insert_restaurant_item_one$description$translations<
          Mutation$addItem$insert_restaurant_item_one$description$translations>
      get copyWith =>
          CopyWith$Mutation$addItem$insert_restaurant_item_one$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$addItem$insert_restaurant_item_one$description$translations<
    TRes> {
  factory CopyWith$Mutation$addItem$insert_restaurant_item_one$description$translations(
    Mutation$addItem$insert_restaurant_item_one$description$translations
        instance,
    TRes Function(
            Mutation$addItem$insert_restaurant_item_one$description$translations)
        then,
  ) = _CopyWithImpl$Mutation$addItem$insert_restaurant_item_one$description$translations;

  factory CopyWith$Mutation$addItem$insert_restaurant_item_one$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$addItem$insert_restaurant_item_one$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$addItem$insert_restaurant_item_one$description$translations<
        TRes>
    implements
        CopyWith$Mutation$addItem$insert_restaurant_item_one$description$translations<
            TRes> {
  _CopyWithImpl$Mutation$addItem$insert_restaurant_item_one$description$translations(
    this._instance,
    this._then,
  );

  final Mutation$addItem$insert_restaurant_item_one$description$translations
      _instance;

  final TRes Function(
          Mutation$addItem$insert_restaurant_item_one$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$addItem$insert_restaurant_item_one$description$translations(
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

class _CopyWithStubImpl$Mutation$addItem$insert_restaurant_item_one$description$translations<
        TRes>
    implements
        CopyWith$Mutation$addItem$insert_restaurant_item_one$description$translations<
            TRes> {
  _CopyWithStubImpl$Mutation$addItem$insert_restaurant_item_one$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$deleteItem {
  factory Variables$Mutation$deleteItem({required int itemId}) =>
      Variables$Mutation$deleteItem._({
        r'itemId': itemId,
      });

  Variables$Mutation$deleteItem._(this._$data);

  factory Variables$Mutation$deleteItem.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$itemId = data['itemId'];
    result$data['itemId'] = (l$itemId as int);
    return Variables$Mutation$deleteItem._(result$data);
  }

  Map<String, dynamic> _$data;

  int get itemId => (_$data['itemId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$itemId = itemId;
    result$data['itemId'] = l$itemId;
    return result$data;
  }

  CopyWith$Variables$Mutation$deleteItem<Variables$Mutation$deleteItem>
      get copyWith => CopyWith$Variables$Mutation$deleteItem(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$deleteItem) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$itemId = itemId;
    final lOther$itemId = other.itemId;
    if (l$itemId != lOther$itemId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$itemId = itemId;
    return Object.hashAll([l$itemId]);
  }
}

abstract class CopyWith$Variables$Mutation$deleteItem<TRes> {
  factory CopyWith$Variables$Mutation$deleteItem(
    Variables$Mutation$deleteItem instance,
    TRes Function(Variables$Mutation$deleteItem) then,
  ) = _CopyWithImpl$Variables$Mutation$deleteItem;

  factory CopyWith$Variables$Mutation$deleteItem.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$deleteItem;

  TRes call({int? itemId});
}

class _CopyWithImpl$Variables$Mutation$deleteItem<TRes>
    implements CopyWith$Variables$Mutation$deleteItem<TRes> {
  _CopyWithImpl$Variables$Mutation$deleteItem(
    this._instance,
    this._then,
  );

  final Variables$Mutation$deleteItem _instance;

  final TRes Function(Variables$Mutation$deleteItem) _then;

  static const _undefined = {};

  TRes call({Object? itemId = _undefined}) =>
      _then(Variables$Mutation$deleteItem._({
        ..._instance._$data,
        if (itemId != _undefined && itemId != null) 'itemId': (itemId as int),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$deleteItem<TRes>
    implements CopyWith$Variables$Mutation$deleteItem<TRes> {
  _CopyWithStubImpl$Variables$Mutation$deleteItem(this._res);

  TRes _res;

  call({int? itemId}) => _res;
}

class Mutation$deleteItem {
  Mutation$deleteItem({
    this.delete_restaurant_item_by_pk,
    required this.$__typename,
  });

  factory Mutation$deleteItem.fromJson(Map<String, dynamic> json) {
    final l$delete_restaurant_item_by_pk = json['delete_restaurant_item_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$deleteItem(
      delete_restaurant_item_by_pk: l$delete_restaurant_item_by_pk == null
          ? null
          : Mutation$deleteItem$delete_restaurant_item_by_pk.fromJson(
              (l$delete_restaurant_item_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$deleteItem$delete_restaurant_item_by_pk?
      delete_restaurant_item_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delete_restaurant_item_by_pk = delete_restaurant_item_by_pk;
    _resultData['delete_restaurant_item_by_pk'] =
        l$delete_restaurant_item_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delete_restaurant_item_by_pk = delete_restaurant_item_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$delete_restaurant_item_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$deleteItem) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$delete_restaurant_item_by_pk = delete_restaurant_item_by_pk;
    final lOther$delete_restaurant_item_by_pk =
        other.delete_restaurant_item_by_pk;
    if (l$delete_restaurant_item_by_pk != lOther$delete_restaurant_item_by_pk) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$deleteItem on Mutation$deleteItem {
  CopyWith$Mutation$deleteItem<Mutation$deleteItem> get copyWith =>
      CopyWith$Mutation$deleteItem(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$deleteItem<TRes> {
  factory CopyWith$Mutation$deleteItem(
    Mutation$deleteItem instance,
    TRes Function(Mutation$deleteItem) then,
  ) = _CopyWithImpl$Mutation$deleteItem;

  factory CopyWith$Mutation$deleteItem.stub(TRes res) =
      _CopyWithStubImpl$Mutation$deleteItem;

  TRes call({
    Mutation$deleteItem$delete_restaurant_item_by_pk?
        delete_restaurant_item_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$deleteItem$delete_restaurant_item_by_pk<TRes>
      get delete_restaurant_item_by_pk;
}

class _CopyWithImpl$Mutation$deleteItem<TRes>
    implements CopyWith$Mutation$deleteItem<TRes> {
  _CopyWithImpl$Mutation$deleteItem(
    this._instance,
    this._then,
  );

  final Mutation$deleteItem _instance;

  final TRes Function(Mutation$deleteItem) _then;

  static const _undefined = {};

  TRes call({
    Object? delete_restaurant_item_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$deleteItem(
        delete_restaurant_item_by_pk: delete_restaurant_item_by_pk == _undefined
            ? _instance.delete_restaurant_item_by_pk
            : (delete_restaurant_item_by_pk
                as Mutation$deleteItem$delete_restaurant_item_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$deleteItem$delete_restaurant_item_by_pk<TRes>
      get delete_restaurant_item_by_pk {
    final local$delete_restaurant_item_by_pk =
        _instance.delete_restaurant_item_by_pk;
    return local$delete_restaurant_item_by_pk == null
        ? CopyWith$Mutation$deleteItem$delete_restaurant_item_by_pk.stub(
            _then(_instance))
        : CopyWith$Mutation$deleteItem$delete_restaurant_item_by_pk(
            local$delete_restaurant_item_by_pk,
            (e) => call(delete_restaurant_item_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$deleteItem<TRes>
    implements CopyWith$Mutation$deleteItem<TRes> {
  _CopyWithStubImpl$Mutation$deleteItem(this._res);

  TRes _res;

  call({
    Mutation$deleteItem$delete_restaurant_item_by_pk?
        delete_restaurant_item_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$deleteItem$delete_restaurant_item_by_pk<TRes>
      get delete_restaurant_item_by_pk =>
          CopyWith$Mutation$deleteItem$delete_restaurant_item_by_pk.stub(_res);
}

const documentNodeMutationdeleteItem = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'deleteItem'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'itemId')),
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
        name: NameNode(value: 'delete_restaurant_item_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'itemId')),
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
Mutation$deleteItem _parserFn$Mutation$deleteItem(Map<String, dynamic> data) =>
    Mutation$deleteItem.fromJson(data);
typedef OnMutationCompleted$Mutation$deleteItem = FutureOr<void> Function(
  dynamic,
  Mutation$deleteItem?,
);

class Options$Mutation$deleteItem
    extends graphql.MutationOptions<Mutation$deleteItem> {
  Options$Mutation$deleteItem({
    String? operationName,
    required Variables$Mutation$deleteItem variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$deleteItem? onCompleted,
    graphql.OnMutationUpdate<Mutation$deleteItem>? update,
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
                    data == null ? null : _parserFn$Mutation$deleteItem(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationdeleteItem,
          parserFn: _parserFn$Mutation$deleteItem,
        );

  final OnMutationCompleted$Mutation$deleteItem? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$deleteItem
    extends graphql.WatchQueryOptions<Mutation$deleteItem> {
  WatchOptions$Mutation$deleteItem({
    String? operationName,
    required Variables$Mutation$deleteItem variables,
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
          document: documentNodeMutationdeleteItem,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$deleteItem,
        );
}

extension ClientExtension$Mutation$deleteItem on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$deleteItem>> mutate$deleteItem(
          Options$Mutation$deleteItem options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$deleteItem> watchMutation$deleteItem(
          WatchOptions$Mutation$deleteItem options) =>
      this.watchMutation(options);
}

class Mutation$deleteItem$delete_restaurant_item_by_pk {
  Mutation$deleteItem$delete_restaurant_item_by_pk({
    required this.id,
    required this.$__typename,
  });

  factory Mutation$deleteItem$delete_restaurant_item_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$deleteItem$delete_restaurant_item_by_pk(
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
    if (!(other is Mutation$deleteItem$delete_restaurant_item_by_pk) ||
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

extension UtilityExtension$Mutation$deleteItem$delete_restaurant_item_by_pk
    on Mutation$deleteItem$delete_restaurant_item_by_pk {
  CopyWith$Mutation$deleteItem$delete_restaurant_item_by_pk<
          Mutation$deleteItem$delete_restaurant_item_by_pk>
      get copyWith => CopyWith$Mutation$deleteItem$delete_restaurant_item_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$deleteItem$delete_restaurant_item_by_pk<TRes> {
  factory CopyWith$Mutation$deleteItem$delete_restaurant_item_by_pk(
    Mutation$deleteItem$delete_restaurant_item_by_pk instance,
    TRes Function(Mutation$deleteItem$delete_restaurant_item_by_pk) then,
  ) = _CopyWithImpl$Mutation$deleteItem$delete_restaurant_item_by_pk;

  factory CopyWith$Mutation$deleteItem$delete_restaurant_item_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$deleteItem$delete_restaurant_item_by_pk;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$deleteItem$delete_restaurant_item_by_pk<TRes>
    implements CopyWith$Mutation$deleteItem$delete_restaurant_item_by_pk<TRes> {
  _CopyWithImpl$Mutation$deleteItem$delete_restaurant_item_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$deleteItem$delete_restaurant_item_by_pk _instance;

  final TRes Function(Mutation$deleteItem$delete_restaurant_item_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$deleteItem$delete_restaurant_item_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$deleteItem$delete_restaurant_item_by_pk<TRes>
    implements CopyWith$Mutation$deleteItem$delete_restaurant_item_by_pk<TRes> {
  _CopyWithStubImpl$Mutation$deleteItem$delete_restaurant_item_by_pk(this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$upadateItem {
  factory Variables$Mutation$upadateItem({
    required int id,
    required Input$restaurant_item_set_input itemData,
  }) =>
      Variables$Mutation$upadateItem._({
        r'id': id,
        r'itemData': itemData,
      });

  Variables$Mutation$upadateItem._(this._$data);

  factory Variables$Mutation$upadateItem.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    final l$itemData = data['itemData'];
    result$data['itemData'] = Input$restaurant_item_set_input.fromJson(
        (l$itemData as Map<String, dynamic>));
    return Variables$Mutation$upadateItem._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  Input$restaurant_item_set_input get itemData =>
      (_$data['itemData'] as Input$restaurant_item_set_input);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$itemData = itemData;
    result$data['itemData'] = l$itemData.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$upadateItem<Variables$Mutation$upadateItem>
      get copyWith => CopyWith$Variables$Mutation$upadateItem(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$upadateItem) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$itemData = itemData;
    final lOther$itemData = other.itemData;
    if (l$itemData != lOther$itemData) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$itemData = itemData;
    return Object.hashAll([
      l$id,
      l$itemData,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$upadateItem<TRes> {
  factory CopyWith$Variables$Mutation$upadateItem(
    Variables$Mutation$upadateItem instance,
    TRes Function(Variables$Mutation$upadateItem) then,
  ) = _CopyWithImpl$Variables$Mutation$upadateItem;

  factory CopyWith$Variables$Mutation$upadateItem.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$upadateItem;

  TRes call({
    int? id,
    Input$restaurant_item_set_input? itemData,
  });
}

class _CopyWithImpl$Variables$Mutation$upadateItem<TRes>
    implements CopyWith$Variables$Mutation$upadateItem<TRes> {
  _CopyWithImpl$Variables$Mutation$upadateItem(
    this._instance,
    this._then,
  );

  final Variables$Mutation$upadateItem _instance;

  final TRes Function(Variables$Mutation$upadateItem) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? itemData = _undefined,
  }) =>
      _then(Variables$Mutation$upadateItem._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
        if (itemData != _undefined && itemData != null)
          'itemData': (itemData as Input$restaurant_item_set_input),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$upadateItem<TRes>
    implements CopyWith$Variables$Mutation$upadateItem<TRes> {
  _CopyWithStubImpl$Variables$Mutation$upadateItem(this._res);

  TRes _res;

  call({
    int? id,
    Input$restaurant_item_set_input? itemData,
  }) =>
      _res;
}

class Mutation$upadateItem {
  Mutation$upadateItem({
    this.update_restaurant_item_by_pk,
    required this.$__typename,
  });

  factory Mutation$upadateItem.fromJson(Map<String, dynamic> json) {
    final l$update_restaurant_item_by_pk = json['update_restaurant_item_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$upadateItem(
      update_restaurant_item_by_pk: l$update_restaurant_item_by_pk == null
          ? null
          : Mutation$upadateItem$update_restaurant_item_by_pk.fromJson(
              (l$update_restaurant_item_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$upadateItem$update_restaurant_item_by_pk?
      update_restaurant_item_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_restaurant_item_by_pk = update_restaurant_item_by_pk;
    _resultData['update_restaurant_item_by_pk'] =
        l$update_restaurant_item_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_restaurant_item_by_pk = update_restaurant_item_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_restaurant_item_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$upadateItem) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_restaurant_item_by_pk = update_restaurant_item_by_pk;
    final lOther$update_restaurant_item_by_pk =
        other.update_restaurant_item_by_pk;
    if (l$update_restaurant_item_by_pk != lOther$update_restaurant_item_by_pk) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$upadateItem on Mutation$upadateItem {
  CopyWith$Mutation$upadateItem<Mutation$upadateItem> get copyWith =>
      CopyWith$Mutation$upadateItem(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$upadateItem<TRes> {
  factory CopyWith$Mutation$upadateItem(
    Mutation$upadateItem instance,
    TRes Function(Mutation$upadateItem) then,
  ) = _CopyWithImpl$Mutation$upadateItem;

  factory CopyWith$Mutation$upadateItem.stub(TRes res) =
      _CopyWithStubImpl$Mutation$upadateItem;

  TRes call({
    Mutation$upadateItem$update_restaurant_item_by_pk?
        update_restaurant_item_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$upadateItem$update_restaurant_item_by_pk<TRes>
      get update_restaurant_item_by_pk;
}

class _CopyWithImpl$Mutation$upadateItem<TRes>
    implements CopyWith$Mutation$upadateItem<TRes> {
  _CopyWithImpl$Mutation$upadateItem(
    this._instance,
    this._then,
  );

  final Mutation$upadateItem _instance;

  final TRes Function(Mutation$upadateItem) _then;

  static const _undefined = {};

  TRes call({
    Object? update_restaurant_item_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$upadateItem(
        update_restaurant_item_by_pk: update_restaurant_item_by_pk == _undefined
            ? _instance.update_restaurant_item_by_pk
            : (update_restaurant_item_by_pk
                as Mutation$upadateItem$update_restaurant_item_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$upadateItem$update_restaurant_item_by_pk<TRes>
      get update_restaurant_item_by_pk {
    final local$update_restaurant_item_by_pk =
        _instance.update_restaurant_item_by_pk;
    return local$update_restaurant_item_by_pk == null
        ? CopyWith$Mutation$upadateItem$update_restaurant_item_by_pk.stub(
            _then(_instance))
        : CopyWith$Mutation$upadateItem$update_restaurant_item_by_pk(
            local$update_restaurant_item_by_pk,
            (e) => call(update_restaurant_item_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$upadateItem<TRes>
    implements CopyWith$Mutation$upadateItem<TRes> {
  _CopyWithStubImpl$Mutation$upadateItem(this._res);

  TRes _res;

  call({
    Mutation$upadateItem$update_restaurant_item_by_pk?
        update_restaurant_item_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$upadateItem$update_restaurant_item_by_pk<TRes>
      get update_restaurant_item_by_pk =>
          CopyWith$Mutation$upadateItem$update_restaurant_item_by_pk.stub(_res);
}

const documentNodeMutationupadateItem = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'upadateItem'),
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
        variable: VariableNode(name: NameNode(value: 'itemData')),
        type: NamedTypeNode(
          name: NameNode(value: 'restaurant_item_set_input'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'update_restaurant_item_by_pk'),
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
Mutation$upadateItem _parserFn$Mutation$upadateItem(
        Map<String, dynamic> data) =>
    Mutation$upadateItem.fromJson(data);
typedef OnMutationCompleted$Mutation$upadateItem = FutureOr<void> Function(
  dynamic,
  Mutation$upadateItem?,
);

class Options$Mutation$upadateItem
    extends graphql.MutationOptions<Mutation$upadateItem> {
  Options$Mutation$upadateItem({
    String? operationName,
    required Variables$Mutation$upadateItem variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$upadateItem? onCompleted,
    graphql.OnMutationUpdate<Mutation$upadateItem>? update,
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
                    data == null ? null : _parserFn$Mutation$upadateItem(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupadateItem,
          parserFn: _parserFn$Mutation$upadateItem,
        );

  final OnMutationCompleted$Mutation$upadateItem? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$upadateItem
    extends graphql.WatchQueryOptions<Mutation$upadateItem> {
  WatchOptions$Mutation$upadateItem({
    String? operationName,
    required Variables$Mutation$upadateItem variables,
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
          document: documentNodeMutationupadateItem,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$upadateItem,
        );
}

extension ClientExtension$Mutation$upadateItem on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$upadateItem>> mutate$upadateItem(
          Options$Mutation$upadateItem options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$upadateItem> watchMutation$upadateItem(
          WatchOptions$Mutation$upadateItem options) =>
      this.watchMutation(options);
}

class Mutation$upadateItem$update_restaurant_item_by_pk {
  Mutation$upadateItem$update_restaurant_item_by_pk({
    required this.id,
    required this.$__typename,
  });

  factory Mutation$upadateItem$update_restaurant_item_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$upadateItem$update_restaurant_item_by_pk(
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
    if (!(other is Mutation$upadateItem$update_restaurant_item_by_pk) ||
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

extension UtilityExtension$Mutation$upadateItem$update_restaurant_item_by_pk
    on Mutation$upadateItem$update_restaurant_item_by_pk {
  CopyWith$Mutation$upadateItem$update_restaurant_item_by_pk<
          Mutation$upadateItem$update_restaurant_item_by_pk>
      get copyWith =>
          CopyWith$Mutation$upadateItem$update_restaurant_item_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$upadateItem$update_restaurant_item_by_pk<
    TRes> {
  factory CopyWith$Mutation$upadateItem$update_restaurant_item_by_pk(
    Mutation$upadateItem$update_restaurant_item_by_pk instance,
    TRes Function(Mutation$upadateItem$update_restaurant_item_by_pk) then,
  ) = _CopyWithImpl$Mutation$upadateItem$update_restaurant_item_by_pk;

  factory CopyWith$Mutation$upadateItem$update_restaurant_item_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$upadateItem$update_restaurant_item_by_pk;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$upadateItem$update_restaurant_item_by_pk<TRes>
    implements
        CopyWith$Mutation$upadateItem$update_restaurant_item_by_pk<TRes> {
  _CopyWithImpl$Mutation$upadateItem$update_restaurant_item_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$upadateItem$update_restaurant_item_by_pk _instance;

  final TRes Function(Mutation$upadateItem$update_restaurant_item_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$upadateItem$update_restaurant_item_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$upadateItem$update_restaurant_item_by_pk<TRes>
    implements
        CopyWith$Mutation$upadateItem$update_restaurant_item_by_pk<TRes> {
  _CopyWithStubImpl$Mutation$upadateItem$update_restaurant_item_by_pk(
      this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getItemById {
  factory Variables$Query$getItemById({required int id}) =>
      Variables$Query$getItemById._({
        r'id': id,
      });

  Variables$Query$getItemById._(this._$data);

  factory Variables$Query$getItemById.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    return Variables$Query$getItemById._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$getItemById<Variables$Query$getItemById>
      get copyWith => CopyWith$Variables$Query$getItemById(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getItemById) ||
        runtimeType != other.runtimeType) {
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
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Query$getItemById<TRes> {
  factory CopyWith$Variables$Query$getItemById(
    Variables$Query$getItemById instance,
    TRes Function(Variables$Query$getItemById) then,
  ) = _CopyWithImpl$Variables$Query$getItemById;

  factory CopyWith$Variables$Query$getItemById.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getItemById;

  TRes call({int? id});
}

class _CopyWithImpl$Variables$Query$getItemById<TRes>
    implements CopyWith$Variables$Query$getItemById<TRes> {
  _CopyWithImpl$Variables$Query$getItemById(
    this._instance,
    this._then,
  );

  final Variables$Query$getItemById _instance;

  final TRes Function(Variables$Query$getItemById) _then;

  static const _undefined = {};

  TRes call({Object? id = _undefined}) => _then(Variables$Query$getItemById._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getItemById<TRes>
    implements CopyWith$Variables$Query$getItemById<TRes> {
  _CopyWithStubImpl$Variables$Query$getItemById(this._res);

  TRes _res;

  call({int? id}) => _res;
}

class Query$getItemById {
  Query$getItemById({
    this.restaurant_item_by_pk,
    required this.$__typename,
  });

  factory Query$getItemById.fromJson(Map<String, dynamic> json) {
    final l$restaurant_item_by_pk = json['restaurant_item_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$getItemById(
      restaurant_item_by_pk: l$restaurant_item_by_pk == null
          ? null
          : Query$getItemById$restaurant_item_by_pk.fromJson(
              (l$restaurant_item_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getItemById$restaurant_item_by_pk? restaurant_item_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_item_by_pk = restaurant_item_by_pk;
    _resultData['restaurant_item_by_pk'] = l$restaurant_item_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_item_by_pk = restaurant_item_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$restaurant_item_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getItemById) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_item_by_pk = restaurant_item_by_pk;
    final lOther$restaurant_item_by_pk = other.restaurant_item_by_pk;
    if (l$restaurant_item_by_pk != lOther$restaurant_item_by_pk) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getItemById on Query$getItemById {
  CopyWith$Query$getItemById<Query$getItemById> get copyWith =>
      CopyWith$Query$getItemById(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getItemById<TRes> {
  factory CopyWith$Query$getItemById(
    Query$getItemById instance,
    TRes Function(Query$getItemById) then,
  ) = _CopyWithImpl$Query$getItemById;

  factory CopyWith$Query$getItemById.stub(TRes res) =
      _CopyWithStubImpl$Query$getItemById;

  TRes call({
    Query$getItemById$restaurant_item_by_pk? restaurant_item_by_pk,
    String? $__typename,
  });
  CopyWith$Query$getItemById$restaurant_item_by_pk<TRes>
      get restaurant_item_by_pk;
}

class _CopyWithImpl$Query$getItemById<TRes>
    implements CopyWith$Query$getItemById<TRes> {
  _CopyWithImpl$Query$getItemById(
    this._instance,
    this._then,
  );

  final Query$getItemById _instance;

  final TRes Function(Query$getItemById) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_item_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getItemById(
        restaurant_item_by_pk: restaurant_item_by_pk == _undefined
            ? _instance.restaurant_item_by_pk
            : (restaurant_item_by_pk
                as Query$getItemById$restaurant_item_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getItemById$restaurant_item_by_pk<TRes>
      get restaurant_item_by_pk {
    final local$restaurant_item_by_pk = _instance.restaurant_item_by_pk;
    return local$restaurant_item_by_pk == null
        ? CopyWith$Query$getItemById$restaurant_item_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$getItemById$restaurant_item_by_pk(
            local$restaurant_item_by_pk, (e) => call(restaurant_item_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$getItemById<TRes>
    implements CopyWith$Query$getItemById<TRes> {
  _CopyWithStubImpl$Query$getItemById(this._res);

  TRes _res;

  call({
    Query$getItemById$restaurant_item_by_pk? restaurant_item_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getItemById$restaurant_item_by_pk<TRes>
      get restaurant_item_by_pk =>
          CopyWith$Query$getItemById$restaurant_item_by_pk.stub(_res);
}

const documentNodeQuerygetItemById = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getItemById'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
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
        name: NameNode(value: 'restaurant_item_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
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
            name: NameNode(value: 'description'),
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
            name: NameNode(value: 'cost'),
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
            name: NameNode(value: 'category_id'),
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
Query$getItemById _parserFn$Query$getItemById(Map<String, dynamic> data) =>
    Query$getItemById.fromJson(data);

class Options$Query$getItemById
    extends graphql.QueryOptions<Query$getItemById> {
  Options$Query$getItemById({
    String? operationName,
    required Variables$Query$getItemById variables,
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
          document: documentNodeQuerygetItemById,
          parserFn: _parserFn$Query$getItemById,
        );
}

class WatchOptions$Query$getItemById
    extends graphql.WatchQueryOptions<Query$getItemById> {
  WatchOptions$Query$getItemById({
    String? operationName,
    required Variables$Query$getItemById variables,
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
          document: documentNodeQuerygetItemById,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getItemById,
        );
}

class FetchMoreOptions$Query$getItemById extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getItemById({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getItemById variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetItemById,
        );
}

extension ClientExtension$Query$getItemById on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getItemById>> query$getItemById(
          Options$Query$getItemById options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$getItemById> watchQuery$getItemById(
          WatchOptions$Query$getItemById options) =>
      this.watchQuery(options);
  void writeQuery$getItemById({
    required Query$getItemById data,
    required Variables$Query$getItemById variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQuerygetItemById),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getItemById? readQuery$getItemById({
    required Variables$Query$getItemById variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQuerygetItemById),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getItemById.fromJson(result);
  }
}

class Query$getItemById$restaurant_item_by_pk {
  Query$getItemById$restaurant_item_by_pk({
    required this.id,
    required this.name,
    this.description,
    required this.cost,
    required this.position,
    this.category_id,
    required this.item_type,
    required this.available,
    required this.restaurant_id,
    this.special_period_end,
    this.special_period_start,
    required this.options,
    required this.$__typename,
  });

  factory Query$getItemById$restaurant_item_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$description = json['description'];
    final l$cost = json['cost'];
    final l$position = json['position'];
    final l$category_id = json['category_id'];
    final l$item_type = json['item_type'];
    final l$available = json['available'];
    final l$restaurant_id = json['restaurant_id'];
    final l$special_period_end = json['special_period_end'];
    final l$special_period_start = json['special_period_start'];
    final l$options = json['options'];
    final l$$__typename = json['__typename'];
    return Query$getItemById$restaurant_item_by_pk(
      id: (l$id as int),
      name: Query$getItemById$restaurant_item_by_pk$name.fromJson(
          (l$name as Map<String, dynamic>)),
      description: l$description == null
          ? null
          : Query$getItemById$restaurant_item_by_pk$description.fromJson(
              (l$description as Map<String, dynamic>)),
      cost: moneyFromJson(l$cost),
      position: (l$position as int),
      category_id: (l$category_id as int?),
      item_type: (l$item_type as String),
      available: (l$available as bool),
      restaurant_id: (l$restaurant_id as int),
      special_period_end: (l$special_period_end as String?),
      special_period_start: (l$special_period_start as String?),
      options: (l$options as List<dynamic>)
          .map((e) => Query$getItemById$restaurant_item_by_pk$options.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$getItemById$restaurant_item_by_pk$name name;

  final Query$getItemById$restaurant_item_by_pk$description? description;

  final double cost;

  final int position;

  final int? category_id;

  final String item_type;

  final bool available;

  final int restaurant_id;

  final String? special_period_end;

  final String? special_period_start;

  final List<Query$getItemById$restaurant_item_by_pk$options> options;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
    final l$cost = cost;
    _resultData['cost'] = moneyToJson(l$cost);
    final l$position = position;
    _resultData['position'] = l$position;
    final l$category_id = category_id;
    _resultData['category_id'] = l$category_id;
    final l$item_type = item_type;
    _resultData['item_type'] = l$item_type;
    final l$available = available;
    _resultData['available'] = l$available;
    final l$restaurant_id = restaurant_id;
    _resultData['restaurant_id'] = l$restaurant_id;
    final l$special_period_end = special_period_end;
    _resultData['special_period_end'] = l$special_period_end;
    final l$special_period_start = special_period_start;
    _resultData['special_period_start'] = l$special_period_start;
    final l$options = options;
    _resultData['options'] = l$options.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$description = description;
    final l$cost = cost;
    final l$position = position;
    final l$category_id = category_id;
    final l$item_type = item_type;
    final l$available = available;
    final l$restaurant_id = restaurant_id;
    final l$special_period_end = special_period_end;
    final l$special_period_start = special_period_start;
    final l$options = options;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$description,
      l$cost,
      l$position,
      l$category_id,
      l$item_type,
      l$available,
      l$restaurant_id,
      l$special_period_end,
      l$special_period_start,
      Object.hashAll(l$options.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getItemById$restaurant_item_by_pk) ||
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
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$cost = cost;
    final lOther$cost = other.cost;
    if (l$cost != lOther$cost) {
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
    final l$item_type = item_type;
    final lOther$item_type = other.item_type;
    if (l$item_type != lOther$item_type) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getItemById$restaurant_item_by_pk
    on Query$getItemById$restaurant_item_by_pk {
  CopyWith$Query$getItemById$restaurant_item_by_pk<
          Query$getItemById$restaurant_item_by_pk>
      get copyWith => CopyWith$Query$getItemById$restaurant_item_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getItemById$restaurant_item_by_pk<TRes> {
  factory CopyWith$Query$getItemById$restaurant_item_by_pk(
    Query$getItemById$restaurant_item_by_pk instance,
    TRes Function(Query$getItemById$restaurant_item_by_pk) then,
  ) = _CopyWithImpl$Query$getItemById$restaurant_item_by_pk;

  factory CopyWith$Query$getItemById$restaurant_item_by_pk.stub(TRes res) =
      _CopyWithStubImpl$Query$getItemById$restaurant_item_by_pk;

  TRes call({
    int? id,
    Query$getItemById$restaurant_item_by_pk$name? name,
    Query$getItemById$restaurant_item_by_pk$description? description,
    double? cost,
    int? position,
    int? category_id,
    String? item_type,
    bool? available,
    int? restaurant_id,
    String? special_period_end,
    String? special_period_start,
    List<Query$getItemById$restaurant_item_by_pk$options>? options,
    String? $__typename,
  });
  CopyWith$Query$getItemById$restaurant_item_by_pk$name<TRes> get name;
  CopyWith$Query$getItemById$restaurant_item_by_pk$description<TRes>
      get description;
  TRes options(
      Iterable<Query$getItemById$restaurant_item_by_pk$options> Function(
              Iterable<
                  CopyWith$Query$getItemById$restaurant_item_by_pk$options<
                      Query$getItemById$restaurant_item_by_pk$options>>)
          _fn);
}

class _CopyWithImpl$Query$getItemById$restaurant_item_by_pk<TRes>
    implements CopyWith$Query$getItemById$restaurant_item_by_pk<TRes> {
  _CopyWithImpl$Query$getItemById$restaurant_item_by_pk(
    this._instance,
    this._then,
  );

  final Query$getItemById$restaurant_item_by_pk _instance;

  final TRes Function(Query$getItemById$restaurant_item_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? cost = _undefined,
    Object? position = _undefined,
    Object? category_id = _undefined,
    Object? item_type = _undefined,
    Object? available = _undefined,
    Object? restaurant_id = _undefined,
    Object? special_period_end = _undefined,
    Object? special_period_start = _undefined,
    Object? options = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getItemById$restaurant_item_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as Query$getItemById$restaurant_item_by_pk$name),
        description: description == _undefined
            ? _instance.description
            : (description
                as Query$getItemById$restaurant_item_by_pk$description?),
        cost: cost == _undefined || cost == null
            ? _instance.cost
            : (cost as double),
        position: position == _undefined || position == null
            ? _instance.position
            : (position as int),
        category_id: category_id == _undefined
            ? _instance.category_id
            : (category_id as int?),
        item_type: item_type == _undefined || item_type == null
            ? _instance.item_type
            : (item_type as String),
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
        options: options == _undefined || options == null
            ? _instance.options
            : (options
                as List<Query$getItemById$restaurant_item_by_pk$options>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getItemById$restaurant_item_by_pk$name<TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Query$getItemById$restaurant_item_by_pk$name(
        local$name, (e) => call(name: e));
  }

  CopyWith$Query$getItemById$restaurant_item_by_pk$description<TRes>
      get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Query$getItemById$restaurant_item_by_pk$description.stub(
            _then(_instance))
        : CopyWith$Query$getItemById$restaurant_item_by_pk$description(
            local$description, (e) => call(description: e));
  }

  TRes options(
          Iterable<Query$getItemById$restaurant_item_by_pk$options> Function(
                  Iterable<
                      CopyWith$Query$getItemById$restaurant_item_by_pk$options<
                          Query$getItemById$restaurant_item_by_pk$options>>)
              _fn) =>
      call(
          options: _fn(_instance.options.map(
              (e) => CopyWith$Query$getItemById$restaurant_item_by_pk$options(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getItemById$restaurant_item_by_pk<TRes>
    implements CopyWith$Query$getItemById$restaurant_item_by_pk<TRes> {
  _CopyWithStubImpl$Query$getItemById$restaurant_item_by_pk(this._res);

  TRes _res;

  call({
    int? id,
    Query$getItemById$restaurant_item_by_pk$name? name,
    Query$getItemById$restaurant_item_by_pk$description? description,
    double? cost,
    int? position,
    int? category_id,
    String? item_type,
    bool? available,
    int? restaurant_id,
    String? special_period_end,
    String? special_period_start,
    List<Query$getItemById$restaurant_item_by_pk$options>? options,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getItemById$restaurant_item_by_pk$name<TRes> get name =>
      CopyWith$Query$getItemById$restaurant_item_by_pk$name.stub(_res);
  CopyWith$Query$getItemById$restaurant_item_by_pk$description<TRes>
      get description =>
          CopyWith$Query$getItemById$restaurant_item_by_pk$description.stub(
              _res);
  options(_fn) => _res;
}

class Query$getItemById$restaurant_item_by_pk$name {
  Query$getItemById$restaurant_item_by_pk$name({
    required this.translations,
    required this.id,
    required this.$__typename,
  });

  factory Query$getItemById$restaurant_item_by_pk$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Query$getItemById$restaurant_item_by_pk$name(
      translations: (l$translations as List<dynamic>)
          .map((e) => Query$getItemById$restaurant_item_by_pk$name$translations
              .fromJson((e as Map<String, dynamic>)))
          .toList(),
      id: (l$id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getItemById$restaurant_item_by_pk$name$translations>
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
    if (!(other is Query$getItemById$restaurant_item_by_pk$name) ||
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

extension UtilityExtension$Query$getItemById$restaurant_item_by_pk$name
    on Query$getItemById$restaurant_item_by_pk$name {
  CopyWith$Query$getItemById$restaurant_item_by_pk$name<
          Query$getItemById$restaurant_item_by_pk$name>
      get copyWith => CopyWith$Query$getItemById$restaurant_item_by_pk$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getItemById$restaurant_item_by_pk$name<TRes> {
  factory CopyWith$Query$getItemById$restaurant_item_by_pk$name(
    Query$getItemById$restaurant_item_by_pk$name instance,
    TRes Function(Query$getItemById$restaurant_item_by_pk$name) then,
  ) = _CopyWithImpl$Query$getItemById$restaurant_item_by_pk$name;

  factory CopyWith$Query$getItemById$restaurant_item_by_pk$name.stub(TRes res) =
      _CopyWithStubImpl$Query$getItemById$restaurant_item_by_pk$name;

  TRes call({
    List<Query$getItemById$restaurant_item_by_pk$name$translations>?
        translations,
    int? id,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getItemById$restaurant_item_by_pk$name$translations> Function(
              Iterable<
                  CopyWith$Query$getItemById$restaurant_item_by_pk$name$translations<
                      Query$getItemById$restaurant_item_by_pk$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getItemById$restaurant_item_by_pk$name<TRes>
    implements CopyWith$Query$getItemById$restaurant_item_by_pk$name<TRes> {
  _CopyWithImpl$Query$getItemById$restaurant_item_by_pk$name(
    this._instance,
    this._then,
  );

  final Query$getItemById$restaurant_item_by_pk$name _instance;

  final TRes Function(Query$getItemById$restaurant_item_by_pk$name) _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getItemById$restaurant_item_by_pk$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getItemById$restaurant_item_by_pk$name$translations>),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getItemById$restaurant_item_by_pk$name$translations> Function(
                  Iterable<
                      CopyWith$Query$getItemById$restaurant_item_by_pk$name$translations<
                          Query$getItemById$restaurant_item_by_pk$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getItemById$restaurant_item_by_pk$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getItemById$restaurant_item_by_pk$name<TRes>
    implements CopyWith$Query$getItemById$restaurant_item_by_pk$name<TRes> {
  _CopyWithStubImpl$Query$getItemById$restaurant_item_by_pk$name(this._res);

  TRes _res;

  call({
    List<Query$getItemById$restaurant_item_by_pk$name$translations>?
        translations,
    int? id,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getItemById$restaurant_item_by_pk$name$translations {
  Query$getItemById$restaurant_item_by_pk$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getItemById$restaurant_item_by_pk$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getItemById$restaurant_item_by_pk$name$translations(
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
    if (!(other is Query$getItemById$restaurant_item_by_pk$name$translations) ||
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

extension UtilityExtension$Query$getItemById$restaurant_item_by_pk$name$translations
    on Query$getItemById$restaurant_item_by_pk$name$translations {
  CopyWith$Query$getItemById$restaurant_item_by_pk$name$translations<
          Query$getItemById$restaurant_item_by_pk$name$translations>
      get copyWith =>
          CopyWith$Query$getItemById$restaurant_item_by_pk$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getItemById$restaurant_item_by_pk$name$translations<
    TRes> {
  factory CopyWith$Query$getItemById$restaurant_item_by_pk$name$translations(
    Query$getItemById$restaurant_item_by_pk$name$translations instance,
    TRes Function(Query$getItemById$restaurant_item_by_pk$name$translations)
        then,
  ) = _CopyWithImpl$Query$getItemById$restaurant_item_by_pk$name$translations;

  factory CopyWith$Query$getItemById$restaurant_item_by_pk$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getItemById$restaurant_item_by_pk$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getItemById$restaurant_item_by_pk$name$translations<
        TRes>
    implements
        CopyWith$Query$getItemById$restaurant_item_by_pk$name$translations<
            TRes> {
  _CopyWithImpl$Query$getItemById$restaurant_item_by_pk$name$translations(
    this._instance,
    this._then,
  );

  final Query$getItemById$restaurant_item_by_pk$name$translations _instance;

  final TRes Function(Query$getItemById$restaurant_item_by_pk$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getItemById$restaurant_item_by_pk$name$translations(
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

class _CopyWithStubImpl$Query$getItemById$restaurant_item_by_pk$name$translations<
        TRes>
    implements
        CopyWith$Query$getItemById$restaurant_item_by_pk$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$getItemById$restaurant_item_by_pk$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$getItemById$restaurant_item_by_pk$description {
  Query$getItemById$restaurant_item_by_pk$description({
    required this.id,
    required this.translations,
    required this.$__typename,
  });

  factory Query$getItemById$restaurant_item_by_pk$description.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getItemById$restaurant_item_by_pk$description(
      id: (l$id as int),
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getItemById$restaurant_item_by_pk$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final List<Query$getItemById$restaurant_item_by_pk$description$translations>
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
    if (!(other is Query$getItemById$restaurant_item_by_pk$description) ||
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

extension UtilityExtension$Query$getItemById$restaurant_item_by_pk$description
    on Query$getItemById$restaurant_item_by_pk$description {
  CopyWith$Query$getItemById$restaurant_item_by_pk$description<
          Query$getItemById$restaurant_item_by_pk$description>
      get copyWith =>
          CopyWith$Query$getItemById$restaurant_item_by_pk$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getItemById$restaurant_item_by_pk$description<
    TRes> {
  factory CopyWith$Query$getItemById$restaurant_item_by_pk$description(
    Query$getItemById$restaurant_item_by_pk$description instance,
    TRes Function(Query$getItemById$restaurant_item_by_pk$description) then,
  ) = _CopyWithImpl$Query$getItemById$restaurant_item_by_pk$description;

  factory CopyWith$Query$getItemById$restaurant_item_by_pk$description.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getItemById$restaurant_item_by_pk$description;

  TRes call({
    int? id,
    List<Query$getItemById$restaurant_item_by_pk$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getItemById$restaurant_item_by_pk$description$translations> Function(
              Iterable<
                  CopyWith$Query$getItemById$restaurant_item_by_pk$description$translations<
                      Query$getItemById$restaurant_item_by_pk$description$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getItemById$restaurant_item_by_pk$description<TRes>
    implements
        CopyWith$Query$getItemById$restaurant_item_by_pk$description<TRes> {
  _CopyWithImpl$Query$getItemById$restaurant_item_by_pk$description(
    this._instance,
    this._then,
  );

  final Query$getItemById$restaurant_item_by_pk$description _instance;

  final TRes Function(Query$getItemById$restaurant_item_by_pk$description)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getItemById$restaurant_item_by_pk$description(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getItemById$restaurant_item_by_pk$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getItemById$restaurant_item_by_pk$description$translations> Function(
                  Iterable<
                      CopyWith$Query$getItemById$restaurant_item_by_pk$description$translations<
                          Query$getItemById$restaurant_item_by_pk$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getItemById$restaurant_item_by_pk$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getItemById$restaurant_item_by_pk$description<
        TRes>
    implements
        CopyWith$Query$getItemById$restaurant_item_by_pk$description<TRes> {
  _CopyWithStubImpl$Query$getItemById$restaurant_item_by_pk$description(
      this._res);

  TRes _res;

  call({
    int? id,
    List<Query$getItemById$restaurant_item_by_pk$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getItemById$restaurant_item_by_pk$description$translations {
  Query$getItemById$restaurant_item_by_pk$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getItemById$restaurant_item_by_pk$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getItemById$restaurant_item_by_pk$description$translations(
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
            is Query$getItemById$restaurant_item_by_pk$description$translations) ||
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

extension UtilityExtension$Query$getItemById$restaurant_item_by_pk$description$translations
    on Query$getItemById$restaurant_item_by_pk$description$translations {
  CopyWith$Query$getItemById$restaurant_item_by_pk$description$translations<
          Query$getItemById$restaurant_item_by_pk$description$translations>
      get copyWith =>
          CopyWith$Query$getItemById$restaurant_item_by_pk$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getItemById$restaurant_item_by_pk$description$translations<
    TRes> {
  factory CopyWith$Query$getItemById$restaurant_item_by_pk$description$translations(
    Query$getItemById$restaurant_item_by_pk$description$translations instance,
    TRes Function(
            Query$getItemById$restaurant_item_by_pk$description$translations)
        then,
  ) = _CopyWithImpl$Query$getItemById$restaurant_item_by_pk$description$translations;

  factory CopyWith$Query$getItemById$restaurant_item_by_pk$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getItemById$restaurant_item_by_pk$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getItemById$restaurant_item_by_pk$description$translations<
        TRes>
    implements
        CopyWith$Query$getItemById$restaurant_item_by_pk$description$translations<
            TRes> {
  _CopyWithImpl$Query$getItemById$restaurant_item_by_pk$description$translations(
    this._instance,
    this._then,
  );

  final Query$getItemById$restaurant_item_by_pk$description$translations
      _instance;

  final TRes Function(
      Query$getItemById$restaurant_item_by_pk$description$translations) _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getItemById$restaurant_item_by_pk$description$translations(
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

class _CopyWithStubImpl$Query$getItemById$restaurant_item_by_pk$description$translations<
        TRes>
    implements
        CopyWith$Query$getItemById$restaurant_item_by_pk$description$translations<
            TRes> {
  _CopyWithStubImpl$Query$getItemById$restaurant_item_by_pk$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$getItemById$restaurant_item_by_pk$options {
  Query$getItemById$restaurant_item_by_pk$options({
    required this.item_options,
    required this.$__typename,
  });

  factory Query$getItemById$restaurant_item_by_pk$options.fromJson(
      Map<String, dynamic> json) {
    final l$item_options = json['item_options'];
    final l$$__typename = json['__typename'];
    return Query$getItemById$restaurant_item_by_pk$options(
      item_options: (l$item_options as List<dynamic>)
          .map((e) =>
              Query$getItemById$restaurant_item_by_pk$options$item_options
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getItemById$restaurant_item_by_pk$options$item_options>
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
    if (!(other is Query$getItemById$restaurant_item_by_pk$options) ||
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

extension UtilityExtension$Query$getItemById$restaurant_item_by_pk$options
    on Query$getItemById$restaurant_item_by_pk$options {
  CopyWith$Query$getItemById$restaurant_item_by_pk$options<
          Query$getItemById$restaurant_item_by_pk$options>
      get copyWith => CopyWith$Query$getItemById$restaurant_item_by_pk$options(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getItemById$restaurant_item_by_pk$options<TRes> {
  factory CopyWith$Query$getItemById$restaurant_item_by_pk$options(
    Query$getItemById$restaurant_item_by_pk$options instance,
    TRes Function(Query$getItemById$restaurant_item_by_pk$options) then,
  ) = _CopyWithImpl$Query$getItemById$restaurant_item_by_pk$options;

  factory CopyWith$Query$getItemById$restaurant_item_by_pk$options.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getItemById$restaurant_item_by_pk$options;

  TRes call({
    List<Query$getItemById$restaurant_item_by_pk$options$item_options>?
        item_options,
    String? $__typename,
  });
  TRes item_options(
      Iterable<Query$getItemById$restaurant_item_by_pk$options$item_options> Function(
              Iterable<
                  CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options<
                      Query$getItemById$restaurant_item_by_pk$options$item_options>>)
          _fn);
}

class _CopyWithImpl$Query$getItemById$restaurant_item_by_pk$options<TRes>
    implements CopyWith$Query$getItemById$restaurant_item_by_pk$options<TRes> {
  _CopyWithImpl$Query$getItemById$restaurant_item_by_pk$options(
    this._instance,
    this._then,
  );

  final Query$getItemById$restaurant_item_by_pk$options _instance;

  final TRes Function(Query$getItemById$restaurant_item_by_pk$options) _then;

  static const _undefined = {};

  TRes call({
    Object? item_options = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getItemById$restaurant_item_by_pk$options(
        item_options: item_options == _undefined || item_options == null
            ? _instance.item_options
            : (item_options as List<
                Query$getItemById$restaurant_item_by_pk$options$item_options>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes item_options(
          Iterable<Query$getItemById$restaurant_item_by_pk$options$item_options> Function(
                  Iterable<
                      CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options<
                          Query$getItemById$restaurant_item_by_pk$options$item_options>>)
              _fn) =>
      call(
          item_options: _fn(_instance.item_options.map((e) =>
              CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getItemById$restaurant_item_by_pk$options<TRes>
    implements CopyWith$Query$getItemById$restaurant_item_by_pk$options<TRes> {
  _CopyWithStubImpl$Query$getItemById$restaurant_item_by_pk$options(this._res);

  TRes _res;

  call({
    List<Query$getItemById$restaurant_item_by_pk$options$item_options>?
        item_options,
    String? $__typename,
  }) =>
      _res;
  item_options(_fn) => _res;
}

class Query$getItemById$restaurant_item_by_pk$options$item_options {
  Query$getItemById$restaurant_item_by_pk$options$item_options({
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

  factory Query$getItemById$restaurant_item_by_pk$options$item_options.fromJson(
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
    return Query$getItemById$restaurant_item_by_pk$options$item_options(
      id: (l$id as int),
      free_choice: (l$free_choice as int),
      cost_per_extra: moneyFromJson(l$cost_per_extra),
      option_type: (l$option_type as String),
      position: (l$position as int),
      maximum_choice: (l$maximum_choice as int),
      minimum_choice: (l$minimum_choice as int),
      name: Query$getItemById$restaurant_item_by_pk$options$item_options$name
          .fromJson((l$name as Map<String, dynamic>)),
      choices: (l$choices as List<dynamic>)
          .map((e) =>
              Query$getItemById$restaurant_item_by_pk$options$item_options$choices
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

  final Query$getItemById$restaurant_item_by_pk$options$item_options$name name;

  final List<
          Query$getItemById$restaurant_item_by_pk$options$item_options$choices>
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
            is Query$getItemById$restaurant_item_by_pk$options$item_options) ||
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

extension UtilityExtension$Query$getItemById$restaurant_item_by_pk$options$item_options
    on Query$getItemById$restaurant_item_by_pk$options$item_options {
  CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options<
          Query$getItemById$restaurant_item_by_pk$options$item_options>
      get copyWith =>
          CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options<
    TRes> {
  factory CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options(
    Query$getItemById$restaurant_item_by_pk$options$item_options instance,
    TRes Function(Query$getItemById$restaurant_item_by_pk$options$item_options)
        then,
  ) = _CopyWithImpl$Query$getItemById$restaurant_item_by_pk$options$item_options;

  factory CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getItemById$restaurant_item_by_pk$options$item_options;

  TRes call({
    int? id,
    int? free_choice,
    double? cost_per_extra,
    String? option_type,
    int? position,
    int? maximum_choice,
    int? minimum_choice,
    Query$getItemById$restaurant_item_by_pk$options$item_options$name? name,
    List<Query$getItemById$restaurant_item_by_pk$options$item_options$choices>?
        choices,
    String? $__typename,
  });
  CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$name<
      TRes> get name;
  TRes choices(
      Iterable<Query$getItemById$restaurant_item_by_pk$options$item_options$choices> Function(
              Iterable<
                  CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$choices<
                      Query$getItemById$restaurant_item_by_pk$options$item_options$choices>>)
          _fn);
}

class _CopyWithImpl$Query$getItemById$restaurant_item_by_pk$options$item_options<
        TRes>
    implements
        CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options<
            TRes> {
  _CopyWithImpl$Query$getItemById$restaurant_item_by_pk$options$item_options(
    this._instance,
    this._then,
  );

  final Query$getItemById$restaurant_item_by_pk$options$item_options _instance;

  final TRes Function(
      Query$getItemById$restaurant_item_by_pk$options$item_options) _then;

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
      _then(Query$getItemById$restaurant_item_by_pk$options$item_options(
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
                as Query$getItemById$restaurant_item_by_pk$options$item_options$name),
        choices: choices == _undefined || choices == null
            ? _instance.choices
            : (choices as List<
                Query$getItemById$restaurant_item_by_pk$options$item_options$choices>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$name<
      TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$name(
        local$name, (e) => call(name: e));
  }

  TRes choices(
          Iterable<Query$getItemById$restaurant_item_by_pk$options$item_options$choices> Function(
                  Iterable<
                      CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$choices<
                          Query$getItemById$restaurant_item_by_pk$options$item_options$choices>>)
              _fn) =>
      call(
          choices: _fn(_instance.choices.map((e) =>
              CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$choices(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getItemById$restaurant_item_by_pk$options$item_options<
        TRes>
    implements
        CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options<
            TRes> {
  _CopyWithStubImpl$Query$getItemById$restaurant_item_by_pk$options$item_options(
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
    Query$getItemById$restaurant_item_by_pk$options$item_options$name? name,
    List<Query$getItemById$restaurant_item_by_pk$options$item_options$choices>?
        choices,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$name<
          TRes>
      get name =>
          CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$name
              .stub(_res);
  choices(_fn) => _res;
}

class Query$getItemById$restaurant_item_by_pk$options$item_options$name {
  Query$getItemById$restaurant_item_by_pk$options$item_options$name({
    required this.id,
    required this.translations,
    required this.$__typename,
  });

  factory Query$getItemById$restaurant_item_by_pk$options$item_options$name.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getItemById$restaurant_item_by_pk$options$item_options$name(
      id: (l$id as int),
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getItemById$restaurant_item_by_pk$options$item_options$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final List<
          Query$getItemById$restaurant_item_by_pk$options$item_options$name$translations>
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
            is Query$getItemById$restaurant_item_by_pk$options$item_options$name) ||
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

extension UtilityExtension$Query$getItemById$restaurant_item_by_pk$options$item_options$name
    on Query$getItemById$restaurant_item_by_pk$options$item_options$name {
  CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$name<
          Query$getItemById$restaurant_item_by_pk$options$item_options$name>
      get copyWith =>
          CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$name<
    TRes> {
  factory CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$name(
    Query$getItemById$restaurant_item_by_pk$options$item_options$name instance,
    TRes Function(
            Query$getItemById$restaurant_item_by_pk$options$item_options$name)
        then,
  ) = _CopyWithImpl$Query$getItemById$restaurant_item_by_pk$options$item_options$name;

  factory CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getItemById$restaurant_item_by_pk$options$item_options$name;

  TRes call({
    int? id,
    List<Query$getItemById$restaurant_item_by_pk$options$item_options$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getItemById$restaurant_item_by_pk$options$item_options$name$translations> Function(
              Iterable<
                  CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$name$translations<
                      Query$getItemById$restaurant_item_by_pk$options$item_options$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getItemById$restaurant_item_by_pk$options$item_options$name<
        TRes>
    implements
        CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$name<
            TRes> {
  _CopyWithImpl$Query$getItemById$restaurant_item_by_pk$options$item_options$name(
    this._instance,
    this._then,
  );

  final Query$getItemById$restaurant_item_by_pk$options$item_options$name
      _instance;

  final TRes Function(
      Query$getItemById$restaurant_item_by_pk$options$item_options$name) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getItemById$restaurant_item_by_pk$options$item_options$name(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getItemById$restaurant_item_by_pk$options$item_options$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getItemById$restaurant_item_by_pk$options$item_options$name$translations> Function(
                  Iterable<
                      CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$name$translations<
                          Query$getItemById$restaurant_item_by_pk$options$item_options$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getItemById$restaurant_item_by_pk$options$item_options$name<
        TRes>
    implements
        CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$name<
            TRes> {
  _CopyWithStubImpl$Query$getItemById$restaurant_item_by_pk$options$item_options$name(
      this._res);

  TRes _res;

  call({
    int? id,
    List<Query$getItemById$restaurant_item_by_pk$options$item_options$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getItemById$restaurant_item_by_pk$options$item_options$name$translations {
  Query$getItemById$restaurant_item_by_pk$options$item_options$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getItemById$restaurant_item_by_pk$options$item_options$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getItemById$restaurant_item_by_pk$options$item_options$name$translations(
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
            is Query$getItemById$restaurant_item_by_pk$options$item_options$name$translations) ||
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

extension UtilityExtension$Query$getItemById$restaurant_item_by_pk$options$item_options$name$translations
    on Query$getItemById$restaurant_item_by_pk$options$item_options$name$translations {
  CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$name$translations<
          Query$getItemById$restaurant_item_by_pk$options$item_options$name$translations>
      get copyWith =>
          CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$name$translations<
    TRes> {
  factory CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$name$translations(
    Query$getItemById$restaurant_item_by_pk$options$item_options$name$translations
        instance,
    TRes Function(
            Query$getItemById$restaurant_item_by_pk$options$item_options$name$translations)
        then,
  ) = _CopyWithImpl$Query$getItemById$restaurant_item_by_pk$options$item_options$name$translations;

  factory CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getItemById$restaurant_item_by_pk$options$item_options$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getItemById$restaurant_item_by_pk$options$item_options$name$translations<
        TRes>
    implements
        CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$name$translations<
            TRes> {
  _CopyWithImpl$Query$getItemById$restaurant_item_by_pk$options$item_options$name$translations(
    this._instance,
    this._then,
  );

  final Query$getItemById$restaurant_item_by_pk$options$item_options$name$translations
      _instance;

  final TRes Function(
          Query$getItemById$restaurant_item_by_pk$options$item_options$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getItemById$restaurant_item_by_pk$options$item_options$name$translations(
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

class _CopyWithStubImpl$Query$getItemById$restaurant_item_by_pk$options$item_options$name$translations<
        TRes>
    implements
        CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$getItemById$restaurant_item_by_pk$options$item_options$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$getItemById$restaurant_item_by_pk$options$item_options$choices {
  Query$getItemById$restaurant_item_by_pk$options$item_options$choices({
    required this.option_choices,
    required this.$__typename,
  });

  factory Query$getItemById$restaurant_item_by_pk$options$item_options$choices.fromJson(
      Map<String, dynamic> json) {
    final l$option_choices = json['option_choices'];
    final l$$__typename = json['__typename'];
    return Query$getItemById$restaurant_item_by_pk$options$item_options$choices(
      option_choices: (l$option_choices as List<dynamic>)
          .map((e) =>
              Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices>
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
            is Query$getItemById$restaurant_item_by_pk$options$item_options$choices) ||
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

extension UtilityExtension$Query$getItemById$restaurant_item_by_pk$options$item_options$choices
    on Query$getItemById$restaurant_item_by_pk$options$item_options$choices {
  CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$choices<
          Query$getItemById$restaurant_item_by_pk$options$item_options$choices>
      get copyWith =>
          CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$choices(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$choices<
    TRes> {
  factory CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$choices(
    Query$getItemById$restaurant_item_by_pk$options$item_options$choices
        instance,
    TRes Function(
            Query$getItemById$restaurant_item_by_pk$options$item_options$choices)
        then,
  ) = _CopyWithImpl$Query$getItemById$restaurant_item_by_pk$options$item_options$choices;

  factory CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$choices.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getItemById$restaurant_item_by_pk$options$item_options$choices;

  TRes call({
    List<Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices>?
        option_choices,
    String? $__typename,
  });
  TRes option_choices(
      Iterable<Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices> Function(
              Iterable<
                  CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices<
                      Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices>>)
          _fn);
}

class _CopyWithImpl$Query$getItemById$restaurant_item_by_pk$options$item_options$choices<
        TRes>
    implements
        CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$choices<
            TRes> {
  _CopyWithImpl$Query$getItemById$restaurant_item_by_pk$options$item_options$choices(
    this._instance,
    this._then,
  );

  final Query$getItemById$restaurant_item_by_pk$options$item_options$choices
      _instance;

  final TRes Function(
          Query$getItemById$restaurant_item_by_pk$options$item_options$choices)
      _then;

  static const _undefined = {};

  TRes call({
    Object? option_choices = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getItemById$restaurant_item_by_pk$options$item_options$choices(
        option_choices: option_choices == _undefined || option_choices == null
            ? _instance.option_choices
            : (option_choices as List<
                Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes option_choices(
          Iterable<Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices> Function(
                  Iterable<
                      CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices<
                          Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices>>)
              _fn) =>
      call(
          option_choices: _fn(_instance.option_choices.map((e) =>
              CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getItemById$restaurant_item_by_pk$options$item_options$choices<
        TRes>
    implements
        CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$choices<
            TRes> {
  _CopyWithStubImpl$Query$getItemById$restaurant_item_by_pk$options$item_options$choices(
      this._res);

  TRes _res;

  call({
    List<Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices>?
        option_choices,
    String? $__typename,
  }) =>
      _res;
  option_choices(_fn) => _res;
}

class Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices {
  Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices({
    required this.available,
    required this.cost,
    required this.id,
    required this.name,
    required this.$__typename,
  });

  factory Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices.fromJson(
      Map<String, dynamic> json) {
    final l$available = json['available'];
    final l$cost = json['cost'];
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices(
      available: (l$available as bool),
      cost: moneyFromJson(l$cost),
      id: (l$id as int),
      name:
          Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name
              .fromJson((l$name as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final bool available;

  final double cost;

  final int id;

  final Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name
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
            is Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices) ||
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

extension UtilityExtension$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices
    on Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices {
  CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices<
          Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices>
      get copyWith =>
          CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices<
    TRes> {
  factory CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices(
    Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices
        instance,
    TRes Function(
            Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices)
        then,
  ) = _CopyWithImpl$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices;

  factory CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices;

  TRes call({
    bool? available,
    double? cost,
    int? id,
    Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name?
        name,
    String? $__typename,
  });
  CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name<
      TRes> get name;
}

class _CopyWithImpl$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices<
        TRes>
    implements
        CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices<
            TRes> {
  _CopyWithImpl$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices(
    this._instance,
    this._then,
  );

  final Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices
      _instance;

  final TRes Function(
          Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices)
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
          Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices(
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
                as Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name<
      TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name(
        local$name, (e) => call(name: e));
  }
}

class _CopyWithStubImpl$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices<
        TRes>
    implements
        CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices<
            TRes> {
  _CopyWithStubImpl$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices(
      this._res);

  TRes _res;

  call({
    bool? available,
    double? cost,
    int? id,
    Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name?
        name,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name<
          TRes>
      get name =>
          CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name
              .stub(_res);
}

class Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name {
  Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name({
    required this.id,
    required this.translations,
    required this.$__typename,
  });

  factory Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name(
      id: (l$id as int),
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final List<
          Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name$translations>
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
            is Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name) ||
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

extension UtilityExtension$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name
    on Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name {
  CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name<
          Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name>
      get copyWith =>
          CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name<
    TRes> {
  factory CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name(
    Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name
        instance,
    TRes Function(
            Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name)
        then,
  ) = _CopyWithImpl$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name;

  factory CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name;

  TRes call({
    int? id,
    List<Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name$translations> Function(
              Iterable<
                  CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name$translations<
                      Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name<
        TRes>
    implements
        CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name<
            TRes> {
  _CopyWithImpl$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name(
    this._instance,
    this._then,
  );

  final Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name
      _instance;

  final TRes Function(
          Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name$translations> Function(
                  Iterable<
                      CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name$translations<
                          Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name<
        TRes>
    implements
        CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name<
            TRes> {
  _CopyWithStubImpl$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name(
      this._res);

  TRes _res;

  call({
    int? id,
    List<Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name$translations {
  Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name$translations(
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
            is Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name$translations) ||
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

extension UtilityExtension$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name$translations
    on Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name$translations {
  CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name$translations<
          Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name$translations>
      get copyWith =>
          CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name$translations<
    TRes> {
  factory CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name$translations(
    Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name$translations
        instance,
    TRes Function(
            Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name$translations)
        then,
  ) = _CopyWithImpl$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name$translations;

  factory CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name$translations<
        TRes>
    implements
        CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name$translations<
            TRes> {
  _CopyWithImpl$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name$translations(
    this._instance,
    this._then,
  );

  final Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name$translations
      _instance;

  final TRes Function(
          Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name$translations(
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

class _CopyWithStubImpl$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name$translations<
        TRes>
    implements
        CopyWith$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}