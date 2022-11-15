import '../../__generated/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$addCategory {
  factory Variables$Mutation$addCategory(
          {required Input$restaurant_category_insert_input category}) =>
      Variables$Mutation$addCategory._({
        r'category': category,
      });

  Variables$Mutation$addCategory._(this._$data);

  factory Variables$Mutation$addCategory.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$category = data['category'];
    result$data['category'] = Input$restaurant_category_insert_input.fromJson(
        (l$category as Map<String, dynamic>));
    return Variables$Mutation$addCategory._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$restaurant_category_insert_input get category =>
      (_$data['category'] as Input$restaurant_category_insert_input);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$category = category;
    result$data['category'] = l$category.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$addCategory<Variables$Mutation$addCategory>
      get copyWith => CopyWith$Variables$Mutation$addCategory(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$addCategory) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$category = category;
    final lOther$category = other.category;
    if (l$category != lOther$category) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$category = category;
    return Object.hashAll([l$category]);
  }
}

abstract class CopyWith$Variables$Mutation$addCategory<TRes> {
  factory CopyWith$Variables$Mutation$addCategory(
    Variables$Mutation$addCategory instance,
    TRes Function(Variables$Mutation$addCategory) then,
  ) = _CopyWithImpl$Variables$Mutation$addCategory;

  factory CopyWith$Variables$Mutation$addCategory.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$addCategory;

  TRes call({Input$restaurant_category_insert_input? category});
}

class _CopyWithImpl$Variables$Mutation$addCategory<TRes>
    implements CopyWith$Variables$Mutation$addCategory<TRes> {
  _CopyWithImpl$Variables$Mutation$addCategory(
    this._instance,
    this._then,
  );

  final Variables$Mutation$addCategory _instance;

  final TRes Function(Variables$Mutation$addCategory) _then;

  static const _undefined = {};

  TRes call({Object? category = _undefined}) =>
      _then(Variables$Mutation$addCategory._({
        ..._instance._$data,
        if (category != _undefined && category != null)
          'category': (category as Input$restaurant_category_insert_input),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$addCategory<TRes>
    implements CopyWith$Variables$Mutation$addCategory<TRes> {
  _CopyWithStubImpl$Variables$Mutation$addCategory(this._res);

  TRes _res;

  call({Input$restaurant_category_insert_input? category}) => _res;
}

class Mutation$addCategory {
  Mutation$addCategory({
    this.insert_restaurant_category_one,
    required this.$__typename,
  });

  factory Mutation$addCategory.fromJson(Map<String, dynamic> json) {
    final l$insert_restaurant_category_one =
        json['insert_restaurant_category_one'];
    final l$$__typename = json['__typename'];
    return Mutation$addCategory(
      insert_restaurant_category_one: l$insert_restaurant_category_one == null
          ? null
          : Mutation$addCategory$insert_restaurant_category_one.fromJson(
              (l$insert_restaurant_category_one as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$addCategory$insert_restaurant_category_one?
      insert_restaurant_category_one;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insert_restaurant_category_one = insert_restaurant_category_one;
    _resultData['insert_restaurant_category_one'] =
        l$insert_restaurant_category_one?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insert_restaurant_category_one = insert_restaurant_category_one;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$insert_restaurant_category_one,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$addCategory) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$insert_restaurant_category_one = insert_restaurant_category_one;
    final lOther$insert_restaurant_category_one =
        other.insert_restaurant_category_one;
    if (l$insert_restaurant_category_one !=
        lOther$insert_restaurant_category_one) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$addCategory on Mutation$addCategory {
  CopyWith$Mutation$addCategory<Mutation$addCategory> get copyWith =>
      CopyWith$Mutation$addCategory(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$addCategory<TRes> {
  factory CopyWith$Mutation$addCategory(
    Mutation$addCategory instance,
    TRes Function(Mutation$addCategory) then,
  ) = _CopyWithImpl$Mutation$addCategory;

  factory CopyWith$Mutation$addCategory.stub(TRes res) =
      _CopyWithStubImpl$Mutation$addCategory;

  TRes call({
    Mutation$addCategory$insert_restaurant_category_one?
        insert_restaurant_category_one,
    String? $__typename,
  });
  CopyWith$Mutation$addCategory$insert_restaurant_category_one<TRes>
      get insert_restaurant_category_one;
}

class _CopyWithImpl$Mutation$addCategory<TRes>
    implements CopyWith$Mutation$addCategory<TRes> {
  _CopyWithImpl$Mutation$addCategory(
    this._instance,
    this._then,
  );

  final Mutation$addCategory _instance;

  final TRes Function(Mutation$addCategory) _then;

  static const _undefined = {};

  TRes call({
    Object? insert_restaurant_category_one = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$addCategory(
        insert_restaurant_category_one:
            insert_restaurant_category_one == _undefined
                ? _instance.insert_restaurant_category_one
                : (insert_restaurant_category_one
                    as Mutation$addCategory$insert_restaurant_category_one?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$addCategory$insert_restaurant_category_one<TRes>
      get insert_restaurant_category_one {
    final local$insert_restaurant_category_one =
        _instance.insert_restaurant_category_one;
    return local$insert_restaurant_category_one == null
        ? CopyWith$Mutation$addCategory$insert_restaurant_category_one.stub(
            _then(_instance))
        : CopyWith$Mutation$addCategory$insert_restaurant_category_one(
            local$insert_restaurant_category_one,
            (e) => call(insert_restaurant_category_one: e));
  }
}

class _CopyWithStubImpl$Mutation$addCategory<TRes>
    implements CopyWith$Mutation$addCategory<TRes> {
  _CopyWithStubImpl$Mutation$addCategory(this._res);

  TRes _res;

  call({
    Mutation$addCategory$insert_restaurant_category_one?
        insert_restaurant_category_one,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$addCategory$insert_restaurant_category_one<TRes>
      get insert_restaurant_category_one =>
          CopyWith$Mutation$addCategory$insert_restaurant_category_one.stub(
              _res);
}

const documentNodeMutationaddCategory = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'addCategory'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'category')),
        type: NamedTypeNode(
          name: NameNode(value: 'restaurant_category_insert_input'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'insert_restaurant_category_one'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'object'),
            value: VariableNode(name: NameNode(value: 'category')),
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
Mutation$addCategory _parserFn$Mutation$addCategory(
        Map<String, dynamic> data) =>
    Mutation$addCategory.fromJson(data);
typedef OnMutationCompleted$Mutation$addCategory = FutureOr<void> Function(
  dynamic,
  Mutation$addCategory?,
);

class Options$Mutation$addCategory
    extends graphql.MutationOptions<Mutation$addCategory> {
  Options$Mutation$addCategory({
    String? operationName,
    required Variables$Mutation$addCategory variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$addCategory? onCompleted,
    graphql.OnMutationUpdate<Mutation$addCategory>? update,
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
                    data == null ? null : _parserFn$Mutation$addCategory(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationaddCategory,
          parserFn: _parserFn$Mutation$addCategory,
        );

  final OnMutationCompleted$Mutation$addCategory? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$addCategory
    extends graphql.WatchQueryOptions<Mutation$addCategory> {
  WatchOptions$Mutation$addCategory({
    String? operationName,
    required Variables$Mutation$addCategory variables,
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
          document: documentNodeMutationaddCategory,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$addCategory,
        );
}

extension ClientExtension$Mutation$addCategory on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$addCategory>> mutate$addCategory(
          Options$Mutation$addCategory options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$addCategory> watchMutation$addCategory(
          WatchOptions$Mutation$addCategory options) =>
      this.watchMutation(options);
}

class Mutation$addCategory$insert_restaurant_category_one {
  Mutation$addCategory$insert_restaurant_category_one({
    required this.id,
    required this.$__typename,
  });

  factory Mutation$addCategory$insert_restaurant_category_one.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$addCategory$insert_restaurant_category_one(
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
    if (!(other is Mutation$addCategory$insert_restaurant_category_one) ||
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

extension UtilityExtension$Mutation$addCategory$insert_restaurant_category_one
    on Mutation$addCategory$insert_restaurant_category_one {
  CopyWith$Mutation$addCategory$insert_restaurant_category_one<
          Mutation$addCategory$insert_restaurant_category_one>
      get copyWith =>
          CopyWith$Mutation$addCategory$insert_restaurant_category_one(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$addCategory$insert_restaurant_category_one<
    TRes> {
  factory CopyWith$Mutation$addCategory$insert_restaurant_category_one(
    Mutation$addCategory$insert_restaurant_category_one instance,
    TRes Function(Mutation$addCategory$insert_restaurant_category_one) then,
  ) = _CopyWithImpl$Mutation$addCategory$insert_restaurant_category_one;

  factory CopyWith$Mutation$addCategory$insert_restaurant_category_one.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$addCategory$insert_restaurant_category_one;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$addCategory$insert_restaurant_category_one<TRes>
    implements
        CopyWith$Mutation$addCategory$insert_restaurant_category_one<TRes> {
  _CopyWithImpl$Mutation$addCategory$insert_restaurant_category_one(
    this._instance,
    this._then,
  );

  final Mutation$addCategory$insert_restaurant_category_one _instance;

  final TRes Function(Mutation$addCategory$insert_restaurant_category_one)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$addCategory$insert_restaurant_category_one(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$addCategory$insert_restaurant_category_one<
        TRes>
    implements
        CopyWith$Mutation$addCategory$insert_restaurant_category_one<TRes> {
  _CopyWithStubImpl$Mutation$addCategory$insert_restaurant_category_one(
      this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getCategory {
  factory Variables$Query$getCategory({required int id}) =>
      Variables$Query$getCategory._({
        r'id': id,
      });

  Variables$Query$getCategory._(this._$data);

  factory Variables$Query$getCategory.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    return Variables$Query$getCategory._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$getCategory<Variables$Query$getCategory>
      get copyWith => CopyWith$Variables$Query$getCategory(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getCategory) ||
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

abstract class CopyWith$Variables$Query$getCategory<TRes> {
  factory CopyWith$Variables$Query$getCategory(
    Variables$Query$getCategory instance,
    TRes Function(Variables$Query$getCategory) then,
  ) = _CopyWithImpl$Variables$Query$getCategory;

  factory CopyWith$Variables$Query$getCategory.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getCategory;

  TRes call({int? id});
}

class _CopyWithImpl$Variables$Query$getCategory<TRes>
    implements CopyWith$Variables$Query$getCategory<TRes> {
  _CopyWithImpl$Variables$Query$getCategory(
    this._instance,
    this._then,
  );

  final Variables$Query$getCategory _instance;

  final TRes Function(Variables$Query$getCategory) _then;

  static const _undefined = {};

  TRes call({Object? id = _undefined}) => _then(Variables$Query$getCategory._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getCategory<TRes>
    implements CopyWith$Variables$Query$getCategory<TRes> {
  _CopyWithStubImpl$Variables$Query$getCategory(this._res);

  TRes _res;

  call({int? id}) => _res;
}

class Query$getCategory {
  Query$getCategory({
    this.restaurant_category_by_pk,
    required this.$__typename,
  });

  factory Query$getCategory.fromJson(Map<String, dynamic> json) {
    final l$restaurant_category_by_pk = json['restaurant_category_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$getCategory(
      restaurant_category_by_pk: l$restaurant_category_by_pk == null
          ? null
          : Query$getCategory$restaurant_category_by_pk.fromJson(
              (l$restaurant_category_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getCategory$restaurant_category_by_pk? restaurant_category_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_category_by_pk = restaurant_category_by_pk;
    _resultData['restaurant_category_by_pk'] =
        l$restaurant_category_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_category_by_pk = restaurant_category_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$restaurant_category_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getCategory) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_category_by_pk = restaurant_category_by_pk;
    final lOther$restaurant_category_by_pk = other.restaurant_category_by_pk;
    if (l$restaurant_category_by_pk != lOther$restaurant_category_by_pk) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getCategory on Query$getCategory {
  CopyWith$Query$getCategory<Query$getCategory> get copyWith =>
      CopyWith$Query$getCategory(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getCategory<TRes> {
  factory CopyWith$Query$getCategory(
    Query$getCategory instance,
    TRes Function(Query$getCategory) then,
  ) = _CopyWithImpl$Query$getCategory;

  factory CopyWith$Query$getCategory.stub(TRes res) =
      _CopyWithStubImpl$Query$getCategory;

  TRes call({
    Query$getCategory$restaurant_category_by_pk? restaurant_category_by_pk,
    String? $__typename,
  });
  CopyWith$Query$getCategory$restaurant_category_by_pk<TRes>
      get restaurant_category_by_pk;
}

class _CopyWithImpl$Query$getCategory<TRes>
    implements CopyWith$Query$getCategory<TRes> {
  _CopyWithImpl$Query$getCategory(
    this._instance,
    this._then,
  );

  final Query$getCategory _instance;

  final TRes Function(Query$getCategory) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_category_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getCategory(
        restaurant_category_by_pk: restaurant_category_by_pk == _undefined
            ? _instance.restaurant_category_by_pk
            : (restaurant_category_by_pk
                as Query$getCategory$restaurant_category_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getCategory$restaurant_category_by_pk<TRes>
      get restaurant_category_by_pk {
    final local$restaurant_category_by_pk = _instance.restaurant_category_by_pk;
    return local$restaurant_category_by_pk == null
        ? CopyWith$Query$getCategory$restaurant_category_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$getCategory$restaurant_category_by_pk(
            local$restaurant_category_by_pk,
            (e) => call(restaurant_category_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$getCategory<TRes>
    implements CopyWith$Query$getCategory<TRes> {
  _CopyWithStubImpl$Query$getCategory(this._res);

  TRes _res;

  call({
    Query$getCategory$restaurant_category_by_pk? restaurant_category_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getCategory$restaurant_category_by_pk<TRes>
      get restaurant_category_by_pk =>
          CopyWith$Query$getCategory$restaurant_category_by_pk.stub(_res);
}

const documentNodeQuerygetCategory = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getCategory'),
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
        name: NameNode(value: 'restaurant_category_by_pk'),
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
            name: NameNode(value: 'position'),
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
Query$getCategory _parserFn$Query$getCategory(Map<String, dynamic> data) =>
    Query$getCategory.fromJson(data);

class Options$Query$getCategory
    extends graphql.QueryOptions<Query$getCategory> {
  Options$Query$getCategory({
    String? operationName,
    required Variables$Query$getCategory variables,
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
          document: documentNodeQuerygetCategory,
          parserFn: _parserFn$Query$getCategory,
        );
}

class WatchOptions$Query$getCategory
    extends graphql.WatchQueryOptions<Query$getCategory> {
  WatchOptions$Query$getCategory({
    String? operationName,
    required Variables$Query$getCategory variables,
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
          document: documentNodeQuerygetCategory,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getCategory,
        );
}

class FetchMoreOptions$Query$getCategory extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getCategory({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getCategory variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetCategory,
        );
}

extension ClientExtension$Query$getCategory on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getCategory>> query$getCategory(
          Options$Query$getCategory options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$getCategory> watchQuery$getCategory(
          WatchOptions$Query$getCategory options) =>
      this.watchQuery(options);
  void writeQuery$getCategory({
    required Query$getCategory data,
    required Variables$Query$getCategory variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQuerygetCategory),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getCategory? readQuery$getCategory({
    required Variables$Query$getCategory variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQuerygetCategory),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getCategory.fromJson(result);
  }
}

class Query$getCategory$restaurant_category_by_pk {
  Query$getCategory$restaurant_category_by_pk({
    this.description,
    required this.name,
    required this.position,
    required this.$__typename,
  });

  factory Query$getCategory$restaurant_category_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$description = json['description'];
    final l$name = json['name'];
    final l$position = json['position'];
    final l$$__typename = json['__typename'];
    return Query$getCategory$restaurant_category_by_pk(
      description: l$description == null
          ? null
          : Query$getCategory$restaurant_category_by_pk$description.fromJson(
              (l$description as Map<String, dynamic>)),
      name: Query$getCategory$restaurant_category_by_pk$name.fromJson(
          (l$name as Map<String, dynamic>)),
      position: (l$position as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getCategory$restaurant_category_by_pk$description? description;

  final Query$getCategory$restaurant_category_by_pk$name name;

  final int position;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$position = position;
    _resultData['position'] = l$position;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$description = description;
    final l$name = name;
    final l$position = position;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$description,
      l$name,
      l$position,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getCategory$restaurant_category_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getCategory$restaurant_category_by_pk
    on Query$getCategory$restaurant_category_by_pk {
  CopyWith$Query$getCategory$restaurant_category_by_pk<
          Query$getCategory$restaurant_category_by_pk>
      get copyWith => CopyWith$Query$getCategory$restaurant_category_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCategory$restaurant_category_by_pk<TRes> {
  factory CopyWith$Query$getCategory$restaurant_category_by_pk(
    Query$getCategory$restaurant_category_by_pk instance,
    TRes Function(Query$getCategory$restaurant_category_by_pk) then,
  ) = _CopyWithImpl$Query$getCategory$restaurant_category_by_pk;

  factory CopyWith$Query$getCategory$restaurant_category_by_pk.stub(TRes res) =
      _CopyWithStubImpl$Query$getCategory$restaurant_category_by_pk;

  TRes call({
    Query$getCategory$restaurant_category_by_pk$description? description,
    Query$getCategory$restaurant_category_by_pk$name? name,
    int? position,
    String? $__typename,
  });
  CopyWith$Query$getCategory$restaurant_category_by_pk$description<TRes>
      get description;
  CopyWith$Query$getCategory$restaurant_category_by_pk$name<TRes> get name;
}

class _CopyWithImpl$Query$getCategory$restaurant_category_by_pk<TRes>
    implements CopyWith$Query$getCategory$restaurant_category_by_pk<TRes> {
  _CopyWithImpl$Query$getCategory$restaurant_category_by_pk(
    this._instance,
    this._then,
  );

  final Query$getCategory$restaurant_category_by_pk _instance;

  final TRes Function(Query$getCategory$restaurant_category_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? description = _undefined,
    Object? name = _undefined,
    Object? position = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getCategory$restaurant_category_by_pk(
        description: description == _undefined
            ? _instance.description
            : (description
                as Query$getCategory$restaurant_category_by_pk$description?),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as Query$getCategory$restaurant_category_by_pk$name),
        position: position == _undefined || position == null
            ? _instance.position
            : (position as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getCategory$restaurant_category_by_pk$description<TRes>
      get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Query$getCategory$restaurant_category_by_pk$description.stub(
            _then(_instance))
        : CopyWith$Query$getCategory$restaurant_category_by_pk$description(
            local$description, (e) => call(description: e));
  }

  CopyWith$Query$getCategory$restaurant_category_by_pk$name<TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Query$getCategory$restaurant_category_by_pk$name(
        local$name, (e) => call(name: e));
  }
}

class _CopyWithStubImpl$Query$getCategory$restaurant_category_by_pk<TRes>
    implements CopyWith$Query$getCategory$restaurant_category_by_pk<TRes> {
  _CopyWithStubImpl$Query$getCategory$restaurant_category_by_pk(this._res);

  TRes _res;

  call({
    Query$getCategory$restaurant_category_by_pk$description? description,
    Query$getCategory$restaurant_category_by_pk$name? name,
    int? position,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getCategory$restaurant_category_by_pk$description<TRes>
      get description =>
          CopyWith$Query$getCategory$restaurant_category_by_pk$description.stub(
              _res);
  CopyWith$Query$getCategory$restaurant_category_by_pk$name<TRes> get name =>
      CopyWith$Query$getCategory$restaurant_category_by_pk$name.stub(_res);
}

class Query$getCategory$restaurant_category_by_pk$description {
  Query$getCategory$restaurant_category_by_pk$description({
    required this.translations,
    required this.$__typename,
  });

  factory Query$getCategory$restaurant_category_by_pk$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getCategory$restaurant_category_by_pk$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getCategory$restaurant_category_by_pk$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$getCategory$restaurant_category_by_pk$description$translations>
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
    if (!(other is Query$getCategory$restaurant_category_by_pk$description) ||
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

extension UtilityExtension$Query$getCategory$restaurant_category_by_pk$description
    on Query$getCategory$restaurant_category_by_pk$description {
  CopyWith$Query$getCategory$restaurant_category_by_pk$description<
          Query$getCategory$restaurant_category_by_pk$description>
      get copyWith =>
          CopyWith$Query$getCategory$restaurant_category_by_pk$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCategory$restaurant_category_by_pk$description<
    TRes> {
  factory CopyWith$Query$getCategory$restaurant_category_by_pk$description(
    Query$getCategory$restaurant_category_by_pk$description instance,
    TRes Function(Query$getCategory$restaurant_category_by_pk$description) then,
  ) = _CopyWithImpl$Query$getCategory$restaurant_category_by_pk$description;

  factory CopyWith$Query$getCategory$restaurant_category_by_pk$description.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCategory$restaurant_category_by_pk$description;

  TRes call({
    List<Query$getCategory$restaurant_category_by_pk$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getCategory$restaurant_category_by_pk$description$translations> Function(
              Iterable<
                  CopyWith$Query$getCategory$restaurant_category_by_pk$description$translations<
                      Query$getCategory$restaurant_category_by_pk$description$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getCategory$restaurant_category_by_pk$description<
        TRes>
    implements
        CopyWith$Query$getCategory$restaurant_category_by_pk$description<TRes> {
  _CopyWithImpl$Query$getCategory$restaurant_category_by_pk$description(
    this._instance,
    this._then,
  );

  final Query$getCategory$restaurant_category_by_pk$description _instance;

  final TRes Function(Query$getCategory$restaurant_category_by_pk$description)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getCategory$restaurant_category_by_pk$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getCategory$restaurant_category_by_pk$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getCategory$restaurant_category_by_pk$description$translations> Function(
                  Iterable<
                      CopyWith$Query$getCategory$restaurant_category_by_pk$description$translations<
                          Query$getCategory$restaurant_category_by_pk$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getCategory$restaurant_category_by_pk$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getCategory$restaurant_category_by_pk$description<
        TRes>
    implements
        CopyWith$Query$getCategory$restaurant_category_by_pk$description<TRes> {
  _CopyWithStubImpl$Query$getCategory$restaurant_category_by_pk$description(
      this._res);

  TRes _res;

  call({
    List<Query$getCategory$restaurant_category_by_pk$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getCategory$restaurant_category_by_pk$description$translations {
  Query$getCategory$restaurant_category_by_pk$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getCategory$restaurant_category_by_pk$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getCategory$restaurant_category_by_pk$description$translations(
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
            is Query$getCategory$restaurant_category_by_pk$description$translations) ||
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

extension UtilityExtension$Query$getCategory$restaurant_category_by_pk$description$translations
    on Query$getCategory$restaurant_category_by_pk$description$translations {
  CopyWith$Query$getCategory$restaurant_category_by_pk$description$translations<
          Query$getCategory$restaurant_category_by_pk$description$translations>
      get copyWith =>
          CopyWith$Query$getCategory$restaurant_category_by_pk$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCategory$restaurant_category_by_pk$description$translations<
    TRes> {
  factory CopyWith$Query$getCategory$restaurant_category_by_pk$description$translations(
    Query$getCategory$restaurant_category_by_pk$description$translations
        instance,
    TRes Function(
            Query$getCategory$restaurant_category_by_pk$description$translations)
        then,
  ) = _CopyWithImpl$Query$getCategory$restaurant_category_by_pk$description$translations;

  factory CopyWith$Query$getCategory$restaurant_category_by_pk$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCategory$restaurant_category_by_pk$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getCategory$restaurant_category_by_pk$description$translations<
        TRes>
    implements
        CopyWith$Query$getCategory$restaurant_category_by_pk$description$translations<
            TRes> {
  _CopyWithImpl$Query$getCategory$restaurant_category_by_pk$description$translations(
    this._instance,
    this._then,
  );

  final Query$getCategory$restaurant_category_by_pk$description$translations
      _instance;

  final TRes Function(
          Query$getCategory$restaurant_category_by_pk$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getCategory$restaurant_category_by_pk$description$translations(
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

class _CopyWithStubImpl$Query$getCategory$restaurant_category_by_pk$description$translations<
        TRes>
    implements
        CopyWith$Query$getCategory$restaurant_category_by_pk$description$translations<
            TRes> {
  _CopyWithStubImpl$Query$getCategory$restaurant_category_by_pk$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$getCategory$restaurant_category_by_pk$name {
  Query$getCategory$restaurant_category_by_pk$name({
    required this.translations,
    required this.$__typename,
  });

  factory Query$getCategory$restaurant_category_by_pk$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getCategory$restaurant_category_by_pk$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getCategory$restaurant_category_by_pk$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getCategory$restaurant_category_by_pk$name$translations>
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
    if (!(other is Query$getCategory$restaurant_category_by_pk$name) ||
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

extension UtilityExtension$Query$getCategory$restaurant_category_by_pk$name
    on Query$getCategory$restaurant_category_by_pk$name {
  CopyWith$Query$getCategory$restaurant_category_by_pk$name<
          Query$getCategory$restaurant_category_by_pk$name>
      get copyWith => CopyWith$Query$getCategory$restaurant_category_by_pk$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCategory$restaurant_category_by_pk$name<TRes> {
  factory CopyWith$Query$getCategory$restaurant_category_by_pk$name(
    Query$getCategory$restaurant_category_by_pk$name instance,
    TRes Function(Query$getCategory$restaurant_category_by_pk$name) then,
  ) = _CopyWithImpl$Query$getCategory$restaurant_category_by_pk$name;

  factory CopyWith$Query$getCategory$restaurant_category_by_pk$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCategory$restaurant_category_by_pk$name;

  TRes call({
    List<Query$getCategory$restaurant_category_by_pk$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getCategory$restaurant_category_by_pk$name$translations> Function(
              Iterable<
                  CopyWith$Query$getCategory$restaurant_category_by_pk$name$translations<
                      Query$getCategory$restaurant_category_by_pk$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getCategory$restaurant_category_by_pk$name<TRes>
    implements CopyWith$Query$getCategory$restaurant_category_by_pk$name<TRes> {
  _CopyWithImpl$Query$getCategory$restaurant_category_by_pk$name(
    this._instance,
    this._then,
  );

  final Query$getCategory$restaurant_category_by_pk$name _instance;

  final TRes Function(Query$getCategory$restaurant_category_by_pk$name) _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getCategory$restaurant_category_by_pk$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getCategory$restaurant_category_by_pk$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getCategory$restaurant_category_by_pk$name$translations> Function(
                  Iterable<
                      CopyWith$Query$getCategory$restaurant_category_by_pk$name$translations<
                          Query$getCategory$restaurant_category_by_pk$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getCategory$restaurant_category_by_pk$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getCategory$restaurant_category_by_pk$name<TRes>
    implements CopyWith$Query$getCategory$restaurant_category_by_pk$name<TRes> {
  _CopyWithStubImpl$Query$getCategory$restaurant_category_by_pk$name(this._res);

  TRes _res;

  call({
    List<Query$getCategory$restaurant_category_by_pk$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getCategory$restaurant_category_by_pk$name$translations {
  Query$getCategory$restaurant_category_by_pk$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getCategory$restaurant_category_by_pk$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getCategory$restaurant_category_by_pk$name$translations(
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
            is Query$getCategory$restaurant_category_by_pk$name$translations) ||
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

extension UtilityExtension$Query$getCategory$restaurant_category_by_pk$name$translations
    on Query$getCategory$restaurant_category_by_pk$name$translations {
  CopyWith$Query$getCategory$restaurant_category_by_pk$name$translations<
          Query$getCategory$restaurant_category_by_pk$name$translations>
      get copyWith =>
          CopyWith$Query$getCategory$restaurant_category_by_pk$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCategory$restaurant_category_by_pk$name$translations<
    TRes> {
  factory CopyWith$Query$getCategory$restaurant_category_by_pk$name$translations(
    Query$getCategory$restaurant_category_by_pk$name$translations instance,
    TRes Function(Query$getCategory$restaurant_category_by_pk$name$translations)
        then,
  ) = _CopyWithImpl$Query$getCategory$restaurant_category_by_pk$name$translations;

  factory CopyWith$Query$getCategory$restaurant_category_by_pk$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCategory$restaurant_category_by_pk$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getCategory$restaurant_category_by_pk$name$translations<
        TRes>
    implements
        CopyWith$Query$getCategory$restaurant_category_by_pk$name$translations<
            TRes> {
  _CopyWithImpl$Query$getCategory$restaurant_category_by_pk$name$translations(
    this._instance,
    this._then,
  );

  final Query$getCategory$restaurant_category_by_pk$name$translations _instance;

  final TRes Function(
      Query$getCategory$restaurant_category_by_pk$name$translations) _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getCategory$restaurant_category_by_pk$name$translations(
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

class _CopyWithStubImpl$Query$getCategory$restaurant_category_by_pk$name$translations<
        TRes>
    implements
        CopyWith$Query$getCategory$restaurant_category_by_pk$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$getCategory$restaurant_category_by_pk$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$getCategories {
  Query$getCategories({
    required this.restaurant_category,
    required this.$__typename,
  });

  factory Query$getCategories.fromJson(Map<String, dynamic> json) {
    final l$restaurant_category = json['restaurant_category'];
    final l$$__typename = json['__typename'];
    return Query$getCategories(
      restaurant_category: (l$restaurant_category as List<dynamic>)
          .map((e) => Query$getCategories$restaurant_category.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getCategories$restaurant_category> restaurant_category;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_category = restaurant_category;
    _resultData['restaurant_category'] =
        l$restaurant_category.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_category = restaurant_category;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$restaurant_category.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getCategories) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_category = restaurant_category;
    final lOther$restaurant_category = other.restaurant_category;
    if (l$restaurant_category.length != lOther$restaurant_category.length) {
      return false;
    }
    for (int i = 0; i < l$restaurant_category.length; i++) {
      final l$restaurant_category$entry = l$restaurant_category[i];
      final lOther$restaurant_category$entry = lOther$restaurant_category[i];
      if (l$restaurant_category$entry != lOther$restaurant_category$entry) {
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

extension UtilityExtension$Query$getCategories on Query$getCategories {
  CopyWith$Query$getCategories<Query$getCategories> get copyWith =>
      CopyWith$Query$getCategories(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getCategories<TRes> {
  factory CopyWith$Query$getCategories(
    Query$getCategories instance,
    TRes Function(Query$getCategories) then,
  ) = _CopyWithImpl$Query$getCategories;

  factory CopyWith$Query$getCategories.stub(TRes res) =
      _CopyWithStubImpl$Query$getCategories;

  TRes call({
    List<Query$getCategories$restaurant_category>? restaurant_category,
    String? $__typename,
  });
  TRes restaurant_category(
      Iterable<Query$getCategories$restaurant_category> Function(
              Iterable<
                  CopyWith$Query$getCategories$restaurant_category<
                      Query$getCategories$restaurant_category>>)
          _fn);
}

class _CopyWithImpl$Query$getCategories<TRes>
    implements CopyWith$Query$getCategories<TRes> {
  _CopyWithImpl$Query$getCategories(
    this._instance,
    this._then,
  );

  final Query$getCategories _instance;

  final TRes Function(Query$getCategories) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_category = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getCategories(
        restaurant_category:
            restaurant_category == _undefined || restaurant_category == null
                ? _instance.restaurant_category
                : (restaurant_category
                    as List<Query$getCategories$restaurant_category>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes restaurant_category(
          Iterable<Query$getCategories$restaurant_category> Function(
                  Iterable<
                      CopyWith$Query$getCategories$restaurant_category<
                          Query$getCategories$restaurant_category>>)
              _fn) =>
      call(
          restaurant_category: _fn(_instance.restaurant_category
              .map((e) => CopyWith$Query$getCategories$restaurant_category(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getCategories<TRes>
    implements CopyWith$Query$getCategories<TRes> {
  _CopyWithStubImpl$Query$getCategories(this._res);

  TRes _res;

  call({
    List<Query$getCategories$restaurant_category>? restaurant_category,
    String? $__typename,
  }) =>
      _res;
  restaurant_category(_fn) => _res;
}

const documentNodeQuerygetCategories = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getCategories'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'restaurant_category'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'order_by'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'position'),
                value: EnumValueNode(name: NameNode(value: 'asc')),
              )
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
Query$getCategories _parserFn$Query$getCategories(Map<String, dynamic> data) =>
    Query$getCategories.fromJson(data);

class Options$Query$getCategories
    extends graphql.QueryOptions<Query$getCategories> {
  Options$Query$getCategories({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          pollInterval: pollInterval,
          context: context,
          document: documentNodeQuerygetCategories,
          parserFn: _parserFn$Query$getCategories,
        );
}

class WatchOptions$Query$getCategories
    extends graphql.WatchQueryOptions<Query$getCategories> {
  WatchOptions$Query$getCategories({
    String? operationName,
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
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeQuerygetCategories,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getCategories,
        );
}

class FetchMoreOptions$Query$getCategories extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getCategories(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQuerygetCategories,
        );
}

extension ClientExtension$Query$getCategories on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getCategories>> query$getCategories(
          [Options$Query$getCategories? options]) async =>
      await this.query(options ?? Options$Query$getCategories());
  graphql.ObservableQuery<Query$getCategories> watchQuery$getCategories(
          [WatchOptions$Query$getCategories? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$getCategories());
  void writeQuery$getCategories({
    required Query$getCategories data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation:
                graphql.Operation(document: documentNodeQuerygetCategories)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getCategories? readQuery$getCategories({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerygetCategories)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getCategories.fromJson(result);
  }
}

class Query$getCategories$restaurant_category {
  Query$getCategories$restaurant_category({
    required this.id,
    required this.$__typename,
  });

  factory Query$getCategories$restaurant_category.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Query$getCategories$restaurant_category(
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
    if (!(other is Query$getCategories$restaurant_category) ||
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

extension UtilityExtension$Query$getCategories$restaurant_category
    on Query$getCategories$restaurant_category {
  CopyWith$Query$getCategories$restaurant_category<
          Query$getCategories$restaurant_category>
      get copyWith => CopyWith$Query$getCategories$restaurant_category(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCategories$restaurant_category<TRes> {
  factory CopyWith$Query$getCategories$restaurant_category(
    Query$getCategories$restaurant_category instance,
    TRes Function(Query$getCategories$restaurant_category) then,
  ) = _CopyWithImpl$Query$getCategories$restaurant_category;

  factory CopyWith$Query$getCategories$restaurant_category.stub(TRes res) =
      _CopyWithStubImpl$Query$getCategories$restaurant_category;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getCategories$restaurant_category<TRes>
    implements CopyWith$Query$getCategories$restaurant_category<TRes> {
  _CopyWithImpl$Query$getCategories$restaurant_category(
    this._instance,
    this._then,
  );

  final Query$getCategories$restaurant_category _instance;

  final TRes Function(Query$getCategories$restaurant_category) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getCategories$restaurant_category(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getCategories$restaurant_category<TRes>
    implements CopyWith$Query$getCategories$restaurant_category<TRes> {
  _CopyWithStubImpl$Query$getCategories$restaurant_category(this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$GetRestaurants {
  Subscription$GetRestaurants({
    required this.restaurant,
    required this.$__typename,
  });

  factory Subscription$GetRestaurants.fromJson(Map<String, dynamic> json) {
    final l$restaurant = json['restaurant'];
    final l$$__typename = json['__typename'];
    return Subscription$GetRestaurants(
      restaurant: (l$restaurant as List<dynamic>)
          .map((e) => Subscription$GetRestaurants$restaurant.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Subscription$GetRestaurants$restaurant> restaurant;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant = restaurant;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$restaurant.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$GetRestaurants) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (l$restaurant.length != lOther$restaurant.length) {
      return false;
    }
    for (int i = 0; i < l$restaurant.length; i++) {
      final l$restaurant$entry = l$restaurant[i];
      final lOther$restaurant$entry = lOther$restaurant[i];
      if (l$restaurant$entry != lOther$restaurant$entry) {
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

extension UtilityExtension$Subscription$GetRestaurants
    on Subscription$GetRestaurants {
  CopyWith$Subscription$GetRestaurants<Subscription$GetRestaurants>
      get copyWith => CopyWith$Subscription$GetRestaurants(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$GetRestaurants<TRes> {
  factory CopyWith$Subscription$GetRestaurants(
    Subscription$GetRestaurants instance,
    TRes Function(Subscription$GetRestaurants) then,
  ) = _CopyWithImpl$Subscription$GetRestaurants;

  factory CopyWith$Subscription$GetRestaurants.stub(TRes res) =
      _CopyWithStubImpl$Subscription$GetRestaurants;

  TRes call({
    List<Subscription$GetRestaurants$restaurant>? restaurant,
    String? $__typename,
  });
  TRes restaurant(
      Iterable<Subscription$GetRestaurants$restaurant> Function(
              Iterable<
                  CopyWith$Subscription$GetRestaurants$restaurant<
                      Subscription$GetRestaurants$restaurant>>)
          _fn);
}

class _CopyWithImpl$Subscription$GetRestaurants<TRes>
    implements CopyWith$Subscription$GetRestaurants<TRes> {
  _CopyWithImpl$Subscription$GetRestaurants(
    this._instance,
    this._then,
  );

  final Subscription$GetRestaurants _instance;

  final TRes Function(Subscription$GetRestaurants) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$GetRestaurants(
        restaurant: restaurant == _undefined || restaurant == null
            ? _instance.restaurant
            : (restaurant as List<Subscription$GetRestaurants$restaurant>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes restaurant(
          Iterable<Subscription$GetRestaurants$restaurant> Function(
                  Iterable<
                      CopyWith$Subscription$GetRestaurants$restaurant<
                          Subscription$GetRestaurants$restaurant>>)
              _fn) =>
      call(
          restaurant: _fn(_instance.restaurant
              .map((e) => CopyWith$Subscription$GetRestaurants$restaurant(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Subscription$GetRestaurants<TRes>
    implements CopyWith$Subscription$GetRestaurants<TRes> {
  _CopyWithStubImpl$Subscription$GetRestaurants(this._res);

  TRes _res;

  call({
    List<Subscription$GetRestaurants$restaurant>? restaurant,
    String? $__typename,
  }) =>
      _res;
  restaurant(_fn) => _res;
}

const documentNodeSubscriptionGetRestaurants = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'GetRestaurants'),
    variableDefinitions: [],
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
            name: NameNode(value: 'name'),
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
            name: NameNode(value: 'open_status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'approved'),
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
            name: NameNode(value: 'payment_info'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'bank_transfer'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'card'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'cash'),
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
Subscription$GetRestaurants _parserFn$Subscription$GetRestaurants(
        Map<String, dynamic> data) =>
    Subscription$GetRestaurants.fromJson(data);

class Options$Subscription$GetRestaurants
    extends graphql.SubscriptionOptions<Subscription$GetRestaurants> {
  Options$Subscription$GetRestaurants({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeSubscriptionGetRestaurants,
          parserFn: _parserFn$Subscription$GetRestaurants,
        );
}

class WatchOptions$Subscription$GetRestaurants
    extends graphql.WatchQueryOptions<Subscription$GetRestaurants> {
  WatchOptions$Subscription$GetRestaurants({
    String? operationName,
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
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeSubscriptionGetRestaurants,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$GetRestaurants,
        );
}

class FetchMoreOptions$Subscription$GetRestaurants
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$GetRestaurants(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeSubscriptionGetRestaurants,
        );
}

extension ClientExtension$Subscription$GetRestaurants on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$GetRestaurants>>
      subscribe$GetRestaurants(
              [Options$Subscription$GetRestaurants? options]) =>
          this.subscribe(options ?? Options$Subscription$GetRestaurants());
  graphql.ObservableQuery<
      Subscription$GetRestaurants> watchSubscription$GetRestaurants(
          [WatchOptions$Subscription$GetRestaurants? options]) =>
      this.watchQuery(options ?? WatchOptions$Subscription$GetRestaurants());
}

class Subscription$GetRestaurants$restaurant {
  Subscription$GetRestaurants$restaurant({
    required this.id,
    required this.name,
    required this.location_text,
    required this.open_status,
    required this.approved,
    required this.image,
    this.description,
    this.payment_info,
    required this.$__typename,
  });

  factory Subscription$GetRestaurants$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$location_text = json['location_text'];
    final l$open_status = json['open_status'];
    final l$approved = json['approved'];
    final l$image = json['image'];
    final l$description = json['description'];
    final l$payment_info = json['payment_info'];
    final l$$__typename = json['__typename'];
    return Subscription$GetRestaurants$restaurant(
      id: (l$id as int),
      name: (l$name as String),
      location_text: (l$location_text as String),
      open_status: (l$open_status as String),
      approved: (l$approved as bool),
      image: (l$image as String),
      description: l$description == null
          ? null
          : Subscription$GetRestaurants$restaurant$description.fromJson(
              (l$description as Map<String, dynamic>)),
      payment_info: l$payment_info == null
          ? null
          : Subscription$GetRestaurants$restaurant$payment_info.fromJson(
              (l$payment_info as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String name;

  final String location_text;

  final String open_status;

  final bool approved;

  final String image;

  final Subscription$GetRestaurants$restaurant$description? description;

  final Subscription$GetRestaurants$restaurant$payment_info? payment_info;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$location_text = location_text;
    _resultData['location_text'] = l$location_text;
    final l$open_status = open_status;
    _resultData['open_status'] = l$open_status;
    final l$approved = approved;
    _resultData['approved'] = l$approved;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
    final l$payment_info = payment_info;
    _resultData['payment_info'] = l$payment_info?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$location_text = location_text;
    final l$open_status = open_status;
    final l$approved = approved;
    final l$image = image;
    final l$description = description;
    final l$payment_info = payment_info;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$location_text,
      l$open_status,
      l$approved,
      l$image,
      l$description,
      l$payment_info,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$GetRestaurants$restaurant) ||
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
    final l$location_text = location_text;
    final lOther$location_text = other.location_text;
    if (l$location_text != lOther$location_text) {
      return false;
    }
    final l$open_status = open_status;
    final lOther$open_status = other.open_status;
    if (l$open_status != lOther$open_status) {
      return false;
    }
    final l$approved = approved;
    final lOther$approved = other.approved;
    if (l$approved != lOther$approved) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$payment_info = payment_info;
    final lOther$payment_info = other.payment_info;
    if (l$payment_info != lOther$payment_info) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$GetRestaurants$restaurant
    on Subscription$GetRestaurants$restaurant {
  CopyWith$Subscription$GetRestaurants$restaurant<
          Subscription$GetRestaurants$restaurant>
      get copyWith => CopyWith$Subscription$GetRestaurants$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$GetRestaurants$restaurant<TRes> {
  factory CopyWith$Subscription$GetRestaurants$restaurant(
    Subscription$GetRestaurants$restaurant instance,
    TRes Function(Subscription$GetRestaurants$restaurant) then,
  ) = _CopyWithImpl$Subscription$GetRestaurants$restaurant;

  factory CopyWith$Subscription$GetRestaurants$restaurant.stub(TRes res) =
      _CopyWithStubImpl$Subscription$GetRestaurants$restaurant;

  TRes call({
    int? id,
    String? name,
    String? location_text,
    String? open_status,
    bool? approved,
    String? image,
    Subscription$GetRestaurants$restaurant$description? description,
    Subscription$GetRestaurants$restaurant$payment_info? payment_info,
    String? $__typename,
  });
  CopyWith$Subscription$GetRestaurants$restaurant$description<TRes>
      get description;
  CopyWith$Subscription$GetRestaurants$restaurant$payment_info<TRes>
      get payment_info;
}

class _CopyWithImpl$Subscription$GetRestaurants$restaurant<TRes>
    implements CopyWith$Subscription$GetRestaurants$restaurant<TRes> {
  _CopyWithImpl$Subscription$GetRestaurants$restaurant(
    this._instance,
    this._then,
  );

  final Subscription$GetRestaurants$restaurant _instance;

  final TRes Function(Subscription$GetRestaurants$restaurant) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? location_text = _undefined,
    Object? open_status = _undefined,
    Object? approved = _undefined,
    Object? image = _undefined,
    Object? description = _undefined,
    Object? payment_info = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$GetRestaurants$restaurant(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        location_text: location_text == _undefined || location_text == null
            ? _instance.location_text
            : (location_text as String),
        open_status: open_status == _undefined || open_status == null
            ? _instance.open_status
            : (open_status as String),
        approved: approved == _undefined || approved == null
            ? _instance.approved
            : (approved as bool),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        description: description == _undefined
            ? _instance.description
            : (description
                as Subscription$GetRestaurants$restaurant$description?),
        payment_info: payment_info == _undefined
            ? _instance.payment_info
            : (payment_info
                as Subscription$GetRestaurants$restaurant$payment_info?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$GetRestaurants$restaurant$description<TRes>
      get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Subscription$GetRestaurants$restaurant$description.stub(
            _then(_instance))
        : CopyWith$Subscription$GetRestaurants$restaurant$description(
            local$description, (e) => call(description: e));
  }

  CopyWith$Subscription$GetRestaurants$restaurant$payment_info<TRes>
      get payment_info {
    final local$payment_info = _instance.payment_info;
    return local$payment_info == null
        ? CopyWith$Subscription$GetRestaurants$restaurant$payment_info.stub(
            _then(_instance))
        : CopyWith$Subscription$GetRestaurants$restaurant$payment_info(
            local$payment_info, (e) => call(payment_info: e));
  }
}

class _CopyWithStubImpl$Subscription$GetRestaurants$restaurant<TRes>
    implements CopyWith$Subscription$GetRestaurants$restaurant<TRes> {
  _CopyWithStubImpl$Subscription$GetRestaurants$restaurant(this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    String? location_text,
    String? open_status,
    bool? approved,
    String? image,
    Subscription$GetRestaurants$restaurant$description? description,
    Subscription$GetRestaurants$restaurant$payment_info? payment_info,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$GetRestaurants$restaurant$description<TRes>
      get description =>
          CopyWith$Subscription$GetRestaurants$restaurant$description.stub(
              _res);
  CopyWith$Subscription$GetRestaurants$restaurant$payment_info<TRes>
      get payment_info =>
          CopyWith$Subscription$GetRestaurants$restaurant$payment_info.stub(
              _res);
}

class Subscription$GetRestaurants$restaurant$description {
  Subscription$GetRestaurants$restaurant$description({
    required this.translations,
    required this.$__typename,
  });

  factory Subscription$GetRestaurants$restaurant$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Subscription$GetRestaurants$restaurant$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Subscription$GetRestaurants$restaurant$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Subscription$GetRestaurants$restaurant$description$translations>
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
    if (!(other is Subscription$GetRestaurants$restaurant$description) ||
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

extension UtilityExtension$Subscription$GetRestaurants$restaurant$description
    on Subscription$GetRestaurants$restaurant$description {
  CopyWith$Subscription$GetRestaurants$restaurant$description<
          Subscription$GetRestaurants$restaurant$description>
      get copyWith =>
          CopyWith$Subscription$GetRestaurants$restaurant$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$GetRestaurants$restaurant$description<
    TRes> {
  factory CopyWith$Subscription$GetRestaurants$restaurant$description(
    Subscription$GetRestaurants$restaurant$description instance,
    TRes Function(Subscription$GetRestaurants$restaurant$description) then,
  ) = _CopyWithImpl$Subscription$GetRestaurants$restaurant$description;

  factory CopyWith$Subscription$GetRestaurants$restaurant$description.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$GetRestaurants$restaurant$description;

  TRes call({
    List<Subscription$GetRestaurants$restaurant$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Subscription$GetRestaurants$restaurant$description$translations> Function(
              Iterable<
                  CopyWith$Subscription$GetRestaurants$restaurant$description$translations<
                      Subscription$GetRestaurants$restaurant$description$translations>>)
          _fn);
}

class _CopyWithImpl$Subscription$GetRestaurants$restaurant$description<TRes>
    implements
        CopyWith$Subscription$GetRestaurants$restaurant$description<TRes> {
  _CopyWithImpl$Subscription$GetRestaurants$restaurant$description(
    this._instance,
    this._then,
  );

  final Subscription$GetRestaurants$restaurant$description _instance;

  final TRes Function(Subscription$GetRestaurants$restaurant$description) _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$GetRestaurants$restaurant$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Subscription$GetRestaurants$restaurant$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Subscription$GetRestaurants$restaurant$description$translations> Function(
                  Iterable<
                      CopyWith$Subscription$GetRestaurants$restaurant$description$translations<
                          Subscription$GetRestaurants$restaurant$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Subscription$GetRestaurants$restaurant$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$GetRestaurants$restaurant$description<TRes>
    implements
        CopyWith$Subscription$GetRestaurants$restaurant$description<TRes> {
  _CopyWithStubImpl$Subscription$GetRestaurants$restaurant$description(
      this._res);

  TRes _res;

  call({
    List<Subscription$GetRestaurants$restaurant$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Subscription$GetRestaurants$restaurant$description$translations {
  Subscription$GetRestaurants$restaurant$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Subscription$GetRestaurants$restaurant$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Subscription$GetRestaurants$restaurant$description$translations(
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
            is Subscription$GetRestaurants$restaurant$description$translations) ||
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

extension UtilityExtension$Subscription$GetRestaurants$restaurant$description$translations
    on Subscription$GetRestaurants$restaurant$description$translations {
  CopyWith$Subscription$GetRestaurants$restaurant$description$translations<
          Subscription$GetRestaurants$restaurant$description$translations>
      get copyWith =>
          CopyWith$Subscription$GetRestaurants$restaurant$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$GetRestaurants$restaurant$description$translations<
    TRes> {
  factory CopyWith$Subscription$GetRestaurants$restaurant$description$translations(
    Subscription$GetRestaurants$restaurant$description$translations instance,
    TRes Function(
            Subscription$GetRestaurants$restaurant$description$translations)
        then,
  ) = _CopyWithImpl$Subscription$GetRestaurants$restaurant$description$translations;

  factory CopyWith$Subscription$GetRestaurants$restaurant$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$GetRestaurants$restaurant$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$GetRestaurants$restaurant$description$translations<
        TRes>
    implements
        CopyWith$Subscription$GetRestaurants$restaurant$description$translations<
            TRes> {
  _CopyWithImpl$Subscription$GetRestaurants$restaurant$description$translations(
    this._instance,
    this._then,
  );

  final Subscription$GetRestaurants$restaurant$description$translations
      _instance;

  final TRes Function(
      Subscription$GetRestaurants$restaurant$description$translations) _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$GetRestaurants$restaurant$description$translations(
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

class _CopyWithStubImpl$Subscription$GetRestaurants$restaurant$description$translations<
        TRes>
    implements
        CopyWith$Subscription$GetRestaurants$restaurant$description$translations<
            TRes> {
  _CopyWithStubImpl$Subscription$GetRestaurants$restaurant$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$GetRestaurants$restaurant$payment_info {
  Subscription$GetRestaurants$restaurant$payment_info({
    required this.bank_transfer,
    required this.card,
    required this.cash,
    required this.$__typename,
  });

  factory Subscription$GetRestaurants$restaurant$payment_info.fromJson(
      Map<String, dynamic> json) {
    final l$bank_transfer = json['bank_transfer'];
    final l$card = json['card'];
    final l$cash = json['cash'];
    final l$$__typename = json['__typename'];
    return Subscription$GetRestaurants$restaurant$payment_info(
      bank_transfer: (l$bank_transfer as bool),
      card: (l$card as bool),
      cash: (l$cash as bool),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final bool bank_transfer;

  final bool card;

  final bool cash;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$bank_transfer = bank_transfer;
    _resultData['bank_transfer'] = l$bank_transfer;
    final l$card = card;
    _resultData['card'] = l$card;
    final l$cash = cash;
    _resultData['cash'] = l$cash;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$bank_transfer = bank_transfer;
    final l$card = card;
    final l$cash = cash;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$bank_transfer,
      l$card,
      l$cash,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$GetRestaurants$restaurant$payment_info) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$bank_transfer = bank_transfer;
    final lOther$bank_transfer = other.bank_transfer;
    if (l$bank_transfer != lOther$bank_transfer) {
      return false;
    }
    final l$card = card;
    final lOther$card = other.card;
    if (l$card != lOther$card) {
      return false;
    }
    final l$cash = cash;
    final lOther$cash = other.cash;
    if (l$cash != lOther$cash) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$GetRestaurants$restaurant$payment_info
    on Subscription$GetRestaurants$restaurant$payment_info {
  CopyWith$Subscription$GetRestaurants$restaurant$payment_info<
          Subscription$GetRestaurants$restaurant$payment_info>
      get copyWith =>
          CopyWith$Subscription$GetRestaurants$restaurant$payment_info(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$GetRestaurants$restaurant$payment_info<
    TRes> {
  factory CopyWith$Subscription$GetRestaurants$restaurant$payment_info(
    Subscription$GetRestaurants$restaurant$payment_info instance,
    TRes Function(Subscription$GetRestaurants$restaurant$payment_info) then,
  ) = _CopyWithImpl$Subscription$GetRestaurants$restaurant$payment_info;

  factory CopyWith$Subscription$GetRestaurants$restaurant$payment_info.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$GetRestaurants$restaurant$payment_info;

  TRes call({
    bool? bank_transfer,
    bool? card,
    bool? cash,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$GetRestaurants$restaurant$payment_info<TRes>
    implements
        CopyWith$Subscription$GetRestaurants$restaurant$payment_info<TRes> {
  _CopyWithImpl$Subscription$GetRestaurants$restaurant$payment_info(
    this._instance,
    this._then,
  );

  final Subscription$GetRestaurants$restaurant$payment_info _instance;

  final TRes Function(Subscription$GetRestaurants$restaurant$payment_info)
      _then;

  static const _undefined = {};

  TRes call({
    Object? bank_transfer = _undefined,
    Object? card = _undefined,
    Object? cash = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$GetRestaurants$restaurant$payment_info(
        bank_transfer: bank_transfer == _undefined || bank_transfer == null
            ? _instance.bank_transfer
            : (bank_transfer as bool),
        card: card == _undefined || card == null
            ? _instance.card
            : (card as bool),
        cash: cash == _undefined || cash == null
            ? _instance.cash
            : (cash as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$GetRestaurants$restaurant$payment_info<
        TRes>
    implements
        CopyWith$Subscription$GetRestaurants$restaurant$payment_info<TRes> {
  _CopyWithStubImpl$Subscription$GetRestaurants$restaurant$payment_info(
      this._res);

  TRes _res;

  call({
    bool? bank_transfer,
    bool? card,
    bool? cash,
    String? $__typename,
  }) =>
      _res;
}
