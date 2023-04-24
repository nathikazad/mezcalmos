import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Variables$Query$number_of_food_by_category {
  factory Variables$Query$number_of_food_by_category({
    required double distance,
    required Geography from,
  }) =>
      Variables$Query$number_of_food_by_category._({
        r'distance': distance,
        r'from': from,
      });

  Variables$Query$number_of_food_by_category._(this._$data);

  factory Variables$Query$number_of_food_by_category.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$distance = data['distance'];
    result$data['distance'] = (l$distance as num).toDouble();
    final l$from = data['from'];
    result$data['from'] = geographyFromJson(l$from);
    return Variables$Query$number_of_food_by_category._(result$data);
  }

  Map<String, dynamic> _$data;

  double get distance => (_$data['distance'] as double);
  Geography get from => (_$data['from'] as Geography);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$distance = distance;
    result$data['distance'] = l$distance;
    final l$from = from;
    result$data['from'] = geographyToJson(l$from);
    return result$data;
  }

  CopyWith$Variables$Query$number_of_food_by_category<
          Variables$Query$number_of_food_by_category>
      get copyWith => CopyWith$Variables$Query$number_of_food_by_category(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$number_of_food_by_category) ||
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
    return true;
  }

  @override
  int get hashCode {
    final l$distance = distance;
    final l$from = from;
    return Object.hashAll([
      l$distance,
      l$from,
    ]);
  }
}

abstract class CopyWith$Variables$Query$number_of_food_by_category<TRes> {
  factory CopyWith$Variables$Query$number_of_food_by_category(
    Variables$Query$number_of_food_by_category instance,
    TRes Function(Variables$Query$number_of_food_by_category) then,
  ) = _CopyWithImpl$Variables$Query$number_of_food_by_category;

  factory CopyWith$Variables$Query$number_of_food_by_category.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$number_of_food_by_category;

  TRes call({
    double? distance,
    Geography? from,
  });
}

class _CopyWithImpl$Variables$Query$number_of_food_by_category<TRes>
    implements CopyWith$Variables$Query$number_of_food_by_category<TRes> {
  _CopyWithImpl$Variables$Query$number_of_food_by_category(
    this._instance,
    this._then,
  );

  final Variables$Query$number_of_food_by_category _instance;

  final TRes Function(Variables$Query$number_of_food_by_category) _then;

  static const _undefined = {};

  TRes call({
    Object? distance = _undefined,
    Object? from = _undefined,
  }) =>
      _then(Variables$Query$number_of_food_by_category._({
        ..._instance._$data,
        if (distance != _undefined && distance != null)
          'distance': (distance as double),
        if (from != _undefined && from != null) 'from': (from as Geography),
      }));
}

class _CopyWithStubImpl$Variables$Query$number_of_food_by_category<TRes>
    implements CopyWith$Variables$Query$number_of_food_by_category<TRes> {
  _CopyWithStubImpl$Variables$Query$number_of_food_by_category(this._res);

  TRes _res;

  call({
    double? distance,
    Geography? from,
  }) =>
      _res;
}

class Query$number_of_food_by_category {
  Query$number_of_food_by_category({
    required this.restaurant_restaurant_aggregate,
    required this.business_product_aggregate,
    required this.business_service_aggregate,
    required this.$__typename,
  });

  factory Query$number_of_food_by_category.fromJson(Map<String, dynamic> json) {
    final l$restaurant_restaurant_aggregate =
        json['restaurant_restaurant_aggregate'];
    final l$business_product_aggregate = json['business_product_aggregate'];
    final l$business_service_aggregate = json['business_service_aggregate'];
    final l$$__typename = json['__typename'];
    return Query$number_of_food_by_category(
      restaurant_restaurant_aggregate:
          Query$number_of_food_by_category$restaurant_restaurant_aggregate
              .fromJson(
                  (l$restaurant_restaurant_aggregate as Map<String, dynamic>)),
      business_product_aggregate:
          Query$number_of_food_by_category$business_product_aggregate.fromJson(
              (l$business_product_aggregate as Map<String, dynamic>)),
      business_service_aggregate:
          Query$number_of_food_by_category$business_service_aggregate.fromJson(
              (l$business_service_aggregate as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$number_of_food_by_category$restaurant_restaurant_aggregate
      restaurant_restaurant_aggregate;

  final Query$number_of_food_by_category$business_product_aggregate
      business_product_aggregate;

  final Query$number_of_food_by_category$business_service_aggregate
      business_service_aggregate;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_restaurant_aggregate = restaurant_restaurant_aggregate;
    _resultData['restaurant_restaurant_aggregate'] =
        l$restaurant_restaurant_aggregate.toJson();
    final l$business_product_aggregate = business_product_aggregate;
    _resultData['business_product_aggregate'] =
        l$business_product_aggregate.toJson();
    final l$business_service_aggregate = business_service_aggregate;
    _resultData['business_service_aggregate'] =
        l$business_service_aggregate.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_restaurant_aggregate = restaurant_restaurant_aggregate;
    final l$business_product_aggregate = business_product_aggregate;
    final l$business_service_aggregate = business_service_aggregate;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$restaurant_restaurant_aggregate,
      l$business_product_aggregate,
      l$business_service_aggregate,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$number_of_food_by_category) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_restaurant_aggregate = restaurant_restaurant_aggregate;
    final lOther$restaurant_restaurant_aggregate =
        other.restaurant_restaurant_aggregate;
    if (l$restaurant_restaurant_aggregate !=
        lOther$restaurant_restaurant_aggregate) {
      return false;
    }
    final l$business_product_aggregate = business_product_aggregate;
    final lOther$business_product_aggregate = other.business_product_aggregate;
    if (l$business_product_aggregate != lOther$business_product_aggregate) {
      return false;
    }
    final l$business_service_aggregate = business_service_aggregate;
    final lOther$business_service_aggregate = other.business_service_aggregate;
    if (l$business_service_aggregate != lOther$business_service_aggregate) {
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

extension UtilityExtension$Query$number_of_food_by_category
    on Query$number_of_food_by_category {
  CopyWith$Query$number_of_food_by_category<Query$number_of_food_by_category>
      get copyWith => CopyWith$Query$number_of_food_by_category(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$number_of_food_by_category<TRes> {
  factory CopyWith$Query$number_of_food_by_category(
    Query$number_of_food_by_category instance,
    TRes Function(Query$number_of_food_by_category) then,
  ) = _CopyWithImpl$Query$number_of_food_by_category;

  factory CopyWith$Query$number_of_food_by_category.stub(TRes res) =
      _CopyWithStubImpl$Query$number_of_food_by_category;

  TRes call({
    Query$number_of_food_by_category$restaurant_restaurant_aggregate?
        restaurant_restaurant_aggregate,
    Query$number_of_food_by_category$business_product_aggregate?
        business_product_aggregate,
    Query$number_of_food_by_category$business_service_aggregate?
        business_service_aggregate,
    String? $__typename,
  });
  CopyWith$Query$number_of_food_by_category$restaurant_restaurant_aggregate<
      TRes> get restaurant_restaurant_aggregate;
  CopyWith$Query$number_of_food_by_category$business_product_aggregate<TRes>
      get business_product_aggregate;
  CopyWith$Query$number_of_food_by_category$business_service_aggregate<TRes>
      get business_service_aggregate;
}

class _CopyWithImpl$Query$number_of_food_by_category<TRes>
    implements CopyWith$Query$number_of_food_by_category<TRes> {
  _CopyWithImpl$Query$number_of_food_by_category(
    this._instance,
    this._then,
  );

  final Query$number_of_food_by_category _instance;

  final TRes Function(Query$number_of_food_by_category) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_restaurant_aggregate = _undefined,
    Object? business_product_aggregate = _undefined,
    Object? business_service_aggregate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$number_of_food_by_category(
        restaurant_restaurant_aggregate: restaurant_restaurant_aggregate ==
                    _undefined ||
                restaurant_restaurant_aggregate == null
            ? _instance.restaurant_restaurant_aggregate
            : (restaurant_restaurant_aggregate
                as Query$number_of_food_by_category$restaurant_restaurant_aggregate),
        business_product_aggregate: business_product_aggregate == _undefined ||
                business_product_aggregate == null
            ? _instance.business_product_aggregate
            : (business_product_aggregate
                as Query$number_of_food_by_category$business_product_aggregate),
        business_service_aggregate: business_service_aggregate == _undefined ||
                business_service_aggregate == null
            ? _instance.business_service_aggregate
            : (business_service_aggregate
                as Query$number_of_food_by_category$business_service_aggregate),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$number_of_food_by_category$restaurant_restaurant_aggregate<
      TRes> get restaurant_restaurant_aggregate {
    final local$restaurant_restaurant_aggregate =
        _instance.restaurant_restaurant_aggregate;
    return CopyWith$Query$number_of_food_by_category$restaurant_restaurant_aggregate(
        local$restaurant_restaurant_aggregate,
        (e) => call(restaurant_restaurant_aggregate: e));
  }

  CopyWith$Query$number_of_food_by_category$business_product_aggregate<TRes>
      get business_product_aggregate {
    final local$business_product_aggregate =
        _instance.business_product_aggregate;
    return CopyWith$Query$number_of_food_by_category$business_product_aggregate(
        local$business_product_aggregate,
        (e) => call(business_product_aggregate: e));
  }

  CopyWith$Query$number_of_food_by_category$business_service_aggregate<TRes>
      get business_service_aggregate {
    final local$business_service_aggregate =
        _instance.business_service_aggregate;
    return CopyWith$Query$number_of_food_by_category$business_service_aggregate(
        local$business_service_aggregate,
        (e) => call(business_service_aggregate: e));
  }
}

class _CopyWithStubImpl$Query$number_of_food_by_category<TRes>
    implements CopyWith$Query$number_of_food_by_category<TRes> {
  _CopyWithStubImpl$Query$number_of_food_by_category(this._res);

  TRes _res;

  call({
    Query$number_of_food_by_category$restaurant_restaurant_aggregate?
        restaurant_restaurant_aggregate,
    Query$number_of_food_by_category$business_product_aggregate?
        business_product_aggregate,
    Query$number_of_food_by_category$business_service_aggregate?
        business_service_aggregate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$number_of_food_by_category$restaurant_restaurant_aggregate<
          TRes>
      get restaurant_restaurant_aggregate =>
          CopyWith$Query$number_of_food_by_category$restaurant_restaurant_aggregate
              .stub(_res);
  CopyWith$Query$number_of_food_by_category$business_product_aggregate<TRes>
      get business_product_aggregate =>
          CopyWith$Query$number_of_food_by_category$business_product_aggregate
              .stub(_res);
  CopyWith$Query$number_of_food_by_category$business_service_aggregate<TRes>
      get business_service_aggregate =>
          CopyWith$Query$number_of_food_by_category$business_service_aggregate
              .stub(_res);
}

const documentNodeQuerynumber_of_food_by_category = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'number_of_food_by_category'),
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
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'restaurant_restaurant_aggregate'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
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
                                value:
                                    VariableNode(name: NameNode(value: 'from')),
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
        name: NameNode(value: 'business_product_aggregate'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
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
              ObjectFieldNode(
                name: NameNode(value: 'details'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'category1'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                        name: NameNode(value: '_eq'),
                        value: StringValueNode(
                          value: 'consumable',
                          isBlock: false,
                        ),
                      )
                    ]),
                  )
                ]),
              ),
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
        name: NameNode(value: 'business_service_aggregate'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
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
              ObjectFieldNode(
                name: NameNode(value: 'details'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'category1'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                        name: NameNode(value: '_eq'),
                        value: StringValueNode(
                          value: 'mealPlanning',
                          isBlock: false,
                        ),
                      )
                    ]),
                  )
                ]),
              ),
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
      
    ]),
  ),
]);
Query$number_of_food_by_category _parserFn$Query$number_of_food_by_category(
        Map<String, dynamic> data) =>
    Query$number_of_food_by_category.fromJson(data);

class Options$Query$number_of_food_by_category
    extends graphql.QueryOptions<Query$number_of_food_by_category> {
  Options$Query$number_of_food_by_category({
    String? operationName,
    required Variables$Query$number_of_food_by_category variables,
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
          document: documentNodeQuerynumber_of_food_by_category,
          parserFn: _parserFn$Query$number_of_food_by_category,
        );
}

class WatchOptions$Query$number_of_food_by_category
    extends graphql.WatchQueryOptions<Query$number_of_food_by_category> {
  WatchOptions$Query$number_of_food_by_category({
    String? operationName,
    required Variables$Query$number_of_food_by_category variables,
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
          document: documentNodeQuerynumber_of_food_by_category,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$number_of_food_by_category,
        );
}

class FetchMoreOptions$Query$number_of_food_by_category
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$number_of_food_by_category({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$number_of_food_by_category variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerynumber_of_food_by_category,
        );
}

extension ClientExtension$Query$number_of_food_by_category
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$number_of_food_by_category>>
      query$number_of_food_by_category(
              Options$Query$number_of_food_by_category options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$number_of_food_by_category>
      watchQuery$number_of_food_by_category(
              WatchOptions$Query$number_of_food_by_category options) =>
          this.watchQuery(options);
  void writeQuery$number_of_food_by_category({
    required Query$number_of_food_by_category data,
    required Variables$Query$number_of_food_by_category variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerynumber_of_food_by_category),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$number_of_food_by_category? readQuery$number_of_food_by_category({
    required Variables$Query$number_of_food_by_category variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQuerynumber_of_food_by_category),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$number_of_food_by_category.fromJson(result);
  }
}

class Query$number_of_food_by_category$restaurant_restaurant_aggregate {
  Query$number_of_food_by_category$restaurant_restaurant_aggregate({
    this.aggregate,
    required this.$__typename,
  });

  factory Query$number_of_food_by_category$restaurant_restaurant_aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$aggregate = json['aggregate'];
    final l$$__typename = json['__typename'];
    return Query$number_of_food_by_category$restaurant_restaurant_aggregate(
      aggregate: l$aggregate == null
          ? null
          : Query$number_of_food_by_category$restaurant_restaurant_aggregate$aggregate
              .fromJson((l$aggregate as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$number_of_food_by_category$restaurant_restaurant_aggregate$aggregate?
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
            is Query$number_of_food_by_category$restaurant_restaurant_aggregate) ||
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

extension UtilityExtension$Query$number_of_food_by_category$restaurant_restaurant_aggregate
    on Query$number_of_food_by_category$restaurant_restaurant_aggregate {
  CopyWith$Query$number_of_food_by_category$restaurant_restaurant_aggregate<
          Query$number_of_food_by_category$restaurant_restaurant_aggregate>
      get copyWith =>
          CopyWith$Query$number_of_food_by_category$restaurant_restaurant_aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$number_of_food_by_category$restaurant_restaurant_aggregate<
    TRes> {
  factory CopyWith$Query$number_of_food_by_category$restaurant_restaurant_aggregate(
    Query$number_of_food_by_category$restaurant_restaurant_aggregate instance,
    TRes Function(
            Query$number_of_food_by_category$restaurant_restaurant_aggregate)
        then,
  ) = _CopyWithImpl$Query$number_of_food_by_category$restaurant_restaurant_aggregate;

  factory CopyWith$Query$number_of_food_by_category$restaurant_restaurant_aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$number_of_food_by_category$restaurant_restaurant_aggregate;

  TRes call({
    Query$number_of_food_by_category$restaurant_restaurant_aggregate$aggregate?
        aggregate,
    String? $__typename,
  });
  CopyWith$Query$number_of_food_by_category$restaurant_restaurant_aggregate$aggregate<
      TRes> get aggregate;
}

class _CopyWithImpl$Query$number_of_food_by_category$restaurant_restaurant_aggregate<
        TRes>
    implements
        CopyWith$Query$number_of_food_by_category$restaurant_restaurant_aggregate<
            TRes> {
  _CopyWithImpl$Query$number_of_food_by_category$restaurant_restaurant_aggregate(
    this._instance,
    this._then,
  );

  final Query$number_of_food_by_category$restaurant_restaurant_aggregate
      _instance;

  final TRes Function(
      Query$number_of_food_by_category$restaurant_restaurant_aggregate) _then;

  static const _undefined = {};

  TRes call({
    Object? aggregate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$number_of_food_by_category$restaurant_restaurant_aggregate(
        aggregate: aggregate == _undefined
            ? _instance.aggregate
            : (aggregate
                as Query$number_of_food_by_category$restaurant_restaurant_aggregate$aggregate?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$number_of_food_by_category$restaurant_restaurant_aggregate$aggregate<
      TRes> get aggregate {
    final local$aggregate = _instance.aggregate;
    return local$aggregate == null
        ? CopyWith$Query$number_of_food_by_category$restaurant_restaurant_aggregate$aggregate
            .stub(_then(_instance))
        : CopyWith$Query$number_of_food_by_category$restaurant_restaurant_aggregate$aggregate(
            local$aggregate, (e) => call(aggregate: e));
  }
}

class _CopyWithStubImpl$Query$number_of_food_by_category$restaurant_restaurant_aggregate<
        TRes>
    implements
        CopyWith$Query$number_of_food_by_category$restaurant_restaurant_aggregate<
            TRes> {
  _CopyWithStubImpl$Query$number_of_food_by_category$restaurant_restaurant_aggregate(
      this._res);

  TRes _res;

  call({
    Query$number_of_food_by_category$restaurant_restaurant_aggregate$aggregate?
        aggregate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$number_of_food_by_category$restaurant_restaurant_aggregate$aggregate<
          TRes>
      get aggregate =>
          CopyWith$Query$number_of_food_by_category$restaurant_restaurant_aggregate$aggregate
              .stub(_res);
}

class Query$number_of_food_by_category$restaurant_restaurant_aggregate$aggregate {
  Query$number_of_food_by_category$restaurant_restaurant_aggregate$aggregate({
    required this.count,
    required this.$__typename,
  });

  factory Query$number_of_food_by_category$restaurant_restaurant_aggregate$aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$count = json['count'];
    final l$$__typename = json['__typename'];
    return Query$number_of_food_by_category$restaurant_restaurant_aggregate$aggregate(
      count: (l$count as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int count;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$count = count;
    _resultData['count'] = l$count;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$count = count;
    final l$$__typename = $__typename;
    return Object.hashAll([
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
            is Query$number_of_food_by_category$restaurant_restaurant_aggregate$aggregate) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$number_of_food_by_category$restaurant_restaurant_aggregate$aggregate
    on Query$number_of_food_by_category$restaurant_restaurant_aggregate$aggregate {
  CopyWith$Query$number_of_food_by_category$restaurant_restaurant_aggregate$aggregate<
          Query$number_of_food_by_category$restaurant_restaurant_aggregate$aggregate>
      get copyWith =>
          CopyWith$Query$number_of_food_by_category$restaurant_restaurant_aggregate$aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$number_of_food_by_category$restaurant_restaurant_aggregate$aggregate<
    TRes> {
  factory CopyWith$Query$number_of_food_by_category$restaurant_restaurant_aggregate$aggregate(
    Query$number_of_food_by_category$restaurant_restaurant_aggregate$aggregate
        instance,
    TRes Function(
            Query$number_of_food_by_category$restaurant_restaurant_aggregate$aggregate)
        then,
  ) = _CopyWithImpl$Query$number_of_food_by_category$restaurant_restaurant_aggregate$aggregate;

  factory CopyWith$Query$number_of_food_by_category$restaurant_restaurant_aggregate$aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$number_of_food_by_category$restaurant_restaurant_aggregate$aggregate;

  TRes call({
    int? count,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$number_of_food_by_category$restaurant_restaurant_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$number_of_food_by_category$restaurant_restaurant_aggregate$aggregate<
            TRes> {
  _CopyWithImpl$Query$number_of_food_by_category$restaurant_restaurant_aggregate$aggregate(
    this._instance,
    this._then,
  );

  final Query$number_of_food_by_category$restaurant_restaurant_aggregate$aggregate
      _instance;

  final TRes Function(
          Query$number_of_food_by_category$restaurant_restaurant_aggregate$aggregate)
      _then;

  static const _undefined = {};

  TRes call({
    Object? count = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$number_of_food_by_category$restaurant_restaurant_aggregate$aggregate(
        count: count == _undefined || count == null
            ? _instance.count
            : (count as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$number_of_food_by_category$restaurant_restaurant_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$number_of_food_by_category$restaurant_restaurant_aggregate$aggregate<
            TRes> {
  _CopyWithStubImpl$Query$number_of_food_by_category$restaurant_restaurant_aggregate$aggregate(
      this._res);

  TRes _res;

  call({
    int? count,
    String? $__typename,
  }) =>
      _res;
}

class Query$number_of_food_by_category$business_product_aggregate {
  Query$number_of_food_by_category$business_product_aggregate({
    this.aggregate,
    required this.$__typename,
  });

  factory Query$number_of_food_by_category$business_product_aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$aggregate = json['aggregate'];
    final l$$__typename = json['__typename'];
    return Query$number_of_food_by_category$business_product_aggregate(
      aggregate: l$aggregate == null
          ? null
          : Query$number_of_food_by_category$business_product_aggregate$aggregate
              .fromJson((l$aggregate as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$number_of_food_by_category$business_product_aggregate$aggregate?
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
            is Query$number_of_food_by_category$business_product_aggregate) ||
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

extension UtilityExtension$Query$number_of_food_by_category$business_product_aggregate
    on Query$number_of_food_by_category$business_product_aggregate {
  CopyWith$Query$number_of_food_by_category$business_product_aggregate<
          Query$number_of_food_by_category$business_product_aggregate>
      get copyWith =>
          CopyWith$Query$number_of_food_by_category$business_product_aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$number_of_food_by_category$business_product_aggregate<
    TRes> {
  factory CopyWith$Query$number_of_food_by_category$business_product_aggregate(
    Query$number_of_food_by_category$business_product_aggregate instance,
    TRes Function(Query$number_of_food_by_category$business_product_aggregate)
        then,
  ) = _CopyWithImpl$Query$number_of_food_by_category$business_product_aggregate;

  factory CopyWith$Query$number_of_food_by_category$business_product_aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$number_of_food_by_category$business_product_aggregate;

  TRes call({
    Query$number_of_food_by_category$business_product_aggregate$aggregate?
        aggregate,
    String? $__typename,
  });
  CopyWith$Query$number_of_food_by_category$business_product_aggregate$aggregate<
      TRes> get aggregate;
}

class _CopyWithImpl$Query$number_of_food_by_category$business_product_aggregate<
        TRes>
    implements
        CopyWith$Query$number_of_food_by_category$business_product_aggregate<
            TRes> {
  _CopyWithImpl$Query$number_of_food_by_category$business_product_aggregate(
    this._instance,
    this._then,
  );

  final Query$number_of_food_by_category$business_product_aggregate _instance;

  final TRes Function(
      Query$number_of_food_by_category$business_product_aggregate) _then;

  static const _undefined = {};

  TRes call({
    Object? aggregate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$number_of_food_by_category$business_product_aggregate(
        aggregate: aggregate == _undefined
            ? _instance.aggregate
            : (aggregate
                as Query$number_of_food_by_category$business_product_aggregate$aggregate?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$number_of_food_by_category$business_product_aggregate$aggregate<
      TRes> get aggregate {
    final local$aggregate = _instance.aggregate;
    return local$aggregate == null
        ? CopyWith$Query$number_of_food_by_category$business_product_aggregate$aggregate
            .stub(_then(_instance))
        : CopyWith$Query$number_of_food_by_category$business_product_aggregate$aggregate(
            local$aggregate, (e) => call(aggregate: e));
  }
}

class _CopyWithStubImpl$Query$number_of_food_by_category$business_product_aggregate<
        TRes>
    implements
        CopyWith$Query$number_of_food_by_category$business_product_aggregate<
            TRes> {
  _CopyWithStubImpl$Query$number_of_food_by_category$business_product_aggregate(
      this._res);

  TRes _res;

  call({
    Query$number_of_food_by_category$business_product_aggregate$aggregate?
        aggregate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$number_of_food_by_category$business_product_aggregate$aggregate<
          TRes>
      get aggregate =>
          CopyWith$Query$number_of_food_by_category$business_product_aggregate$aggregate
              .stub(_res);
}

class Query$number_of_food_by_category$business_product_aggregate$aggregate {
  Query$number_of_food_by_category$business_product_aggregate$aggregate({
    required this.count,
    required this.$__typename,
  });

  factory Query$number_of_food_by_category$business_product_aggregate$aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$count = json['count'];
    final l$$__typename = json['__typename'];
    return Query$number_of_food_by_category$business_product_aggregate$aggregate(
      count: (l$count as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int count;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$count = count;
    _resultData['count'] = l$count;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$count = count;
    final l$$__typename = $__typename;
    return Object.hashAll([
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
            is Query$number_of_food_by_category$business_product_aggregate$aggregate) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$number_of_food_by_category$business_product_aggregate$aggregate
    on Query$number_of_food_by_category$business_product_aggregate$aggregate {
  CopyWith$Query$number_of_food_by_category$business_product_aggregate$aggregate<
          Query$number_of_food_by_category$business_product_aggregate$aggregate>
      get copyWith =>
          CopyWith$Query$number_of_food_by_category$business_product_aggregate$aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$number_of_food_by_category$business_product_aggregate$aggregate<
    TRes> {
  factory CopyWith$Query$number_of_food_by_category$business_product_aggregate$aggregate(
    Query$number_of_food_by_category$business_product_aggregate$aggregate
        instance,
    TRes Function(
            Query$number_of_food_by_category$business_product_aggregate$aggregate)
        then,
  ) = _CopyWithImpl$Query$number_of_food_by_category$business_product_aggregate$aggregate;

  factory CopyWith$Query$number_of_food_by_category$business_product_aggregate$aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$number_of_food_by_category$business_product_aggregate$aggregate;

  TRes call({
    int? count,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$number_of_food_by_category$business_product_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$number_of_food_by_category$business_product_aggregate$aggregate<
            TRes> {
  _CopyWithImpl$Query$number_of_food_by_category$business_product_aggregate$aggregate(
    this._instance,
    this._then,
  );

  final Query$number_of_food_by_category$business_product_aggregate$aggregate
      _instance;

  final TRes Function(
          Query$number_of_food_by_category$business_product_aggregate$aggregate)
      _then;

  static const _undefined = {};

  TRes call({
    Object? count = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$number_of_food_by_category$business_product_aggregate$aggregate(
        count: count == _undefined || count == null
            ? _instance.count
            : (count as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$number_of_food_by_category$business_product_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$number_of_food_by_category$business_product_aggregate$aggregate<
            TRes> {
  _CopyWithStubImpl$Query$number_of_food_by_category$business_product_aggregate$aggregate(
      this._res);

  TRes _res;

  call({
    int? count,
    String? $__typename,
  }) =>
      _res;
}

class Query$number_of_food_by_category$business_service_aggregate {
  Query$number_of_food_by_category$business_service_aggregate({
    this.aggregate,
    required this.$__typename,
  });

  factory Query$number_of_food_by_category$business_service_aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$aggregate = json['aggregate'];
    final l$$__typename = json['__typename'];
    return Query$number_of_food_by_category$business_service_aggregate(
      aggregate: l$aggregate == null
          ? null
          : Query$number_of_food_by_category$business_service_aggregate$aggregate
              .fromJson((l$aggregate as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$number_of_food_by_category$business_service_aggregate$aggregate?
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
            is Query$number_of_food_by_category$business_service_aggregate) ||
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

extension UtilityExtension$Query$number_of_food_by_category$business_service_aggregate
    on Query$number_of_food_by_category$business_service_aggregate {
  CopyWith$Query$number_of_food_by_category$business_service_aggregate<
          Query$number_of_food_by_category$business_service_aggregate>
      get copyWith =>
          CopyWith$Query$number_of_food_by_category$business_service_aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$number_of_food_by_category$business_service_aggregate<
    TRes> {
  factory CopyWith$Query$number_of_food_by_category$business_service_aggregate(
    Query$number_of_food_by_category$business_service_aggregate instance,
    TRes Function(Query$number_of_food_by_category$business_service_aggregate)
        then,
  ) = _CopyWithImpl$Query$number_of_food_by_category$business_service_aggregate;

  factory CopyWith$Query$number_of_food_by_category$business_service_aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$number_of_food_by_category$business_service_aggregate;

  TRes call({
    Query$number_of_food_by_category$business_service_aggregate$aggregate?
        aggregate,
    String? $__typename,
  });
  CopyWith$Query$number_of_food_by_category$business_service_aggregate$aggregate<
      TRes> get aggregate;
}

class _CopyWithImpl$Query$number_of_food_by_category$business_service_aggregate<
        TRes>
    implements
        CopyWith$Query$number_of_food_by_category$business_service_aggregate<
            TRes> {
  _CopyWithImpl$Query$number_of_food_by_category$business_service_aggregate(
    this._instance,
    this._then,
  );

  final Query$number_of_food_by_category$business_service_aggregate _instance;

  final TRes Function(
      Query$number_of_food_by_category$business_service_aggregate) _then;

  static const _undefined = {};

  TRes call({
    Object? aggregate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$number_of_food_by_category$business_service_aggregate(
        aggregate: aggregate == _undefined
            ? _instance.aggregate
            : (aggregate
                as Query$number_of_food_by_category$business_service_aggregate$aggregate?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$number_of_food_by_category$business_service_aggregate$aggregate<
      TRes> get aggregate {
    final local$aggregate = _instance.aggregate;
    return local$aggregate == null
        ? CopyWith$Query$number_of_food_by_category$business_service_aggregate$aggregate
            .stub(_then(_instance))
        : CopyWith$Query$number_of_food_by_category$business_service_aggregate$aggregate(
            local$aggregate, (e) => call(aggregate: e));
  }
}

class _CopyWithStubImpl$Query$number_of_food_by_category$business_service_aggregate<
        TRes>
    implements
        CopyWith$Query$number_of_food_by_category$business_service_aggregate<
            TRes> {
  _CopyWithStubImpl$Query$number_of_food_by_category$business_service_aggregate(
      this._res);

  TRes _res;

  call({
    Query$number_of_food_by_category$business_service_aggregate$aggregate?
        aggregate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$number_of_food_by_category$business_service_aggregate$aggregate<
          TRes>
      get aggregate =>
          CopyWith$Query$number_of_food_by_category$business_service_aggregate$aggregate
              .stub(_res);
}

class Query$number_of_food_by_category$business_service_aggregate$aggregate {
  Query$number_of_food_by_category$business_service_aggregate$aggregate({
    required this.count,
    required this.$__typename,
  });

  factory Query$number_of_food_by_category$business_service_aggregate$aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$count = json['count'];
    final l$$__typename = json['__typename'];
    return Query$number_of_food_by_category$business_service_aggregate$aggregate(
      count: (l$count as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int count;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$count = count;
    _resultData['count'] = l$count;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$count = count;
    final l$$__typename = $__typename;
    return Object.hashAll([
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
            is Query$number_of_food_by_category$business_service_aggregate$aggregate) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$number_of_food_by_category$business_service_aggregate$aggregate
    on Query$number_of_food_by_category$business_service_aggregate$aggregate {
  CopyWith$Query$number_of_food_by_category$business_service_aggregate$aggregate<
          Query$number_of_food_by_category$business_service_aggregate$aggregate>
      get copyWith =>
          CopyWith$Query$number_of_food_by_category$business_service_aggregate$aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$number_of_food_by_category$business_service_aggregate$aggregate<
    TRes> {
  factory CopyWith$Query$number_of_food_by_category$business_service_aggregate$aggregate(
    Query$number_of_food_by_category$business_service_aggregate$aggregate
        instance,
    TRes Function(
            Query$number_of_food_by_category$business_service_aggregate$aggregate)
        then,
  ) = _CopyWithImpl$Query$number_of_food_by_category$business_service_aggregate$aggregate;

  factory CopyWith$Query$number_of_food_by_category$business_service_aggregate$aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$number_of_food_by_category$business_service_aggregate$aggregate;

  TRes call({
    int? count,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$number_of_food_by_category$business_service_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$number_of_food_by_category$business_service_aggregate$aggregate<
            TRes> {
  _CopyWithImpl$Query$number_of_food_by_category$business_service_aggregate$aggregate(
    this._instance,
    this._then,
  );

  final Query$number_of_food_by_category$business_service_aggregate$aggregate
      _instance;

  final TRes Function(
          Query$number_of_food_by_category$business_service_aggregate$aggregate)
      _then;

  static const _undefined = {};

  TRes call({
    Object? count = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$number_of_food_by_category$business_service_aggregate$aggregate(
        count: count == _undefined || count == null
            ? _instance.count
            : (count as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$number_of_food_by_category$business_service_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$number_of_food_by_category$business_service_aggregate$aggregate<
            TRes> {
  _CopyWithStubImpl$Query$number_of_food_by_category$business_service_aggregate$aggregate(
      this._res);

  TRes _res;

  call({
    int? count,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$number_of_delivery {
  factory Variables$Query$number_of_delivery({
    required double distance,
    required Geography from,
  }) =>
      Variables$Query$number_of_delivery._({
        r'distance': distance,
        r'from': from,
      });

  Variables$Query$number_of_delivery._(this._$data);

  factory Variables$Query$number_of_delivery.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$distance = data['distance'];
    result$data['distance'] = (l$distance as num).toDouble();
    final l$from = data['from'];
    result$data['from'] = geographyFromJson(l$from);
    return Variables$Query$number_of_delivery._(result$data);
  }

  Map<String, dynamic> _$data;

  double get distance => (_$data['distance'] as double);
  Geography get from => (_$data['from'] as Geography);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$distance = distance;
    result$data['distance'] = l$distance;
    final l$from = from;
    result$data['from'] = geographyToJson(l$from);
    return result$data;
  }

  CopyWith$Variables$Query$number_of_delivery<
          Variables$Query$number_of_delivery>
      get copyWith => CopyWith$Variables$Query$number_of_delivery(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$number_of_delivery) ||
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
    return true;
  }

  @override
  int get hashCode {
    final l$distance = distance;
    final l$from = from;
    return Object.hashAll([
      l$distance,
      l$from,
    ]);
  }
}

abstract class CopyWith$Variables$Query$number_of_delivery<TRes> {
  factory CopyWith$Variables$Query$number_of_delivery(
    Variables$Query$number_of_delivery instance,
    TRes Function(Variables$Query$number_of_delivery) then,
  ) = _CopyWithImpl$Variables$Query$number_of_delivery;

  factory CopyWith$Variables$Query$number_of_delivery.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$number_of_delivery;

  TRes call({
    double? distance,
    Geography? from,
  });
}

class _CopyWithImpl$Variables$Query$number_of_delivery<TRes>
    implements CopyWith$Variables$Query$number_of_delivery<TRes> {
  _CopyWithImpl$Variables$Query$number_of_delivery(
    this._instance,
    this._then,
  );

  final Variables$Query$number_of_delivery _instance;

  final TRes Function(Variables$Query$number_of_delivery) _then;

  static const _undefined = {};

  TRes call({
    Object? distance = _undefined,
    Object? from = _undefined,
  }) =>
      _then(Variables$Query$number_of_delivery._({
        ..._instance._$data,
        if (distance != _undefined && distance != null)
          'distance': (distance as double),
        if (from != _undefined && from != null) 'from': (from as Geography),
      }));
}

class _CopyWithStubImpl$Variables$Query$number_of_delivery<TRes>
    implements CopyWith$Variables$Query$number_of_delivery<TRes> {
  _CopyWithStubImpl$Variables$Query$number_of_delivery(this._res);

  TRes _res;

  call({
    double? distance,
    Geography? from,
  }) =>
      _res;
}

class Query$number_of_delivery {
  Query$number_of_delivery({
    required this.delivery_company_aggregate,
    required this.laundry_store_aggregate,
    required this.$__typename,
  });

  factory Query$number_of_delivery.fromJson(Map<String, dynamic> json) {
    final l$delivery_company_aggregate = json['delivery_company_aggregate'];
    final l$laundry_store_aggregate = json['laundry_store_aggregate'];
    final l$$__typename = json['__typename'];
    return Query$number_of_delivery(
      delivery_company_aggregate:
          Query$number_of_delivery$delivery_company_aggregate.fromJson(
              (l$delivery_company_aggregate as Map<String, dynamic>)),
      laundry_store_aggregate:
          Query$number_of_delivery$laundry_store_aggregate.fromJson(
              (l$laundry_store_aggregate as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$number_of_delivery$delivery_company_aggregate
      delivery_company_aggregate;

  final Query$number_of_delivery$laundry_store_aggregate
      laundry_store_aggregate;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delivery_company_aggregate = delivery_company_aggregate;
    _resultData['delivery_company_aggregate'] =
        l$delivery_company_aggregate.toJson();
    final l$laundry_store_aggregate = laundry_store_aggregate;
    _resultData['laundry_store_aggregate'] = l$laundry_store_aggregate.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delivery_company_aggregate = delivery_company_aggregate;
    final l$laundry_store_aggregate = laundry_store_aggregate;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$delivery_company_aggregate,
      l$laundry_store_aggregate,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$number_of_delivery) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delivery_company_aggregate = delivery_company_aggregate;
    final lOther$delivery_company_aggregate = other.delivery_company_aggregate;
    if (l$delivery_company_aggregate != lOther$delivery_company_aggregate) {
      return false;
    }
    final l$laundry_store_aggregate = laundry_store_aggregate;
    final lOther$laundry_store_aggregate = other.laundry_store_aggregate;
    if (l$laundry_store_aggregate != lOther$laundry_store_aggregate) {
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

extension UtilityExtension$Query$number_of_delivery
    on Query$number_of_delivery {
  CopyWith$Query$number_of_delivery<Query$number_of_delivery> get copyWith =>
      CopyWith$Query$number_of_delivery(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$number_of_delivery<TRes> {
  factory CopyWith$Query$number_of_delivery(
    Query$number_of_delivery instance,
    TRes Function(Query$number_of_delivery) then,
  ) = _CopyWithImpl$Query$number_of_delivery;

  factory CopyWith$Query$number_of_delivery.stub(TRes res) =
      _CopyWithStubImpl$Query$number_of_delivery;

  TRes call({
    Query$number_of_delivery$delivery_company_aggregate?
        delivery_company_aggregate,
    Query$number_of_delivery$laundry_store_aggregate? laundry_store_aggregate,
    String? $__typename,
  });
  CopyWith$Query$number_of_delivery$delivery_company_aggregate<TRes>
      get delivery_company_aggregate;
  CopyWith$Query$number_of_delivery$laundry_store_aggregate<TRes>
      get laundry_store_aggregate;
}

class _CopyWithImpl$Query$number_of_delivery<TRes>
    implements CopyWith$Query$number_of_delivery<TRes> {
  _CopyWithImpl$Query$number_of_delivery(
    this._instance,
    this._then,
  );

  final Query$number_of_delivery _instance;

  final TRes Function(Query$number_of_delivery) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_company_aggregate = _undefined,
    Object? laundry_store_aggregate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$number_of_delivery(
        delivery_company_aggregate: delivery_company_aggregate == _undefined ||
                delivery_company_aggregate == null
            ? _instance.delivery_company_aggregate
            : (delivery_company_aggregate
                as Query$number_of_delivery$delivery_company_aggregate),
        laundry_store_aggregate: laundry_store_aggregate == _undefined ||
                laundry_store_aggregate == null
            ? _instance.laundry_store_aggregate
            : (laundry_store_aggregate
                as Query$number_of_delivery$laundry_store_aggregate),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$number_of_delivery$delivery_company_aggregate<TRes>
      get delivery_company_aggregate {
    final local$delivery_company_aggregate =
        _instance.delivery_company_aggregate;
    return CopyWith$Query$number_of_delivery$delivery_company_aggregate(
        local$delivery_company_aggregate,
        (e) => call(delivery_company_aggregate: e));
  }

  CopyWith$Query$number_of_delivery$laundry_store_aggregate<TRes>
      get laundry_store_aggregate {
    final local$laundry_store_aggregate = _instance.laundry_store_aggregate;
    return CopyWith$Query$number_of_delivery$laundry_store_aggregate(
        local$laundry_store_aggregate, (e) => call(laundry_store_aggregate: e));
  }
}

class _CopyWithStubImpl$Query$number_of_delivery<TRes>
    implements CopyWith$Query$number_of_delivery<TRes> {
  _CopyWithStubImpl$Query$number_of_delivery(this._res);

  TRes _res;

  call({
    Query$number_of_delivery$delivery_company_aggregate?
        delivery_company_aggregate,
    Query$number_of_delivery$laundry_store_aggregate? laundry_store_aggregate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$number_of_delivery$delivery_company_aggregate<TRes>
      get delivery_company_aggregate =>
          CopyWith$Query$number_of_delivery$delivery_company_aggregate.stub(
              _res);
  CopyWith$Query$number_of_delivery$laundry_store_aggregate<TRes>
      get laundry_store_aggregate =>
          CopyWith$Query$number_of_delivery$laundry_store_aggregate.stub(_res);
}

const documentNodeQuerynumber_of_delivery = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'number_of_delivery'),
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
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'delivery_company_aggregate'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
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
                                value:
                                    VariableNode(name: NameNode(value: 'from')),
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
        name: NameNode(value: 'laundry_store_aggregate'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
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
                                value:
                                    VariableNode(name: NameNode(value: 'from')),
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
      
    ]),
  ),
]);
Query$number_of_delivery _parserFn$Query$number_of_delivery(
        Map<String, dynamic> data) =>
    Query$number_of_delivery.fromJson(data);

class Options$Query$number_of_delivery
    extends graphql.QueryOptions<Query$number_of_delivery> {
  Options$Query$number_of_delivery({
    String? operationName,
    required Variables$Query$number_of_delivery variables,
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
          document: documentNodeQuerynumber_of_delivery,
          parserFn: _parserFn$Query$number_of_delivery,
        );
}

class WatchOptions$Query$number_of_delivery
    extends graphql.WatchQueryOptions<Query$number_of_delivery> {
  WatchOptions$Query$number_of_delivery({
    String? operationName,
    required Variables$Query$number_of_delivery variables,
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
          document: documentNodeQuerynumber_of_delivery,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$number_of_delivery,
        );
}

class FetchMoreOptions$Query$number_of_delivery
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$number_of_delivery({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$number_of_delivery variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerynumber_of_delivery,
        );
}

extension ClientExtension$Query$number_of_delivery on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$number_of_delivery>>
      query$number_of_delivery(
              Options$Query$number_of_delivery options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$number_of_delivery>
      watchQuery$number_of_delivery(
              WatchOptions$Query$number_of_delivery options) =>
          this.watchQuery(options);
  void writeQuery$number_of_delivery({
    required Query$number_of_delivery data,
    required Variables$Query$number_of_delivery variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerynumber_of_delivery),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$number_of_delivery? readQuery$number_of_delivery({
    required Variables$Query$number_of_delivery variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerynumber_of_delivery),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$number_of_delivery.fromJson(result);
  }
}

class Query$number_of_delivery$delivery_company_aggregate {
  Query$number_of_delivery$delivery_company_aggregate({
    this.aggregate,
    required this.$__typename,
  });

  factory Query$number_of_delivery$delivery_company_aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$aggregate = json['aggregate'];
    final l$$__typename = json['__typename'];
    return Query$number_of_delivery$delivery_company_aggregate(
      aggregate: l$aggregate == null
          ? null
          : Query$number_of_delivery$delivery_company_aggregate$aggregate
              .fromJson((l$aggregate as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$number_of_delivery$delivery_company_aggregate$aggregate?
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
    if (!(other is Query$number_of_delivery$delivery_company_aggregate) ||
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

extension UtilityExtension$Query$number_of_delivery$delivery_company_aggregate
    on Query$number_of_delivery$delivery_company_aggregate {
  CopyWith$Query$number_of_delivery$delivery_company_aggregate<
          Query$number_of_delivery$delivery_company_aggregate>
      get copyWith =>
          CopyWith$Query$number_of_delivery$delivery_company_aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$number_of_delivery$delivery_company_aggregate<
    TRes> {
  factory CopyWith$Query$number_of_delivery$delivery_company_aggregate(
    Query$number_of_delivery$delivery_company_aggregate instance,
    TRes Function(Query$number_of_delivery$delivery_company_aggregate) then,
  ) = _CopyWithImpl$Query$number_of_delivery$delivery_company_aggregate;

  factory CopyWith$Query$number_of_delivery$delivery_company_aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$number_of_delivery$delivery_company_aggregate;

  TRes call({
    Query$number_of_delivery$delivery_company_aggregate$aggregate? aggregate,
    String? $__typename,
  });
  CopyWith$Query$number_of_delivery$delivery_company_aggregate$aggregate<TRes>
      get aggregate;
}

class _CopyWithImpl$Query$number_of_delivery$delivery_company_aggregate<TRes>
    implements
        CopyWith$Query$number_of_delivery$delivery_company_aggregate<TRes> {
  _CopyWithImpl$Query$number_of_delivery$delivery_company_aggregate(
    this._instance,
    this._then,
  );

  final Query$number_of_delivery$delivery_company_aggregate _instance;

  final TRes Function(Query$number_of_delivery$delivery_company_aggregate)
      _then;

  static const _undefined = {};

  TRes call({
    Object? aggregate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$number_of_delivery$delivery_company_aggregate(
        aggregate: aggregate == _undefined
            ? _instance.aggregate
            : (aggregate
                as Query$number_of_delivery$delivery_company_aggregate$aggregate?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$number_of_delivery$delivery_company_aggregate$aggregate<TRes>
      get aggregate {
    final local$aggregate = _instance.aggregate;
    return local$aggregate == null
        ? CopyWith$Query$number_of_delivery$delivery_company_aggregate$aggregate
            .stub(_then(_instance))
        : CopyWith$Query$number_of_delivery$delivery_company_aggregate$aggregate(
            local$aggregate, (e) => call(aggregate: e));
  }
}

class _CopyWithStubImpl$Query$number_of_delivery$delivery_company_aggregate<
        TRes>
    implements
        CopyWith$Query$number_of_delivery$delivery_company_aggregate<TRes> {
  _CopyWithStubImpl$Query$number_of_delivery$delivery_company_aggregate(
      this._res);

  TRes _res;

  call({
    Query$number_of_delivery$delivery_company_aggregate$aggregate? aggregate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$number_of_delivery$delivery_company_aggregate$aggregate<TRes>
      get aggregate =>
          CopyWith$Query$number_of_delivery$delivery_company_aggregate$aggregate
              .stub(_res);
}

class Query$number_of_delivery$delivery_company_aggregate$aggregate {
  Query$number_of_delivery$delivery_company_aggregate$aggregate({
    required this.count,
    required this.$__typename,
  });

  factory Query$number_of_delivery$delivery_company_aggregate$aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$count = json['count'];
    final l$$__typename = json['__typename'];
    return Query$number_of_delivery$delivery_company_aggregate$aggregate(
      count: (l$count as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int count;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$count = count;
    _resultData['count'] = l$count;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$count = count;
    final l$$__typename = $__typename;
    return Object.hashAll([
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
            is Query$number_of_delivery$delivery_company_aggregate$aggregate) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$number_of_delivery$delivery_company_aggregate$aggregate
    on Query$number_of_delivery$delivery_company_aggregate$aggregate {
  CopyWith$Query$number_of_delivery$delivery_company_aggregate$aggregate<
          Query$number_of_delivery$delivery_company_aggregate$aggregate>
      get copyWith =>
          CopyWith$Query$number_of_delivery$delivery_company_aggregate$aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$number_of_delivery$delivery_company_aggregate$aggregate<
    TRes> {
  factory CopyWith$Query$number_of_delivery$delivery_company_aggregate$aggregate(
    Query$number_of_delivery$delivery_company_aggregate$aggregate instance,
    TRes Function(Query$number_of_delivery$delivery_company_aggregate$aggregate)
        then,
  ) = _CopyWithImpl$Query$number_of_delivery$delivery_company_aggregate$aggregate;

  factory CopyWith$Query$number_of_delivery$delivery_company_aggregate$aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$number_of_delivery$delivery_company_aggregate$aggregate;

  TRes call({
    int? count,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$number_of_delivery$delivery_company_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$number_of_delivery$delivery_company_aggregate$aggregate<
            TRes> {
  _CopyWithImpl$Query$number_of_delivery$delivery_company_aggregate$aggregate(
    this._instance,
    this._then,
  );

  final Query$number_of_delivery$delivery_company_aggregate$aggregate _instance;

  final TRes Function(
      Query$number_of_delivery$delivery_company_aggregate$aggregate) _then;

  static const _undefined = {};

  TRes call({
    Object? count = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$number_of_delivery$delivery_company_aggregate$aggregate(
        count: count == _undefined || count == null
            ? _instance.count
            : (count as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$number_of_delivery$delivery_company_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$number_of_delivery$delivery_company_aggregate$aggregate<
            TRes> {
  _CopyWithStubImpl$Query$number_of_delivery$delivery_company_aggregate$aggregate(
      this._res);

  TRes _res;

  call({
    int? count,
    String? $__typename,
  }) =>
      _res;
}

class Query$number_of_delivery$laundry_store_aggregate {
  Query$number_of_delivery$laundry_store_aggregate({
    this.aggregate,
    required this.$__typename,
  });

  factory Query$number_of_delivery$laundry_store_aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$aggregate = json['aggregate'];
    final l$$__typename = json['__typename'];
    return Query$number_of_delivery$laundry_store_aggregate(
      aggregate: l$aggregate == null
          ? null
          : Query$number_of_delivery$laundry_store_aggregate$aggregate.fromJson(
              (l$aggregate as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$number_of_delivery$laundry_store_aggregate$aggregate? aggregate;

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
    if (!(other is Query$number_of_delivery$laundry_store_aggregate) ||
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

extension UtilityExtension$Query$number_of_delivery$laundry_store_aggregate
    on Query$number_of_delivery$laundry_store_aggregate {
  CopyWith$Query$number_of_delivery$laundry_store_aggregate<
          Query$number_of_delivery$laundry_store_aggregate>
      get copyWith => CopyWith$Query$number_of_delivery$laundry_store_aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$number_of_delivery$laundry_store_aggregate<TRes> {
  factory CopyWith$Query$number_of_delivery$laundry_store_aggregate(
    Query$number_of_delivery$laundry_store_aggregate instance,
    TRes Function(Query$number_of_delivery$laundry_store_aggregate) then,
  ) = _CopyWithImpl$Query$number_of_delivery$laundry_store_aggregate;

  factory CopyWith$Query$number_of_delivery$laundry_store_aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$number_of_delivery$laundry_store_aggregate;

  TRes call({
    Query$number_of_delivery$laundry_store_aggregate$aggregate? aggregate,
    String? $__typename,
  });
  CopyWith$Query$number_of_delivery$laundry_store_aggregate$aggregate<TRes>
      get aggregate;
}

class _CopyWithImpl$Query$number_of_delivery$laundry_store_aggregate<TRes>
    implements CopyWith$Query$number_of_delivery$laundry_store_aggregate<TRes> {
  _CopyWithImpl$Query$number_of_delivery$laundry_store_aggregate(
    this._instance,
    this._then,
  );

  final Query$number_of_delivery$laundry_store_aggregate _instance;

  final TRes Function(Query$number_of_delivery$laundry_store_aggregate) _then;

  static const _undefined = {};

  TRes call({
    Object? aggregate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$number_of_delivery$laundry_store_aggregate(
        aggregate: aggregate == _undefined
            ? _instance.aggregate
            : (aggregate
                as Query$number_of_delivery$laundry_store_aggregate$aggregate?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$number_of_delivery$laundry_store_aggregate$aggregate<TRes>
      get aggregate {
    final local$aggregate = _instance.aggregate;
    return local$aggregate == null
        ? CopyWith$Query$number_of_delivery$laundry_store_aggregate$aggregate
            .stub(_then(_instance))
        : CopyWith$Query$number_of_delivery$laundry_store_aggregate$aggregate(
            local$aggregate, (e) => call(aggregate: e));
  }
}

class _CopyWithStubImpl$Query$number_of_delivery$laundry_store_aggregate<TRes>
    implements CopyWith$Query$number_of_delivery$laundry_store_aggregate<TRes> {
  _CopyWithStubImpl$Query$number_of_delivery$laundry_store_aggregate(this._res);

  TRes _res;

  call({
    Query$number_of_delivery$laundry_store_aggregate$aggregate? aggregate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$number_of_delivery$laundry_store_aggregate$aggregate<TRes>
      get aggregate =>
          CopyWith$Query$number_of_delivery$laundry_store_aggregate$aggregate
              .stub(_res);
}

class Query$number_of_delivery$laundry_store_aggregate$aggregate {
  Query$number_of_delivery$laundry_store_aggregate$aggregate({
    required this.count,
    required this.$__typename,
  });

  factory Query$number_of_delivery$laundry_store_aggregate$aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$count = json['count'];
    final l$$__typename = json['__typename'];
    return Query$number_of_delivery$laundry_store_aggregate$aggregate(
      count: (l$count as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int count;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$count = count;
    _resultData['count'] = l$count;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$count = count;
    final l$$__typename = $__typename;
    return Object.hashAll([
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
            is Query$number_of_delivery$laundry_store_aggregate$aggregate) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$number_of_delivery$laundry_store_aggregate$aggregate
    on Query$number_of_delivery$laundry_store_aggregate$aggregate {
  CopyWith$Query$number_of_delivery$laundry_store_aggregate$aggregate<
          Query$number_of_delivery$laundry_store_aggregate$aggregate>
      get copyWith =>
          CopyWith$Query$number_of_delivery$laundry_store_aggregate$aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$number_of_delivery$laundry_store_aggregate$aggregate<
    TRes> {
  factory CopyWith$Query$number_of_delivery$laundry_store_aggregate$aggregate(
    Query$number_of_delivery$laundry_store_aggregate$aggregate instance,
    TRes Function(Query$number_of_delivery$laundry_store_aggregate$aggregate)
        then,
  ) = _CopyWithImpl$Query$number_of_delivery$laundry_store_aggregate$aggregate;

  factory CopyWith$Query$number_of_delivery$laundry_store_aggregate$aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$number_of_delivery$laundry_store_aggregate$aggregate;

  TRes call({
    int? count,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$number_of_delivery$laundry_store_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$number_of_delivery$laundry_store_aggregate$aggregate<
            TRes> {
  _CopyWithImpl$Query$number_of_delivery$laundry_store_aggregate$aggregate(
    this._instance,
    this._then,
  );

  final Query$number_of_delivery$laundry_store_aggregate$aggregate _instance;

  final TRes Function(
      Query$number_of_delivery$laundry_store_aggregate$aggregate) _then;

  static const _undefined = {};

  TRes call({
    Object? count = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$number_of_delivery$laundry_store_aggregate$aggregate(
        count: count == _undefined || count == null
            ? _instance.count
            : (count as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$number_of_delivery$laundry_store_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$number_of_delivery$laundry_store_aggregate$aggregate<
            TRes> {
  _CopyWithStubImpl$Query$number_of_delivery$laundry_store_aggregate$aggregate(
      this._res);

  TRes _res;

  call({
    int? count,
    String? $__typename,
  }) =>
      _res;
}
