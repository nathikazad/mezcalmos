import '../../__generated/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Variables$Query$get_customer_locations {
  factory Variables$Query$get_customer_locations({required int customer_id}) =>
      Variables$Query$get_customer_locations._({
        r'customer_id': customer_id,
      });

  Variables$Query$get_customer_locations._(this._$data);

  factory Variables$Query$get_customer_locations.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$customer_id = data['customer_id'];
    result$data['customer_id'] = (l$customer_id as int);
    return Variables$Query$get_customer_locations._(result$data);
  }

  Map<String, dynamic> _$data;

  int get customer_id => (_$data['customer_id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$customer_id = customer_id;
    result$data['customer_id'] = l$customer_id;
    return result$data;
  }

  CopyWith$Variables$Query$get_customer_locations<
          Variables$Query$get_customer_locations>
      get copyWith => CopyWith$Variables$Query$get_customer_locations(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_customer_locations) ||
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

abstract class CopyWith$Variables$Query$get_customer_locations<TRes> {
  factory CopyWith$Variables$Query$get_customer_locations(
    Variables$Query$get_customer_locations instance,
    TRes Function(Variables$Query$get_customer_locations) then,
  ) = _CopyWithImpl$Variables$Query$get_customer_locations;

  factory CopyWith$Variables$Query$get_customer_locations.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$get_customer_locations;

  TRes call({int? customer_id});
}

class _CopyWithImpl$Variables$Query$get_customer_locations<TRes>
    implements CopyWith$Variables$Query$get_customer_locations<TRes> {
  _CopyWithImpl$Variables$Query$get_customer_locations(
    this._instance,
    this._then,
  );

  final Variables$Query$get_customer_locations _instance;

  final TRes Function(Variables$Query$get_customer_locations) _then;

  static const _undefined = {};

  TRes call({Object? customer_id = _undefined}) =>
      _then(Variables$Query$get_customer_locations._({
        ..._instance._$data,
        if (customer_id != _undefined && customer_id != null)
          'customer_id': (customer_id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_customer_locations<TRes>
    implements CopyWith$Variables$Query$get_customer_locations<TRes> {
  _CopyWithStubImpl$Variables$Query$get_customer_locations(this._res);

  TRes _res;

  call({int? customer_id}) => _res;
}

class Query$get_customer_locations {
  Query$get_customer_locations({
    required this.customer_saved_location,
    required this.$__typename,
  });

  factory Query$get_customer_locations.fromJson(Map<String, dynamic> json) {
    final l$customer_saved_location = json['customer_saved_location'];
    final l$$__typename = json['__typename'];
    return Query$get_customer_locations(
      customer_saved_location: (l$customer_saved_location as List<dynamic>)
          .map((e) =>
              Query$get_customer_locations$customer_saved_location.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$get_customer_locations$customer_saved_location>
      customer_saved_location;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$customer_saved_location = customer_saved_location;
    _resultData['customer_saved_location'] =
        l$customer_saved_location.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$customer_saved_location = customer_saved_location;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$customer_saved_location.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_customer_locations) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$customer_saved_location = customer_saved_location;
    final lOther$customer_saved_location = other.customer_saved_location;
    if (l$customer_saved_location.length !=
        lOther$customer_saved_location.length) {
      return false;
    }
    for (int i = 0; i < l$customer_saved_location.length; i++) {
      final l$customer_saved_location$entry = l$customer_saved_location[i];
      final lOther$customer_saved_location$entry =
          lOther$customer_saved_location[i];
      if (l$customer_saved_location$entry !=
          lOther$customer_saved_location$entry) {
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

extension UtilityExtension$Query$get_customer_locations
    on Query$get_customer_locations {
  CopyWith$Query$get_customer_locations<Query$get_customer_locations>
      get copyWith => CopyWith$Query$get_customer_locations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_customer_locations<TRes> {
  factory CopyWith$Query$get_customer_locations(
    Query$get_customer_locations instance,
    TRes Function(Query$get_customer_locations) then,
  ) = _CopyWithImpl$Query$get_customer_locations;

  factory CopyWith$Query$get_customer_locations.stub(TRes res) =
      _CopyWithStubImpl$Query$get_customer_locations;

  TRes call({
    List<Query$get_customer_locations$customer_saved_location>?
        customer_saved_location,
    String? $__typename,
  });
  TRes customer_saved_location(
      Iterable<Query$get_customer_locations$customer_saved_location> Function(
              Iterable<
                  CopyWith$Query$get_customer_locations$customer_saved_location<
                      Query$get_customer_locations$customer_saved_location>>)
          _fn);
}

class _CopyWithImpl$Query$get_customer_locations<TRes>
    implements CopyWith$Query$get_customer_locations<TRes> {
  _CopyWithImpl$Query$get_customer_locations(
    this._instance,
    this._then,
  );

  final Query$get_customer_locations _instance;

  final TRes Function(Query$get_customer_locations) _then;

  static const _undefined = {};

  TRes call({
    Object? customer_saved_location = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_customer_locations(
        customer_saved_location: customer_saved_location == _undefined ||
                customer_saved_location == null
            ? _instance.customer_saved_location
            : (customer_saved_location
                as List<Query$get_customer_locations$customer_saved_location>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes customer_saved_location(
          Iterable<Query$get_customer_locations$customer_saved_location> Function(
                  Iterable<
                      CopyWith$Query$get_customer_locations$customer_saved_location<
                          Query$get_customer_locations$customer_saved_location>>)
              _fn) =>
      call(
          customer_saved_location: _fn(_instance.customer_saved_location.map(
              (e) =>
                  CopyWith$Query$get_customer_locations$customer_saved_location(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$get_customer_locations<TRes>
    implements CopyWith$Query$get_customer_locations<TRes> {
  _CopyWithStubImpl$Query$get_customer_locations(this._res);

  TRes _res;

  call({
    List<Query$get_customer_locations$customer_saved_location>?
        customer_saved_location,
    String? $__typename,
  }) =>
      _res;
  customer_saved_location(_fn) => _res;
}

const documentNodeQueryget_customer_locations = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_customer_locations'),
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
        name: NameNode(value: 'customer_saved_location'),
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
Query$get_customer_locations _parserFn$Query$get_customer_locations(
        Map<String, dynamic> data) =>
    Query$get_customer_locations.fromJson(data);

class Options$Query$get_customer_locations
    extends graphql.QueryOptions<Query$get_customer_locations> {
  Options$Query$get_customer_locations({
    String? operationName,
    required Variables$Query$get_customer_locations variables,
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
          document: documentNodeQueryget_customer_locations,
          parserFn: _parserFn$Query$get_customer_locations,
        );
}

class WatchOptions$Query$get_customer_locations
    extends graphql.WatchQueryOptions<Query$get_customer_locations> {
  WatchOptions$Query$get_customer_locations({
    String? operationName,
    required Variables$Query$get_customer_locations variables,
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
          document: documentNodeQueryget_customer_locations,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_customer_locations,
        );
}

class FetchMoreOptions$Query$get_customer_locations
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_customer_locations({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_customer_locations variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_customer_locations,
        );
}

extension ClientExtension$Query$get_customer_locations
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_customer_locations>>
      query$get_customer_locations(
              Options$Query$get_customer_locations options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$get_customer_locations>
      watchQuery$get_customer_locations(
              WatchOptions$Query$get_customer_locations options) =>
          this.watchQuery(options);
  void writeQuery$get_customer_locations({
    required Query$get_customer_locations data,
    required Variables$Query$get_customer_locations variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryget_customer_locations),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_customer_locations? readQuery$get_customer_locations({
    required Variables$Query$get_customer_locations variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryget_customer_locations),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$get_customer_locations.fromJson(result);
  }
}

class Query$get_customer_locations$customer_saved_location {
  Query$get_customer_locations$customer_saved_location({
    required this.id,
    required this.name,
    required this.location_gps,
    required this.location_text,
    required this.$default,
    required this.$__typename,
  });

  factory Query$get_customer_locations$customer_saved_location.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$location_gps = json['location_gps'];
    final l$location_text = json['location_text'];
    final l$$default = json['default'];
    final l$$__typename = json['__typename'];
    return Query$get_customer_locations$customer_saved_location(
      id: (l$id as int),
      name: (l$name as String),
      location_gps: geographyFromJson(l$location_gps),
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
    _resultData['location_gps'] = geographyToJson(l$location_gps);
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
    if (!(other is Query$get_customer_locations$customer_saved_location) ||
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

extension UtilityExtension$Query$get_customer_locations$customer_saved_location
    on Query$get_customer_locations$customer_saved_location {
  CopyWith$Query$get_customer_locations$customer_saved_location<
          Query$get_customer_locations$customer_saved_location>
      get copyWith =>
          CopyWith$Query$get_customer_locations$customer_saved_location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_customer_locations$customer_saved_location<
    TRes> {
  factory CopyWith$Query$get_customer_locations$customer_saved_location(
    Query$get_customer_locations$customer_saved_location instance,
    TRes Function(Query$get_customer_locations$customer_saved_location) then,
  ) = _CopyWithImpl$Query$get_customer_locations$customer_saved_location;

  factory CopyWith$Query$get_customer_locations$customer_saved_location.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_customer_locations$customer_saved_location;

  TRes call({
    int? id,
    String? name,
    Geography? location_gps,
    String? location_text,
    bool? $default,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_customer_locations$customer_saved_location<TRes>
    implements
        CopyWith$Query$get_customer_locations$customer_saved_location<TRes> {
  _CopyWithImpl$Query$get_customer_locations$customer_saved_location(
    this._instance,
    this._then,
  );

  final Query$get_customer_locations$customer_saved_location _instance;

  final TRes Function(Query$get_customer_locations$customer_saved_location)
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
      _then(Query$get_customer_locations$customer_saved_location(
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

class _CopyWithStubImpl$Query$get_customer_locations$customer_saved_location<
        TRes>
    implements
        CopyWith$Query$get_customer_locations$customer_saved_location<TRes> {
  _CopyWithStubImpl$Query$get_customer_locations$customer_saved_location(
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

class Variables$Subscription$listen_on_saved_locations {
  factory Variables$Subscription$listen_on_saved_locations(
          {required int customer_id}) =>
      Variables$Subscription$listen_on_saved_locations._({
        r'customer_id': customer_id,
      });

  Variables$Subscription$listen_on_saved_locations._(this._$data);

  factory Variables$Subscription$listen_on_saved_locations.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$customer_id = data['customer_id'];
    result$data['customer_id'] = (l$customer_id as int);
    return Variables$Subscription$listen_on_saved_locations._(result$data);
  }

  Map<String, dynamic> _$data;

  int get customer_id => (_$data['customer_id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$customer_id = customer_id;
    result$data['customer_id'] = l$customer_id;
    return result$data;
  }

  CopyWith$Variables$Subscription$listen_on_saved_locations<
          Variables$Subscription$listen_on_saved_locations>
      get copyWith => CopyWith$Variables$Subscription$listen_on_saved_locations(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Subscription$listen_on_saved_locations) ||
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

abstract class CopyWith$Variables$Subscription$listen_on_saved_locations<TRes> {
  factory CopyWith$Variables$Subscription$listen_on_saved_locations(
    Variables$Subscription$listen_on_saved_locations instance,
    TRes Function(Variables$Subscription$listen_on_saved_locations) then,
  ) = _CopyWithImpl$Variables$Subscription$listen_on_saved_locations;

  factory CopyWith$Variables$Subscription$listen_on_saved_locations.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Subscription$listen_on_saved_locations;

  TRes call({int? customer_id});
}

class _CopyWithImpl$Variables$Subscription$listen_on_saved_locations<TRes>
    implements CopyWith$Variables$Subscription$listen_on_saved_locations<TRes> {
  _CopyWithImpl$Variables$Subscription$listen_on_saved_locations(
    this._instance,
    this._then,
  );

  final Variables$Subscription$listen_on_saved_locations _instance;

  final TRes Function(Variables$Subscription$listen_on_saved_locations) _then;

  static const _undefined = {};

  TRes call({Object? customer_id = _undefined}) =>
      _then(Variables$Subscription$listen_on_saved_locations._({
        ..._instance._$data,
        if (customer_id != _undefined && customer_id != null)
          'customer_id': (customer_id as int),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$listen_on_saved_locations<TRes>
    implements CopyWith$Variables$Subscription$listen_on_saved_locations<TRes> {
  _CopyWithStubImpl$Variables$Subscription$listen_on_saved_locations(this._res);

  TRes _res;

  call({int? customer_id}) => _res;
}

class Subscription$listen_on_saved_locations {
  Subscription$listen_on_saved_locations({
    required this.customer_saved_location,
    required this.$__typename,
  });

  factory Subscription$listen_on_saved_locations.fromJson(
      Map<String, dynamic> json) {
    final l$customer_saved_location = json['customer_saved_location'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_saved_locations(
      customer_saved_location: (l$customer_saved_location as List<dynamic>)
          .map((e) =>
              Subscription$listen_on_saved_locations$customer_saved_location
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Subscription$listen_on_saved_locations$customer_saved_location>
      customer_saved_location;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$customer_saved_location = customer_saved_location;
    _resultData['customer_saved_location'] =
        l$customer_saved_location.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$customer_saved_location = customer_saved_location;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$customer_saved_location.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$listen_on_saved_locations) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$customer_saved_location = customer_saved_location;
    final lOther$customer_saved_location = other.customer_saved_location;
    if (l$customer_saved_location.length !=
        lOther$customer_saved_location.length) {
      return false;
    }
    for (int i = 0; i < l$customer_saved_location.length; i++) {
      final l$customer_saved_location$entry = l$customer_saved_location[i];
      final lOther$customer_saved_location$entry =
          lOther$customer_saved_location[i];
      if (l$customer_saved_location$entry !=
          lOther$customer_saved_location$entry) {
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

extension UtilityExtension$Subscription$listen_on_saved_locations
    on Subscription$listen_on_saved_locations {
  CopyWith$Subscription$listen_on_saved_locations<
          Subscription$listen_on_saved_locations>
      get copyWith => CopyWith$Subscription$listen_on_saved_locations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_saved_locations<TRes> {
  factory CopyWith$Subscription$listen_on_saved_locations(
    Subscription$listen_on_saved_locations instance,
    TRes Function(Subscription$listen_on_saved_locations) then,
  ) = _CopyWithImpl$Subscription$listen_on_saved_locations;

  factory CopyWith$Subscription$listen_on_saved_locations.stub(TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_saved_locations;

  TRes call({
    List<Subscription$listen_on_saved_locations$customer_saved_location>?
        customer_saved_location,
    String? $__typename,
  });
  TRes customer_saved_location(
      Iterable<Subscription$listen_on_saved_locations$customer_saved_location> Function(
              Iterable<
                  CopyWith$Subscription$listen_on_saved_locations$customer_saved_location<
                      Subscription$listen_on_saved_locations$customer_saved_location>>)
          _fn);
}

class _CopyWithImpl$Subscription$listen_on_saved_locations<TRes>
    implements CopyWith$Subscription$listen_on_saved_locations<TRes> {
  _CopyWithImpl$Subscription$listen_on_saved_locations(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_saved_locations _instance;

  final TRes Function(Subscription$listen_on_saved_locations) _then;

  static const _undefined = {};

  TRes call({
    Object? customer_saved_location = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listen_on_saved_locations(
        customer_saved_location: customer_saved_location == _undefined ||
                customer_saved_location == null
            ? _instance.customer_saved_location
            : (customer_saved_location as List<
                Subscription$listen_on_saved_locations$customer_saved_location>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes customer_saved_location(
          Iterable<Subscription$listen_on_saved_locations$customer_saved_location> Function(
                  Iterable<
                      CopyWith$Subscription$listen_on_saved_locations$customer_saved_location<
                          Subscription$listen_on_saved_locations$customer_saved_location>>)
              _fn) =>
      call(
          customer_saved_location: _fn(_instance.customer_saved_location.map((e) =>
              CopyWith$Subscription$listen_on_saved_locations$customer_saved_location(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$listen_on_saved_locations<TRes>
    implements CopyWith$Subscription$listen_on_saved_locations<TRes> {
  _CopyWithStubImpl$Subscription$listen_on_saved_locations(this._res);

  TRes _res;

  call({
    List<Subscription$listen_on_saved_locations$customer_saved_location>?
        customer_saved_location,
    String? $__typename,
  }) =>
      _res;
  customer_saved_location(_fn) => _res;
}

const documentNodeSubscriptionlisten_on_saved_locations =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'listen_on_saved_locations'),
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
        name: NameNode(value: 'customer_saved_location'),
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
Subscription$listen_on_saved_locations
    _parserFn$Subscription$listen_on_saved_locations(
            Map<String, dynamic> data) =>
        Subscription$listen_on_saved_locations.fromJson(data);

class Options$Subscription$listen_on_saved_locations extends graphql
    .SubscriptionOptions<Subscription$listen_on_saved_locations> {
  Options$Subscription$listen_on_saved_locations({
    String? operationName,
    required Variables$Subscription$listen_on_saved_locations variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeSubscriptionlisten_on_saved_locations,
          parserFn: _parserFn$Subscription$listen_on_saved_locations,
        );
}

class WatchOptions$Subscription$listen_on_saved_locations
    extends graphql.WatchQueryOptions<Subscription$listen_on_saved_locations> {
  WatchOptions$Subscription$listen_on_saved_locations({
    String? operationName,
    required Variables$Subscription$listen_on_saved_locations variables,
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
          document: documentNodeSubscriptionlisten_on_saved_locations,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$listen_on_saved_locations,
        );
}

class FetchMoreOptions$Subscription$listen_on_saved_locations
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$listen_on_saved_locations({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$listen_on_saved_locations variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptionlisten_on_saved_locations,
        );
}

extension ClientExtension$Subscription$listen_on_saved_locations
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$listen_on_saved_locations>>
      subscribe$listen_on_saved_locations(
              Options$Subscription$listen_on_saved_locations options) =>
          this.subscribe(options);
  graphql.ObservableQuery<Subscription$listen_on_saved_locations>
      watchSubscription$listen_on_saved_locations(
              WatchOptions$Subscription$listen_on_saved_locations options) =>
          this.watchQuery(options);
}

class Subscription$listen_on_saved_locations$customer_saved_location {
  Subscription$listen_on_saved_locations$customer_saved_location({
    required this.id,
    required this.name,
    required this.location_gps,
    required this.location_text,
    required this.$default,
    required this.$__typename,
  });

  factory Subscription$listen_on_saved_locations$customer_saved_location.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$location_gps = json['location_gps'];
    final l$location_text = json['location_text'];
    final l$$default = json['default'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_saved_locations$customer_saved_location(
      id: (l$id as int),
      name: (l$name as String),
      location_gps: geographyFromJson(l$location_gps),
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
    _resultData['location_gps'] = geographyToJson(l$location_gps);
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
    if (!(other
            is Subscription$listen_on_saved_locations$customer_saved_location) ||
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

extension UtilityExtension$Subscription$listen_on_saved_locations$customer_saved_location
    on Subscription$listen_on_saved_locations$customer_saved_location {
  CopyWith$Subscription$listen_on_saved_locations$customer_saved_location<
          Subscription$listen_on_saved_locations$customer_saved_location>
      get copyWith =>
          CopyWith$Subscription$listen_on_saved_locations$customer_saved_location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_saved_locations$customer_saved_location<
    TRes> {
  factory CopyWith$Subscription$listen_on_saved_locations$customer_saved_location(
    Subscription$listen_on_saved_locations$customer_saved_location instance,
    TRes Function(
            Subscription$listen_on_saved_locations$customer_saved_location)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_saved_locations$customer_saved_location;

  factory CopyWith$Subscription$listen_on_saved_locations$customer_saved_location.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_saved_locations$customer_saved_location;

  TRes call({
    int? id,
    String? name,
    Geography? location_gps,
    String? location_text,
    bool? $default,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_saved_locations$customer_saved_location<
        TRes>
    implements
        CopyWith$Subscription$listen_on_saved_locations$customer_saved_location<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_saved_locations$customer_saved_location(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_saved_locations$customer_saved_location
      _instance;

  final TRes Function(
      Subscription$listen_on_saved_locations$customer_saved_location) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? location_gps = _undefined,
    Object? location_text = _undefined,
    Object? $default = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listen_on_saved_locations$customer_saved_location(
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

class _CopyWithStubImpl$Subscription$listen_on_saved_locations$customer_saved_location<
        TRes>
    implements
        CopyWith$Subscription$listen_on_saved_locations$customer_saved_location<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_saved_locations$customer_saved_location(
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

class Variables$Query$get_saved_location_by_id {
  factory Variables$Query$get_saved_location_by_id(
          {required int location_id}) =>
      Variables$Query$get_saved_location_by_id._({
        r'location_id': location_id,
      });

  Variables$Query$get_saved_location_by_id._(this._$data);

  factory Variables$Query$get_saved_location_by_id.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$location_id = data['location_id'];
    result$data['location_id'] = (l$location_id as int);
    return Variables$Query$get_saved_location_by_id._(result$data);
  }

  Map<String, dynamic> _$data;

  int get location_id => (_$data['location_id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$location_id = location_id;
    result$data['location_id'] = l$location_id;
    return result$data;
  }

  CopyWith$Variables$Query$get_saved_location_by_id<
          Variables$Query$get_saved_location_by_id>
      get copyWith => CopyWith$Variables$Query$get_saved_location_by_id(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_saved_location_by_id) ||
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

abstract class CopyWith$Variables$Query$get_saved_location_by_id<TRes> {
  factory CopyWith$Variables$Query$get_saved_location_by_id(
    Variables$Query$get_saved_location_by_id instance,
    TRes Function(Variables$Query$get_saved_location_by_id) then,
  ) = _CopyWithImpl$Variables$Query$get_saved_location_by_id;

  factory CopyWith$Variables$Query$get_saved_location_by_id.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$get_saved_location_by_id;

  TRes call({int? location_id});
}

class _CopyWithImpl$Variables$Query$get_saved_location_by_id<TRes>
    implements CopyWith$Variables$Query$get_saved_location_by_id<TRes> {
  _CopyWithImpl$Variables$Query$get_saved_location_by_id(
    this._instance,
    this._then,
  );

  final Variables$Query$get_saved_location_by_id _instance;

  final TRes Function(Variables$Query$get_saved_location_by_id) _then;

  static const _undefined = {};

  TRes call({Object? location_id = _undefined}) =>
      _then(Variables$Query$get_saved_location_by_id._({
        ..._instance._$data,
        if (location_id != _undefined && location_id != null)
          'location_id': (location_id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_saved_location_by_id<TRes>
    implements CopyWith$Variables$Query$get_saved_location_by_id<TRes> {
  _CopyWithStubImpl$Variables$Query$get_saved_location_by_id(this._res);

  TRes _res;

  call({int? location_id}) => _res;
}

class Query$get_saved_location_by_id {
  Query$get_saved_location_by_id({
    this.customer_saved_location_by_pk,
    required this.$__typename,
  });

  factory Query$get_saved_location_by_id.fromJson(Map<String, dynamic> json) {
    final l$customer_saved_location_by_pk =
        json['customer_saved_location_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$get_saved_location_by_id(
      customer_saved_location_by_pk: l$customer_saved_location_by_pk == null
          ? null
          : Query$get_saved_location_by_id$customer_saved_location_by_pk
              .fromJson(
                  (l$customer_saved_location_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_saved_location_by_id$customer_saved_location_by_pk?
      customer_saved_location_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$customer_saved_location_by_pk = customer_saved_location_by_pk;
    _resultData['customer_saved_location_by_pk'] =
        l$customer_saved_location_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$customer_saved_location_by_pk = customer_saved_location_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$customer_saved_location_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_saved_location_by_id) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$customer_saved_location_by_pk = customer_saved_location_by_pk;
    final lOther$customer_saved_location_by_pk =
        other.customer_saved_location_by_pk;
    if (l$customer_saved_location_by_pk !=
        lOther$customer_saved_location_by_pk) {
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

extension UtilityExtension$Query$get_saved_location_by_id
    on Query$get_saved_location_by_id {
  CopyWith$Query$get_saved_location_by_id<Query$get_saved_location_by_id>
      get copyWith => CopyWith$Query$get_saved_location_by_id(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_saved_location_by_id<TRes> {
  factory CopyWith$Query$get_saved_location_by_id(
    Query$get_saved_location_by_id instance,
    TRes Function(Query$get_saved_location_by_id) then,
  ) = _CopyWithImpl$Query$get_saved_location_by_id;

  factory CopyWith$Query$get_saved_location_by_id.stub(TRes res) =
      _CopyWithStubImpl$Query$get_saved_location_by_id;

  TRes call({
    Query$get_saved_location_by_id$customer_saved_location_by_pk?
        customer_saved_location_by_pk,
    String? $__typename,
  });
  CopyWith$Query$get_saved_location_by_id$customer_saved_location_by_pk<TRes>
      get customer_saved_location_by_pk;
}

class _CopyWithImpl$Query$get_saved_location_by_id<TRes>
    implements CopyWith$Query$get_saved_location_by_id<TRes> {
  _CopyWithImpl$Query$get_saved_location_by_id(
    this._instance,
    this._then,
  );

  final Query$get_saved_location_by_id _instance;

  final TRes Function(Query$get_saved_location_by_id) _then;

  static const _undefined = {};

  TRes call({
    Object? customer_saved_location_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_saved_location_by_id(
        customer_saved_location_by_pk: customer_saved_location_by_pk ==
                _undefined
            ? _instance.customer_saved_location_by_pk
            : (customer_saved_location_by_pk
                as Query$get_saved_location_by_id$customer_saved_location_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_saved_location_by_id$customer_saved_location_by_pk<TRes>
      get customer_saved_location_by_pk {
    final local$customer_saved_location_by_pk =
        _instance.customer_saved_location_by_pk;
    return local$customer_saved_location_by_pk == null
        ? CopyWith$Query$get_saved_location_by_id$customer_saved_location_by_pk
            .stub(_then(_instance))
        : CopyWith$Query$get_saved_location_by_id$customer_saved_location_by_pk(
            local$customer_saved_location_by_pk,
            (e) => call(customer_saved_location_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$get_saved_location_by_id<TRes>
    implements CopyWith$Query$get_saved_location_by_id<TRes> {
  _CopyWithStubImpl$Query$get_saved_location_by_id(this._res);

  TRes _res;

  call({
    Query$get_saved_location_by_id$customer_saved_location_by_pk?
        customer_saved_location_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_saved_location_by_id$customer_saved_location_by_pk<TRes>
      get customer_saved_location_by_pk =>
          CopyWith$Query$get_saved_location_by_id$customer_saved_location_by_pk
              .stub(_res);
}

const documentNodeQueryget_saved_location_by_id = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_saved_location_by_id'),
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
        name: NameNode(value: 'customer_saved_location_by_pk'),
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
Query$get_saved_location_by_id _parserFn$Query$get_saved_location_by_id(
        Map<String, dynamic> data) =>
    Query$get_saved_location_by_id.fromJson(data);

class Options$Query$get_saved_location_by_id
    extends graphql.QueryOptions<Query$get_saved_location_by_id> {
  Options$Query$get_saved_location_by_id({
    String? operationName,
    required Variables$Query$get_saved_location_by_id variables,
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
          document: documentNodeQueryget_saved_location_by_id,
          parserFn: _parserFn$Query$get_saved_location_by_id,
        );
}

class WatchOptions$Query$get_saved_location_by_id
    extends graphql.WatchQueryOptions<Query$get_saved_location_by_id> {
  WatchOptions$Query$get_saved_location_by_id({
    String? operationName,
    required Variables$Query$get_saved_location_by_id variables,
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
          document: documentNodeQueryget_saved_location_by_id,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_saved_location_by_id,
        );
}

class FetchMoreOptions$Query$get_saved_location_by_id
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_saved_location_by_id({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_saved_location_by_id variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_saved_location_by_id,
        );
}

extension ClientExtension$Query$get_saved_location_by_id
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_saved_location_by_id>>
      query$get_saved_location_by_id(
              Options$Query$get_saved_location_by_id options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$get_saved_location_by_id>
      watchQuery$get_saved_location_by_id(
              WatchOptions$Query$get_saved_location_by_id options) =>
          this.watchQuery(options);
  void writeQuery$get_saved_location_by_id({
    required Query$get_saved_location_by_id data,
    required Variables$Query$get_saved_location_by_id variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryget_saved_location_by_id),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_saved_location_by_id? readQuery$get_saved_location_by_id({
    required Variables$Query$get_saved_location_by_id variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryget_saved_location_by_id),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$get_saved_location_by_id.fromJson(result);
  }
}

class Query$get_saved_location_by_id$customer_saved_location_by_pk {
  Query$get_saved_location_by_id$customer_saved_location_by_pk({
    required this.id,
    required this.name,
    required this.location_gps,
    required this.location_text,
    required this.$default,
    required this.$__typename,
  });

  factory Query$get_saved_location_by_id$customer_saved_location_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$location_gps = json['location_gps'];
    final l$location_text = json['location_text'];
    final l$$default = json['default'];
    final l$$__typename = json['__typename'];
    return Query$get_saved_location_by_id$customer_saved_location_by_pk(
      id: (l$id as int),
      name: (l$name as String),
      location_gps: geographyFromJson(l$location_gps),
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
    _resultData['location_gps'] = geographyToJson(l$location_gps);
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
    if (!(other
            is Query$get_saved_location_by_id$customer_saved_location_by_pk) ||
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

extension UtilityExtension$Query$get_saved_location_by_id$customer_saved_location_by_pk
    on Query$get_saved_location_by_id$customer_saved_location_by_pk {
  CopyWith$Query$get_saved_location_by_id$customer_saved_location_by_pk<
          Query$get_saved_location_by_id$customer_saved_location_by_pk>
      get copyWith =>
          CopyWith$Query$get_saved_location_by_id$customer_saved_location_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_saved_location_by_id$customer_saved_location_by_pk<
    TRes> {
  factory CopyWith$Query$get_saved_location_by_id$customer_saved_location_by_pk(
    Query$get_saved_location_by_id$customer_saved_location_by_pk instance,
    TRes Function(Query$get_saved_location_by_id$customer_saved_location_by_pk)
        then,
  ) = _CopyWithImpl$Query$get_saved_location_by_id$customer_saved_location_by_pk;

  factory CopyWith$Query$get_saved_location_by_id$customer_saved_location_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_saved_location_by_id$customer_saved_location_by_pk;

  TRes call({
    int? id,
    String? name,
    Geography? location_gps,
    String? location_text,
    bool? $default,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_saved_location_by_id$customer_saved_location_by_pk<
        TRes>
    implements
        CopyWith$Query$get_saved_location_by_id$customer_saved_location_by_pk<
            TRes> {
  _CopyWithImpl$Query$get_saved_location_by_id$customer_saved_location_by_pk(
    this._instance,
    this._then,
  );

  final Query$get_saved_location_by_id$customer_saved_location_by_pk _instance;

  final TRes Function(
      Query$get_saved_location_by_id$customer_saved_location_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? location_gps = _undefined,
    Object? location_text = _undefined,
    Object? $default = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_saved_location_by_id$customer_saved_location_by_pk(
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

class _CopyWithStubImpl$Query$get_saved_location_by_id$customer_saved_location_by_pk<
        TRes>
    implements
        CopyWith$Query$get_saved_location_by_id$customer_saved_location_by_pk<
            TRes> {
  _CopyWithStubImpl$Query$get_saved_location_by_id$customer_saved_location_by_pk(
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

class Variables$Mutation$update_saved_location {
  factory Variables$Mutation$update_saved_location({
    required Input$customer_saved_location_pk_columns_input location_id,
    Geography? gps,
    required String name,
    required bool $default,
    required String address,
  }) =>
      Variables$Mutation$update_saved_location._({
        r'location_id': location_id,
        if (gps != null) r'gps': gps,
        r'name': name,
        r'default': $default,
        r'address': address,
      });

  Variables$Mutation$update_saved_location._(this._$data);

  factory Variables$Mutation$update_saved_location.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$location_id = data['location_id'];
    result$data['location_id'] =
        Input$customer_saved_location_pk_columns_input.fromJson(
            (l$location_id as Map<String, dynamic>));
    if (data.containsKey('gps')) {
      final l$gps = data['gps'];
      result$data['gps'] = l$gps == null ? null : geographyFromJson(l$gps);
    }
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    final l$$default = data['default'];
    result$data['default'] = (l$$default as bool);
    final l$address = data['address'];
    result$data['address'] = (l$address as String);
    return Variables$Mutation$update_saved_location._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$customer_saved_location_pk_columns_input get location_id =>
      (_$data['location_id'] as Input$customer_saved_location_pk_columns_input);
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
      result$data['gps'] = l$gps == null ? null : geographyToJson(l$gps);
    }
    final l$name = name;
    result$data['name'] = l$name;
    final l$$default = $default;
    result$data['default'] = l$$default;
    final l$address = address;
    result$data['address'] = l$address;
    return result$data;
  }

  CopyWith$Variables$Mutation$update_saved_location<
          Variables$Mutation$update_saved_location>
      get copyWith => CopyWith$Variables$Mutation$update_saved_location(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$update_saved_location) ||
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

abstract class CopyWith$Variables$Mutation$update_saved_location<TRes> {
  factory CopyWith$Variables$Mutation$update_saved_location(
    Variables$Mutation$update_saved_location instance,
    TRes Function(Variables$Mutation$update_saved_location) then,
  ) = _CopyWithImpl$Variables$Mutation$update_saved_location;

  factory CopyWith$Variables$Mutation$update_saved_location.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$update_saved_location;

  TRes call({
    Input$customer_saved_location_pk_columns_input? location_id,
    Geography? gps,
    String? name,
    bool? $default,
    String? address,
  });
}

class _CopyWithImpl$Variables$Mutation$update_saved_location<TRes>
    implements CopyWith$Variables$Mutation$update_saved_location<TRes> {
  _CopyWithImpl$Variables$Mutation$update_saved_location(
    this._instance,
    this._then,
  );

  final Variables$Mutation$update_saved_location _instance;

  final TRes Function(Variables$Mutation$update_saved_location) _then;

  static const _undefined = {};

  TRes call({
    Object? location_id = _undefined,
    Object? gps = _undefined,
    Object? name = _undefined,
    Object? $default = _undefined,
    Object? address = _undefined,
  }) =>
      _then(Variables$Mutation$update_saved_location._({
        ..._instance._$data,
        if (location_id != _undefined && location_id != null)
          'location_id':
              (location_id as Input$customer_saved_location_pk_columns_input),
        if (gps != _undefined) 'gps': (gps as Geography?),
        if (name != _undefined && name != null) 'name': (name as String),
        if ($default != _undefined && $default != null)
          'default': ($default as bool),
        if (address != _undefined && address != null)
          'address': (address as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$update_saved_location<TRes>
    implements CopyWith$Variables$Mutation$update_saved_location<TRes> {
  _CopyWithStubImpl$Variables$Mutation$update_saved_location(this._res);

  TRes _res;

  call({
    Input$customer_saved_location_pk_columns_input? location_id,
    Geography? gps,
    String? name,
    bool? $default,
    String? address,
  }) =>
      _res;
}

class Mutation$update_saved_location {
  Mutation$update_saved_location({
    this.update_customer_saved_location_by_pk,
    required this.$__typename,
  });

  factory Mutation$update_saved_location.fromJson(Map<String, dynamic> json) {
    final l$update_customer_saved_location_by_pk =
        json['update_customer_saved_location_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$update_saved_location(
      update_customer_saved_location_by_pk:
          l$update_customer_saved_location_by_pk == null
              ? null
              : Mutation$update_saved_location$update_customer_saved_location_by_pk
                  .fromJson((l$update_customer_saved_location_by_pk
                      as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$update_saved_location$update_customer_saved_location_by_pk?
      update_customer_saved_location_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_customer_saved_location_by_pk =
        update_customer_saved_location_by_pk;
    _resultData['update_customer_saved_location_by_pk'] =
        l$update_customer_saved_location_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_customer_saved_location_by_pk =
        update_customer_saved_location_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_customer_saved_location_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$update_saved_location) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_customer_saved_location_by_pk =
        update_customer_saved_location_by_pk;
    final lOther$update_customer_saved_location_by_pk =
        other.update_customer_saved_location_by_pk;
    if (l$update_customer_saved_location_by_pk !=
        lOther$update_customer_saved_location_by_pk) {
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

extension UtilityExtension$Mutation$update_saved_location
    on Mutation$update_saved_location {
  CopyWith$Mutation$update_saved_location<Mutation$update_saved_location>
      get copyWith => CopyWith$Mutation$update_saved_location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$update_saved_location<TRes> {
  factory CopyWith$Mutation$update_saved_location(
    Mutation$update_saved_location instance,
    TRes Function(Mutation$update_saved_location) then,
  ) = _CopyWithImpl$Mutation$update_saved_location;

  factory CopyWith$Mutation$update_saved_location.stub(TRes res) =
      _CopyWithStubImpl$Mutation$update_saved_location;

  TRes call({
    Mutation$update_saved_location$update_customer_saved_location_by_pk?
        update_customer_saved_location_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$update_saved_location$update_customer_saved_location_by_pk<
      TRes> get update_customer_saved_location_by_pk;
}

class _CopyWithImpl$Mutation$update_saved_location<TRes>
    implements CopyWith$Mutation$update_saved_location<TRes> {
  _CopyWithImpl$Mutation$update_saved_location(
    this._instance,
    this._then,
  );

  final Mutation$update_saved_location _instance;

  final TRes Function(Mutation$update_saved_location) _then;

  static const _undefined = {};

  TRes call({
    Object? update_customer_saved_location_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$update_saved_location(
        update_customer_saved_location_by_pk:
            update_customer_saved_location_by_pk == _undefined
                ? _instance.update_customer_saved_location_by_pk
                : (update_customer_saved_location_by_pk
                    as Mutation$update_saved_location$update_customer_saved_location_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$update_saved_location$update_customer_saved_location_by_pk<
      TRes> get update_customer_saved_location_by_pk {
    final local$update_customer_saved_location_by_pk =
        _instance.update_customer_saved_location_by_pk;
    return local$update_customer_saved_location_by_pk == null
        ? CopyWith$Mutation$update_saved_location$update_customer_saved_location_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$update_saved_location$update_customer_saved_location_by_pk(
            local$update_customer_saved_location_by_pk,
            (e) => call(update_customer_saved_location_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$update_saved_location<TRes>
    implements CopyWith$Mutation$update_saved_location<TRes> {
  _CopyWithStubImpl$Mutation$update_saved_location(this._res);

  TRes _res;

  call({
    Mutation$update_saved_location$update_customer_saved_location_by_pk?
        update_customer_saved_location_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$update_saved_location$update_customer_saved_location_by_pk<
          TRes>
      get update_customer_saved_location_by_pk =>
          CopyWith$Mutation$update_saved_location$update_customer_saved_location_by_pk
              .stub(_res);
}

const documentNodeMutationupdate_saved_location = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'update_saved_location'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'location_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'customer_saved_location_pk_columns_input'),
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
        name: NameNode(value: 'update_customer_saved_location_by_pk'),
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
Mutation$update_saved_location _parserFn$Mutation$update_saved_location(
        Map<String, dynamic> data) =>
    Mutation$update_saved_location.fromJson(data);
typedef OnMutationCompleted$Mutation$update_saved_location = FutureOr<void>
    Function(
  dynamic,
  Mutation$update_saved_location?,
);

class Options$Mutation$update_saved_location
    extends graphql.MutationOptions<Mutation$update_saved_location> {
  Options$Mutation$update_saved_location({
    String? operationName,
    required Variables$Mutation$update_saved_location variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$update_saved_location? onCompleted,
    graphql.OnMutationUpdate<Mutation$update_saved_location>? update,
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
                        : _parserFn$Mutation$update_saved_location(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdate_saved_location,
          parserFn: _parserFn$Mutation$update_saved_location,
        );

  final OnMutationCompleted$Mutation$update_saved_location?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$update_saved_location
    extends graphql.WatchQueryOptions<Mutation$update_saved_location> {
  WatchOptions$Mutation$update_saved_location({
    String? operationName,
    required Variables$Mutation$update_saved_location variables,
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
          document: documentNodeMutationupdate_saved_location,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$update_saved_location,
        );
}

extension ClientExtension$Mutation$update_saved_location
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$update_saved_location>>
      mutate$update_saved_location(
              Options$Mutation$update_saved_location options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$update_saved_location>
      watchMutation$update_saved_location(
              WatchOptions$Mutation$update_saved_location options) =>
          this.watchMutation(options);
}

class Mutation$update_saved_location$update_customer_saved_location_by_pk {
  Mutation$update_saved_location$update_customer_saved_location_by_pk({
    required this.id,
    required this.name,
    required this.location_gps,
    required this.location_text,
    required this.$default,
    required this.$__typename,
  });

  factory Mutation$update_saved_location$update_customer_saved_location_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$location_gps = json['location_gps'];
    final l$location_text = json['location_text'];
    final l$$default = json['default'];
    final l$$__typename = json['__typename'];
    return Mutation$update_saved_location$update_customer_saved_location_by_pk(
      id: (l$id as int),
      name: (l$name as String),
      location_gps: geographyFromJson(l$location_gps),
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
    _resultData['location_gps'] = geographyToJson(l$location_gps);
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
    if (!(other
            is Mutation$update_saved_location$update_customer_saved_location_by_pk) ||
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

extension UtilityExtension$Mutation$update_saved_location$update_customer_saved_location_by_pk
    on Mutation$update_saved_location$update_customer_saved_location_by_pk {
  CopyWith$Mutation$update_saved_location$update_customer_saved_location_by_pk<
          Mutation$update_saved_location$update_customer_saved_location_by_pk>
      get copyWith =>
          CopyWith$Mutation$update_saved_location$update_customer_saved_location_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$update_saved_location$update_customer_saved_location_by_pk<
    TRes> {
  factory CopyWith$Mutation$update_saved_location$update_customer_saved_location_by_pk(
    Mutation$update_saved_location$update_customer_saved_location_by_pk
        instance,
    TRes Function(
            Mutation$update_saved_location$update_customer_saved_location_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$update_saved_location$update_customer_saved_location_by_pk;

  factory CopyWith$Mutation$update_saved_location$update_customer_saved_location_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$update_saved_location$update_customer_saved_location_by_pk;

  TRes call({
    int? id,
    String? name,
    Geography? location_gps,
    String? location_text,
    bool? $default,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$update_saved_location$update_customer_saved_location_by_pk<
        TRes>
    implements
        CopyWith$Mutation$update_saved_location$update_customer_saved_location_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$update_saved_location$update_customer_saved_location_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$update_saved_location$update_customer_saved_location_by_pk
      _instance;

  final TRes Function(
          Mutation$update_saved_location$update_customer_saved_location_by_pk)
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
      _then(Mutation$update_saved_location$update_customer_saved_location_by_pk(
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

class _CopyWithStubImpl$Mutation$update_saved_location$update_customer_saved_location_by_pk<
        TRes>
    implements
        CopyWith$Mutation$update_saved_location$update_customer_saved_location_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$update_saved_location$update_customer_saved_location_by_pk(
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

class Variables$Mutation$delete_saved_location {
  factory Variables$Mutation$delete_saved_location(
          {required int location_id}) =>
      Variables$Mutation$delete_saved_location._({
        r'location_id': location_id,
      });

  Variables$Mutation$delete_saved_location._(this._$data);

  factory Variables$Mutation$delete_saved_location.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$location_id = data['location_id'];
    result$data['location_id'] = (l$location_id as int);
    return Variables$Mutation$delete_saved_location._(result$data);
  }

  Map<String, dynamic> _$data;

  int get location_id => (_$data['location_id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$location_id = location_id;
    result$data['location_id'] = l$location_id;
    return result$data;
  }

  CopyWith$Variables$Mutation$delete_saved_location<
          Variables$Mutation$delete_saved_location>
      get copyWith => CopyWith$Variables$Mutation$delete_saved_location(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$delete_saved_location) ||
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

abstract class CopyWith$Variables$Mutation$delete_saved_location<TRes> {
  factory CopyWith$Variables$Mutation$delete_saved_location(
    Variables$Mutation$delete_saved_location instance,
    TRes Function(Variables$Mutation$delete_saved_location) then,
  ) = _CopyWithImpl$Variables$Mutation$delete_saved_location;

  factory CopyWith$Variables$Mutation$delete_saved_location.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$delete_saved_location;

  TRes call({int? location_id});
}

class _CopyWithImpl$Variables$Mutation$delete_saved_location<TRes>
    implements CopyWith$Variables$Mutation$delete_saved_location<TRes> {
  _CopyWithImpl$Variables$Mutation$delete_saved_location(
    this._instance,
    this._then,
  );

  final Variables$Mutation$delete_saved_location _instance;

  final TRes Function(Variables$Mutation$delete_saved_location) _then;

  static const _undefined = {};

  TRes call({Object? location_id = _undefined}) =>
      _then(Variables$Mutation$delete_saved_location._({
        ..._instance._$data,
        if (location_id != _undefined && location_id != null)
          'location_id': (location_id as int),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$delete_saved_location<TRes>
    implements CopyWith$Variables$Mutation$delete_saved_location<TRes> {
  _CopyWithStubImpl$Variables$Mutation$delete_saved_location(this._res);

  TRes _res;

  call({int? location_id}) => _res;
}

class Mutation$delete_saved_location {
  Mutation$delete_saved_location({
    this.delete_customer_saved_location_by_pk,
    required this.$__typename,
  });

  factory Mutation$delete_saved_location.fromJson(Map<String, dynamic> json) {
    final l$delete_customer_saved_location_by_pk =
        json['delete_customer_saved_location_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$delete_saved_location(
      delete_customer_saved_location_by_pk:
          l$delete_customer_saved_location_by_pk == null
              ? null
              : Mutation$delete_saved_location$delete_customer_saved_location_by_pk
                  .fromJson((l$delete_customer_saved_location_by_pk
                      as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$delete_saved_location$delete_customer_saved_location_by_pk?
      delete_customer_saved_location_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delete_customer_saved_location_by_pk =
        delete_customer_saved_location_by_pk;
    _resultData['delete_customer_saved_location_by_pk'] =
        l$delete_customer_saved_location_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delete_customer_saved_location_by_pk =
        delete_customer_saved_location_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$delete_customer_saved_location_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$delete_saved_location) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delete_customer_saved_location_by_pk =
        delete_customer_saved_location_by_pk;
    final lOther$delete_customer_saved_location_by_pk =
        other.delete_customer_saved_location_by_pk;
    if (l$delete_customer_saved_location_by_pk !=
        lOther$delete_customer_saved_location_by_pk) {
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

extension UtilityExtension$Mutation$delete_saved_location
    on Mutation$delete_saved_location {
  CopyWith$Mutation$delete_saved_location<Mutation$delete_saved_location>
      get copyWith => CopyWith$Mutation$delete_saved_location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$delete_saved_location<TRes> {
  factory CopyWith$Mutation$delete_saved_location(
    Mutation$delete_saved_location instance,
    TRes Function(Mutation$delete_saved_location) then,
  ) = _CopyWithImpl$Mutation$delete_saved_location;

  factory CopyWith$Mutation$delete_saved_location.stub(TRes res) =
      _CopyWithStubImpl$Mutation$delete_saved_location;

  TRes call({
    Mutation$delete_saved_location$delete_customer_saved_location_by_pk?
        delete_customer_saved_location_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$delete_saved_location$delete_customer_saved_location_by_pk<
      TRes> get delete_customer_saved_location_by_pk;
}

class _CopyWithImpl$Mutation$delete_saved_location<TRes>
    implements CopyWith$Mutation$delete_saved_location<TRes> {
  _CopyWithImpl$Mutation$delete_saved_location(
    this._instance,
    this._then,
  );

  final Mutation$delete_saved_location _instance;

  final TRes Function(Mutation$delete_saved_location) _then;

  static const _undefined = {};

  TRes call({
    Object? delete_customer_saved_location_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$delete_saved_location(
        delete_customer_saved_location_by_pk:
            delete_customer_saved_location_by_pk == _undefined
                ? _instance.delete_customer_saved_location_by_pk
                : (delete_customer_saved_location_by_pk
                    as Mutation$delete_saved_location$delete_customer_saved_location_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$delete_saved_location$delete_customer_saved_location_by_pk<
      TRes> get delete_customer_saved_location_by_pk {
    final local$delete_customer_saved_location_by_pk =
        _instance.delete_customer_saved_location_by_pk;
    return local$delete_customer_saved_location_by_pk == null
        ? CopyWith$Mutation$delete_saved_location$delete_customer_saved_location_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$delete_saved_location$delete_customer_saved_location_by_pk(
            local$delete_customer_saved_location_by_pk,
            (e) => call(delete_customer_saved_location_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$delete_saved_location<TRes>
    implements CopyWith$Mutation$delete_saved_location<TRes> {
  _CopyWithStubImpl$Mutation$delete_saved_location(this._res);

  TRes _res;

  call({
    Mutation$delete_saved_location$delete_customer_saved_location_by_pk?
        delete_customer_saved_location_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$delete_saved_location$delete_customer_saved_location_by_pk<
          TRes>
      get delete_customer_saved_location_by_pk =>
          CopyWith$Mutation$delete_saved_location$delete_customer_saved_location_by_pk
              .stub(_res);
}

const documentNodeMutationdelete_saved_location = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'delete_saved_location'),
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
        name: NameNode(value: 'delete_customer_saved_location_by_pk'),
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
Mutation$delete_saved_location _parserFn$Mutation$delete_saved_location(
        Map<String, dynamic> data) =>
    Mutation$delete_saved_location.fromJson(data);
typedef OnMutationCompleted$Mutation$delete_saved_location = FutureOr<void>
    Function(
  dynamic,
  Mutation$delete_saved_location?,
);

class Options$Mutation$delete_saved_location
    extends graphql.MutationOptions<Mutation$delete_saved_location> {
  Options$Mutation$delete_saved_location({
    String? operationName,
    required Variables$Mutation$delete_saved_location variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$delete_saved_location? onCompleted,
    graphql.OnMutationUpdate<Mutation$delete_saved_location>? update,
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
                        : _parserFn$Mutation$delete_saved_location(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationdelete_saved_location,
          parserFn: _parserFn$Mutation$delete_saved_location,
        );

  final OnMutationCompleted$Mutation$delete_saved_location?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$delete_saved_location
    extends graphql.WatchQueryOptions<Mutation$delete_saved_location> {
  WatchOptions$Mutation$delete_saved_location({
    String? operationName,
    required Variables$Mutation$delete_saved_location variables,
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
          document: documentNodeMutationdelete_saved_location,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$delete_saved_location,
        );
}

extension ClientExtension$Mutation$delete_saved_location
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$delete_saved_location>>
      mutate$delete_saved_location(
              Options$Mutation$delete_saved_location options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$delete_saved_location>
      watchMutation$delete_saved_location(
              WatchOptions$Mutation$delete_saved_location options) =>
          this.watchMutation(options);
}

class Mutation$delete_saved_location$delete_customer_saved_location_by_pk {
  Mutation$delete_saved_location$delete_customer_saved_location_by_pk({
    required this.name,
    required this.$__typename,
  });

  factory Mutation$delete_saved_location$delete_customer_saved_location_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Mutation$delete_saved_location$delete_customer_saved_location_by_pk(
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
            is Mutation$delete_saved_location$delete_customer_saved_location_by_pk) ||
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

extension UtilityExtension$Mutation$delete_saved_location$delete_customer_saved_location_by_pk
    on Mutation$delete_saved_location$delete_customer_saved_location_by_pk {
  CopyWith$Mutation$delete_saved_location$delete_customer_saved_location_by_pk<
          Mutation$delete_saved_location$delete_customer_saved_location_by_pk>
      get copyWith =>
          CopyWith$Mutation$delete_saved_location$delete_customer_saved_location_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$delete_saved_location$delete_customer_saved_location_by_pk<
    TRes> {
  factory CopyWith$Mutation$delete_saved_location$delete_customer_saved_location_by_pk(
    Mutation$delete_saved_location$delete_customer_saved_location_by_pk
        instance,
    TRes Function(
            Mutation$delete_saved_location$delete_customer_saved_location_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$delete_saved_location$delete_customer_saved_location_by_pk;

  factory CopyWith$Mutation$delete_saved_location$delete_customer_saved_location_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$delete_saved_location$delete_customer_saved_location_by_pk;

  TRes call({
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$delete_saved_location$delete_customer_saved_location_by_pk<
        TRes>
    implements
        CopyWith$Mutation$delete_saved_location$delete_customer_saved_location_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$delete_saved_location$delete_customer_saved_location_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$delete_saved_location$delete_customer_saved_location_by_pk
      _instance;

  final TRes Function(
          Mutation$delete_saved_location$delete_customer_saved_location_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$delete_saved_location$delete_customer_saved_location_by_pk(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$delete_saved_location$delete_customer_saved_location_by_pk<
        TRes>
    implements
        CopyWith$Mutation$delete_saved_location$delete_customer_saved_location_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$delete_saved_location$delete_customer_saved_location_by_pk(
      this._res);

  TRes _res;

  call({
    String? name,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$add_saved_location {
  factory Variables$Mutation$add_saved_location(
          {required Input$customer_saved_location_insert_input
              saved_location}) =>
      Variables$Mutation$add_saved_location._({
        r'saved_location': saved_location,
      });

  Variables$Mutation$add_saved_location._(this._$data);

  factory Variables$Mutation$add_saved_location.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$saved_location = data['saved_location'];
    result$data['saved_location'] =
        Input$customer_saved_location_insert_input.fromJson(
            (l$saved_location as Map<String, dynamic>));
    return Variables$Mutation$add_saved_location._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$customer_saved_location_insert_input get saved_location =>
      (_$data['saved_location'] as Input$customer_saved_location_insert_input);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$saved_location = saved_location;
    result$data['saved_location'] = l$saved_location.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$add_saved_location<
          Variables$Mutation$add_saved_location>
      get copyWith => CopyWith$Variables$Mutation$add_saved_location(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$add_saved_location) ||
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

abstract class CopyWith$Variables$Mutation$add_saved_location<TRes> {
  factory CopyWith$Variables$Mutation$add_saved_location(
    Variables$Mutation$add_saved_location instance,
    TRes Function(Variables$Mutation$add_saved_location) then,
  ) = _CopyWithImpl$Variables$Mutation$add_saved_location;

  factory CopyWith$Variables$Mutation$add_saved_location.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$add_saved_location;

  TRes call({Input$customer_saved_location_insert_input? saved_location});
}

class _CopyWithImpl$Variables$Mutation$add_saved_location<TRes>
    implements CopyWith$Variables$Mutation$add_saved_location<TRes> {
  _CopyWithImpl$Variables$Mutation$add_saved_location(
    this._instance,
    this._then,
  );

  final Variables$Mutation$add_saved_location _instance;

  final TRes Function(Variables$Mutation$add_saved_location) _then;

  static const _undefined = {};

  TRes call({Object? saved_location = _undefined}) =>
      _then(Variables$Mutation$add_saved_location._({
        ..._instance._$data,
        if (saved_location != _undefined && saved_location != null)
          'saved_location':
              (saved_location as Input$customer_saved_location_insert_input),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$add_saved_location<TRes>
    implements CopyWith$Variables$Mutation$add_saved_location<TRes> {
  _CopyWithStubImpl$Variables$Mutation$add_saved_location(this._res);

  TRes _res;

  call({Input$customer_saved_location_insert_input? saved_location}) => _res;
}

class Mutation$add_saved_location {
  Mutation$add_saved_location({
    this.insert_customer_saved_location_one,
    required this.$__typename,
  });

  factory Mutation$add_saved_location.fromJson(Map<String, dynamic> json) {
    final l$insert_customer_saved_location_one =
        json['insert_customer_saved_location_one'];
    final l$$__typename = json['__typename'];
    return Mutation$add_saved_location(
      insert_customer_saved_location_one:
          l$insert_customer_saved_location_one == null
              ? null
              : Mutation$add_saved_location$insert_customer_saved_location_one
                  .fromJson((l$insert_customer_saved_location_one
                      as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$add_saved_location$insert_customer_saved_location_one?
      insert_customer_saved_location_one;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insert_customer_saved_location_one =
        insert_customer_saved_location_one;
    _resultData['insert_customer_saved_location_one'] =
        l$insert_customer_saved_location_one?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insert_customer_saved_location_one =
        insert_customer_saved_location_one;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$insert_customer_saved_location_one,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$add_saved_location) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$insert_customer_saved_location_one =
        insert_customer_saved_location_one;
    final lOther$insert_customer_saved_location_one =
        other.insert_customer_saved_location_one;
    if (l$insert_customer_saved_location_one !=
        lOther$insert_customer_saved_location_one) {
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

extension UtilityExtension$Mutation$add_saved_location
    on Mutation$add_saved_location {
  CopyWith$Mutation$add_saved_location<Mutation$add_saved_location>
      get copyWith => CopyWith$Mutation$add_saved_location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$add_saved_location<TRes> {
  factory CopyWith$Mutation$add_saved_location(
    Mutation$add_saved_location instance,
    TRes Function(Mutation$add_saved_location) then,
  ) = _CopyWithImpl$Mutation$add_saved_location;

  factory CopyWith$Mutation$add_saved_location.stub(TRes res) =
      _CopyWithStubImpl$Mutation$add_saved_location;

  TRes call({
    Mutation$add_saved_location$insert_customer_saved_location_one?
        insert_customer_saved_location_one,
    String? $__typename,
  });
  CopyWith$Mutation$add_saved_location$insert_customer_saved_location_one<TRes>
      get insert_customer_saved_location_one;
}

class _CopyWithImpl$Mutation$add_saved_location<TRes>
    implements CopyWith$Mutation$add_saved_location<TRes> {
  _CopyWithImpl$Mutation$add_saved_location(
    this._instance,
    this._then,
  );

  final Mutation$add_saved_location _instance;

  final TRes Function(Mutation$add_saved_location) _then;

  static const _undefined = {};

  TRes call({
    Object? insert_customer_saved_location_one = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$add_saved_location(
        insert_customer_saved_location_one: insert_customer_saved_location_one ==
                _undefined
            ? _instance.insert_customer_saved_location_one
            : (insert_customer_saved_location_one
                as Mutation$add_saved_location$insert_customer_saved_location_one?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$add_saved_location$insert_customer_saved_location_one<TRes>
      get insert_customer_saved_location_one {
    final local$insert_customer_saved_location_one =
        _instance.insert_customer_saved_location_one;
    return local$insert_customer_saved_location_one == null
        ? CopyWith$Mutation$add_saved_location$insert_customer_saved_location_one
            .stub(_then(_instance))
        : CopyWith$Mutation$add_saved_location$insert_customer_saved_location_one(
            local$insert_customer_saved_location_one,
            (e) => call(insert_customer_saved_location_one: e));
  }
}

class _CopyWithStubImpl$Mutation$add_saved_location<TRes>
    implements CopyWith$Mutation$add_saved_location<TRes> {
  _CopyWithStubImpl$Mutation$add_saved_location(this._res);

  TRes _res;

  call({
    Mutation$add_saved_location$insert_customer_saved_location_one?
        insert_customer_saved_location_one,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$add_saved_location$insert_customer_saved_location_one<TRes>
      get insert_customer_saved_location_one =>
          CopyWith$Mutation$add_saved_location$insert_customer_saved_location_one
              .stub(_res);
}

const documentNodeMutationadd_saved_location = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'add_saved_location'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'saved_location')),
        type: NamedTypeNode(
          name: NameNode(value: 'customer_saved_location_insert_input'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'insert_customer_saved_location_one'),
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
Mutation$add_saved_location _parserFn$Mutation$add_saved_location(
        Map<String, dynamic> data) =>
    Mutation$add_saved_location.fromJson(data);
typedef OnMutationCompleted$Mutation$add_saved_location = FutureOr<void>
    Function(
  dynamic,
  Mutation$add_saved_location?,
);

class Options$Mutation$add_saved_location
    extends graphql.MutationOptions<Mutation$add_saved_location> {
  Options$Mutation$add_saved_location({
    String? operationName,
    required Variables$Mutation$add_saved_location variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$add_saved_location? onCompleted,
    graphql.OnMutationUpdate<Mutation$add_saved_location>? update,
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
                        : _parserFn$Mutation$add_saved_location(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationadd_saved_location,
          parserFn: _parserFn$Mutation$add_saved_location,
        );

  final OnMutationCompleted$Mutation$add_saved_location? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$add_saved_location
    extends graphql.WatchQueryOptions<Mutation$add_saved_location> {
  WatchOptions$Mutation$add_saved_location({
    String? operationName,
    required Variables$Mutation$add_saved_location variables,
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
          document: documentNodeMutationadd_saved_location,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$add_saved_location,
        );
}

extension ClientExtension$Mutation$add_saved_location on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$add_saved_location>>
      mutate$add_saved_location(
              Options$Mutation$add_saved_location options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$add_saved_location>
      watchMutation$add_saved_location(
              WatchOptions$Mutation$add_saved_location options) =>
          this.watchMutation(options);
}

class Mutation$add_saved_location$insert_customer_saved_location_one {
  Mutation$add_saved_location$insert_customer_saved_location_one({
    required this.id,
    required this.$__typename,
  });

  factory Mutation$add_saved_location$insert_customer_saved_location_one.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$add_saved_location$insert_customer_saved_location_one(
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
    if (!(other
            is Mutation$add_saved_location$insert_customer_saved_location_one) ||
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

extension UtilityExtension$Mutation$add_saved_location$insert_customer_saved_location_one
    on Mutation$add_saved_location$insert_customer_saved_location_one {
  CopyWith$Mutation$add_saved_location$insert_customer_saved_location_one<
          Mutation$add_saved_location$insert_customer_saved_location_one>
      get copyWith =>
          CopyWith$Mutation$add_saved_location$insert_customer_saved_location_one(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$add_saved_location$insert_customer_saved_location_one<
    TRes> {
  factory CopyWith$Mutation$add_saved_location$insert_customer_saved_location_one(
    Mutation$add_saved_location$insert_customer_saved_location_one instance,
    TRes Function(
            Mutation$add_saved_location$insert_customer_saved_location_one)
        then,
  ) = _CopyWithImpl$Mutation$add_saved_location$insert_customer_saved_location_one;

  factory CopyWith$Mutation$add_saved_location$insert_customer_saved_location_one.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$add_saved_location$insert_customer_saved_location_one;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$add_saved_location$insert_customer_saved_location_one<
        TRes>
    implements
        CopyWith$Mutation$add_saved_location$insert_customer_saved_location_one<
            TRes> {
  _CopyWithImpl$Mutation$add_saved_location$insert_customer_saved_location_one(
    this._instance,
    this._then,
  );

  final Mutation$add_saved_location$insert_customer_saved_location_one
      _instance;

  final TRes Function(
      Mutation$add_saved_location$insert_customer_saved_location_one) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$add_saved_location$insert_customer_saved_location_one(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$add_saved_location$insert_customer_saved_location_one<
        TRes>
    implements
        CopyWith$Mutation$add_saved_location$insert_customer_saved_location_one<
            TRes> {
  _CopyWithStubImpl$Mutation$add_saved_location$insert_customer_saved_location_one(
      this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}
