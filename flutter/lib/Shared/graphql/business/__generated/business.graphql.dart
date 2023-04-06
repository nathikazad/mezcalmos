import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Variables$Query$get_business_by_rental_category1 {
  factory Variables$Query$get_business_by_rental_category1({
    required double distance,
    required Geography from,
    String? category1,
  }) =>
      Variables$Query$get_business_by_rental_category1._({
        r'distance': distance,
        r'from': from,
        if (category1 != null) r'category1': category1,
      });

  Variables$Query$get_business_by_rental_category1._(this._$data);

  factory Variables$Query$get_business_by_rental_category1.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$distance = data['distance'];
    result$data['distance'] = (l$distance as num).toDouble();
    final l$from = data['from'];
    result$data['from'] = geographyFromJson(l$from);
    if (data.containsKey('category1')) {
      final l$category1 = data['category1'];
      result$data['category1'] = (l$category1 as String?);
    }
    return Variables$Query$get_business_by_rental_category1._(result$data);
  }

  Map<String, dynamic> _$data;

  double get distance => (_$data['distance'] as double);
  Geography get from => (_$data['from'] as Geography);
  String? get category1 => (_$data['category1'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$distance = distance;
    result$data['distance'] = l$distance;
    final l$from = from;
    result$data['from'] = geographyToJson(l$from);
    if (_$data.containsKey('category1')) {
      final l$category1 = category1;
      result$data['category1'] = l$category1;
    }
    return result$data;
  }

  CopyWith$Variables$Query$get_business_by_rental_category1<
          Variables$Query$get_business_by_rental_category1>
      get copyWith => CopyWith$Variables$Query$get_business_by_rental_category1(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_business_by_rental_category1) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$distance = distance;
    final lOther$distance = other.distance;
    if (l$distance != lOther$distance) {
      return false;
    }
    final l$from = from;
    final lOther$from = other.from;
    if (l$from != lOther$from) {
      return false;
    }
    final l$category1 = category1;
    final lOther$category1 = other.category1;
    if (_$data.containsKey('category1') !=
        other._$data.containsKey('category1')) {
      return false;
    }
    if (l$category1 != lOther$category1) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$distance = distance;
    final l$from = from;
    final l$category1 = category1;
    return Object.hashAll([
      l$distance,
      l$from,
      _$data.containsKey('category1') ? l$category1 : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$get_business_by_rental_category1<TRes> {
  factory CopyWith$Variables$Query$get_business_by_rental_category1(
    Variables$Query$get_business_by_rental_category1 instance,
    TRes Function(Variables$Query$get_business_by_rental_category1) then,
  ) = _CopyWithImpl$Variables$Query$get_business_by_rental_category1;

  factory CopyWith$Variables$Query$get_business_by_rental_category1.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Query$get_business_by_rental_category1;

  TRes call({
    double? distance,
    Geography? from,
    String? category1,
  });
}

class _CopyWithImpl$Variables$Query$get_business_by_rental_category1<TRes>
    implements CopyWith$Variables$Query$get_business_by_rental_category1<TRes> {
  _CopyWithImpl$Variables$Query$get_business_by_rental_category1(
    this._instance,
    this._then,
  );

  final Variables$Query$get_business_by_rental_category1 _instance;

  final TRes Function(Variables$Query$get_business_by_rental_category1) _then;

  static const _undefined = {};

  TRes call({
    Object? distance = _undefined,
    Object? from = _undefined,
    Object? category1 = _undefined,
  }) =>
      _then(Variables$Query$get_business_by_rental_category1._({
        ..._instance._$data,
        if (distance != _undefined && distance != null)
          'distance': (distance as double),
        if (from != _undefined && from != null) 'from': (from as Geography),
        if (category1 != _undefined) 'category1': (category1 as String?),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_business_by_rental_category1<TRes>
    implements CopyWith$Variables$Query$get_business_by_rental_category1<TRes> {
  _CopyWithStubImpl$Variables$Query$get_business_by_rental_category1(this._res);

  TRes _res;

  call({
    double? distance,
    Geography? from,
    String? category1,
  }) =>
      _res;
}

class Query$get_business_by_rental_category1 {
  Query$get_business_by_rental_category1({
    required this.business_business,
    required this.$__typename,
  });

  factory Query$get_business_by_rental_category1.fromJson(
      Map<String, dynamic> json) {
    final l$business_business = json['business_business'];
    final l$$__typename = json['__typename'];
    return Query$get_business_by_rental_category1(
      business_business: (l$business_business as List<dynamic>)
          .map((e) =>
              Query$get_business_by_rental_category1$business_business.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$get_business_by_rental_category1$business_business>
      business_business;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$business_business = business_business;
    _resultData['business_business'] =
        l$business_business.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$business_business = business_business;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$business_business.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_business_by_rental_category1) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$business_business = business_business;
    final lOther$business_business = other.business_business;
    if (l$business_business.length != lOther$business_business.length) {
      return false;
    }
    for (int i = 0; i < l$business_business.length; i++) {
      final l$business_business$entry = l$business_business[i];
      final lOther$business_business$entry = lOther$business_business[i];
      if (l$business_business$entry != lOther$business_business$entry) {
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

extension UtilityExtension$Query$get_business_by_rental_category1
    on Query$get_business_by_rental_category1 {
  CopyWith$Query$get_business_by_rental_category1<
          Query$get_business_by_rental_category1>
      get copyWith => CopyWith$Query$get_business_by_rental_category1(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_by_rental_category1<TRes> {
  factory CopyWith$Query$get_business_by_rental_category1(
    Query$get_business_by_rental_category1 instance,
    TRes Function(Query$get_business_by_rental_category1) then,
  ) = _CopyWithImpl$Query$get_business_by_rental_category1;

  factory CopyWith$Query$get_business_by_rental_category1.stub(TRes res) =
      _CopyWithStubImpl$Query$get_business_by_rental_category1;

  TRes call({
    List<Query$get_business_by_rental_category1$business_business>?
        business_business,
    String? $__typename,
  });
  TRes business_business(
      Iterable<Query$get_business_by_rental_category1$business_business> Function(
              Iterable<
                  CopyWith$Query$get_business_by_rental_category1$business_business<
                      Query$get_business_by_rental_category1$business_business>>)
          _fn);
}

class _CopyWithImpl$Query$get_business_by_rental_category1<TRes>
    implements CopyWith$Query$get_business_by_rental_category1<TRes> {
  _CopyWithImpl$Query$get_business_by_rental_category1(
    this._instance,
    this._then,
  );

  final Query$get_business_by_rental_category1 _instance;

  final TRes Function(Query$get_business_by_rental_category1) _then;

  static const _undefined = {};

  TRes call({
    Object? business_business = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_business_by_rental_category1(
        business_business:
            business_business == _undefined || business_business == null
                ? _instance.business_business
                : (business_business as List<
                    Query$get_business_by_rental_category1$business_business>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes business_business(
          Iterable<Query$get_business_by_rental_category1$business_business> Function(
                  Iterable<
                      CopyWith$Query$get_business_by_rental_category1$business_business<
                          Query$get_business_by_rental_category1$business_business>>)
              _fn) =>
      call(
          business_business: _fn(_instance.business_business.map((e) =>
              CopyWith$Query$get_business_by_rental_category1$business_business(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_business_by_rental_category1<TRes>
    implements CopyWith$Query$get_business_by_rental_category1<TRes> {
  _CopyWithStubImpl$Query$get_business_by_rental_category1(this._res);

  TRes _res;

  call({
    List<Query$get_business_by_rental_category1$business_business>?
        business_business,
    String? $__typename,
  }) =>
      _res;
  business_business(_fn) => _res;
}

const documentNodeQueryget_business_by_rental_category1 =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_business_by_rental_category1'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'distance')),
        type: NamedTypeNode(
          name: NameNode(value: 'Float'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'from')),
        type: NamedTypeNode(
          name: NameNode(value: 'geography'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'category1')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'business_business'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: '_and'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'details'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                        name: NameNode(value: 'location'),
                        value: ObjectValueNode(fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'gps'),
                            value: ObjectValueNode(fields: [
                              ObjectFieldNode(
                                name: NameNode(value: '_st_d_within'),
                                value: ObjectValueNode(fields: [
                                  ObjectFieldNode(
                                    name: NameNode(value: 'distance'),
                                    value: VariableNode(
                                        name: NameNode(value: 'distance')),
                                  ),
                                  ObjectFieldNode(
                                    name: NameNode(value: 'from'),
                                    value: VariableNode(
                                        name: NameNode(value: 'from')),
                                  ),
                                ]),
                              )
                            ]),
                          )
                        ]),
                      )
                    ]),
                  ),
                  ObjectFieldNode(
                    name: NameNode(value: 'rentals'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                        name: NameNode(value: 'service'),
                        value: ObjectValueNode(fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'category1'),
                            value: ObjectValueNode(fields: [
                              ObjectFieldNode(
                                name: NameNode(value: '_eq'),
                                value: VariableNode(
                                    name: NameNode(value: 'category1')),
                              )
                            ]),
                          )
                        ]),
                      )
                    ]),
                  ),
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
            name: NameNode(value: 'details'),
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
                name: NameNode(value: 'name'),
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
            name: NameNode(value: 'reviews_aggregate'),
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
      
    ]),
  ),
]);
Query$get_business_by_rental_category1
    _parserFn$Query$get_business_by_rental_category1(
            Map<String, dynamic> data) =>
        Query$get_business_by_rental_category1.fromJson(data);

class Options$Query$get_business_by_rental_category1
    extends graphql.QueryOptions<Query$get_business_by_rental_category1> {
  Options$Query$get_business_by_rental_category1({
    String? operationName,
    required Variables$Query$get_business_by_rental_category1 variables,
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
          document: documentNodeQueryget_business_by_rental_category1,
          parserFn: _parserFn$Query$get_business_by_rental_category1,
        );
}

class WatchOptions$Query$get_business_by_rental_category1
    extends graphql.WatchQueryOptions<Query$get_business_by_rental_category1> {
  WatchOptions$Query$get_business_by_rental_category1({
    String? operationName,
    required Variables$Query$get_business_by_rental_category1 variables,
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
          document: documentNodeQueryget_business_by_rental_category1,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_business_by_rental_category1,
        );
}

class FetchMoreOptions$Query$get_business_by_rental_category1
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_business_by_rental_category1({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_business_by_rental_category1 variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_business_by_rental_category1,
        );
}

extension ClientExtension$Query$get_business_by_rental_category1
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_business_by_rental_category1>>
      query$get_business_by_rental_category1(
              Options$Query$get_business_by_rental_category1 options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$get_business_by_rental_category1>
      watchQuery$get_business_by_rental_category1(
              WatchOptions$Query$get_business_by_rental_category1 options) =>
          this.watchQuery(options);
  void writeQuery$get_business_by_rental_category1({
    required Query$get_business_by_rental_category1 data,
    required Variables$Query$get_business_by_rental_category1 variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryget_business_by_rental_category1),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_business_by_rental_category1?
      readQuery$get_business_by_rental_category1({
    required Variables$Query$get_business_by_rental_category1 variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryget_business_by_rental_category1),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$get_business_by_rental_category1.fromJson(result);
  }
}

class Query$get_business_by_rental_category1$business_business {
  Query$get_business_by_rental_category1$business_business({
    required this.id,
    required this.details,
    required this.reviews_aggregate,
    required this.$__typename,
  });

  factory Query$get_business_by_rental_category1$business_business.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$details = json['details'];
    final l$reviews_aggregate = json['reviews_aggregate'];
    final l$$__typename = json['__typename'];
    return Query$get_business_by_rental_category1$business_business(
      id: (l$id as int),
      details: Query$get_business_by_rental_category1$business_business$details
          .fromJson((l$details as Map<String, dynamic>)),
      reviews_aggregate:
          Query$get_business_by_rental_category1$business_business$reviews_aggregate
              .fromJson((l$reviews_aggregate as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$get_business_by_rental_category1$business_business$details
      details;

  final Query$get_business_by_rental_category1$business_business$reviews_aggregate
      reviews_aggregate;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$details = details;
    _resultData['details'] = l$details.toJson();
    final l$reviews_aggregate = reviews_aggregate;
    _resultData['reviews_aggregate'] = l$reviews_aggregate.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$details = details;
    final l$reviews_aggregate = reviews_aggregate;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$details,
      l$reviews_aggregate,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_business_by_rental_category1$business_business) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$details = details;
    final lOther$details = other.details;
    if (l$details != lOther$details) {
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

extension UtilityExtension$Query$get_business_by_rental_category1$business_business
    on Query$get_business_by_rental_category1$business_business {
  CopyWith$Query$get_business_by_rental_category1$business_business<
          Query$get_business_by_rental_category1$business_business>
      get copyWith =>
          CopyWith$Query$get_business_by_rental_category1$business_business(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_by_rental_category1$business_business<
    TRes> {
  factory CopyWith$Query$get_business_by_rental_category1$business_business(
    Query$get_business_by_rental_category1$business_business instance,
    TRes Function(Query$get_business_by_rental_category1$business_business)
        then,
  ) = _CopyWithImpl$Query$get_business_by_rental_category1$business_business;

  factory CopyWith$Query$get_business_by_rental_category1$business_business.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_by_rental_category1$business_business;

  TRes call({
    int? id,
    Query$get_business_by_rental_category1$business_business$details? details,
    Query$get_business_by_rental_category1$business_business$reviews_aggregate?
        reviews_aggregate,
    String? $__typename,
  });
  CopyWith$Query$get_business_by_rental_category1$business_business$details<
      TRes> get details;
  CopyWith$Query$get_business_by_rental_category1$business_business$reviews_aggregate<
      TRes> get reviews_aggregate;
}

class _CopyWithImpl$Query$get_business_by_rental_category1$business_business<
        TRes>
    implements
        CopyWith$Query$get_business_by_rental_category1$business_business<
            TRes> {
  _CopyWithImpl$Query$get_business_by_rental_category1$business_business(
    this._instance,
    this._then,
  );

  final Query$get_business_by_rental_category1$business_business _instance;

  final TRes Function(Query$get_business_by_rental_category1$business_business)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? details = _undefined,
    Object? reviews_aggregate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_business_by_rental_category1$business_business(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Query$get_business_by_rental_category1$business_business$details),
        reviews_aggregate: reviews_aggregate == _undefined ||
                reviews_aggregate == null
            ? _instance.reviews_aggregate
            : (reviews_aggregate
                as Query$get_business_by_rental_category1$business_business$reviews_aggregate),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_business_by_rental_category1$business_business$details<
      TRes> get details {
    final local$details = _instance.details;
    return CopyWith$Query$get_business_by_rental_category1$business_business$details(
        local$details, (e) => call(details: e));
  }

  CopyWith$Query$get_business_by_rental_category1$business_business$reviews_aggregate<
      TRes> get reviews_aggregate {
    final local$reviews_aggregate = _instance.reviews_aggregate;
    return CopyWith$Query$get_business_by_rental_category1$business_business$reviews_aggregate(
        local$reviews_aggregate, (e) => call(reviews_aggregate: e));
  }
}

class _CopyWithStubImpl$Query$get_business_by_rental_category1$business_business<
        TRes>
    implements
        CopyWith$Query$get_business_by_rental_category1$business_business<
            TRes> {
  _CopyWithStubImpl$Query$get_business_by_rental_category1$business_business(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$get_business_by_rental_category1$business_business$details? details,
    Query$get_business_by_rental_category1$business_business$reviews_aggregate?
        reviews_aggregate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_business_by_rental_category1$business_business$details<
          TRes>
      get details =>
          CopyWith$Query$get_business_by_rental_category1$business_business$details
              .stub(_res);
  CopyWith$Query$get_business_by_rental_category1$business_business$reviews_aggregate<
          TRes>
      get reviews_aggregate =>
          CopyWith$Query$get_business_by_rental_category1$business_business$reviews_aggregate
              .stub(_res);
}

class Query$get_business_by_rental_category1$business_business$details {
  Query$get_business_by_rental_category1$business_business$details({
    required this.id,
    required this.accepted_payments,
    required this.image,
    required this.name,
    required this.$__typename,
  });

  factory Query$get_business_by_rental_category1$business_business$details.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$accepted_payments = json['accepted_payments'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$get_business_by_rental_category1$business_business$details(
      id: (l$id as int),
      accepted_payments: mapFromJson(l$accepted_payments),
      image: (l$image as String),
      name: (l$name as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final dynamic accepted_payments;

  final String image;

  final String name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$accepted_payments = accepted_payments;
    _resultData['accepted_payments'] = mapToJson(l$accepted_payments);
    final l$image = image;
    _resultData['image'] = l$image;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$accepted_payments = accepted_payments;
    final l$image = image;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$accepted_payments,
      l$image,
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
            is Query$get_business_by_rental_category1$business_business$details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Query$get_business_by_rental_category1$business_business$details
    on Query$get_business_by_rental_category1$business_business$details {
  CopyWith$Query$get_business_by_rental_category1$business_business$details<
          Query$get_business_by_rental_category1$business_business$details>
      get copyWith =>
          CopyWith$Query$get_business_by_rental_category1$business_business$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_by_rental_category1$business_business$details<
    TRes> {
  factory CopyWith$Query$get_business_by_rental_category1$business_business$details(
    Query$get_business_by_rental_category1$business_business$details instance,
    TRes Function(
            Query$get_business_by_rental_category1$business_business$details)
        then,
  ) = _CopyWithImpl$Query$get_business_by_rental_category1$business_business$details;

  factory CopyWith$Query$get_business_by_rental_category1$business_business$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_by_rental_category1$business_business$details;

  TRes call({
    int? id,
    dynamic? accepted_payments,
    String? image,
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_business_by_rental_category1$business_business$details<
        TRes>
    implements
        CopyWith$Query$get_business_by_rental_category1$business_business$details<
            TRes> {
  _CopyWithImpl$Query$get_business_by_rental_category1$business_business$details(
    this._instance,
    this._then,
  );

  final Query$get_business_by_rental_category1$business_business$details
      _instance;

  final TRes Function(
      Query$get_business_by_rental_category1$business_business$details) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? accepted_payments = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_business_by_rental_category1$business_business$details(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        accepted_payments:
            accepted_payments == _undefined || accepted_payments == null
                ? _instance.accepted_payments
                : (accepted_payments as dynamic),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_business_by_rental_category1$business_business$details<
        TRes>
    implements
        CopyWith$Query$get_business_by_rental_category1$business_business$details<
            TRes> {
  _CopyWithStubImpl$Query$get_business_by_rental_category1$business_business$details(
      this._res);

  TRes _res;

  call({
    int? id,
    dynamic? accepted_payments,
    String? image,
    String? name,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_business_by_rental_category1$business_business$reviews_aggregate {
  Query$get_business_by_rental_category1$business_business$reviews_aggregate({
    this.aggregate,
    required this.$__typename,
  });

  factory Query$get_business_by_rental_category1$business_business$reviews_aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$aggregate = json['aggregate'];
    final l$$__typename = json['__typename'];
    return Query$get_business_by_rental_category1$business_business$reviews_aggregate(
      aggregate: l$aggregate == null
          ? null
          : Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate
              .fromJson((l$aggregate as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate?
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
            is Query$get_business_by_rental_category1$business_business$reviews_aggregate) ||
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

extension UtilityExtension$Query$get_business_by_rental_category1$business_business$reviews_aggregate
    on Query$get_business_by_rental_category1$business_business$reviews_aggregate {
  CopyWith$Query$get_business_by_rental_category1$business_business$reviews_aggregate<
          Query$get_business_by_rental_category1$business_business$reviews_aggregate>
      get copyWith =>
          CopyWith$Query$get_business_by_rental_category1$business_business$reviews_aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_by_rental_category1$business_business$reviews_aggregate<
    TRes> {
  factory CopyWith$Query$get_business_by_rental_category1$business_business$reviews_aggregate(
    Query$get_business_by_rental_category1$business_business$reviews_aggregate
        instance,
    TRes Function(
            Query$get_business_by_rental_category1$business_business$reviews_aggregate)
        then,
  ) = _CopyWithImpl$Query$get_business_by_rental_category1$business_business$reviews_aggregate;

  factory CopyWith$Query$get_business_by_rental_category1$business_business$reviews_aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_by_rental_category1$business_business$reviews_aggregate;

  TRes call({
    Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate?
        aggregate,
    String? $__typename,
  });
  CopyWith$Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate<
      TRes> get aggregate;
}

class _CopyWithImpl$Query$get_business_by_rental_category1$business_business$reviews_aggregate<
        TRes>
    implements
        CopyWith$Query$get_business_by_rental_category1$business_business$reviews_aggregate<
            TRes> {
  _CopyWithImpl$Query$get_business_by_rental_category1$business_business$reviews_aggregate(
    this._instance,
    this._then,
  );

  final Query$get_business_by_rental_category1$business_business$reviews_aggregate
      _instance;

  final TRes Function(
          Query$get_business_by_rental_category1$business_business$reviews_aggregate)
      _then;

  static const _undefined = {};

  TRes call({
    Object? aggregate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_business_by_rental_category1$business_business$reviews_aggregate(
        aggregate: aggregate == _undefined
            ? _instance.aggregate
            : (aggregate
                as Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate<
      TRes> get aggregate {
    final local$aggregate = _instance.aggregate;
    return local$aggregate == null
        ? CopyWith$Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate
            .stub(_then(_instance))
        : CopyWith$Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate(
            local$aggregate, (e) => call(aggregate: e));
  }
}

class _CopyWithStubImpl$Query$get_business_by_rental_category1$business_business$reviews_aggregate<
        TRes>
    implements
        CopyWith$Query$get_business_by_rental_category1$business_business$reviews_aggregate<
            TRes> {
  _CopyWithStubImpl$Query$get_business_by_rental_category1$business_business$reviews_aggregate(
      this._res);

  TRes _res;

  call({
    Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate?
        aggregate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate<
          TRes>
      get aggregate =>
          CopyWith$Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate
              .stub(_res);
}

class Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate {
  Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate({
    this.avg,
    required this.count,
    required this.$__typename,
  });

  factory Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$avg = json['avg'];
    final l$count = json['count'];
    final l$$__typename = json['__typename'];
    return Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate(
      avg: l$avg == null
          ? null
          : Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate$avg
              .fromJson((l$avg as Map<String, dynamic>)),
      count: (l$count as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate$avg?
      avg;

  final int count;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$avg = avg;
    _resultData['avg'] = l$avg?.toJson();
    final l$count = count;
    _resultData['count'] = l$count;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$avg = avg;
    final l$count = count;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$avg,
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
            is Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$avg = avg;
    final lOther$avg = other.avg;
    if (l$avg != lOther$avg) {
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

extension UtilityExtension$Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate
    on Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate {
  CopyWith$Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate<
          Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate>
      get copyWith =>
          CopyWith$Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate<
    TRes> {
  factory CopyWith$Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate(
    Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate
        instance,
    TRes Function(
            Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate)
        then,
  ) = _CopyWithImpl$Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate;

  factory CopyWith$Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate;

  TRes call({
    Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate$avg?
        avg,
    int? count,
    String? $__typename,
  });
  CopyWith$Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate$avg<
      TRes> get avg;
}

class _CopyWithImpl$Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate<
            TRes> {
  _CopyWithImpl$Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate(
    this._instance,
    this._then,
  );

  final Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate
      _instance;

  final TRes Function(
          Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate)
      _then;

  static const _undefined = {};

  TRes call({
    Object? avg = _undefined,
    Object? count = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate(
        avg: avg == _undefined
            ? _instance.avg
            : (avg
                as Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate$avg?),
        count: count == _undefined || count == null
            ? _instance.count
            : (count as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate$avg<
      TRes> get avg {
    final local$avg = _instance.avg;
    return local$avg == null
        ? CopyWith$Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate$avg
            .stub(_then(_instance))
        : CopyWith$Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate$avg(
            local$avg, (e) => call(avg: e));
  }
}

class _CopyWithStubImpl$Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate<
            TRes> {
  _CopyWithStubImpl$Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate(
      this._res);

  TRes _res;

  call({
    Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate$avg?
        avg,
    int? count,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate$avg<
          TRes>
      get avg =>
          CopyWith$Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate$avg
              .stub(_res);
}

class Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate$avg {
  Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate$avg({
    this.rating,
    required this.$__typename,
  });

  factory Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate$avg.fromJson(
      Map<String, dynamic> json) {
    final l$rating = json['rating'];
    final l$$__typename = json['__typename'];
    return Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate$avg(
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
            is Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate$avg) ||
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

extension UtilityExtension$Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate$avg
    on Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate$avg {
  CopyWith$Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate$avg<
          Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate$avg>
      get copyWith =>
          CopyWith$Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate$avg(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate$avg<
    TRes> {
  factory CopyWith$Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate$avg(
    Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate$avg
        instance,
    TRes Function(
            Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate$avg)
        then,
  ) = _CopyWithImpl$Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate$avg;

  factory CopyWith$Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate$avg.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate$avg;

  TRes call({
    double? rating,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate$avg<
        TRes>
    implements
        CopyWith$Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate$avg<
            TRes> {
  _CopyWithImpl$Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate$avg(
    this._instance,
    this._then,
  );

  final Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate$avg
      _instance;

  final TRes Function(
          Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate$avg)
      _then;

  static const _undefined = {};

  TRes call({
    Object? rating = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate$avg(
        rating: rating == _undefined ? _instance.rating : (rating as double?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate$avg<
        TRes>
    implements
        CopyWith$Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate$avg<
            TRes> {
  _CopyWithStubImpl$Query$get_business_by_rental_category1$business_business$reviews_aggregate$aggregate$avg(
      this._res);

  TRes _res;

  call({
    double? rating,
    String? $__typename,
  }) =>
      _res;
}
