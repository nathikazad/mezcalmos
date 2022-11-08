import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Mutation$MyMutation {
  Mutation$MyMutation({
    this.insert_restaurant_one,
    required this.$__typename,
  });

  factory Mutation$MyMutation.fromJson(Map<String, dynamic> json) {
    final l$insert_restaurant_one = json['insert_restaurant_one'];
    final l$$__typename = json['__typename'];
    return Mutation$MyMutation(
      insert_restaurant_one: l$insert_restaurant_one == null
          ? null
          : Mutation$MyMutation$insert_restaurant_one.fromJson(
              (l$insert_restaurant_one as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$MyMutation$insert_restaurant_one? insert_restaurant_one;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insert_restaurant_one = insert_restaurant_one;
    _resultData['insert_restaurant_one'] = l$insert_restaurant_one?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insert_restaurant_one = insert_restaurant_one;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$insert_restaurant_one,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$MyMutation) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$insert_restaurant_one = insert_restaurant_one;
    final lOther$insert_restaurant_one = other.insert_restaurant_one;
    if (l$insert_restaurant_one != lOther$insert_restaurant_one) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$MyMutation on Mutation$MyMutation {
  CopyWith$Mutation$MyMutation<Mutation$MyMutation> get copyWith =>
      CopyWith$Mutation$MyMutation(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$MyMutation<TRes> {
  factory CopyWith$Mutation$MyMutation(
    Mutation$MyMutation instance,
    TRes Function(Mutation$MyMutation) then,
  ) = _CopyWithImpl$Mutation$MyMutation;

  factory CopyWith$Mutation$MyMutation.stub(TRes res) =
      _CopyWithStubImpl$Mutation$MyMutation;

  TRes call({
    Mutation$MyMutation$insert_restaurant_one? insert_restaurant_one,
    String? $__typename,
  });
  CopyWith$Mutation$MyMutation$insert_restaurant_one<TRes>
      get insert_restaurant_one;
}

class _CopyWithImpl$Mutation$MyMutation<TRes>
    implements CopyWith$Mutation$MyMutation<TRes> {
  _CopyWithImpl$Mutation$MyMutation(
    this._instance,
    this._then,
  );

  final Mutation$MyMutation _instance;

  final TRes Function(Mutation$MyMutation) _then;

  static const _undefined = {};

  TRes call({
    Object? insert_restaurant_one = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$MyMutation(
        insert_restaurant_one: insert_restaurant_one == _undefined
            ? _instance.insert_restaurant_one
            : (insert_restaurant_one
                as Mutation$MyMutation$insert_restaurant_one?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$MyMutation$insert_restaurant_one<TRes>
      get insert_restaurant_one {
    final local$insert_restaurant_one = _instance.insert_restaurant_one;
    return local$insert_restaurant_one == null
        ? CopyWith$Mutation$MyMutation$insert_restaurant_one.stub(
            _then(_instance))
        : CopyWith$Mutation$MyMutation$insert_restaurant_one(
            local$insert_restaurant_one, (e) => call(insert_restaurant_one: e));
  }
}

class _CopyWithStubImpl$Mutation$MyMutation<TRes>
    implements CopyWith$Mutation$MyMutation<TRes> {
  _CopyWithStubImpl$Mutation$MyMutation(this._res);

  TRes _res;

  call({
    Mutation$MyMutation$insert_restaurant_one? insert_restaurant_one,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$MyMutation$insert_restaurant_one<TRes>
      get insert_restaurant_one =>
          CopyWith$Mutation$MyMutation$insert_restaurant_one.stub(_res);
}

const documentNodeMutationMyMutation = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'MyMutation'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'insert_restaurant_one'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'object'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'description'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'data'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                        name: NameNode(value: 'translations'),
                        value: ObjectValueNode(fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'data'),
                            value: ListValueNode(values: [
                              ObjectValueNode(fields: [
                                ObjectFieldNode(
                                  name: NameNode(value: 'language_id'),
                                  value: StringValueNode(
                                    value: 'en',
                                    isBlock: false,
                                  ),
                                ),
                                ObjectFieldNode(
                                  name: NameNode(value: 'value'),
                                  value: StringValueNode(
                                    value: 'restaurant',
                                    isBlock: false,
                                  ),
                                ),
                              ]),
                              ObjectValueNode(fields: [
                                ObjectFieldNode(
                                  name: NameNode(value: 'language_id'),
                                  value: StringValueNode(
                                    value: 'es',
                                    isBlock: false,
                                  ),
                                ),
                                ObjectFieldNode(
                                  name: NameNode(value: 'value'),
                                  value: StringValueNode(
                                    value: 'restaurante',
                                    isBlock: false,
                                  ),
                                ),
                              ]),
                            ]),
                          )
                        ]),
                      )
                    ]),
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
]);
Mutation$MyMutation _parserFn$Mutation$MyMutation(Map<String, dynamic> data) =>
    Mutation$MyMutation.fromJson(data);
typedef OnMutationCompleted$Mutation$MyMutation = FutureOr<void> Function(
  dynamic,
  Mutation$MyMutation?,
);

class Options$Mutation$MyMutation
    extends graphql.MutationOptions<Mutation$MyMutation> {
  Options$Mutation$MyMutation({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$MyMutation? onCompleted,
    graphql.OnMutationUpdate<Mutation$MyMutation>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
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
                    data == null ? null : _parserFn$Mutation$MyMutation(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationMyMutation,
          parserFn: _parserFn$Mutation$MyMutation,
        );

  final OnMutationCompleted$Mutation$MyMutation? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$MyMutation
    extends graphql.WatchQueryOptions<Mutation$MyMutation> {
  WatchOptions$Mutation$MyMutation({
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
          document: documentNodeMutationMyMutation,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$MyMutation,
        );
}

extension ClientExtension$Mutation$MyMutation on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$MyMutation>> mutate$MyMutation(
          [Options$Mutation$MyMutation? options]) async =>
      await this.mutate(options ?? Options$Mutation$MyMutation());
  graphql.ObservableQuery<Mutation$MyMutation> watchMutation$MyMutation(
          [WatchOptions$Mutation$MyMutation? options]) =>
      this.watchMutation(options ?? WatchOptions$Mutation$MyMutation());
}

class Mutation$MyMutation$insert_restaurant_one {
  Mutation$MyMutation$insert_restaurant_one({
    required this.id,
    required this.$__typename,
  });

  factory Mutation$MyMutation$insert_restaurant_one.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$MyMutation$insert_restaurant_one(
      id: (l$id as int),
      $__typename: (l$$__typename as String),
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
    if (!(other is Mutation$MyMutation$insert_restaurant_one) ||
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

extension UtilityExtension$Mutation$MyMutation$insert_restaurant_one
    on Mutation$MyMutation$insert_restaurant_one {
  CopyWith$Mutation$MyMutation$insert_restaurant_one<
          Mutation$MyMutation$insert_restaurant_one>
      get copyWith => CopyWith$Mutation$MyMutation$insert_restaurant_one(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$MyMutation$insert_restaurant_one<TRes> {
  factory CopyWith$Mutation$MyMutation$insert_restaurant_one(
    Mutation$MyMutation$insert_restaurant_one instance,
    TRes Function(Mutation$MyMutation$insert_restaurant_one) then,
  ) = _CopyWithImpl$Mutation$MyMutation$insert_restaurant_one;

  factory CopyWith$Mutation$MyMutation$insert_restaurant_one.stub(TRes res) =
      _CopyWithStubImpl$Mutation$MyMutation$insert_restaurant_one;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$MyMutation$insert_restaurant_one<TRes>
    implements CopyWith$Mutation$MyMutation$insert_restaurant_one<TRes> {
  _CopyWithImpl$Mutation$MyMutation$insert_restaurant_one(
    this._instance,
    this._then,
  );

  final Mutation$MyMutation$insert_restaurant_one _instance;

  final TRes Function(Mutation$MyMutation$insert_restaurant_one) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$MyMutation$insert_restaurant_one(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$MyMutation$insert_restaurant_one<TRes>
    implements CopyWith$Mutation$MyMutation$insert_restaurant_one<TRes> {
  _CopyWithStubImpl$Mutation$MyMutation$insert_restaurant_one(this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}
