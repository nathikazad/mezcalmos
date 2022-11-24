import '../../__generated/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Variables$Query$getCustomerLocations {
  factory Variables$Query$getCustomerLocations({required int customer_id}) =>
      Variables$Query$getCustomerLocations._({
        r'customer_id': customer_id,
      });

  Variables$Query$getCustomerLocations._(this._$data);

  factory Variables$Query$getCustomerLocations.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$customer_id = data['customer_id'];
    result$data['customer_id'] = (l$customer_id as int);
    return Variables$Query$getCustomerLocations._(result$data);
  }

  Map<String, dynamic> _$data;

  int get customer_id => (_$data['customer_id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$customer_id = customer_id;
    result$data['customer_id'] = l$customer_id;
    return result$data;
  }

  CopyWith$Variables$Query$getCustomerLocations<
          Variables$Query$getCustomerLocations>
      get copyWith => CopyWith$Variables$Query$getCustomerLocations(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getCustomerLocations) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$customer_id = customer_id;
    final lOther$customer_id = other.customer_id;
    if (l$customer_id != lOther$customer_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$customer_id = customer_id;
    return Object.hashAll([l$customer_id]);
  }
}

abstract class CopyWith$Variables$Query$getCustomerLocations<TRes> {
  factory CopyWith$Variables$Query$getCustomerLocations(
    Variables$Query$getCustomerLocations instance,
    TRes Function(Variables$Query$getCustomerLocations) then,
  ) = _CopyWithImpl$Variables$Query$getCustomerLocations;

  factory CopyWith$Variables$Query$getCustomerLocations.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getCustomerLocations;

  TRes call({int? customer_id});
}

class _CopyWithImpl$Variables$Query$getCustomerLocations<TRes>
    implements CopyWith$Variables$Query$getCustomerLocations<TRes> {
  _CopyWithImpl$Variables$Query$getCustomerLocations(
    this._instance,
    this._then,
  );

  final Variables$Query$getCustomerLocations _instance;

  final TRes Function(Variables$Query$getCustomerLocations) _then;

  static const _undefined = {};

  TRes call({Object? customer_id = _undefined}) =>
      _then(Variables$Query$getCustomerLocations._({
        ..._instance._$data,
        if (customer_id != _undefined && customer_id != null)
          'customer_id': (customer_id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getCustomerLocations<TRes>
    implements CopyWith$Variables$Query$getCustomerLocations<TRes> {
  _CopyWithStubImpl$Variables$Query$getCustomerLocations(this._res);

  TRes _res;

  call({int? customer_id}) => _res;
}

class Query$getCustomerLocations {
  Query$getCustomerLocations({
    required this.saved_location,
    required this.$__typename,
  });

  factory Query$getCustomerLocations.fromJson(Map<String, dynamic> json) {
    final l$saved_location = json['saved_location'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerLocations(
      saved_location: (l$saved_location as List<dynamic>)
          .map((e) => Query$getCustomerLocations$saved_location.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getCustomerLocations$saved_location> saved_location;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$saved_location = saved_location;
    _resultData['saved_location'] =
        l$saved_location.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$saved_location = saved_location;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$saved_location.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getCustomerLocations) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$saved_location = saved_location;
    final lOther$saved_location = other.saved_location;
    if (l$saved_location.length != lOther$saved_location.length) {
      return false;
    }
    for (int i = 0; i < l$saved_location.length; i++) {
      final l$saved_location$entry = l$saved_location[i];
      final lOther$saved_location$entry = lOther$saved_location[i];
      if (l$saved_location$entry != lOther$saved_location$entry) {
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

extension UtilityExtension$Query$getCustomerLocations
    on Query$getCustomerLocations {
  CopyWith$Query$getCustomerLocations<Query$getCustomerLocations>
      get copyWith => CopyWith$Query$getCustomerLocations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerLocations<TRes> {
  factory CopyWith$Query$getCustomerLocations(
    Query$getCustomerLocations instance,
    TRes Function(Query$getCustomerLocations) then,
  ) = _CopyWithImpl$Query$getCustomerLocations;

  factory CopyWith$Query$getCustomerLocations.stub(TRes res) =
      _CopyWithStubImpl$Query$getCustomerLocations;

  TRes call({
    List<Query$getCustomerLocations$saved_location>? saved_location,
    String? $__typename,
  });
  TRes saved_location(
      Iterable<Query$getCustomerLocations$saved_location> Function(
              Iterable<
                  CopyWith$Query$getCustomerLocations$saved_location<
                      Query$getCustomerLocations$saved_location>>)
          _fn);
}

class _CopyWithImpl$Query$getCustomerLocations<TRes>
    implements CopyWith$Query$getCustomerLocations<TRes> {
  _CopyWithImpl$Query$getCustomerLocations(
    this._instance,
    this._then,
  );

  final Query$getCustomerLocations _instance;

  final TRes Function(Query$getCustomerLocations) _then;

  static const _undefined = {};

  TRes call({
    Object? saved_location = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getCustomerLocations(
        saved_location: saved_location == _undefined || saved_location == null
            ? _instance.saved_location
            : (saved_location
                as List<Query$getCustomerLocations$saved_location>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes saved_location(
          Iterable<Query$getCustomerLocations$saved_location> Function(
                  Iterable<
                      CopyWith$Query$getCustomerLocations$saved_location<
                          Query$getCustomerLocations$saved_location>>)
              _fn) =>
      call(
          saved_location: _fn(_instance.saved_location
              .map((e) => CopyWith$Query$getCustomerLocations$saved_location(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getCustomerLocations<TRes>
    implements CopyWith$Query$getCustomerLocations<TRes> {
  _CopyWithStubImpl$Query$getCustomerLocations(this._res);

  TRes _res;

  call({
    List<Query$getCustomerLocations$saved_location>? saved_location,
    String? $__typename,
  }) =>
      _res;
  saved_location(_fn) => _res;
}

const documentNodeQuerygetCustomerLocations = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getCustomerLocations'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'customer_id')),
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
        name: NameNode(value: 'saved_location'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'customer_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'customer_id')),
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
            name: NameNode(value: 'default'),
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
Query$getCustomerLocations _parserFn$Query$getCustomerLocations(
        Map<String, dynamic> data) =>
    Query$getCustomerLocations.fromJson(data);

class Options$Query$getCustomerLocations
    extends graphql.QueryOptions<Query$getCustomerLocations> {
  Options$Query$getCustomerLocations({
    String? operationName,
    required Variables$Query$getCustomerLocations variables,
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
          document: documentNodeQuerygetCustomerLocations,
          parserFn: _parserFn$Query$getCustomerLocations,
        );
}

class WatchOptions$Query$getCustomerLocations
    extends graphql.WatchQueryOptions<Query$getCustomerLocations> {
  WatchOptions$Query$getCustomerLocations({
    String? operationName,
    required Variables$Query$getCustomerLocations variables,
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
          document: documentNodeQuerygetCustomerLocations,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getCustomerLocations,
        );
}

class FetchMoreOptions$Query$getCustomerLocations
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getCustomerLocations({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getCustomerLocations variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetCustomerLocations,
        );
}

extension ClientExtension$Query$getCustomerLocations on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getCustomerLocations>>
      query$getCustomerLocations(
              Options$Query$getCustomerLocations options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getCustomerLocations>
      watchQuery$getCustomerLocations(
              WatchOptions$Query$getCustomerLocations options) =>
          this.watchQuery(options);
  void writeQuery$getCustomerLocations({
    required Query$getCustomerLocations data,
    required Variables$Query$getCustomerLocations variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetCustomerLocations),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getCustomerLocations? readQuery$getCustomerLocations({
    required Variables$Query$getCustomerLocations variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetCustomerLocations),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getCustomerLocations.fromJson(result);
  }
}

class Query$getCustomerLocations$saved_location {
  Query$getCustomerLocations$saved_location({
    required this.id,
    required this.name,
    required this.location_gps,
    required this.location_text,
    required this.$default,
    required this.$__typename,
  });

  factory Query$getCustomerLocations$saved_location.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$location_gps = json['location_gps'];
    final l$location_text = json['location_text'];
    final l$$default = json['default'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerLocations$saved_location(
      id: (l$id as int),
      name: (l$name as String),
      location_gps: GeographyFromJson(l$location_gps),
      location_text: (l$location_text as String),
      $default: (l$$default as bool),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String name;

  final Geography location_gps;

  final String location_text;

  final bool $default;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$location_gps = location_gps;
    _resultData['location_gps'] = GeographyToJson(l$location_gps);
    final l$location_text = location_text;
    _resultData['location_text'] = l$location_text;
    final l$$default = $default;
    _resultData['default'] = l$$default;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$location_gps = location_gps;
    final l$location_text = location_text;
    final l$$default = $default;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$location_gps,
      l$location_text,
      l$$default,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getCustomerLocations$saved_location) ||
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
    final l$$default = $default;
    final lOther$$default = other.$default;
    if (l$$default != lOther$$default) {
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

extension UtilityExtension$Query$getCustomerLocations$saved_location
    on Query$getCustomerLocations$saved_location {
  CopyWith$Query$getCustomerLocations$saved_location<
          Query$getCustomerLocations$saved_location>
      get copyWith => CopyWith$Query$getCustomerLocations$saved_location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerLocations$saved_location<TRes> {
  factory CopyWith$Query$getCustomerLocations$saved_location(
    Query$getCustomerLocations$saved_location instance,
    TRes Function(Query$getCustomerLocations$saved_location) then,
  ) = _CopyWithImpl$Query$getCustomerLocations$saved_location;

  factory CopyWith$Query$getCustomerLocations$saved_location.stub(TRes res) =
      _CopyWithStubImpl$Query$getCustomerLocations$saved_location;

  TRes call({
    int? id,
    String? name,
    Geography? location_gps,
    String? location_text,
    bool? $default,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getCustomerLocations$saved_location<TRes>
    implements CopyWith$Query$getCustomerLocations$saved_location<TRes> {
  _CopyWithImpl$Query$getCustomerLocations$saved_location(
    this._instance,
    this._then,
  );

  final Query$getCustomerLocations$saved_location _instance;

  final TRes Function(Query$getCustomerLocations$saved_location) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? location_gps = _undefined,
    Object? location_text = _undefined,
    Object? $default = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getCustomerLocations$saved_location(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        location_gps: location_gps == _undefined || location_gps == null
            ? _instance.location_gps
            : (location_gps as Geography),
        location_text: location_text == _undefined || location_text == null
            ? _instance.location_text
            : (location_text as String),
        $default: $default == _undefined || $default == null
            ? _instance.$default
            : ($default as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getCustomerLocations$saved_location<TRes>
    implements CopyWith$Query$getCustomerLocations$saved_location<TRes> {
  _CopyWithStubImpl$Query$getCustomerLocations$saved_location(this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    Geography? location_gps,
    String? location_text,
    bool? $default,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getSavedLocation {
  factory Variables$Query$getSavedLocation({required int location_id}) =>
      Variables$Query$getSavedLocation._({
        r'location_id': location_id,
      });

  Variables$Query$getSavedLocation._(this._$data);

  factory Variables$Query$getSavedLocation.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$location_id = data['location_id'];
    result$data['location_id'] = (l$location_id as int);
    return Variables$Query$getSavedLocation._(result$data);
  }

  Map<String, dynamic> _$data;

  int get location_id => (_$data['location_id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$location_id = location_id;
    result$data['location_id'] = l$location_id;
    return result$data;
  }

  CopyWith$Variables$Query$getSavedLocation<Variables$Query$getSavedLocation>
      get copyWith => CopyWith$Variables$Query$getSavedLocation(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getSavedLocation) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$location_id = location_id;
    final lOther$location_id = other.location_id;
    if (l$location_id != lOther$location_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$location_id = location_id;
    return Object.hashAll([l$location_id]);
  }
}

abstract class CopyWith$Variables$Query$getSavedLocation<TRes> {
  factory CopyWith$Variables$Query$getSavedLocation(
    Variables$Query$getSavedLocation instance,
    TRes Function(Variables$Query$getSavedLocation) then,
  ) = _CopyWithImpl$Variables$Query$getSavedLocation;

  factory CopyWith$Variables$Query$getSavedLocation.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getSavedLocation;

  TRes call({int? location_id});
}

class _CopyWithImpl$Variables$Query$getSavedLocation<TRes>
    implements CopyWith$Variables$Query$getSavedLocation<TRes> {
  _CopyWithImpl$Variables$Query$getSavedLocation(
    this._instance,
    this._then,
  );

  final Variables$Query$getSavedLocation _instance;

  final TRes Function(Variables$Query$getSavedLocation) _then;

  static const _undefined = {};

  TRes call({Object? location_id = _undefined}) =>
      _then(Variables$Query$getSavedLocation._({
        ..._instance._$data,
        if (location_id != _undefined && location_id != null)
          'location_id': (location_id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getSavedLocation<TRes>
    implements CopyWith$Variables$Query$getSavedLocation<TRes> {
  _CopyWithStubImpl$Variables$Query$getSavedLocation(this._res);

  TRes _res;

  call({int? location_id}) => _res;
}

class Query$getSavedLocation {
  Query$getSavedLocation({
    this.saved_location_by_pk,
    required this.$__typename,
  });

  factory Query$getSavedLocation.fromJson(Map<String, dynamic> json) {
    final l$saved_location_by_pk = json['saved_location_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$getSavedLocation(
      saved_location_by_pk: l$saved_location_by_pk == null
          ? null
          : Query$getSavedLocation$saved_location_by_pk.fromJson(
              (l$saved_location_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getSavedLocation$saved_location_by_pk? saved_location_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$saved_location_by_pk = saved_location_by_pk;
    _resultData['saved_location_by_pk'] = l$saved_location_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$saved_location_by_pk = saved_location_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$saved_location_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getSavedLocation) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$saved_location_by_pk = saved_location_by_pk;
    final lOther$saved_location_by_pk = other.saved_location_by_pk;
    if (l$saved_location_by_pk != lOther$saved_location_by_pk) {
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

extension UtilityExtension$Query$getSavedLocation on Query$getSavedLocation {
  CopyWith$Query$getSavedLocation<Query$getSavedLocation> get copyWith =>
      CopyWith$Query$getSavedLocation(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getSavedLocation<TRes> {
  factory CopyWith$Query$getSavedLocation(
    Query$getSavedLocation instance,
    TRes Function(Query$getSavedLocation) then,
  ) = _CopyWithImpl$Query$getSavedLocation;

  factory CopyWith$Query$getSavedLocation.stub(TRes res) =
      _CopyWithStubImpl$Query$getSavedLocation;

  TRes call({
    Query$getSavedLocation$saved_location_by_pk? saved_location_by_pk,
    String? $__typename,
  });
  CopyWith$Query$getSavedLocation$saved_location_by_pk<TRes>
      get saved_location_by_pk;
}

class _CopyWithImpl$Query$getSavedLocation<TRes>
    implements CopyWith$Query$getSavedLocation<TRes> {
  _CopyWithImpl$Query$getSavedLocation(
    this._instance,
    this._then,
  );

  final Query$getSavedLocation _instance;

  final TRes Function(Query$getSavedLocation) _then;

  static const _undefined = {};

  TRes call({
    Object? saved_location_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getSavedLocation(
        saved_location_by_pk: saved_location_by_pk == _undefined
            ? _instance.saved_location_by_pk
            : (saved_location_by_pk
                as Query$getSavedLocation$saved_location_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getSavedLocation$saved_location_by_pk<TRes>
      get saved_location_by_pk {
    final local$saved_location_by_pk = _instance.saved_location_by_pk;
    return local$saved_location_by_pk == null
        ? CopyWith$Query$getSavedLocation$saved_location_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$getSavedLocation$saved_location_by_pk(
            local$saved_location_by_pk, (e) => call(saved_location_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$getSavedLocation<TRes>
    implements CopyWith$Query$getSavedLocation<TRes> {
  _CopyWithStubImpl$Query$getSavedLocation(this._res);

  TRes _res;

  call({
    Query$getSavedLocation$saved_location_by_pk? saved_location_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getSavedLocation$saved_location_by_pk<TRes>
      get saved_location_by_pk =>
          CopyWith$Query$getSavedLocation$saved_location_by_pk.stub(_res);
}

const documentNodeQuerygetSavedLocation = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getSavedLocation'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'location_id')),
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
        name: NameNode(value: 'saved_location_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'location_id')),
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
            name: NameNode(value: 'default'),
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
Query$getSavedLocation _parserFn$Query$getSavedLocation(
        Map<String, dynamic> data) =>
    Query$getSavedLocation.fromJson(data);

class Options$Query$getSavedLocation
    extends graphql.QueryOptions<Query$getSavedLocation> {
  Options$Query$getSavedLocation({
    String? operationName,
    required Variables$Query$getSavedLocation variables,
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
          document: documentNodeQuerygetSavedLocation,
          parserFn: _parserFn$Query$getSavedLocation,
        );
}

class WatchOptions$Query$getSavedLocation
    extends graphql.WatchQueryOptions<Query$getSavedLocation> {
  WatchOptions$Query$getSavedLocation({
    String? operationName,
    required Variables$Query$getSavedLocation variables,
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
          document: documentNodeQuerygetSavedLocation,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getSavedLocation,
        );
}

class FetchMoreOptions$Query$getSavedLocation extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getSavedLocation({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getSavedLocation variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetSavedLocation,
        );
}

extension ClientExtension$Query$getSavedLocation on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getSavedLocation>> query$getSavedLocation(
          Options$Query$getSavedLocation options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$getSavedLocation> watchQuery$getSavedLocation(
          WatchOptions$Query$getSavedLocation options) =>
      this.watchQuery(options);
  void writeQuery$getSavedLocation({
    required Query$getSavedLocation data,
    required Variables$Query$getSavedLocation variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerygetSavedLocation),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getSavedLocation? readQuery$getSavedLocation({
    required Variables$Query$getSavedLocation variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetSavedLocation),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getSavedLocation.fromJson(result);
  }
}

class Query$getSavedLocation$saved_location_by_pk {
  Query$getSavedLocation$saved_location_by_pk({
    required this.id,
    required this.name,
    required this.location_gps,
    required this.location_text,
    required this.$default,
    required this.$__typename,
  });

  factory Query$getSavedLocation$saved_location_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$location_gps = json['location_gps'];
    final l$location_text = json['location_text'];
    final l$$default = json['default'];
    final l$$__typename = json['__typename'];
    return Query$getSavedLocation$saved_location_by_pk(
      id: (l$id as int),
      name: (l$name as String),
      location_gps: GeographyFromJson(l$location_gps),
      location_text: (l$location_text as String),
      $default: (l$$default as bool),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String name;

  final Geography location_gps;

  final String location_text;

  final bool $default;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$location_gps = location_gps;
    _resultData['location_gps'] = GeographyToJson(l$location_gps);
    final l$location_text = location_text;
    _resultData['location_text'] = l$location_text;
    final l$$default = $default;
    _resultData['default'] = l$$default;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$location_gps = location_gps;
    final l$location_text = location_text;
    final l$$default = $default;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$location_gps,
      l$location_text,
      l$$default,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getSavedLocation$saved_location_by_pk) ||
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
    final l$$default = $default;
    final lOther$$default = other.$default;
    if (l$$default != lOther$$default) {
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

extension UtilityExtension$Query$getSavedLocation$saved_location_by_pk
    on Query$getSavedLocation$saved_location_by_pk {
  CopyWith$Query$getSavedLocation$saved_location_by_pk<
          Query$getSavedLocation$saved_location_by_pk>
      get copyWith => CopyWith$Query$getSavedLocation$saved_location_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getSavedLocation$saved_location_by_pk<TRes> {
  factory CopyWith$Query$getSavedLocation$saved_location_by_pk(
    Query$getSavedLocation$saved_location_by_pk instance,
    TRes Function(Query$getSavedLocation$saved_location_by_pk) then,
  ) = _CopyWithImpl$Query$getSavedLocation$saved_location_by_pk;

  factory CopyWith$Query$getSavedLocation$saved_location_by_pk.stub(TRes res) =
      _CopyWithStubImpl$Query$getSavedLocation$saved_location_by_pk;

  TRes call({
    int? id,
    String? name,
    Geography? location_gps,
    String? location_text,
    bool? $default,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getSavedLocation$saved_location_by_pk<TRes>
    implements CopyWith$Query$getSavedLocation$saved_location_by_pk<TRes> {
  _CopyWithImpl$Query$getSavedLocation$saved_location_by_pk(
    this._instance,
    this._then,
  );

  final Query$getSavedLocation$saved_location_by_pk _instance;

  final TRes Function(Query$getSavedLocation$saved_location_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? location_gps = _undefined,
    Object? location_text = _undefined,
    Object? $default = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getSavedLocation$saved_location_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        location_gps: location_gps == _undefined || location_gps == null
            ? _instance.location_gps
            : (location_gps as Geography),
        location_text: location_text == _undefined || location_text == null
            ? _instance.location_text
            : (location_text as String),
        $default: $default == _undefined || $default == null
            ? _instance.$default
            : ($default as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getSavedLocation$saved_location_by_pk<TRes>
    implements CopyWith$Query$getSavedLocation$saved_location_by_pk<TRes> {
  _CopyWithStubImpl$Query$getSavedLocation$saved_location_by_pk(this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    Geography? location_gps,
    String? location_text,
    bool? $default,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$updateSavedLocation {
  factory Variables$Mutation$updateSavedLocation({
    required Input$saved_location_pk_columns_input location_id,
    Geography? gps,
    required String name,
    required bool $default,
    required String address,
  }) =>
      Variables$Mutation$updateSavedLocation._({
        r'location_id': location_id,
        if (gps != null) r'gps': gps,
        r'name': name,
        r'default': $default,
        r'address': address,
      });

  Variables$Mutation$updateSavedLocation._(this._$data);

  factory Variables$Mutation$updateSavedLocation.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$location_id = data['location_id'];
    result$data['location_id'] = Input$saved_location_pk_columns_input.fromJson(
        (l$location_id as Map<String, dynamic>));
    if (data.containsKey('gps')) {
      final l$gps = data['gps'];
      result$data['gps'] = l$gps == null ? null : GeographyFromJson(l$gps);
    }
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    final l$$default = data['default'];
    result$data['default'] = (l$$default as bool);
    final l$address = data['address'];
    result$data['address'] = (l$address as String);
    return Variables$Mutation$updateSavedLocation._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$saved_location_pk_columns_input get location_id =>
      (_$data['location_id'] as Input$saved_location_pk_columns_input);
  Geography? get gps => (_$data['gps'] as Geography?);
  String get name => (_$data['name'] as String);
  bool get $default => (_$data['default'] as bool);
  String get address => (_$data['address'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$location_id = location_id;
    result$data['location_id'] = l$location_id.toJson();
    if (_$data.containsKey('gps')) {
      final l$gps = gps;
      result$data['gps'] = l$gps == null ? null : GeographyToJson(l$gps);
    }
    final l$name = name;
    result$data['name'] = l$name;
    final l$$default = $default;
    result$data['default'] = l$$default;
    final l$address = address;
    result$data['address'] = l$address;
    return result$data;
  }

  CopyWith$Variables$Mutation$updateSavedLocation<
          Variables$Mutation$updateSavedLocation>
      get copyWith => CopyWith$Variables$Mutation$updateSavedLocation(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$updateSavedLocation) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$location_id = location_id;
    final lOther$location_id = other.location_id;
    if (l$location_id != lOther$location_id) {
      return false;
    }
    final l$gps = gps;
    final lOther$gps = other.gps;
    if (_$data.containsKey('gps') != other._$data.containsKey('gps')) {
      return false;
    }
    if (l$gps != lOther$gps) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$$default = $default;
    final lOther$$default = other.$default;
    if (l$$default != lOther$$default) {
      return false;
    }
    final l$address = address;
    final lOther$address = other.address;
    if (l$address != lOther$address) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$location_id = location_id;
    final l$gps = gps;
    final l$name = name;
    final l$$default = $default;
    final l$address = address;
    return Object.hashAll([
      l$location_id,
      _$data.containsKey('gps') ? l$gps : const {},
      l$name,
      l$$default,
      l$address,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$updateSavedLocation<TRes> {
  factory CopyWith$Variables$Mutation$updateSavedLocation(
    Variables$Mutation$updateSavedLocation instance,
    TRes Function(Variables$Mutation$updateSavedLocation) then,
  ) = _CopyWithImpl$Variables$Mutation$updateSavedLocation;

  factory CopyWith$Variables$Mutation$updateSavedLocation.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$updateSavedLocation;

  TRes call({
    Input$saved_location_pk_columns_input? location_id,
    Geography? gps,
    String? name,
    bool? $default,
    String? address,
  });
}

class _CopyWithImpl$Variables$Mutation$updateSavedLocation<TRes>
    implements CopyWith$Variables$Mutation$updateSavedLocation<TRes> {
  _CopyWithImpl$Variables$Mutation$updateSavedLocation(
    this._instance,
    this._then,
  );

  final Variables$Mutation$updateSavedLocation _instance;

  final TRes Function(Variables$Mutation$updateSavedLocation) _then;

  static const _undefined = {};

  TRes call({
    Object? location_id = _undefined,
    Object? gps = _undefined,
    Object? name = _undefined,
    Object? $default = _undefined,
    Object? address = _undefined,
  }) =>
      _then(Variables$Mutation$updateSavedLocation._({
        ..._instance._$data,
        if (location_id != _undefined && location_id != null)
          'location_id': (location_id as Input$saved_location_pk_columns_input),
        if (gps != _undefined) 'gps': (gps as Geography?),
        if (name != _undefined && name != null) 'name': (name as String),
        if ($default != _undefined && $default != null)
          'default': ($default as bool),
        if (address != _undefined && address != null)
          'address': (address as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$updateSavedLocation<TRes>
    implements CopyWith$Variables$Mutation$updateSavedLocation<TRes> {
  _CopyWithStubImpl$Variables$Mutation$updateSavedLocation(this._res);

  TRes _res;

  call({
    Input$saved_location_pk_columns_input? location_id,
    Geography? gps,
    String? name,
    bool? $default,
    String? address,
  }) =>
      _res;
}

class Mutation$updateSavedLocation {
  Mutation$updateSavedLocation({
    this.update_saved_location_by_pk,
    required this.$__typename,
  });

  factory Mutation$updateSavedLocation.fromJson(Map<String, dynamic> json) {
    final l$update_saved_location_by_pk = json['update_saved_location_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$updateSavedLocation(
      update_saved_location_by_pk: l$update_saved_location_by_pk == null
          ? null
          : Mutation$updateSavedLocation$update_saved_location_by_pk.fromJson(
              (l$update_saved_location_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$updateSavedLocation$update_saved_location_by_pk?
      update_saved_location_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_saved_location_by_pk = update_saved_location_by_pk;
    _resultData['update_saved_location_by_pk'] =
        l$update_saved_location_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_saved_location_by_pk = update_saved_location_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_saved_location_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$updateSavedLocation) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_saved_location_by_pk = update_saved_location_by_pk;
    final lOther$update_saved_location_by_pk =
        other.update_saved_location_by_pk;
    if (l$update_saved_location_by_pk != lOther$update_saved_location_by_pk) {
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

extension UtilityExtension$Mutation$updateSavedLocation
    on Mutation$updateSavedLocation {
  CopyWith$Mutation$updateSavedLocation<Mutation$updateSavedLocation>
      get copyWith => CopyWith$Mutation$updateSavedLocation(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateSavedLocation<TRes> {
  factory CopyWith$Mutation$updateSavedLocation(
    Mutation$updateSavedLocation instance,
    TRes Function(Mutation$updateSavedLocation) then,
  ) = _CopyWithImpl$Mutation$updateSavedLocation;

  factory CopyWith$Mutation$updateSavedLocation.stub(TRes res) =
      _CopyWithStubImpl$Mutation$updateSavedLocation;

  TRes call({
    Mutation$updateSavedLocation$update_saved_location_by_pk?
        update_saved_location_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$updateSavedLocation$update_saved_location_by_pk<TRes>
      get update_saved_location_by_pk;
}

class _CopyWithImpl$Mutation$updateSavedLocation<TRes>
    implements CopyWith$Mutation$updateSavedLocation<TRes> {
  _CopyWithImpl$Mutation$updateSavedLocation(
    this._instance,
    this._then,
  );

  final Mutation$updateSavedLocation _instance;

  final TRes Function(Mutation$updateSavedLocation) _then;

  static const _undefined = {};

  TRes call({
    Object? update_saved_location_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateSavedLocation(
        update_saved_location_by_pk: update_saved_location_by_pk == _undefined
            ? _instance.update_saved_location_by_pk
            : (update_saved_location_by_pk
                as Mutation$updateSavedLocation$update_saved_location_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$updateSavedLocation$update_saved_location_by_pk<TRes>
      get update_saved_location_by_pk {
    final local$update_saved_location_by_pk =
        _instance.update_saved_location_by_pk;
    return local$update_saved_location_by_pk == null
        ? CopyWith$Mutation$updateSavedLocation$update_saved_location_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$updateSavedLocation$update_saved_location_by_pk(
            local$update_saved_location_by_pk,
            (e) => call(update_saved_location_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$updateSavedLocation<TRes>
    implements CopyWith$Mutation$updateSavedLocation<TRes> {
  _CopyWithStubImpl$Mutation$updateSavedLocation(this._res);

  TRes _res;

  call({
    Mutation$updateSavedLocation$update_saved_location_by_pk?
        update_saved_location_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$updateSavedLocation$update_saved_location_by_pk<TRes>
      get update_saved_location_by_pk =>
          CopyWith$Mutation$updateSavedLocation$update_saved_location_by_pk
              .stub(_res);
}

const documentNodeMutationupdateSavedLocation = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'updateSavedLocation'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'location_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'saved_location_pk_columns_input'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'gps')),
        type: NamedTypeNode(
          name: NameNode(value: 'geography'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'name')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'default')),
        type: NamedTypeNode(
          name: NameNode(value: 'Boolean'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'address')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'update_saved_location_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'pk_columns'),
            value: VariableNode(name: NameNode(value: 'location_id')),
          ),
          ArgumentNode(
            name: NameNode(value: '_set'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'location_gps'),
                value: VariableNode(name: NameNode(value: 'gps')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'location_text'),
                value: VariableNode(name: NameNode(value: 'address')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'default'),
                value: VariableNode(name: NameNode(value: 'default')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'name'),
                value: VariableNode(name: NameNode(value: 'name')),
              ),
            ]),
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
            name: NameNode(value: 'name'),
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
            name: NameNode(value: 'default'),
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
Mutation$updateSavedLocation _parserFn$Mutation$updateSavedLocation(
        Map<String, dynamic> data) =>
    Mutation$updateSavedLocation.fromJson(data);
typedef OnMutationCompleted$Mutation$updateSavedLocation = FutureOr<void>
    Function(
  dynamic,
  Mutation$updateSavedLocation?,
);

class Options$Mutation$updateSavedLocation
    extends graphql.MutationOptions<Mutation$updateSavedLocation> {
  Options$Mutation$updateSavedLocation({
    String? operationName,
    required Variables$Mutation$updateSavedLocation variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$updateSavedLocation? onCompleted,
    graphql.OnMutationUpdate<Mutation$updateSavedLocation>? update,
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
                        : _parserFn$Mutation$updateSavedLocation(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdateSavedLocation,
          parserFn: _parserFn$Mutation$updateSavedLocation,
        );

  final OnMutationCompleted$Mutation$updateSavedLocation? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$updateSavedLocation
    extends graphql.WatchQueryOptions<Mutation$updateSavedLocation> {
  WatchOptions$Mutation$updateSavedLocation({
    String? operationName,
    required Variables$Mutation$updateSavedLocation variables,
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
          document: documentNodeMutationupdateSavedLocation,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$updateSavedLocation,
        );
}

extension ClientExtension$Mutation$updateSavedLocation
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$updateSavedLocation>>
      mutate$updateSavedLocation(
              Options$Mutation$updateSavedLocation options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$updateSavedLocation>
      watchMutation$updateSavedLocation(
              WatchOptions$Mutation$updateSavedLocation options) =>
          this.watchMutation(options);
}

class Mutation$updateSavedLocation$update_saved_location_by_pk {
  Mutation$updateSavedLocation$update_saved_location_by_pk({
    required this.id,
    required this.name,
    required this.location_gps,
    required this.location_text,
    required this.$default,
    required this.$__typename,
  });

  factory Mutation$updateSavedLocation$update_saved_location_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$location_gps = json['location_gps'];
    final l$location_text = json['location_text'];
    final l$$default = json['default'];
    final l$$__typename = json['__typename'];
    return Mutation$updateSavedLocation$update_saved_location_by_pk(
      id: (l$id as int),
      name: (l$name as String),
      location_gps: GeographyFromJson(l$location_gps),
      location_text: (l$location_text as String),
      $default: (l$$default as bool),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String name;

  final Geography location_gps;

  final String location_text;

  final bool $default;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$location_gps = location_gps;
    _resultData['location_gps'] = GeographyToJson(l$location_gps);
    final l$location_text = location_text;
    _resultData['location_text'] = l$location_text;
    final l$$default = $default;
    _resultData['default'] = l$$default;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$location_gps = location_gps;
    final l$location_text = location_text;
    final l$$default = $default;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$location_gps,
      l$location_text,
      l$$default,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$updateSavedLocation$update_saved_location_by_pk) ||
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
    final l$$default = $default;
    final lOther$$default = other.$default;
    if (l$$default != lOther$$default) {
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

extension UtilityExtension$Mutation$updateSavedLocation$update_saved_location_by_pk
    on Mutation$updateSavedLocation$update_saved_location_by_pk {
  CopyWith$Mutation$updateSavedLocation$update_saved_location_by_pk<
          Mutation$updateSavedLocation$update_saved_location_by_pk>
      get copyWith =>
          CopyWith$Mutation$updateSavedLocation$update_saved_location_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateSavedLocation$update_saved_location_by_pk<
    TRes> {
  factory CopyWith$Mutation$updateSavedLocation$update_saved_location_by_pk(
    Mutation$updateSavedLocation$update_saved_location_by_pk instance,
    TRes Function(Mutation$updateSavedLocation$update_saved_location_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$updateSavedLocation$update_saved_location_by_pk;

  factory CopyWith$Mutation$updateSavedLocation$update_saved_location_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateSavedLocation$update_saved_location_by_pk;

  TRes call({
    int? id,
    String? name,
    Geography? location_gps,
    String? location_text,
    bool? $default,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$updateSavedLocation$update_saved_location_by_pk<
        TRes>
    implements
        CopyWith$Mutation$updateSavedLocation$update_saved_location_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$updateSavedLocation$update_saved_location_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$updateSavedLocation$update_saved_location_by_pk _instance;

  final TRes Function(Mutation$updateSavedLocation$update_saved_location_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? location_gps = _undefined,
    Object? location_text = _undefined,
    Object? $default = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateSavedLocation$update_saved_location_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        location_gps: location_gps == _undefined || location_gps == null
            ? _instance.location_gps
            : (location_gps as Geography),
        location_text: location_text == _undefined || location_text == null
            ? _instance.location_text
            : (location_text as String),
        $default: $default == _undefined || $default == null
            ? _instance.$default
            : ($default as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$updateSavedLocation$update_saved_location_by_pk<
        TRes>
    implements
        CopyWith$Mutation$updateSavedLocation$update_saved_location_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$updateSavedLocation$update_saved_location_by_pk(
      this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    Geography? location_gps,
    String? location_text,
    bool? $default,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$deleteSavedLocation {
  factory Variables$Mutation$deleteSavedLocation({required int location_id}) =>
      Variables$Mutation$deleteSavedLocation._({
        r'location_id': location_id,
      });

  Variables$Mutation$deleteSavedLocation._(this._$data);

  factory Variables$Mutation$deleteSavedLocation.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$location_id = data['location_id'];
    result$data['location_id'] = (l$location_id as int);
    return Variables$Mutation$deleteSavedLocation._(result$data);
  }

  Map<String, dynamic> _$data;

  int get location_id => (_$data['location_id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$location_id = location_id;
    result$data['location_id'] = l$location_id;
    return result$data;
  }

  CopyWith$Variables$Mutation$deleteSavedLocation<
          Variables$Mutation$deleteSavedLocation>
      get copyWith => CopyWith$Variables$Mutation$deleteSavedLocation(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$deleteSavedLocation) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$location_id = location_id;
    final lOther$location_id = other.location_id;
    if (l$location_id != lOther$location_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$location_id = location_id;
    return Object.hashAll([l$location_id]);
  }
}

abstract class CopyWith$Variables$Mutation$deleteSavedLocation<TRes> {
  factory CopyWith$Variables$Mutation$deleteSavedLocation(
    Variables$Mutation$deleteSavedLocation instance,
    TRes Function(Variables$Mutation$deleteSavedLocation) then,
  ) = _CopyWithImpl$Variables$Mutation$deleteSavedLocation;

  factory CopyWith$Variables$Mutation$deleteSavedLocation.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$deleteSavedLocation;

  TRes call({int? location_id});
}

class _CopyWithImpl$Variables$Mutation$deleteSavedLocation<TRes>
    implements CopyWith$Variables$Mutation$deleteSavedLocation<TRes> {
  _CopyWithImpl$Variables$Mutation$deleteSavedLocation(
    this._instance,
    this._then,
  );

  final Variables$Mutation$deleteSavedLocation _instance;

  final TRes Function(Variables$Mutation$deleteSavedLocation) _then;

  static const _undefined = {};

  TRes call({Object? location_id = _undefined}) =>
      _then(Variables$Mutation$deleteSavedLocation._({
        ..._instance._$data,
        if (location_id != _undefined && location_id != null)
          'location_id': (location_id as int),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$deleteSavedLocation<TRes>
    implements CopyWith$Variables$Mutation$deleteSavedLocation<TRes> {
  _CopyWithStubImpl$Variables$Mutation$deleteSavedLocation(this._res);

  TRes _res;

  call({int? location_id}) => _res;
}

class Mutation$deleteSavedLocation {
  Mutation$deleteSavedLocation({
    this.delete_saved_location_by_pk,
    required this.$__typename,
  });

  factory Mutation$deleteSavedLocation.fromJson(Map<String, dynamic> json) {
    final l$delete_saved_location_by_pk = json['delete_saved_location_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$deleteSavedLocation(
      delete_saved_location_by_pk: l$delete_saved_location_by_pk == null
          ? null
          : Mutation$deleteSavedLocation$delete_saved_location_by_pk.fromJson(
              (l$delete_saved_location_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$deleteSavedLocation$delete_saved_location_by_pk?
      delete_saved_location_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delete_saved_location_by_pk = delete_saved_location_by_pk;
    _resultData['delete_saved_location_by_pk'] =
        l$delete_saved_location_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delete_saved_location_by_pk = delete_saved_location_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$delete_saved_location_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$deleteSavedLocation) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delete_saved_location_by_pk = delete_saved_location_by_pk;
    final lOther$delete_saved_location_by_pk =
        other.delete_saved_location_by_pk;
    if (l$delete_saved_location_by_pk != lOther$delete_saved_location_by_pk) {
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

extension UtilityExtension$Mutation$deleteSavedLocation
    on Mutation$deleteSavedLocation {
  CopyWith$Mutation$deleteSavedLocation<Mutation$deleteSavedLocation>
      get copyWith => CopyWith$Mutation$deleteSavedLocation(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$deleteSavedLocation<TRes> {
  factory CopyWith$Mutation$deleteSavedLocation(
    Mutation$deleteSavedLocation instance,
    TRes Function(Mutation$deleteSavedLocation) then,
  ) = _CopyWithImpl$Mutation$deleteSavedLocation;

  factory CopyWith$Mutation$deleteSavedLocation.stub(TRes res) =
      _CopyWithStubImpl$Mutation$deleteSavedLocation;

  TRes call({
    Mutation$deleteSavedLocation$delete_saved_location_by_pk?
        delete_saved_location_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$deleteSavedLocation$delete_saved_location_by_pk<TRes>
      get delete_saved_location_by_pk;
}

class _CopyWithImpl$Mutation$deleteSavedLocation<TRes>
    implements CopyWith$Mutation$deleteSavedLocation<TRes> {
  _CopyWithImpl$Mutation$deleteSavedLocation(
    this._instance,
    this._then,
  );

  final Mutation$deleteSavedLocation _instance;

  final TRes Function(Mutation$deleteSavedLocation) _then;

  static const _undefined = {};

  TRes call({
    Object? delete_saved_location_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$deleteSavedLocation(
        delete_saved_location_by_pk: delete_saved_location_by_pk == _undefined
            ? _instance.delete_saved_location_by_pk
            : (delete_saved_location_by_pk
                as Mutation$deleteSavedLocation$delete_saved_location_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$deleteSavedLocation$delete_saved_location_by_pk<TRes>
      get delete_saved_location_by_pk {
    final local$delete_saved_location_by_pk =
        _instance.delete_saved_location_by_pk;
    return local$delete_saved_location_by_pk == null
        ? CopyWith$Mutation$deleteSavedLocation$delete_saved_location_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$deleteSavedLocation$delete_saved_location_by_pk(
            local$delete_saved_location_by_pk,
            (e) => call(delete_saved_location_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$deleteSavedLocation<TRes>
    implements CopyWith$Mutation$deleteSavedLocation<TRes> {
  _CopyWithStubImpl$Mutation$deleteSavedLocation(this._res);

  TRes _res;

  call({
    Mutation$deleteSavedLocation$delete_saved_location_by_pk?
        delete_saved_location_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$deleteSavedLocation$delete_saved_location_by_pk<TRes>
      get delete_saved_location_by_pk =>
          CopyWith$Mutation$deleteSavedLocation$delete_saved_location_by_pk
              .stub(_res);
}

const documentNodeMutationdeleteSavedLocation = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'deleteSavedLocation'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'location_id')),
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
        name: NameNode(value: 'delete_saved_location_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'location_id')),
          )
        ],
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
      
    ]),
  ),
]);
Mutation$deleteSavedLocation _parserFn$Mutation$deleteSavedLocation(
        Map<String, dynamic> data) =>
    Mutation$deleteSavedLocation.fromJson(data);
typedef OnMutationCompleted$Mutation$deleteSavedLocation = FutureOr<void>
    Function(
  dynamic,
  Mutation$deleteSavedLocation?,
);

class Options$Mutation$deleteSavedLocation
    extends graphql.MutationOptions<Mutation$deleteSavedLocation> {
  Options$Mutation$deleteSavedLocation({
    String? operationName,
    required Variables$Mutation$deleteSavedLocation variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$deleteSavedLocation? onCompleted,
    graphql.OnMutationUpdate<Mutation$deleteSavedLocation>? update,
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
                        : _parserFn$Mutation$deleteSavedLocation(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationdeleteSavedLocation,
          parserFn: _parserFn$Mutation$deleteSavedLocation,
        );

  final OnMutationCompleted$Mutation$deleteSavedLocation? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$deleteSavedLocation
    extends graphql.WatchQueryOptions<Mutation$deleteSavedLocation> {
  WatchOptions$Mutation$deleteSavedLocation({
    String? operationName,
    required Variables$Mutation$deleteSavedLocation variables,
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
          document: documentNodeMutationdeleteSavedLocation,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$deleteSavedLocation,
        );
}

extension ClientExtension$Mutation$deleteSavedLocation
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$deleteSavedLocation>>
      mutate$deleteSavedLocation(
              Options$Mutation$deleteSavedLocation options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$deleteSavedLocation>
      watchMutation$deleteSavedLocation(
              WatchOptions$Mutation$deleteSavedLocation options) =>
          this.watchMutation(options);
}

class Mutation$deleteSavedLocation$delete_saved_location_by_pk {
  Mutation$deleteSavedLocation$delete_saved_location_by_pk({
    required this.name,
    required this.$__typename,
  });

  factory Mutation$deleteSavedLocation$delete_saved_location_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Mutation$deleteSavedLocation$delete_saved_location_by_pk(
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
    if (!(other is Mutation$deleteSavedLocation$delete_saved_location_by_pk) ||
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

extension UtilityExtension$Mutation$deleteSavedLocation$delete_saved_location_by_pk
    on Mutation$deleteSavedLocation$delete_saved_location_by_pk {
  CopyWith$Mutation$deleteSavedLocation$delete_saved_location_by_pk<
          Mutation$deleteSavedLocation$delete_saved_location_by_pk>
      get copyWith =>
          CopyWith$Mutation$deleteSavedLocation$delete_saved_location_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$deleteSavedLocation$delete_saved_location_by_pk<
    TRes> {
  factory CopyWith$Mutation$deleteSavedLocation$delete_saved_location_by_pk(
    Mutation$deleteSavedLocation$delete_saved_location_by_pk instance,
    TRes Function(Mutation$deleteSavedLocation$delete_saved_location_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$deleteSavedLocation$delete_saved_location_by_pk;

  factory CopyWith$Mutation$deleteSavedLocation$delete_saved_location_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$deleteSavedLocation$delete_saved_location_by_pk;

  TRes call({
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$deleteSavedLocation$delete_saved_location_by_pk<
        TRes>
    implements
        CopyWith$Mutation$deleteSavedLocation$delete_saved_location_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$deleteSavedLocation$delete_saved_location_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$deleteSavedLocation$delete_saved_location_by_pk _instance;

  final TRes Function(Mutation$deleteSavedLocation$delete_saved_location_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$deleteSavedLocation$delete_saved_location_by_pk(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$deleteSavedLocation$delete_saved_location_by_pk<
        TRes>
    implements
        CopyWith$Mutation$deleteSavedLocation$delete_saved_location_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$deleteSavedLocation$delete_saved_location_by_pk(
      this._res);

  TRes _res;

  call({
    String? name,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$addSavedLocation {
  factory Variables$Mutation$addSavedLocation(
          {required Input$saved_location_insert_input saved_location}) =>
      Variables$Mutation$addSavedLocation._({
        r'saved_location': saved_location,
      });

  Variables$Mutation$addSavedLocation._(this._$data);

  factory Variables$Mutation$addSavedLocation.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$saved_location = data['saved_location'];
    result$data['saved_location'] = Input$saved_location_insert_input.fromJson(
        (l$saved_location as Map<String, dynamic>));
    return Variables$Mutation$addSavedLocation._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$saved_location_insert_input get saved_location =>
      (_$data['saved_location'] as Input$saved_location_insert_input);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$saved_location = saved_location;
    result$data['saved_location'] = l$saved_location.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$addSavedLocation<
          Variables$Mutation$addSavedLocation>
      get copyWith => CopyWith$Variables$Mutation$addSavedLocation(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$addSavedLocation) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$saved_location = saved_location;
    final lOther$saved_location = other.saved_location;
    if (l$saved_location != lOther$saved_location) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$saved_location = saved_location;
    return Object.hashAll([l$saved_location]);
  }
}

abstract class CopyWith$Variables$Mutation$addSavedLocation<TRes> {
  factory CopyWith$Variables$Mutation$addSavedLocation(
    Variables$Mutation$addSavedLocation instance,
    TRes Function(Variables$Mutation$addSavedLocation) then,
  ) = _CopyWithImpl$Variables$Mutation$addSavedLocation;

  factory CopyWith$Variables$Mutation$addSavedLocation.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$addSavedLocation;

  TRes call({Input$saved_location_insert_input? saved_location});
}

class _CopyWithImpl$Variables$Mutation$addSavedLocation<TRes>
    implements CopyWith$Variables$Mutation$addSavedLocation<TRes> {
  _CopyWithImpl$Variables$Mutation$addSavedLocation(
    this._instance,
    this._then,
  );

  final Variables$Mutation$addSavedLocation _instance;

  final TRes Function(Variables$Mutation$addSavedLocation) _then;

  static const _undefined = {};

  TRes call({Object? saved_location = _undefined}) =>
      _then(Variables$Mutation$addSavedLocation._({
        ..._instance._$data,
        if (saved_location != _undefined && saved_location != null)
          'saved_location':
              (saved_location as Input$saved_location_insert_input),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$addSavedLocation<TRes>
    implements CopyWith$Variables$Mutation$addSavedLocation<TRes> {
  _CopyWithStubImpl$Variables$Mutation$addSavedLocation(this._res);

  TRes _res;

  call({Input$saved_location_insert_input? saved_location}) => _res;
}

class Mutation$addSavedLocation {
  Mutation$addSavedLocation({
    this.insert_saved_location_one,
    required this.$__typename,
  });

  factory Mutation$addSavedLocation.fromJson(Map<String, dynamic> json) {
    final l$insert_saved_location_one = json['insert_saved_location_one'];
    final l$$__typename = json['__typename'];
    return Mutation$addSavedLocation(
      insert_saved_location_one: l$insert_saved_location_one == null
          ? null
          : Mutation$addSavedLocation$insert_saved_location_one.fromJson(
              (l$insert_saved_location_one as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$addSavedLocation$insert_saved_location_one?
      insert_saved_location_one;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insert_saved_location_one = insert_saved_location_one;
    _resultData['insert_saved_location_one'] =
        l$insert_saved_location_one?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insert_saved_location_one = insert_saved_location_one;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$insert_saved_location_one,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$addSavedLocation) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$insert_saved_location_one = insert_saved_location_one;
    final lOther$insert_saved_location_one = other.insert_saved_location_one;
    if (l$insert_saved_location_one != lOther$insert_saved_location_one) {
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

extension UtilityExtension$Mutation$addSavedLocation
    on Mutation$addSavedLocation {
  CopyWith$Mutation$addSavedLocation<Mutation$addSavedLocation> get copyWith =>
      CopyWith$Mutation$addSavedLocation(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$addSavedLocation<TRes> {
  factory CopyWith$Mutation$addSavedLocation(
    Mutation$addSavedLocation instance,
    TRes Function(Mutation$addSavedLocation) then,
  ) = _CopyWithImpl$Mutation$addSavedLocation;

  factory CopyWith$Mutation$addSavedLocation.stub(TRes res) =
      _CopyWithStubImpl$Mutation$addSavedLocation;

  TRes call({
    Mutation$addSavedLocation$insert_saved_location_one?
        insert_saved_location_one,
    String? $__typename,
  });
  CopyWith$Mutation$addSavedLocation$insert_saved_location_one<TRes>
      get insert_saved_location_one;
}

class _CopyWithImpl$Mutation$addSavedLocation<TRes>
    implements CopyWith$Mutation$addSavedLocation<TRes> {
  _CopyWithImpl$Mutation$addSavedLocation(
    this._instance,
    this._then,
  );

  final Mutation$addSavedLocation _instance;

  final TRes Function(Mutation$addSavedLocation) _then;

  static const _undefined = {};

  TRes call({
    Object? insert_saved_location_one = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$addSavedLocation(
        insert_saved_location_one: insert_saved_location_one == _undefined
            ? _instance.insert_saved_location_one
            : (insert_saved_location_one
                as Mutation$addSavedLocation$insert_saved_location_one?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$addSavedLocation$insert_saved_location_one<TRes>
      get insert_saved_location_one {
    final local$insert_saved_location_one = _instance.insert_saved_location_one;
    return local$insert_saved_location_one == null
        ? CopyWith$Mutation$addSavedLocation$insert_saved_location_one.stub(
            _then(_instance))
        : CopyWith$Mutation$addSavedLocation$insert_saved_location_one(
            local$insert_saved_location_one,
            (e) => call(insert_saved_location_one: e));
  }
}

class _CopyWithStubImpl$Mutation$addSavedLocation<TRes>
    implements CopyWith$Mutation$addSavedLocation<TRes> {
  _CopyWithStubImpl$Mutation$addSavedLocation(this._res);

  TRes _res;

  call({
    Mutation$addSavedLocation$insert_saved_location_one?
        insert_saved_location_one,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$addSavedLocation$insert_saved_location_one<TRes>
      get insert_saved_location_one =>
          CopyWith$Mutation$addSavedLocation$insert_saved_location_one.stub(
              _res);
}

const documentNodeMutationaddSavedLocation = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'addSavedLocation'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'saved_location')),
        type: NamedTypeNode(
          name: NameNode(value: 'saved_location_insert_input'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'insert_saved_location_one'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'object'),
            value: VariableNode(name: NameNode(value: 'saved_location')),
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
Mutation$addSavedLocation _parserFn$Mutation$addSavedLocation(
        Map<String, dynamic> data) =>
    Mutation$addSavedLocation.fromJson(data);
typedef OnMutationCompleted$Mutation$addSavedLocation = FutureOr<void> Function(
  dynamic,
  Mutation$addSavedLocation?,
);

class Options$Mutation$addSavedLocation
    extends graphql.MutationOptions<Mutation$addSavedLocation> {
  Options$Mutation$addSavedLocation({
    String? operationName,
    required Variables$Mutation$addSavedLocation variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$addSavedLocation? onCompleted,
    graphql.OnMutationUpdate<Mutation$addSavedLocation>? update,
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
                        : _parserFn$Mutation$addSavedLocation(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationaddSavedLocation,
          parserFn: _parserFn$Mutation$addSavedLocation,
        );

  final OnMutationCompleted$Mutation$addSavedLocation? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$addSavedLocation
    extends graphql.WatchQueryOptions<Mutation$addSavedLocation> {
  WatchOptions$Mutation$addSavedLocation({
    String? operationName,
    required Variables$Mutation$addSavedLocation variables,
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
          document: documentNodeMutationaddSavedLocation,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$addSavedLocation,
        );
}

extension ClientExtension$Mutation$addSavedLocation on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$addSavedLocation>>
      mutate$addSavedLocation(
              Options$Mutation$addSavedLocation options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$addSavedLocation>
      watchMutation$addSavedLocation(
              WatchOptions$Mutation$addSavedLocation options) =>
          this.watchMutation(options);
}

class Mutation$addSavedLocation$insert_saved_location_one {
  Mutation$addSavedLocation$insert_saved_location_one({
    required this.id,
    required this.$__typename,
  });

  factory Mutation$addSavedLocation$insert_saved_location_one.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$addSavedLocation$insert_saved_location_one(
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
    if (!(other is Mutation$addSavedLocation$insert_saved_location_one) ||
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

extension UtilityExtension$Mutation$addSavedLocation$insert_saved_location_one
    on Mutation$addSavedLocation$insert_saved_location_one {
  CopyWith$Mutation$addSavedLocation$insert_saved_location_one<
          Mutation$addSavedLocation$insert_saved_location_one>
      get copyWith =>
          CopyWith$Mutation$addSavedLocation$insert_saved_location_one(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$addSavedLocation$insert_saved_location_one<
    TRes> {
  factory CopyWith$Mutation$addSavedLocation$insert_saved_location_one(
    Mutation$addSavedLocation$insert_saved_location_one instance,
    TRes Function(Mutation$addSavedLocation$insert_saved_location_one) then,
  ) = _CopyWithImpl$Mutation$addSavedLocation$insert_saved_location_one;

  factory CopyWith$Mutation$addSavedLocation$insert_saved_location_one.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$addSavedLocation$insert_saved_location_one;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$addSavedLocation$insert_saved_location_one<TRes>
    implements
        CopyWith$Mutation$addSavedLocation$insert_saved_location_one<TRes> {
  _CopyWithImpl$Mutation$addSavedLocation$insert_saved_location_one(
    this._instance,
    this._then,
  );

  final Mutation$addSavedLocation$insert_saved_location_one _instance;

  final TRes Function(Mutation$addSavedLocation$insert_saved_location_one)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$addSavedLocation$insert_saved_location_one(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$addSavedLocation$insert_saved_location_one<
        TRes>
    implements
        CopyWith$Mutation$addSavedLocation$insert_saved_location_one<TRes> {
  _CopyWithStubImpl$Mutation$addSavedLocation$insert_saved_location_one(
      this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}
