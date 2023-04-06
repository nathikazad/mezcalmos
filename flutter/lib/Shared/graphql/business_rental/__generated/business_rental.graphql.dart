import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Variables$Query$get_rental_by_category {
  factory Variables$Query$get_rental_by_category({
    String? category1,
    required double distance,
    required Geography from,
  }) =>
      Variables$Query$get_rental_by_category._({
        if (category1 != null) r'category1': category1,
        r'distance': distance,
        r'from': from,
      });

  Variables$Query$get_rental_by_category._(this._$data);

  factory Variables$Query$get_rental_by_category.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('category1')) {
      final l$category1 = data['category1'];
      result$data['category1'] = (l$category1 as String?);
    }
    final l$distance = data['distance'];
    result$data['distance'] = (l$distance as num).toDouble();
    final l$from = data['from'];
    result$data['from'] = geographyFromJson(l$from);
    return Variables$Query$get_rental_by_category._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get category1 => (_$data['category1'] as String?);
  double get distance => (_$data['distance'] as double);
  Geography get from => (_$data['from'] as Geography);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('category1')) {
      final l$category1 = category1;
      result$data['category1'] = l$category1;
    }
    final l$distance = distance;
    result$data['distance'] = l$distance;
    final l$from = from;
    result$data['from'] = geographyToJson(l$from);
    return result$data;
  }

  CopyWith$Variables$Query$get_rental_by_category<
          Variables$Query$get_rental_by_category>
      get copyWith => CopyWith$Variables$Query$get_rental_by_category(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_rental_by_category) ||
        runtimeType != other.runtimeType) {
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
    return true;
  }

  @override
  int get hashCode {
    final l$category1 = category1;
    final l$distance = distance;
    final l$from = from;
    return Object.hashAll([
      _$data.containsKey('category1') ? l$category1 : const {},
      l$distance,
      l$from,
    ]);
  }
}

abstract class CopyWith$Variables$Query$get_rental_by_category<TRes> {
  factory CopyWith$Variables$Query$get_rental_by_category(
    Variables$Query$get_rental_by_category instance,
    TRes Function(Variables$Query$get_rental_by_category) then,
  ) = _CopyWithImpl$Variables$Query$get_rental_by_category;

  factory CopyWith$Variables$Query$get_rental_by_category.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$get_rental_by_category;

  TRes call({
    String? category1,
    double? distance,
    Geography? from,
  });
}

class _CopyWithImpl$Variables$Query$get_rental_by_category<TRes>
    implements CopyWith$Variables$Query$get_rental_by_category<TRes> {
  _CopyWithImpl$Variables$Query$get_rental_by_category(
    this._instance,
    this._then,
  );

  final Variables$Query$get_rental_by_category _instance;

  final TRes Function(Variables$Query$get_rental_by_category) _then;

  static const _undefined = {};

  TRes call({
    Object? category1 = _undefined,
    Object? distance = _undefined,
    Object? from = _undefined,
  }) =>
      _then(Variables$Query$get_rental_by_category._({
        ..._instance._$data,
        if (category1 != _undefined) 'category1': (category1 as String?),
        if (distance != _undefined && distance != null)
          'distance': (distance as double),
        if (from != _undefined && from != null) 'from': (from as Geography),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_rental_by_category<TRes>
    implements CopyWith$Variables$Query$get_rental_by_category<TRes> {
  _CopyWithStubImpl$Variables$Query$get_rental_by_category(this._res);

  TRes _res;

  call({
    String? category1,
    double? distance,
    Geography? from,
  }) =>
      _res;
}

class Query$get_rental_by_category {
  Query$get_rental_by_category({
    required this.business_rental,
    required this.$__typename,
  });

  factory Query$get_rental_by_category.fromJson(Map<String, dynamic> json) {
    final l$business_rental = json['business_rental'];
    final l$$__typename = json['__typename'];
    return Query$get_rental_by_category(
      business_rental: (l$business_rental as List<dynamic>)
          .map((e) => Query$get_rental_by_category$business_rental.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$get_rental_by_category$business_rental> business_rental;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$business_rental = business_rental;
    _resultData['business_rental'] =
        l$business_rental.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$business_rental = business_rental;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$business_rental.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_rental_by_category) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$business_rental = business_rental;
    final lOther$business_rental = other.business_rental;
    if (l$business_rental.length != lOther$business_rental.length) {
      return false;
    }
    for (int i = 0; i < l$business_rental.length; i++) {
      final l$business_rental$entry = l$business_rental[i];
      final lOther$business_rental$entry = lOther$business_rental[i];
      if (l$business_rental$entry != lOther$business_rental$entry) {
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

extension UtilityExtension$Query$get_rental_by_category
    on Query$get_rental_by_category {
  CopyWith$Query$get_rental_by_category<Query$get_rental_by_category>
      get copyWith => CopyWith$Query$get_rental_by_category(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_rental_by_category<TRes> {
  factory CopyWith$Query$get_rental_by_category(
    Query$get_rental_by_category instance,
    TRes Function(Query$get_rental_by_category) then,
  ) = _CopyWithImpl$Query$get_rental_by_category;

  factory CopyWith$Query$get_rental_by_category.stub(TRes res) =
      _CopyWithStubImpl$Query$get_rental_by_category;

  TRes call({
    List<Query$get_rental_by_category$business_rental>? business_rental,
    String? $__typename,
  });
  TRes business_rental(
      Iterable<Query$get_rental_by_category$business_rental> Function(
              Iterable<
                  CopyWith$Query$get_rental_by_category$business_rental<
                      Query$get_rental_by_category$business_rental>>)
          _fn);
}

class _CopyWithImpl$Query$get_rental_by_category<TRes>
    implements CopyWith$Query$get_rental_by_category<TRes> {
  _CopyWithImpl$Query$get_rental_by_category(
    this._instance,
    this._then,
  );

  final Query$get_rental_by_category _instance;

  final TRes Function(Query$get_rental_by_category) _then;

  static const _undefined = {};

  TRes call({
    Object? business_rental = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_rental_by_category(
        business_rental:
            business_rental == _undefined || business_rental == null
                ? _instance.business_rental
                : (business_rental
                    as List<Query$get_rental_by_category$business_rental>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes business_rental(
          Iterable<Query$get_rental_by_category$business_rental> Function(
                  Iterable<
                      CopyWith$Query$get_rental_by_category$business_rental<
                          Query$get_rental_by_category$business_rental>>)
              _fn) =>
      call(
          business_rental: _fn(_instance.business_rental
              .map((e) => CopyWith$Query$get_rental_by_category$business_rental(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$get_rental_by_category<TRes>
    implements CopyWith$Query$get_rental_by_category<TRes> {
  _CopyWithStubImpl$Query$get_rental_by_category(this._res);

  TRes _res;

  call({
    List<Query$get_rental_by_category$business_rental>? business_rental,
    String? $__typename,
  }) =>
      _res;
  business_rental(_fn) => _res;
}

const documentNodeQueryget_rental_by_category = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_rental_by_category'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'category1')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
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
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'business_rental'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: '_and'),
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
                  ),
                  ObjectFieldNode(
                    name: NameNode(value: 'business'),
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
            name: NameNode(value: 'service'),
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
                name: NameNode(value: 'additional_parameters'),
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
                name: NameNode(value: 'category1'),
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
                name: NameNode(value: 'image'),
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
            name: NameNode(value: 'business'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'details'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
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
Query$get_rental_by_category _parserFn$Query$get_rental_by_category(
        Map<String, dynamic> data) =>
    Query$get_rental_by_category.fromJson(data);

class Options$Query$get_rental_by_category
    extends graphql.QueryOptions<Query$get_rental_by_category> {
  Options$Query$get_rental_by_category({
    String? operationName,
    required Variables$Query$get_rental_by_category variables,
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
          document: documentNodeQueryget_rental_by_category,
          parserFn: _parserFn$Query$get_rental_by_category,
        );
}

class WatchOptions$Query$get_rental_by_category
    extends graphql.WatchQueryOptions<Query$get_rental_by_category> {
  WatchOptions$Query$get_rental_by_category({
    String? operationName,
    required Variables$Query$get_rental_by_category variables,
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
          document: documentNodeQueryget_rental_by_category,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_rental_by_category,
        );
}

class FetchMoreOptions$Query$get_rental_by_category
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_rental_by_category({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_rental_by_category variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_rental_by_category,
        );
}

extension ClientExtension$Query$get_rental_by_category
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_rental_by_category>>
      query$get_rental_by_category(
              Options$Query$get_rental_by_category options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$get_rental_by_category>
      watchQuery$get_rental_by_category(
              WatchOptions$Query$get_rental_by_category options) =>
          this.watchQuery(options);
  void writeQuery$get_rental_by_category({
    required Query$get_rental_by_category data,
    required Variables$Query$get_rental_by_category variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryget_rental_by_category),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_rental_by_category? readQuery$get_rental_by_category({
    required Variables$Query$get_rental_by_category variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryget_rental_by_category),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$get_rental_by_category.fromJson(result);
  }
}

class Query$get_rental_by_category$business_rental {
  Query$get_rental_by_category$business_rental({
    required this.service,
    required this.id,
    required this.business,
    required this.$__typename,
  });

  factory Query$get_rental_by_category$business_rental.fromJson(
      Map<String, dynamic> json) {
    final l$service = json['service'];
    final l$id = json['id'];
    final l$business = json['business'];
    final l$$__typename = json['__typename'];
    return Query$get_rental_by_category$business_rental(
      service: Query$get_rental_by_category$business_rental$service.fromJson(
          (l$service as Map<String, dynamic>)),
      id: (l$id as int),
      business: Query$get_rental_by_category$business_rental$business.fromJson(
          (l$business as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_rental_by_category$business_rental$service service;

  final int id;

  final Query$get_rental_by_category$business_rental$business business;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$service = service;
    _resultData['service'] = l$service.toJson();
    final l$id = id;
    _resultData['id'] = l$id;
    final l$business = business;
    _resultData['business'] = l$business.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$service = service;
    final l$id = id;
    final l$business = business;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$service,
      l$id,
      l$business,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_rental_by_category$business_rental) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$service = service;
    final lOther$service = other.service;
    if (l$service != lOther$service) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$business = business;
    final lOther$business = other.business;
    if (l$business != lOther$business) {
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

extension UtilityExtension$Query$get_rental_by_category$business_rental
    on Query$get_rental_by_category$business_rental {
  CopyWith$Query$get_rental_by_category$business_rental<
          Query$get_rental_by_category$business_rental>
      get copyWith => CopyWith$Query$get_rental_by_category$business_rental(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_rental_by_category$business_rental<TRes> {
  factory CopyWith$Query$get_rental_by_category$business_rental(
    Query$get_rental_by_category$business_rental instance,
    TRes Function(Query$get_rental_by_category$business_rental) then,
  ) = _CopyWithImpl$Query$get_rental_by_category$business_rental;

  factory CopyWith$Query$get_rental_by_category$business_rental.stub(TRes res) =
      _CopyWithStubImpl$Query$get_rental_by_category$business_rental;

  TRes call({
    Query$get_rental_by_category$business_rental$service? service,
    int? id,
    Query$get_rental_by_category$business_rental$business? business,
    String? $__typename,
  });
  CopyWith$Query$get_rental_by_category$business_rental$service<TRes>
      get service;
  CopyWith$Query$get_rental_by_category$business_rental$business<TRes>
      get business;
}

class _CopyWithImpl$Query$get_rental_by_category$business_rental<TRes>
    implements CopyWith$Query$get_rental_by_category$business_rental<TRes> {
  _CopyWithImpl$Query$get_rental_by_category$business_rental(
    this._instance,
    this._then,
  );

  final Query$get_rental_by_category$business_rental _instance;

  final TRes Function(Query$get_rental_by_category$business_rental) _then;

  static const _undefined = {};

  TRes call({
    Object? service = _undefined,
    Object? id = _undefined,
    Object? business = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_rental_by_category$business_rental(
        service: service == _undefined || service == null
            ? _instance.service
            : (service as Query$get_rental_by_category$business_rental$service),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        business: business == _undefined || business == null
            ? _instance.business
            : (business
                as Query$get_rental_by_category$business_rental$business),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_rental_by_category$business_rental$service<TRes>
      get service {
    final local$service = _instance.service;
    return CopyWith$Query$get_rental_by_category$business_rental$service(
        local$service, (e) => call(service: e));
  }

  CopyWith$Query$get_rental_by_category$business_rental$business<TRes>
      get business {
    final local$business = _instance.business;
    return CopyWith$Query$get_rental_by_category$business_rental$business(
        local$business, (e) => call(business: e));
  }
}

class _CopyWithStubImpl$Query$get_rental_by_category$business_rental<TRes>
    implements CopyWith$Query$get_rental_by_category$business_rental<TRes> {
  _CopyWithStubImpl$Query$get_rental_by_category$business_rental(this._res);

  TRes _res;

  call({
    Query$get_rental_by_category$business_rental$service? service,
    int? id,
    Query$get_rental_by_category$business_rental$business? business,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_rental_by_category$business_rental$service<TRes>
      get service =>
          CopyWith$Query$get_rental_by_category$business_rental$service.stub(
              _res);
  CopyWith$Query$get_rental_by_category$business_rental$business<TRes>
      get business =>
          CopyWith$Query$get_rental_by_category$business_rental$business.stub(
              _res);
}

class Query$get_rental_by_category$business_rental$service {
  Query$get_rental_by_category$business_rental$service({
    required this.id,
    required this.name,
    this.description,
    this.additional_parameters,
    required this.available,
    required this.category1,
    required this.cost,
    this.image,
    required this.position,
    required this.$__typename,
  });

  factory Query$get_rental_by_category$business_rental$service.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$description = json['description'];
    final l$additional_parameters = json['additional_parameters'];
    final l$available = json['available'];
    final l$category1 = json['category1'];
    final l$cost = json['cost'];
    final l$image = json['image'];
    final l$position = json['position'];
    final l$$__typename = json['__typename'];
    return Query$get_rental_by_category$business_rental$service(
      id: (l$id as int),
      name: Query$get_rental_by_category$business_rental$service$name.fromJson(
          (l$name as Map<String, dynamic>)),
      description: l$description == null
          ? null
          : Query$get_rental_by_category$business_rental$service$description
              .fromJson((l$description as Map<String, dynamic>)),
      additional_parameters: l$additional_parameters == null
          ? null
          : mapFromJson(l$additional_parameters),
      available: (l$available as bool),
      category1: (l$category1 as String),
      cost: mapFromJson(l$cost),
      image: l$image == null ? null : mapFromJson(l$image),
      position: (l$position as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$get_rental_by_category$business_rental$service$name name;

  final Query$get_rental_by_category$business_rental$service$description?
      description;

  final dynamic? additional_parameters;

  final bool available;

  final String category1;

  final dynamic cost;

  final dynamic? image;

  final int position;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
    final l$additional_parameters = additional_parameters;
    _resultData['additional_parameters'] = l$additional_parameters == null
        ? null
        : mapToJson(l$additional_parameters);
    final l$available = available;
    _resultData['available'] = l$available;
    final l$category1 = category1;
    _resultData['category1'] = l$category1;
    final l$cost = cost;
    _resultData['cost'] = mapToJson(l$cost);
    final l$image = image;
    _resultData['image'] = l$image == null ? null : mapToJson(l$image);
    final l$position = position;
    _resultData['position'] = l$position;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$description = description;
    final l$additional_parameters = additional_parameters;
    final l$available = available;
    final l$category1 = category1;
    final l$cost = cost;
    final l$image = image;
    final l$position = position;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$description,
      l$additional_parameters,
      l$available,
      l$category1,
      l$cost,
      l$image,
      l$position,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_rental_by_category$business_rental$service) ||
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
    final l$additional_parameters = additional_parameters;
    final lOther$additional_parameters = other.additional_parameters;
    if (l$additional_parameters != lOther$additional_parameters) {
      return false;
    }
    final l$available = available;
    final lOther$available = other.available;
    if (l$available != lOther$available) {
      return false;
    }
    final l$category1 = category1;
    final lOther$category1 = other.category1;
    if (l$category1 != lOther$category1) {
      return false;
    }
    final l$cost = cost;
    final lOther$cost = other.cost;
    if (l$cost != lOther$cost) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
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

extension UtilityExtension$Query$get_rental_by_category$business_rental$service
    on Query$get_rental_by_category$business_rental$service {
  CopyWith$Query$get_rental_by_category$business_rental$service<
          Query$get_rental_by_category$business_rental$service>
      get copyWith =>
          CopyWith$Query$get_rental_by_category$business_rental$service(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_rental_by_category$business_rental$service<
    TRes> {
  factory CopyWith$Query$get_rental_by_category$business_rental$service(
    Query$get_rental_by_category$business_rental$service instance,
    TRes Function(Query$get_rental_by_category$business_rental$service) then,
  ) = _CopyWithImpl$Query$get_rental_by_category$business_rental$service;

  factory CopyWith$Query$get_rental_by_category$business_rental$service.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_rental_by_category$business_rental$service;

  TRes call({
    int? id,
    Query$get_rental_by_category$business_rental$service$name? name,
    Query$get_rental_by_category$business_rental$service$description?
        description,
    dynamic? additional_parameters,
    bool? available,
    String? category1,
    dynamic? cost,
    dynamic? image,
    int? position,
    String? $__typename,
  });
  CopyWith$Query$get_rental_by_category$business_rental$service$name<TRes>
      get name;
  CopyWith$Query$get_rental_by_category$business_rental$service$description<
      TRes> get description;
}

class _CopyWithImpl$Query$get_rental_by_category$business_rental$service<TRes>
    implements
        CopyWith$Query$get_rental_by_category$business_rental$service<TRes> {
  _CopyWithImpl$Query$get_rental_by_category$business_rental$service(
    this._instance,
    this._then,
  );

  final Query$get_rental_by_category$business_rental$service _instance;

  final TRes Function(Query$get_rental_by_category$business_rental$service)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? additional_parameters = _undefined,
    Object? available = _undefined,
    Object? category1 = _undefined,
    Object? cost = _undefined,
    Object? image = _undefined,
    Object? position = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_rental_by_category$business_rental$service(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Query$get_rental_by_category$business_rental$service$name),
        description: description == _undefined
            ? _instance.description
            : (description
                as Query$get_rental_by_category$business_rental$service$description?),
        additional_parameters: additional_parameters == _undefined
            ? _instance.additional_parameters
            : (additional_parameters as dynamic?),
        available: available == _undefined || available == null
            ? _instance.available
            : (available as bool),
        category1: category1 == _undefined || category1 == null
            ? _instance.category1
            : (category1 as String),
        cost: cost == _undefined || cost == null
            ? _instance.cost
            : (cost as dynamic),
        image: image == _undefined ? _instance.image : (image as dynamic?),
        position: position == _undefined || position == null
            ? _instance.position
            : (position as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_rental_by_category$business_rental$service$name<TRes>
      get name {
    final local$name = _instance.name;
    return CopyWith$Query$get_rental_by_category$business_rental$service$name(
        local$name, (e) => call(name: e));
  }

  CopyWith$Query$get_rental_by_category$business_rental$service$description<
      TRes> get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Query$get_rental_by_category$business_rental$service$description
            .stub(_then(_instance))
        : CopyWith$Query$get_rental_by_category$business_rental$service$description(
            local$description, (e) => call(description: e));
  }
}

class _CopyWithStubImpl$Query$get_rental_by_category$business_rental$service<
        TRes>
    implements
        CopyWith$Query$get_rental_by_category$business_rental$service<TRes> {
  _CopyWithStubImpl$Query$get_rental_by_category$business_rental$service(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$get_rental_by_category$business_rental$service$name? name,
    Query$get_rental_by_category$business_rental$service$description?
        description,
    dynamic? additional_parameters,
    bool? available,
    String? category1,
    dynamic? cost,
    dynamic? image,
    int? position,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_rental_by_category$business_rental$service$name<TRes>
      get name =>
          CopyWith$Query$get_rental_by_category$business_rental$service$name
              .stub(_res);
  CopyWith$Query$get_rental_by_category$business_rental$service$description<
          TRes>
      get description =>
          CopyWith$Query$get_rental_by_category$business_rental$service$description
              .stub(_res);
}

class Query$get_rental_by_category$business_rental$service$name {
  Query$get_rental_by_category$business_rental$service$name({
    required this.translations,
    required this.$__typename,
  });

  factory Query$get_rental_by_category$business_rental$service$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$get_rental_by_category$business_rental$service$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$get_rental_by_category$business_rental$service$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$get_rental_by_category$business_rental$service$name$translations>
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
    if (!(other is Query$get_rental_by_category$business_rental$service$name) ||
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

extension UtilityExtension$Query$get_rental_by_category$business_rental$service$name
    on Query$get_rental_by_category$business_rental$service$name {
  CopyWith$Query$get_rental_by_category$business_rental$service$name<
          Query$get_rental_by_category$business_rental$service$name>
      get copyWith =>
          CopyWith$Query$get_rental_by_category$business_rental$service$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_rental_by_category$business_rental$service$name<
    TRes> {
  factory CopyWith$Query$get_rental_by_category$business_rental$service$name(
    Query$get_rental_by_category$business_rental$service$name instance,
    TRes Function(Query$get_rental_by_category$business_rental$service$name)
        then,
  ) = _CopyWithImpl$Query$get_rental_by_category$business_rental$service$name;

  factory CopyWith$Query$get_rental_by_category$business_rental$service$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_rental_by_category$business_rental$service$name;

  TRes call({
    List<Query$get_rental_by_category$business_rental$service$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$get_rental_by_category$business_rental$service$name$translations> Function(
              Iterable<
                  CopyWith$Query$get_rental_by_category$business_rental$service$name$translations<
                      Query$get_rental_by_category$business_rental$service$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$get_rental_by_category$business_rental$service$name<
        TRes>
    implements
        CopyWith$Query$get_rental_by_category$business_rental$service$name<
            TRes> {
  _CopyWithImpl$Query$get_rental_by_category$business_rental$service$name(
    this._instance,
    this._then,
  );

  final Query$get_rental_by_category$business_rental$service$name _instance;

  final TRes Function(Query$get_rental_by_category$business_rental$service$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_rental_by_category$business_rental$service$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$get_rental_by_category$business_rental$service$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$get_rental_by_category$business_rental$service$name$translations> Function(
                  Iterable<
                      CopyWith$Query$get_rental_by_category$business_rental$service$name$translations<
                          Query$get_rental_by_category$business_rental$service$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$get_rental_by_category$business_rental$service$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_rental_by_category$business_rental$service$name<
        TRes>
    implements
        CopyWith$Query$get_rental_by_category$business_rental$service$name<
            TRes> {
  _CopyWithStubImpl$Query$get_rental_by_category$business_rental$service$name(
      this._res);

  TRes _res;

  call({
    List<Query$get_rental_by_category$business_rental$service$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$get_rental_by_category$business_rental$service$name$translations {
  Query$get_rental_by_category$business_rental$service$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$get_rental_by_category$business_rental$service$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$get_rental_by_category$business_rental$service$name$translations(
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
            is Query$get_rental_by_category$business_rental$service$name$translations) ||
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

extension UtilityExtension$Query$get_rental_by_category$business_rental$service$name$translations
    on Query$get_rental_by_category$business_rental$service$name$translations {
  CopyWith$Query$get_rental_by_category$business_rental$service$name$translations<
          Query$get_rental_by_category$business_rental$service$name$translations>
      get copyWith =>
          CopyWith$Query$get_rental_by_category$business_rental$service$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_rental_by_category$business_rental$service$name$translations<
    TRes> {
  factory CopyWith$Query$get_rental_by_category$business_rental$service$name$translations(
    Query$get_rental_by_category$business_rental$service$name$translations
        instance,
    TRes Function(
            Query$get_rental_by_category$business_rental$service$name$translations)
        then,
  ) = _CopyWithImpl$Query$get_rental_by_category$business_rental$service$name$translations;

  factory CopyWith$Query$get_rental_by_category$business_rental$service$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_rental_by_category$business_rental$service$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_rental_by_category$business_rental$service$name$translations<
        TRes>
    implements
        CopyWith$Query$get_rental_by_category$business_rental$service$name$translations<
            TRes> {
  _CopyWithImpl$Query$get_rental_by_category$business_rental$service$name$translations(
    this._instance,
    this._then,
  );

  final Query$get_rental_by_category$business_rental$service$name$translations
      _instance;

  final TRes Function(
          Query$get_rental_by_category$business_rental$service$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_rental_by_category$business_rental$service$name$translations(
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

class _CopyWithStubImpl$Query$get_rental_by_category$business_rental$service$name$translations<
        TRes>
    implements
        CopyWith$Query$get_rental_by_category$business_rental$service$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$get_rental_by_category$business_rental$service$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_rental_by_category$business_rental$service$description {
  Query$get_rental_by_category$business_rental$service$description({
    required this.translations,
    required this.$__typename,
  });

  factory Query$get_rental_by_category$business_rental$service$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$get_rental_by_category$business_rental$service$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$get_rental_by_category$business_rental$service$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$get_rental_by_category$business_rental$service$description$translations>
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
            is Query$get_rental_by_category$business_rental$service$description) ||
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

extension UtilityExtension$Query$get_rental_by_category$business_rental$service$description
    on Query$get_rental_by_category$business_rental$service$description {
  CopyWith$Query$get_rental_by_category$business_rental$service$description<
          Query$get_rental_by_category$business_rental$service$description>
      get copyWith =>
          CopyWith$Query$get_rental_by_category$business_rental$service$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_rental_by_category$business_rental$service$description<
    TRes> {
  factory CopyWith$Query$get_rental_by_category$business_rental$service$description(
    Query$get_rental_by_category$business_rental$service$description instance,
    TRes Function(
            Query$get_rental_by_category$business_rental$service$description)
        then,
  ) = _CopyWithImpl$Query$get_rental_by_category$business_rental$service$description;

  factory CopyWith$Query$get_rental_by_category$business_rental$service$description.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_rental_by_category$business_rental$service$description;

  TRes call({
    List<Query$get_rental_by_category$business_rental$service$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$get_rental_by_category$business_rental$service$description$translations> Function(
              Iterable<
                  CopyWith$Query$get_rental_by_category$business_rental$service$description$translations<
                      Query$get_rental_by_category$business_rental$service$description$translations>>)
          _fn);
}

class _CopyWithImpl$Query$get_rental_by_category$business_rental$service$description<
        TRes>
    implements
        CopyWith$Query$get_rental_by_category$business_rental$service$description<
            TRes> {
  _CopyWithImpl$Query$get_rental_by_category$business_rental$service$description(
    this._instance,
    this._then,
  );

  final Query$get_rental_by_category$business_rental$service$description
      _instance;

  final TRes Function(
      Query$get_rental_by_category$business_rental$service$description) _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_rental_by_category$business_rental$service$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$get_rental_by_category$business_rental$service$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$get_rental_by_category$business_rental$service$description$translations> Function(
                  Iterable<
                      CopyWith$Query$get_rental_by_category$business_rental$service$description$translations<
                          Query$get_rental_by_category$business_rental$service$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$get_rental_by_category$business_rental$service$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_rental_by_category$business_rental$service$description<
        TRes>
    implements
        CopyWith$Query$get_rental_by_category$business_rental$service$description<
            TRes> {
  _CopyWithStubImpl$Query$get_rental_by_category$business_rental$service$description(
      this._res);

  TRes _res;

  call({
    List<Query$get_rental_by_category$business_rental$service$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$get_rental_by_category$business_rental$service$description$translations {
  Query$get_rental_by_category$business_rental$service$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$get_rental_by_category$business_rental$service$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$get_rental_by_category$business_rental$service$description$translations(
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
            is Query$get_rental_by_category$business_rental$service$description$translations) ||
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

extension UtilityExtension$Query$get_rental_by_category$business_rental$service$description$translations
    on Query$get_rental_by_category$business_rental$service$description$translations {
  CopyWith$Query$get_rental_by_category$business_rental$service$description$translations<
          Query$get_rental_by_category$business_rental$service$description$translations>
      get copyWith =>
          CopyWith$Query$get_rental_by_category$business_rental$service$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_rental_by_category$business_rental$service$description$translations<
    TRes> {
  factory CopyWith$Query$get_rental_by_category$business_rental$service$description$translations(
    Query$get_rental_by_category$business_rental$service$description$translations
        instance,
    TRes Function(
            Query$get_rental_by_category$business_rental$service$description$translations)
        then,
  ) = _CopyWithImpl$Query$get_rental_by_category$business_rental$service$description$translations;

  factory CopyWith$Query$get_rental_by_category$business_rental$service$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_rental_by_category$business_rental$service$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_rental_by_category$business_rental$service$description$translations<
        TRes>
    implements
        CopyWith$Query$get_rental_by_category$business_rental$service$description$translations<
            TRes> {
  _CopyWithImpl$Query$get_rental_by_category$business_rental$service$description$translations(
    this._instance,
    this._then,
  );

  final Query$get_rental_by_category$business_rental$service$description$translations
      _instance;

  final TRes Function(
          Query$get_rental_by_category$business_rental$service$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_rental_by_category$business_rental$service$description$translations(
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

class _CopyWithStubImpl$Query$get_rental_by_category$business_rental$service$description$translations<
        TRes>
    implements
        CopyWith$Query$get_rental_by_category$business_rental$service$description$translations<
            TRes> {
  _CopyWithStubImpl$Query$get_rental_by_category$business_rental$service$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_rental_by_category$business_rental$business {
  Query$get_rental_by_category$business_rental$business({
    required this.details,
    required this.$__typename,
  });

  factory Query$get_rental_by_category$business_rental$business.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$get_rental_by_category$business_rental$business(
      details: Query$get_rental_by_category$business_rental$business$details
          .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_rental_by_category$business_rental$business$details details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$details = details;
    _resultData['details'] = l$details.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$details = details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$details,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_rental_by_category$business_rental$business) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$details = details;
    final lOther$details = other.details;
    if (l$details != lOther$details) {
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

extension UtilityExtension$Query$get_rental_by_category$business_rental$business
    on Query$get_rental_by_category$business_rental$business {
  CopyWith$Query$get_rental_by_category$business_rental$business<
          Query$get_rental_by_category$business_rental$business>
      get copyWith =>
          CopyWith$Query$get_rental_by_category$business_rental$business(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_rental_by_category$business_rental$business<
    TRes> {
  factory CopyWith$Query$get_rental_by_category$business_rental$business(
    Query$get_rental_by_category$business_rental$business instance,
    TRes Function(Query$get_rental_by_category$business_rental$business) then,
  ) = _CopyWithImpl$Query$get_rental_by_category$business_rental$business;

  factory CopyWith$Query$get_rental_by_category$business_rental$business.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_rental_by_category$business_rental$business;

  TRes call({
    Query$get_rental_by_category$business_rental$business$details? details,
    String? $__typename,
  });
  CopyWith$Query$get_rental_by_category$business_rental$business$details<TRes>
      get details;
}

class _CopyWithImpl$Query$get_rental_by_category$business_rental$business<TRes>
    implements
        CopyWith$Query$get_rental_by_category$business_rental$business<TRes> {
  _CopyWithImpl$Query$get_rental_by_category$business_rental$business(
    this._instance,
    this._then,
  );

  final Query$get_rental_by_category$business_rental$business _instance;

  final TRes Function(Query$get_rental_by_category$business_rental$business)
      _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_rental_by_category$business_rental$business(
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Query$get_rental_by_category$business_rental$business$details),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_rental_by_category$business_rental$business$details<TRes>
      get details {
    final local$details = _instance.details;
    return CopyWith$Query$get_rental_by_category$business_rental$business$details(
        local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$get_rental_by_category$business_rental$business<
        TRes>
    implements
        CopyWith$Query$get_rental_by_category$business_rental$business<TRes> {
  _CopyWithStubImpl$Query$get_rental_by_category$business_rental$business(
      this._res);

  TRes _res;

  call({
    Query$get_rental_by_category$business_rental$business$details? details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_rental_by_category$business_rental$business$details<TRes>
      get details =>
          CopyWith$Query$get_rental_by_category$business_rental$business$details
              .stub(_res);
}

class Query$get_rental_by_category$business_rental$business$details {
  Query$get_rental_by_category$business_rental$business$details({
    required this.name,
    required this.$__typename,
  });

  factory Query$get_rental_by_category$business_rental$business$details.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$get_rental_by_category$business_rental$business$details(
      name: (l$name as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
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
            is Query$get_rental_by_category$business_rental$business$details) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$get_rental_by_category$business_rental$business$details
    on Query$get_rental_by_category$business_rental$business$details {
  CopyWith$Query$get_rental_by_category$business_rental$business$details<
          Query$get_rental_by_category$business_rental$business$details>
      get copyWith =>
          CopyWith$Query$get_rental_by_category$business_rental$business$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_rental_by_category$business_rental$business$details<
    TRes> {
  factory CopyWith$Query$get_rental_by_category$business_rental$business$details(
    Query$get_rental_by_category$business_rental$business$details instance,
    TRes Function(Query$get_rental_by_category$business_rental$business$details)
        then,
  ) = _CopyWithImpl$Query$get_rental_by_category$business_rental$business$details;

  factory CopyWith$Query$get_rental_by_category$business_rental$business$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_rental_by_category$business_rental$business$details;

  TRes call({
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_rental_by_category$business_rental$business$details<
        TRes>
    implements
        CopyWith$Query$get_rental_by_category$business_rental$business$details<
            TRes> {
  _CopyWithImpl$Query$get_rental_by_category$business_rental$business$details(
    this._instance,
    this._then,
  );

  final Query$get_rental_by_category$business_rental$business$details _instance;

  final TRes Function(
      Query$get_rental_by_category$business_rental$business$details) _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_rental_by_category$business_rental$business$details(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_rental_by_category$business_rental$business$details<
        TRes>
    implements
        CopyWith$Query$get_rental_by_category$business_rental$business$details<
            TRes> {
  _CopyWithStubImpl$Query$get_rental_by_category$business_rental$business$details(
      this._res);

  TRes _res;

  call({
    String? name,
    String? $__typename,
  }) =>
      _res;
}
