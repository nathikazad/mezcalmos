import '../../__generated/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

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

class Variables$Query$getCategoryInfoById {
  factory Variables$Query$getCategoryInfoById({required int id}) =>
      Variables$Query$getCategoryInfoById._({
        r'id': id,
      });

  Variables$Query$getCategoryInfoById._(this._$data);

  factory Variables$Query$getCategoryInfoById.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    return Variables$Query$getCategoryInfoById._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$getCategoryInfoById<
          Variables$Query$getCategoryInfoById>
      get copyWith => CopyWith$Variables$Query$getCategoryInfoById(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getCategoryInfoById) ||
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

abstract class CopyWith$Variables$Query$getCategoryInfoById<TRes> {
  factory CopyWith$Variables$Query$getCategoryInfoById(
    Variables$Query$getCategoryInfoById instance,
    TRes Function(Variables$Query$getCategoryInfoById) then,
  ) = _CopyWithImpl$Variables$Query$getCategoryInfoById;

  factory CopyWith$Variables$Query$getCategoryInfoById.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getCategoryInfoById;

  TRes call({int? id});
}

class _CopyWithImpl$Variables$Query$getCategoryInfoById<TRes>
    implements CopyWith$Variables$Query$getCategoryInfoById<TRes> {
  _CopyWithImpl$Variables$Query$getCategoryInfoById(
    this._instance,
    this._then,
  );

  final Variables$Query$getCategoryInfoById _instance;

  final TRes Function(Variables$Query$getCategoryInfoById) _then;

  static const _undefined = {};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$getCategoryInfoById._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getCategoryInfoById<TRes>
    implements CopyWith$Variables$Query$getCategoryInfoById<TRes> {
  _CopyWithStubImpl$Variables$Query$getCategoryInfoById(this._res);

  TRes _res;

  call({int? id}) => _res;
}

class Query$getCategoryInfoById {
  Query$getCategoryInfoById({
    this.restaurant_category_by_pk,
    required this.$__typename,
  });

  factory Query$getCategoryInfoById.fromJson(Map<String, dynamic> json) {
    final l$restaurant_category_by_pk = json['restaurant_category_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$getCategoryInfoById(
      restaurant_category_by_pk: l$restaurant_category_by_pk == null
          ? null
          : Query$getCategoryInfoById$restaurant_category_by_pk.fromJson(
              (l$restaurant_category_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getCategoryInfoById$restaurant_category_by_pk?
      restaurant_category_by_pk;

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
    if (!(other is Query$getCategoryInfoById) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$getCategoryInfoById
    on Query$getCategoryInfoById {
  CopyWith$Query$getCategoryInfoById<Query$getCategoryInfoById> get copyWith =>
      CopyWith$Query$getCategoryInfoById(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getCategoryInfoById<TRes> {
  factory CopyWith$Query$getCategoryInfoById(
    Query$getCategoryInfoById instance,
    TRes Function(Query$getCategoryInfoById) then,
  ) = _CopyWithImpl$Query$getCategoryInfoById;

  factory CopyWith$Query$getCategoryInfoById.stub(TRes res) =
      _CopyWithStubImpl$Query$getCategoryInfoById;

  TRes call({
    Query$getCategoryInfoById$restaurant_category_by_pk?
        restaurant_category_by_pk,
    String? $__typename,
  });
  CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk<TRes>
      get restaurant_category_by_pk;
}

class _CopyWithImpl$Query$getCategoryInfoById<TRes>
    implements CopyWith$Query$getCategoryInfoById<TRes> {
  _CopyWithImpl$Query$getCategoryInfoById(
    this._instance,
    this._then,
  );

  final Query$getCategoryInfoById _instance;

  final TRes Function(Query$getCategoryInfoById) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_category_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getCategoryInfoById(
        restaurant_category_by_pk: restaurant_category_by_pk == _undefined
            ? _instance.restaurant_category_by_pk
            : (restaurant_category_by_pk
                as Query$getCategoryInfoById$restaurant_category_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk<TRes>
      get restaurant_category_by_pk {
    final local$restaurant_category_by_pk = _instance.restaurant_category_by_pk;
    return local$restaurant_category_by_pk == null
        ? CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk(
            local$restaurant_category_by_pk,
            (e) => call(restaurant_category_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$getCategoryInfoById<TRes>
    implements CopyWith$Query$getCategoryInfoById<TRes> {
  _CopyWithStubImpl$Query$getCategoryInfoById(this._res);

  TRes _res;

  call({
    Query$getCategoryInfoById$restaurant_category_by_pk?
        restaurant_category_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk<TRes>
      get restaurant_category_by_pk =>
          CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk.stub(
              _res);
}

const documentNodeQuerygetCategoryInfoById = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getCategoryInfoById'),
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
            name: NameNode(value: 'position'),
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
Query$getCategoryInfoById _parserFn$Query$getCategoryInfoById(
        Map<String, dynamic> data) =>
    Query$getCategoryInfoById.fromJson(data);

class Options$Query$getCategoryInfoById
    extends graphql.QueryOptions<Query$getCategoryInfoById> {
  Options$Query$getCategoryInfoById({
    String? operationName,
    required Variables$Query$getCategoryInfoById variables,
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
          document: documentNodeQuerygetCategoryInfoById,
          parserFn: _parserFn$Query$getCategoryInfoById,
        );
}

class WatchOptions$Query$getCategoryInfoById
    extends graphql.WatchQueryOptions<Query$getCategoryInfoById> {
  WatchOptions$Query$getCategoryInfoById({
    String? operationName,
    required Variables$Query$getCategoryInfoById variables,
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
          document: documentNodeQuerygetCategoryInfoById,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getCategoryInfoById,
        );
}

class FetchMoreOptions$Query$getCategoryInfoById
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getCategoryInfoById({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getCategoryInfoById variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetCategoryInfoById,
        );
}

extension ClientExtension$Query$getCategoryInfoById on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getCategoryInfoById>>
      query$getCategoryInfoById(
              Options$Query$getCategoryInfoById options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getCategoryInfoById>
      watchQuery$getCategoryInfoById(
              WatchOptions$Query$getCategoryInfoById options) =>
          this.watchQuery(options);
  void writeQuery$getCategoryInfoById({
    required Query$getCategoryInfoById data,
    required Variables$Query$getCategoryInfoById variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerygetCategoryInfoById),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getCategoryInfoById? readQuery$getCategoryInfoById({
    required Variables$Query$getCategoryInfoById variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetCategoryInfoById),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getCategoryInfoById.fromJson(result);
  }
}

class Query$getCategoryInfoById$restaurant_category_by_pk {
  Query$getCategoryInfoById$restaurant_category_by_pk({
    required this.id,
    required this.name,
    this.description,
    required this.position,
    this.description_id,
    required this.$__typename,
  });

  factory Query$getCategoryInfoById$restaurant_category_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$description = json['description'];
    final l$position = json['position'];
    final l$description_id = json['description_id'];
    final l$$__typename = json['__typename'];
    return Query$getCategoryInfoById$restaurant_category_by_pk(
      id: (l$id as int),
      name: Query$getCategoryInfoById$restaurant_category_by_pk$name.fromJson(
          (l$name as Map<String, dynamic>)),
      description: l$description == null
          ? null
          : Query$getCategoryInfoById$restaurant_category_by_pk$description
              .fromJson((l$description as Map<String, dynamic>)),
      position: (l$position as int),
      description_id: (l$description_id as int?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$getCategoryInfoById$restaurant_category_by_pk$name name;

  final Query$getCategoryInfoById$restaurant_category_by_pk$description?
      description;

  final int position;

  final int? description_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
    final l$position = position;
    _resultData['position'] = l$position;
    final l$description_id = description_id;
    _resultData['description_id'] = l$description_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$description = description;
    final l$position = position;
    final l$description_id = description_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$description,
      l$position,
      l$description_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getCategoryInfoById$restaurant_category_by_pk) ||
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
    final l$position = position;
    final lOther$position = other.position;
    if (l$position != lOther$position) {
      return false;
    }
    final l$description_id = description_id;
    final lOther$description_id = other.description_id;
    if (l$description_id != lOther$description_id) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getCategoryInfoById$restaurant_category_by_pk
    on Query$getCategoryInfoById$restaurant_category_by_pk {
  CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk<
          Query$getCategoryInfoById$restaurant_category_by_pk>
      get copyWith =>
          CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk<
    TRes> {
  factory CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk(
    Query$getCategoryInfoById$restaurant_category_by_pk instance,
    TRes Function(Query$getCategoryInfoById$restaurant_category_by_pk) then,
  ) = _CopyWithImpl$Query$getCategoryInfoById$restaurant_category_by_pk;

  factory CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCategoryInfoById$restaurant_category_by_pk;

  TRes call({
    int? id,
    Query$getCategoryInfoById$restaurant_category_by_pk$name? name,
    Query$getCategoryInfoById$restaurant_category_by_pk$description?
        description,
    int? position,
    int? description_id,
    String? $__typename,
  });
  CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk$name<TRes>
      get name;
  CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk$description<TRes>
      get description;
}

class _CopyWithImpl$Query$getCategoryInfoById$restaurant_category_by_pk<TRes>
    implements
        CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk<TRes> {
  _CopyWithImpl$Query$getCategoryInfoById$restaurant_category_by_pk(
    this._instance,
    this._then,
  );

  final Query$getCategoryInfoById$restaurant_category_by_pk _instance;

  final TRes Function(Query$getCategoryInfoById$restaurant_category_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? position = _undefined,
    Object? description_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getCategoryInfoById$restaurant_category_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Query$getCategoryInfoById$restaurant_category_by_pk$name),
        description: description == _undefined
            ? _instance.description
            : (description
                as Query$getCategoryInfoById$restaurant_category_by_pk$description?),
        position: position == _undefined || position == null
            ? _instance.position
            : (position as int),
        description_id: description_id == _undefined
            ? _instance.description_id
            : (description_id as int?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk$name<TRes>
      get name {
    final local$name = _instance.name;
    return CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk$name(
        local$name, (e) => call(name: e));
  }

  CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk$description<TRes>
      get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk$description
            .stub(_then(_instance))
        : CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk$description(
            local$description, (e) => call(description: e));
  }
}

class _CopyWithStubImpl$Query$getCategoryInfoById$restaurant_category_by_pk<
        TRes>
    implements
        CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk<TRes> {
  _CopyWithStubImpl$Query$getCategoryInfoById$restaurant_category_by_pk(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$getCategoryInfoById$restaurant_category_by_pk$name? name,
    Query$getCategoryInfoById$restaurant_category_by_pk$description?
        description,
    int? position,
    int? description_id,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk$name<TRes>
      get name =>
          CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk$name
              .stub(_res);
  CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk$description<TRes>
      get description =>
          CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk$description
              .stub(_res);
}

class Query$getCategoryInfoById$restaurant_category_by_pk$name {
  Query$getCategoryInfoById$restaurant_category_by_pk$name({
    required this.id,
    required this.translations,
    required this.$__typename,
  });

  factory Query$getCategoryInfoById$restaurant_category_by_pk$name.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getCategoryInfoById$restaurant_category_by_pk$name(
      id: (l$id as int),
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getCategoryInfoById$restaurant_category_by_pk$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final List<
          Query$getCategoryInfoById$restaurant_category_by_pk$name$translations>
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
    if (!(other is Query$getCategoryInfoById$restaurant_category_by_pk$name) ||
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

extension UtilityExtension$Query$getCategoryInfoById$restaurant_category_by_pk$name
    on Query$getCategoryInfoById$restaurant_category_by_pk$name {
  CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk$name<
          Query$getCategoryInfoById$restaurant_category_by_pk$name>
      get copyWith =>
          CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk$name<
    TRes> {
  factory CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk$name(
    Query$getCategoryInfoById$restaurant_category_by_pk$name instance,
    TRes Function(Query$getCategoryInfoById$restaurant_category_by_pk$name)
        then,
  ) = _CopyWithImpl$Query$getCategoryInfoById$restaurant_category_by_pk$name;

  factory CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCategoryInfoById$restaurant_category_by_pk$name;

  TRes call({
    int? id,
    List<Query$getCategoryInfoById$restaurant_category_by_pk$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getCategoryInfoById$restaurant_category_by_pk$name$translations> Function(
              Iterable<
                  CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk$name$translations<
                      Query$getCategoryInfoById$restaurant_category_by_pk$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getCategoryInfoById$restaurant_category_by_pk$name<
        TRes>
    implements
        CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk$name<
            TRes> {
  _CopyWithImpl$Query$getCategoryInfoById$restaurant_category_by_pk$name(
    this._instance,
    this._then,
  );

  final Query$getCategoryInfoById$restaurant_category_by_pk$name _instance;

  final TRes Function(Query$getCategoryInfoById$restaurant_category_by_pk$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getCategoryInfoById$restaurant_category_by_pk$name(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getCategoryInfoById$restaurant_category_by_pk$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getCategoryInfoById$restaurant_category_by_pk$name$translations> Function(
                  Iterable<
                      CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk$name$translations<
                          Query$getCategoryInfoById$restaurant_category_by_pk$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getCategoryInfoById$restaurant_category_by_pk$name<
        TRes>
    implements
        CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk$name<
            TRes> {
  _CopyWithStubImpl$Query$getCategoryInfoById$restaurant_category_by_pk$name(
      this._res);

  TRes _res;

  call({
    int? id,
    List<Query$getCategoryInfoById$restaurant_category_by_pk$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getCategoryInfoById$restaurant_category_by_pk$name$translations {
  Query$getCategoryInfoById$restaurant_category_by_pk$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getCategoryInfoById$restaurant_category_by_pk$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getCategoryInfoById$restaurant_category_by_pk$name$translations(
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
            is Query$getCategoryInfoById$restaurant_category_by_pk$name$translations) ||
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

extension UtilityExtension$Query$getCategoryInfoById$restaurant_category_by_pk$name$translations
    on Query$getCategoryInfoById$restaurant_category_by_pk$name$translations {
  CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk$name$translations<
          Query$getCategoryInfoById$restaurant_category_by_pk$name$translations>
      get copyWith =>
          CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk$name$translations<
    TRes> {
  factory CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk$name$translations(
    Query$getCategoryInfoById$restaurant_category_by_pk$name$translations
        instance,
    TRes Function(
            Query$getCategoryInfoById$restaurant_category_by_pk$name$translations)
        then,
  ) = _CopyWithImpl$Query$getCategoryInfoById$restaurant_category_by_pk$name$translations;

  factory CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCategoryInfoById$restaurant_category_by_pk$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getCategoryInfoById$restaurant_category_by_pk$name$translations<
        TRes>
    implements
        CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk$name$translations<
            TRes> {
  _CopyWithImpl$Query$getCategoryInfoById$restaurant_category_by_pk$name$translations(
    this._instance,
    this._then,
  );

  final Query$getCategoryInfoById$restaurant_category_by_pk$name$translations
      _instance;

  final TRes Function(
          Query$getCategoryInfoById$restaurant_category_by_pk$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getCategoryInfoById$restaurant_category_by_pk$name$translations(
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

class _CopyWithStubImpl$Query$getCategoryInfoById$restaurant_category_by_pk$name$translations<
        TRes>
    implements
        CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$getCategoryInfoById$restaurant_category_by_pk$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$getCategoryInfoById$restaurant_category_by_pk$description {
  Query$getCategoryInfoById$restaurant_category_by_pk$description({
    required this.id,
    required this.translations,
    required this.$__typename,
  });

  factory Query$getCategoryInfoById$restaurant_category_by_pk$description.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getCategoryInfoById$restaurant_category_by_pk$description(
      id: (l$id as int),
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getCategoryInfoById$restaurant_category_by_pk$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final List<
          Query$getCategoryInfoById$restaurant_category_by_pk$description$translations>
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
            is Query$getCategoryInfoById$restaurant_category_by_pk$description) ||
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

extension UtilityExtension$Query$getCategoryInfoById$restaurant_category_by_pk$description
    on Query$getCategoryInfoById$restaurant_category_by_pk$description {
  CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk$description<
          Query$getCategoryInfoById$restaurant_category_by_pk$description>
      get copyWith =>
          CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk$description<
    TRes> {
  factory CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk$description(
    Query$getCategoryInfoById$restaurant_category_by_pk$description instance,
    TRes Function(
            Query$getCategoryInfoById$restaurant_category_by_pk$description)
        then,
  ) = _CopyWithImpl$Query$getCategoryInfoById$restaurant_category_by_pk$description;

  factory CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk$description.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCategoryInfoById$restaurant_category_by_pk$description;

  TRes call({
    int? id,
    List<Query$getCategoryInfoById$restaurant_category_by_pk$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getCategoryInfoById$restaurant_category_by_pk$description$translations> Function(
              Iterable<
                  CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk$description$translations<
                      Query$getCategoryInfoById$restaurant_category_by_pk$description$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getCategoryInfoById$restaurant_category_by_pk$description<
        TRes>
    implements
        CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk$description<
            TRes> {
  _CopyWithImpl$Query$getCategoryInfoById$restaurant_category_by_pk$description(
    this._instance,
    this._then,
  );

  final Query$getCategoryInfoById$restaurant_category_by_pk$description
      _instance;

  final TRes Function(
      Query$getCategoryInfoById$restaurant_category_by_pk$description) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getCategoryInfoById$restaurant_category_by_pk$description(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getCategoryInfoById$restaurant_category_by_pk$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getCategoryInfoById$restaurant_category_by_pk$description$translations> Function(
                  Iterable<
                      CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk$description$translations<
                          Query$getCategoryInfoById$restaurant_category_by_pk$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getCategoryInfoById$restaurant_category_by_pk$description<
        TRes>
    implements
        CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk$description<
            TRes> {
  _CopyWithStubImpl$Query$getCategoryInfoById$restaurant_category_by_pk$description(
      this._res);

  TRes _res;

  call({
    int? id,
    List<Query$getCategoryInfoById$restaurant_category_by_pk$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getCategoryInfoById$restaurant_category_by_pk$description$translations {
  Query$getCategoryInfoById$restaurant_category_by_pk$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getCategoryInfoById$restaurant_category_by_pk$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getCategoryInfoById$restaurant_category_by_pk$description$translations(
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
            is Query$getCategoryInfoById$restaurant_category_by_pk$description$translations) ||
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

extension UtilityExtension$Query$getCategoryInfoById$restaurant_category_by_pk$description$translations
    on Query$getCategoryInfoById$restaurant_category_by_pk$description$translations {
  CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk$description$translations<
          Query$getCategoryInfoById$restaurant_category_by_pk$description$translations>
      get copyWith =>
          CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk$description$translations<
    TRes> {
  factory CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk$description$translations(
    Query$getCategoryInfoById$restaurant_category_by_pk$description$translations
        instance,
    TRes Function(
            Query$getCategoryInfoById$restaurant_category_by_pk$description$translations)
        then,
  ) = _CopyWithImpl$Query$getCategoryInfoById$restaurant_category_by_pk$description$translations;

  factory CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCategoryInfoById$restaurant_category_by_pk$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getCategoryInfoById$restaurant_category_by_pk$description$translations<
        TRes>
    implements
        CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk$description$translations<
            TRes> {
  _CopyWithImpl$Query$getCategoryInfoById$restaurant_category_by_pk$description$translations(
    this._instance,
    this._then,
  );

  final Query$getCategoryInfoById$restaurant_category_by_pk$description$translations
      _instance;

  final TRes Function(
          Query$getCategoryInfoById$restaurant_category_by_pk$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getCategoryInfoById$restaurant_category_by_pk$description$translations(
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

class _CopyWithStubImpl$Query$getCategoryInfoById$restaurant_category_by_pk$description$translations<
        TRes>
    implements
        CopyWith$Query$getCategoryInfoById$restaurant_category_by_pk$description$translations<
            TRes> {
  _CopyWithStubImpl$Query$getCategoryInfoById$restaurant_category_by_pk$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$deleteCategory {
  factory Variables$Mutation$deleteCategory({required int categoryId}) =>
      Variables$Mutation$deleteCategory._({
        r'categoryId': categoryId,
      });

  Variables$Mutation$deleteCategory._(this._$data);

  factory Variables$Mutation$deleteCategory.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$categoryId = data['categoryId'];
    result$data['categoryId'] = (l$categoryId as int);
    return Variables$Mutation$deleteCategory._(result$data);
  }

  Map<String, dynamic> _$data;

  int get categoryId => (_$data['categoryId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$categoryId = categoryId;
    result$data['categoryId'] = l$categoryId;
    return result$data;
  }

  CopyWith$Variables$Mutation$deleteCategory<Variables$Mutation$deleteCategory>
      get copyWith => CopyWith$Variables$Mutation$deleteCategory(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$deleteCategory) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$categoryId = categoryId;
    final lOther$categoryId = other.categoryId;
    if (l$categoryId != lOther$categoryId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$categoryId = categoryId;
    return Object.hashAll([l$categoryId]);
  }
}

abstract class CopyWith$Variables$Mutation$deleteCategory<TRes> {
  factory CopyWith$Variables$Mutation$deleteCategory(
    Variables$Mutation$deleteCategory instance,
    TRes Function(Variables$Mutation$deleteCategory) then,
  ) = _CopyWithImpl$Variables$Mutation$deleteCategory;

  factory CopyWith$Variables$Mutation$deleteCategory.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$deleteCategory;

  TRes call({int? categoryId});
}

class _CopyWithImpl$Variables$Mutation$deleteCategory<TRes>
    implements CopyWith$Variables$Mutation$deleteCategory<TRes> {
  _CopyWithImpl$Variables$Mutation$deleteCategory(
    this._instance,
    this._then,
  );

  final Variables$Mutation$deleteCategory _instance;

  final TRes Function(Variables$Mutation$deleteCategory) _then;

  static const _undefined = {};

  TRes call({Object? categoryId = _undefined}) =>
      _then(Variables$Mutation$deleteCategory._({
        ..._instance._$data,
        if (categoryId != _undefined && categoryId != null)
          'categoryId': (categoryId as int),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$deleteCategory<TRes>
    implements CopyWith$Variables$Mutation$deleteCategory<TRes> {
  _CopyWithStubImpl$Variables$Mutation$deleteCategory(this._res);

  TRes _res;

  call({int? categoryId}) => _res;
}

class Mutation$deleteCategory {
  Mutation$deleteCategory({
    this.delete_restaurant_category_by_pk,
    required this.$__typename,
  });

  factory Mutation$deleteCategory.fromJson(Map<String, dynamic> json) {
    final l$delete_restaurant_category_by_pk =
        json['delete_restaurant_category_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$deleteCategory(
      delete_restaurant_category_by_pk: l$delete_restaurant_category_by_pk ==
              null
          ? null
          : Mutation$deleteCategory$delete_restaurant_category_by_pk.fromJson(
              (l$delete_restaurant_category_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$deleteCategory$delete_restaurant_category_by_pk?
      delete_restaurant_category_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delete_restaurant_category_by_pk = delete_restaurant_category_by_pk;
    _resultData['delete_restaurant_category_by_pk'] =
        l$delete_restaurant_category_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delete_restaurant_category_by_pk = delete_restaurant_category_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$delete_restaurant_category_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$deleteCategory) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delete_restaurant_category_by_pk = delete_restaurant_category_by_pk;
    final lOther$delete_restaurant_category_by_pk =
        other.delete_restaurant_category_by_pk;
    if (l$delete_restaurant_category_by_pk !=
        lOther$delete_restaurant_category_by_pk) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$deleteCategory on Mutation$deleteCategory {
  CopyWith$Mutation$deleteCategory<Mutation$deleteCategory> get copyWith =>
      CopyWith$Mutation$deleteCategory(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$deleteCategory<TRes> {
  factory CopyWith$Mutation$deleteCategory(
    Mutation$deleteCategory instance,
    TRes Function(Mutation$deleteCategory) then,
  ) = _CopyWithImpl$Mutation$deleteCategory;

  factory CopyWith$Mutation$deleteCategory.stub(TRes res) =
      _CopyWithStubImpl$Mutation$deleteCategory;

  TRes call({
    Mutation$deleteCategory$delete_restaurant_category_by_pk?
        delete_restaurant_category_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$deleteCategory$delete_restaurant_category_by_pk<TRes>
      get delete_restaurant_category_by_pk;
}

class _CopyWithImpl$Mutation$deleteCategory<TRes>
    implements CopyWith$Mutation$deleteCategory<TRes> {
  _CopyWithImpl$Mutation$deleteCategory(
    this._instance,
    this._then,
  );

  final Mutation$deleteCategory _instance;

  final TRes Function(Mutation$deleteCategory) _then;

  static const _undefined = {};

  TRes call({
    Object? delete_restaurant_category_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$deleteCategory(
        delete_restaurant_category_by_pk: delete_restaurant_category_by_pk ==
                _undefined
            ? _instance.delete_restaurant_category_by_pk
            : (delete_restaurant_category_by_pk
                as Mutation$deleteCategory$delete_restaurant_category_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$deleteCategory$delete_restaurant_category_by_pk<TRes>
      get delete_restaurant_category_by_pk {
    final local$delete_restaurant_category_by_pk =
        _instance.delete_restaurant_category_by_pk;
    return local$delete_restaurant_category_by_pk == null
        ? CopyWith$Mutation$deleteCategory$delete_restaurant_category_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$deleteCategory$delete_restaurant_category_by_pk(
            local$delete_restaurant_category_by_pk,
            (e) => call(delete_restaurant_category_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$deleteCategory<TRes>
    implements CopyWith$Mutation$deleteCategory<TRes> {
  _CopyWithStubImpl$Mutation$deleteCategory(this._res);

  TRes _res;

  call({
    Mutation$deleteCategory$delete_restaurant_category_by_pk?
        delete_restaurant_category_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$deleteCategory$delete_restaurant_category_by_pk<TRes>
      get delete_restaurant_category_by_pk =>
          CopyWith$Mutation$deleteCategory$delete_restaurant_category_by_pk
              .stub(_res);
}

const documentNodeMutationdeleteCategory = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'deleteCategory'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'categoryId')),
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
        name: NameNode(value: 'delete_restaurant_category_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'categoryId')),
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
Mutation$deleteCategory _parserFn$Mutation$deleteCategory(
        Map<String, dynamic> data) =>
    Mutation$deleteCategory.fromJson(data);
typedef OnMutationCompleted$Mutation$deleteCategory = FutureOr<void> Function(
  dynamic,
  Mutation$deleteCategory?,
);

class Options$Mutation$deleteCategory
    extends graphql.MutationOptions<Mutation$deleteCategory> {
  Options$Mutation$deleteCategory({
    String? operationName,
    required Variables$Mutation$deleteCategory variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$deleteCategory? onCompleted,
    graphql.OnMutationUpdate<Mutation$deleteCategory>? update,
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
                        : _parserFn$Mutation$deleteCategory(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationdeleteCategory,
          parserFn: _parserFn$Mutation$deleteCategory,
        );

  final OnMutationCompleted$Mutation$deleteCategory? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$deleteCategory
    extends graphql.WatchQueryOptions<Mutation$deleteCategory> {
  WatchOptions$Mutation$deleteCategory({
    String? operationName,
    required Variables$Mutation$deleteCategory variables,
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
          document: documentNodeMutationdeleteCategory,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$deleteCategory,
        );
}

extension ClientExtension$Mutation$deleteCategory on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$deleteCategory>> mutate$deleteCategory(
          Options$Mutation$deleteCategory options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$deleteCategory> watchMutation$deleteCategory(
          WatchOptions$Mutation$deleteCategory options) =>
      this.watchMutation(options);
}

class Mutation$deleteCategory$delete_restaurant_category_by_pk {
  Mutation$deleteCategory$delete_restaurant_category_by_pk({
    required this.id,
    required this.name,
    required this.position,
    required this.restaurant_id,
    required this.$__typename,
  });

  factory Mutation$deleteCategory$delete_restaurant_category_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$position = json['position'];
    final l$restaurant_id = json['restaurant_id'];
    final l$$__typename = json['__typename'];
    return Mutation$deleteCategory$delete_restaurant_category_by_pk(
      id: (l$id as int),
      name: Mutation$deleteCategory$delete_restaurant_category_by_pk$name
          .fromJson((l$name as Map<String, dynamic>)),
      position: (l$position as int),
      restaurant_id: (l$restaurant_id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Mutation$deleteCategory$delete_restaurant_category_by_pk$name name;

  final int position;

  final int restaurant_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$position = position;
    _resultData['position'] = l$position;
    final l$restaurant_id = restaurant_id;
    _resultData['restaurant_id'] = l$restaurant_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$position = position;
    final l$restaurant_id = restaurant_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$position,
      l$restaurant_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$deleteCategory$delete_restaurant_category_by_pk) ||
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
    final l$position = position;
    final lOther$position = other.position;
    if (l$position != lOther$position) {
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

extension UtilityExtension$Mutation$deleteCategory$delete_restaurant_category_by_pk
    on Mutation$deleteCategory$delete_restaurant_category_by_pk {
  CopyWith$Mutation$deleteCategory$delete_restaurant_category_by_pk<
          Mutation$deleteCategory$delete_restaurant_category_by_pk>
      get copyWith =>
          CopyWith$Mutation$deleteCategory$delete_restaurant_category_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$deleteCategory$delete_restaurant_category_by_pk<
    TRes> {
  factory CopyWith$Mutation$deleteCategory$delete_restaurant_category_by_pk(
    Mutation$deleteCategory$delete_restaurant_category_by_pk instance,
    TRes Function(Mutation$deleteCategory$delete_restaurant_category_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$deleteCategory$delete_restaurant_category_by_pk;

  factory CopyWith$Mutation$deleteCategory$delete_restaurant_category_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$deleteCategory$delete_restaurant_category_by_pk;

  TRes call({
    int? id,
    Mutation$deleteCategory$delete_restaurant_category_by_pk$name? name,
    int? position,
    int? restaurant_id,
    String? $__typename,
  });
  CopyWith$Mutation$deleteCategory$delete_restaurant_category_by_pk$name<TRes>
      get name;
}

class _CopyWithImpl$Mutation$deleteCategory$delete_restaurant_category_by_pk<
        TRes>
    implements
        CopyWith$Mutation$deleteCategory$delete_restaurant_category_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$deleteCategory$delete_restaurant_category_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$deleteCategory$delete_restaurant_category_by_pk _instance;

  final TRes Function(Mutation$deleteCategory$delete_restaurant_category_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? position = _undefined,
    Object? restaurant_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$deleteCategory$delete_restaurant_category_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Mutation$deleteCategory$delete_restaurant_category_by_pk$name),
        position: position == _undefined || position == null
            ? _instance.position
            : (position as int),
        restaurant_id: restaurant_id == _undefined || restaurant_id == null
            ? _instance.restaurant_id
            : (restaurant_id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$deleteCategory$delete_restaurant_category_by_pk$name<TRes>
      get name {
    final local$name = _instance.name;
    return CopyWith$Mutation$deleteCategory$delete_restaurant_category_by_pk$name(
        local$name, (e) => call(name: e));
  }
}

class _CopyWithStubImpl$Mutation$deleteCategory$delete_restaurant_category_by_pk<
        TRes>
    implements
        CopyWith$Mutation$deleteCategory$delete_restaurant_category_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$deleteCategory$delete_restaurant_category_by_pk(
      this._res);

  TRes _res;

  call({
    int? id,
    Mutation$deleteCategory$delete_restaurant_category_by_pk$name? name,
    int? position,
    int? restaurant_id,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$deleteCategory$delete_restaurant_category_by_pk$name<TRes>
      get name =>
          CopyWith$Mutation$deleteCategory$delete_restaurant_category_by_pk$name
              .stub(_res);
}

class Mutation$deleteCategory$delete_restaurant_category_by_pk$name {
  Mutation$deleteCategory$delete_restaurant_category_by_pk$name({
    required this.translations,
    required this.$__typename,
  });

  factory Mutation$deleteCategory$delete_restaurant_category_by_pk$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Mutation$deleteCategory$delete_restaurant_category_by_pk$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Mutation$deleteCategory$delete_restaurant_category_by_pk$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Mutation$deleteCategory$delete_restaurant_category_by_pk$name$translations>
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
            is Mutation$deleteCategory$delete_restaurant_category_by_pk$name) ||
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

extension UtilityExtension$Mutation$deleteCategory$delete_restaurant_category_by_pk$name
    on Mutation$deleteCategory$delete_restaurant_category_by_pk$name {
  CopyWith$Mutation$deleteCategory$delete_restaurant_category_by_pk$name<
          Mutation$deleteCategory$delete_restaurant_category_by_pk$name>
      get copyWith =>
          CopyWith$Mutation$deleteCategory$delete_restaurant_category_by_pk$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$deleteCategory$delete_restaurant_category_by_pk$name<
    TRes> {
  factory CopyWith$Mutation$deleteCategory$delete_restaurant_category_by_pk$name(
    Mutation$deleteCategory$delete_restaurant_category_by_pk$name instance,
    TRes Function(Mutation$deleteCategory$delete_restaurant_category_by_pk$name)
        then,
  ) = _CopyWithImpl$Mutation$deleteCategory$delete_restaurant_category_by_pk$name;

  factory CopyWith$Mutation$deleteCategory$delete_restaurant_category_by_pk$name.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$deleteCategory$delete_restaurant_category_by_pk$name;

  TRes call({
    List<Mutation$deleteCategory$delete_restaurant_category_by_pk$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Mutation$deleteCategory$delete_restaurant_category_by_pk$name$translations> Function(
              Iterable<
                  CopyWith$Mutation$deleteCategory$delete_restaurant_category_by_pk$name$translations<
                      Mutation$deleteCategory$delete_restaurant_category_by_pk$name$translations>>)
          _fn);
}

class _CopyWithImpl$Mutation$deleteCategory$delete_restaurant_category_by_pk$name<
        TRes>
    implements
        CopyWith$Mutation$deleteCategory$delete_restaurant_category_by_pk$name<
            TRes> {
  _CopyWithImpl$Mutation$deleteCategory$delete_restaurant_category_by_pk$name(
    this._instance,
    this._then,
  );

  final Mutation$deleteCategory$delete_restaurant_category_by_pk$name _instance;

  final TRes Function(
      Mutation$deleteCategory$delete_restaurant_category_by_pk$name) _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$deleteCategory$delete_restaurant_category_by_pk$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Mutation$deleteCategory$delete_restaurant_category_by_pk$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Mutation$deleteCategory$delete_restaurant_category_by_pk$name$translations> Function(
                  Iterable<
                      CopyWith$Mutation$deleteCategory$delete_restaurant_category_by_pk$name$translations<
                          Mutation$deleteCategory$delete_restaurant_category_by_pk$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Mutation$deleteCategory$delete_restaurant_category_by_pk$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Mutation$deleteCategory$delete_restaurant_category_by_pk$name<
        TRes>
    implements
        CopyWith$Mutation$deleteCategory$delete_restaurant_category_by_pk$name<
            TRes> {
  _CopyWithStubImpl$Mutation$deleteCategory$delete_restaurant_category_by_pk$name(
      this._res);

  TRes _res;

  call({
    List<Mutation$deleteCategory$delete_restaurant_category_by_pk$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Mutation$deleteCategory$delete_restaurant_category_by_pk$name$translations {
  Mutation$deleteCategory$delete_restaurant_category_by_pk$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Mutation$deleteCategory$delete_restaurant_category_by_pk$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Mutation$deleteCategory$delete_restaurant_category_by_pk$name$translations(
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
            is Mutation$deleteCategory$delete_restaurant_category_by_pk$name$translations) ||
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

extension UtilityExtension$Mutation$deleteCategory$delete_restaurant_category_by_pk$name$translations
    on Mutation$deleteCategory$delete_restaurant_category_by_pk$name$translations {
  CopyWith$Mutation$deleteCategory$delete_restaurant_category_by_pk$name$translations<
          Mutation$deleteCategory$delete_restaurant_category_by_pk$name$translations>
      get copyWith =>
          CopyWith$Mutation$deleteCategory$delete_restaurant_category_by_pk$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$deleteCategory$delete_restaurant_category_by_pk$name$translations<
    TRes> {
  factory CopyWith$Mutation$deleteCategory$delete_restaurant_category_by_pk$name$translations(
    Mutation$deleteCategory$delete_restaurant_category_by_pk$name$translations
        instance,
    TRes Function(
            Mutation$deleteCategory$delete_restaurant_category_by_pk$name$translations)
        then,
  ) = _CopyWithImpl$Mutation$deleteCategory$delete_restaurant_category_by_pk$name$translations;

  factory CopyWith$Mutation$deleteCategory$delete_restaurant_category_by_pk$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$deleteCategory$delete_restaurant_category_by_pk$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$deleteCategory$delete_restaurant_category_by_pk$name$translations<
        TRes>
    implements
        CopyWith$Mutation$deleteCategory$delete_restaurant_category_by_pk$name$translations<
            TRes> {
  _CopyWithImpl$Mutation$deleteCategory$delete_restaurant_category_by_pk$name$translations(
    this._instance,
    this._then,
  );

  final Mutation$deleteCategory$delete_restaurant_category_by_pk$name$translations
      _instance;

  final TRes Function(
          Mutation$deleteCategory$delete_restaurant_category_by_pk$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$deleteCategory$delete_restaurant_category_by_pk$name$translations(
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

class _CopyWithStubImpl$Mutation$deleteCategory$delete_restaurant_category_by_pk$name$translations<
        TRes>
    implements
        CopyWith$Mutation$deleteCategory$delete_restaurant_category_by_pk$name$translations<
            TRes> {
  _CopyWithStubImpl$Mutation$deleteCategory$delete_restaurant_category_by_pk$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getRestaurantCategories {
  factory Variables$Query$getRestaurantCategories({int? id}) =>
      Variables$Query$getRestaurantCategories._({
        if (id != null) r'id': id,
      });

  Variables$Query$getRestaurantCategories._(this._$data);

  factory Variables$Query$getRestaurantCategories.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('id')) {
      final l$id = data['id'];
      result$data['id'] = (l$id as int?);
    }
    return Variables$Query$getRestaurantCategories._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get id => (_$data['id'] as int?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('id')) {
      final l$id = id;
      result$data['id'] = l$id;
    }
    return result$data;
  }

  CopyWith$Variables$Query$getRestaurantCategories<
          Variables$Query$getRestaurantCategories>
      get copyWith => CopyWith$Variables$Query$getRestaurantCategories(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getRestaurantCategories) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (_$data.containsKey('id') != other._$data.containsKey('id')) {
      return false;
    }
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([_$data.containsKey('id') ? l$id : const {}]);
  }
}

abstract class CopyWith$Variables$Query$getRestaurantCategories<TRes> {
  factory CopyWith$Variables$Query$getRestaurantCategories(
    Variables$Query$getRestaurantCategories instance,
    TRes Function(Variables$Query$getRestaurantCategories) then,
  ) = _CopyWithImpl$Variables$Query$getRestaurantCategories;

  factory CopyWith$Variables$Query$getRestaurantCategories.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getRestaurantCategories;

  TRes call({int? id});
}

class _CopyWithImpl$Variables$Query$getRestaurantCategories<TRes>
    implements CopyWith$Variables$Query$getRestaurantCategories<TRes> {
  _CopyWithImpl$Variables$Query$getRestaurantCategories(
    this._instance,
    this._then,
  );

  final Variables$Query$getRestaurantCategories _instance;

  final TRes Function(Variables$Query$getRestaurantCategories) _then;

  static const _undefined = {};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$getRestaurantCategories._({
        ..._instance._$data,
        if (id != _undefined) 'id': (id as int?),
      }));
}

class _CopyWithStubImpl$Variables$Query$getRestaurantCategories<TRes>
    implements CopyWith$Variables$Query$getRestaurantCategories<TRes> {
  _CopyWithStubImpl$Variables$Query$getRestaurantCategories(this._res);

  TRes _res;

  call({int? id}) => _res;
}

class Query$getRestaurantCategories {
  Query$getRestaurantCategories({
    required this.restaurant_category,
    required this.$__typename,
  });

  factory Query$getRestaurantCategories.fromJson(Map<String, dynamic> json) {
    final l$restaurant_category = json['restaurant_category'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantCategories(
      restaurant_category: (l$restaurant_category as List<dynamic>)
          .map((e) =>
              Query$getRestaurantCategories$restaurant_category.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getRestaurantCategories$restaurant_category>
      restaurant_category;

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
    if (!(other is Query$getRestaurantCategories) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$getRestaurantCategories
    on Query$getRestaurantCategories {
  CopyWith$Query$getRestaurantCategories<Query$getRestaurantCategories>
      get copyWith => CopyWith$Query$getRestaurantCategories(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantCategories<TRes> {
  factory CopyWith$Query$getRestaurantCategories(
    Query$getRestaurantCategories instance,
    TRes Function(Query$getRestaurantCategories) then,
  ) = _CopyWithImpl$Query$getRestaurantCategories;

  factory CopyWith$Query$getRestaurantCategories.stub(TRes res) =
      _CopyWithStubImpl$Query$getRestaurantCategories;

  TRes call({
    List<Query$getRestaurantCategories$restaurant_category>?
        restaurant_category,
    String? $__typename,
  });
  TRes restaurant_category(
      Iterable<Query$getRestaurantCategories$restaurant_category> Function(
              Iterable<
                  CopyWith$Query$getRestaurantCategories$restaurant_category<
                      Query$getRestaurantCategories$restaurant_category>>)
          _fn);
}

class _CopyWithImpl$Query$getRestaurantCategories<TRes>
    implements CopyWith$Query$getRestaurantCategories<TRes> {
  _CopyWithImpl$Query$getRestaurantCategories(
    this._instance,
    this._then,
  );

  final Query$getRestaurantCategories _instance;

  final TRes Function(Query$getRestaurantCategories) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_category = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantCategories(
        restaurant_category:
            restaurant_category == _undefined || restaurant_category == null
                ? _instance.restaurant_category
                : (restaurant_category
                    as List<Query$getRestaurantCategories$restaurant_category>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes restaurant_category(
          Iterable<Query$getRestaurantCategories$restaurant_category> Function(
                  Iterable<
                      CopyWith$Query$getRestaurantCategories$restaurant_category<
                          Query$getRestaurantCategories$restaurant_category>>)
              _fn) =>
      call(
          restaurant_category: _fn(_instance.restaurant_category.map(
              (e) => CopyWith$Query$getRestaurantCategories$restaurant_category(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getRestaurantCategories<TRes>
    implements CopyWith$Query$getRestaurantCategories<TRes> {
  _CopyWithStubImpl$Query$getRestaurantCategories(this._res);

  TRes _res;

  call({
    List<Query$getRestaurantCategories$restaurant_category>?
        restaurant_category,
    String? $__typename,
  }) =>
      _res;
  restaurant_category(_fn) => _res;
}

const documentNodeQuerygetRestaurantCategories = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getRestaurantCategories'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'restaurant_category'),
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
                    value: VariableNode(name: NameNode(value: 'id')),
                  )
                ]),
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
            name: NameNode(value: 'position'),
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
                name: NameNode(value: 'item_type'),
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
                name: NameNode(value: 'available'),
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
                name: NameNode(value: 'category_id'),
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
                name: NameNode(value: 'archived'),
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
Query$getRestaurantCategories _parserFn$Query$getRestaurantCategories(
        Map<String, dynamic> data) =>
    Query$getRestaurantCategories.fromJson(data);

class Options$Query$getRestaurantCategories
    extends graphql.QueryOptions<Query$getRestaurantCategories> {
  Options$Query$getRestaurantCategories({
    String? operationName,
    Variables$Query$getRestaurantCategories? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
  }) : super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          pollInterval: pollInterval,
          context: context,
          document: documentNodeQuerygetRestaurantCategories,
          parserFn: _parserFn$Query$getRestaurantCategories,
        );
}

class WatchOptions$Query$getRestaurantCategories
    extends graphql.WatchQueryOptions<Query$getRestaurantCategories> {
  WatchOptions$Query$getRestaurantCategories({
    String? operationName,
    Variables$Query$getRestaurantCategories? variables,
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
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeQuerygetRestaurantCategories,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getRestaurantCategories,
        );
}

class FetchMoreOptions$Query$getRestaurantCategories
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getRestaurantCategories({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$getRestaurantCategories? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQuerygetRestaurantCategories,
        );
}

extension ClientExtension$Query$getRestaurantCategories
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getRestaurantCategories>>
      query$getRestaurantCategories(
              [Options$Query$getRestaurantCategories? options]) async =>
          await this.query(options ?? Options$Query$getRestaurantCategories());
  graphql.ObservableQuery<
      Query$getRestaurantCategories> watchQuery$getRestaurantCategories(
          [WatchOptions$Query$getRestaurantCategories? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$getRestaurantCategories());
  void writeQuery$getRestaurantCategories({
    required Query$getRestaurantCategories data,
    Variables$Query$getRestaurantCategories? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetRestaurantCategories),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getRestaurantCategories? readQuery$getRestaurantCategories({
    Variables$Query$getRestaurantCategories? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQuerygetRestaurantCategories),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$getRestaurantCategories.fromJson(result);
  }
}

class Query$getRestaurantCategories$restaurant_category {
  Query$getRestaurantCategories$restaurant_category({
    required this.id,
    required this.name,
    this.description,
    required this.position,
    this.description_id,
    required this.items,
    required this.$__typename,
  });

  factory Query$getRestaurantCategories$restaurant_category.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$description = json['description'];
    final l$position = json['position'];
    final l$description_id = json['description_id'];
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantCategories$restaurant_category(
      id: (l$id as int),
      name: Query$getRestaurantCategories$restaurant_category$name.fromJson(
          (l$name as Map<String, dynamic>)),
      description: l$description == null
          ? null
          : Query$getRestaurantCategories$restaurant_category$description
              .fromJson((l$description as Map<String, dynamic>)),
      position: (l$position as int),
      description_id: (l$description_id as int?),
      items: (l$items as List<dynamic>)
          .map((e) =>
              Query$getRestaurantCategories$restaurant_category$items.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$getRestaurantCategories$restaurant_category$name name;

  final Query$getRestaurantCategories$restaurant_category$description?
      description;

  final int position;

  final int? description_id;

  final List<Query$getRestaurantCategories$restaurant_category$items> items;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
    final l$position = position;
    _resultData['position'] = l$position;
    final l$description_id = description_id;
    _resultData['description_id'] = l$description_id;
    final l$items = items;
    _resultData['items'] = l$items.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$description = description;
    final l$position = position;
    final l$description_id = description_id;
    final l$items = items;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$description,
      l$position,
      l$description_id,
      Object.hashAll(l$items.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRestaurantCategories$restaurant_category) ||
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
    final l$position = position;
    final lOther$position = other.position;
    if (l$position != lOther$position) {
      return false;
    }
    final l$description_id = description_id;
    final lOther$description_id = other.description_id;
    if (l$description_id != lOther$description_id) {
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

extension UtilityExtension$Query$getRestaurantCategories$restaurant_category
    on Query$getRestaurantCategories$restaurant_category {
  CopyWith$Query$getRestaurantCategories$restaurant_category<
          Query$getRestaurantCategories$restaurant_category>
      get copyWith =>
          CopyWith$Query$getRestaurantCategories$restaurant_category(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantCategories$restaurant_category<
    TRes> {
  factory CopyWith$Query$getRestaurantCategories$restaurant_category(
    Query$getRestaurantCategories$restaurant_category instance,
    TRes Function(Query$getRestaurantCategories$restaurant_category) then,
  ) = _CopyWithImpl$Query$getRestaurantCategories$restaurant_category;

  factory CopyWith$Query$getRestaurantCategories$restaurant_category.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantCategories$restaurant_category;

  TRes call({
    int? id,
    Query$getRestaurantCategories$restaurant_category$name? name,
    Query$getRestaurantCategories$restaurant_category$description? description,
    int? position,
    int? description_id,
    List<Query$getRestaurantCategories$restaurant_category$items>? items,
    String? $__typename,
  });
  CopyWith$Query$getRestaurantCategories$restaurant_category$name<TRes>
      get name;
  CopyWith$Query$getRestaurantCategories$restaurant_category$description<TRes>
      get description;
  TRes items(
      Iterable<Query$getRestaurantCategories$restaurant_category$items> Function(
              Iterable<
                  CopyWith$Query$getRestaurantCategories$restaurant_category$items<
                      Query$getRestaurantCategories$restaurant_category$items>>)
          _fn);
}

class _CopyWithImpl$Query$getRestaurantCategories$restaurant_category<TRes>
    implements
        CopyWith$Query$getRestaurantCategories$restaurant_category<TRes> {
  _CopyWithImpl$Query$getRestaurantCategories$restaurant_category(
    this._instance,
    this._then,
  );

  final Query$getRestaurantCategories$restaurant_category _instance;

  final TRes Function(Query$getRestaurantCategories$restaurant_category) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? position = _undefined,
    Object? description_id = _undefined,
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantCategories$restaurant_category(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as Query$getRestaurantCategories$restaurant_category$name),
        description: description == _undefined
            ? _instance.description
            : (description
                as Query$getRestaurantCategories$restaurant_category$description?),
        position: position == _undefined || position == null
            ? _instance.position
            : (position as int),
        description_id: description_id == _undefined
            ? _instance.description_id
            : (description_id as int?),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<
                Query$getRestaurantCategories$restaurant_category$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getRestaurantCategories$restaurant_category$name<TRes>
      get name {
    final local$name = _instance.name;
    return CopyWith$Query$getRestaurantCategories$restaurant_category$name(
        local$name, (e) => call(name: e));
  }

  CopyWith$Query$getRestaurantCategories$restaurant_category$description<TRes>
      get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Query$getRestaurantCategories$restaurant_category$description
            .stub(_then(_instance))
        : CopyWith$Query$getRestaurantCategories$restaurant_category$description(
            local$description, (e) => call(description: e));
  }

  TRes items(
          Iterable<Query$getRestaurantCategories$restaurant_category$items> Function(
                  Iterable<
                      CopyWith$Query$getRestaurantCategories$restaurant_category$items<
                          Query$getRestaurantCategories$restaurant_category$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) =>
              CopyWith$Query$getRestaurantCategories$restaurant_category$items(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getRestaurantCategories$restaurant_category<TRes>
    implements
        CopyWith$Query$getRestaurantCategories$restaurant_category<TRes> {
  _CopyWithStubImpl$Query$getRestaurantCategories$restaurant_category(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$getRestaurantCategories$restaurant_category$name? name,
    Query$getRestaurantCategories$restaurant_category$description? description,
    int? position,
    int? description_id,
    List<Query$getRestaurantCategories$restaurant_category$items>? items,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getRestaurantCategories$restaurant_category$name<TRes>
      get name =>
          CopyWith$Query$getRestaurantCategories$restaurant_category$name.stub(
              _res);
  CopyWith$Query$getRestaurantCategories$restaurant_category$description<TRes>
      get description =>
          CopyWith$Query$getRestaurantCategories$restaurant_category$description
              .stub(_res);
  items(_fn) => _res;
}

class Query$getRestaurantCategories$restaurant_category$name {
  Query$getRestaurantCategories$restaurant_category$name({
    required this.id,
    required this.translations,
    required this.$__typename,
  });

  factory Query$getRestaurantCategories$restaurant_category$name.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantCategories$restaurant_category$name(
      id: (l$id as int),
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getRestaurantCategories$restaurant_category$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final List<
          Query$getRestaurantCategories$restaurant_category$name$translations>
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
    if (!(other is Query$getRestaurantCategories$restaurant_category$name) ||
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

extension UtilityExtension$Query$getRestaurantCategories$restaurant_category$name
    on Query$getRestaurantCategories$restaurant_category$name {
  CopyWith$Query$getRestaurantCategories$restaurant_category$name<
          Query$getRestaurantCategories$restaurant_category$name>
      get copyWith =>
          CopyWith$Query$getRestaurantCategories$restaurant_category$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantCategories$restaurant_category$name<
    TRes> {
  factory CopyWith$Query$getRestaurantCategories$restaurant_category$name(
    Query$getRestaurantCategories$restaurant_category$name instance,
    TRes Function(Query$getRestaurantCategories$restaurant_category$name) then,
  ) = _CopyWithImpl$Query$getRestaurantCategories$restaurant_category$name;

  factory CopyWith$Query$getRestaurantCategories$restaurant_category$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantCategories$restaurant_category$name;

  TRes call({
    int? id,
    List<Query$getRestaurantCategories$restaurant_category$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getRestaurantCategories$restaurant_category$name$translations> Function(
              Iterable<
                  CopyWith$Query$getRestaurantCategories$restaurant_category$name$translations<
                      Query$getRestaurantCategories$restaurant_category$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getRestaurantCategories$restaurant_category$name<TRes>
    implements
        CopyWith$Query$getRestaurantCategories$restaurant_category$name<TRes> {
  _CopyWithImpl$Query$getRestaurantCategories$restaurant_category$name(
    this._instance,
    this._then,
  );

  final Query$getRestaurantCategories$restaurant_category$name _instance;

  final TRes Function(Query$getRestaurantCategories$restaurant_category$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantCategories$restaurant_category$name(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getRestaurantCategories$restaurant_category$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getRestaurantCategories$restaurant_category$name$translations> Function(
                  Iterable<
                      CopyWith$Query$getRestaurantCategories$restaurant_category$name$translations<
                          Query$getRestaurantCategories$restaurant_category$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getRestaurantCategories$restaurant_category$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getRestaurantCategories$restaurant_category$name<
        TRes>
    implements
        CopyWith$Query$getRestaurantCategories$restaurant_category$name<TRes> {
  _CopyWithStubImpl$Query$getRestaurantCategories$restaurant_category$name(
      this._res);

  TRes _res;

  call({
    int? id,
    List<Query$getRestaurantCategories$restaurant_category$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getRestaurantCategories$restaurant_category$name$translations {
  Query$getRestaurantCategories$restaurant_category$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getRestaurantCategories$restaurant_category$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantCategories$restaurant_category$name$translations(
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
            is Query$getRestaurantCategories$restaurant_category$name$translations) ||
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

extension UtilityExtension$Query$getRestaurantCategories$restaurant_category$name$translations
    on Query$getRestaurantCategories$restaurant_category$name$translations {
  CopyWith$Query$getRestaurantCategories$restaurant_category$name$translations<
          Query$getRestaurantCategories$restaurant_category$name$translations>
      get copyWith =>
          CopyWith$Query$getRestaurantCategories$restaurant_category$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantCategories$restaurant_category$name$translations<
    TRes> {
  factory CopyWith$Query$getRestaurantCategories$restaurant_category$name$translations(
    Query$getRestaurantCategories$restaurant_category$name$translations
        instance,
    TRes Function(
            Query$getRestaurantCategories$restaurant_category$name$translations)
        then,
  ) = _CopyWithImpl$Query$getRestaurantCategories$restaurant_category$name$translations;

  factory CopyWith$Query$getRestaurantCategories$restaurant_category$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantCategories$restaurant_category$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getRestaurantCategories$restaurant_category$name$translations<
        TRes>
    implements
        CopyWith$Query$getRestaurantCategories$restaurant_category$name$translations<
            TRes> {
  _CopyWithImpl$Query$getRestaurantCategories$restaurant_category$name$translations(
    this._instance,
    this._then,
  );

  final Query$getRestaurantCategories$restaurant_category$name$translations
      _instance;

  final TRes Function(
          Query$getRestaurantCategories$restaurant_category$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantCategories$restaurant_category$name$translations(
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

class _CopyWithStubImpl$Query$getRestaurantCategories$restaurant_category$name$translations<
        TRes>
    implements
        CopyWith$Query$getRestaurantCategories$restaurant_category$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurantCategories$restaurant_category$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$getRestaurantCategories$restaurant_category$description {
  Query$getRestaurantCategories$restaurant_category$description({
    required this.id,
    required this.translations,
    required this.$__typename,
  });

  factory Query$getRestaurantCategories$restaurant_category$description.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantCategories$restaurant_category$description(
      id: (l$id as int),
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getRestaurantCategories$restaurant_category$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final List<
          Query$getRestaurantCategories$restaurant_category$description$translations>
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
            is Query$getRestaurantCategories$restaurant_category$description) ||
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

extension UtilityExtension$Query$getRestaurantCategories$restaurant_category$description
    on Query$getRestaurantCategories$restaurant_category$description {
  CopyWith$Query$getRestaurantCategories$restaurant_category$description<
          Query$getRestaurantCategories$restaurant_category$description>
      get copyWith =>
          CopyWith$Query$getRestaurantCategories$restaurant_category$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantCategories$restaurant_category$description<
    TRes> {
  factory CopyWith$Query$getRestaurantCategories$restaurant_category$description(
    Query$getRestaurantCategories$restaurant_category$description instance,
    TRes Function(Query$getRestaurantCategories$restaurant_category$description)
        then,
  ) = _CopyWithImpl$Query$getRestaurantCategories$restaurant_category$description;

  factory CopyWith$Query$getRestaurantCategories$restaurant_category$description.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantCategories$restaurant_category$description;

  TRes call({
    int? id,
    List<Query$getRestaurantCategories$restaurant_category$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getRestaurantCategories$restaurant_category$description$translations> Function(
              Iterable<
                  CopyWith$Query$getRestaurantCategories$restaurant_category$description$translations<
                      Query$getRestaurantCategories$restaurant_category$description$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getRestaurantCategories$restaurant_category$description<
        TRes>
    implements
        CopyWith$Query$getRestaurantCategories$restaurant_category$description<
            TRes> {
  _CopyWithImpl$Query$getRestaurantCategories$restaurant_category$description(
    this._instance,
    this._then,
  );

  final Query$getRestaurantCategories$restaurant_category$description _instance;

  final TRes Function(
      Query$getRestaurantCategories$restaurant_category$description) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantCategories$restaurant_category$description(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getRestaurantCategories$restaurant_category$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getRestaurantCategories$restaurant_category$description$translations> Function(
                  Iterable<
                      CopyWith$Query$getRestaurantCategories$restaurant_category$description$translations<
                          Query$getRestaurantCategories$restaurant_category$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getRestaurantCategories$restaurant_category$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getRestaurantCategories$restaurant_category$description<
        TRes>
    implements
        CopyWith$Query$getRestaurantCategories$restaurant_category$description<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurantCategories$restaurant_category$description(
      this._res);

  TRes _res;

  call({
    int? id,
    List<Query$getRestaurantCategories$restaurant_category$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getRestaurantCategories$restaurant_category$description$translations {
  Query$getRestaurantCategories$restaurant_category$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getRestaurantCategories$restaurant_category$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantCategories$restaurant_category$description$translations(
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
            is Query$getRestaurantCategories$restaurant_category$description$translations) ||
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

extension UtilityExtension$Query$getRestaurantCategories$restaurant_category$description$translations
    on Query$getRestaurantCategories$restaurant_category$description$translations {
  CopyWith$Query$getRestaurantCategories$restaurant_category$description$translations<
          Query$getRestaurantCategories$restaurant_category$description$translations>
      get copyWith =>
          CopyWith$Query$getRestaurantCategories$restaurant_category$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantCategories$restaurant_category$description$translations<
    TRes> {
  factory CopyWith$Query$getRestaurantCategories$restaurant_category$description$translations(
    Query$getRestaurantCategories$restaurant_category$description$translations
        instance,
    TRes Function(
            Query$getRestaurantCategories$restaurant_category$description$translations)
        then,
  ) = _CopyWithImpl$Query$getRestaurantCategories$restaurant_category$description$translations;

  factory CopyWith$Query$getRestaurantCategories$restaurant_category$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantCategories$restaurant_category$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getRestaurantCategories$restaurant_category$description$translations<
        TRes>
    implements
        CopyWith$Query$getRestaurantCategories$restaurant_category$description$translations<
            TRes> {
  _CopyWithImpl$Query$getRestaurantCategories$restaurant_category$description$translations(
    this._instance,
    this._then,
  );

  final Query$getRestaurantCategories$restaurant_category$description$translations
      _instance;

  final TRes Function(
          Query$getRestaurantCategories$restaurant_category$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getRestaurantCategories$restaurant_category$description$translations(
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

class _CopyWithStubImpl$Query$getRestaurantCategories$restaurant_category$description$translations<
        TRes>
    implements
        CopyWith$Query$getRestaurantCategories$restaurant_category$description$translations<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurantCategories$restaurant_category$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$getRestaurantCategories$restaurant_category$items {
  Query$getRestaurantCategories$restaurant_category$items({
    required this.id,
    required this.name,
    this.description,
    required this.item_type,
    required this.cost,
    required this.available,
    required this.position,
    required this.restaurant_id,
    this.special_period_end,
    this.special_period_start,
    this.category_id,
    this.description_id,
    required this.archived,
    required this.$__typename,
  });

  factory Query$getRestaurantCategories$restaurant_category$items.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$description = json['description'];
    final l$item_type = json['item_type'];
    final l$cost = json['cost'];
    final l$available = json['available'];
    final l$position = json['position'];
    final l$restaurant_id = json['restaurant_id'];
    final l$special_period_end = json['special_period_end'];
    final l$special_period_start = json['special_period_start'];
    final l$category_id = json['category_id'];
    final l$description_id = json['description_id'];
    final l$archived = json['archived'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantCategories$restaurant_category$items(
      id: (l$id as int),
      name:
          Query$getRestaurantCategories$restaurant_category$items$name.fromJson(
              (l$name as Map<String, dynamic>)),
      description: l$description == null
          ? null
          : Query$getRestaurantCategories$restaurant_category$items$description
              .fromJson((l$description as Map<String, dynamic>)),
      item_type: (l$item_type as String),
      cost: moneyFromJson(l$cost),
      available: (l$available as bool),
      position: (l$position as int),
      restaurant_id: (l$restaurant_id as int),
      special_period_end: (l$special_period_end as String?),
      special_period_start: (l$special_period_start as String?),
      category_id: (l$category_id as int?),
      description_id: (l$description_id as int?),
      archived: (l$archived as bool),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$getRestaurantCategories$restaurant_category$items$name name;

  final Query$getRestaurantCategories$restaurant_category$items$description?
      description;

  final String item_type;

  final double cost;

  final bool available;

  final int position;

  final int restaurant_id;

  final String? special_period_end;

  final String? special_period_start;

  final int? category_id;

  final int? description_id;

  final bool archived;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
    final l$item_type = item_type;
    _resultData['item_type'] = l$item_type;
    final l$cost = cost;
    _resultData['cost'] = moneyToJson(l$cost);
    final l$available = available;
    _resultData['available'] = l$available;
    final l$position = position;
    _resultData['position'] = l$position;
    final l$restaurant_id = restaurant_id;
    _resultData['restaurant_id'] = l$restaurant_id;
    final l$special_period_end = special_period_end;
    _resultData['special_period_end'] = l$special_period_end;
    final l$special_period_start = special_period_start;
    _resultData['special_period_start'] = l$special_period_start;
    final l$category_id = category_id;
    _resultData['category_id'] = l$category_id;
    final l$description_id = description_id;
    _resultData['description_id'] = l$description_id;
    final l$archived = archived;
    _resultData['archived'] = l$archived;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$description = description;
    final l$item_type = item_type;
    final l$cost = cost;
    final l$available = available;
    final l$position = position;
    final l$restaurant_id = restaurant_id;
    final l$special_period_end = special_period_end;
    final l$special_period_start = special_period_start;
    final l$category_id = category_id;
    final l$description_id = description_id;
    final l$archived = archived;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$description,
      l$item_type,
      l$cost,
      l$available,
      l$position,
      l$restaurant_id,
      l$special_period_end,
      l$special_period_start,
      l$category_id,
      l$description_id,
      l$archived,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRestaurantCategories$restaurant_category$items) ||
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
    final l$item_type = item_type;
    final lOther$item_type = other.item_type;
    if (l$item_type != lOther$item_type) {
      return false;
    }
    final l$cost = cost;
    final lOther$cost = other.cost;
    if (l$cost != lOther$cost) {
      return false;
    }
    final l$available = available;
    final lOther$available = other.available;
    if (l$available != lOther$available) {
      return false;
    }
    final l$position = position;
    final lOther$position = other.position;
    if (l$position != lOther$position) {
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
    final l$category_id = category_id;
    final lOther$category_id = other.category_id;
    if (l$category_id != lOther$category_id) {
      return false;
    }
    final l$description_id = description_id;
    final lOther$description_id = other.description_id;
    if (l$description_id != lOther$description_id) {
      return false;
    }
    final l$archived = archived;
    final lOther$archived = other.archived;
    if (l$archived != lOther$archived) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getRestaurantCategories$restaurant_category$items
    on Query$getRestaurantCategories$restaurant_category$items {
  CopyWith$Query$getRestaurantCategories$restaurant_category$items<
          Query$getRestaurantCategories$restaurant_category$items>
      get copyWith =>
          CopyWith$Query$getRestaurantCategories$restaurant_category$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantCategories$restaurant_category$items<
    TRes> {
  factory CopyWith$Query$getRestaurantCategories$restaurant_category$items(
    Query$getRestaurantCategories$restaurant_category$items instance,
    TRes Function(Query$getRestaurantCategories$restaurant_category$items) then,
  ) = _CopyWithImpl$Query$getRestaurantCategories$restaurant_category$items;

  factory CopyWith$Query$getRestaurantCategories$restaurant_category$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantCategories$restaurant_category$items;

  TRes call({
    int? id,
    Query$getRestaurantCategories$restaurant_category$items$name? name,
    Query$getRestaurantCategories$restaurant_category$items$description?
        description,
    String? item_type,
    double? cost,
    bool? available,
    int? position,
    int? restaurant_id,
    String? special_period_end,
    String? special_period_start,
    int? category_id,
    int? description_id,
    bool? archived,
    String? $__typename,
  });
  CopyWith$Query$getRestaurantCategories$restaurant_category$items$name<TRes>
      get name;
  CopyWith$Query$getRestaurantCategories$restaurant_category$items$description<
      TRes> get description;
}

class _CopyWithImpl$Query$getRestaurantCategories$restaurant_category$items<
        TRes>
    implements
        CopyWith$Query$getRestaurantCategories$restaurant_category$items<TRes> {
  _CopyWithImpl$Query$getRestaurantCategories$restaurant_category$items(
    this._instance,
    this._then,
  );

  final Query$getRestaurantCategories$restaurant_category$items _instance;

  final TRes Function(Query$getRestaurantCategories$restaurant_category$items)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? item_type = _undefined,
    Object? cost = _undefined,
    Object? available = _undefined,
    Object? position = _undefined,
    Object? restaurant_id = _undefined,
    Object? special_period_end = _undefined,
    Object? special_period_start = _undefined,
    Object? category_id = _undefined,
    Object? description_id = _undefined,
    Object? archived = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantCategories$restaurant_category$items(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Query$getRestaurantCategories$restaurant_category$items$name),
        description: description == _undefined
            ? _instance.description
            : (description
                as Query$getRestaurantCategories$restaurant_category$items$description?),
        item_type: item_type == _undefined || item_type == null
            ? _instance.item_type
            : (item_type as String),
        cost: cost == _undefined || cost == null
            ? _instance.cost
            : (cost as double),
        available: available == _undefined || available == null
            ? _instance.available
            : (available as bool),
        position: position == _undefined || position == null
            ? _instance.position
            : (position as int),
        restaurant_id: restaurant_id == _undefined || restaurant_id == null
            ? _instance.restaurant_id
            : (restaurant_id as int),
        special_period_end: special_period_end == _undefined
            ? _instance.special_period_end
            : (special_period_end as String?),
        special_period_start: special_period_start == _undefined
            ? _instance.special_period_start
            : (special_period_start as String?),
        category_id: category_id == _undefined
            ? _instance.category_id
            : (category_id as int?),
        description_id: description_id == _undefined
            ? _instance.description_id
            : (description_id as int?),
        archived: archived == _undefined || archived == null
            ? _instance.archived
            : (archived as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getRestaurantCategories$restaurant_category$items$name<TRes>
      get name {
    final local$name = _instance.name;
    return CopyWith$Query$getRestaurantCategories$restaurant_category$items$name(
        local$name, (e) => call(name: e));
  }

  CopyWith$Query$getRestaurantCategories$restaurant_category$items$description<
      TRes> get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Query$getRestaurantCategories$restaurant_category$items$description
            .stub(_then(_instance))
        : CopyWith$Query$getRestaurantCategories$restaurant_category$items$description(
            local$description, (e) => call(description: e));
  }
}

class _CopyWithStubImpl$Query$getRestaurantCategories$restaurant_category$items<
        TRes>
    implements
        CopyWith$Query$getRestaurantCategories$restaurant_category$items<TRes> {
  _CopyWithStubImpl$Query$getRestaurantCategories$restaurant_category$items(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$getRestaurantCategories$restaurant_category$items$name? name,
    Query$getRestaurantCategories$restaurant_category$items$description?
        description,
    String? item_type,
    double? cost,
    bool? available,
    int? position,
    int? restaurant_id,
    String? special_period_end,
    String? special_period_start,
    int? category_id,
    int? description_id,
    bool? archived,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getRestaurantCategories$restaurant_category$items$name<TRes>
      get name =>
          CopyWith$Query$getRestaurantCategories$restaurant_category$items$name
              .stub(_res);
  CopyWith$Query$getRestaurantCategories$restaurant_category$items$description<
          TRes>
      get description =>
          CopyWith$Query$getRestaurantCategories$restaurant_category$items$description
              .stub(_res);
}

class Query$getRestaurantCategories$restaurant_category$items$name {
  Query$getRestaurantCategories$restaurant_category$items$name({
    required this.id,
    required this.translations,
    required this.$__typename,
  });

  factory Query$getRestaurantCategories$restaurant_category$items$name.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantCategories$restaurant_category$items$name(
      id: (l$id as int),
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getRestaurantCategories$restaurant_category$items$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final List<
          Query$getRestaurantCategories$restaurant_category$items$name$translations>
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
            is Query$getRestaurantCategories$restaurant_category$items$name) ||
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

extension UtilityExtension$Query$getRestaurantCategories$restaurant_category$items$name
    on Query$getRestaurantCategories$restaurant_category$items$name {
  CopyWith$Query$getRestaurantCategories$restaurant_category$items$name<
          Query$getRestaurantCategories$restaurant_category$items$name>
      get copyWith =>
          CopyWith$Query$getRestaurantCategories$restaurant_category$items$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantCategories$restaurant_category$items$name<
    TRes> {
  factory CopyWith$Query$getRestaurantCategories$restaurant_category$items$name(
    Query$getRestaurantCategories$restaurant_category$items$name instance,
    TRes Function(Query$getRestaurantCategories$restaurant_category$items$name)
        then,
  ) = _CopyWithImpl$Query$getRestaurantCategories$restaurant_category$items$name;

  factory CopyWith$Query$getRestaurantCategories$restaurant_category$items$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantCategories$restaurant_category$items$name;

  TRes call({
    int? id,
    List<Query$getRestaurantCategories$restaurant_category$items$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getRestaurantCategories$restaurant_category$items$name$translations> Function(
              Iterable<
                  CopyWith$Query$getRestaurantCategories$restaurant_category$items$name$translations<
                      Query$getRestaurantCategories$restaurant_category$items$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getRestaurantCategories$restaurant_category$items$name<
        TRes>
    implements
        CopyWith$Query$getRestaurantCategories$restaurant_category$items$name<
            TRes> {
  _CopyWithImpl$Query$getRestaurantCategories$restaurant_category$items$name(
    this._instance,
    this._then,
  );

  final Query$getRestaurantCategories$restaurant_category$items$name _instance;

  final TRes Function(
      Query$getRestaurantCategories$restaurant_category$items$name) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantCategories$restaurant_category$items$name(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getRestaurantCategories$restaurant_category$items$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getRestaurantCategories$restaurant_category$items$name$translations> Function(
                  Iterable<
                      CopyWith$Query$getRestaurantCategories$restaurant_category$items$name$translations<
                          Query$getRestaurantCategories$restaurant_category$items$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getRestaurantCategories$restaurant_category$items$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getRestaurantCategories$restaurant_category$items$name<
        TRes>
    implements
        CopyWith$Query$getRestaurantCategories$restaurant_category$items$name<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurantCategories$restaurant_category$items$name(
      this._res);

  TRes _res;

  call({
    int? id,
    List<Query$getRestaurantCategories$restaurant_category$items$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getRestaurantCategories$restaurant_category$items$name$translations {
  Query$getRestaurantCategories$restaurant_category$items$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getRestaurantCategories$restaurant_category$items$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantCategories$restaurant_category$items$name$translations(
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
            is Query$getRestaurantCategories$restaurant_category$items$name$translations) ||
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

extension UtilityExtension$Query$getRestaurantCategories$restaurant_category$items$name$translations
    on Query$getRestaurantCategories$restaurant_category$items$name$translations {
  CopyWith$Query$getRestaurantCategories$restaurant_category$items$name$translations<
          Query$getRestaurantCategories$restaurant_category$items$name$translations>
      get copyWith =>
          CopyWith$Query$getRestaurantCategories$restaurant_category$items$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantCategories$restaurant_category$items$name$translations<
    TRes> {
  factory CopyWith$Query$getRestaurantCategories$restaurant_category$items$name$translations(
    Query$getRestaurantCategories$restaurant_category$items$name$translations
        instance,
    TRes Function(
            Query$getRestaurantCategories$restaurant_category$items$name$translations)
        then,
  ) = _CopyWithImpl$Query$getRestaurantCategories$restaurant_category$items$name$translations;

  factory CopyWith$Query$getRestaurantCategories$restaurant_category$items$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantCategories$restaurant_category$items$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getRestaurantCategories$restaurant_category$items$name$translations<
        TRes>
    implements
        CopyWith$Query$getRestaurantCategories$restaurant_category$items$name$translations<
            TRes> {
  _CopyWithImpl$Query$getRestaurantCategories$restaurant_category$items$name$translations(
    this._instance,
    this._then,
  );

  final Query$getRestaurantCategories$restaurant_category$items$name$translations
      _instance;

  final TRes Function(
          Query$getRestaurantCategories$restaurant_category$items$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getRestaurantCategories$restaurant_category$items$name$translations(
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

class _CopyWithStubImpl$Query$getRestaurantCategories$restaurant_category$items$name$translations<
        TRes>
    implements
        CopyWith$Query$getRestaurantCategories$restaurant_category$items$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurantCategories$restaurant_category$items$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$getRestaurantCategories$restaurant_category$items$description {
  Query$getRestaurantCategories$restaurant_category$items$description({
    required this.id,
    required this.translations,
    required this.$__typename,
  });

  factory Query$getRestaurantCategories$restaurant_category$items$description.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantCategories$restaurant_category$items$description(
      id: (l$id as int),
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getRestaurantCategories$restaurant_category$items$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final List<
          Query$getRestaurantCategories$restaurant_category$items$description$translations>
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
            is Query$getRestaurantCategories$restaurant_category$items$description) ||
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

extension UtilityExtension$Query$getRestaurantCategories$restaurant_category$items$description
    on Query$getRestaurantCategories$restaurant_category$items$description {
  CopyWith$Query$getRestaurantCategories$restaurant_category$items$description<
          Query$getRestaurantCategories$restaurant_category$items$description>
      get copyWith =>
          CopyWith$Query$getRestaurantCategories$restaurant_category$items$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantCategories$restaurant_category$items$description<
    TRes> {
  factory CopyWith$Query$getRestaurantCategories$restaurant_category$items$description(
    Query$getRestaurantCategories$restaurant_category$items$description
        instance,
    TRes Function(
            Query$getRestaurantCategories$restaurant_category$items$description)
        then,
  ) = _CopyWithImpl$Query$getRestaurantCategories$restaurant_category$items$description;

  factory CopyWith$Query$getRestaurantCategories$restaurant_category$items$description.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantCategories$restaurant_category$items$description;

  TRes call({
    int? id,
    List<Query$getRestaurantCategories$restaurant_category$items$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getRestaurantCategories$restaurant_category$items$description$translations> Function(
              Iterable<
                  CopyWith$Query$getRestaurantCategories$restaurant_category$items$description$translations<
                      Query$getRestaurantCategories$restaurant_category$items$description$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getRestaurantCategories$restaurant_category$items$description<
        TRes>
    implements
        CopyWith$Query$getRestaurantCategories$restaurant_category$items$description<
            TRes> {
  _CopyWithImpl$Query$getRestaurantCategories$restaurant_category$items$description(
    this._instance,
    this._then,
  );

  final Query$getRestaurantCategories$restaurant_category$items$description
      _instance;

  final TRes Function(
          Query$getRestaurantCategories$restaurant_category$items$description)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantCategories$restaurant_category$items$description(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getRestaurantCategories$restaurant_category$items$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getRestaurantCategories$restaurant_category$items$description$translations> Function(
                  Iterable<
                      CopyWith$Query$getRestaurantCategories$restaurant_category$items$description$translations<
                          Query$getRestaurantCategories$restaurant_category$items$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getRestaurantCategories$restaurant_category$items$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getRestaurantCategories$restaurant_category$items$description<
        TRes>
    implements
        CopyWith$Query$getRestaurantCategories$restaurant_category$items$description<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurantCategories$restaurant_category$items$description(
      this._res);

  TRes _res;

  call({
    int? id,
    List<Query$getRestaurantCategories$restaurant_category$items$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getRestaurantCategories$restaurant_category$items$description$translations {
  Query$getRestaurantCategories$restaurant_category$items$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getRestaurantCategories$restaurant_category$items$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantCategories$restaurant_category$items$description$translations(
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
            is Query$getRestaurantCategories$restaurant_category$items$description$translations) ||
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

extension UtilityExtension$Query$getRestaurantCategories$restaurant_category$items$description$translations
    on Query$getRestaurantCategories$restaurant_category$items$description$translations {
  CopyWith$Query$getRestaurantCategories$restaurant_category$items$description$translations<
          Query$getRestaurantCategories$restaurant_category$items$description$translations>
      get copyWith =>
          CopyWith$Query$getRestaurantCategories$restaurant_category$items$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantCategories$restaurant_category$items$description$translations<
    TRes> {
  factory CopyWith$Query$getRestaurantCategories$restaurant_category$items$description$translations(
    Query$getRestaurantCategories$restaurant_category$items$description$translations
        instance,
    TRes Function(
            Query$getRestaurantCategories$restaurant_category$items$description$translations)
        then,
  ) = _CopyWithImpl$Query$getRestaurantCategories$restaurant_category$items$description$translations;

  factory CopyWith$Query$getRestaurantCategories$restaurant_category$items$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantCategories$restaurant_category$items$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getRestaurantCategories$restaurant_category$items$description$translations<
        TRes>
    implements
        CopyWith$Query$getRestaurantCategories$restaurant_category$items$description$translations<
            TRes> {
  _CopyWithImpl$Query$getRestaurantCategories$restaurant_category$items$description$translations(
    this._instance,
    this._then,
  );

  final Query$getRestaurantCategories$restaurant_category$items$description$translations
      _instance;

  final TRes Function(
          Query$getRestaurantCategories$restaurant_category$items$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getRestaurantCategories$restaurant_category$items$description$translations(
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

class _CopyWithStubImpl$Query$getRestaurantCategories$restaurant_category$items$description$translations<
        TRes>
    implements
        CopyWith$Query$getRestaurantCategories$restaurant_category$items$description$translations<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurantCategories$restaurant_category$items$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}
