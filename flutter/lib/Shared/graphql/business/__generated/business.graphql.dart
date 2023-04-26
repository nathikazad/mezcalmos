import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Variables$Query$get_business_by_id {
  factory Variables$Query$get_business_by_id({required int id}) =>
      Variables$Query$get_business_by_id._({
        r'id': id,
      });

  Variables$Query$get_business_by_id._(this._$data);

  factory Variables$Query$get_business_by_id.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    return Variables$Query$get_business_by_id._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$get_business_by_id<
          Variables$Query$get_business_by_id>
      get copyWith => CopyWith$Variables$Query$get_business_by_id(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_business_by_id) ||
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

abstract class CopyWith$Variables$Query$get_business_by_id<TRes> {
  factory CopyWith$Variables$Query$get_business_by_id(
    Variables$Query$get_business_by_id instance,
    TRes Function(Variables$Query$get_business_by_id) then,
  ) = _CopyWithImpl$Variables$Query$get_business_by_id;

  factory CopyWith$Variables$Query$get_business_by_id.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$get_business_by_id;

  TRes call({int? id});
}

class _CopyWithImpl$Variables$Query$get_business_by_id<TRes>
    implements CopyWith$Variables$Query$get_business_by_id<TRes> {
  _CopyWithImpl$Variables$Query$get_business_by_id(
    this._instance,
    this._then,
  );

  final Variables$Query$get_business_by_id _instance;

  final TRes Function(Variables$Query$get_business_by_id) _then;

  static const _undefined = {};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$get_business_by_id._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_business_by_id<TRes>
    implements CopyWith$Variables$Query$get_business_by_id<TRes> {
  _CopyWithStubImpl$Variables$Query$get_business_by_id(this._res);

  TRes _res;

  call({int? id}) => _res;
}

class Query$get_business_by_id {
  Query$get_business_by_id({
    this.business_business_by_pk,
    required this.$__typename,
  });

  factory Query$get_business_by_id.fromJson(Map<String, dynamic> json) {
    final l$business_business_by_pk = json['business_business_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$get_business_by_id(
      business_business_by_pk: l$business_business_by_pk == null
          ? null
          : Query$get_business_by_id$business_business_by_pk.fromJson(
              (l$business_business_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_business_by_id$business_business_by_pk?
      business_business_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$business_business_by_pk = business_business_by_pk;
    _resultData['business_business_by_pk'] =
        l$business_business_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$business_business_by_pk = business_business_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$business_business_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_business_by_id) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$business_business_by_pk = business_business_by_pk;
    final lOther$business_business_by_pk = other.business_business_by_pk;
    if (l$business_business_by_pk != lOther$business_business_by_pk) {
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

extension UtilityExtension$Query$get_business_by_id
    on Query$get_business_by_id {
  CopyWith$Query$get_business_by_id<Query$get_business_by_id> get copyWith =>
      CopyWith$Query$get_business_by_id(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$get_business_by_id<TRes> {
  factory CopyWith$Query$get_business_by_id(
    Query$get_business_by_id instance,
    TRes Function(Query$get_business_by_id) then,
  ) = _CopyWithImpl$Query$get_business_by_id;

  factory CopyWith$Query$get_business_by_id.stub(TRes res) =
      _CopyWithStubImpl$Query$get_business_by_id;

  TRes call({
    Query$get_business_by_id$business_business_by_pk? business_business_by_pk,
    String? $__typename,
  });
  CopyWith$Query$get_business_by_id$business_business_by_pk<TRes>
      get business_business_by_pk;
}

class _CopyWithImpl$Query$get_business_by_id<TRes>
    implements CopyWith$Query$get_business_by_id<TRes> {
  _CopyWithImpl$Query$get_business_by_id(
    this._instance,
    this._then,
  );

  final Query$get_business_by_id _instance;

  final TRes Function(Query$get_business_by_id) _then;

  static const _undefined = {};

  TRes call({
    Object? business_business_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_business_by_id(
        business_business_by_pk: business_business_by_pk == _undefined
            ? _instance.business_business_by_pk
            : (business_business_by_pk
                as Query$get_business_by_id$business_business_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_business_by_id$business_business_by_pk<TRes>
      get business_business_by_pk {
    final local$business_business_by_pk = _instance.business_business_by_pk;
    return local$business_business_by_pk == null
        ? CopyWith$Query$get_business_by_id$business_business_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$get_business_by_id$business_business_by_pk(
            local$business_business_by_pk,
            (e) => call(business_business_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$get_business_by_id<TRes>
    implements CopyWith$Query$get_business_by_id<TRes> {
  _CopyWithStubImpl$Query$get_business_by_id(this._res);

  TRes _res;

  call({
    Query$get_business_by_id$business_business_by_pk? business_business_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_business_by_id$business_business_by_pk<TRes>
      get business_business_by_pk =>
          CopyWith$Query$get_business_by_id$business_business_by_pk.stub(_res);
}

const documentNodeQueryget_business_by_id = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_business_by_id'),
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
        name: NameNode(value: 'business_business_by_pk'),
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
            name: NameNode(value: 'details'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'accepted_payments'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'approved'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'creation_time'),
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
                name: NameNode(value: 'language'),
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
                    name: NameNode(value: 'address'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'gps'),
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
                name: NameNode(value: 'phone_number'),
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
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'events'),
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
                name: NameNode(value: 'schedule_type'),
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
                name: NameNode(value: 'details'),
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
                    name: NameNode(value: 'image'),
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
                    name: NameNode(value: 'tags'),
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
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'profile'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'rentals'),
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
                    name: NameNode(value: 'tags'),
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
                name: NameNode(value: 'home_rental'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'bathrooms'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'bedrooms'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'gps_location'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'home_type'),
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
Query$get_business_by_id _parserFn$Query$get_business_by_id(
        Map<String, dynamic> data) =>
    Query$get_business_by_id.fromJson(data);

class Options$Query$get_business_by_id
    extends graphql.QueryOptions<Query$get_business_by_id> {
  Options$Query$get_business_by_id({
    String? operationName,
    required Variables$Query$get_business_by_id variables,
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
          document: documentNodeQueryget_business_by_id,
          parserFn: _parserFn$Query$get_business_by_id,
        );
}

class WatchOptions$Query$get_business_by_id
    extends graphql.WatchQueryOptions<Query$get_business_by_id> {
  WatchOptions$Query$get_business_by_id({
    String? operationName,
    required Variables$Query$get_business_by_id variables,
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
          document: documentNodeQueryget_business_by_id,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_business_by_id,
        );
}

class FetchMoreOptions$Query$get_business_by_id
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_business_by_id({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_business_by_id variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_business_by_id,
        );
}

extension ClientExtension$Query$get_business_by_id on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_business_by_id>>
      query$get_business_by_id(
              Options$Query$get_business_by_id options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$get_business_by_id>
      watchQuery$get_business_by_id(
              WatchOptions$Query$get_business_by_id options) =>
          this.watchQuery(options);
  void writeQuery$get_business_by_id({
    required Query$get_business_by_id data,
    required Variables$Query$get_business_by_id variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryget_business_by_id),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_business_by_id? readQuery$get_business_by_id({
    required Variables$Query$get_business_by_id variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryget_business_by_id),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$get_business_by_id.fromJson(result);
  }
}

class Query$get_business_by_id$business_business_by_pk {
  Query$get_business_by_id$business_business_by_pk({
    required this.details,
    required this.events,
    required this.id,
    required this.profile,
    required this.rentals,
    required this.$__typename,
  });

  factory Query$get_business_by_id$business_business_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$events = json['events'];
    final l$id = json['id'];
    final l$profile = json['profile'];
    final l$rentals = json['rentals'];
    final l$$__typename = json['__typename'];
    return Query$get_business_by_id$business_business_by_pk(
      details:
          Query$get_business_by_id$business_business_by_pk$details.fromJson(
              (l$details as Map<String, dynamic>)),
      events: (l$events as List<dynamic>)
          .map((e) =>
              Query$get_business_by_id$business_business_by_pk$events.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      id: (l$id as int),
      profile: (l$profile as String),
      rentals: (l$rentals as List<dynamic>)
          .map((e) =>
              Query$get_business_by_id$business_business_by_pk$rentals.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_business_by_id$business_business_by_pk$details details;

  final List<Query$get_business_by_id$business_business_by_pk$events> events;

  final int id;

  final String profile;

  final List<Query$get_business_by_id$business_business_by_pk$rentals> rentals;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$details = details;
    _resultData['details'] = l$details.toJson();
    final l$events = events;
    _resultData['events'] = l$events.map((e) => e.toJson()).toList();
    final l$id = id;
    _resultData['id'] = l$id;
    final l$profile = profile;
    _resultData['profile'] = l$profile;
    final l$rentals = rentals;
    _resultData['rentals'] = l$rentals.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$details = details;
    final l$events = events;
    final l$id = id;
    final l$profile = profile;
    final l$rentals = rentals;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$details,
      Object.hashAll(l$events.map((v) => v)),
      l$id,
      l$profile,
      Object.hashAll(l$rentals.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_business_by_id$business_business_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$details = details;
    final lOther$details = other.details;
    if (l$details != lOther$details) {
      return false;
    }
    final l$events = events;
    final lOther$events = other.events;
    if (l$events.length != lOther$events.length) {
      return false;
    }
    for (int i = 0; i < l$events.length; i++) {
      final l$events$entry = l$events[i];
      final lOther$events$entry = lOther$events[i];
      if (l$events$entry != lOther$events$entry) {
        return false;
      }
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$profile = profile;
    final lOther$profile = other.profile;
    if (l$profile != lOther$profile) {
      return false;
    }
    final l$rentals = rentals;
    final lOther$rentals = other.rentals;
    if (l$rentals.length != lOther$rentals.length) {
      return false;
    }
    for (int i = 0; i < l$rentals.length; i++) {
      final l$rentals$entry = l$rentals[i];
      final lOther$rentals$entry = lOther$rentals[i];
      if (l$rentals$entry != lOther$rentals$entry) {
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

extension UtilityExtension$Query$get_business_by_id$business_business_by_pk
    on Query$get_business_by_id$business_business_by_pk {
  CopyWith$Query$get_business_by_id$business_business_by_pk<
          Query$get_business_by_id$business_business_by_pk>
      get copyWith => CopyWith$Query$get_business_by_id$business_business_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_by_id$business_business_by_pk<TRes> {
  factory CopyWith$Query$get_business_by_id$business_business_by_pk(
    Query$get_business_by_id$business_business_by_pk instance,
    TRes Function(Query$get_business_by_id$business_business_by_pk) then,
  ) = _CopyWithImpl$Query$get_business_by_id$business_business_by_pk;

  factory CopyWith$Query$get_business_by_id$business_business_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_by_id$business_business_by_pk;

  TRes call({
    Query$get_business_by_id$business_business_by_pk$details? details,
    List<Query$get_business_by_id$business_business_by_pk$events>? events,
    int? id,
    String? profile,
    List<Query$get_business_by_id$business_business_by_pk$rentals>? rentals,
    String? $__typename,
  });
  CopyWith$Query$get_business_by_id$business_business_by_pk$details<TRes>
      get details;
  TRes events(
      Iterable<Query$get_business_by_id$business_business_by_pk$events> Function(
              Iterable<
                  CopyWith$Query$get_business_by_id$business_business_by_pk$events<
                      Query$get_business_by_id$business_business_by_pk$events>>)
          _fn);
  TRes rentals(
      Iterable<Query$get_business_by_id$business_business_by_pk$rentals> Function(
              Iterable<
                  CopyWith$Query$get_business_by_id$business_business_by_pk$rentals<
                      Query$get_business_by_id$business_business_by_pk$rentals>>)
          _fn);
}

class _CopyWithImpl$Query$get_business_by_id$business_business_by_pk<TRes>
    implements CopyWith$Query$get_business_by_id$business_business_by_pk<TRes> {
  _CopyWithImpl$Query$get_business_by_id$business_business_by_pk(
    this._instance,
    this._then,
  );

  final Query$get_business_by_id$business_business_by_pk _instance;

  final TRes Function(Query$get_business_by_id$business_business_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? events = _undefined,
    Object? id = _undefined,
    Object? profile = _undefined,
    Object? rentals = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_business_by_id$business_business_by_pk(
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Query$get_business_by_id$business_business_by_pk$details),
        events: events == _undefined || events == null
            ? _instance.events
            : (events as List<
                Query$get_business_by_id$business_business_by_pk$events>),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        profile: profile == _undefined || profile == null
            ? _instance.profile
            : (profile as String),
        rentals: rentals == _undefined || rentals == null
            ? _instance.rentals
            : (rentals as List<
                Query$get_business_by_id$business_business_by_pk$rentals>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_business_by_id$business_business_by_pk$details<TRes>
      get details {
    final local$details = _instance.details;
    return CopyWith$Query$get_business_by_id$business_business_by_pk$details(
        local$details, (e) => call(details: e));
  }

  TRes events(
          Iterable<Query$get_business_by_id$business_business_by_pk$events> Function(
                  Iterable<
                      CopyWith$Query$get_business_by_id$business_business_by_pk$events<
                          Query$get_business_by_id$business_business_by_pk$events>>)
              _fn) =>
      call(
          events: _fn(_instance.events.map((e) =>
              CopyWith$Query$get_business_by_id$business_business_by_pk$events(
                e,
                (i) => i,
              ))).toList());
  TRes rentals(
          Iterable<Query$get_business_by_id$business_business_by_pk$rentals> Function(
                  Iterable<
                      CopyWith$Query$get_business_by_id$business_business_by_pk$rentals<
                          Query$get_business_by_id$business_business_by_pk$rentals>>)
              _fn) =>
      call(
          rentals: _fn(_instance.rentals.map((e) =>
              CopyWith$Query$get_business_by_id$business_business_by_pk$rentals(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_business_by_id$business_business_by_pk<TRes>
    implements CopyWith$Query$get_business_by_id$business_business_by_pk<TRes> {
  _CopyWithStubImpl$Query$get_business_by_id$business_business_by_pk(this._res);

  TRes _res;

  call({
    Query$get_business_by_id$business_business_by_pk$details? details,
    List<Query$get_business_by_id$business_business_by_pk$events>? events,
    int? id,
    String? profile,
    List<Query$get_business_by_id$business_business_by_pk$rentals>? rentals,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_business_by_id$business_business_by_pk$details<TRes>
      get details =>
          CopyWith$Query$get_business_by_id$business_business_by_pk$details
              .stub(_res);
  events(_fn) => _res;
  rentals(_fn) => _res;
}

class Query$get_business_by_id$business_business_by_pk$details {
  Query$get_business_by_id$business_business_by_pk$details({
    required this.accepted_payments,
    required this.approved,
    required this.creation_time,
    this.description,
    required this.id,
    required this.image,
    required this.language,
    required this.location,
    required this.name,
    required this.open_status,
    this.phone_number,
    this.schedule,
    required this.$__typename,
  });

  factory Query$get_business_by_id$business_business_by_pk$details.fromJson(
      Map<String, dynamic> json) {
    final l$accepted_payments = json['accepted_payments'];
    final l$approved = json['approved'];
    final l$creation_time = json['creation_time'];
    final l$description = json['description'];
    final l$id = json['id'];
    final l$image = json['image'];
    final l$language = json['language'];
    final l$location = json['location'];
    final l$name = json['name'];
    final l$open_status = json['open_status'];
    final l$phone_number = json['phone_number'];
    final l$schedule = json['schedule'];
    final l$$__typename = json['__typename'];
    return Query$get_business_by_id$business_business_by_pk$details(
      accepted_payments: mapFromJson(l$accepted_payments),
      approved: (l$approved as bool),
      creation_time: (l$creation_time as String),
      description: l$description == null
          ? null
          : Query$get_business_by_id$business_business_by_pk$details$description
              .fromJson((l$description as Map<String, dynamic>)),
      id: (l$id as int),
      image: (l$image as String),
      language: mapFromJson(l$language),
      location:
          Query$get_business_by_id$business_business_by_pk$details$location
              .fromJson((l$location as Map<String, dynamic>)),
      name: (l$name as String),
      open_status: (l$open_status as String),
      phone_number: (l$phone_number as String?),
      schedule: l$schedule == null ? null : mapFromJson(l$schedule),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final dynamic accepted_payments;

  final bool approved;

  final String creation_time;

  final Query$get_business_by_id$business_business_by_pk$details$description?
      description;

  final int id;

  final String image;

  final dynamic language;

  final Query$get_business_by_id$business_business_by_pk$details$location
      location;

  final String name;

  final String open_status;

  final String? phone_number;

  final dynamic? schedule;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$accepted_payments = accepted_payments;
    _resultData['accepted_payments'] = mapToJson(l$accepted_payments);
    final l$approved = approved;
    _resultData['approved'] = l$approved;
    final l$creation_time = creation_time;
    _resultData['creation_time'] = l$creation_time;
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
    final l$id = id;
    _resultData['id'] = l$id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$language = language;
    _resultData['language'] = mapToJson(l$language);
    final l$location = location;
    _resultData['location'] = l$location.toJson();
    final l$name = name;
    _resultData['name'] = l$name;
    final l$open_status = open_status;
    _resultData['open_status'] = l$open_status;
    final l$phone_number = phone_number;
    _resultData['phone_number'] = l$phone_number;
    final l$schedule = schedule;
    _resultData['schedule'] = l$schedule == null ? null : mapToJson(l$schedule);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$accepted_payments = accepted_payments;
    final l$approved = approved;
    final l$creation_time = creation_time;
    final l$description = description;
    final l$id = id;
    final l$image = image;
    final l$language = language;
    final l$location = location;
    final l$name = name;
    final l$open_status = open_status;
    final l$phone_number = phone_number;
    final l$schedule = schedule;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$accepted_payments,
      l$approved,
      l$creation_time,
      l$description,
      l$id,
      l$image,
      l$language,
      l$location,
      l$name,
      l$open_status,
      l$phone_number,
      l$schedule,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_business_by_id$business_business_by_pk$details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$accepted_payments = accepted_payments;
    final lOther$accepted_payments = other.accepted_payments;
    if (l$accepted_payments != lOther$accepted_payments) {
      return false;
    }
    final l$approved = approved;
    final lOther$approved = other.approved;
    if (l$approved != lOther$approved) {
      return false;
    }
    final l$creation_time = creation_time;
    final lOther$creation_time = other.creation_time;
    if (l$creation_time != lOther$creation_time) {
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
    final l$language = language;
    final lOther$language = other.language;
    if (l$language != lOther$language) {
      return false;
    }
    final l$location = location;
    final lOther$location = other.location;
    if (l$location != lOther$location) {
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
    final l$phone_number = phone_number;
    final lOther$phone_number = other.phone_number;
    if (l$phone_number != lOther$phone_number) {
      return false;
    }
    final l$schedule = schedule;
    final lOther$schedule = other.schedule;
    if (l$schedule != lOther$schedule) {
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

extension UtilityExtension$Query$get_business_by_id$business_business_by_pk$details
    on Query$get_business_by_id$business_business_by_pk$details {
  CopyWith$Query$get_business_by_id$business_business_by_pk$details<
          Query$get_business_by_id$business_business_by_pk$details>
      get copyWith =>
          CopyWith$Query$get_business_by_id$business_business_by_pk$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_by_id$business_business_by_pk$details<
    TRes> {
  factory CopyWith$Query$get_business_by_id$business_business_by_pk$details(
    Query$get_business_by_id$business_business_by_pk$details instance,
    TRes Function(Query$get_business_by_id$business_business_by_pk$details)
        then,
  ) = _CopyWithImpl$Query$get_business_by_id$business_business_by_pk$details;

  factory CopyWith$Query$get_business_by_id$business_business_by_pk$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_by_id$business_business_by_pk$details;

  TRes call({
    dynamic? accepted_payments,
    bool? approved,
    String? creation_time,
    Query$get_business_by_id$business_business_by_pk$details$description?
        description,
    int? id,
    String? image,
    dynamic? language,
    Query$get_business_by_id$business_business_by_pk$details$location? location,
    String? name,
    String? open_status,
    String? phone_number,
    dynamic? schedule,
    String? $__typename,
  });
  CopyWith$Query$get_business_by_id$business_business_by_pk$details$description<
      TRes> get description;
  CopyWith$Query$get_business_by_id$business_business_by_pk$details$location<
      TRes> get location;
}

class _CopyWithImpl$Query$get_business_by_id$business_business_by_pk$details<
        TRes>
    implements
        CopyWith$Query$get_business_by_id$business_business_by_pk$details<
            TRes> {
  _CopyWithImpl$Query$get_business_by_id$business_business_by_pk$details(
    this._instance,
    this._then,
  );

  final Query$get_business_by_id$business_business_by_pk$details _instance;

  final TRes Function(Query$get_business_by_id$business_business_by_pk$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? accepted_payments = _undefined,
    Object? approved = _undefined,
    Object? creation_time = _undefined,
    Object? description = _undefined,
    Object? id = _undefined,
    Object? image = _undefined,
    Object? language = _undefined,
    Object? location = _undefined,
    Object? name = _undefined,
    Object? open_status = _undefined,
    Object? phone_number = _undefined,
    Object? schedule = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_business_by_id$business_business_by_pk$details(
        accepted_payments:
            accepted_payments == _undefined || accepted_payments == null
                ? _instance.accepted_payments
                : (accepted_payments as dynamic),
        approved: approved == _undefined || approved == null
            ? _instance.approved
            : (approved as bool),
        creation_time: creation_time == _undefined || creation_time == null
            ? _instance.creation_time
            : (creation_time as String),
        description: description == _undefined
            ? _instance.description
            : (description
                as Query$get_business_by_id$business_business_by_pk$details$description?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        language: language == _undefined || language == null
            ? _instance.language
            : (language as dynamic),
        location: location == _undefined || location == null
            ? _instance.location
            : (location
                as Query$get_business_by_id$business_business_by_pk$details$location),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        open_status: open_status == _undefined || open_status == null
            ? _instance.open_status
            : (open_status as String),
        phone_number: phone_number == _undefined
            ? _instance.phone_number
            : (phone_number as String?),
        schedule: schedule == _undefined
            ? _instance.schedule
            : (schedule as dynamic?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_business_by_id$business_business_by_pk$details$description<
      TRes> get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Query$get_business_by_id$business_business_by_pk$details$description
            .stub(_then(_instance))
        : CopyWith$Query$get_business_by_id$business_business_by_pk$details$description(
            local$description, (e) => call(description: e));
  }

  CopyWith$Query$get_business_by_id$business_business_by_pk$details$location<
      TRes> get location {
    final local$location = _instance.location;
    return CopyWith$Query$get_business_by_id$business_business_by_pk$details$location(
        local$location, (e) => call(location: e));
  }
}

class _CopyWithStubImpl$Query$get_business_by_id$business_business_by_pk$details<
        TRes>
    implements
        CopyWith$Query$get_business_by_id$business_business_by_pk$details<
            TRes> {
  _CopyWithStubImpl$Query$get_business_by_id$business_business_by_pk$details(
      this._res);

  TRes _res;

  call({
    dynamic? accepted_payments,
    bool? approved,
    String? creation_time,
    Query$get_business_by_id$business_business_by_pk$details$description?
        description,
    int? id,
    String? image,
    dynamic? language,
    Query$get_business_by_id$business_business_by_pk$details$location? location,
    String? name,
    String? open_status,
    String? phone_number,
    dynamic? schedule,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_business_by_id$business_business_by_pk$details$description<
          TRes>
      get description =>
          CopyWith$Query$get_business_by_id$business_business_by_pk$details$description
              .stub(_res);
  CopyWith$Query$get_business_by_id$business_business_by_pk$details$location<
          TRes>
      get location =>
          CopyWith$Query$get_business_by_id$business_business_by_pk$details$location
              .stub(_res);
}

class Query$get_business_by_id$business_business_by_pk$details$description {
  Query$get_business_by_id$business_business_by_pk$details$description({
    required this.translations,
    required this.$__typename,
  });

  factory Query$get_business_by_id$business_business_by_pk$details$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$get_business_by_id$business_business_by_pk$details$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$get_business_by_id$business_business_by_pk$details$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$get_business_by_id$business_business_by_pk$details$description$translations>
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
            is Query$get_business_by_id$business_business_by_pk$details$description) ||
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

extension UtilityExtension$Query$get_business_by_id$business_business_by_pk$details$description
    on Query$get_business_by_id$business_business_by_pk$details$description {
  CopyWith$Query$get_business_by_id$business_business_by_pk$details$description<
          Query$get_business_by_id$business_business_by_pk$details$description>
      get copyWith =>
          CopyWith$Query$get_business_by_id$business_business_by_pk$details$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_by_id$business_business_by_pk$details$description<
    TRes> {
  factory CopyWith$Query$get_business_by_id$business_business_by_pk$details$description(
    Query$get_business_by_id$business_business_by_pk$details$description
        instance,
    TRes Function(
            Query$get_business_by_id$business_business_by_pk$details$description)
        then,
  ) = _CopyWithImpl$Query$get_business_by_id$business_business_by_pk$details$description;

  factory CopyWith$Query$get_business_by_id$business_business_by_pk$details$description.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_by_id$business_business_by_pk$details$description;

  TRes call({
    List<Query$get_business_by_id$business_business_by_pk$details$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$get_business_by_id$business_business_by_pk$details$description$translations> Function(
              Iterable<
                  CopyWith$Query$get_business_by_id$business_business_by_pk$details$description$translations<
                      Query$get_business_by_id$business_business_by_pk$details$description$translations>>)
          _fn);
}

class _CopyWithImpl$Query$get_business_by_id$business_business_by_pk$details$description<
        TRes>
    implements
        CopyWith$Query$get_business_by_id$business_business_by_pk$details$description<
            TRes> {
  _CopyWithImpl$Query$get_business_by_id$business_business_by_pk$details$description(
    this._instance,
    this._then,
  );

  final Query$get_business_by_id$business_business_by_pk$details$description
      _instance;

  final TRes Function(
          Query$get_business_by_id$business_business_by_pk$details$description)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_business_by_id$business_business_by_pk$details$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$get_business_by_id$business_business_by_pk$details$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$get_business_by_id$business_business_by_pk$details$description$translations> Function(
                  Iterable<
                      CopyWith$Query$get_business_by_id$business_business_by_pk$details$description$translations<
                          Query$get_business_by_id$business_business_by_pk$details$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$get_business_by_id$business_business_by_pk$details$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_business_by_id$business_business_by_pk$details$description<
        TRes>
    implements
        CopyWith$Query$get_business_by_id$business_business_by_pk$details$description<
            TRes> {
  _CopyWithStubImpl$Query$get_business_by_id$business_business_by_pk$details$description(
      this._res);

  TRes _res;

  call({
    List<Query$get_business_by_id$business_business_by_pk$details$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$get_business_by_id$business_business_by_pk$details$description$translations {
  Query$get_business_by_id$business_business_by_pk$details$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$get_business_by_id$business_business_by_pk$details$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$get_business_by_id$business_business_by_pk$details$description$translations(
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
            is Query$get_business_by_id$business_business_by_pk$details$description$translations) ||
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

extension UtilityExtension$Query$get_business_by_id$business_business_by_pk$details$description$translations
    on Query$get_business_by_id$business_business_by_pk$details$description$translations {
  CopyWith$Query$get_business_by_id$business_business_by_pk$details$description$translations<
          Query$get_business_by_id$business_business_by_pk$details$description$translations>
      get copyWith =>
          CopyWith$Query$get_business_by_id$business_business_by_pk$details$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_by_id$business_business_by_pk$details$description$translations<
    TRes> {
  factory CopyWith$Query$get_business_by_id$business_business_by_pk$details$description$translations(
    Query$get_business_by_id$business_business_by_pk$details$description$translations
        instance,
    TRes Function(
            Query$get_business_by_id$business_business_by_pk$details$description$translations)
        then,
  ) = _CopyWithImpl$Query$get_business_by_id$business_business_by_pk$details$description$translations;

  factory CopyWith$Query$get_business_by_id$business_business_by_pk$details$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_by_id$business_business_by_pk$details$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_business_by_id$business_business_by_pk$details$description$translations<
        TRes>
    implements
        CopyWith$Query$get_business_by_id$business_business_by_pk$details$description$translations<
            TRes> {
  _CopyWithImpl$Query$get_business_by_id$business_business_by_pk$details$description$translations(
    this._instance,
    this._then,
  );

  final Query$get_business_by_id$business_business_by_pk$details$description$translations
      _instance;

  final TRes Function(
          Query$get_business_by_id$business_business_by_pk$details$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_business_by_id$business_business_by_pk$details$description$translations(
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

class _CopyWithStubImpl$Query$get_business_by_id$business_business_by_pk$details$description$translations<
        TRes>
    implements
        CopyWith$Query$get_business_by_id$business_business_by_pk$details$description$translations<
            TRes> {
  _CopyWithStubImpl$Query$get_business_by_id$business_business_by_pk$details$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_business_by_id$business_business_by_pk$details$location {
  Query$get_business_by_id$business_business_by_pk$details$location({
    required this.address,
    required this.gps,
    required this.$__typename,
  });

  factory Query$get_business_by_id$business_business_by_pk$details$location.fromJson(
      Map<String, dynamic> json) {
    final l$address = json['address'];
    final l$gps = json['gps'];
    final l$$__typename = json['__typename'];
    return Query$get_business_by_id$business_business_by_pk$details$location(
      address: (l$address as String),
      gps: geographyFromJson(l$gps),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String address;

  final Geography gps;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$address = address;
    _resultData['address'] = l$address;
    final l$gps = gps;
    _resultData['gps'] = geographyToJson(l$gps);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$address = address;
    final l$gps = gps;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$address,
      l$gps,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$get_business_by_id$business_business_by_pk$details$location) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$address = address;
    final lOther$address = other.address;
    if (l$address != lOther$address) {
      return false;
    }
    final l$gps = gps;
    final lOther$gps = other.gps;
    if (l$gps != lOther$gps) {
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

extension UtilityExtension$Query$get_business_by_id$business_business_by_pk$details$location
    on Query$get_business_by_id$business_business_by_pk$details$location {
  CopyWith$Query$get_business_by_id$business_business_by_pk$details$location<
          Query$get_business_by_id$business_business_by_pk$details$location>
      get copyWith =>
          CopyWith$Query$get_business_by_id$business_business_by_pk$details$location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_by_id$business_business_by_pk$details$location<
    TRes> {
  factory CopyWith$Query$get_business_by_id$business_business_by_pk$details$location(
    Query$get_business_by_id$business_business_by_pk$details$location instance,
    TRes Function(
            Query$get_business_by_id$business_business_by_pk$details$location)
        then,
  ) = _CopyWithImpl$Query$get_business_by_id$business_business_by_pk$details$location;

  factory CopyWith$Query$get_business_by_id$business_business_by_pk$details$location.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_by_id$business_business_by_pk$details$location;

  TRes call({
    String? address,
    Geography? gps,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_business_by_id$business_business_by_pk$details$location<
        TRes>
    implements
        CopyWith$Query$get_business_by_id$business_business_by_pk$details$location<
            TRes> {
  _CopyWithImpl$Query$get_business_by_id$business_business_by_pk$details$location(
    this._instance,
    this._then,
  );

  final Query$get_business_by_id$business_business_by_pk$details$location
      _instance;

  final TRes Function(
      Query$get_business_by_id$business_business_by_pk$details$location) _then;

  static const _undefined = {};

  TRes call({
    Object? address = _undefined,
    Object? gps = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_business_by_id$business_business_by_pk$details$location(
        address: address == _undefined || address == null
            ? _instance.address
            : (address as String),
        gps: gps == _undefined || gps == null
            ? _instance.gps
            : (gps as Geography),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_business_by_id$business_business_by_pk$details$location<
        TRes>
    implements
        CopyWith$Query$get_business_by_id$business_business_by_pk$details$location<
            TRes> {
  _CopyWithStubImpl$Query$get_business_by_id$business_business_by_pk$details$location(
      this._res);

  TRes _res;

  call({
    String? address,
    Geography? gps,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_business_by_id$business_business_by_pk$events {
  Query$get_business_by_id$business_business_by_pk$events({
    required this.id,
    required this.schedule_type,
    this.schedule,
    required this.details,
    required this.$__typename,
  });

  factory Query$get_business_by_id$business_business_by_pk$events.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$schedule_type = json['schedule_type'];
    final l$schedule = json['schedule'];
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$get_business_by_id$business_business_by_pk$events(
      id: (l$id as int),
      schedule_type: (l$schedule_type as String),
      schedule: l$schedule == null ? null : mapFromJson(l$schedule),
      details: Query$get_business_by_id$business_business_by_pk$events$details
          .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String schedule_type;

  final dynamic? schedule;

  final Query$get_business_by_id$business_business_by_pk$events$details details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$schedule_type = schedule_type;
    _resultData['schedule_type'] = l$schedule_type;
    final l$schedule = schedule;
    _resultData['schedule'] = l$schedule == null ? null : mapToJson(l$schedule);
    final l$details = details;
    _resultData['details'] = l$details.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$schedule_type = schedule_type;
    final l$schedule = schedule;
    final l$details = details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$schedule_type,
      l$schedule,
      l$details,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_business_by_id$business_business_by_pk$events) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$schedule_type = schedule_type;
    final lOther$schedule_type = other.schedule_type;
    if (l$schedule_type != lOther$schedule_type) {
      return false;
    }
    final l$schedule = schedule;
    final lOther$schedule = other.schedule;
    if (l$schedule != lOther$schedule) {
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

extension UtilityExtension$Query$get_business_by_id$business_business_by_pk$events
    on Query$get_business_by_id$business_business_by_pk$events {
  CopyWith$Query$get_business_by_id$business_business_by_pk$events<
          Query$get_business_by_id$business_business_by_pk$events>
      get copyWith =>
          CopyWith$Query$get_business_by_id$business_business_by_pk$events(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_by_id$business_business_by_pk$events<
    TRes> {
  factory CopyWith$Query$get_business_by_id$business_business_by_pk$events(
    Query$get_business_by_id$business_business_by_pk$events instance,
    TRes Function(Query$get_business_by_id$business_business_by_pk$events) then,
  ) = _CopyWithImpl$Query$get_business_by_id$business_business_by_pk$events;

  factory CopyWith$Query$get_business_by_id$business_business_by_pk$events.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_by_id$business_business_by_pk$events;

  TRes call({
    int? id,
    String? schedule_type,
    dynamic? schedule,
    Query$get_business_by_id$business_business_by_pk$events$details? details,
    String? $__typename,
  });
  CopyWith$Query$get_business_by_id$business_business_by_pk$events$details<TRes>
      get details;
}

class _CopyWithImpl$Query$get_business_by_id$business_business_by_pk$events<
        TRes>
    implements
        CopyWith$Query$get_business_by_id$business_business_by_pk$events<TRes> {
  _CopyWithImpl$Query$get_business_by_id$business_business_by_pk$events(
    this._instance,
    this._then,
  );

  final Query$get_business_by_id$business_business_by_pk$events _instance;

  final TRes Function(Query$get_business_by_id$business_business_by_pk$events)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? schedule_type = _undefined,
    Object? schedule = _undefined,
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_business_by_id$business_business_by_pk$events(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        schedule_type: schedule_type == _undefined || schedule_type == null
            ? _instance.schedule_type
            : (schedule_type as String),
        schedule: schedule == _undefined
            ? _instance.schedule
            : (schedule as dynamic?),
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Query$get_business_by_id$business_business_by_pk$events$details),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_business_by_id$business_business_by_pk$events$details<TRes>
      get details {
    final local$details = _instance.details;
    return CopyWith$Query$get_business_by_id$business_business_by_pk$events$details(
        local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$get_business_by_id$business_business_by_pk$events<
        TRes>
    implements
        CopyWith$Query$get_business_by_id$business_business_by_pk$events<TRes> {
  _CopyWithStubImpl$Query$get_business_by_id$business_business_by_pk$events(
      this._res);

  TRes _res;

  call({
    int? id,
    String? schedule_type,
    dynamic? schedule,
    Query$get_business_by_id$business_business_by_pk$events$details? details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_business_by_id$business_business_by_pk$events$details<TRes>
      get details =>
          CopyWith$Query$get_business_by_id$business_business_by_pk$events$details
              .stub(_res);
}

class Query$get_business_by_id$business_business_by_pk$events$details {
  Query$get_business_by_id$business_business_by_pk$events$details({
    this.additional_parameters,
    required this.available,
    required this.category1,
    required this.cost,
    this.image,
    required this.id,
    required this.tags,
    required this.name,
    required this.position,
    required this.$__typename,
  });

  factory Query$get_business_by_id$business_business_by_pk$events$details.fromJson(
      Map<String, dynamic> json) {
    final l$additional_parameters = json['additional_parameters'];
    final l$available = json['available'];
    final l$category1 = json['category1'];
    final l$cost = json['cost'];
    final l$image = json['image'];
    final l$id = json['id'];
    final l$tags = json['tags'];
    final l$name = json['name'];
    final l$position = json['position'];
    final l$$__typename = json['__typename'];
    return Query$get_business_by_id$business_business_by_pk$events$details(
      additional_parameters: l$additional_parameters == null
          ? null
          : mapFromJson(l$additional_parameters),
      available: (l$available as bool),
      category1: (l$category1 as String),
      cost: mapFromJson(l$cost),
      image: l$image == null ? null : mapFromJson(l$image),
      id: (l$id as int),
      tags: mapFromJson(l$tags),
      name: Query$get_business_by_id$business_business_by_pk$events$details$name
          .fromJson((l$name as Map<String, dynamic>)),
      position: (l$position as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final dynamic? additional_parameters;

  final bool available;

  final String category1;

  final dynamic cost;

  final dynamic? image;

  final int id;

  final dynamic tags;

  final Query$get_business_by_id$business_business_by_pk$events$details$name
      name;

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
    final l$image = image;
    _resultData['image'] = l$image == null ? null : mapToJson(l$image);
    final l$id = id;
    _resultData['id'] = l$id;
    final l$tags = tags;
    _resultData['tags'] = mapToJson(l$tags);
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
    final l$image = image;
    final l$id = id;
    final l$tags = tags;
    final l$name = name;
    final l$position = position;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$additional_parameters,
      l$available,
      l$category1,
      l$cost,
      l$image,
      l$id,
      l$tags,
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
    if (!(other
            is Query$get_business_by_id$business_business_by_pk$events$details) ||
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
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$tags = tags;
    final lOther$tags = other.tags;
    if (l$tags != lOther$tags) {
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

extension UtilityExtension$Query$get_business_by_id$business_business_by_pk$events$details
    on Query$get_business_by_id$business_business_by_pk$events$details {
  CopyWith$Query$get_business_by_id$business_business_by_pk$events$details<
          Query$get_business_by_id$business_business_by_pk$events$details>
      get copyWith =>
          CopyWith$Query$get_business_by_id$business_business_by_pk$events$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_by_id$business_business_by_pk$events$details<
    TRes> {
  factory CopyWith$Query$get_business_by_id$business_business_by_pk$events$details(
    Query$get_business_by_id$business_business_by_pk$events$details instance,
    TRes Function(
            Query$get_business_by_id$business_business_by_pk$events$details)
        then,
  ) = _CopyWithImpl$Query$get_business_by_id$business_business_by_pk$events$details;

  factory CopyWith$Query$get_business_by_id$business_business_by_pk$events$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_by_id$business_business_by_pk$events$details;

  TRes call({
    dynamic? additional_parameters,
    bool? available,
    String? category1,
    dynamic? cost,
    dynamic? image,
    int? id,
    dynamic? tags,
    Query$get_business_by_id$business_business_by_pk$events$details$name? name,
    int? position,
    String? $__typename,
  });
  CopyWith$Query$get_business_by_id$business_business_by_pk$events$details$name<
      TRes> get name;
}

class _CopyWithImpl$Query$get_business_by_id$business_business_by_pk$events$details<
        TRes>
    implements
        CopyWith$Query$get_business_by_id$business_business_by_pk$events$details<
            TRes> {
  _CopyWithImpl$Query$get_business_by_id$business_business_by_pk$events$details(
    this._instance,
    this._then,
  );

  final Query$get_business_by_id$business_business_by_pk$events$details
      _instance;

  final TRes Function(
      Query$get_business_by_id$business_business_by_pk$events$details) _then;

  static const _undefined = {};

  TRes call({
    Object? additional_parameters = _undefined,
    Object? available = _undefined,
    Object? category1 = _undefined,
    Object? cost = _undefined,
    Object? image = _undefined,
    Object? id = _undefined,
    Object? tags = _undefined,
    Object? name = _undefined,
    Object? position = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_business_by_id$business_business_by_pk$events$details(
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
        id: id == _undefined || id == null ? _instance.id : (id as int),
        tags: tags == _undefined || tags == null
            ? _instance.tags
            : (tags as dynamic),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Query$get_business_by_id$business_business_by_pk$events$details$name),
        position: position == _undefined || position == null
            ? _instance.position
            : (position as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_business_by_id$business_business_by_pk$events$details$name<
      TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Query$get_business_by_id$business_business_by_pk$events$details$name(
        local$name, (e) => call(name: e));
  }
}

class _CopyWithStubImpl$Query$get_business_by_id$business_business_by_pk$events$details<
        TRes>
    implements
        CopyWith$Query$get_business_by_id$business_business_by_pk$events$details<
            TRes> {
  _CopyWithStubImpl$Query$get_business_by_id$business_business_by_pk$events$details(
      this._res);

  TRes _res;

  call({
    dynamic? additional_parameters,
    bool? available,
    String? category1,
    dynamic? cost,
    dynamic? image,
    int? id,
    dynamic? tags,
    Query$get_business_by_id$business_business_by_pk$events$details$name? name,
    int? position,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_business_by_id$business_business_by_pk$events$details$name<
          TRes>
      get name =>
          CopyWith$Query$get_business_by_id$business_business_by_pk$events$details$name
              .stub(_res);
}

class Query$get_business_by_id$business_business_by_pk$events$details$name {
  Query$get_business_by_id$business_business_by_pk$events$details$name({
    required this.translations,
    required this.$__typename,
  });

  factory Query$get_business_by_id$business_business_by_pk$events$details$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$get_business_by_id$business_business_by_pk$events$details$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$get_business_by_id$business_business_by_pk$events$details$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$get_business_by_id$business_business_by_pk$events$details$name$translations>
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
            is Query$get_business_by_id$business_business_by_pk$events$details$name) ||
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

extension UtilityExtension$Query$get_business_by_id$business_business_by_pk$events$details$name
    on Query$get_business_by_id$business_business_by_pk$events$details$name {
  CopyWith$Query$get_business_by_id$business_business_by_pk$events$details$name<
          Query$get_business_by_id$business_business_by_pk$events$details$name>
      get copyWith =>
          CopyWith$Query$get_business_by_id$business_business_by_pk$events$details$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_by_id$business_business_by_pk$events$details$name<
    TRes> {
  factory CopyWith$Query$get_business_by_id$business_business_by_pk$events$details$name(
    Query$get_business_by_id$business_business_by_pk$events$details$name
        instance,
    TRes Function(
            Query$get_business_by_id$business_business_by_pk$events$details$name)
        then,
  ) = _CopyWithImpl$Query$get_business_by_id$business_business_by_pk$events$details$name;

  factory CopyWith$Query$get_business_by_id$business_business_by_pk$events$details$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_by_id$business_business_by_pk$events$details$name;

  TRes call({
    List<Query$get_business_by_id$business_business_by_pk$events$details$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$get_business_by_id$business_business_by_pk$events$details$name$translations> Function(
              Iterable<
                  CopyWith$Query$get_business_by_id$business_business_by_pk$events$details$name$translations<
                      Query$get_business_by_id$business_business_by_pk$events$details$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$get_business_by_id$business_business_by_pk$events$details$name<
        TRes>
    implements
        CopyWith$Query$get_business_by_id$business_business_by_pk$events$details$name<
            TRes> {
  _CopyWithImpl$Query$get_business_by_id$business_business_by_pk$events$details$name(
    this._instance,
    this._then,
  );

  final Query$get_business_by_id$business_business_by_pk$events$details$name
      _instance;

  final TRes Function(
          Query$get_business_by_id$business_business_by_pk$events$details$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_business_by_id$business_business_by_pk$events$details$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$get_business_by_id$business_business_by_pk$events$details$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$get_business_by_id$business_business_by_pk$events$details$name$translations> Function(
                  Iterable<
                      CopyWith$Query$get_business_by_id$business_business_by_pk$events$details$name$translations<
                          Query$get_business_by_id$business_business_by_pk$events$details$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$get_business_by_id$business_business_by_pk$events$details$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_business_by_id$business_business_by_pk$events$details$name<
        TRes>
    implements
        CopyWith$Query$get_business_by_id$business_business_by_pk$events$details$name<
            TRes> {
  _CopyWithStubImpl$Query$get_business_by_id$business_business_by_pk$events$details$name(
      this._res);

  TRes _res;

  call({
    List<Query$get_business_by_id$business_business_by_pk$events$details$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$get_business_by_id$business_business_by_pk$events$details$name$translations {
  Query$get_business_by_id$business_business_by_pk$events$details$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$get_business_by_id$business_business_by_pk$events$details$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$get_business_by_id$business_business_by_pk$events$details$name$translations(
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
            is Query$get_business_by_id$business_business_by_pk$events$details$name$translations) ||
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

extension UtilityExtension$Query$get_business_by_id$business_business_by_pk$events$details$name$translations
    on Query$get_business_by_id$business_business_by_pk$events$details$name$translations {
  CopyWith$Query$get_business_by_id$business_business_by_pk$events$details$name$translations<
          Query$get_business_by_id$business_business_by_pk$events$details$name$translations>
      get copyWith =>
          CopyWith$Query$get_business_by_id$business_business_by_pk$events$details$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_by_id$business_business_by_pk$events$details$name$translations<
    TRes> {
  factory CopyWith$Query$get_business_by_id$business_business_by_pk$events$details$name$translations(
    Query$get_business_by_id$business_business_by_pk$events$details$name$translations
        instance,
    TRes Function(
            Query$get_business_by_id$business_business_by_pk$events$details$name$translations)
        then,
  ) = _CopyWithImpl$Query$get_business_by_id$business_business_by_pk$events$details$name$translations;

  factory CopyWith$Query$get_business_by_id$business_business_by_pk$events$details$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_by_id$business_business_by_pk$events$details$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_business_by_id$business_business_by_pk$events$details$name$translations<
        TRes>
    implements
        CopyWith$Query$get_business_by_id$business_business_by_pk$events$details$name$translations<
            TRes> {
  _CopyWithImpl$Query$get_business_by_id$business_business_by_pk$events$details$name$translations(
    this._instance,
    this._then,
  );

  final Query$get_business_by_id$business_business_by_pk$events$details$name$translations
      _instance;

  final TRes Function(
          Query$get_business_by_id$business_business_by_pk$events$details$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_business_by_id$business_business_by_pk$events$details$name$translations(
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

class _CopyWithStubImpl$Query$get_business_by_id$business_business_by_pk$events$details$name$translations<
        TRes>
    implements
        CopyWith$Query$get_business_by_id$business_business_by_pk$events$details$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$get_business_by_id$business_business_by_pk$events$details$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_business_by_id$business_business_by_pk$rentals {
  Query$get_business_by_id$business_business_by_pk$rentals({
    required this.id,
    required this.details,
    this.home_rental,
    required this.$__typename,
  });

  factory Query$get_business_by_id$business_business_by_pk$rentals.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$details = json['details'];
    final l$home_rental = json['home_rental'];
    final l$$__typename = json['__typename'];
    return Query$get_business_by_id$business_business_by_pk$rentals(
      id: (l$id as int),
      details: Query$get_business_by_id$business_business_by_pk$rentals$details
          .fromJson((l$details as Map<String, dynamic>)),
      home_rental: l$home_rental == null
          ? null
          : Query$get_business_by_id$business_business_by_pk$rentals$home_rental
              .fromJson((l$home_rental as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$get_business_by_id$business_business_by_pk$rentals$details
      details;

  final Query$get_business_by_id$business_business_by_pk$rentals$home_rental?
      home_rental;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$details = details;
    _resultData['details'] = l$details.toJson();
    final l$home_rental = home_rental;
    _resultData['home_rental'] = l$home_rental?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$details = details;
    final l$home_rental = home_rental;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$details,
      l$home_rental,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_business_by_id$business_business_by_pk$rentals) ||
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
    final l$home_rental = home_rental;
    final lOther$home_rental = other.home_rental;
    if (l$home_rental != lOther$home_rental) {
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

extension UtilityExtension$Query$get_business_by_id$business_business_by_pk$rentals
    on Query$get_business_by_id$business_business_by_pk$rentals {
  CopyWith$Query$get_business_by_id$business_business_by_pk$rentals<
          Query$get_business_by_id$business_business_by_pk$rentals>
      get copyWith =>
          CopyWith$Query$get_business_by_id$business_business_by_pk$rentals(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_by_id$business_business_by_pk$rentals<
    TRes> {
  factory CopyWith$Query$get_business_by_id$business_business_by_pk$rentals(
    Query$get_business_by_id$business_business_by_pk$rentals instance,
    TRes Function(Query$get_business_by_id$business_business_by_pk$rentals)
        then,
  ) = _CopyWithImpl$Query$get_business_by_id$business_business_by_pk$rentals;

  factory CopyWith$Query$get_business_by_id$business_business_by_pk$rentals.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_by_id$business_business_by_pk$rentals;

  TRes call({
    int? id,
    Query$get_business_by_id$business_business_by_pk$rentals$details? details,
    Query$get_business_by_id$business_business_by_pk$rentals$home_rental?
        home_rental,
    String? $__typename,
  });
  CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$details<
      TRes> get details;
  CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$home_rental<
      TRes> get home_rental;
}

class _CopyWithImpl$Query$get_business_by_id$business_business_by_pk$rentals<
        TRes>
    implements
        CopyWith$Query$get_business_by_id$business_business_by_pk$rentals<
            TRes> {
  _CopyWithImpl$Query$get_business_by_id$business_business_by_pk$rentals(
    this._instance,
    this._then,
  );

  final Query$get_business_by_id$business_business_by_pk$rentals _instance;

  final TRes Function(Query$get_business_by_id$business_business_by_pk$rentals)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? details = _undefined,
    Object? home_rental = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_business_by_id$business_business_by_pk$rentals(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Query$get_business_by_id$business_business_by_pk$rentals$details),
        home_rental: home_rental == _undefined
            ? _instance.home_rental
            : (home_rental
                as Query$get_business_by_id$business_business_by_pk$rentals$home_rental?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$details<
      TRes> get details {
    final local$details = _instance.details;
    return CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$details(
        local$details, (e) => call(details: e));
  }

  CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$home_rental<
      TRes> get home_rental {
    final local$home_rental = _instance.home_rental;
    return local$home_rental == null
        ? CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$home_rental
            .stub(_then(_instance))
        : CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$home_rental(
            local$home_rental, (e) => call(home_rental: e));
  }
}

class _CopyWithStubImpl$Query$get_business_by_id$business_business_by_pk$rentals<
        TRes>
    implements
        CopyWith$Query$get_business_by_id$business_business_by_pk$rentals<
            TRes> {
  _CopyWithStubImpl$Query$get_business_by_id$business_business_by_pk$rentals(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$get_business_by_id$business_business_by_pk$rentals$details? details,
    Query$get_business_by_id$business_business_by_pk$rentals$home_rental?
        home_rental,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$details<
          TRes>
      get details =>
          CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$details
              .stub(_res);
  CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$home_rental<
          TRes>
      get home_rental =>
          CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$home_rental
              .stub(_res);
}

class Query$get_business_by_id$business_business_by_pk$rentals$details {
  Query$get_business_by_id$business_business_by_pk$rentals$details({
    this.additional_parameters,
    required this.available,
    required this.category1,
    required this.cost,
    required this.id,
    this.image,
    required this.tags,
    required this.name,
    required this.position,
    required this.$__typename,
  });

  factory Query$get_business_by_id$business_business_by_pk$rentals$details.fromJson(
      Map<String, dynamic> json) {
    final l$additional_parameters = json['additional_parameters'];
    final l$available = json['available'];
    final l$category1 = json['category1'];
    final l$cost = json['cost'];
    final l$id = json['id'];
    final l$image = json['image'];
    final l$tags = json['tags'];
    final l$name = json['name'];
    final l$position = json['position'];
    final l$$__typename = json['__typename'];
    return Query$get_business_by_id$business_business_by_pk$rentals$details(
      additional_parameters: l$additional_parameters == null
          ? null
          : mapFromJson(l$additional_parameters),
      available: (l$available as bool),
      category1: (l$category1 as String),
      cost: mapFromJson(l$cost),
      id: (l$id as int),
      image: l$image == null ? null : mapFromJson(l$image),
      tags: mapFromJson(l$tags),
      name:
          Query$get_business_by_id$business_business_by_pk$rentals$details$name
              .fromJson((l$name as Map<String, dynamic>)),
      position: (l$position as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final dynamic? additional_parameters;

  final bool available;

  final String category1;

  final dynamic cost;

  final int id;

  final dynamic? image;

  final dynamic tags;

  final Query$get_business_by_id$business_business_by_pk$rentals$details$name
      name;

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
    final l$id = id;
    _resultData['id'] = l$id;
    final l$image = image;
    _resultData['image'] = l$image == null ? null : mapToJson(l$image);
    final l$tags = tags;
    _resultData['tags'] = mapToJson(l$tags);
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
    final l$id = id;
    final l$image = image;
    final l$tags = tags;
    final l$name = name;
    final l$position = position;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$additional_parameters,
      l$available,
      l$category1,
      l$cost,
      l$id,
      l$image,
      l$tags,
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
    if (!(other
            is Query$get_business_by_id$business_business_by_pk$rentals$details) ||
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
    final l$tags = tags;
    final lOther$tags = other.tags;
    if (l$tags != lOther$tags) {
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

extension UtilityExtension$Query$get_business_by_id$business_business_by_pk$rentals$details
    on Query$get_business_by_id$business_business_by_pk$rentals$details {
  CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$details<
          Query$get_business_by_id$business_business_by_pk$rentals$details>
      get copyWith =>
          CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$details<
    TRes> {
  factory CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$details(
    Query$get_business_by_id$business_business_by_pk$rentals$details instance,
    TRes Function(
            Query$get_business_by_id$business_business_by_pk$rentals$details)
        then,
  ) = _CopyWithImpl$Query$get_business_by_id$business_business_by_pk$rentals$details;

  factory CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_by_id$business_business_by_pk$rentals$details;

  TRes call({
    dynamic? additional_parameters,
    bool? available,
    String? category1,
    dynamic? cost,
    int? id,
    dynamic? image,
    dynamic? tags,
    Query$get_business_by_id$business_business_by_pk$rentals$details$name? name,
    int? position,
    String? $__typename,
  });
  CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$details$name<
      TRes> get name;
}

class _CopyWithImpl$Query$get_business_by_id$business_business_by_pk$rentals$details<
        TRes>
    implements
        CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$details<
            TRes> {
  _CopyWithImpl$Query$get_business_by_id$business_business_by_pk$rentals$details(
    this._instance,
    this._then,
  );

  final Query$get_business_by_id$business_business_by_pk$rentals$details
      _instance;

  final TRes Function(
      Query$get_business_by_id$business_business_by_pk$rentals$details) _then;

  static const _undefined = {};

  TRes call({
    Object? additional_parameters = _undefined,
    Object? available = _undefined,
    Object? category1 = _undefined,
    Object? cost = _undefined,
    Object? id = _undefined,
    Object? image = _undefined,
    Object? tags = _undefined,
    Object? name = _undefined,
    Object? position = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_business_by_id$business_business_by_pk$rentals$details(
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
        id: id == _undefined || id == null ? _instance.id : (id as int),
        image: image == _undefined ? _instance.image : (image as dynamic?),
        tags: tags == _undefined || tags == null
            ? _instance.tags
            : (tags as dynamic),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Query$get_business_by_id$business_business_by_pk$rentals$details$name),
        position: position == _undefined || position == null
            ? _instance.position
            : (position as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$details$name<
      TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$details$name(
        local$name, (e) => call(name: e));
  }
}

class _CopyWithStubImpl$Query$get_business_by_id$business_business_by_pk$rentals$details<
        TRes>
    implements
        CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$details<
            TRes> {
  _CopyWithStubImpl$Query$get_business_by_id$business_business_by_pk$rentals$details(
      this._res);

  TRes _res;

  call({
    dynamic? additional_parameters,
    bool? available,
    String? category1,
    dynamic? cost,
    int? id,
    dynamic? image,
    dynamic? tags,
    Query$get_business_by_id$business_business_by_pk$rentals$details$name? name,
    int? position,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$details$name<
          TRes>
      get name =>
          CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$details$name
              .stub(_res);
}

class Query$get_business_by_id$business_business_by_pk$rentals$details$name {
  Query$get_business_by_id$business_business_by_pk$rentals$details$name({
    required this.translations,
    required this.$__typename,
  });

  factory Query$get_business_by_id$business_business_by_pk$rentals$details$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$get_business_by_id$business_business_by_pk$rentals$details$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$get_business_by_id$business_business_by_pk$rentals$details$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$get_business_by_id$business_business_by_pk$rentals$details$name$translations>
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
            is Query$get_business_by_id$business_business_by_pk$rentals$details$name) ||
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

extension UtilityExtension$Query$get_business_by_id$business_business_by_pk$rentals$details$name
    on Query$get_business_by_id$business_business_by_pk$rentals$details$name {
  CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$details$name<
          Query$get_business_by_id$business_business_by_pk$rentals$details$name>
      get copyWith =>
          CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$details$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$details$name<
    TRes> {
  factory CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$details$name(
    Query$get_business_by_id$business_business_by_pk$rentals$details$name
        instance,
    TRes Function(
            Query$get_business_by_id$business_business_by_pk$rentals$details$name)
        then,
  ) = _CopyWithImpl$Query$get_business_by_id$business_business_by_pk$rentals$details$name;

  factory CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$details$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_by_id$business_business_by_pk$rentals$details$name;

  TRes call({
    List<Query$get_business_by_id$business_business_by_pk$rentals$details$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$get_business_by_id$business_business_by_pk$rentals$details$name$translations> Function(
              Iterable<
                  CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$details$name$translations<
                      Query$get_business_by_id$business_business_by_pk$rentals$details$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$get_business_by_id$business_business_by_pk$rentals$details$name<
        TRes>
    implements
        CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$details$name<
            TRes> {
  _CopyWithImpl$Query$get_business_by_id$business_business_by_pk$rentals$details$name(
    this._instance,
    this._then,
  );

  final Query$get_business_by_id$business_business_by_pk$rentals$details$name
      _instance;

  final TRes Function(
          Query$get_business_by_id$business_business_by_pk$rentals$details$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_business_by_id$business_business_by_pk$rentals$details$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$get_business_by_id$business_business_by_pk$rentals$details$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$get_business_by_id$business_business_by_pk$rentals$details$name$translations> Function(
                  Iterable<
                      CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$details$name$translations<
                          Query$get_business_by_id$business_business_by_pk$rentals$details$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$details$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_business_by_id$business_business_by_pk$rentals$details$name<
        TRes>
    implements
        CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$details$name<
            TRes> {
  _CopyWithStubImpl$Query$get_business_by_id$business_business_by_pk$rentals$details$name(
      this._res);

  TRes _res;

  call({
    List<Query$get_business_by_id$business_business_by_pk$rentals$details$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$get_business_by_id$business_business_by_pk$rentals$details$name$translations {
  Query$get_business_by_id$business_business_by_pk$rentals$details$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$get_business_by_id$business_business_by_pk$rentals$details$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$get_business_by_id$business_business_by_pk$rentals$details$name$translations(
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
            is Query$get_business_by_id$business_business_by_pk$rentals$details$name$translations) ||
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

extension UtilityExtension$Query$get_business_by_id$business_business_by_pk$rentals$details$name$translations
    on Query$get_business_by_id$business_business_by_pk$rentals$details$name$translations {
  CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$details$name$translations<
          Query$get_business_by_id$business_business_by_pk$rentals$details$name$translations>
      get copyWith =>
          CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$details$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$details$name$translations<
    TRes> {
  factory CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$details$name$translations(
    Query$get_business_by_id$business_business_by_pk$rentals$details$name$translations
        instance,
    TRes Function(
            Query$get_business_by_id$business_business_by_pk$rentals$details$name$translations)
        then,
  ) = _CopyWithImpl$Query$get_business_by_id$business_business_by_pk$rentals$details$name$translations;

  factory CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$details$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_by_id$business_business_by_pk$rentals$details$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_business_by_id$business_business_by_pk$rentals$details$name$translations<
        TRes>
    implements
        CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$details$name$translations<
            TRes> {
  _CopyWithImpl$Query$get_business_by_id$business_business_by_pk$rentals$details$name$translations(
    this._instance,
    this._then,
  );

  final Query$get_business_by_id$business_business_by_pk$rentals$details$name$translations
      _instance;

  final TRes Function(
          Query$get_business_by_id$business_business_by_pk$rentals$details$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_business_by_id$business_business_by_pk$rentals$details$name$translations(
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

class _CopyWithStubImpl$Query$get_business_by_id$business_business_by_pk$rentals$details$name$translations<
        TRes>
    implements
        CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$details$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$get_business_by_id$business_business_by_pk$rentals$details$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_business_by_id$business_business_by_pk$rentals$home_rental {
  Query$get_business_by_id$business_business_by_pk$rentals$home_rental({
    required this.bathrooms,
    required this.bedrooms,
    required this.gps_location,
    required this.home_type,
    required this.$__typename,
  });

  factory Query$get_business_by_id$business_business_by_pk$rentals$home_rental.fromJson(
      Map<String, dynamic> json) {
    final l$bathrooms = json['bathrooms'];
    final l$bedrooms = json['bedrooms'];
    final l$gps_location = json['gps_location'];
    final l$home_type = json['home_type'];
    final l$$__typename = json['__typename'];
    return Query$get_business_by_id$business_business_by_pk$rentals$home_rental(
      bathrooms: (l$bathrooms as int),
      bedrooms: (l$bedrooms as int),
      gps_location: geographyFromJson(l$gps_location),
      home_type: (l$home_type as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int bathrooms;

  final int bedrooms;

  final Geography gps_location;

  final String home_type;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$bathrooms = bathrooms;
    _resultData['bathrooms'] = l$bathrooms;
    final l$bedrooms = bedrooms;
    _resultData['bedrooms'] = l$bedrooms;
    final l$gps_location = gps_location;
    _resultData['gps_location'] = geographyToJson(l$gps_location);
    final l$home_type = home_type;
    _resultData['home_type'] = l$home_type;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$bathrooms = bathrooms;
    final l$bedrooms = bedrooms;
    final l$gps_location = gps_location;
    final l$home_type = home_type;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$bathrooms,
      l$bedrooms,
      l$gps_location,
      l$home_type,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$get_business_by_id$business_business_by_pk$rentals$home_rental) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$bathrooms = bathrooms;
    final lOther$bathrooms = other.bathrooms;
    if (l$bathrooms != lOther$bathrooms) {
      return false;
    }
    final l$bedrooms = bedrooms;
    final lOther$bedrooms = other.bedrooms;
    if (l$bedrooms != lOther$bedrooms) {
      return false;
    }
    final l$gps_location = gps_location;
    final lOther$gps_location = other.gps_location;
    if (l$gps_location != lOther$gps_location) {
      return false;
    }
    final l$home_type = home_type;
    final lOther$home_type = other.home_type;
    if (l$home_type != lOther$home_type) {
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

extension UtilityExtension$Query$get_business_by_id$business_business_by_pk$rentals$home_rental
    on Query$get_business_by_id$business_business_by_pk$rentals$home_rental {
  CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$home_rental<
          Query$get_business_by_id$business_business_by_pk$rentals$home_rental>
      get copyWith =>
          CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$home_rental(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$home_rental<
    TRes> {
  factory CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$home_rental(
    Query$get_business_by_id$business_business_by_pk$rentals$home_rental
        instance,
    TRes Function(
            Query$get_business_by_id$business_business_by_pk$rentals$home_rental)
        then,
  ) = _CopyWithImpl$Query$get_business_by_id$business_business_by_pk$rentals$home_rental;

  factory CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$home_rental.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_by_id$business_business_by_pk$rentals$home_rental;

  TRes call({
    int? bathrooms,
    int? bedrooms,
    Geography? gps_location,
    String? home_type,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_business_by_id$business_business_by_pk$rentals$home_rental<
        TRes>
    implements
        CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$home_rental<
            TRes> {
  _CopyWithImpl$Query$get_business_by_id$business_business_by_pk$rentals$home_rental(
    this._instance,
    this._then,
  );

  final Query$get_business_by_id$business_business_by_pk$rentals$home_rental
      _instance;

  final TRes Function(
          Query$get_business_by_id$business_business_by_pk$rentals$home_rental)
      _then;

  static const _undefined = {};

  TRes call({
    Object? bathrooms = _undefined,
    Object? bedrooms = _undefined,
    Object? gps_location = _undefined,
    Object? home_type = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_business_by_id$business_business_by_pk$rentals$home_rental(
        bathrooms: bathrooms == _undefined || bathrooms == null
            ? _instance.bathrooms
            : (bathrooms as int),
        bedrooms: bedrooms == _undefined || bedrooms == null
            ? _instance.bedrooms
            : (bedrooms as int),
        gps_location: gps_location == _undefined || gps_location == null
            ? _instance.gps_location
            : (gps_location as Geography),
        home_type: home_type == _undefined || home_type == null
            ? _instance.home_type
            : (home_type as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_business_by_id$business_business_by_pk$rentals$home_rental<
        TRes>
    implements
        CopyWith$Query$get_business_by_id$business_business_by_pk$rentals$home_rental<
            TRes> {
  _CopyWithStubImpl$Query$get_business_by_id$business_business_by_pk$rentals$home_rental(
      this._res);

  TRes _res;

  call({
    int? bathrooms,
    int? bedrooms,
    Geography? gps_location,
    String? home_type,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$get_business_by_rental_category1 {
  factory Variables$Query$get_business_by_rental_category1({
    required double distance,
    required Geography from,
    List<String>? categories1,
    int? offset,
    int? limit,
  }) =>
      Variables$Query$get_business_by_rental_category1._({
        r'distance': distance,
        r'from': from,
        if (categories1 != null) r'categories1': categories1,
        if (offset != null) r'offset': offset,
        if (limit != null) r'limit': limit,
      });

  Variables$Query$get_business_by_rental_category1._(this._$data);

  factory Variables$Query$get_business_by_rental_category1.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$distance = data['distance'];
    result$data['distance'] = (l$distance as num).toDouble();
    final l$from = data['from'];
    result$data['from'] = geographyFromJson(l$from);
    if (data.containsKey('categories1')) {
      final l$categories1 = data['categories1'];
      result$data['categories1'] =
          (l$categories1 as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    if (data.containsKey('offset')) {
      final l$offset = data['offset'];
      result$data['offset'] = (l$offset as int?);
    }
    if (data.containsKey('limit')) {
      final l$limit = data['limit'];
      result$data['limit'] = (l$limit as int?);
    }
    return Variables$Query$get_business_by_rental_category1._(result$data);
  }

  Map<String, dynamic> _$data;

  double get distance => (_$data['distance'] as double);
  Geography get from => (_$data['from'] as Geography);
  List<String>? get categories1 => (_$data['categories1'] as List<String>?);
  int? get offset => (_$data['offset'] as int?);
  int? get limit => (_$data['limit'] as int?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$distance = distance;
    result$data['distance'] = l$distance;
    final l$from = from;
    result$data['from'] = geographyToJson(l$from);
    if (_$data.containsKey('categories1')) {
      final l$categories1 = categories1;
      result$data['categories1'] = l$categories1?.map((e) => e).toList();
    }
    if (_$data.containsKey('offset')) {
      final l$offset = offset;
      result$data['offset'] = l$offset;
    }
    if (_$data.containsKey('limit')) {
      final l$limit = limit;
      result$data['limit'] = l$limit;
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
    final l$categories1 = categories1;
    final lOther$categories1 = other.categories1;
    if (_$data.containsKey('categories1') !=
        other._$data.containsKey('categories1')) {
      return false;
    }
    if (l$categories1 != null && lOther$categories1 != null) {
      if (l$categories1.length != lOther$categories1.length) {
        return false;
      }
      for (int i = 0; i < l$categories1.length; i++) {
        final l$categories1$entry = l$categories1[i];
        final lOther$categories1$entry = lOther$categories1[i];
        if (l$categories1$entry != lOther$categories1$entry) {
          return false;
        }
      }
    } else if (l$categories1 != lOther$categories1) {
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
    final l$limit = limit;
    final lOther$limit = other.limit;
    if (_$data.containsKey('limit') != other._$data.containsKey('limit')) {
      return false;
    }
    if (l$limit != lOther$limit) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$distance = distance;
    final l$from = from;
    final l$categories1 = categories1;
    final l$offset = offset;
    final l$limit = limit;
    return Object.hashAll([
      l$distance,
      l$from,
      _$data.containsKey('categories1')
          ? l$categories1 == null
              ? null
              : Object.hashAll(l$categories1.map((v) => v))
          : const {},
      _$data.containsKey('offset') ? l$offset : const {},
      _$data.containsKey('limit') ? l$limit : const {},
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
    List<String>? categories1,
    int? offset,
    int? limit,
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
    Object? categories1 = _undefined,
    Object? offset = _undefined,
    Object? limit = _undefined,
  }) =>
      _then(Variables$Query$get_business_by_rental_category1._({
        ..._instance._$data,
        if (distance != _undefined && distance != null)
          'distance': (distance as double),
        if (from != _undefined && from != null) 'from': (from as Geography),
        if (categories1 != _undefined)
          'categories1': (categories1 as List<String>?),
        if (offset != _undefined) 'offset': (offset as int?),
        if (limit != _undefined) 'limit': (limit as int?),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_business_by_rental_category1<TRes>
    implements CopyWith$Variables$Query$get_business_by_rental_category1<TRes> {
  _CopyWithStubImpl$Variables$Query$get_business_by_rental_category1(this._res);

  TRes _res;

  call({
    double? distance,
    Geography? from,
    List<String>? categories1,
    int? offset,
    int? limit,
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
        variable: VariableNode(name: NameNode(value: 'categories1')),
        type: ListTypeNode(
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
            isNonNull: true,
          ),
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
        variable: VariableNode(name: NameNode(value: 'limit')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
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
                        name: NameNode(value: 'details'),
                        value: ObjectValueNode(fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'category1'),
                            value: ObjectValueNode(fields: [
                              ObjectFieldNode(
                                name: NameNode(value: '_in'),
                                value: VariableNode(
                                    name: NameNode(value: 'categories1')),
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
          ),
          ArgumentNode(
            name: NameNode(value: 'offset'),
            value: VariableNode(name: NameNode(value: 'offset')),
          ),
          ArgumentNode(
            name: NameNode(value: 'limit'),
            value: VariableNode(name: NameNode(value: 'limit')),
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

class Variables$Query$get_business_by_event_category1 {
  factory Variables$Query$get_business_by_event_category1({
    required double distance,
    required Geography from,
    int? offset,
    int? limit,
    List<String>? categories1,
    List<String>? schedule_type,
  }) =>
      Variables$Query$get_business_by_event_category1._({
        r'distance': distance,
        r'from': from,
        if (offset != null) r'offset': offset,
        if (limit != null) r'limit': limit,
        if (categories1 != null) r'categories1': categories1,
        if (schedule_type != null) r'schedule_type': schedule_type,
      });

  Variables$Query$get_business_by_event_category1._(this._$data);

  factory Variables$Query$get_business_by_event_category1.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$distance = data['distance'];
    result$data['distance'] = (l$distance as num).toDouble();
    final l$from = data['from'];
    result$data['from'] = geographyFromJson(l$from);
    if (data.containsKey('offset')) {
      final l$offset = data['offset'];
      result$data['offset'] = (l$offset as int?);
    }
    if (data.containsKey('limit')) {
      final l$limit = data['limit'];
      result$data['limit'] = (l$limit as int?);
    }
    if (data.containsKey('categories1')) {
      final l$categories1 = data['categories1'];
      result$data['categories1'] =
          (l$categories1 as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    if (data.containsKey('schedule_type')) {
      final l$schedule_type = data['schedule_type'];
      result$data['schedule_type'] = (l$schedule_type as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList();
    }
    return Variables$Query$get_business_by_event_category1._(result$data);
  }

  Map<String, dynamic> _$data;

  double get distance => (_$data['distance'] as double);
  Geography get from => (_$data['from'] as Geography);
  int? get offset => (_$data['offset'] as int?);
  int? get limit => (_$data['limit'] as int?);
  List<String>? get categories1 => (_$data['categories1'] as List<String>?);
  List<String>? get schedule_type => (_$data['schedule_type'] as List<String>?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$distance = distance;
    result$data['distance'] = l$distance;
    final l$from = from;
    result$data['from'] = geographyToJson(l$from);
    if (_$data.containsKey('offset')) {
      final l$offset = offset;
      result$data['offset'] = l$offset;
    }
    if (_$data.containsKey('limit')) {
      final l$limit = limit;
      result$data['limit'] = l$limit;
    }
    if (_$data.containsKey('categories1')) {
      final l$categories1 = categories1;
      result$data['categories1'] = l$categories1?.map((e) => e).toList();
    }
    if (_$data.containsKey('schedule_type')) {
      final l$schedule_type = schedule_type;
      result$data['schedule_type'] = l$schedule_type?.map((e) => e).toList();
    }
    return result$data;
  }

  CopyWith$Variables$Query$get_business_by_event_category1<
          Variables$Query$get_business_by_event_category1>
      get copyWith => CopyWith$Variables$Query$get_business_by_event_category1(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_business_by_event_category1) ||
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
    final l$offset = offset;
    final lOther$offset = other.offset;
    if (_$data.containsKey('offset') != other._$data.containsKey('offset')) {
      return false;
    }
    if (l$offset != lOther$offset) {
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
    final l$categories1 = categories1;
    final lOther$categories1 = other.categories1;
    if (_$data.containsKey('categories1') !=
        other._$data.containsKey('categories1')) {
      return false;
    }
    if (l$categories1 != null && lOther$categories1 != null) {
      if (l$categories1.length != lOther$categories1.length) {
        return false;
      }
      for (int i = 0; i < l$categories1.length; i++) {
        final l$categories1$entry = l$categories1[i];
        final lOther$categories1$entry = lOther$categories1[i];
        if (l$categories1$entry != lOther$categories1$entry) {
          return false;
        }
      }
    } else if (l$categories1 != lOther$categories1) {
      return false;
    }
    final l$schedule_type = schedule_type;
    final lOther$schedule_type = other.schedule_type;
    if (_$data.containsKey('schedule_type') !=
        other._$data.containsKey('schedule_type')) {
      return false;
    }
    if (l$schedule_type != null && lOther$schedule_type != null) {
      if (l$schedule_type.length != lOther$schedule_type.length) {
        return false;
      }
      for (int i = 0; i < l$schedule_type.length; i++) {
        final l$schedule_type$entry = l$schedule_type[i];
        final lOther$schedule_type$entry = lOther$schedule_type[i];
        if (l$schedule_type$entry != lOther$schedule_type$entry) {
          return false;
        }
      }
    } else if (l$schedule_type != lOther$schedule_type) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$distance = distance;
    final l$from = from;
    final l$offset = offset;
    final l$limit = limit;
    final l$categories1 = categories1;
    final l$schedule_type = schedule_type;
    return Object.hashAll([
      l$distance,
      l$from,
      _$data.containsKey('offset') ? l$offset : const {},
      _$data.containsKey('limit') ? l$limit : const {},
      _$data.containsKey('categories1')
          ? l$categories1 == null
              ? null
              : Object.hashAll(l$categories1.map((v) => v))
          : const {},
      _$data.containsKey('schedule_type')
          ? l$schedule_type == null
              ? null
              : Object.hashAll(l$schedule_type.map((v) => v))
          : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$get_business_by_event_category1<TRes> {
  factory CopyWith$Variables$Query$get_business_by_event_category1(
    Variables$Query$get_business_by_event_category1 instance,
    TRes Function(Variables$Query$get_business_by_event_category1) then,
  ) = _CopyWithImpl$Variables$Query$get_business_by_event_category1;

  factory CopyWith$Variables$Query$get_business_by_event_category1.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Query$get_business_by_event_category1;

  TRes call({
    double? distance,
    Geography? from,
    int? offset,
    int? limit,
    List<String>? categories1,
    List<String>? schedule_type,
  });
}

class _CopyWithImpl$Variables$Query$get_business_by_event_category1<TRes>
    implements CopyWith$Variables$Query$get_business_by_event_category1<TRes> {
  _CopyWithImpl$Variables$Query$get_business_by_event_category1(
    this._instance,
    this._then,
  );

  final Variables$Query$get_business_by_event_category1 _instance;

  final TRes Function(Variables$Query$get_business_by_event_category1) _then;

  static const _undefined = {};

  TRes call({
    Object? distance = _undefined,
    Object? from = _undefined,
    Object? offset = _undefined,
    Object? limit = _undefined,
    Object? categories1 = _undefined,
    Object? schedule_type = _undefined,
  }) =>
      _then(Variables$Query$get_business_by_event_category1._({
        ..._instance._$data,
        if (distance != _undefined && distance != null)
          'distance': (distance as double),
        if (from != _undefined && from != null) 'from': (from as Geography),
        if (offset != _undefined) 'offset': (offset as int?),
        if (limit != _undefined) 'limit': (limit as int?),
        if (categories1 != _undefined)
          'categories1': (categories1 as List<String>?),
        if (schedule_type != _undefined)
          'schedule_type': (schedule_type as List<String>?),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_business_by_event_category1<TRes>
    implements CopyWith$Variables$Query$get_business_by_event_category1<TRes> {
  _CopyWithStubImpl$Variables$Query$get_business_by_event_category1(this._res);

  TRes _res;

  call({
    double? distance,
    Geography? from,
    int? offset,
    int? limit,
    List<String>? categories1,
    List<String>? schedule_type,
  }) =>
      _res;
}

class Query$get_business_by_event_category1 {
  Query$get_business_by_event_category1({
    required this.business_business,
    required this.$__typename,
  });

  factory Query$get_business_by_event_category1.fromJson(
      Map<String, dynamic> json) {
    final l$business_business = json['business_business'];
    final l$$__typename = json['__typename'];
    return Query$get_business_by_event_category1(
      business_business: (l$business_business as List<dynamic>)
          .map((e) =>
              Query$get_business_by_event_category1$business_business.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$get_business_by_event_category1$business_business>
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
    if (!(other is Query$get_business_by_event_category1) ||
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

extension UtilityExtension$Query$get_business_by_event_category1
    on Query$get_business_by_event_category1 {
  CopyWith$Query$get_business_by_event_category1<
          Query$get_business_by_event_category1>
      get copyWith => CopyWith$Query$get_business_by_event_category1(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_by_event_category1<TRes> {
  factory CopyWith$Query$get_business_by_event_category1(
    Query$get_business_by_event_category1 instance,
    TRes Function(Query$get_business_by_event_category1) then,
  ) = _CopyWithImpl$Query$get_business_by_event_category1;

  factory CopyWith$Query$get_business_by_event_category1.stub(TRes res) =
      _CopyWithStubImpl$Query$get_business_by_event_category1;

  TRes call({
    List<Query$get_business_by_event_category1$business_business>?
        business_business,
    String? $__typename,
  });
  TRes business_business(
      Iterable<Query$get_business_by_event_category1$business_business> Function(
              Iterable<
                  CopyWith$Query$get_business_by_event_category1$business_business<
                      Query$get_business_by_event_category1$business_business>>)
          _fn);
}

class _CopyWithImpl$Query$get_business_by_event_category1<TRes>
    implements CopyWith$Query$get_business_by_event_category1<TRes> {
  _CopyWithImpl$Query$get_business_by_event_category1(
    this._instance,
    this._then,
  );

  final Query$get_business_by_event_category1 _instance;

  final TRes Function(Query$get_business_by_event_category1) _then;

  static const _undefined = {};

  TRes call({
    Object? business_business = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_business_by_event_category1(
        business_business:
            business_business == _undefined || business_business == null
                ? _instance.business_business
                : (business_business as List<
                    Query$get_business_by_event_category1$business_business>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes business_business(
          Iterable<Query$get_business_by_event_category1$business_business> Function(
                  Iterable<
                      CopyWith$Query$get_business_by_event_category1$business_business<
                          Query$get_business_by_event_category1$business_business>>)
              _fn) =>
      call(
          business_business: _fn(_instance.business_business.map((e) =>
              CopyWith$Query$get_business_by_event_category1$business_business(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_business_by_event_category1<TRes>
    implements CopyWith$Query$get_business_by_event_category1<TRes> {
  _CopyWithStubImpl$Query$get_business_by_event_category1(this._res);

  TRes _res;

  call({
    List<Query$get_business_by_event_category1$business_business>?
        business_business,
    String? $__typename,
  }) =>
      _res;
  business_business(_fn) => _res;
}

const documentNodeQueryget_business_by_event_category1 =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_business_by_event_category1'),
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
        variable: VariableNode(name: NameNode(value: 'offset')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
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
        variable: VariableNode(name: NameNode(value: 'categories1')),
        type: ListTypeNode(
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
            isNonNull: true,
          ),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'schedule_type')),
        type: ListTypeNode(
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
            isNonNull: true,
          ),
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
                    name: NameNode(value: 'events'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                        name: NameNode(value: 'details'),
                        value: ObjectValueNode(fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'category1'),
                            value: ObjectValueNode(fields: [
                              ObjectFieldNode(
                                name: NameNode(value: '_in'),
                                value: VariableNode(
                                    name: NameNode(value: 'categories1')),
                              )
                            ]),
                          )
                        ]),
                      ),
                      ObjectFieldNode(
                        name: NameNode(value: 'schedule_type'),
                        value: ObjectValueNode(fields: [
                          ObjectFieldNode(
                            name: NameNode(value: '_in'),
                            value: VariableNode(
                                name: NameNode(value: 'schedule_type')),
                          )
                        ]),
                      ),
                    ]),
                  ),
                ]),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: 'offset'),
            value: VariableNode(name: NameNode(value: 'offset')),
          ),
          ArgumentNode(
            name: NameNode(value: 'limit'),
            value: VariableNode(name: NameNode(value: 'limit')),
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
Query$get_business_by_event_category1
    _parserFn$Query$get_business_by_event_category1(
            Map<String, dynamic> data) =>
        Query$get_business_by_event_category1.fromJson(data);

class Options$Query$get_business_by_event_category1
    extends graphql.QueryOptions<Query$get_business_by_event_category1> {
  Options$Query$get_business_by_event_category1({
    String? operationName,
    required Variables$Query$get_business_by_event_category1 variables,
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
          document: documentNodeQueryget_business_by_event_category1,
          parserFn: _parserFn$Query$get_business_by_event_category1,
        );
}

class WatchOptions$Query$get_business_by_event_category1
    extends graphql.WatchQueryOptions<Query$get_business_by_event_category1> {
  WatchOptions$Query$get_business_by_event_category1({
    String? operationName,
    required Variables$Query$get_business_by_event_category1 variables,
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
          document: documentNodeQueryget_business_by_event_category1,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_business_by_event_category1,
        );
}

class FetchMoreOptions$Query$get_business_by_event_category1
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_business_by_event_category1({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_business_by_event_category1 variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_business_by_event_category1,
        );
}

extension ClientExtension$Query$get_business_by_event_category1
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_business_by_event_category1>>
      query$get_business_by_event_category1(
              Options$Query$get_business_by_event_category1 options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$get_business_by_event_category1>
      watchQuery$get_business_by_event_category1(
              WatchOptions$Query$get_business_by_event_category1 options) =>
          this.watchQuery(options);
  void writeQuery$get_business_by_event_category1({
    required Query$get_business_by_event_category1 data,
    required Variables$Query$get_business_by_event_category1 variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryget_business_by_event_category1),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_business_by_event_category1?
      readQuery$get_business_by_event_category1({
    required Variables$Query$get_business_by_event_category1 variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryget_business_by_event_category1),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$get_business_by_event_category1.fromJson(result);
  }
}

class Query$get_business_by_event_category1$business_business {
  Query$get_business_by_event_category1$business_business({
    required this.id,
    required this.details,
    required this.reviews_aggregate,
    required this.$__typename,
  });

  factory Query$get_business_by_event_category1$business_business.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$details = json['details'];
    final l$reviews_aggregate = json['reviews_aggregate'];
    final l$$__typename = json['__typename'];
    return Query$get_business_by_event_category1$business_business(
      id: (l$id as int),
      details: Query$get_business_by_event_category1$business_business$details
          .fromJson((l$details as Map<String, dynamic>)),
      reviews_aggregate:
          Query$get_business_by_event_category1$business_business$reviews_aggregate
              .fromJson((l$reviews_aggregate as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$get_business_by_event_category1$business_business$details details;

  final Query$get_business_by_event_category1$business_business$reviews_aggregate
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
    if (!(other is Query$get_business_by_event_category1$business_business) ||
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

extension UtilityExtension$Query$get_business_by_event_category1$business_business
    on Query$get_business_by_event_category1$business_business {
  CopyWith$Query$get_business_by_event_category1$business_business<
          Query$get_business_by_event_category1$business_business>
      get copyWith =>
          CopyWith$Query$get_business_by_event_category1$business_business(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_by_event_category1$business_business<
    TRes> {
  factory CopyWith$Query$get_business_by_event_category1$business_business(
    Query$get_business_by_event_category1$business_business instance,
    TRes Function(Query$get_business_by_event_category1$business_business) then,
  ) = _CopyWithImpl$Query$get_business_by_event_category1$business_business;

  factory CopyWith$Query$get_business_by_event_category1$business_business.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_by_event_category1$business_business;

  TRes call({
    int? id,
    Query$get_business_by_event_category1$business_business$details? details,
    Query$get_business_by_event_category1$business_business$reviews_aggregate?
        reviews_aggregate,
    String? $__typename,
  });
  CopyWith$Query$get_business_by_event_category1$business_business$details<TRes>
      get details;
  CopyWith$Query$get_business_by_event_category1$business_business$reviews_aggregate<
      TRes> get reviews_aggregate;
}

class _CopyWithImpl$Query$get_business_by_event_category1$business_business<
        TRes>
    implements
        CopyWith$Query$get_business_by_event_category1$business_business<TRes> {
  _CopyWithImpl$Query$get_business_by_event_category1$business_business(
    this._instance,
    this._then,
  );

  final Query$get_business_by_event_category1$business_business _instance;

  final TRes Function(Query$get_business_by_event_category1$business_business)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? details = _undefined,
    Object? reviews_aggregate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_business_by_event_category1$business_business(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Query$get_business_by_event_category1$business_business$details),
        reviews_aggregate: reviews_aggregate == _undefined ||
                reviews_aggregate == null
            ? _instance.reviews_aggregate
            : (reviews_aggregate
                as Query$get_business_by_event_category1$business_business$reviews_aggregate),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_business_by_event_category1$business_business$details<TRes>
      get details {
    final local$details = _instance.details;
    return CopyWith$Query$get_business_by_event_category1$business_business$details(
        local$details, (e) => call(details: e));
  }

  CopyWith$Query$get_business_by_event_category1$business_business$reviews_aggregate<
      TRes> get reviews_aggregate {
    final local$reviews_aggregate = _instance.reviews_aggregate;
    return CopyWith$Query$get_business_by_event_category1$business_business$reviews_aggregate(
        local$reviews_aggregate, (e) => call(reviews_aggregate: e));
  }
}

class _CopyWithStubImpl$Query$get_business_by_event_category1$business_business<
        TRes>
    implements
        CopyWith$Query$get_business_by_event_category1$business_business<TRes> {
  _CopyWithStubImpl$Query$get_business_by_event_category1$business_business(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$get_business_by_event_category1$business_business$details? details,
    Query$get_business_by_event_category1$business_business$reviews_aggregate?
        reviews_aggregate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_business_by_event_category1$business_business$details<TRes>
      get details =>
          CopyWith$Query$get_business_by_event_category1$business_business$details
              .stub(_res);
  CopyWith$Query$get_business_by_event_category1$business_business$reviews_aggregate<
          TRes>
      get reviews_aggregate =>
          CopyWith$Query$get_business_by_event_category1$business_business$reviews_aggregate
              .stub(_res);
}

class Query$get_business_by_event_category1$business_business$details {
  Query$get_business_by_event_category1$business_business$details({
    required this.id,
    required this.accepted_payments,
    required this.image,
    required this.name,
    required this.$__typename,
  });

  factory Query$get_business_by_event_category1$business_business$details.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$accepted_payments = json['accepted_payments'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$get_business_by_event_category1$business_business$details(
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
            is Query$get_business_by_event_category1$business_business$details) ||
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

extension UtilityExtension$Query$get_business_by_event_category1$business_business$details
    on Query$get_business_by_event_category1$business_business$details {
  CopyWith$Query$get_business_by_event_category1$business_business$details<
          Query$get_business_by_event_category1$business_business$details>
      get copyWith =>
          CopyWith$Query$get_business_by_event_category1$business_business$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_by_event_category1$business_business$details<
    TRes> {
  factory CopyWith$Query$get_business_by_event_category1$business_business$details(
    Query$get_business_by_event_category1$business_business$details instance,
    TRes Function(
            Query$get_business_by_event_category1$business_business$details)
        then,
  ) = _CopyWithImpl$Query$get_business_by_event_category1$business_business$details;

  factory CopyWith$Query$get_business_by_event_category1$business_business$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_by_event_category1$business_business$details;

  TRes call({
    int? id,
    dynamic? accepted_payments,
    String? image,
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_business_by_event_category1$business_business$details<
        TRes>
    implements
        CopyWith$Query$get_business_by_event_category1$business_business$details<
            TRes> {
  _CopyWithImpl$Query$get_business_by_event_category1$business_business$details(
    this._instance,
    this._then,
  );

  final Query$get_business_by_event_category1$business_business$details
      _instance;

  final TRes Function(
      Query$get_business_by_event_category1$business_business$details) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? accepted_payments = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_business_by_event_category1$business_business$details(
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

class _CopyWithStubImpl$Query$get_business_by_event_category1$business_business$details<
        TRes>
    implements
        CopyWith$Query$get_business_by_event_category1$business_business$details<
            TRes> {
  _CopyWithStubImpl$Query$get_business_by_event_category1$business_business$details(
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

class Query$get_business_by_event_category1$business_business$reviews_aggregate {
  Query$get_business_by_event_category1$business_business$reviews_aggregate({
    this.aggregate,
    required this.$__typename,
  });

  factory Query$get_business_by_event_category1$business_business$reviews_aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$aggregate = json['aggregate'];
    final l$$__typename = json['__typename'];
    return Query$get_business_by_event_category1$business_business$reviews_aggregate(
      aggregate: l$aggregate == null
          ? null
          : Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate
              .fromJson((l$aggregate as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate?
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
            is Query$get_business_by_event_category1$business_business$reviews_aggregate) ||
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

extension UtilityExtension$Query$get_business_by_event_category1$business_business$reviews_aggregate
    on Query$get_business_by_event_category1$business_business$reviews_aggregate {
  CopyWith$Query$get_business_by_event_category1$business_business$reviews_aggregate<
          Query$get_business_by_event_category1$business_business$reviews_aggregate>
      get copyWith =>
          CopyWith$Query$get_business_by_event_category1$business_business$reviews_aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_by_event_category1$business_business$reviews_aggregate<
    TRes> {
  factory CopyWith$Query$get_business_by_event_category1$business_business$reviews_aggregate(
    Query$get_business_by_event_category1$business_business$reviews_aggregate
        instance,
    TRes Function(
            Query$get_business_by_event_category1$business_business$reviews_aggregate)
        then,
  ) = _CopyWithImpl$Query$get_business_by_event_category1$business_business$reviews_aggregate;

  factory CopyWith$Query$get_business_by_event_category1$business_business$reviews_aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_by_event_category1$business_business$reviews_aggregate;

  TRes call({
    Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate?
        aggregate,
    String? $__typename,
  });
  CopyWith$Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate<
      TRes> get aggregate;
}

class _CopyWithImpl$Query$get_business_by_event_category1$business_business$reviews_aggregate<
        TRes>
    implements
        CopyWith$Query$get_business_by_event_category1$business_business$reviews_aggregate<
            TRes> {
  _CopyWithImpl$Query$get_business_by_event_category1$business_business$reviews_aggregate(
    this._instance,
    this._then,
  );

  final Query$get_business_by_event_category1$business_business$reviews_aggregate
      _instance;

  final TRes Function(
          Query$get_business_by_event_category1$business_business$reviews_aggregate)
      _then;

  static const _undefined = {};

  TRes call({
    Object? aggregate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_business_by_event_category1$business_business$reviews_aggregate(
        aggregate: aggregate == _undefined
            ? _instance.aggregate
            : (aggregate
                as Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate<
      TRes> get aggregate {
    final local$aggregate = _instance.aggregate;
    return local$aggregate == null
        ? CopyWith$Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate
            .stub(_then(_instance))
        : CopyWith$Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate(
            local$aggregate, (e) => call(aggregate: e));
  }
}

class _CopyWithStubImpl$Query$get_business_by_event_category1$business_business$reviews_aggregate<
        TRes>
    implements
        CopyWith$Query$get_business_by_event_category1$business_business$reviews_aggregate<
            TRes> {
  _CopyWithStubImpl$Query$get_business_by_event_category1$business_business$reviews_aggregate(
      this._res);

  TRes _res;

  call({
    Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate?
        aggregate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate<
          TRes>
      get aggregate =>
          CopyWith$Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate
              .stub(_res);
}

class Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate {
  Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate({
    this.avg,
    required this.count,
    required this.$__typename,
  });

  factory Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$avg = json['avg'];
    final l$count = json['count'];
    final l$$__typename = json['__typename'];
    return Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate(
      avg: l$avg == null
          ? null
          : Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate$avg
              .fromJson((l$avg as Map<String, dynamic>)),
      count: (l$count as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate$avg?
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
            is Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate) ||
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

extension UtilityExtension$Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate
    on Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate {
  CopyWith$Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate<
          Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate>
      get copyWith =>
          CopyWith$Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate<
    TRes> {
  factory CopyWith$Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate(
    Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate
        instance,
    TRes Function(
            Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate)
        then,
  ) = _CopyWithImpl$Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate;

  factory CopyWith$Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate;

  TRes call({
    Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate$avg?
        avg,
    int? count,
    String? $__typename,
  });
  CopyWith$Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate$avg<
      TRes> get avg;
}

class _CopyWithImpl$Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate<
            TRes> {
  _CopyWithImpl$Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate(
    this._instance,
    this._then,
  );

  final Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate
      _instance;

  final TRes Function(
          Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate)
      _then;

  static const _undefined = {};

  TRes call({
    Object? avg = _undefined,
    Object? count = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate(
        avg: avg == _undefined
            ? _instance.avg
            : (avg
                as Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate$avg?),
        count: count == _undefined || count == null
            ? _instance.count
            : (count as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate$avg<
      TRes> get avg {
    final local$avg = _instance.avg;
    return local$avg == null
        ? CopyWith$Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate$avg
            .stub(_then(_instance))
        : CopyWith$Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate$avg(
            local$avg, (e) => call(avg: e));
  }
}

class _CopyWithStubImpl$Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate<
            TRes> {
  _CopyWithStubImpl$Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate(
      this._res);

  TRes _res;

  call({
    Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate$avg?
        avg,
    int? count,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate$avg<
          TRes>
      get avg =>
          CopyWith$Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate$avg
              .stub(_res);
}

class Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate$avg {
  Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate$avg({
    this.rating,
    required this.$__typename,
  });

  factory Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate$avg.fromJson(
      Map<String, dynamic> json) {
    final l$rating = json['rating'];
    final l$$__typename = json['__typename'];
    return Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate$avg(
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
            is Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate$avg) ||
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

extension UtilityExtension$Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate$avg
    on Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate$avg {
  CopyWith$Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate$avg<
          Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate$avg>
      get copyWith =>
          CopyWith$Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate$avg(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate$avg<
    TRes> {
  factory CopyWith$Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate$avg(
    Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate$avg
        instance,
    TRes Function(
            Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate$avg)
        then,
  ) = _CopyWithImpl$Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate$avg;

  factory CopyWith$Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate$avg.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate$avg;

  TRes call({
    double? rating,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate$avg<
        TRes>
    implements
        CopyWith$Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate$avg<
            TRes> {
  _CopyWithImpl$Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate$avg(
    this._instance,
    this._then,
  );

  final Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate$avg
      _instance;

  final TRes Function(
          Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate$avg)
      _then;

  static const _undefined = {};

  TRes call({
    Object? rating = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate$avg(
        rating: rating == _undefined ? _instance.rating : (rating as double?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate$avg<
        TRes>
    implements
        CopyWith$Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate$avg<
            TRes> {
  _CopyWithStubImpl$Query$get_business_by_event_category1$business_business$reviews_aggregate$aggregate$avg(
      this._res);

  TRes _res;

  call({
    double? rating,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$get_business_by_service_category1 {
  factory Variables$Query$get_business_by_service_category1({
    required double distance,
    required Geography from,
    List<String>? categories1,
    int? offset,
    int? limit,
  }) =>
      Variables$Query$get_business_by_service_category1._({
        r'distance': distance,
        r'from': from,
        if (categories1 != null) r'categories1': categories1,
        if (offset != null) r'offset': offset,
        if (limit != null) r'limit': limit,
      });

  Variables$Query$get_business_by_service_category1._(this._$data);

  factory Variables$Query$get_business_by_service_category1.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$distance = data['distance'];
    result$data['distance'] = (l$distance as num).toDouble();
    final l$from = data['from'];
    result$data['from'] = geographyFromJson(l$from);
    if (data.containsKey('categories1')) {
      final l$categories1 = data['categories1'];
      result$data['categories1'] =
          (l$categories1 as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    if (data.containsKey('offset')) {
      final l$offset = data['offset'];
      result$data['offset'] = (l$offset as int?);
    }
    if (data.containsKey('limit')) {
      final l$limit = data['limit'];
      result$data['limit'] = (l$limit as int?);
    }
    return Variables$Query$get_business_by_service_category1._(result$data);
  }

  Map<String, dynamic> _$data;

  double get distance => (_$data['distance'] as double);
  Geography get from => (_$data['from'] as Geography);
  List<String>? get categories1 => (_$data['categories1'] as List<String>?);
  int? get offset => (_$data['offset'] as int?);
  int? get limit => (_$data['limit'] as int?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$distance = distance;
    result$data['distance'] = l$distance;
    final l$from = from;
    result$data['from'] = geographyToJson(l$from);
    if (_$data.containsKey('categories1')) {
      final l$categories1 = categories1;
      result$data['categories1'] = l$categories1?.map((e) => e).toList();
    }
    if (_$data.containsKey('offset')) {
      final l$offset = offset;
      result$data['offset'] = l$offset;
    }
    if (_$data.containsKey('limit')) {
      final l$limit = limit;
      result$data['limit'] = l$limit;
    }
    return result$data;
  }

  CopyWith$Variables$Query$get_business_by_service_category1<
          Variables$Query$get_business_by_service_category1>
      get copyWith =>
          CopyWith$Variables$Query$get_business_by_service_category1(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_business_by_service_category1) ||
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
    final l$categories1 = categories1;
    final lOther$categories1 = other.categories1;
    if (_$data.containsKey('categories1') !=
        other._$data.containsKey('categories1')) {
      return false;
    }
    if (l$categories1 != null && lOther$categories1 != null) {
      if (l$categories1.length != lOther$categories1.length) {
        return false;
      }
      for (int i = 0; i < l$categories1.length; i++) {
        final l$categories1$entry = l$categories1[i];
        final lOther$categories1$entry = lOther$categories1[i];
        if (l$categories1$entry != lOther$categories1$entry) {
          return false;
        }
      }
    } else if (l$categories1 != lOther$categories1) {
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
    final l$limit = limit;
    final lOther$limit = other.limit;
    if (_$data.containsKey('limit') != other._$data.containsKey('limit')) {
      return false;
    }
    if (l$limit != lOther$limit) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$distance = distance;
    final l$from = from;
    final l$categories1 = categories1;
    final l$offset = offset;
    final l$limit = limit;
    return Object.hashAll([
      l$distance,
      l$from,
      _$data.containsKey('categories1')
          ? l$categories1 == null
              ? null
              : Object.hashAll(l$categories1.map((v) => v))
          : const {},
      _$data.containsKey('offset') ? l$offset : const {},
      _$data.containsKey('limit') ? l$limit : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$get_business_by_service_category1<
    TRes> {
  factory CopyWith$Variables$Query$get_business_by_service_category1(
    Variables$Query$get_business_by_service_category1 instance,
    TRes Function(Variables$Query$get_business_by_service_category1) then,
  ) = _CopyWithImpl$Variables$Query$get_business_by_service_category1;

  factory CopyWith$Variables$Query$get_business_by_service_category1.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Query$get_business_by_service_category1;

  TRes call({
    double? distance,
    Geography? from,
    List<String>? categories1,
    int? offset,
    int? limit,
  });
}

class _CopyWithImpl$Variables$Query$get_business_by_service_category1<TRes>
    implements
        CopyWith$Variables$Query$get_business_by_service_category1<TRes> {
  _CopyWithImpl$Variables$Query$get_business_by_service_category1(
    this._instance,
    this._then,
  );

  final Variables$Query$get_business_by_service_category1 _instance;

  final TRes Function(Variables$Query$get_business_by_service_category1) _then;

  static const _undefined = {};

  TRes call({
    Object? distance = _undefined,
    Object? from = _undefined,
    Object? categories1 = _undefined,
    Object? offset = _undefined,
    Object? limit = _undefined,
  }) =>
      _then(Variables$Query$get_business_by_service_category1._({
        ..._instance._$data,
        if (distance != _undefined && distance != null)
          'distance': (distance as double),
        if (from != _undefined && from != null) 'from': (from as Geography),
        if (categories1 != _undefined)
          'categories1': (categories1 as List<String>?),
        if (offset != _undefined) 'offset': (offset as int?),
        if (limit != _undefined) 'limit': (limit as int?),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_business_by_service_category1<TRes>
    implements
        CopyWith$Variables$Query$get_business_by_service_category1<TRes> {
  _CopyWithStubImpl$Variables$Query$get_business_by_service_category1(
      this._res);

  TRes _res;

  call({
    double? distance,
    Geography? from,
    List<String>? categories1,
    int? offset,
    int? limit,
  }) =>
      _res;
}

class Query$get_business_by_service_category1 {
  Query$get_business_by_service_category1({
    required this.business_business,
    required this.$__typename,
  });

  factory Query$get_business_by_service_category1.fromJson(
      Map<String, dynamic> json) {
    final l$business_business = json['business_business'];
    final l$$__typename = json['__typename'];
    return Query$get_business_by_service_category1(
      business_business: (l$business_business as List<dynamic>)
          .map((e) => Query$get_business_by_service_category1$business_business
              .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$get_business_by_service_category1$business_business>
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
    if (!(other is Query$get_business_by_service_category1) ||
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

extension UtilityExtension$Query$get_business_by_service_category1
    on Query$get_business_by_service_category1 {
  CopyWith$Query$get_business_by_service_category1<
          Query$get_business_by_service_category1>
      get copyWith => CopyWith$Query$get_business_by_service_category1(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_by_service_category1<TRes> {
  factory CopyWith$Query$get_business_by_service_category1(
    Query$get_business_by_service_category1 instance,
    TRes Function(Query$get_business_by_service_category1) then,
  ) = _CopyWithImpl$Query$get_business_by_service_category1;

  factory CopyWith$Query$get_business_by_service_category1.stub(TRes res) =
      _CopyWithStubImpl$Query$get_business_by_service_category1;

  TRes call({
    List<Query$get_business_by_service_category1$business_business>?
        business_business,
    String? $__typename,
  });
  TRes business_business(
      Iterable<Query$get_business_by_service_category1$business_business> Function(
              Iterable<
                  CopyWith$Query$get_business_by_service_category1$business_business<
                      Query$get_business_by_service_category1$business_business>>)
          _fn);
}

class _CopyWithImpl$Query$get_business_by_service_category1<TRes>
    implements CopyWith$Query$get_business_by_service_category1<TRes> {
  _CopyWithImpl$Query$get_business_by_service_category1(
    this._instance,
    this._then,
  );

  final Query$get_business_by_service_category1 _instance;

  final TRes Function(Query$get_business_by_service_category1) _then;

  static const _undefined = {};

  TRes call({
    Object? business_business = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_business_by_service_category1(
        business_business:
            business_business == _undefined || business_business == null
                ? _instance.business_business
                : (business_business as List<
                    Query$get_business_by_service_category1$business_business>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes business_business(
          Iterable<Query$get_business_by_service_category1$business_business> Function(
                  Iterable<
                      CopyWith$Query$get_business_by_service_category1$business_business<
                          Query$get_business_by_service_category1$business_business>>)
              _fn) =>
      call(
          business_business: _fn(_instance.business_business.map((e) =>
              CopyWith$Query$get_business_by_service_category1$business_business(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_business_by_service_category1<TRes>
    implements CopyWith$Query$get_business_by_service_category1<TRes> {
  _CopyWithStubImpl$Query$get_business_by_service_category1(this._res);

  TRes _res;

  call({
    List<Query$get_business_by_service_category1$business_business>?
        business_business,
    String? $__typename,
  }) =>
      _res;
  business_business(_fn) => _res;
}

const documentNodeQueryget_business_by_service_category1 =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_business_by_service_category1'),
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
        variable: VariableNode(name: NameNode(value: 'categories1')),
        type: ListTypeNode(
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
            isNonNull: true,
          ),
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
        variable: VariableNode(name: NameNode(value: 'limit')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
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
                    name: NameNode(value: 'services'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                        name: NameNode(value: 'details'),
                        value: ObjectValueNode(fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'category1'),
                            value: ObjectValueNode(fields: [
                              ObjectFieldNode(
                                name: NameNode(value: '_in'),
                                value: VariableNode(
                                    name: NameNode(value: 'categories1')),
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
          ),
          ArgumentNode(
            name: NameNode(value: 'offset'),
            value: VariableNode(name: NameNode(value: 'offset')),
          ),
          ArgumentNode(
            name: NameNode(value: 'limit'),
            value: VariableNode(name: NameNode(value: 'limit')),
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
Query$get_business_by_service_category1
    _parserFn$Query$get_business_by_service_category1(
            Map<String, dynamic> data) =>
        Query$get_business_by_service_category1.fromJson(data);

class Options$Query$get_business_by_service_category1
    extends graphql.QueryOptions<Query$get_business_by_service_category1> {
  Options$Query$get_business_by_service_category1({
    String? operationName,
    required Variables$Query$get_business_by_service_category1 variables,
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
          document: documentNodeQueryget_business_by_service_category1,
          parserFn: _parserFn$Query$get_business_by_service_category1,
        );
}

class WatchOptions$Query$get_business_by_service_category1
    extends graphql.WatchQueryOptions<Query$get_business_by_service_category1> {
  WatchOptions$Query$get_business_by_service_category1({
    String? operationName,
    required Variables$Query$get_business_by_service_category1 variables,
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
          document: documentNodeQueryget_business_by_service_category1,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_business_by_service_category1,
        );
}

class FetchMoreOptions$Query$get_business_by_service_category1
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_business_by_service_category1({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_business_by_service_category1 variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_business_by_service_category1,
        );
}

extension ClientExtension$Query$get_business_by_service_category1
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_business_by_service_category1>>
      query$get_business_by_service_category1(
              Options$Query$get_business_by_service_category1 options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$get_business_by_service_category1>
      watchQuery$get_business_by_service_category1(
              WatchOptions$Query$get_business_by_service_category1 options) =>
          this.watchQuery(options);
  void writeQuery$get_business_by_service_category1({
    required Query$get_business_by_service_category1 data,
    required Variables$Query$get_business_by_service_category1 variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryget_business_by_service_category1),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_business_by_service_category1?
      readQuery$get_business_by_service_category1({
    required Variables$Query$get_business_by_service_category1 variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryget_business_by_service_category1),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$get_business_by_service_category1.fromJson(result);
  }
}

class Query$get_business_by_service_category1$business_business {
  Query$get_business_by_service_category1$business_business({
    required this.id,
    required this.details,
    required this.reviews_aggregate,
    required this.$__typename,
  });

  factory Query$get_business_by_service_category1$business_business.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$details = json['details'];
    final l$reviews_aggregate = json['reviews_aggregate'];
    final l$$__typename = json['__typename'];
    return Query$get_business_by_service_category1$business_business(
      id: (l$id as int),
      details: Query$get_business_by_service_category1$business_business$details
          .fromJson((l$details as Map<String, dynamic>)),
      reviews_aggregate:
          Query$get_business_by_service_category1$business_business$reviews_aggregate
              .fromJson((l$reviews_aggregate as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$get_business_by_service_category1$business_business$details
      details;

  final Query$get_business_by_service_category1$business_business$reviews_aggregate
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
    if (!(other is Query$get_business_by_service_category1$business_business) ||
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

extension UtilityExtension$Query$get_business_by_service_category1$business_business
    on Query$get_business_by_service_category1$business_business {
  CopyWith$Query$get_business_by_service_category1$business_business<
          Query$get_business_by_service_category1$business_business>
      get copyWith =>
          CopyWith$Query$get_business_by_service_category1$business_business(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_by_service_category1$business_business<
    TRes> {
  factory CopyWith$Query$get_business_by_service_category1$business_business(
    Query$get_business_by_service_category1$business_business instance,
    TRes Function(Query$get_business_by_service_category1$business_business)
        then,
  ) = _CopyWithImpl$Query$get_business_by_service_category1$business_business;

  factory CopyWith$Query$get_business_by_service_category1$business_business.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_by_service_category1$business_business;

  TRes call({
    int? id,
    Query$get_business_by_service_category1$business_business$details? details,
    Query$get_business_by_service_category1$business_business$reviews_aggregate?
        reviews_aggregate,
    String? $__typename,
  });
  CopyWith$Query$get_business_by_service_category1$business_business$details<
      TRes> get details;
  CopyWith$Query$get_business_by_service_category1$business_business$reviews_aggregate<
      TRes> get reviews_aggregate;
}

class _CopyWithImpl$Query$get_business_by_service_category1$business_business<
        TRes>
    implements
        CopyWith$Query$get_business_by_service_category1$business_business<
            TRes> {
  _CopyWithImpl$Query$get_business_by_service_category1$business_business(
    this._instance,
    this._then,
  );

  final Query$get_business_by_service_category1$business_business _instance;

  final TRes Function(Query$get_business_by_service_category1$business_business)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? details = _undefined,
    Object? reviews_aggregate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_business_by_service_category1$business_business(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Query$get_business_by_service_category1$business_business$details),
        reviews_aggregate: reviews_aggregate == _undefined ||
                reviews_aggregate == null
            ? _instance.reviews_aggregate
            : (reviews_aggregate
                as Query$get_business_by_service_category1$business_business$reviews_aggregate),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_business_by_service_category1$business_business$details<
      TRes> get details {
    final local$details = _instance.details;
    return CopyWith$Query$get_business_by_service_category1$business_business$details(
        local$details, (e) => call(details: e));
  }

  CopyWith$Query$get_business_by_service_category1$business_business$reviews_aggregate<
      TRes> get reviews_aggregate {
    final local$reviews_aggregate = _instance.reviews_aggregate;
    return CopyWith$Query$get_business_by_service_category1$business_business$reviews_aggregate(
        local$reviews_aggregate, (e) => call(reviews_aggregate: e));
  }
}

class _CopyWithStubImpl$Query$get_business_by_service_category1$business_business<
        TRes>
    implements
        CopyWith$Query$get_business_by_service_category1$business_business<
            TRes> {
  _CopyWithStubImpl$Query$get_business_by_service_category1$business_business(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$get_business_by_service_category1$business_business$details? details,
    Query$get_business_by_service_category1$business_business$reviews_aggregate?
        reviews_aggregate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_business_by_service_category1$business_business$details<
          TRes>
      get details =>
          CopyWith$Query$get_business_by_service_category1$business_business$details
              .stub(_res);
  CopyWith$Query$get_business_by_service_category1$business_business$reviews_aggregate<
          TRes>
      get reviews_aggregate =>
          CopyWith$Query$get_business_by_service_category1$business_business$reviews_aggregate
              .stub(_res);
}

class Query$get_business_by_service_category1$business_business$details {
  Query$get_business_by_service_category1$business_business$details({
    required this.id,
    required this.accepted_payments,
    required this.image,
    required this.name,
    required this.$__typename,
  });

  factory Query$get_business_by_service_category1$business_business$details.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$accepted_payments = json['accepted_payments'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$get_business_by_service_category1$business_business$details(
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
            is Query$get_business_by_service_category1$business_business$details) ||
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

extension UtilityExtension$Query$get_business_by_service_category1$business_business$details
    on Query$get_business_by_service_category1$business_business$details {
  CopyWith$Query$get_business_by_service_category1$business_business$details<
          Query$get_business_by_service_category1$business_business$details>
      get copyWith =>
          CopyWith$Query$get_business_by_service_category1$business_business$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_by_service_category1$business_business$details<
    TRes> {
  factory CopyWith$Query$get_business_by_service_category1$business_business$details(
    Query$get_business_by_service_category1$business_business$details instance,
    TRes Function(
            Query$get_business_by_service_category1$business_business$details)
        then,
  ) = _CopyWithImpl$Query$get_business_by_service_category1$business_business$details;

  factory CopyWith$Query$get_business_by_service_category1$business_business$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_by_service_category1$business_business$details;

  TRes call({
    int? id,
    dynamic? accepted_payments,
    String? image,
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_business_by_service_category1$business_business$details<
        TRes>
    implements
        CopyWith$Query$get_business_by_service_category1$business_business$details<
            TRes> {
  _CopyWithImpl$Query$get_business_by_service_category1$business_business$details(
    this._instance,
    this._then,
  );

  final Query$get_business_by_service_category1$business_business$details
      _instance;

  final TRes Function(
      Query$get_business_by_service_category1$business_business$details) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? accepted_payments = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_business_by_service_category1$business_business$details(
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

class _CopyWithStubImpl$Query$get_business_by_service_category1$business_business$details<
        TRes>
    implements
        CopyWith$Query$get_business_by_service_category1$business_business$details<
            TRes> {
  _CopyWithStubImpl$Query$get_business_by_service_category1$business_business$details(
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

class Query$get_business_by_service_category1$business_business$reviews_aggregate {
  Query$get_business_by_service_category1$business_business$reviews_aggregate({
    this.aggregate,
    required this.$__typename,
  });

  factory Query$get_business_by_service_category1$business_business$reviews_aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$aggregate = json['aggregate'];
    final l$$__typename = json['__typename'];
    return Query$get_business_by_service_category1$business_business$reviews_aggregate(
      aggregate: l$aggregate == null
          ? null
          : Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate
              .fromJson((l$aggregate as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate?
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
            is Query$get_business_by_service_category1$business_business$reviews_aggregate) ||
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

extension UtilityExtension$Query$get_business_by_service_category1$business_business$reviews_aggregate
    on Query$get_business_by_service_category1$business_business$reviews_aggregate {
  CopyWith$Query$get_business_by_service_category1$business_business$reviews_aggregate<
          Query$get_business_by_service_category1$business_business$reviews_aggregate>
      get copyWith =>
          CopyWith$Query$get_business_by_service_category1$business_business$reviews_aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_by_service_category1$business_business$reviews_aggregate<
    TRes> {
  factory CopyWith$Query$get_business_by_service_category1$business_business$reviews_aggregate(
    Query$get_business_by_service_category1$business_business$reviews_aggregate
        instance,
    TRes Function(
            Query$get_business_by_service_category1$business_business$reviews_aggregate)
        then,
  ) = _CopyWithImpl$Query$get_business_by_service_category1$business_business$reviews_aggregate;

  factory CopyWith$Query$get_business_by_service_category1$business_business$reviews_aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_by_service_category1$business_business$reviews_aggregate;

  TRes call({
    Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate?
        aggregate,
    String? $__typename,
  });
  CopyWith$Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate<
      TRes> get aggregate;
}

class _CopyWithImpl$Query$get_business_by_service_category1$business_business$reviews_aggregate<
        TRes>
    implements
        CopyWith$Query$get_business_by_service_category1$business_business$reviews_aggregate<
            TRes> {
  _CopyWithImpl$Query$get_business_by_service_category1$business_business$reviews_aggregate(
    this._instance,
    this._then,
  );

  final Query$get_business_by_service_category1$business_business$reviews_aggregate
      _instance;

  final TRes Function(
          Query$get_business_by_service_category1$business_business$reviews_aggregate)
      _then;

  static const _undefined = {};

  TRes call({
    Object? aggregate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_business_by_service_category1$business_business$reviews_aggregate(
        aggregate: aggregate == _undefined
            ? _instance.aggregate
            : (aggregate
                as Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate<
      TRes> get aggregate {
    final local$aggregate = _instance.aggregate;
    return local$aggregate == null
        ? CopyWith$Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate
            .stub(_then(_instance))
        : CopyWith$Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate(
            local$aggregate, (e) => call(aggregate: e));
  }
}

class _CopyWithStubImpl$Query$get_business_by_service_category1$business_business$reviews_aggregate<
        TRes>
    implements
        CopyWith$Query$get_business_by_service_category1$business_business$reviews_aggregate<
            TRes> {
  _CopyWithStubImpl$Query$get_business_by_service_category1$business_business$reviews_aggregate(
      this._res);

  TRes _res;

  call({
    Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate?
        aggregate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate<
          TRes>
      get aggregate =>
          CopyWith$Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate
              .stub(_res);
}

class Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate {
  Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate({
    this.avg,
    required this.count,
    required this.$__typename,
  });

  factory Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$avg = json['avg'];
    final l$count = json['count'];
    final l$$__typename = json['__typename'];
    return Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate(
      avg: l$avg == null
          ? null
          : Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate$avg
              .fromJson((l$avg as Map<String, dynamic>)),
      count: (l$count as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate$avg?
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
            is Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate) ||
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

extension UtilityExtension$Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate
    on Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate {
  CopyWith$Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate<
          Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate>
      get copyWith =>
          CopyWith$Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate<
    TRes> {
  factory CopyWith$Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate(
    Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate
        instance,
    TRes Function(
            Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate)
        then,
  ) = _CopyWithImpl$Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate;

  factory CopyWith$Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate;

  TRes call({
    Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate$avg?
        avg,
    int? count,
    String? $__typename,
  });
  CopyWith$Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate$avg<
      TRes> get avg;
}

class _CopyWithImpl$Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate<
            TRes> {
  _CopyWithImpl$Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate(
    this._instance,
    this._then,
  );

  final Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate
      _instance;

  final TRes Function(
          Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate)
      _then;

  static const _undefined = {};

  TRes call({
    Object? avg = _undefined,
    Object? count = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate(
        avg: avg == _undefined
            ? _instance.avg
            : (avg
                as Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate$avg?),
        count: count == _undefined || count == null
            ? _instance.count
            : (count as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate$avg<
      TRes> get avg {
    final local$avg = _instance.avg;
    return local$avg == null
        ? CopyWith$Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate$avg
            .stub(_then(_instance))
        : CopyWith$Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate$avg(
            local$avg, (e) => call(avg: e));
  }
}

class _CopyWithStubImpl$Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate<
            TRes> {
  _CopyWithStubImpl$Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate(
      this._res);

  TRes _res;

  call({
    Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate$avg?
        avg,
    int? count,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate$avg<
          TRes>
      get avg =>
          CopyWith$Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate$avg
              .stub(_res);
}

class Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate$avg {
  Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate$avg({
    this.rating,
    required this.$__typename,
  });

  factory Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate$avg.fromJson(
      Map<String, dynamic> json) {
    final l$rating = json['rating'];
    final l$$__typename = json['__typename'];
    return Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate$avg(
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
            is Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate$avg) ||
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

extension UtilityExtension$Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate$avg
    on Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate$avg {
  CopyWith$Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate$avg<
          Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate$avg>
      get copyWith =>
          CopyWith$Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate$avg(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate$avg<
    TRes> {
  factory CopyWith$Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate$avg(
    Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate$avg
        instance,
    TRes Function(
            Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate$avg)
        then,
  ) = _CopyWithImpl$Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate$avg;

  factory CopyWith$Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate$avg.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate$avg;

  TRes call({
    double? rating,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate$avg<
        TRes>
    implements
        CopyWith$Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate$avg<
            TRes> {
  _CopyWithImpl$Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate$avg(
    this._instance,
    this._then,
  );

  final Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate$avg
      _instance;

  final TRes Function(
          Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate$avg)
      _then;

  static const _undefined = {};

  TRes call({
    Object? rating = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate$avg(
        rating: rating == _undefined ? _instance.rating : (rating as double?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate$avg<
        TRes>
    implements
        CopyWith$Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate$avg<
            TRes> {
  _CopyWithStubImpl$Query$get_business_by_service_category1$business_business$reviews_aggregate$aggregate$avg(
      this._res);

  TRes _res;

  call({
    double? rating,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$get_business_by_product_category1 {
  factory Variables$Query$get_business_by_product_category1({
    required double distance,
    required Geography from,
    List<String>? categories1,
    int? offset,
    int? limit,
  }) =>
      Variables$Query$get_business_by_product_category1._({
        r'distance': distance,
        r'from': from,
        if (categories1 != null) r'categories1': categories1,
        if (offset != null) r'offset': offset,
        if (limit != null) r'limit': limit,
      });

  Variables$Query$get_business_by_product_category1._(this._$data);

  factory Variables$Query$get_business_by_product_category1.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$distance = data['distance'];
    result$data['distance'] = (l$distance as num).toDouble();
    final l$from = data['from'];
    result$data['from'] = geographyFromJson(l$from);
    if (data.containsKey('categories1')) {
      final l$categories1 = data['categories1'];
      result$data['categories1'] =
          (l$categories1 as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    if (data.containsKey('offset')) {
      final l$offset = data['offset'];
      result$data['offset'] = (l$offset as int?);
    }
    if (data.containsKey('limit')) {
      final l$limit = data['limit'];
      result$data['limit'] = (l$limit as int?);
    }
    return Variables$Query$get_business_by_product_category1._(result$data);
  }

  Map<String, dynamic> _$data;

  double get distance => (_$data['distance'] as double);
  Geography get from => (_$data['from'] as Geography);
  List<String>? get categories1 => (_$data['categories1'] as List<String>?);
  int? get offset => (_$data['offset'] as int?);
  int? get limit => (_$data['limit'] as int?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$distance = distance;
    result$data['distance'] = l$distance;
    final l$from = from;
    result$data['from'] = geographyToJson(l$from);
    if (_$data.containsKey('categories1')) {
      final l$categories1 = categories1;
      result$data['categories1'] = l$categories1?.map((e) => e).toList();
    }
    if (_$data.containsKey('offset')) {
      final l$offset = offset;
      result$data['offset'] = l$offset;
    }
    if (_$data.containsKey('limit')) {
      final l$limit = limit;
      result$data['limit'] = l$limit;
    }
    return result$data;
  }

  CopyWith$Variables$Query$get_business_by_product_category1<
          Variables$Query$get_business_by_product_category1>
      get copyWith =>
          CopyWith$Variables$Query$get_business_by_product_category1(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_business_by_product_category1) ||
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
    final l$categories1 = categories1;
    final lOther$categories1 = other.categories1;
    if (_$data.containsKey('categories1') !=
        other._$data.containsKey('categories1')) {
      return false;
    }
    if (l$categories1 != null && lOther$categories1 != null) {
      if (l$categories1.length != lOther$categories1.length) {
        return false;
      }
      for (int i = 0; i < l$categories1.length; i++) {
        final l$categories1$entry = l$categories1[i];
        final lOther$categories1$entry = lOther$categories1[i];
        if (l$categories1$entry != lOther$categories1$entry) {
          return false;
        }
      }
    } else if (l$categories1 != lOther$categories1) {
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
    final l$limit = limit;
    final lOther$limit = other.limit;
    if (_$data.containsKey('limit') != other._$data.containsKey('limit')) {
      return false;
    }
    if (l$limit != lOther$limit) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$distance = distance;
    final l$from = from;
    final l$categories1 = categories1;
    final l$offset = offset;
    final l$limit = limit;
    return Object.hashAll([
      l$distance,
      l$from,
      _$data.containsKey('categories1')
          ? l$categories1 == null
              ? null
              : Object.hashAll(l$categories1.map((v) => v))
          : const {},
      _$data.containsKey('offset') ? l$offset : const {},
      _$data.containsKey('limit') ? l$limit : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$get_business_by_product_category1<
    TRes> {
  factory CopyWith$Variables$Query$get_business_by_product_category1(
    Variables$Query$get_business_by_product_category1 instance,
    TRes Function(Variables$Query$get_business_by_product_category1) then,
  ) = _CopyWithImpl$Variables$Query$get_business_by_product_category1;

  factory CopyWith$Variables$Query$get_business_by_product_category1.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Query$get_business_by_product_category1;

  TRes call({
    double? distance,
    Geography? from,
    List<String>? categories1,
    int? offset,
    int? limit,
  });
}

class _CopyWithImpl$Variables$Query$get_business_by_product_category1<TRes>
    implements
        CopyWith$Variables$Query$get_business_by_product_category1<TRes> {
  _CopyWithImpl$Variables$Query$get_business_by_product_category1(
    this._instance,
    this._then,
  );

  final Variables$Query$get_business_by_product_category1 _instance;

  final TRes Function(Variables$Query$get_business_by_product_category1) _then;

  static const _undefined = {};

  TRes call({
    Object? distance = _undefined,
    Object? from = _undefined,
    Object? categories1 = _undefined,
    Object? offset = _undefined,
    Object? limit = _undefined,
  }) =>
      _then(Variables$Query$get_business_by_product_category1._({
        ..._instance._$data,
        if (distance != _undefined && distance != null)
          'distance': (distance as double),
        if (from != _undefined && from != null) 'from': (from as Geography),
        if (categories1 != _undefined)
          'categories1': (categories1 as List<String>?),
        if (offset != _undefined) 'offset': (offset as int?),
        if (limit != _undefined) 'limit': (limit as int?),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_business_by_product_category1<TRes>
    implements
        CopyWith$Variables$Query$get_business_by_product_category1<TRes> {
  _CopyWithStubImpl$Variables$Query$get_business_by_product_category1(
      this._res);

  TRes _res;

  call({
    double? distance,
    Geography? from,
    List<String>? categories1,
    int? offset,
    int? limit,
  }) =>
      _res;
}

class Query$get_business_by_product_category1 {
  Query$get_business_by_product_category1({
    required this.business_business,
    required this.$__typename,
  });

  factory Query$get_business_by_product_category1.fromJson(
      Map<String, dynamic> json) {
    final l$business_business = json['business_business'];
    final l$$__typename = json['__typename'];
    return Query$get_business_by_product_category1(
      business_business: (l$business_business as List<dynamic>)
          .map((e) => Query$get_business_by_product_category1$business_business
              .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$get_business_by_product_category1$business_business>
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
    if (!(other is Query$get_business_by_product_category1) ||
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

extension UtilityExtension$Query$get_business_by_product_category1
    on Query$get_business_by_product_category1 {
  CopyWith$Query$get_business_by_product_category1<
          Query$get_business_by_product_category1>
      get copyWith => CopyWith$Query$get_business_by_product_category1(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_by_product_category1<TRes> {
  factory CopyWith$Query$get_business_by_product_category1(
    Query$get_business_by_product_category1 instance,
    TRes Function(Query$get_business_by_product_category1) then,
  ) = _CopyWithImpl$Query$get_business_by_product_category1;

  factory CopyWith$Query$get_business_by_product_category1.stub(TRes res) =
      _CopyWithStubImpl$Query$get_business_by_product_category1;

  TRes call({
    List<Query$get_business_by_product_category1$business_business>?
        business_business,
    String? $__typename,
  });
  TRes business_business(
      Iterable<Query$get_business_by_product_category1$business_business> Function(
              Iterable<
                  CopyWith$Query$get_business_by_product_category1$business_business<
                      Query$get_business_by_product_category1$business_business>>)
          _fn);
}

class _CopyWithImpl$Query$get_business_by_product_category1<TRes>
    implements CopyWith$Query$get_business_by_product_category1<TRes> {
  _CopyWithImpl$Query$get_business_by_product_category1(
    this._instance,
    this._then,
  );

  final Query$get_business_by_product_category1 _instance;

  final TRes Function(Query$get_business_by_product_category1) _then;

  static const _undefined = {};

  TRes call({
    Object? business_business = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_business_by_product_category1(
        business_business:
            business_business == _undefined || business_business == null
                ? _instance.business_business
                : (business_business as List<
                    Query$get_business_by_product_category1$business_business>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes business_business(
          Iterable<Query$get_business_by_product_category1$business_business> Function(
                  Iterable<
                      CopyWith$Query$get_business_by_product_category1$business_business<
                          Query$get_business_by_product_category1$business_business>>)
              _fn) =>
      call(
          business_business: _fn(_instance.business_business.map((e) =>
              CopyWith$Query$get_business_by_product_category1$business_business(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_business_by_product_category1<TRes>
    implements CopyWith$Query$get_business_by_product_category1<TRes> {
  _CopyWithStubImpl$Query$get_business_by_product_category1(this._res);

  TRes _res;

  call({
    List<Query$get_business_by_product_category1$business_business>?
        business_business,
    String? $__typename,
  }) =>
      _res;
  business_business(_fn) => _res;
}

const documentNodeQueryget_business_by_product_category1 =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_business_by_product_category1'),
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
        variable: VariableNode(name: NameNode(value: 'categories1')),
        type: ListTypeNode(
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
            isNonNull: true,
          ),
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
        variable: VariableNode(name: NameNode(value: 'limit')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
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
                    name: NameNode(value: 'products'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                        name: NameNode(value: 'details'),
                        value: ObjectValueNode(fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'category1'),
                            value: ObjectValueNode(fields: [
                              ObjectFieldNode(
                                name: NameNode(value: '_in'),
                                value: VariableNode(
                                    name: NameNode(value: 'categories1')),
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
          ),
          ArgumentNode(
            name: NameNode(value: 'offset'),
            value: VariableNode(name: NameNode(value: 'offset')),
          ),
          ArgumentNode(
            name: NameNode(value: 'limit'),
            value: VariableNode(name: NameNode(value: 'limit')),
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
Query$get_business_by_product_category1
    _parserFn$Query$get_business_by_product_category1(
            Map<String, dynamic> data) =>
        Query$get_business_by_product_category1.fromJson(data);

class Options$Query$get_business_by_product_category1
    extends graphql.QueryOptions<Query$get_business_by_product_category1> {
  Options$Query$get_business_by_product_category1({
    String? operationName,
    required Variables$Query$get_business_by_product_category1 variables,
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
          document: documentNodeQueryget_business_by_product_category1,
          parserFn: _parserFn$Query$get_business_by_product_category1,
        );
}

class WatchOptions$Query$get_business_by_product_category1
    extends graphql.WatchQueryOptions<Query$get_business_by_product_category1> {
  WatchOptions$Query$get_business_by_product_category1({
    String? operationName,
    required Variables$Query$get_business_by_product_category1 variables,
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
          document: documentNodeQueryget_business_by_product_category1,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_business_by_product_category1,
        );
}

class FetchMoreOptions$Query$get_business_by_product_category1
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_business_by_product_category1({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_business_by_product_category1 variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_business_by_product_category1,
        );
}

extension ClientExtension$Query$get_business_by_product_category1
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_business_by_product_category1>>
      query$get_business_by_product_category1(
              Options$Query$get_business_by_product_category1 options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$get_business_by_product_category1>
      watchQuery$get_business_by_product_category1(
              WatchOptions$Query$get_business_by_product_category1 options) =>
          this.watchQuery(options);
  void writeQuery$get_business_by_product_category1({
    required Query$get_business_by_product_category1 data,
    required Variables$Query$get_business_by_product_category1 variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryget_business_by_product_category1),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_business_by_product_category1?
      readQuery$get_business_by_product_category1({
    required Variables$Query$get_business_by_product_category1 variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryget_business_by_product_category1),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$get_business_by_product_category1.fromJson(result);
  }
}

class Query$get_business_by_product_category1$business_business {
  Query$get_business_by_product_category1$business_business({
    required this.id,
    required this.details,
    required this.reviews_aggregate,
    required this.$__typename,
  });

  factory Query$get_business_by_product_category1$business_business.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$details = json['details'];
    final l$reviews_aggregate = json['reviews_aggregate'];
    final l$$__typename = json['__typename'];
    return Query$get_business_by_product_category1$business_business(
      id: (l$id as int),
      details: Query$get_business_by_product_category1$business_business$details
          .fromJson((l$details as Map<String, dynamic>)),
      reviews_aggregate:
          Query$get_business_by_product_category1$business_business$reviews_aggregate
              .fromJson((l$reviews_aggregate as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$get_business_by_product_category1$business_business$details
      details;

  final Query$get_business_by_product_category1$business_business$reviews_aggregate
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
    if (!(other is Query$get_business_by_product_category1$business_business) ||
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

extension UtilityExtension$Query$get_business_by_product_category1$business_business
    on Query$get_business_by_product_category1$business_business {
  CopyWith$Query$get_business_by_product_category1$business_business<
          Query$get_business_by_product_category1$business_business>
      get copyWith =>
          CopyWith$Query$get_business_by_product_category1$business_business(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_by_product_category1$business_business<
    TRes> {
  factory CopyWith$Query$get_business_by_product_category1$business_business(
    Query$get_business_by_product_category1$business_business instance,
    TRes Function(Query$get_business_by_product_category1$business_business)
        then,
  ) = _CopyWithImpl$Query$get_business_by_product_category1$business_business;

  factory CopyWith$Query$get_business_by_product_category1$business_business.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_by_product_category1$business_business;

  TRes call({
    int? id,
    Query$get_business_by_product_category1$business_business$details? details,
    Query$get_business_by_product_category1$business_business$reviews_aggregate?
        reviews_aggregate,
    String? $__typename,
  });
  CopyWith$Query$get_business_by_product_category1$business_business$details<
      TRes> get details;
  CopyWith$Query$get_business_by_product_category1$business_business$reviews_aggregate<
      TRes> get reviews_aggregate;
}

class _CopyWithImpl$Query$get_business_by_product_category1$business_business<
        TRes>
    implements
        CopyWith$Query$get_business_by_product_category1$business_business<
            TRes> {
  _CopyWithImpl$Query$get_business_by_product_category1$business_business(
    this._instance,
    this._then,
  );

  final Query$get_business_by_product_category1$business_business _instance;

  final TRes Function(Query$get_business_by_product_category1$business_business)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? details = _undefined,
    Object? reviews_aggregate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_business_by_product_category1$business_business(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Query$get_business_by_product_category1$business_business$details),
        reviews_aggregate: reviews_aggregate == _undefined ||
                reviews_aggregate == null
            ? _instance.reviews_aggregate
            : (reviews_aggregate
                as Query$get_business_by_product_category1$business_business$reviews_aggregate),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_business_by_product_category1$business_business$details<
      TRes> get details {
    final local$details = _instance.details;
    return CopyWith$Query$get_business_by_product_category1$business_business$details(
        local$details, (e) => call(details: e));
  }

  CopyWith$Query$get_business_by_product_category1$business_business$reviews_aggregate<
      TRes> get reviews_aggregate {
    final local$reviews_aggregate = _instance.reviews_aggregate;
    return CopyWith$Query$get_business_by_product_category1$business_business$reviews_aggregate(
        local$reviews_aggregate, (e) => call(reviews_aggregate: e));
  }
}

class _CopyWithStubImpl$Query$get_business_by_product_category1$business_business<
        TRes>
    implements
        CopyWith$Query$get_business_by_product_category1$business_business<
            TRes> {
  _CopyWithStubImpl$Query$get_business_by_product_category1$business_business(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$get_business_by_product_category1$business_business$details? details,
    Query$get_business_by_product_category1$business_business$reviews_aggregate?
        reviews_aggregate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_business_by_product_category1$business_business$details<
          TRes>
      get details =>
          CopyWith$Query$get_business_by_product_category1$business_business$details
              .stub(_res);
  CopyWith$Query$get_business_by_product_category1$business_business$reviews_aggregate<
          TRes>
      get reviews_aggregate =>
          CopyWith$Query$get_business_by_product_category1$business_business$reviews_aggregate
              .stub(_res);
}

class Query$get_business_by_product_category1$business_business$details {
  Query$get_business_by_product_category1$business_business$details({
    required this.id,
    required this.accepted_payments,
    required this.image,
    required this.name,
    required this.$__typename,
  });

  factory Query$get_business_by_product_category1$business_business$details.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$accepted_payments = json['accepted_payments'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$get_business_by_product_category1$business_business$details(
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
            is Query$get_business_by_product_category1$business_business$details) ||
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

extension UtilityExtension$Query$get_business_by_product_category1$business_business$details
    on Query$get_business_by_product_category1$business_business$details {
  CopyWith$Query$get_business_by_product_category1$business_business$details<
          Query$get_business_by_product_category1$business_business$details>
      get copyWith =>
          CopyWith$Query$get_business_by_product_category1$business_business$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_by_product_category1$business_business$details<
    TRes> {
  factory CopyWith$Query$get_business_by_product_category1$business_business$details(
    Query$get_business_by_product_category1$business_business$details instance,
    TRes Function(
            Query$get_business_by_product_category1$business_business$details)
        then,
  ) = _CopyWithImpl$Query$get_business_by_product_category1$business_business$details;

  factory CopyWith$Query$get_business_by_product_category1$business_business$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_by_product_category1$business_business$details;

  TRes call({
    int? id,
    dynamic? accepted_payments,
    String? image,
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_business_by_product_category1$business_business$details<
        TRes>
    implements
        CopyWith$Query$get_business_by_product_category1$business_business$details<
            TRes> {
  _CopyWithImpl$Query$get_business_by_product_category1$business_business$details(
    this._instance,
    this._then,
  );

  final Query$get_business_by_product_category1$business_business$details
      _instance;

  final TRes Function(
      Query$get_business_by_product_category1$business_business$details) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? accepted_payments = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_business_by_product_category1$business_business$details(
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

class _CopyWithStubImpl$Query$get_business_by_product_category1$business_business$details<
        TRes>
    implements
        CopyWith$Query$get_business_by_product_category1$business_business$details<
            TRes> {
  _CopyWithStubImpl$Query$get_business_by_product_category1$business_business$details(
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

class Query$get_business_by_product_category1$business_business$reviews_aggregate {
  Query$get_business_by_product_category1$business_business$reviews_aggregate({
    this.aggregate,
    required this.$__typename,
  });

  factory Query$get_business_by_product_category1$business_business$reviews_aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$aggregate = json['aggregate'];
    final l$$__typename = json['__typename'];
    return Query$get_business_by_product_category1$business_business$reviews_aggregate(
      aggregate: l$aggregate == null
          ? null
          : Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate
              .fromJson((l$aggregate as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate?
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
            is Query$get_business_by_product_category1$business_business$reviews_aggregate) ||
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

extension UtilityExtension$Query$get_business_by_product_category1$business_business$reviews_aggregate
    on Query$get_business_by_product_category1$business_business$reviews_aggregate {
  CopyWith$Query$get_business_by_product_category1$business_business$reviews_aggregate<
          Query$get_business_by_product_category1$business_business$reviews_aggregate>
      get copyWith =>
          CopyWith$Query$get_business_by_product_category1$business_business$reviews_aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_by_product_category1$business_business$reviews_aggregate<
    TRes> {
  factory CopyWith$Query$get_business_by_product_category1$business_business$reviews_aggregate(
    Query$get_business_by_product_category1$business_business$reviews_aggregate
        instance,
    TRes Function(
            Query$get_business_by_product_category1$business_business$reviews_aggregate)
        then,
  ) = _CopyWithImpl$Query$get_business_by_product_category1$business_business$reviews_aggregate;

  factory CopyWith$Query$get_business_by_product_category1$business_business$reviews_aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_by_product_category1$business_business$reviews_aggregate;

  TRes call({
    Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate?
        aggregate,
    String? $__typename,
  });
  CopyWith$Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate<
      TRes> get aggregate;
}

class _CopyWithImpl$Query$get_business_by_product_category1$business_business$reviews_aggregate<
        TRes>
    implements
        CopyWith$Query$get_business_by_product_category1$business_business$reviews_aggregate<
            TRes> {
  _CopyWithImpl$Query$get_business_by_product_category1$business_business$reviews_aggregate(
    this._instance,
    this._then,
  );

  final Query$get_business_by_product_category1$business_business$reviews_aggregate
      _instance;

  final TRes Function(
          Query$get_business_by_product_category1$business_business$reviews_aggregate)
      _then;

  static const _undefined = {};

  TRes call({
    Object? aggregate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_business_by_product_category1$business_business$reviews_aggregate(
        aggregate: aggregate == _undefined
            ? _instance.aggregate
            : (aggregate
                as Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate<
      TRes> get aggregate {
    final local$aggregate = _instance.aggregate;
    return local$aggregate == null
        ? CopyWith$Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate
            .stub(_then(_instance))
        : CopyWith$Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate(
            local$aggregate, (e) => call(aggregate: e));
  }
}

class _CopyWithStubImpl$Query$get_business_by_product_category1$business_business$reviews_aggregate<
        TRes>
    implements
        CopyWith$Query$get_business_by_product_category1$business_business$reviews_aggregate<
            TRes> {
  _CopyWithStubImpl$Query$get_business_by_product_category1$business_business$reviews_aggregate(
      this._res);

  TRes _res;

  call({
    Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate?
        aggregate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate<
          TRes>
      get aggregate =>
          CopyWith$Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate
              .stub(_res);
}

class Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate {
  Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate({
    this.avg,
    required this.count,
    required this.$__typename,
  });

  factory Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$avg = json['avg'];
    final l$count = json['count'];
    final l$$__typename = json['__typename'];
    return Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate(
      avg: l$avg == null
          ? null
          : Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate$avg
              .fromJson((l$avg as Map<String, dynamic>)),
      count: (l$count as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate$avg?
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
            is Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate) ||
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

extension UtilityExtension$Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate
    on Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate {
  CopyWith$Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate<
          Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate>
      get copyWith =>
          CopyWith$Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate<
    TRes> {
  factory CopyWith$Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate(
    Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate
        instance,
    TRes Function(
            Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate)
        then,
  ) = _CopyWithImpl$Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate;

  factory CopyWith$Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate;

  TRes call({
    Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate$avg?
        avg,
    int? count,
    String? $__typename,
  });
  CopyWith$Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate$avg<
      TRes> get avg;
}

class _CopyWithImpl$Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate<
            TRes> {
  _CopyWithImpl$Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate(
    this._instance,
    this._then,
  );

  final Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate
      _instance;

  final TRes Function(
          Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate)
      _then;

  static const _undefined = {};

  TRes call({
    Object? avg = _undefined,
    Object? count = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate(
        avg: avg == _undefined
            ? _instance.avg
            : (avg
                as Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate$avg?),
        count: count == _undefined || count == null
            ? _instance.count
            : (count as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate$avg<
      TRes> get avg {
    final local$avg = _instance.avg;
    return local$avg == null
        ? CopyWith$Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate$avg
            .stub(_then(_instance))
        : CopyWith$Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate$avg(
            local$avg, (e) => call(avg: e));
  }
}

class _CopyWithStubImpl$Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate<
            TRes> {
  _CopyWithStubImpl$Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate(
      this._res);

  TRes _res;

  call({
    Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate$avg?
        avg,
    int? count,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate$avg<
          TRes>
      get avg =>
          CopyWith$Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate$avg
              .stub(_res);
}

class Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate$avg {
  Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate$avg({
    this.rating,
    required this.$__typename,
  });

  factory Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate$avg.fromJson(
      Map<String, dynamic> json) {
    final l$rating = json['rating'];
    final l$$__typename = json['__typename'];
    return Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate$avg(
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
            is Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate$avg) ||
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

extension UtilityExtension$Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate$avg
    on Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate$avg {
  CopyWith$Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate$avg<
          Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate$avg>
      get copyWith =>
          CopyWith$Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate$avg(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate$avg<
    TRes> {
  factory CopyWith$Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate$avg(
    Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate$avg
        instance,
    TRes Function(
            Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate$avg)
        then,
  ) = _CopyWithImpl$Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate$avg;

  factory CopyWith$Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate$avg.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate$avg;

  TRes call({
    double? rating,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate$avg<
        TRes>
    implements
        CopyWith$Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate$avg<
            TRes> {
  _CopyWithImpl$Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate$avg(
    this._instance,
    this._then,
  );

  final Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate$avg
      _instance;

  final TRes Function(
          Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate$avg)
      _then;

  static const _undefined = {};

  TRes call({
    Object? rating = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate$avg(
        rating: rating == _undefined ? _instance.rating : (rating as double?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate$avg<
        TRes>
    implements
        CopyWith$Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate$avg<
            TRes> {
  _CopyWithStubImpl$Query$get_business_by_product_category1$business_business$reviews_aggregate$aggregate$avg(
      this._res);

  TRes _res;

  call({
    double? rating,
    String? $__typename,
  }) =>
      _res;
}
