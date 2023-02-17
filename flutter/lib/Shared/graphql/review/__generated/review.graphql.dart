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

class Variables$Query$get_service_review_average {
  factory Variables$Query$get_service_review_average(
          {required int serviceDetailsId}) =>
      Variables$Query$get_service_review_average._({
        r'serviceDetailsId': serviceDetailsId,
      });

  Variables$Query$get_service_review_average._(this._$data);

  factory Variables$Query$get_service_review_average.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$serviceDetailsId = data['serviceDetailsId'];
    result$data['serviceDetailsId'] = (l$serviceDetailsId as int);
    return Variables$Query$get_service_review_average._(result$data);
  }

  Map<String, dynamic> _$data;

  int get serviceDetailsId => (_$data['serviceDetailsId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$serviceDetailsId = serviceDetailsId;
    result$data['serviceDetailsId'] = l$serviceDetailsId;
    return result$data;
  }

  CopyWith$Variables$Query$get_service_review_average<
          Variables$Query$get_service_review_average>
      get copyWith => CopyWith$Variables$Query$get_service_review_average(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_service_review_average) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$serviceDetailsId = serviceDetailsId;
    final lOther$serviceDetailsId = other.serviceDetailsId;
    if (l$serviceDetailsId != lOther$serviceDetailsId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$serviceDetailsId = serviceDetailsId;
    return Object.hashAll([l$serviceDetailsId]);
  }
}

abstract class CopyWith$Variables$Query$get_service_review_average<TRes> {
  factory CopyWith$Variables$Query$get_service_review_average(
    Variables$Query$get_service_review_average instance,
    TRes Function(Variables$Query$get_service_review_average) then,
  ) = _CopyWithImpl$Variables$Query$get_service_review_average;

  factory CopyWith$Variables$Query$get_service_review_average.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$get_service_review_average;

  TRes call({int? serviceDetailsId});
}

class _CopyWithImpl$Variables$Query$get_service_review_average<TRes>
    implements CopyWith$Variables$Query$get_service_review_average<TRes> {
  _CopyWithImpl$Variables$Query$get_service_review_average(
    this._instance,
    this._then,
  );

  final Variables$Query$get_service_review_average _instance;

  final TRes Function(Variables$Query$get_service_review_average) _then;

  static const _undefined = {};

  TRes call({Object? serviceDetailsId = _undefined}) =>
      _then(Variables$Query$get_service_review_average._({
        ..._instance._$data,
        if (serviceDetailsId != _undefined && serviceDetailsId != null)
          'serviceDetailsId': (serviceDetailsId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_service_review_average<TRes>
    implements CopyWith$Variables$Query$get_service_review_average<TRes> {
  _CopyWithStubImpl$Variables$Query$get_service_review_average(this._res);

  TRes _res;

  call({int? serviceDetailsId}) => _res;
}

class Query$get_service_review_average {
  Query$get_service_review_average({
    this.service_provider_details_by_pk,
    required this.$__typename,
  });

  factory Query$get_service_review_average.fromJson(Map<String, dynamic> json) {
    final l$service_provider_details_by_pk =
        json['service_provider_details_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$get_service_review_average(
      service_provider_details_by_pk: l$service_provider_details_by_pk == null
          ? null
          : Query$get_service_review_average$service_provider_details_by_pk
              .fromJson(
                  (l$service_provider_details_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_service_review_average$service_provider_details_by_pk?
      service_provider_details_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$service_provider_details_by_pk = service_provider_details_by_pk;
    _resultData['service_provider_details_by_pk'] =
        l$service_provider_details_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$service_provider_details_by_pk = service_provider_details_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$service_provider_details_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_service_review_average) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$service_provider_details_by_pk = service_provider_details_by_pk;
    final lOther$service_provider_details_by_pk =
        other.service_provider_details_by_pk;
    if (l$service_provider_details_by_pk !=
        lOther$service_provider_details_by_pk) {
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

extension UtilityExtension$Query$get_service_review_average
    on Query$get_service_review_average {
  CopyWith$Query$get_service_review_average<Query$get_service_review_average>
      get copyWith => CopyWith$Query$get_service_review_average(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_service_review_average<TRes> {
  factory CopyWith$Query$get_service_review_average(
    Query$get_service_review_average instance,
    TRes Function(Query$get_service_review_average) then,
  ) = _CopyWithImpl$Query$get_service_review_average;

  factory CopyWith$Query$get_service_review_average.stub(TRes res) =
      _CopyWithStubImpl$Query$get_service_review_average;

  TRes call({
    Query$get_service_review_average$service_provider_details_by_pk?
        service_provider_details_by_pk,
    String? $__typename,
  });
  CopyWith$Query$get_service_review_average$service_provider_details_by_pk<TRes>
      get service_provider_details_by_pk;
}

class _CopyWithImpl$Query$get_service_review_average<TRes>
    implements CopyWith$Query$get_service_review_average<TRes> {
  _CopyWithImpl$Query$get_service_review_average(
    this._instance,
    this._then,
  );

  final Query$get_service_review_average _instance;

  final TRes Function(Query$get_service_review_average) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_details_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_service_review_average(
        service_provider_details_by_pk: service_provider_details_by_pk ==
                _undefined
            ? _instance.service_provider_details_by_pk
            : (service_provider_details_by_pk
                as Query$get_service_review_average$service_provider_details_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_service_review_average$service_provider_details_by_pk<TRes>
      get service_provider_details_by_pk {
    final local$service_provider_details_by_pk =
        _instance.service_provider_details_by_pk;
    return local$service_provider_details_by_pk == null
        ? CopyWith$Query$get_service_review_average$service_provider_details_by_pk
            .stub(_then(_instance))
        : CopyWith$Query$get_service_review_average$service_provider_details_by_pk(
            local$service_provider_details_by_pk,
            (e) => call(service_provider_details_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$get_service_review_average<TRes>
    implements CopyWith$Query$get_service_review_average<TRes> {
  _CopyWithStubImpl$Query$get_service_review_average(this._res);

  TRes _res;

  call({
    Query$get_service_review_average$service_provider_details_by_pk?
        service_provider_details_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_service_review_average$service_provider_details_by_pk<TRes>
      get service_provider_details_by_pk =>
          CopyWith$Query$get_service_review_average$service_provider_details_by_pk
              .stub(_res);
}

const documentNodeQueryget_service_review_average = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_service_review_average'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'serviceDetailsId')),
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
        name: NameNode(value: 'service_provider_details_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'serviceDetailsId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'reviews_aggregate'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'where'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'from_entity_type'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                        name: NameNode(value: '_eq'),
                        value: StringValueNode(
                          value: 'customer',
                          isBlock: false,
                        ),
                      )
                    ]),
                  )
                ]),
              )
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'aggregate'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'avg'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'rating'),
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
Query$get_service_review_average _parserFn$Query$get_service_review_average(
        Map<String, dynamic> data) =>
    Query$get_service_review_average.fromJson(data);

class Options$Query$get_service_review_average
    extends graphql.QueryOptions<Query$get_service_review_average> {
  Options$Query$get_service_review_average({
    String? operationName,
    required Variables$Query$get_service_review_average variables,
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
          document: documentNodeQueryget_service_review_average,
          parserFn: _parserFn$Query$get_service_review_average,
        );
}

class WatchOptions$Query$get_service_review_average
    extends graphql.WatchQueryOptions<Query$get_service_review_average> {
  WatchOptions$Query$get_service_review_average({
    String? operationName,
    required Variables$Query$get_service_review_average variables,
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
          document: documentNodeQueryget_service_review_average,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_service_review_average,
        );
}

class FetchMoreOptions$Query$get_service_review_average
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_service_review_average({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_service_review_average variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_service_review_average,
        );
}

extension ClientExtension$Query$get_service_review_average
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_service_review_average>>
      query$get_service_review_average(
              Options$Query$get_service_review_average options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$get_service_review_average>
      watchQuery$get_service_review_average(
              WatchOptions$Query$get_service_review_average options) =>
          this.watchQuery(options);
  void writeQuery$get_service_review_average({
    required Query$get_service_review_average data,
    required Variables$Query$get_service_review_average variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryget_service_review_average),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_service_review_average? readQuery$get_service_review_average({
    required Variables$Query$get_service_review_average variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryget_service_review_average),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$get_service_review_average.fromJson(result);
  }
}

class Query$get_service_review_average$service_provider_details_by_pk {
  Query$get_service_review_average$service_provider_details_by_pk({
    required this.reviews_aggregate,
    required this.$__typename,
  });

  factory Query$get_service_review_average$service_provider_details_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$reviews_aggregate = json['reviews_aggregate'];
    final l$$__typename = json['__typename'];
    return Query$get_service_review_average$service_provider_details_by_pk(
      reviews_aggregate:
          Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate
              .fromJson((l$reviews_aggregate as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate
      reviews_aggregate;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$reviews_aggregate = reviews_aggregate;
    _resultData['reviews_aggregate'] = l$reviews_aggregate.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$reviews_aggregate = reviews_aggregate;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$reviews_aggregate,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$get_service_review_average$service_provider_details_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$reviews_aggregate = reviews_aggregate;
    final lOther$reviews_aggregate = other.reviews_aggregate;
    if (l$reviews_aggregate != lOther$reviews_aggregate) {
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

extension UtilityExtension$Query$get_service_review_average$service_provider_details_by_pk
    on Query$get_service_review_average$service_provider_details_by_pk {
  CopyWith$Query$get_service_review_average$service_provider_details_by_pk<
          Query$get_service_review_average$service_provider_details_by_pk>
      get copyWith =>
          CopyWith$Query$get_service_review_average$service_provider_details_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_service_review_average$service_provider_details_by_pk<
    TRes> {
  factory CopyWith$Query$get_service_review_average$service_provider_details_by_pk(
    Query$get_service_review_average$service_provider_details_by_pk instance,
    TRes Function(
            Query$get_service_review_average$service_provider_details_by_pk)
        then,
  ) = _CopyWithImpl$Query$get_service_review_average$service_provider_details_by_pk;

  factory CopyWith$Query$get_service_review_average$service_provider_details_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_service_review_average$service_provider_details_by_pk;

  TRes call({
    Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate?
        reviews_aggregate,
    String? $__typename,
  });
  CopyWith$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate<
      TRes> get reviews_aggregate;
}

class _CopyWithImpl$Query$get_service_review_average$service_provider_details_by_pk<
        TRes>
    implements
        CopyWith$Query$get_service_review_average$service_provider_details_by_pk<
            TRes> {
  _CopyWithImpl$Query$get_service_review_average$service_provider_details_by_pk(
    this._instance,
    this._then,
  );

  final Query$get_service_review_average$service_provider_details_by_pk
      _instance;

  final TRes Function(
      Query$get_service_review_average$service_provider_details_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? reviews_aggregate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_service_review_average$service_provider_details_by_pk(
        reviews_aggregate: reviews_aggregate == _undefined ||
                reviews_aggregate == null
            ? _instance.reviews_aggregate
            : (reviews_aggregate
                as Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate<
      TRes> get reviews_aggregate {
    final local$reviews_aggregate = _instance.reviews_aggregate;
    return CopyWith$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate(
        local$reviews_aggregate, (e) => call(reviews_aggregate: e));
  }
}

class _CopyWithStubImpl$Query$get_service_review_average$service_provider_details_by_pk<
        TRes>
    implements
        CopyWith$Query$get_service_review_average$service_provider_details_by_pk<
            TRes> {
  _CopyWithStubImpl$Query$get_service_review_average$service_provider_details_by_pk(
      this._res);

  TRes _res;

  call({
    Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate?
        reviews_aggregate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate<
          TRes>
      get reviews_aggregate =>
          CopyWith$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate
              .stub(_res);
}

class Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate {
  Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate({
    this.aggregate,
    required this.$__typename,
  });

  factory Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$aggregate = json['aggregate'];
    final l$$__typename = json['__typename'];
    return Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate(
      aggregate: l$aggregate == null
          ? null
          : Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate
              .fromJson((l$aggregate as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate?
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
            is Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate) ||
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

extension UtilityExtension$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate
    on Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate {
  CopyWith$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate<
          Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate>
      get copyWith =>
          CopyWith$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate<
    TRes> {
  factory CopyWith$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate(
    Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate
        instance,
    TRes Function(
            Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate)
        then,
  ) = _CopyWithImpl$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate;

  factory CopyWith$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate;

  TRes call({
    Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate?
        aggregate,
    String? $__typename,
  });
  CopyWith$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate<
      TRes> get aggregate;
}

class _CopyWithImpl$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate<
        TRes>
    implements
        CopyWith$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate<
            TRes> {
  _CopyWithImpl$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate(
    this._instance,
    this._then,
  );

  final Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate
      _instance;

  final TRes Function(
          Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate)
      _then;

  static const _undefined = {};

  TRes call({
    Object? aggregate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate(
        aggregate: aggregate == _undefined
            ? _instance.aggregate
            : (aggregate
                as Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate<
      TRes> get aggregate {
    final local$aggregate = _instance.aggregate;
    return local$aggregate == null
        ? CopyWith$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate
            .stub(_then(_instance))
        : CopyWith$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate(
            local$aggregate, (e) => call(aggregate: e));
  }
}

class _CopyWithStubImpl$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate<
        TRes>
    implements
        CopyWith$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate<
            TRes> {
  _CopyWithStubImpl$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate(
      this._res);

  TRes _res;

  call({
    Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate?
        aggregate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate<
          TRes>
      get aggregate =>
          CopyWith$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate
              .stub(_res);
}

class Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate {
  Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate({
    this.avg,
    required this.$__typename,
  });

  factory Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$avg = json['avg'];
    final l$$__typename = json['__typename'];
    return Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate(
      avg: l$avg == null
          ? null
          : Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate$avg
              .fromJson((l$avg as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate$avg?
      avg;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$avg = avg;
    _resultData['avg'] = l$avg?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$avg = avg;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$avg,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$avg = avg;
    final lOther$avg = other.avg;
    if (l$avg != lOther$avg) {
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

extension UtilityExtension$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate
    on Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate {
  CopyWith$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate<
          Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate>
      get copyWith =>
          CopyWith$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate<
    TRes> {
  factory CopyWith$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate(
    Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate
        instance,
    TRes Function(
            Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate)
        then,
  ) = _CopyWithImpl$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate;

  factory CopyWith$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate;

  TRes call({
    Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate$avg?
        avg,
    String? $__typename,
  });
  CopyWith$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate$avg<
      TRes> get avg;
}

class _CopyWithImpl$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate<
            TRes> {
  _CopyWithImpl$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate(
    this._instance,
    this._then,
  );

  final Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate
      _instance;

  final TRes Function(
          Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate)
      _then;

  static const _undefined = {};

  TRes call({
    Object? avg = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate(
        avg: avg == _undefined
            ? _instance.avg
            : (avg
                as Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate$avg?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate$avg<
      TRes> get avg {
    final local$avg = _instance.avg;
    return local$avg == null
        ? CopyWith$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate$avg
            .stub(_then(_instance))
        : CopyWith$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate$avg(
            local$avg, (e) => call(avg: e));
  }
}

class _CopyWithStubImpl$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate<
            TRes> {
  _CopyWithStubImpl$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate(
      this._res);

  TRes _res;

  call({
    Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate$avg?
        avg,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate$avg<
          TRes>
      get avg =>
          CopyWith$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate$avg
              .stub(_res);
}

class Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate$avg {
  Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate$avg({
    this.rating,
    required this.$__typename,
  });

  factory Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate$avg.fromJson(
      Map<String, dynamic> json) {
    final l$rating = json['rating'];
    final l$$__typename = json['__typename'];
    return Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate$avg(
      rating: (l$rating as num?)?.toDouble(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final double? rating;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$rating = rating;
    _resultData['rating'] = l$rating;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$rating = rating;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$rating,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate$avg) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$rating = rating;
    final lOther$rating = other.rating;
    if (l$rating != lOther$rating) {
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

extension UtilityExtension$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate$avg
    on Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate$avg {
  CopyWith$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate$avg<
          Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate$avg>
      get copyWith =>
          CopyWith$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate$avg(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate$avg<
    TRes> {
  factory CopyWith$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate$avg(
    Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate$avg
        instance,
    TRes Function(
            Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate$avg)
        then,
  ) = _CopyWithImpl$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate$avg;

  factory CopyWith$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate$avg.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate$avg;

  TRes call({
    double? rating,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate$avg<
        TRes>
    implements
        CopyWith$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate$avg<
            TRes> {
  _CopyWithImpl$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate$avg(
    this._instance,
    this._then,
  );

  final Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate$avg
      _instance;

  final TRes Function(
          Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate$avg)
      _then;

  static const _undefined = {};

  TRes call({
    Object? rating = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate$avg(
        rating: rating == _undefined ? _instance.rating : (rating as double?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate$avg<
        TRes>
    implements
        CopyWith$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate$avg<
            TRes> {
  _CopyWithStubImpl$Query$get_service_review_average$service_provider_details_by_pk$reviews_aggregate$aggregate$avg(
      this._res);

  TRes _res;

  call({
    double? rating,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$get_service_reviews {
  factory Variables$Query$get_service_reviews(
          {required int serviceDetailsId}) =>
      Variables$Query$get_service_reviews._({
        r'serviceDetailsId': serviceDetailsId,
      });

  Variables$Query$get_service_reviews._(this._$data);

  factory Variables$Query$get_service_reviews.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$serviceDetailsId = data['serviceDetailsId'];
    result$data['serviceDetailsId'] = (l$serviceDetailsId as int);
    return Variables$Query$get_service_reviews._(result$data);
  }

  Map<String, dynamic> _$data;

  int get serviceDetailsId => (_$data['serviceDetailsId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$serviceDetailsId = serviceDetailsId;
    result$data['serviceDetailsId'] = l$serviceDetailsId;
    return result$data;
  }

  CopyWith$Variables$Query$get_service_reviews<
          Variables$Query$get_service_reviews>
      get copyWith => CopyWith$Variables$Query$get_service_reviews(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_service_reviews) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$serviceDetailsId = serviceDetailsId;
    final lOther$serviceDetailsId = other.serviceDetailsId;
    if (l$serviceDetailsId != lOther$serviceDetailsId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$serviceDetailsId = serviceDetailsId;
    return Object.hashAll([l$serviceDetailsId]);
  }
}

abstract class CopyWith$Variables$Query$get_service_reviews<TRes> {
  factory CopyWith$Variables$Query$get_service_reviews(
    Variables$Query$get_service_reviews instance,
    TRes Function(Variables$Query$get_service_reviews) then,
  ) = _CopyWithImpl$Variables$Query$get_service_reviews;

  factory CopyWith$Variables$Query$get_service_reviews.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$get_service_reviews;

  TRes call({int? serviceDetailsId});
}

class _CopyWithImpl$Variables$Query$get_service_reviews<TRes>
    implements CopyWith$Variables$Query$get_service_reviews<TRes> {
  _CopyWithImpl$Variables$Query$get_service_reviews(
    this._instance,
    this._then,
  );

  final Variables$Query$get_service_reviews _instance;

  final TRes Function(Variables$Query$get_service_reviews) _then;

  static const _undefined = {};

  TRes call({Object? serviceDetailsId = _undefined}) =>
      _then(Variables$Query$get_service_reviews._({
        ..._instance._$data,
        if (serviceDetailsId != _undefined && serviceDetailsId != null)
          'serviceDetailsId': (serviceDetailsId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_service_reviews<TRes>
    implements CopyWith$Variables$Query$get_service_reviews<TRes> {
  _CopyWithStubImpl$Variables$Query$get_service_reviews(this._res);

  TRes _res;

  call({int? serviceDetailsId}) => _res;
}

class Query$get_service_reviews {
  Query$get_service_reviews({
    this.service_provider_details_by_pk,
    required this.$__typename,
  });

  factory Query$get_service_reviews.fromJson(Map<String, dynamic> json) {
    final l$service_provider_details_by_pk =
        json['service_provider_details_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$get_service_reviews(
      service_provider_details_by_pk: l$service_provider_details_by_pk == null
          ? null
          : Query$get_service_reviews$service_provider_details_by_pk.fromJson(
              (l$service_provider_details_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_service_reviews$service_provider_details_by_pk?
      service_provider_details_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$service_provider_details_by_pk = service_provider_details_by_pk;
    _resultData['service_provider_details_by_pk'] =
        l$service_provider_details_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$service_provider_details_by_pk = service_provider_details_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$service_provider_details_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_service_reviews) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$service_provider_details_by_pk = service_provider_details_by_pk;
    final lOther$service_provider_details_by_pk =
        other.service_provider_details_by_pk;
    if (l$service_provider_details_by_pk !=
        lOther$service_provider_details_by_pk) {
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

extension UtilityExtension$Query$get_service_reviews
    on Query$get_service_reviews {
  CopyWith$Query$get_service_reviews<Query$get_service_reviews> get copyWith =>
      CopyWith$Query$get_service_reviews(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$get_service_reviews<TRes> {
  factory CopyWith$Query$get_service_reviews(
    Query$get_service_reviews instance,
    TRes Function(Query$get_service_reviews) then,
  ) = _CopyWithImpl$Query$get_service_reviews;

  factory CopyWith$Query$get_service_reviews.stub(TRes res) =
      _CopyWithStubImpl$Query$get_service_reviews;

  TRes call({
    Query$get_service_reviews$service_provider_details_by_pk?
        service_provider_details_by_pk,
    String? $__typename,
  });
  CopyWith$Query$get_service_reviews$service_provider_details_by_pk<TRes>
      get service_provider_details_by_pk;
}

class _CopyWithImpl$Query$get_service_reviews<TRes>
    implements CopyWith$Query$get_service_reviews<TRes> {
  _CopyWithImpl$Query$get_service_reviews(
    this._instance,
    this._then,
  );

  final Query$get_service_reviews _instance;

  final TRes Function(Query$get_service_reviews) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_details_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_service_reviews(
        service_provider_details_by_pk: service_provider_details_by_pk ==
                _undefined
            ? _instance.service_provider_details_by_pk
            : (service_provider_details_by_pk
                as Query$get_service_reviews$service_provider_details_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_service_reviews$service_provider_details_by_pk<TRes>
      get service_provider_details_by_pk {
    final local$service_provider_details_by_pk =
        _instance.service_provider_details_by_pk;
    return local$service_provider_details_by_pk == null
        ? CopyWith$Query$get_service_reviews$service_provider_details_by_pk
            .stub(_then(_instance))
        : CopyWith$Query$get_service_reviews$service_provider_details_by_pk(
            local$service_provider_details_by_pk,
            (e) => call(service_provider_details_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$get_service_reviews<TRes>
    implements CopyWith$Query$get_service_reviews<TRes> {
  _CopyWithStubImpl$Query$get_service_reviews(this._res);

  TRes _res;

  call({
    Query$get_service_reviews$service_provider_details_by_pk?
        service_provider_details_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_service_reviews$service_provider_details_by_pk<TRes>
      get service_provider_details_by_pk =>
          CopyWith$Query$get_service_reviews$service_provider_details_by_pk
              .stub(_res);
}

const documentNodeQueryget_service_reviews = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_service_reviews'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'serviceDetailsId')),
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
        name: NameNode(value: 'service_provider_details_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'serviceDetailsId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'reviews'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'where'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'from_entity_type'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                        name: NameNode(value: '_eq'),
                        value: StringValueNode(
                          value: 'customer',
                          isBlock: false,
                        ),
                      )
                    ]),
                  )
                ]),
              )
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'from_entity_id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'from_entity_type'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'rating'),
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
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'to_entity_id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'to_entity_type'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'created_at'),
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
Query$get_service_reviews _parserFn$Query$get_service_reviews(
        Map<String, dynamic> data) =>
    Query$get_service_reviews.fromJson(data);

class Options$Query$get_service_reviews
    extends graphql.QueryOptions<Query$get_service_reviews> {
  Options$Query$get_service_reviews({
    String? operationName,
    required Variables$Query$get_service_reviews variables,
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
          document: documentNodeQueryget_service_reviews,
          parserFn: _parserFn$Query$get_service_reviews,
        );
}

class WatchOptions$Query$get_service_reviews
    extends graphql.WatchQueryOptions<Query$get_service_reviews> {
  WatchOptions$Query$get_service_reviews({
    String? operationName,
    required Variables$Query$get_service_reviews variables,
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
          document: documentNodeQueryget_service_reviews,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_service_reviews,
        );
}

class FetchMoreOptions$Query$get_service_reviews
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_service_reviews({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_service_reviews variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_service_reviews,
        );
}

extension ClientExtension$Query$get_service_reviews on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_service_reviews>>
      query$get_service_reviews(
              Options$Query$get_service_reviews options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$get_service_reviews>
      watchQuery$get_service_reviews(
              WatchOptions$Query$get_service_reviews options) =>
          this.watchQuery(options);
  void writeQuery$get_service_reviews({
    required Query$get_service_reviews data,
    required Variables$Query$get_service_reviews variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryget_service_reviews),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_service_reviews? readQuery$get_service_reviews({
    required Variables$Query$get_service_reviews variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryget_service_reviews),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$get_service_reviews.fromJson(result);
  }
}

class Query$get_service_reviews$service_provider_details_by_pk {
  Query$get_service_reviews$service_provider_details_by_pk({
    required this.reviews,
    required this.$__typename,
  });

  factory Query$get_service_reviews$service_provider_details_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$reviews = json['reviews'];
    final l$$__typename = json['__typename'];
    return Query$get_service_reviews$service_provider_details_by_pk(
      reviews: (l$reviews as List<dynamic>)
          .map((e) =>
              Query$get_service_reviews$service_provider_details_by_pk$reviews
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$get_service_reviews$service_provider_details_by_pk$reviews>
      reviews;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$reviews = reviews;
    _resultData['reviews'] = l$reviews.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$reviews = reviews;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$reviews.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_service_reviews$service_provider_details_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$reviews = reviews;
    final lOther$reviews = other.reviews;
    if (l$reviews.length != lOther$reviews.length) {
      return false;
    }
    for (int i = 0; i < l$reviews.length; i++) {
      final l$reviews$entry = l$reviews[i];
      final lOther$reviews$entry = lOther$reviews[i];
      if (l$reviews$entry != lOther$reviews$entry) {
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

extension UtilityExtension$Query$get_service_reviews$service_provider_details_by_pk
    on Query$get_service_reviews$service_provider_details_by_pk {
  CopyWith$Query$get_service_reviews$service_provider_details_by_pk<
          Query$get_service_reviews$service_provider_details_by_pk>
      get copyWith =>
          CopyWith$Query$get_service_reviews$service_provider_details_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_service_reviews$service_provider_details_by_pk<
    TRes> {
  factory CopyWith$Query$get_service_reviews$service_provider_details_by_pk(
    Query$get_service_reviews$service_provider_details_by_pk instance,
    TRes Function(Query$get_service_reviews$service_provider_details_by_pk)
        then,
  ) = _CopyWithImpl$Query$get_service_reviews$service_provider_details_by_pk;

  factory CopyWith$Query$get_service_reviews$service_provider_details_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_service_reviews$service_provider_details_by_pk;

  TRes call({
    List<Query$get_service_reviews$service_provider_details_by_pk$reviews>?
        reviews,
    String? $__typename,
  });
  TRes reviews(
      Iterable<Query$get_service_reviews$service_provider_details_by_pk$reviews> Function(
              Iterable<
                  CopyWith$Query$get_service_reviews$service_provider_details_by_pk$reviews<
                      Query$get_service_reviews$service_provider_details_by_pk$reviews>>)
          _fn);
}

class _CopyWithImpl$Query$get_service_reviews$service_provider_details_by_pk<
        TRes>
    implements
        CopyWith$Query$get_service_reviews$service_provider_details_by_pk<
            TRes> {
  _CopyWithImpl$Query$get_service_reviews$service_provider_details_by_pk(
    this._instance,
    this._then,
  );

  final Query$get_service_reviews$service_provider_details_by_pk _instance;

  final TRes Function(Query$get_service_reviews$service_provider_details_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? reviews = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_service_reviews$service_provider_details_by_pk(
        reviews: reviews == _undefined || reviews == null
            ? _instance.reviews
            : (reviews as List<
                Query$get_service_reviews$service_provider_details_by_pk$reviews>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes reviews(
          Iterable<Query$get_service_reviews$service_provider_details_by_pk$reviews> Function(
                  Iterable<
                      CopyWith$Query$get_service_reviews$service_provider_details_by_pk$reviews<
                          Query$get_service_reviews$service_provider_details_by_pk$reviews>>)
              _fn) =>
      call(
          reviews: _fn(_instance.reviews.map((e) =>
              CopyWith$Query$get_service_reviews$service_provider_details_by_pk$reviews(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_service_reviews$service_provider_details_by_pk<
        TRes>
    implements
        CopyWith$Query$get_service_reviews$service_provider_details_by_pk<
            TRes> {
  _CopyWithStubImpl$Query$get_service_reviews$service_provider_details_by_pk(
      this._res);

  TRes _res;

  call({
    List<Query$get_service_reviews$service_provider_details_by_pk$reviews>?
        reviews,
    String? $__typename,
  }) =>
      _res;
  reviews(_fn) => _res;
}

class Query$get_service_reviews$service_provider_details_by_pk$reviews {
  Query$get_service_reviews$service_provider_details_by_pk$reviews({
    required this.from_entity_id,
    required this.from_entity_type,
    required this.rating,
    this.note,
    required this.id,
    required this.to_entity_id,
    required this.to_entity_type,
    required this.created_at,
    required this.$__typename,
  });

  factory Query$get_service_reviews$service_provider_details_by_pk$reviews.fromJson(
      Map<String, dynamic> json) {
    final l$from_entity_id = json['from_entity_id'];
    final l$from_entity_type = json['from_entity_type'];
    final l$rating = json['rating'];
    final l$note = json['note'];
    final l$id = json['id'];
    final l$to_entity_id = json['to_entity_id'];
    final l$to_entity_type = json['to_entity_type'];
    final l$created_at = json['created_at'];
    final l$$__typename = json['__typename'];
    return Query$get_service_reviews$service_provider_details_by_pk$reviews(
      from_entity_id: (l$from_entity_id as int),
      from_entity_type: (l$from_entity_type as String),
      rating: (l$rating as int),
      note: (l$note as String?),
      id: (l$id as int),
      to_entity_id: (l$to_entity_id as int),
      to_entity_type: (l$to_entity_type as String),
      created_at: (l$created_at as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int from_entity_id;

  final String from_entity_type;

  final int rating;

  final String? note;

  final int id;

  final int to_entity_id;

  final String to_entity_type;

  final String created_at;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$from_entity_id = from_entity_id;
    _resultData['from_entity_id'] = l$from_entity_id;
    final l$from_entity_type = from_entity_type;
    _resultData['from_entity_type'] = l$from_entity_type;
    final l$rating = rating;
    _resultData['rating'] = l$rating;
    final l$note = note;
    _resultData['note'] = l$note;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$to_entity_id = to_entity_id;
    _resultData['to_entity_id'] = l$to_entity_id;
    final l$to_entity_type = to_entity_type;
    _resultData['to_entity_type'] = l$to_entity_type;
    final l$created_at = created_at;
    _resultData['created_at'] = l$created_at;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$from_entity_id = from_entity_id;
    final l$from_entity_type = from_entity_type;
    final l$rating = rating;
    final l$note = note;
    final l$id = id;
    final l$to_entity_id = to_entity_id;
    final l$to_entity_type = to_entity_type;
    final l$created_at = created_at;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$from_entity_id,
      l$from_entity_type,
      l$rating,
      l$note,
      l$id,
      l$to_entity_id,
      l$to_entity_type,
      l$created_at,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$get_service_reviews$service_provider_details_by_pk$reviews) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$from_entity_id = from_entity_id;
    final lOther$from_entity_id = other.from_entity_id;
    if (l$from_entity_id != lOther$from_entity_id) {
      return false;
    }
    final l$from_entity_type = from_entity_type;
    final lOther$from_entity_type = other.from_entity_type;
    if (l$from_entity_type != lOther$from_entity_type) {
      return false;
    }
    final l$rating = rating;
    final lOther$rating = other.rating;
    if (l$rating != lOther$rating) {
      return false;
    }
    final l$note = note;
    final lOther$note = other.note;
    if (l$note != lOther$note) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$to_entity_id = to_entity_id;
    final lOther$to_entity_id = other.to_entity_id;
    if (l$to_entity_id != lOther$to_entity_id) {
      return false;
    }
    final l$to_entity_type = to_entity_type;
    final lOther$to_entity_type = other.to_entity_type;
    if (l$to_entity_type != lOther$to_entity_type) {
      return false;
    }
    final l$created_at = created_at;
    final lOther$created_at = other.created_at;
    if (l$created_at != lOther$created_at) {
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

extension UtilityExtension$Query$get_service_reviews$service_provider_details_by_pk$reviews
    on Query$get_service_reviews$service_provider_details_by_pk$reviews {
  CopyWith$Query$get_service_reviews$service_provider_details_by_pk$reviews<
          Query$get_service_reviews$service_provider_details_by_pk$reviews>
      get copyWith =>
          CopyWith$Query$get_service_reviews$service_provider_details_by_pk$reviews(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_service_reviews$service_provider_details_by_pk$reviews<
    TRes> {
  factory CopyWith$Query$get_service_reviews$service_provider_details_by_pk$reviews(
    Query$get_service_reviews$service_provider_details_by_pk$reviews instance,
    TRes Function(
            Query$get_service_reviews$service_provider_details_by_pk$reviews)
        then,
  ) = _CopyWithImpl$Query$get_service_reviews$service_provider_details_by_pk$reviews;

  factory CopyWith$Query$get_service_reviews$service_provider_details_by_pk$reviews.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_service_reviews$service_provider_details_by_pk$reviews;

  TRes call({
    int? from_entity_id,
    String? from_entity_type,
    int? rating,
    String? note,
    int? id,
    int? to_entity_id,
    String? to_entity_type,
    String? created_at,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_service_reviews$service_provider_details_by_pk$reviews<
        TRes>
    implements
        CopyWith$Query$get_service_reviews$service_provider_details_by_pk$reviews<
            TRes> {
  _CopyWithImpl$Query$get_service_reviews$service_provider_details_by_pk$reviews(
    this._instance,
    this._then,
  );

  final Query$get_service_reviews$service_provider_details_by_pk$reviews
      _instance;

  final TRes Function(
      Query$get_service_reviews$service_provider_details_by_pk$reviews) _then;

  static const _undefined = {};

  TRes call({
    Object? from_entity_id = _undefined,
    Object? from_entity_type = _undefined,
    Object? rating = _undefined,
    Object? note = _undefined,
    Object? id = _undefined,
    Object? to_entity_id = _undefined,
    Object? to_entity_type = _undefined,
    Object? created_at = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_service_reviews$service_provider_details_by_pk$reviews(
        from_entity_id: from_entity_id == _undefined || from_entity_id == null
            ? _instance.from_entity_id
            : (from_entity_id as int),
        from_entity_type:
            from_entity_type == _undefined || from_entity_type == null
                ? _instance.from_entity_type
                : (from_entity_type as String),
        rating: rating == _undefined || rating == null
            ? _instance.rating
            : (rating as int),
        note: note == _undefined ? _instance.note : (note as String?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        to_entity_id: to_entity_id == _undefined || to_entity_id == null
            ? _instance.to_entity_id
            : (to_entity_id as int),
        to_entity_type: to_entity_type == _undefined || to_entity_type == null
            ? _instance.to_entity_type
            : (to_entity_type as String),
        created_at: created_at == _undefined || created_at == null
            ? _instance.created_at
            : (created_at as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_service_reviews$service_provider_details_by_pk$reviews<
        TRes>
    implements
        CopyWith$Query$get_service_reviews$service_provider_details_by_pk$reviews<
            TRes> {
  _CopyWithStubImpl$Query$get_service_reviews$service_provider_details_by_pk$reviews(
      this._res);

  TRes _res;

  call({
    int? from_entity_id,
    String? from_entity_type,
    int? rating,
    String? note,
    int? id,
    int? to_entity_id,
    String? to_entity_type,
    String? created_at,
    String? $__typename,
  }) =>
      _res;
}
