import '../../__generated/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$insertReview {
  factory Variables$Mutation$insertReview(
          {required Input$review_insert_input review}) =>
      Variables$Mutation$insertReview._({
        r'review': review,
      });

  Variables$Mutation$insertReview._(this._$data);

  factory Variables$Mutation$insertReview.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$review = data['review'];
    result$data['review'] =
        Input$review_insert_input.fromJson((l$review as Map<String, dynamic>));
    return Variables$Mutation$insertReview._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$review_insert_input get review =>
      (_$data['review'] as Input$review_insert_input);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$review = review;
    result$data['review'] = l$review.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$insertReview<Variables$Mutation$insertReview>
      get copyWith => CopyWith$Variables$Mutation$insertReview(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$insertReview) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$review = review;
    final lOther$review = other.review;
    if (l$review != lOther$review) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$review = review;
    return Object.hashAll([l$review]);
  }
}

abstract class CopyWith$Variables$Mutation$insertReview<TRes> {
  factory CopyWith$Variables$Mutation$insertReview(
    Variables$Mutation$insertReview instance,
    TRes Function(Variables$Mutation$insertReview) then,
  ) = _CopyWithImpl$Variables$Mutation$insertReview;

  factory CopyWith$Variables$Mutation$insertReview.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$insertReview;

  TRes call({Input$review_insert_input? review});
}

class _CopyWithImpl$Variables$Mutation$insertReview<TRes>
    implements CopyWith$Variables$Mutation$insertReview<TRes> {
  _CopyWithImpl$Variables$Mutation$insertReview(
    this._instance,
    this._then,
  );

  final Variables$Mutation$insertReview _instance;

  final TRes Function(Variables$Mutation$insertReview) _then;

  static const _undefined = {};

  TRes call({Object? review = _undefined}) =>
      _then(Variables$Mutation$insertReview._({
        ..._instance._$data,
        if (review != _undefined && review != null)
          'review': (review as Input$review_insert_input),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$insertReview<TRes>
    implements CopyWith$Variables$Mutation$insertReview<TRes> {
  _CopyWithStubImpl$Variables$Mutation$insertReview(this._res);

  TRes _res;

  call({Input$review_insert_input? review}) => _res;
}

class Mutation$insertReview {
  Mutation$insertReview({
    this.insert_review_one,
    required this.$__typename,
  });

  factory Mutation$insertReview.fromJson(Map<String, dynamic> json) {
    final l$insert_review_one = json['insert_review_one'];
    final l$$__typename = json['__typename'];
    return Mutation$insertReview(
      insert_review_one: l$insert_review_one == null
          ? null
          : Mutation$insertReview$insert_review_one.fromJson(
              (l$insert_review_one as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$insertReview$insert_review_one? insert_review_one;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insert_review_one = insert_review_one;
    _resultData['insert_review_one'] = l$insert_review_one?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insert_review_one = insert_review_one;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$insert_review_one,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$insertReview) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$insert_review_one = insert_review_one;
    final lOther$insert_review_one = other.insert_review_one;
    if (l$insert_review_one != lOther$insert_review_one) {
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

extension UtilityExtension$Mutation$insertReview on Mutation$insertReview {
  CopyWith$Mutation$insertReview<Mutation$insertReview> get copyWith =>
      CopyWith$Mutation$insertReview(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$insertReview<TRes> {
  factory CopyWith$Mutation$insertReview(
    Mutation$insertReview instance,
    TRes Function(Mutation$insertReview) then,
  ) = _CopyWithImpl$Mutation$insertReview;

  factory CopyWith$Mutation$insertReview.stub(TRes res) =
      _CopyWithStubImpl$Mutation$insertReview;

  TRes call({
    Mutation$insertReview$insert_review_one? insert_review_one,
    String? $__typename,
  });
  CopyWith$Mutation$insertReview$insert_review_one<TRes> get insert_review_one;
}

class _CopyWithImpl$Mutation$insertReview<TRes>
    implements CopyWith$Mutation$insertReview<TRes> {
  _CopyWithImpl$Mutation$insertReview(
    this._instance,
    this._then,
  );

  final Mutation$insertReview _instance;

  final TRes Function(Mutation$insertReview) _then;

  static const _undefined = {};

  TRes call({
    Object? insert_review_one = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$insertReview(
        insert_review_one: insert_review_one == _undefined
            ? _instance.insert_review_one
            : (insert_review_one as Mutation$insertReview$insert_review_one?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$insertReview$insert_review_one<TRes> get insert_review_one {
    final local$insert_review_one = _instance.insert_review_one;
    return local$insert_review_one == null
        ? CopyWith$Mutation$insertReview$insert_review_one.stub(
            _then(_instance))
        : CopyWith$Mutation$insertReview$insert_review_one(
            local$insert_review_one, (e) => call(insert_review_one: e));
  }
}

class _CopyWithStubImpl$Mutation$insertReview<TRes>
    implements CopyWith$Mutation$insertReview<TRes> {
  _CopyWithStubImpl$Mutation$insertReview(this._res);

  TRes _res;

  call({
    Mutation$insertReview$insert_review_one? insert_review_one,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$insertReview$insert_review_one<TRes>
      get insert_review_one =>
          CopyWith$Mutation$insertReview$insert_review_one.stub(_res);
}

const documentNodeMutationinsertReview = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'insertReview'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'review')),
        type: NamedTypeNode(
          name: NameNode(value: 'review_insert_input'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'insert_review_one'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'object'),
            value: VariableNode(name: NameNode(value: 'review')),
          )
        ],
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
Mutation$insertReview _parserFn$Mutation$insertReview(
        Map<String, dynamic> data) =>
    Mutation$insertReview.fromJson(data);
typedef OnMutationCompleted$Mutation$insertReview = FutureOr<void> Function(
  dynamic,
  Mutation$insertReview?,
);

class Options$Mutation$insertReview
    extends graphql.MutationOptions<Mutation$insertReview> {
  Options$Mutation$insertReview({
    String? operationName,
    required Variables$Mutation$insertReview variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$insertReview? onCompleted,
    graphql.OnMutationUpdate<Mutation$insertReview>? update,
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
                    data == null ? null : _parserFn$Mutation$insertReview(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationinsertReview,
          parserFn: _parserFn$Mutation$insertReview,
        );

  final OnMutationCompleted$Mutation$insertReview? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$insertReview
    extends graphql.WatchQueryOptions<Mutation$insertReview> {
  WatchOptions$Mutation$insertReview({
    String? operationName,
    required Variables$Mutation$insertReview variables,
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
          document: documentNodeMutationinsertReview,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$insertReview,
        );
}

extension ClientExtension$Mutation$insertReview on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$insertReview>> mutate$insertReview(
          Options$Mutation$insertReview options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$insertReview> watchMutation$insertReview(
          WatchOptions$Mutation$insertReview options) =>
      this.watchMutation(options);
}

class Mutation$insertReview$insert_review_one {
  Mutation$insertReview$insert_review_one({
    required this.created_at,
    required this.id,
    required this.$__typename,
  });

  factory Mutation$insertReview$insert_review_one.fromJson(
      Map<String, dynamic> json) {
    final l$created_at = json['created_at'];
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$insertReview$insert_review_one(
      created_at: (l$created_at as String),
      id: (l$id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String created_at;

  final int id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$created_at = created_at;
    _resultData['created_at'] = l$created_at;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$created_at = created_at;
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$created_at,
      l$id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$insertReview$insert_review_one) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$created_at = created_at;
    final lOther$created_at = other.created_at;
    if (l$created_at != lOther$created_at) {
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

extension UtilityExtension$Mutation$insertReview$insert_review_one
    on Mutation$insertReview$insert_review_one {
  CopyWith$Mutation$insertReview$insert_review_one<
          Mutation$insertReview$insert_review_one>
      get copyWith => CopyWith$Mutation$insertReview$insert_review_one(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$insertReview$insert_review_one<TRes> {
  factory CopyWith$Mutation$insertReview$insert_review_one(
    Mutation$insertReview$insert_review_one instance,
    TRes Function(Mutation$insertReview$insert_review_one) then,
  ) = _CopyWithImpl$Mutation$insertReview$insert_review_one;

  factory CopyWith$Mutation$insertReview$insert_review_one.stub(TRes res) =
      _CopyWithStubImpl$Mutation$insertReview$insert_review_one;

  TRes call({
    String? created_at,
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$insertReview$insert_review_one<TRes>
    implements CopyWith$Mutation$insertReview$insert_review_one<TRes> {
  _CopyWithImpl$Mutation$insertReview$insert_review_one(
    this._instance,
    this._then,
  );

  final Mutation$insertReview$insert_review_one _instance;

  final TRes Function(Mutation$insertReview$insert_review_one) _then;

  static const _undefined = {};

  TRes call({
    Object? created_at = _undefined,
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$insertReview$insert_review_one(
        created_at: created_at == _undefined || created_at == null
            ? _instance.created_at
            : (created_at as String),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$insertReview$insert_review_one<TRes>
    implements CopyWith$Mutation$insertReview$insert_review_one<TRes> {
  _CopyWithStubImpl$Mutation$insertReview$insert_review_one(this._res);

  TRes _res;

  call({
    String? created_at,
    int? id,
    String? $__typename,
  }) =>
      _res;
}
