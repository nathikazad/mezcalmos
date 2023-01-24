import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Query$admin_get_dv_companies {
  Query$admin_get_dv_companies({
    required this.delivery_company,
    required this.$__typename,
  });

  factory Query$admin_get_dv_companies.fromJson(Map<String, dynamic> json) {
    final l$delivery_company = json['delivery_company'];
    final l$$__typename = json['__typename'];
    return Query$admin_get_dv_companies(
      delivery_company: (l$delivery_company as List<dynamic>)
          .map((e) => Query$admin_get_dv_companies$delivery_company.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$admin_get_dv_companies$delivery_company> delivery_company;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delivery_company = delivery_company;
    _resultData['delivery_company'] =
        l$delivery_company.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delivery_company = delivery_company;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$delivery_company.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$admin_get_dv_companies) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delivery_company = delivery_company;
    final lOther$delivery_company = other.delivery_company;
    if (l$delivery_company.length != lOther$delivery_company.length) {
      return false;
    }
    for (int i = 0; i < l$delivery_company.length; i++) {
      final l$delivery_company$entry = l$delivery_company[i];
      final lOther$delivery_company$entry = lOther$delivery_company[i];
      if (l$delivery_company$entry != lOther$delivery_company$entry) {
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

extension UtilityExtension$Query$admin_get_dv_companies
    on Query$admin_get_dv_companies {
  CopyWith$Query$admin_get_dv_companies<Query$admin_get_dv_companies>
      get copyWith => CopyWith$Query$admin_get_dv_companies(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$admin_get_dv_companies<TRes> {
  factory CopyWith$Query$admin_get_dv_companies(
    Query$admin_get_dv_companies instance,
    TRes Function(Query$admin_get_dv_companies) then,
  ) = _CopyWithImpl$Query$admin_get_dv_companies;

  factory CopyWith$Query$admin_get_dv_companies.stub(TRes res) =
      _CopyWithStubImpl$Query$admin_get_dv_companies;

  TRes call({
    List<Query$admin_get_dv_companies$delivery_company>? delivery_company,
    String? $__typename,
  });
  TRes delivery_company(
      Iterable<Query$admin_get_dv_companies$delivery_company> Function(
              Iterable<
                  CopyWith$Query$admin_get_dv_companies$delivery_company<
                      Query$admin_get_dv_companies$delivery_company>>)
          _fn);
}

class _CopyWithImpl$Query$admin_get_dv_companies<TRes>
    implements CopyWith$Query$admin_get_dv_companies<TRes> {
  _CopyWithImpl$Query$admin_get_dv_companies(
    this._instance,
    this._then,
  );

  final Query$admin_get_dv_companies _instance;

  final TRes Function(Query$admin_get_dv_companies) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_company = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$admin_get_dv_companies(
        delivery_company:
            delivery_company == _undefined || delivery_company == null
                ? _instance.delivery_company
                : (delivery_company
                    as List<Query$admin_get_dv_companies$delivery_company>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes delivery_company(
          Iterable<Query$admin_get_dv_companies$delivery_company> Function(
                  Iterable<
                      CopyWith$Query$admin_get_dv_companies$delivery_company<
                          Query$admin_get_dv_companies$delivery_company>>)
              _fn) =>
      call(
          delivery_company: _fn(_instance.delivery_company.map(
              (e) => CopyWith$Query$admin_get_dv_companies$delivery_company(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$admin_get_dv_companies<TRes>
    implements CopyWith$Query$admin_get_dv_companies<TRes> {
  _CopyWithStubImpl$Query$admin_get_dv_companies(this._res);

  TRes _res;

  call({
    List<Query$admin_get_dv_companies$delivery_company>? delivery_company,
    String? $__typename,
  }) =>
      _res;
  delivery_company(_fn) => _res;
}

const documentNodeQueryadmin_get_dv_companies = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'admin_get_dv_companies'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'delivery_company'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
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
            name: NameNode(value: 'name'),
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
            name: NameNode(value: 'service_provider_type'),
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
Query$admin_get_dv_companies _parserFn$Query$admin_get_dv_companies(
        Map<String, dynamic> data) =>
    Query$admin_get_dv_companies.fromJson(data);

class Options$Query$admin_get_dv_companies
    extends graphql.QueryOptions<Query$admin_get_dv_companies> {
  Options$Query$admin_get_dv_companies({
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
          document: documentNodeQueryadmin_get_dv_companies,
          parserFn: _parserFn$Query$admin_get_dv_companies,
        );
}

class WatchOptions$Query$admin_get_dv_companies
    extends graphql.WatchQueryOptions<Query$admin_get_dv_companies> {
  WatchOptions$Query$admin_get_dv_companies({
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
          document: documentNodeQueryadmin_get_dv_companies,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$admin_get_dv_companies,
        );
}

class FetchMoreOptions$Query$admin_get_dv_companies
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$admin_get_dv_companies(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryadmin_get_dv_companies,
        );
}

extension ClientExtension$Query$admin_get_dv_companies
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$admin_get_dv_companies>>
      query$admin_get_dv_companies(
              [Options$Query$admin_get_dv_companies? options]) async =>
          await this.query(options ?? Options$Query$admin_get_dv_companies());
  graphql.ObservableQuery<
      Query$admin_get_dv_companies> watchQuery$admin_get_dv_companies(
          [WatchOptions$Query$admin_get_dv_companies? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$admin_get_dv_companies());
  void writeQuery$admin_get_dv_companies({
    required Query$admin_get_dv_companies data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(
                document: documentNodeQueryadmin_get_dv_companies)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$admin_get_dv_companies? readQuery$admin_get_dv_companies(
      {bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryadmin_get_dv_companies)),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$admin_get_dv_companies.fromJson(result);
  }
}

class Query$admin_get_dv_companies$delivery_company {
  Query$admin_get_dv_companies$delivery_company({
    required this.approved,
    required this.image,
    required this.name,
    required this.open_status,
    required this.service_provider_type,
    required this.id,
    required this.$__typename,
  });

  factory Query$admin_get_dv_companies$delivery_company.fromJson(
      Map<String, dynamic> json) {
    final l$approved = json['approved'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$open_status = json['open_status'];
    final l$service_provider_type = json['service_provider_type'];
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Query$admin_get_dv_companies$delivery_company(
      approved: (l$approved as bool),
      image: (l$image as String),
      name: (l$name as String),
      open_status: (l$open_status as String),
      service_provider_type: (l$service_provider_type as String),
      id: (l$id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final bool approved;

  final String image;

  final String name;

  final String open_status;

  final String service_provider_type;

  final int id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$approved = approved;
    _resultData['approved'] = l$approved;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$open_status = open_status;
    _resultData['open_status'] = l$open_status;
    final l$service_provider_type = service_provider_type;
    _resultData['service_provider_type'] = l$service_provider_type;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$approved = approved;
    final l$image = image;
    final l$name = name;
    final l$open_status = open_status;
    final l$service_provider_type = service_provider_type;
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$approved,
      l$image,
      l$name,
      l$open_status,
      l$service_provider_type,
      l$id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$admin_get_dv_companies$delivery_company) ||
        runtimeType != other.runtimeType) {
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
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$open_status = open_status;
    final lOther$open_status = other.open_status;
    if (l$open_status != lOther$open_status) {
      return false;
    }
    final l$service_provider_type = service_provider_type;
    final lOther$service_provider_type = other.service_provider_type;
    if (l$service_provider_type != lOther$service_provider_type) {
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

extension UtilityExtension$Query$admin_get_dv_companies$delivery_company
    on Query$admin_get_dv_companies$delivery_company {
  CopyWith$Query$admin_get_dv_companies$delivery_company<
          Query$admin_get_dv_companies$delivery_company>
      get copyWith => CopyWith$Query$admin_get_dv_companies$delivery_company(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$admin_get_dv_companies$delivery_company<TRes> {
  factory CopyWith$Query$admin_get_dv_companies$delivery_company(
    Query$admin_get_dv_companies$delivery_company instance,
    TRes Function(Query$admin_get_dv_companies$delivery_company) then,
  ) = _CopyWithImpl$Query$admin_get_dv_companies$delivery_company;

  factory CopyWith$Query$admin_get_dv_companies$delivery_company.stub(
          TRes res) =
      _CopyWithStubImpl$Query$admin_get_dv_companies$delivery_company;

  TRes call({
    bool? approved,
    String? image,
    String? name,
    String? open_status,
    String? service_provider_type,
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$admin_get_dv_companies$delivery_company<TRes>
    implements CopyWith$Query$admin_get_dv_companies$delivery_company<TRes> {
  _CopyWithImpl$Query$admin_get_dv_companies$delivery_company(
    this._instance,
    this._then,
  );

  final Query$admin_get_dv_companies$delivery_company _instance;

  final TRes Function(Query$admin_get_dv_companies$delivery_company) _then;

  static const _undefined = {};

  TRes call({
    Object? approved = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? open_status = _undefined,
    Object? service_provider_type = _undefined,
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$admin_get_dv_companies$delivery_company(
        approved: approved == _undefined || approved == null
            ? _instance.approved
            : (approved as bool),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        open_status: open_status == _undefined || open_status == null
            ? _instance.open_status
            : (open_status as String),
        service_provider_type:
            service_provider_type == _undefined || service_provider_type == null
                ? _instance.service_provider_type
                : (service_provider_type as String),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$admin_get_dv_companies$delivery_company<TRes>
    implements CopyWith$Query$admin_get_dv_companies$delivery_company<TRes> {
  _CopyWithStubImpl$Query$admin_get_dv_companies$delivery_company(this._res);

  TRes _res;

  call({
    bool? approved,
    String? image,
    String? name,
    String? open_status,
    String? service_provider_type,
    int? id,
    String? $__typename,
  }) =>
      _res;
}

class Query$admin_get_restaurants {
  Query$admin_get_restaurants({
    required this.restaurant_restaurant,
    required this.$__typename,
  });

  factory Query$admin_get_restaurants.fromJson(Map<String, dynamic> json) {
    final l$restaurant_restaurant = json['restaurant_restaurant'];
    final l$$__typename = json['__typename'];
    return Query$admin_get_restaurants(
      restaurant_restaurant: (l$restaurant_restaurant as List<dynamic>)
          .map((e) =>
              Query$admin_get_restaurants$restaurant_restaurant.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$admin_get_restaurants$restaurant_restaurant>
      restaurant_restaurant;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_restaurant = restaurant_restaurant;
    _resultData['restaurant_restaurant'] =
        l$restaurant_restaurant.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_restaurant = restaurant_restaurant;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$restaurant_restaurant.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$admin_get_restaurants) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_restaurant = restaurant_restaurant;
    final lOther$restaurant_restaurant = other.restaurant_restaurant;
    if (l$restaurant_restaurant.length != lOther$restaurant_restaurant.length) {
      return false;
    }
    for (int i = 0; i < l$restaurant_restaurant.length; i++) {
      final l$restaurant_restaurant$entry = l$restaurant_restaurant[i];
      final lOther$restaurant_restaurant$entry =
          lOther$restaurant_restaurant[i];
      if (l$restaurant_restaurant$entry != lOther$restaurant_restaurant$entry) {
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

extension UtilityExtension$Query$admin_get_restaurants
    on Query$admin_get_restaurants {
  CopyWith$Query$admin_get_restaurants<Query$admin_get_restaurants>
      get copyWith => CopyWith$Query$admin_get_restaurants(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$admin_get_restaurants<TRes> {
  factory CopyWith$Query$admin_get_restaurants(
    Query$admin_get_restaurants instance,
    TRes Function(Query$admin_get_restaurants) then,
  ) = _CopyWithImpl$Query$admin_get_restaurants;

  factory CopyWith$Query$admin_get_restaurants.stub(TRes res) =
      _CopyWithStubImpl$Query$admin_get_restaurants;

  TRes call({
    List<Query$admin_get_restaurants$restaurant_restaurant>?
        restaurant_restaurant,
    String? $__typename,
  });
  TRes restaurant_restaurant(
      Iterable<Query$admin_get_restaurants$restaurant_restaurant> Function(
              Iterable<
                  CopyWith$Query$admin_get_restaurants$restaurant_restaurant<
                      Query$admin_get_restaurants$restaurant_restaurant>>)
          _fn);
}

class _CopyWithImpl$Query$admin_get_restaurants<TRes>
    implements CopyWith$Query$admin_get_restaurants<TRes> {
  _CopyWithImpl$Query$admin_get_restaurants(
    this._instance,
    this._then,
  );

  final Query$admin_get_restaurants _instance;

  final TRes Function(Query$admin_get_restaurants) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_restaurant = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$admin_get_restaurants(
        restaurant_restaurant:
            restaurant_restaurant == _undefined || restaurant_restaurant == null
                ? _instance.restaurant_restaurant
                : (restaurant_restaurant
                    as List<Query$admin_get_restaurants$restaurant_restaurant>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes restaurant_restaurant(
          Iterable<Query$admin_get_restaurants$restaurant_restaurant> Function(
                  Iterable<
                      CopyWith$Query$admin_get_restaurants$restaurant_restaurant<
                          Query$admin_get_restaurants$restaurant_restaurant>>)
              _fn) =>
      call(
          restaurant_restaurant: _fn(_instance.restaurant_restaurant.map(
              (e) => CopyWith$Query$admin_get_restaurants$restaurant_restaurant(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$admin_get_restaurants<TRes>
    implements CopyWith$Query$admin_get_restaurants<TRes> {
  _CopyWithStubImpl$Query$admin_get_restaurants(this._res);

  TRes _res;

  call({
    List<Query$admin_get_restaurants$restaurant_restaurant>?
        restaurant_restaurant,
    String? $__typename,
  }) =>
      _res;
  restaurant_restaurant(_fn) => _res;
}

const documentNodeQueryadmin_get_restaurants = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'admin_get_restaurants'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'restaurant_restaurant'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'approved'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'firebase_id'),
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
            name: NameNode(value: 'image'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'language_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'location_gps'),
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
            name: NameNode(value: 'name'),
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
            name: NameNode(value: 'service_provider_type'),
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
Query$admin_get_restaurants _parserFn$Query$admin_get_restaurants(
        Map<String, dynamic> data) =>
    Query$admin_get_restaurants.fromJson(data);

class Options$Query$admin_get_restaurants
    extends graphql.QueryOptions<Query$admin_get_restaurants> {
  Options$Query$admin_get_restaurants({
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
          document: documentNodeQueryadmin_get_restaurants,
          parserFn: _parserFn$Query$admin_get_restaurants,
        );
}

class WatchOptions$Query$admin_get_restaurants
    extends graphql.WatchQueryOptions<Query$admin_get_restaurants> {
  WatchOptions$Query$admin_get_restaurants({
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
          document: documentNodeQueryadmin_get_restaurants,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$admin_get_restaurants,
        );
}

class FetchMoreOptions$Query$admin_get_restaurants
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$admin_get_restaurants(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryadmin_get_restaurants,
        );
}

extension ClientExtension$Query$admin_get_restaurants on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$admin_get_restaurants>>
      query$admin_get_restaurants(
              [Options$Query$admin_get_restaurants? options]) async =>
          await this.query(options ?? Options$Query$admin_get_restaurants());
  graphql.ObservableQuery<
      Query$admin_get_restaurants> watchQuery$admin_get_restaurants(
          [WatchOptions$Query$admin_get_restaurants? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$admin_get_restaurants());
  void writeQuery$admin_get_restaurants({
    required Query$admin_get_restaurants data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(
                document: documentNodeQueryadmin_get_restaurants)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$admin_get_restaurants? readQuery$admin_get_restaurants(
      {bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryadmin_get_restaurants)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$admin_get_restaurants.fromJson(result);
  }
}

class Query$admin_get_restaurants$restaurant_restaurant {
  Query$admin_get_restaurants$restaurant_restaurant({
    required this.approved,
    this.firebase_id,
    required this.id,
    required this.image,
    required this.language_id,
    required this.location_gps,
    required this.location_text,
    required this.name,
    required this.open_status,
    required this.service_provider_type,
    required this.$__typename,
  });

  factory Query$admin_get_restaurants$restaurant_restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$approved = json['approved'];
    final l$firebase_id = json['firebase_id'];
    final l$id = json['id'];
    final l$image = json['image'];
    final l$language_id = json['language_id'];
    final l$location_gps = json['location_gps'];
    final l$location_text = json['location_text'];
    final l$name = json['name'];
    final l$open_status = json['open_status'];
    final l$service_provider_type = json['service_provider_type'];
    final l$$__typename = json['__typename'];
    return Query$admin_get_restaurants$restaurant_restaurant(
      approved: (l$approved as bool),
      firebase_id: (l$firebase_id as String?),
      id: (l$id as int),
      image: (l$image as String),
      language_id: (l$language_id as String),
      location_gps: geographyFromJson(l$location_gps),
      location_text: (l$location_text as String),
      name: (l$name as String),
      open_status: (l$open_status as String),
      service_provider_type: (l$service_provider_type as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final bool approved;

  final String? firebase_id;

  final int id;

  final String image;

  final String language_id;

  final Geography location_gps;

  final String location_text;

  final String name;

  final String open_status;

  final String service_provider_type;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$approved = approved;
    _resultData['approved'] = l$approved;
    final l$firebase_id = firebase_id;
    _resultData['firebase_id'] = l$firebase_id;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
    final l$location_gps = location_gps;
    _resultData['location_gps'] = geographyToJson(l$location_gps);
    final l$location_text = location_text;
    _resultData['location_text'] = l$location_text;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$open_status = open_status;
    _resultData['open_status'] = l$open_status;
    final l$service_provider_type = service_provider_type;
    _resultData['service_provider_type'] = l$service_provider_type;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$approved = approved;
    final l$firebase_id = firebase_id;
    final l$id = id;
    final l$image = image;
    final l$language_id = language_id;
    final l$location_gps = location_gps;
    final l$location_text = location_text;
    final l$name = name;
    final l$open_status = open_status;
    final l$service_provider_type = service_provider_type;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$approved,
      l$firebase_id,
      l$id,
      l$image,
      l$language_id,
      l$location_gps,
      l$location_text,
      l$name,
      l$open_status,
      l$service_provider_type,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$admin_get_restaurants$restaurant_restaurant) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$approved = approved;
    final lOther$approved = other.approved;
    if (l$approved != lOther$approved) {
      return false;
    }
    final l$firebase_id = firebase_id;
    final lOther$firebase_id = other.firebase_id;
    if (l$firebase_id != lOther$firebase_id) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$language_id = language_id;
    final lOther$language_id = other.language_id;
    if (l$language_id != lOther$language_id) {
      return false;
    }
    final l$location_gps = location_gps;
    final lOther$location_gps = other.location_gps;
    if (l$location_gps != lOther$location_gps) {
      return false;
    }
    final l$location_text = location_text;
    final lOther$location_text = other.location_text;
    if (l$location_text != lOther$location_text) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$open_status = open_status;
    final lOther$open_status = other.open_status;
    if (l$open_status != lOther$open_status) {
      return false;
    }
    final l$service_provider_type = service_provider_type;
    final lOther$service_provider_type = other.service_provider_type;
    if (l$service_provider_type != lOther$service_provider_type) {
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

extension UtilityExtension$Query$admin_get_restaurants$restaurant_restaurant
    on Query$admin_get_restaurants$restaurant_restaurant {
  CopyWith$Query$admin_get_restaurants$restaurant_restaurant<
          Query$admin_get_restaurants$restaurant_restaurant>
      get copyWith =>
          CopyWith$Query$admin_get_restaurants$restaurant_restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$admin_get_restaurants$restaurant_restaurant<
    TRes> {
  factory CopyWith$Query$admin_get_restaurants$restaurant_restaurant(
    Query$admin_get_restaurants$restaurant_restaurant instance,
    TRes Function(Query$admin_get_restaurants$restaurant_restaurant) then,
  ) = _CopyWithImpl$Query$admin_get_restaurants$restaurant_restaurant;

  factory CopyWith$Query$admin_get_restaurants$restaurant_restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Query$admin_get_restaurants$restaurant_restaurant;

  TRes call({
    bool? approved,
    String? firebase_id,
    int? id,
    String? image,
    String? language_id,
    Geography? location_gps,
    String? location_text,
    String? name,
    String? open_status,
    String? service_provider_type,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$admin_get_restaurants$restaurant_restaurant<TRes>
    implements
        CopyWith$Query$admin_get_restaurants$restaurant_restaurant<TRes> {
  _CopyWithImpl$Query$admin_get_restaurants$restaurant_restaurant(
    this._instance,
    this._then,
  );

  final Query$admin_get_restaurants$restaurant_restaurant _instance;

  final TRes Function(Query$admin_get_restaurants$restaurant_restaurant) _then;

  static const _undefined = {};

  TRes call({
    Object? approved = _undefined,
    Object? firebase_id = _undefined,
    Object? id = _undefined,
    Object? image = _undefined,
    Object? language_id = _undefined,
    Object? location_gps = _undefined,
    Object? location_text = _undefined,
    Object? name = _undefined,
    Object? open_status = _undefined,
    Object? service_provider_type = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$admin_get_restaurants$restaurant_restaurant(
        approved: approved == _undefined || approved == null
            ? _instance.approved
            : (approved as bool),
        firebase_id: firebase_id == _undefined
            ? _instance.firebase_id
            : (firebase_id as String?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        location_gps: location_gps == _undefined || location_gps == null
            ? _instance.location_gps
            : (location_gps as Geography),
        location_text: location_text == _undefined || location_text == null
            ? _instance.location_text
            : (location_text as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        open_status: open_status == _undefined || open_status == null
            ? _instance.open_status
            : (open_status as String),
        service_provider_type:
            service_provider_type == _undefined || service_provider_type == null
                ? _instance.service_provider_type
                : (service_provider_type as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$admin_get_restaurants$restaurant_restaurant<TRes>
    implements
        CopyWith$Query$admin_get_restaurants$restaurant_restaurant<TRes> {
  _CopyWithStubImpl$Query$admin_get_restaurants$restaurant_restaurant(
      this._res);

  TRes _res;

  call({
    bool? approved,
    String? firebase_id,
    int? id,
    String? image,
    String? language_id,
    Geography? location_gps,
    String? location_text,
    String? name,
    String? open_status,
    String? service_provider_type,
    String? $__typename,
  }) =>
      _res;
}
