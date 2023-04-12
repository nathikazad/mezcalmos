import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Variables$Query$get_event_by_id {
  factory Variables$Query$get_event_by_id({required int id}) =>
      Variables$Query$get_event_by_id._({
        r'id': id,
      });

  Variables$Query$get_event_by_id._(this._$data);

  factory Variables$Query$get_event_by_id.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    return Variables$Query$get_event_by_id._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$get_event_by_id<Variables$Query$get_event_by_id>
      get copyWith => CopyWith$Variables$Query$get_event_by_id(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_event_by_id) ||
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

abstract class CopyWith$Variables$Query$get_event_by_id<TRes> {
  factory CopyWith$Variables$Query$get_event_by_id(
    Variables$Query$get_event_by_id instance,
    TRes Function(Variables$Query$get_event_by_id) then,
  ) = _CopyWithImpl$Variables$Query$get_event_by_id;

  factory CopyWith$Variables$Query$get_event_by_id.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$get_event_by_id;

  TRes call({int? id});
}

class _CopyWithImpl$Variables$Query$get_event_by_id<TRes>
    implements CopyWith$Variables$Query$get_event_by_id<TRes> {
  _CopyWithImpl$Variables$Query$get_event_by_id(
    this._instance,
    this._then,
  );

  final Variables$Query$get_event_by_id _instance;

  final TRes Function(Variables$Query$get_event_by_id) _then;

  static const _undefined = {};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$get_event_by_id._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_event_by_id<TRes>
    implements CopyWith$Variables$Query$get_event_by_id<TRes> {
  _CopyWithStubImpl$Variables$Query$get_event_by_id(this._res);

  TRes _res;

  call({int? id}) => _res;
}

class Query$get_event_by_id {
  Query$get_event_by_id({
    this.business_event_by_pk,
    required this.$__typename,
  });

  factory Query$get_event_by_id.fromJson(Map<String, dynamic> json) {
    final l$business_event_by_pk = json['business_event_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$get_event_by_id(
      business_event_by_pk: l$business_event_by_pk == null
          ? null
          : Query$get_event_by_id$business_event_by_pk.fromJson(
              (l$business_event_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_event_by_id$business_event_by_pk? business_event_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$business_event_by_pk = business_event_by_pk;
    _resultData['business_event_by_pk'] = l$business_event_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$business_event_by_pk = business_event_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$business_event_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_event_by_id) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$business_event_by_pk = business_event_by_pk;
    final lOther$business_event_by_pk = other.business_event_by_pk;
    if (l$business_event_by_pk != lOther$business_event_by_pk) {
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

extension UtilityExtension$Query$get_event_by_id on Query$get_event_by_id {
  CopyWith$Query$get_event_by_id<Query$get_event_by_id> get copyWith =>
      CopyWith$Query$get_event_by_id(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$get_event_by_id<TRes> {
  factory CopyWith$Query$get_event_by_id(
    Query$get_event_by_id instance,
    TRes Function(Query$get_event_by_id) then,
  ) = _CopyWithImpl$Query$get_event_by_id;

  factory CopyWith$Query$get_event_by_id.stub(TRes res) =
      _CopyWithStubImpl$Query$get_event_by_id;

  TRes call({
    Query$get_event_by_id$business_event_by_pk? business_event_by_pk,
    String? $__typename,
  });
  CopyWith$Query$get_event_by_id$business_event_by_pk<TRes>
      get business_event_by_pk;
}

class _CopyWithImpl$Query$get_event_by_id<TRes>
    implements CopyWith$Query$get_event_by_id<TRes> {
  _CopyWithImpl$Query$get_event_by_id(
    this._instance,
    this._then,
  );

  final Query$get_event_by_id _instance;

  final TRes Function(Query$get_event_by_id) _then;

  static const _undefined = {};

  TRes call({
    Object? business_event_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_event_by_id(
        business_event_by_pk: business_event_by_pk == _undefined
            ? _instance.business_event_by_pk
            : (business_event_by_pk
                as Query$get_event_by_id$business_event_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_event_by_id$business_event_by_pk<TRes>
      get business_event_by_pk {
    final local$business_event_by_pk = _instance.business_event_by_pk;
    return local$business_event_by_pk == null
        ? CopyWith$Query$get_event_by_id$business_event_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$get_event_by_id$business_event_by_pk(
            local$business_event_by_pk, (e) => call(business_event_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$get_event_by_id<TRes>
    implements CopyWith$Query$get_event_by_id<TRes> {
  _CopyWithStubImpl$Query$get_event_by_id(this._res);

  TRes _res;

  call({
    Query$get_event_by_id$business_event_by_pk? business_event_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_event_by_id$business_event_by_pk<TRes>
      get business_event_by_pk =>
          CopyWith$Query$get_event_by_id$business_event_by_pk.stub(_res);
}

const documentNodeQueryget_event_by_id = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_event_by_id'),
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
        name: NameNode(value: 'business_event_by_pk'),
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
            name: NameNode(value: 'business_id'),
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
            name: NameNode(value: 'schedule'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'schedule_type'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'service'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
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
Query$get_event_by_id _parserFn$Query$get_event_by_id(
        Map<String, dynamic> data) =>
    Query$get_event_by_id.fromJson(data);

class Options$Query$get_event_by_id
    extends graphql.QueryOptions<Query$get_event_by_id> {
  Options$Query$get_event_by_id({
    String? operationName,
    required Variables$Query$get_event_by_id variables,
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
          document: documentNodeQueryget_event_by_id,
          parserFn: _parserFn$Query$get_event_by_id,
        );
}

class WatchOptions$Query$get_event_by_id
    extends graphql.WatchQueryOptions<Query$get_event_by_id> {
  WatchOptions$Query$get_event_by_id({
    String? operationName,
    required Variables$Query$get_event_by_id variables,
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
          document: documentNodeQueryget_event_by_id,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_event_by_id,
        );
}

class FetchMoreOptions$Query$get_event_by_id extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_event_by_id({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_event_by_id variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_event_by_id,
        );
}

extension ClientExtension$Query$get_event_by_id on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_event_by_id>> query$get_event_by_id(
          Options$Query$get_event_by_id options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$get_event_by_id> watchQuery$get_event_by_id(
          WatchOptions$Query$get_event_by_id options) =>
      this.watchQuery(options);
  void writeQuery$get_event_by_id({
    required Query$get_event_by_id data,
    required Variables$Query$get_event_by_id variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryget_event_by_id),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_event_by_id? readQuery$get_event_by_id({
    required Variables$Query$get_event_by_id variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryget_event_by_id),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$get_event_by_id.fromJson(result);
  }
}

class Query$get_event_by_id$business_event_by_pk {
  Query$get_event_by_id$business_event_by_pk({
    required this.business_id,
    required this.id,
    this.schedule,
    required this.schedule_type,
    required this.service,
    required this.$__typename,
  });

  factory Query$get_event_by_id$business_event_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$business_id = json['business_id'];
    final l$id = json['id'];
    final l$schedule = json['schedule'];
    final l$schedule_type = json['schedule_type'];
    final l$service = json['service'];
    final l$$__typename = json['__typename'];
    return Query$get_event_by_id$business_event_by_pk(
      business_id: (l$business_id as int),
      id: (l$id as int),
      schedule: l$schedule == null ? null : mapFromJson(l$schedule),
      schedule_type: (l$schedule_type as String),
      service: Query$get_event_by_id$business_event_by_pk$service.fromJson(
          (l$service as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int business_id;

  final int id;

  final dynamic? schedule;

  final String schedule_type;

  final Query$get_event_by_id$business_event_by_pk$service service;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$business_id = business_id;
    _resultData['business_id'] = l$business_id;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$schedule = schedule;
    _resultData['schedule'] = l$schedule == null ? null : mapToJson(l$schedule);
    final l$schedule_type = schedule_type;
    _resultData['schedule_type'] = l$schedule_type;
    final l$service = service;
    _resultData['service'] = l$service.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$business_id = business_id;
    final l$id = id;
    final l$schedule = schedule;
    final l$schedule_type = schedule_type;
    final l$service = service;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$business_id,
      l$id,
      l$schedule,
      l$schedule_type,
      l$service,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_event_by_id$business_event_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$business_id = business_id;
    final lOther$business_id = other.business_id;
    if (l$business_id != lOther$business_id) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$schedule = schedule;
    final lOther$schedule = other.schedule;
    if (l$schedule != lOther$schedule) {
      return false;
    }
    final l$schedule_type = schedule_type;
    final lOther$schedule_type = other.schedule_type;
    if (l$schedule_type != lOther$schedule_type) {
      return false;
    }
    final l$service = service;
    final lOther$service = other.service;
    if (l$service != lOther$service) {
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

extension UtilityExtension$Query$get_event_by_id$business_event_by_pk
    on Query$get_event_by_id$business_event_by_pk {
  CopyWith$Query$get_event_by_id$business_event_by_pk<
          Query$get_event_by_id$business_event_by_pk>
      get copyWith => CopyWith$Query$get_event_by_id$business_event_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_event_by_id$business_event_by_pk<TRes> {
  factory CopyWith$Query$get_event_by_id$business_event_by_pk(
    Query$get_event_by_id$business_event_by_pk instance,
    TRes Function(Query$get_event_by_id$business_event_by_pk) then,
  ) = _CopyWithImpl$Query$get_event_by_id$business_event_by_pk;

  factory CopyWith$Query$get_event_by_id$business_event_by_pk.stub(TRes res) =
      _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk;

  TRes call({
    int? business_id,
    int? id,
    dynamic? schedule,
    String? schedule_type,
    Query$get_event_by_id$business_event_by_pk$service? service,
    String? $__typename,
  });
  CopyWith$Query$get_event_by_id$business_event_by_pk$service<TRes> get service;
}

class _CopyWithImpl$Query$get_event_by_id$business_event_by_pk<TRes>
    implements CopyWith$Query$get_event_by_id$business_event_by_pk<TRes> {
  _CopyWithImpl$Query$get_event_by_id$business_event_by_pk(
    this._instance,
    this._then,
  );

  final Query$get_event_by_id$business_event_by_pk _instance;

  final TRes Function(Query$get_event_by_id$business_event_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? business_id = _undefined,
    Object? id = _undefined,
    Object? schedule = _undefined,
    Object? schedule_type = _undefined,
    Object? service = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_event_by_id$business_event_by_pk(
        business_id: business_id == _undefined || business_id == null
            ? _instance.business_id
            : (business_id as int),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        schedule: schedule == _undefined
            ? _instance.schedule
            : (schedule as dynamic?),
        schedule_type: schedule_type == _undefined || schedule_type == null
            ? _instance.schedule_type
            : (schedule_type as String),
        service: service == _undefined || service == null
            ? _instance.service
            : (service as Query$get_event_by_id$business_event_by_pk$service),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_event_by_id$business_event_by_pk$service<TRes>
      get service {
    final local$service = _instance.service;
    return CopyWith$Query$get_event_by_id$business_event_by_pk$service(
        local$service, (e) => call(service: e));
  }
}

class _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk<TRes>
    implements CopyWith$Query$get_event_by_id$business_event_by_pk<TRes> {
  _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk(this._res);

  TRes _res;

  call({
    int? business_id,
    int? id,
    dynamic? schedule,
    String? schedule_type,
    Query$get_event_by_id$business_event_by_pk$service? service,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_event_by_id$business_event_by_pk$service<TRes>
      get service =>
          CopyWith$Query$get_event_by_id$business_event_by_pk$service.stub(
              _res);
}

class Query$get_event_by_id$business_event_by_pk$service {
  Query$get_event_by_id$business_event_by_pk$service({
    this.additional_parameters,
    required this.available,
    required this.category1,
    required this.cost,
    this.description,
    required this.id,
    this.image,
    required this.name,
    required this.position,
    required this.$__typename,
  });

  factory Query$get_event_by_id$business_event_by_pk$service.fromJson(
      Map<String, dynamic> json) {
    final l$additional_parameters = json['additional_parameters'];
    final l$available = json['available'];
    final l$category1 = json['category1'];
    final l$cost = json['cost'];
    final l$description = json['description'];
    final l$id = json['id'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$position = json['position'];
    final l$$__typename = json['__typename'];
    return Query$get_event_by_id$business_event_by_pk$service(
      additional_parameters: l$additional_parameters == null
          ? null
          : mapFromJson(l$additional_parameters),
      available: (l$available as bool),
      category1: (l$category1 as String),
      cost: mapFromJson(l$cost),
      description: l$description == null
          ? null
          : Query$get_event_by_id$business_event_by_pk$service$description
              .fromJson((l$description as Map<String, dynamic>)),
      id: (l$id as int),
      image: l$image == null ? null : mapFromJson(l$image),
      name: Query$get_event_by_id$business_event_by_pk$service$name.fromJson(
          (l$name as Map<String, dynamic>)),
      position: (l$position as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final dynamic? additional_parameters;

  final bool available;

  final String category1;

  final dynamic cost;

  final Query$get_event_by_id$business_event_by_pk$service$description?
      description;

  final int id;

  final dynamic? image;

  final Query$get_event_by_id$business_event_by_pk$service$name name;

  final int position;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
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
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
    final l$id = id;
    _resultData['id'] = l$id;
    final l$image = image;
    _resultData['image'] = l$image == null ? null : mapToJson(l$image);
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$position = position;
    _resultData['position'] = l$position;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$additional_parameters = additional_parameters;
    final l$available = available;
    final l$category1 = category1;
    final l$cost = cost;
    final l$description = description;
    final l$id = id;
    final l$image = image;
    final l$name = name;
    final l$position = position;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$additional_parameters,
      l$available,
      l$category1,
      l$cost,
      l$description,
      l$id,
      l$image,
      l$name,
      l$position,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_event_by_id$business_event_by_pk$service) ||
        runtimeType != other.runtimeType) {
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
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$get_event_by_id$business_event_by_pk$service
    on Query$get_event_by_id$business_event_by_pk$service {
  CopyWith$Query$get_event_by_id$business_event_by_pk$service<
          Query$get_event_by_id$business_event_by_pk$service>
      get copyWith =>
          CopyWith$Query$get_event_by_id$business_event_by_pk$service(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_event_by_id$business_event_by_pk$service<
    TRes> {
  factory CopyWith$Query$get_event_by_id$business_event_by_pk$service(
    Query$get_event_by_id$business_event_by_pk$service instance,
    TRes Function(Query$get_event_by_id$business_event_by_pk$service) then,
  ) = _CopyWithImpl$Query$get_event_by_id$business_event_by_pk$service;

  factory CopyWith$Query$get_event_by_id$business_event_by_pk$service.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk$service;

  TRes call({
    dynamic? additional_parameters,
    bool? available,
    String? category1,
    dynamic? cost,
    Query$get_event_by_id$business_event_by_pk$service$description? description,
    int? id,
    dynamic? image,
    Query$get_event_by_id$business_event_by_pk$service$name? name,
    int? position,
    String? $__typename,
  });
  CopyWith$Query$get_event_by_id$business_event_by_pk$service$description<TRes>
      get description;
  CopyWith$Query$get_event_by_id$business_event_by_pk$service$name<TRes>
      get name;
}

class _CopyWithImpl$Query$get_event_by_id$business_event_by_pk$service<TRes>
    implements
        CopyWith$Query$get_event_by_id$business_event_by_pk$service<TRes> {
  _CopyWithImpl$Query$get_event_by_id$business_event_by_pk$service(
    this._instance,
    this._then,
  );

  final Query$get_event_by_id$business_event_by_pk$service _instance;

  final TRes Function(Query$get_event_by_id$business_event_by_pk$service) _then;

  static const _undefined = {};

  TRes call({
    Object? additional_parameters = _undefined,
    Object? available = _undefined,
    Object? category1 = _undefined,
    Object? cost = _undefined,
    Object? description = _undefined,
    Object? id = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? position = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_event_by_id$business_event_by_pk$service(
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
        description: description == _undefined
            ? _instance.description
            : (description
                as Query$get_event_by_id$business_event_by_pk$service$description?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        image: image == _undefined ? _instance.image : (image as dynamic?),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as Query$get_event_by_id$business_event_by_pk$service$name),
        position: position == _undefined || position == null
            ? _instance.position
            : (position as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_event_by_id$business_event_by_pk$service$description<TRes>
      get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Query$get_event_by_id$business_event_by_pk$service$description
            .stub(_then(_instance))
        : CopyWith$Query$get_event_by_id$business_event_by_pk$service$description(
            local$description, (e) => call(description: e));
  }

  CopyWith$Query$get_event_by_id$business_event_by_pk$service$name<TRes>
      get name {
    final local$name = _instance.name;
    return CopyWith$Query$get_event_by_id$business_event_by_pk$service$name(
        local$name, (e) => call(name: e));
  }
}

class _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk$service<TRes>
    implements
        CopyWith$Query$get_event_by_id$business_event_by_pk$service<TRes> {
  _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk$service(
      this._res);

  TRes _res;

  call({
    dynamic? additional_parameters,
    bool? available,
    String? category1,
    dynamic? cost,
    Query$get_event_by_id$business_event_by_pk$service$description? description,
    int? id,
    dynamic? image,
    Query$get_event_by_id$business_event_by_pk$service$name? name,
    int? position,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_event_by_id$business_event_by_pk$service$description<TRes>
      get description =>
          CopyWith$Query$get_event_by_id$business_event_by_pk$service$description
              .stub(_res);
  CopyWith$Query$get_event_by_id$business_event_by_pk$service$name<TRes>
      get name =>
          CopyWith$Query$get_event_by_id$business_event_by_pk$service$name.stub(
              _res);
}

class Query$get_event_by_id$business_event_by_pk$service$description {
  Query$get_event_by_id$business_event_by_pk$service$description({
    required this.translations,
    required this.$__typename,
  });

  factory Query$get_event_by_id$business_event_by_pk$service$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$get_event_by_id$business_event_by_pk$service$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$get_event_by_id$business_event_by_pk$service$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$get_event_by_id$business_event_by_pk$service$description$translations>
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
            is Query$get_event_by_id$business_event_by_pk$service$description) ||
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

extension UtilityExtension$Query$get_event_by_id$business_event_by_pk$service$description
    on Query$get_event_by_id$business_event_by_pk$service$description {
  CopyWith$Query$get_event_by_id$business_event_by_pk$service$description<
          Query$get_event_by_id$business_event_by_pk$service$description>
      get copyWith =>
          CopyWith$Query$get_event_by_id$business_event_by_pk$service$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_event_by_id$business_event_by_pk$service$description<
    TRes> {
  factory CopyWith$Query$get_event_by_id$business_event_by_pk$service$description(
    Query$get_event_by_id$business_event_by_pk$service$description instance,
    TRes Function(
            Query$get_event_by_id$business_event_by_pk$service$description)
        then,
  ) = _CopyWithImpl$Query$get_event_by_id$business_event_by_pk$service$description;

  factory CopyWith$Query$get_event_by_id$business_event_by_pk$service$description.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk$service$description;

  TRes call({
    List<Query$get_event_by_id$business_event_by_pk$service$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$get_event_by_id$business_event_by_pk$service$description$translations> Function(
              Iterable<
                  CopyWith$Query$get_event_by_id$business_event_by_pk$service$description$translations<
                      Query$get_event_by_id$business_event_by_pk$service$description$translations>>)
          _fn);
}

class _CopyWithImpl$Query$get_event_by_id$business_event_by_pk$service$description<
        TRes>
    implements
        CopyWith$Query$get_event_by_id$business_event_by_pk$service$description<
            TRes> {
  _CopyWithImpl$Query$get_event_by_id$business_event_by_pk$service$description(
    this._instance,
    this._then,
  );

  final Query$get_event_by_id$business_event_by_pk$service$description
      _instance;

  final TRes Function(
      Query$get_event_by_id$business_event_by_pk$service$description) _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_event_by_id$business_event_by_pk$service$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$get_event_by_id$business_event_by_pk$service$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$get_event_by_id$business_event_by_pk$service$description$translations> Function(
                  Iterable<
                      CopyWith$Query$get_event_by_id$business_event_by_pk$service$description$translations<
                          Query$get_event_by_id$business_event_by_pk$service$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$get_event_by_id$business_event_by_pk$service$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk$service$description<
        TRes>
    implements
        CopyWith$Query$get_event_by_id$business_event_by_pk$service$description<
            TRes> {
  _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk$service$description(
      this._res);

  TRes _res;

  call({
    List<Query$get_event_by_id$business_event_by_pk$service$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$get_event_by_id$business_event_by_pk$service$description$translations {
  Query$get_event_by_id$business_event_by_pk$service$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$get_event_by_id$business_event_by_pk$service$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$get_event_by_id$business_event_by_pk$service$description$translations(
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
            is Query$get_event_by_id$business_event_by_pk$service$description$translations) ||
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

extension UtilityExtension$Query$get_event_by_id$business_event_by_pk$service$description$translations
    on Query$get_event_by_id$business_event_by_pk$service$description$translations {
  CopyWith$Query$get_event_by_id$business_event_by_pk$service$description$translations<
          Query$get_event_by_id$business_event_by_pk$service$description$translations>
      get copyWith =>
          CopyWith$Query$get_event_by_id$business_event_by_pk$service$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_event_by_id$business_event_by_pk$service$description$translations<
    TRes> {
  factory CopyWith$Query$get_event_by_id$business_event_by_pk$service$description$translations(
    Query$get_event_by_id$business_event_by_pk$service$description$translations
        instance,
    TRes Function(
            Query$get_event_by_id$business_event_by_pk$service$description$translations)
        then,
  ) = _CopyWithImpl$Query$get_event_by_id$business_event_by_pk$service$description$translations;

  factory CopyWith$Query$get_event_by_id$business_event_by_pk$service$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk$service$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_event_by_id$business_event_by_pk$service$description$translations<
        TRes>
    implements
        CopyWith$Query$get_event_by_id$business_event_by_pk$service$description$translations<
            TRes> {
  _CopyWithImpl$Query$get_event_by_id$business_event_by_pk$service$description$translations(
    this._instance,
    this._then,
  );

  final Query$get_event_by_id$business_event_by_pk$service$description$translations
      _instance;

  final TRes Function(
          Query$get_event_by_id$business_event_by_pk$service$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_event_by_id$business_event_by_pk$service$description$translations(
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

class _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk$service$description$translations<
        TRes>
    implements
        CopyWith$Query$get_event_by_id$business_event_by_pk$service$description$translations<
            TRes> {
  _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk$service$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_event_by_id$business_event_by_pk$service$name {
  Query$get_event_by_id$business_event_by_pk$service$name({
    required this.translations,
    required this.$__typename,
  });

  factory Query$get_event_by_id$business_event_by_pk$service$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$get_event_by_id$business_event_by_pk$service$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$get_event_by_id$business_event_by_pk$service$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$get_event_by_id$business_event_by_pk$service$name$translations>
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
    if (!(other is Query$get_event_by_id$business_event_by_pk$service$name) ||
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

extension UtilityExtension$Query$get_event_by_id$business_event_by_pk$service$name
    on Query$get_event_by_id$business_event_by_pk$service$name {
  CopyWith$Query$get_event_by_id$business_event_by_pk$service$name<
          Query$get_event_by_id$business_event_by_pk$service$name>
      get copyWith =>
          CopyWith$Query$get_event_by_id$business_event_by_pk$service$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_event_by_id$business_event_by_pk$service$name<
    TRes> {
  factory CopyWith$Query$get_event_by_id$business_event_by_pk$service$name(
    Query$get_event_by_id$business_event_by_pk$service$name instance,
    TRes Function(Query$get_event_by_id$business_event_by_pk$service$name) then,
  ) = _CopyWithImpl$Query$get_event_by_id$business_event_by_pk$service$name;

  factory CopyWith$Query$get_event_by_id$business_event_by_pk$service$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk$service$name;

  TRes call({
    List<Query$get_event_by_id$business_event_by_pk$service$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$get_event_by_id$business_event_by_pk$service$name$translations> Function(
              Iterable<
                  CopyWith$Query$get_event_by_id$business_event_by_pk$service$name$translations<
                      Query$get_event_by_id$business_event_by_pk$service$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$get_event_by_id$business_event_by_pk$service$name<
        TRes>
    implements
        CopyWith$Query$get_event_by_id$business_event_by_pk$service$name<TRes> {
  _CopyWithImpl$Query$get_event_by_id$business_event_by_pk$service$name(
    this._instance,
    this._then,
  );

  final Query$get_event_by_id$business_event_by_pk$service$name _instance;

  final TRes Function(Query$get_event_by_id$business_event_by_pk$service$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_event_by_id$business_event_by_pk$service$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$get_event_by_id$business_event_by_pk$service$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$get_event_by_id$business_event_by_pk$service$name$translations> Function(
                  Iterable<
                      CopyWith$Query$get_event_by_id$business_event_by_pk$service$name$translations<
                          Query$get_event_by_id$business_event_by_pk$service$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$get_event_by_id$business_event_by_pk$service$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk$service$name<
        TRes>
    implements
        CopyWith$Query$get_event_by_id$business_event_by_pk$service$name<TRes> {
  _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk$service$name(
      this._res);

  TRes _res;

  call({
    List<Query$get_event_by_id$business_event_by_pk$service$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$get_event_by_id$business_event_by_pk$service$name$translations {
  Query$get_event_by_id$business_event_by_pk$service$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$get_event_by_id$business_event_by_pk$service$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$get_event_by_id$business_event_by_pk$service$name$translations(
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
            is Query$get_event_by_id$business_event_by_pk$service$name$translations) ||
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

extension UtilityExtension$Query$get_event_by_id$business_event_by_pk$service$name$translations
    on Query$get_event_by_id$business_event_by_pk$service$name$translations {
  CopyWith$Query$get_event_by_id$business_event_by_pk$service$name$translations<
          Query$get_event_by_id$business_event_by_pk$service$name$translations>
      get copyWith =>
          CopyWith$Query$get_event_by_id$business_event_by_pk$service$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_event_by_id$business_event_by_pk$service$name$translations<
    TRes> {
  factory CopyWith$Query$get_event_by_id$business_event_by_pk$service$name$translations(
    Query$get_event_by_id$business_event_by_pk$service$name$translations
        instance,
    TRes Function(
            Query$get_event_by_id$business_event_by_pk$service$name$translations)
        then,
  ) = _CopyWithImpl$Query$get_event_by_id$business_event_by_pk$service$name$translations;

  factory CopyWith$Query$get_event_by_id$business_event_by_pk$service$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk$service$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_event_by_id$business_event_by_pk$service$name$translations<
        TRes>
    implements
        CopyWith$Query$get_event_by_id$business_event_by_pk$service$name$translations<
            TRes> {
  _CopyWithImpl$Query$get_event_by_id$business_event_by_pk$service$name$translations(
    this._instance,
    this._then,
  );

  final Query$get_event_by_id$business_event_by_pk$service$name$translations
      _instance;

  final TRes Function(
          Query$get_event_by_id$business_event_by_pk$service$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_event_by_id$business_event_by_pk$service$name$translations(
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

class _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk$service$name$translations<
        TRes>
    implements
        CopyWith$Query$get_event_by_id$business_event_by_pk$service$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk$service$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$get_event_by_category {
  factory Variables$Query$get_event_by_category({
    String? category1,
    required double distance,
    required Geography from,
    int? limit,
    int? offset,
    String? category2,
    String? schedule_type,
  }) =>
      Variables$Query$get_event_by_category._({
        if (category1 != null) r'category1': category1,
        r'distance': distance,
        r'from': from,
        if (limit != null) r'limit': limit,
        if (offset != null) r'offset': offset,
        if (category2 != null) r'category2': category2,
        if (schedule_type != null) r'schedule_type': schedule_type,
      });

  Variables$Query$get_event_by_category._(this._$data);

  factory Variables$Query$get_event_by_category.fromJson(
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
    if (data.containsKey('limit')) {
      final l$limit = data['limit'];
      result$data['limit'] = (l$limit as int?);
    }
    if (data.containsKey('offset')) {
      final l$offset = data['offset'];
      result$data['offset'] = (l$offset as int?);
    }
    if (data.containsKey('category2')) {
      final l$category2 = data['category2'];
      result$data['category2'] = (l$category2 as String?);
    }
    if (data.containsKey('schedule_type')) {
      final l$schedule_type = data['schedule_type'];
      result$data['schedule_type'] = (l$schedule_type as String?);
    }
    return Variables$Query$get_event_by_category._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get category1 => (_$data['category1'] as String?);
  double get distance => (_$data['distance'] as double);
  Geography get from => (_$data['from'] as Geography);
  int? get limit => (_$data['limit'] as int?);
  int? get offset => (_$data['offset'] as int?);
  String? get category2 => (_$data['category2'] as String?);
  String? get schedule_type => (_$data['schedule_type'] as String?);
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
    if (_$data.containsKey('limit')) {
      final l$limit = limit;
      result$data['limit'] = l$limit;
    }
    if (_$data.containsKey('offset')) {
      final l$offset = offset;
      result$data['offset'] = l$offset;
    }
    if (_$data.containsKey('category2')) {
      final l$category2 = category2;
      result$data['category2'] = l$category2;
    }
    if (_$data.containsKey('schedule_type')) {
      final l$schedule_type = schedule_type;
      result$data['schedule_type'] = l$schedule_type;
    }
    return result$data;
  }

  CopyWith$Variables$Query$get_event_by_category<
          Variables$Query$get_event_by_category>
      get copyWith => CopyWith$Variables$Query$get_event_by_category(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_event_by_category) ||
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
    final l$limit = limit;
    final lOther$limit = other.limit;
    if (_$data.containsKey('limit') != other._$data.containsKey('limit')) {
      return false;
    }
    if (l$limit != lOther$limit) {
      return false;
    }
    final l$offset = offset;
    final lOther$offset = other.offset;
    if (_$data.containsKey('offset') != other._$data.containsKey('offset')) {
      return false;
    }
    if (l$offset != lOther$offset) {
      return false;
    }
    final l$category2 = category2;
    final lOther$category2 = other.category2;
    if (_$data.containsKey('category2') !=
        other._$data.containsKey('category2')) {
      return false;
    }
    if (l$category2 != lOther$category2) {
      return false;
    }
    final l$schedule_type = schedule_type;
    final lOther$schedule_type = other.schedule_type;
    if (_$data.containsKey('schedule_type') !=
        other._$data.containsKey('schedule_type')) {
      return false;
    }
    if (l$schedule_type != lOther$schedule_type) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$category1 = category1;
    final l$distance = distance;
    final l$from = from;
    final l$limit = limit;
    final l$offset = offset;
    final l$category2 = category2;
    final l$schedule_type = schedule_type;
    return Object.hashAll([
      _$data.containsKey('category1') ? l$category1 : const {},
      l$distance,
      l$from,
      _$data.containsKey('limit') ? l$limit : const {},
      _$data.containsKey('offset') ? l$offset : const {},
      _$data.containsKey('category2') ? l$category2 : const {},
      _$data.containsKey('schedule_type') ? l$schedule_type : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$get_event_by_category<TRes> {
  factory CopyWith$Variables$Query$get_event_by_category(
    Variables$Query$get_event_by_category instance,
    TRes Function(Variables$Query$get_event_by_category) then,
  ) = _CopyWithImpl$Variables$Query$get_event_by_category;

  factory CopyWith$Variables$Query$get_event_by_category.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$get_event_by_category;

  TRes call({
    String? category1,
    double? distance,
    Geography? from,
    int? limit,
    int? offset,
    String? category2,
    String? schedule_type,
  });
}

class _CopyWithImpl$Variables$Query$get_event_by_category<TRes>
    implements CopyWith$Variables$Query$get_event_by_category<TRes> {
  _CopyWithImpl$Variables$Query$get_event_by_category(
    this._instance,
    this._then,
  );

  final Variables$Query$get_event_by_category _instance;

  final TRes Function(Variables$Query$get_event_by_category) _then;

  static const _undefined = {};

  TRes call({
    Object? category1 = _undefined,
    Object? distance = _undefined,
    Object? from = _undefined,
    Object? limit = _undefined,
    Object? offset = _undefined,
    Object? category2 = _undefined,
    Object? schedule_type = _undefined,
  }) =>
      _then(Variables$Query$get_event_by_category._({
        ..._instance._$data,
        if (category1 != _undefined) 'category1': (category1 as String?),
        if (distance != _undefined && distance != null)
          'distance': (distance as double),
        if (from != _undefined && from != null) 'from': (from as Geography),
        if (limit != _undefined) 'limit': (limit as int?),
        if (offset != _undefined) 'offset': (offset as int?),
        if (category2 != _undefined) 'category2': (category2 as String?),
        if (schedule_type != _undefined)
          'schedule_type': (schedule_type as String?),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_event_by_category<TRes>
    implements CopyWith$Variables$Query$get_event_by_category<TRes> {
  _CopyWithStubImpl$Variables$Query$get_event_by_category(this._res);

  TRes _res;

  call({
    String? category1,
    double? distance,
    Geography? from,
    int? limit,
    int? offset,
    String? category2,
    String? schedule_type,
  }) =>
      _res;
}

class Query$get_event_by_category {
  Query$get_event_by_category({
    required this.business_event,
    required this.$__typename,
  });

  factory Query$get_event_by_category.fromJson(Map<String, dynamic> json) {
    final l$business_event = json['business_event'];
    final l$$__typename = json['__typename'];
    return Query$get_event_by_category(
      business_event: (l$business_event as List<dynamic>)
          .map((e) => Query$get_event_by_category$business_event.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$get_event_by_category$business_event> business_event;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$business_event = business_event;
    _resultData['business_event'] =
        l$business_event.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$business_event = business_event;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$business_event.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_event_by_category) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$business_event = business_event;
    final lOther$business_event = other.business_event;
    if (l$business_event.length != lOther$business_event.length) {
      return false;
    }
    for (int i = 0; i < l$business_event.length; i++) {
      final l$business_event$entry = l$business_event[i];
      final lOther$business_event$entry = lOther$business_event[i];
      if (l$business_event$entry != lOther$business_event$entry) {
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

extension UtilityExtension$Query$get_event_by_category
    on Query$get_event_by_category {
  CopyWith$Query$get_event_by_category<Query$get_event_by_category>
      get copyWith => CopyWith$Query$get_event_by_category(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_event_by_category<TRes> {
  factory CopyWith$Query$get_event_by_category(
    Query$get_event_by_category instance,
    TRes Function(Query$get_event_by_category) then,
  ) = _CopyWithImpl$Query$get_event_by_category;

  factory CopyWith$Query$get_event_by_category.stub(TRes res) =
      _CopyWithStubImpl$Query$get_event_by_category;

  TRes call({
    List<Query$get_event_by_category$business_event>? business_event,
    String? $__typename,
  });
  TRes business_event(
      Iterable<Query$get_event_by_category$business_event> Function(
              Iterable<
                  CopyWith$Query$get_event_by_category$business_event<
                      Query$get_event_by_category$business_event>>)
          _fn);
}

class _CopyWithImpl$Query$get_event_by_category<TRes>
    implements CopyWith$Query$get_event_by_category<TRes> {
  _CopyWithImpl$Query$get_event_by_category(
    this._instance,
    this._then,
  );

  final Query$get_event_by_category _instance;

  final TRes Function(Query$get_event_by_category) _then;

  static const _undefined = {};

  TRes call({
    Object? business_event = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_event_by_category(
        business_event: business_event == _undefined || business_event == null
            ? _instance.business_event
            : (business_event
                as List<Query$get_event_by_category$business_event>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes business_event(
          Iterable<Query$get_event_by_category$business_event> Function(
                  Iterable<
                      CopyWith$Query$get_event_by_category$business_event<
                          Query$get_event_by_category$business_event>>)
              _fn) =>
      call(
          business_event: _fn(_instance.business_event
              .map((e) => CopyWith$Query$get_event_by_category$business_event(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$get_event_by_category<TRes>
    implements CopyWith$Query$get_event_by_category<TRes> {
  _CopyWithStubImpl$Query$get_event_by_category(this._res);

  TRes _res;

  call({
    List<Query$get_event_by_category$business_event>? business_event,
    String? $__typename,
  }) =>
      _res;
  business_event(_fn) => _res;
}

const documentNodeQueryget_event_by_category = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_event_by_category'),
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
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'limit')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'offset')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'category2')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'schedule_type')),
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
        name: NameNode(value: 'business_event'),
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
                        name: NameNode(value: '_and'),
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
                          ),
                          ObjectFieldNode(
                            name: NameNode(value: 'category2'),
                            value: ObjectValueNode(fields: [
                              ObjectFieldNode(
                                name: NameNode(value: '_eq'),
                                value: VariableNode(
                                    name: NameNode(value: 'category2')),
                              )
                            ]),
                          ),
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
                  ObjectFieldNode(
                    name: NameNode(value: 'schedule_type'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                        name: NameNode(value: '_eq'),
                        value: VariableNode(
                            name: NameNode(value: 'schedule_type')),
                      )
                    ]),
                  ),
                ]),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: 'limit'),
            value: VariableNode(name: NameNode(value: 'limit')),
          ),
          ArgumentNode(
            name: NameNode(value: 'offset'),
            value: VariableNode(name: NameNode(value: 'offset')),
          ),
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
                    name: NameNode(value: 'name'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'location'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'gps'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'address'),
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
Query$get_event_by_category _parserFn$Query$get_event_by_category(
        Map<String, dynamic> data) =>
    Query$get_event_by_category.fromJson(data);

class Options$Query$get_event_by_category
    extends graphql.QueryOptions<Query$get_event_by_category> {
  Options$Query$get_event_by_category({
    String? operationName,
    required Variables$Query$get_event_by_category variables,
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
          document: documentNodeQueryget_event_by_category,
          parserFn: _parserFn$Query$get_event_by_category,
        );
}

class WatchOptions$Query$get_event_by_category
    extends graphql.WatchQueryOptions<Query$get_event_by_category> {
  WatchOptions$Query$get_event_by_category({
    String? operationName,
    required Variables$Query$get_event_by_category variables,
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
          document: documentNodeQueryget_event_by_category,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_event_by_category,
        );
}

class FetchMoreOptions$Query$get_event_by_category
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_event_by_category({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_event_by_category variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_event_by_category,
        );
}

extension ClientExtension$Query$get_event_by_category on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_event_by_category>>
      query$get_event_by_category(
              Options$Query$get_event_by_category options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$get_event_by_category>
      watchQuery$get_event_by_category(
              WatchOptions$Query$get_event_by_category options) =>
          this.watchQuery(options);
  void writeQuery$get_event_by_category({
    required Query$get_event_by_category data,
    required Variables$Query$get_event_by_category variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryget_event_by_category),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_event_by_category? readQuery$get_event_by_category({
    required Variables$Query$get_event_by_category variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryget_event_by_category),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$get_event_by_category.fromJson(result);
  }
}

class Query$get_event_by_category$business_event {
  Query$get_event_by_category$business_event({
    required this.service,
    required this.id,
    required this.business,
    required this.$__typename,
  });

  factory Query$get_event_by_category$business_event.fromJson(
      Map<String, dynamic> json) {
    final l$service = json['service'];
    final l$id = json['id'];
    final l$business = json['business'];
    final l$$__typename = json['__typename'];
    return Query$get_event_by_category$business_event(
      service: Query$get_event_by_category$business_event$service.fromJson(
          (l$service as Map<String, dynamic>)),
      id: (l$id as int),
      business: Query$get_event_by_category$business_event$business.fromJson(
          (l$business as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_event_by_category$business_event$service service;

  final int id;

  final Query$get_event_by_category$business_event$business business;

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
    if (!(other is Query$get_event_by_category$business_event) ||
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

extension UtilityExtension$Query$get_event_by_category$business_event
    on Query$get_event_by_category$business_event {
  CopyWith$Query$get_event_by_category$business_event<
          Query$get_event_by_category$business_event>
      get copyWith => CopyWith$Query$get_event_by_category$business_event(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_event_by_category$business_event<TRes> {
  factory CopyWith$Query$get_event_by_category$business_event(
    Query$get_event_by_category$business_event instance,
    TRes Function(Query$get_event_by_category$business_event) then,
  ) = _CopyWithImpl$Query$get_event_by_category$business_event;

  factory CopyWith$Query$get_event_by_category$business_event.stub(TRes res) =
      _CopyWithStubImpl$Query$get_event_by_category$business_event;

  TRes call({
    Query$get_event_by_category$business_event$service? service,
    int? id,
    Query$get_event_by_category$business_event$business? business,
    String? $__typename,
  });
  CopyWith$Query$get_event_by_category$business_event$service<TRes> get service;
  CopyWith$Query$get_event_by_category$business_event$business<TRes>
      get business;
}

class _CopyWithImpl$Query$get_event_by_category$business_event<TRes>
    implements CopyWith$Query$get_event_by_category$business_event<TRes> {
  _CopyWithImpl$Query$get_event_by_category$business_event(
    this._instance,
    this._then,
  );

  final Query$get_event_by_category$business_event _instance;

  final TRes Function(Query$get_event_by_category$business_event) _then;

  static const _undefined = {};

  TRes call({
    Object? service = _undefined,
    Object? id = _undefined,
    Object? business = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_event_by_category$business_event(
        service: service == _undefined || service == null
            ? _instance.service
            : (service as Query$get_event_by_category$business_event$service),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        business: business == _undefined || business == null
            ? _instance.business
            : (business as Query$get_event_by_category$business_event$business),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_event_by_category$business_event$service<TRes>
      get service {
    final local$service = _instance.service;
    return CopyWith$Query$get_event_by_category$business_event$service(
        local$service, (e) => call(service: e));
  }

  CopyWith$Query$get_event_by_category$business_event$business<TRes>
      get business {
    final local$business = _instance.business;
    return CopyWith$Query$get_event_by_category$business_event$business(
        local$business, (e) => call(business: e));
  }
}

class _CopyWithStubImpl$Query$get_event_by_category$business_event<TRes>
    implements CopyWith$Query$get_event_by_category$business_event<TRes> {
  _CopyWithStubImpl$Query$get_event_by_category$business_event(this._res);

  TRes _res;

  call({
    Query$get_event_by_category$business_event$service? service,
    int? id,
    Query$get_event_by_category$business_event$business? business,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_event_by_category$business_event$service<TRes>
      get service =>
          CopyWith$Query$get_event_by_category$business_event$service.stub(
              _res);
  CopyWith$Query$get_event_by_category$business_event$business<TRes>
      get business =>
          CopyWith$Query$get_event_by_category$business_event$business.stub(
              _res);
}

class Query$get_event_by_category$business_event$service {
  Query$get_event_by_category$business_event$service({
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

  factory Query$get_event_by_category$business_event$service.fromJson(
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
    return Query$get_event_by_category$business_event$service(
      id: (l$id as int),
      name: Query$get_event_by_category$business_event$service$name.fromJson(
          (l$name as Map<String, dynamic>)),
      description: l$description == null
          ? null
          : Query$get_event_by_category$business_event$service$description
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

  final Query$get_event_by_category$business_event$service$name name;

  final Query$get_event_by_category$business_event$service$description?
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
    if (!(other is Query$get_event_by_category$business_event$service) ||
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

extension UtilityExtension$Query$get_event_by_category$business_event$service
    on Query$get_event_by_category$business_event$service {
  CopyWith$Query$get_event_by_category$business_event$service<
          Query$get_event_by_category$business_event$service>
      get copyWith =>
          CopyWith$Query$get_event_by_category$business_event$service(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_event_by_category$business_event$service<
    TRes> {
  factory CopyWith$Query$get_event_by_category$business_event$service(
    Query$get_event_by_category$business_event$service instance,
    TRes Function(Query$get_event_by_category$business_event$service) then,
  ) = _CopyWithImpl$Query$get_event_by_category$business_event$service;

  factory CopyWith$Query$get_event_by_category$business_event$service.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_event_by_category$business_event$service;

  TRes call({
    int? id,
    Query$get_event_by_category$business_event$service$name? name,
    Query$get_event_by_category$business_event$service$description? description,
    dynamic? additional_parameters,
    bool? available,
    String? category1,
    dynamic? cost,
    dynamic? image,
    int? position,
    String? $__typename,
  });
  CopyWith$Query$get_event_by_category$business_event$service$name<TRes>
      get name;
  CopyWith$Query$get_event_by_category$business_event$service$description<TRes>
      get description;
}

class _CopyWithImpl$Query$get_event_by_category$business_event$service<TRes>
    implements
        CopyWith$Query$get_event_by_category$business_event$service<TRes> {
  _CopyWithImpl$Query$get_event_by_category$business_event$service(
    this._instance,
    this._then,
  );

  final Query$get_event_by_category$business_event$service _instance;

  final TRes Function(Query$get_event_by_category$business_event$service) _then;

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
      _then(Query$get_event_by_category$business_event$service(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as Query$get_event_by_category$business_event$service$name),
        description: description == _undefined
            ? _instance.description
            : (description
                as Query$get_event_by_category$business_event$service$description?),
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
  CopyWith$Query$get_event_by_category$business_event$service$name<TRes>
      get name {
    final local$name = _instance.name;
    return CopyWith$Query$get_event_by_category$business_event$service$name(
        local$name, (e) => call(name: e));
  }

  CopyWith$Query$get_event_by_category$business_event$service$description<TRes>
      get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Query$get_event_by_category$business_event$service$description
            .stub(_then(_instance))
        : CopyWith$Query$get_event_by_category$business_event$service$description(
            local$description, (e) => call(description: e));
  }
}

class _CopyWithStubImpl$Query$get_event_by_category$business_event$service<TRes>
    implements
        CopyWith$Query$get_event_by_category$business_event$service<TRes> {
  _CopyWithStubImpl$Query$get_event_by_category$business_event$service(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$get_event_by_category$business_event$service$name? name,
    Query$get_event_by_category$business_event$service$description? description,
    dynamic? additional_parameters,
    bool? available,
    String? category1,
    dynamic? cost,
    dynamic? image,
    int? position,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_event_by_category$business_event$service$name<TRes>
      get name =>
          CopyWith$Query$get_event_by_category$business_event$service$name.stub(
              _res);
  CopyWith$Query$get_event_by_category$business_event$service$description<TRes>
      get description =>
          CopyWith$Query$get_event_by_category$business_event$service$description
              .stub(_res);
}

class Query$get_event_by_category$business_event$service$name {
  Query$get_event_by_category$business_event$service$name({
    required this.translations,
    required this.$__typename,
  });

  factory Query$get_event_by_category$business_event$service$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$get_event_by_category$business_event$service$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$get_event_by_category$business_event$service$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$get_event_by_category$business_event$service$name$translations>
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
    if (!(other is Query$get_event_by_category$business_event$service$name) ||
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

extension UtilityExtension$Query$get_event_by_category$business_event$service$name
    on Query$get_event_by_category$business_event$service$name {
  CopyWith$Query$get_event_by_category$business_event$service$name<
          Query$get_event_by_category$business_event$service$name>
      get copyWith =>
          CopyWith$Query$get_event_by_category$business_event$service$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_event_by_category$business_event$service$name<
    TRes> {
  factory CopyWith$Query$get_event_by_category$business_event$service$name(
    Query$get_event_by_category$business_event$service$name instance,
    TRes Function(Query$get_event_by_category$business_event$service$name) then,
  ) = _CopyWithImpl$Query$get_event_by_category$business_event$service$name;

  factory CopyWith$Query$get_event_by_category$business_event$service$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_event_by_category$business_event$service$name;

  TRes call({
    List<Query$get_event_by_category$business_event$service$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$get_event_by_category$business_event$service$name$translations> Function(
              Iterable<
                  CopyWith$Query$get_event_by_category$business_event$service$name$translations<
                      Query$get_event_by_category$business_event$service$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$get_event_by_category$business_event$service$name<
        TRes>
    implements
        CopyWith$Query$get_event_by_category$business_event$service$name<TRes> {
  _CopyWithImpl$Query$get_event_by_category$business_event$service$name(
    this._instance,
    this._then,
  );

  final Query$get_event_by_category$business_event$service$name _instance;

  final TRes Function(Query$get_event_by_category$business_event$service$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_event_by_category$business_event$service$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$get_event_by_category$business_event$service$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$get_event_by_category$business_event$service$name$translations> Function(
                  Iterable<
                      CopyWith$Query$get_event_by_category$business_event$service$name$translations<
                          Query$get_event_by_category$business_event$service$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$get_event_by_category$business_event$service$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_event_by_category$business_event$service$name<
        TRes>
    implements
        CopyWith$Query$get_event_by_category$business_event$service$name<TRes> {
  _CopyWithStubImpl$Query$get_event_by_category$business_event$service$name(
      this._res);

  TRes _res;

  call({
    List<Query$get_event_by_category$business_event$service$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$get_event_by_category$business_event$service$name$translations {
  Query$get_event_by_category$business_event$service$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$get_event_by_category$business_event$service$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$get_event_by_category$business_event$service$name$translations(
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
            is Query$get_event_by_category$business_event$service$name$translations) ||
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

extension UtilityExtension$Query$get_event_by_category$business_event$service$name$translations
    on Query$get_event_by_category$business_event$service$name$translations {
  CopyWith$Query$get_event_by_category$business_event$service$name$translations<
          Query$get_event_by_category$business_event$service$name$translations>
      get copyWith =>
          CopyWith$Query$get_event_by_category$business_event$service$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_event_by_category$business_event$service$name$translations<
    TRes> {
  factory CopyWith$Query$get_event_by_category$business_event$service$name$translations(
    Query$get_event_by_category$business_event$service$name$translations
        instance,
    TRes Function(
            Query$get_event_by_category$business_event$service$name$translations)
        then,
  ) = _CopyWithImpl$Query$get_event_by_category$business_event$service$name$translations;

  factory CopyWith$Query$get_event_by_category$business_event$service$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_event_by_category$business_event$service$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_event_by_category$business_event$service$name$translations<
        TRes>
    implements
        CopyWith$Query$get_event_by_category$business_event$service$name$translations<
            TRes> {
  _CopyWithImpl$Query$get_event_by_category$business_event$service$name$translations(
    this._instance,
    this._then,
  );

  final Query$get_event_by_category$business_event$service$name$translations
      _instance;

  final TRes Function(
          Query$get_event_by_category$business_event$service$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_event_by_category$business_event$service$name$translations(
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

class _CopyWithStubImpl$Query$get_event_by_category$business_event$service$name$translations<
        TRes>
    implements
        CopyWith$Query$get_event_by_category$business_event$service$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$get_event_by_category$business_event$service$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_event_by_category$business_event$service$description {
  Query$get_event_by_category$business_event$service$description({
    required this.translations,
    required this.$__typename,
  });

  factory Query$get_event_by_category$business_event$service$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$get_event_by_category$business_event$service$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$get_event_by_category$business_event$service$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$get_event_by_category$business_event$service$description$translations>
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
            is Query$get_event_by_category$business_event$service$description) ||
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

extension UtilityExtension$Query$get_event_by_category$business_event$service$description
    on Query$get_event_by_category$business_event$service$description {
  CopyWith$Query$get_event_by_category$business_event$service$description<
          Query$get_event_by_category$business_event$service$description>
      get copyWith =>
          CopyWith$Query$get_event_by_category$business_event$service$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_event_by_category$business_event$service$description<
    TRes> {
  factory CopyWith$Query$get_event_by_category$business_event$service$description(
    Query$get_event_by_category$business_event$service$description instance,
    TRes Function(
            Query$get_event_by_category$business_event$service$description)
        then,
  ) = _CopyWithImpl$Query$get_event_by_category$business_event$service$description;

  factory CopyWith$Query$get_event_by_category$business_event$service$description.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_event_by_category$business_event$service$description;

  TRes call({
    List<Query$get_event_by_category$business_event$service$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$get_event_by_category$business_event$service$description$translations> Function(
              Iterable<
                  CopyWith$Query$get_event_by_category$business_event$service$description$translations<
                      Query$get_event_by_category$business_event$service$description$translations>>)
          _fn);
}

class _CopyWithImpl$Query$get_event_by_category$business_event$service$description<
        TRes>
    implements
        CopyWith$Query$get_event_by_category$business_event$service$description<
            TRes> {
  _CopyWithImpl$Query$get_event_by_category$business_event$service$description(
    this._instance,
    this._then,
  );

  final Query$get_event_by_category$business_event$service$description
      _instance;

  final TRes Function(
      Query$get_event_by_category$business_event$service$description) _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_event_by_category$business_event$service$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$get_event_by_category$business_event$service$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$get_event_by_category$business_event$service$description$translations> Function(
                  Iterable<
                      CopyWith$Query$get_event_by_category$business_event$service$description$translations<
                          Query$get_event_by_category$business_event$service$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$get_event_by_category$business_event$service$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_event_by_category$business_event$service$description<
        TRes>
    implements
        CopyWith$Query$get_event_by_category$business_event$service$description<
            TRes> {
  _CopyWithStubImpl$Query$get_event_by_category$business_event$service$description(
      this._res);

  TRes _res;

  call({
    List<Query$get_event_by_category$business_event$service$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$get_event_by_category$business_event$service$description$translations {
  Query$get_event_by_category$business_event$service$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$get_event_by_category$business_event$service$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$get_event_by_category$business_event$service$description$translations(
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
            is Query$get_event_by_category$business_event$service$description$translations) ||
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

extension UtilityExtension$Query$get_event_by_category$business_event$service$description$translations
    on Query$get_event_by_category$business_event$service$description$translations {
  CopyWith$Query$get_event_by_category$business_event$service$description$translations<
          Query$get_event_by_category$business_event$service$description$translations>
      get copyWith =>
          CopyWith$Query$get_event_by_category$business_event$service$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_event_by_category$business_event$service$description$translations<
    TRes> {
  factory CopyWith$Query$get_event_by_category$business_event$service$description$translations(
    Query$get_event_by_category$business_event$service$description$translations
        instance,
    TRes Function(
            Query$get_event_by_category$business_event$service$description$translations)
        then,
  ) = _CopyWithImpl$Query$get_event_by_category$business_event$service$description$translations;

  factory CopyWith$Query$get_event_by_category$business_event$service$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_event_by_category$business_event$service$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_event_by_category$business_event$service$description$translations<
        TRes>
    implements
        CopyWith$Query$get_event_by_category$business_event$service$description$translations<
            TRes> {
  _CopyWithImpl$Query$get_event_by_category$business_event$service$description$translations(
    this._instance,
    this._then,
  );

  final Query$get_event_by_category$business_event$service$description$translations
      _instance;

  final TRes Function(
          Query$get_event_by_category$business_event$service$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_event_by_category$business_event$service$description$translations(
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

class _CopyWithStubImpl$Query$get_event_by_category$business_event$service$description$translations<
        TRes>
    implements
        CopyWith$Query$get_event_by_category$business_event$service$description$translations<
            TRes> {
  _CopyWithStubImpl$Query$get_event_by_category$business_event$service$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_event_by_category$business_event$business {
  Query$get_event_by_category$business_event$business({
    required this.id,
    required this.details,
    required this.$__typename,
  });

  factory Query$get_event_by_category$business_event$business.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$get_event_by_category$business_event$business(
      id: (l$id as int),
      details:
          Query$get_event_by_category$business_event$business$details.fromJson(
              (l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$get_event_by_category$business_event$business$details details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$details = details;
    _resultData['details'] = l$details.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$details = details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$details,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_event_by_category$business_event$business) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$get_event_by_category$business_event$business
    on Query$get_event_by_category$business_event$business {
  CopyWith$Query$get_event_by_category$business_event$business<
          Query$get_event_by_category$business_event$business>
      get copyWith =>
          CopyWith$Query$get_event_by_category$business_event$business(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_event_by_category$business_event$business<
    TRes> {
  factory CopyWith$Query$get_event_by_category$business_event$business(
    Query$get_event_by_category$business_event$business instance,
    TRes Function(Query$get_event_by_category$business_event$business) then,
  ) = _CopyWithImpl$Query$get_event_by_category$business_event$business;

  factory CopyWith$Query$get_event_by_category$business_event$business.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_event_by_category$business_event$business;

  TRes call({
    int? id,
    Query$get_event_by_category$business_event$business$details? details,
    String? $__typename,
  });
  CopyWith$Query$get_event_by_category$business_event$business$details<TRes>
      get details;
}

class _CopyWithImpl$Query$get_event_by_category$business_event$business<TRes>
    implements
        CopyWith$Query$get_event_by_category$business_event$business<TRes> {
  _CopyWithImpl$Query$get_event_by_category$business_event$business(
    this._instance,
    this._then,
  );

  final Query$get_event_by_category$business_event$business _instance;

  final TRes Function(Query$get_event_by_category$business_event$business)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_event_by_category$business_event$business(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Query$get_event_by_category$business_event$business$details),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_event_by_category$business_event$business$details<TRes>
      get details {
    final local$details = _instance.details;
    return CopyWith$Query$get_event_by_category$business_event$business$details(
        local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$get_event_by_category$business_event$business<
        TRes>
    implements
        CopyWith$Query$get_event_by_category$business_event$business<TRes> {
  _CopyWithStubImpl$Query$get_event_by_category$business_event$business(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$get_event_by_category$business_event$business$details? details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_event_by_category$business_event$business$details<TRes>
      get details =>
          CopyWith$Query$get_event_by_category$business_event$business$details
              .stub(_res);
}

class Query$get_event_by_category$business_event$business$details {
  Query$get_event_by_category$business_event$business$details({
    required this.id,
    required this.name,
    required this.location,
    required this.$__typename,
  });

  factory Query$get_event_by_category$business_event$business$details.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$location = json['location'];
    final l$$__typename = json['__typename'];
    return Query$get_event_by_category$business_event$business$details(
      id: (l$id as int),
      name: (l$name as String),
      location:
          Query$get_event_by_category$business_event$business$details$location
              .fromJson((l$location as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String name;

  final Query$get_event_by_category$business_event$business$details$location
      location;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$location = location;
    _resultData['location'] = l$location.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$location = location;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$location,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$get_event_by_category$business_event$business$details) ||
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
    final l$location = location;
    final lOther$location = other.location;
    if (l$location != lOther$location) {
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

extension UtilityExtension$Query$get_event_by_category$business_event$business$details
    on Query$get_event_by_category$business_event$business$details {
  CopyWith$Query$get_event_by_category$business_event$business$details<
          Query$get_event_by_category$business_event$business$details>
      get copyWith =>
          CopyWith$Query$get_event_by_category$business_event$business$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_event_by_category$business_event$business$details<
    TRes> {
  factory CopyWith$Query$get_event_by_category$business_event$business$details(
    Query$get_event_by_category$business_event$business$details instance,
    TRes Function(Query$get_event_by_category$business_event$business$details)
        then,
  ) = _CopyWithImpl$Query$get_event_by_category$business_event$business$details;

  factory CopyWith$Query$get_event_by_category$business_event$business$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_event_by_category$business_event$business$details;

  TRes call({
    int? id,
    String? name,
    Query$get_event_by_category$business_event$business$details$location?
        location,
    String? $__typename,
  });
  CopyWith$Query$get_event_by_category$business_event$business$details$location<
      TRes> get location;
}

class _CopyWithImpl$Query$get_event_by_category$business_event$business$details<
        TRes>
    implements
        CopyWith$Query$get_event_by_category$business_event$business$details<
            TRes> {
  _CopyWithImpl$Query$get_event_by_category$business_event$business$details(
    this._instance,
    this._then,
  );

  final Query$get_event_by_category$business_event$business$details _instance;

  final TRes Function(
      Query$get_event_by_category$business_event$business$details) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? location = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_event_by_category$business_event$business$details(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        location: location == _undefined || location == null
            ? _instance.location
            : (location
                as Query$get_event_by_category$business_event$business$details$location),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_event_by_category$business_event$business$details$location<
      TRes> get location {
    final local$location = _instance.location;
    return CopyWith$Query$get_event_by_category$business_event$business$details$location(
        local$location, (e) => call(location: e));
  }
}

class _CopyWithStubImpl$Query$get_event_by_category$business_event$business$details<
        TRes>
    implements
        CopyWith$Query$get_event_by_category$business_event$business$details<
            TRes> {
  _CopyWithStubImpl$Query$get_event_by_category$business_event$business$details(
      this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    Query$get_event_by_category$business_event$business$details$location?
        location,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_event_by_category$business_event$business$details$location<
          TRes>
      get location =>
          CopyWith$Query$get_event_by_category$business_event$business$details$location
              .stub(_res);
}

class Query$get_event_by_category$business_event$business$details$location {
  Query$get_event_by_category$business_event$business$details$location({
    required this.gps,
    required this.address,
    required this.$__typename,
  });

  factory Query$get_event_by_category$business_event$business$details$location.fromJson(
      Map<String, dynamic> json) {
    final l$gps = json['gps'];
    final l$address = json['address'];
    final l$$__typename = json['__typename'];
    return Query$get_event_by_category$business_event$business$details$location(
      gps: geographyFromJson(l$gps),
      address: (l$address as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Geography gps;

  final String address;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$gps = gps;
    _resultData['gps'] = geographyToJson(l$gps);
    final l$address = address;
    _resultData['address'] = l$address;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$gps = gps;
    final l$address = address;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$gps,
      l$address,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$get_event_by_category$business_event$business$details$location) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$gps = gps;
    final lOther$gps = other.gps;
    if (l$gps != lOther$gps) {
      return false;
    }
    final l$address = address;
    final lOther$address = other.address;
    if (l$address != lOther$address) {
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

extension UtilityExtension$Query$get_event_by_category$business_event$business$details$location
    on Query$get_event_by_category$business_event$business$details$location {
  CopyWith$Query$get_event_by_category$business_event$business$details$location<
          Query$get_event_by_category$business_event$business$details$location>
      get copyWith =>
          CopyWith$Query$get_event_by_category$business_event$business$details$location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_event_by_category$business_event$business$details$location<
    TRes> {
  factory CopyWith$Query$get_event_by_category$business_event$business$details$location(
    Query$get_event_by_category$business_event$business$details$location
        instance,
    TRes Function(
            Query$get_event_by_category$business_event$business$details$location)
        then,
  ) = _CopyWithImpl$Query$get_event_by_category$business_event$business$details$location;

  factory CopyWith$Query$get_event_by_category$business_event$business$details$location.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_event_by_category$business_event$business$details$location;

  TRes call({
    Geography? gps,
    String? address,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_event_by_category$business_event$business$details$location<
        TRes>
    implements
        CopyWith$Query$get_event_by_category$business_event$business$details$location<
            TRes> {
  _CopyWithImpl$Query$get_event_by_category$business_event$business$details$location(
    this._instance,
    this._then,
  );

  final Query$get_event_by_category$business_event$business$details$location
      _instance;

  final TRes Function(
          Query$get_event_by_category$business_event$business$details$location)
      _then;

  static const _undefined = {};

  TRes call({
    Object? gps = _undefined,
    Object? address = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_event_by_category$business_event$business$details$location(
        gps: gps == _undefined || gps == null
            ? _instance.gps
            : (gps as Geography),
        address: address == _undefined || address == null
            ? _instance.address
            : (address as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_event_by_category$business_event$business$details$location<
        TRes>
    implements
        CopyWith$Query$get_event_by_category$business_event$business$details$location<
            TRes> {
  _CopyWithStubImpl$Query$get_event_by_category$business_event$business$details$location(
      this._res);

  TRes _res;

  call({
    Geography? gps,
    String? address,
    String? $__typename,
  }) =>
      _res;
}
