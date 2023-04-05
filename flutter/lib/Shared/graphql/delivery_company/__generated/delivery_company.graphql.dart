import '../../__generated/schema.graphql.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Variables$Query$getDeliveryCompanyById {
  factory Variables$Query$getDeliveryCompanyById({required int id}) =>
      Variables$Query$getDeliveryCompanyById._({
        r'id': id,
      });

  Variables$Query$getDeliveryCompanyById._(this._$data);

  factory Variables$Query$getDeliveryCompanyById.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    return Variables$Query$getDeliveryCompanyById._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$getDeliveryCompanyById<
          Variables$Query$getDeliveryCompanyById>
      get copyWith => CopyWith$Variables$Query$getDeliveryCompanyById(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getDeliveryCompanyById) ||
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

abstract class CopyWith$Variables$Query$getDeliveryCompanyById<TRes> {
  factory CopyWith$Variables$Query$getDeliveryCompanyById(
    Variables$Query$getDeliveryCompanyById instance,
    TRes Function(Variables$Query$getDeliveryCompanyById) then,
  ) = _CopyWithImpl$Variables$Query$getDeliveryCompanyById;

  factory CopyWith$Variables$Query$getDeliveryCompanyById.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getDeliveryCompanyById;

  TRes call({int? id});
}

class _CopyWithImpl$Variables$Query$getDeliveryCompanyById<TRes>
    implements CopyWith$Variables$Query$getDeliveryCompanyById<TRes> {
  _CopyWithImpl$Variables$Query$getDeliveryCompanyById(
    this._instance,
    this._then,
  );

  final Variables$Query$getDeliveryCompanyById _instance;

  final TRes Function(Variables$Query$getDeliveryCompanyById) _then;

  static const _undefined = {};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$getDeliveryCompanyById._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getDeliveryCompanyById<TRes>
    implements CopyWith$Variables$Query$getDeliveryCompanyById<TRes> {
  _CopyWithStubImpl$Variables$Query$getDeliveryCompanyById(this._res);

  TRes _res;

  call({int? id}) => _res;
}

class Query$getDeliveryCompanyById {
  Query$getDeliveryCompanyById({
    this.delivery_company_by_pk,
    required this.$__typename,
  });

  factory Query$getDeliveryCompanyById.fromJson(Map<String, dynamic> json) {
    final l$delivery_company_by_pk = json['delivery_company_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$getDeliveryCompanyById(
      delivery_company_by_pk: l$delivery_company_by_pk == null
          ? null
          : Query$getDeliveryCompanyById$delivery_company_by_pk.fromJson(
              (l$delivery_company_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getDeliveryCompanyById$delivery_company_by_pk?
      delivery_company_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delivery_company_by_pk = delivery_company_by_pk;
    _resultData['delivery_company_by_pk'] = l$delivery_company_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delivery_company_by_pk = delivery_company_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$delivery_company_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getDeliveryCompanyById) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delivery_company_by_pk = delivery_company_by_pk;
    final lOther$delivery_company_by_pk = other.delivery_company_by_pk;
    if (l$delivery_company_by_pk != lOther$delivery_company_by_pk) {
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

extension UtilityExtension$Query$getDeliveryCompanyById
    on Query$getDeliveryCompanyById {
  CopyWith$Query$getDeliveryCompanyById<Query$getDeliveryCompanyById>
      get copyWith => CopyWith$Query$getDeliveryCompanyById(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getDeliveryCompanyById<TRes> {
  factory CopyWith$Query$getDeliveryCompanyById(
    Query$getDeliveryCompanyById instance,
    TRes Function(Query$getDeliveryCompanyById) then,
  ) = _CopyWithImpl$Query$getDeliveryCompanyById;

  factory CopyWith$Query$getDeliveryCompanyById.stub(TRes res) =
      _CopyWithStubImpl$Query$getDeliveryCompanyById;

  TRes call({
    Query$getDeliveryCompanyById$delivery_company_by_pk? delivery_company_by_pk,
    String? $__typename,
  });
  CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk<TRes>
      get delivery_company_by_pk;
}

class _CopyWithImpl$Query$getDeliveryCompanyById<TRes>
    implements CopyWith$Query$getDeliveryCompanyById<TRes> {
  _CopyWithImpl$Query$getDeliveryCompanyById(
    this._instance,
    this._then,
  );

  final Query$getDeliveryCompanyById _instance;

  final TRes Function(Query$getDeliveryCompanyById) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_company_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getDeliveryCompanyById(
        delivery_company_by_pk: delivery_company_by_pk == _undefined
            ? _instance.delivery_company_by_pk
            : (delivery_company_by_pk
                as Query$getDeliveryCompanyById$delivery_company_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk<TRes>
      get delivery_company_by_pk {
    final local$delivery_company_by_pk = _instance.delivery_company_by_pk;
    return local$delivery_company_by_pk == null
        ? CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk(
            local$delivery_company_by_pk,
            (e) => call(delivery_company_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$getDeliveryCompanyById<TRes>
    implements CopyWith$Query$getDeliveryCompanyById<TRes> {
  _CopyWithStubImpl$Query$getDeliveryCompanyById(this._res);

  TRes _res;

  call({
    Query$getDeliveryCompanyById$delivery_company_by_pk? delivery_company_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk<TRes>
      get delivery_company_by_pk =>
          CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk.stub(
              _res);
}

const documentNodeQuerygetDeliveryCompanyById = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getDeliveryCompanyById'),
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
        name: NameNode(value: 'delivery_company_by_pk'),
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
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'delivery_details'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'cost_per_km'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'customer_pickup'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'delivery_available'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'free_delivery_km_range'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'free_delivery_minimum_cost'),
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
                name: NameNode(value: 'radius'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'minimum_cost'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'self_delivery'),
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
                name: NameNode(value: 'schedule'),
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
                name: NameNode(value: 'description_id'),
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
                name: NameNode(value: 'location_id'),
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
                name: NameNode(value: 'language'),
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
                name: NameNode(value: 'creation_time'),
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
                name: NameNode(value: 'description'),
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
      
    ]),
  ),
]);
Query$getDeliveryCompanyById _parserFn$Query$getDeliveryCompanyById(
        Map<String, dynamic> data) =>
    Query$getDeliveryCompanyById.fromJson(data);

class Options$Query$getDeliveryCompanyById
    extends graphql.QueryOptions<Query$getDeliveryCompanyById> {
  Options$Query$getDeliveryCompanyById({
    String? operationName,
    required Variables$Query$getDeliveryCompanyById variables,
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
          document: documentNodeQuerygetDeliveryCompanyById,
          parserFn: _parserFn$Query$getDeliveryCompanyById,
        );
}

class WatchOptions$Query$getDeliveryCompanyById
    extends graphql.WatchQueryOptions<Query$getDeliveryCompanyById> {
  WatchOptions$Query$getDeliveryCompanyById({
    String? operationName,
    required Variables$Query$getDeliveryCompanyById variables,
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
          document: documentNodeQuerygetDeliveryCompanyById,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getDeliveryCompanyById,
        );
}

class FetchMoreOptions$Query$getDeliveryCompanyById
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getDeliveryCompanyById({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getDeliveryCompanyById variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetDeliveryCompanyById,
        );
}

extension ClientExtension$Query$getDeliveryCompanyById
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getDeliveryCompanyById>>
      query$getDeliveryCompanyById(
              Options$Query$getDeliveryCompanyById options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getDeliveryCompanyById>
      watchQuery$getDeliveryCompanyById(
              WatchOptions$Query$getDeliveryCompanyById options) =>
          this.watchQuery(options);
  void writeQuery$getDeliveryCompanyById({
    required Query$getDeliveryCompanyById data,
    required Variables$Query$getDeliveryCompanyById variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetDeliveryCompanyById),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getDeliveryCompanyById? readQuery$getDeliveryCompanyById({
    required Variables$Query$getDeliveryCompanyById variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQuerygetDeliveryCompanyById),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$getDeliveryCompanyById.fromJson(result);
  }
}

class Query$getDeliveryCompanyById$delivery_company_by_pk {
  Query$getDeliveryCompanyById$delivery_company_by_pk({
    required this.id,
    required this.delivery_details,
    this.details,
    required this.$__typename,
  });

  factory Query$getDeliveryCompanyById$delivery_company_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$delivery_details = json['delivery_details'];
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$getDeliveryCompanyById$delivery_company_by_pk(
      id: (l$id as int),
      delivery_details:
          Query$getDeliveryCompanyById$delivery_company_by_pk$delivery_details
              .fromJson((l$delivery_details as Map<String, dynamic>)),
      details: l$details == null
          ? null
          : Query$getDeliveryCompanyById$delivery_company_by_pk$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$getDeliveryCompanyById$delivery_company_by_pk$delivery_details
      delivery_details;

  final Query$getDeliveryCompanyById$delivery_company_by_pk$details? details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$delivery_details = delivery_details;
    _resultData['delivery_details'] = l$delivery_details.toJson();
    final l$details = details;
    _resultData['details'] = l$details?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$delivery_details = delivery_details;
    final l$details = details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$delivery_details,
      l$details,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getDeliveryCompanyById$delivery_company_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$delivery_details = delivery_details;
    final lOther$delivery_details = other.delivery_details;
    if (l$delivery_details != lOther$delivery_details) {
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

extension UtilityExtension$Query$getDeliveryCompanyById$delivery_company_by_pk
    on Query$getDeliveryCompanyById$delivery_company_by_pk {
  CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk<
          Query$getDeliveryCompanyById$delivery_company_by_pk>
      get copyWith =>
          CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk<
    TRes> {
  factory CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk(
    Query$getDeliveryCompanyById$delivery_company_by_pk instance,
    TRes Function(Query$getDeliveryCompanyById$delivery_company_by_pk) then,
  ) = _CopyWithImpl$Query$getDeliveryCompanyById$delivery_company_by_pk;

  factory CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getDeliveryCompanyById$delivery_company_by_pk;

  TRes call({
    int? id,
    Query$getDeliveryCompanyById$delivery_company_by_pk$delivery_details?
        delivery_details,
    Query$getDeliveryCompanyById$delivery_company_by_pk$details? details,
    String? $__typename,
  });
  CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$delivery_details<
      TRes> get delivery_details;
  CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details<TRes>
      get details;
}

class _CopyWithImpl$Query$getDeliveryCompanyById$delivery_company_by_pk<TRes>
    implements
        CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk<TRes> {
  _CopyWithImpl$Query$getDeliveryCompanyById$delivery_company_by_pk(
    this._instance,
    this._then,
  );

  final Query$getDeliveryCompanyById$delivery_company_by_pk _instance;

  final TRes Function(Query$getDeliveryCompanyById$delivery_company_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? delivery_details = _undefined,
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getDeliveryCompanyById$delivery_company_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        delivery_details: delivery_details == _undefined ||
                delivery_details == null
            ? _instance.delivery_details
            : (delivery_details
                as Query$getDeliveryCompanyById$delivery_company_by_pk$delivery_details),
        details: details == _undefined
            ? _instance.details
            : (details
                as Query$getDeliveryCompanyById$delivery_company_by_pk$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$delivery_details<
      TRes> get delivery_details {
    final local$delivery_details = _instance.delivery_details;
    return CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$delivery_details(
        local$delivery_details, (e) => call(delivery_details: e));
  }

  CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details<TRes>
      get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details
            .stub(_then(_instance))
        : CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$getDeliveryCompanyById$delivery_company_by_pk<
        TRes>
    implements
        CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk<TRes> {
  _CopyWithStubImpl$Query$getDeliveryCompanyById$delivery_company_by_pk(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$getDeliveryCompanyById$delivery_company_by_pk$delivery_details?
        delivery_details,
    Query$getDeliveryCompanyById$delivery_company_by_pk$details? details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$delivery_details<
          TRes>
      get delivery_details =>
          CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$delivery_details
              .stub(_res);
  CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details<TRes>
      get details =>
          CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details
              .stub(_res);
}

class Query$getDeliveryCompanyById$delivery_company_by_pk$delivery_details {
  Query$getDeliveryCompanyById$delivery_company_by_pk$delivery_details({
    required this.cost_per_km,
    required this.customer_pickup,
    required this.delivery_available,
    this.free_delivery_km_range,
    this.free_delivery_minimum_cost,
    required this.id,
    required this.radius,
    required this.minimum_cost,
    required this.self_delivery,
    required this.$__typename,
  });

  factory Query$getDeliveryCompanyById$delivery_company_by_pk$delivery_details.fromJson(
      Map<String, dynamic> json) {
    final l$cost_per_km = json['cost_per_km'];
    final l$customer_pickup = json['customer_pickup'];
    final l$delivery_available = json['delivery_available'];
    final l$free_delivery_km_range = json['free_delivery_km_range'];
    final l$free_delivery_minimum_cost = json['free_delivery_minimum_cost'];
    final l$id = json['id'];
    final l$radius = json['radius'];
    final l$minimum_cost = json['minimum_cost'];
    final l$self_delivery = json['self_delivery'];
    final l$$__typename = json['__typename'];
    return Query$getDeliveryCompanyById$delivery_company_by_pk$delivery_details(
      cost_per_km: moneyFromJson(l$cost_per_km),
      customer_pickup: (l$customer_pickup as bool),
      delivery_available: (l$delivery_available as bool),
      free_delivery_km_range: (l$free_delivery_km_range as num?)?.toDouble(),
      free_delivery_minimum_cost: l$free_delivery_minimum_cost == null
          ? null
          : moneyFromJson(l$free_delivery_minimum_cost),
      id: (l$id as int),
      radius: (l$radius as int),
      minimum_cost: moneyFromJson(l$minimum_cost),
      self_delivery: (l$self_delivery as bool),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final double cost_per_km;

  final bool customer_pickup;

  final bool delivery_available;

  final double? free_delivery_km_range;

  final double? free_delivery_minimum_cost;

  final int id;

  final int radius;

  final double minimum_cost;

  final bool self_delivery;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$cost_per_km = cost_per_km;
    _resultData['cost_per_km'] = moneyToJson(l$cost_per_km);
    final l$customer_pickup = customer_pickup;
    _resultData['customer_pickup'] = l$customer_pickup;
    final l$delivery_available = delivery_available;
    _resultData['delivery_available'] = l$delivery_available;
    final l$free_delivery_km_range = free_delivery_km_range;
    _resultData['free_delivery_km_range'] = l$free_delivery_km_range;
    final l$free_delivery_minimum_cost = free_delivery_minimum_cost;
    _resultData['free_delivery_minimum_cost'] =
        l$free_delivery_minimum_cost == null
            ? null
            : moneyToJson(l$free_delivery_minimum_cost);
    final l$id = id;
    _resultData['id'] = l$id;
    final l$radius = radius;
    _resultData['radius'] = l$radius;
    final l$minimum_cost = minimum_cost;
    _resultData['minimum_cost'] = moneyToJson(l$minimum_cost);
    final l$self_delivery = self_delivery;
    _resultData['self_delivery'] = l$self_delivery;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$cost_per_km = cost_per_km;
    final l$customer_pickup = customer_pickup;
    final l$delivery_available = delivery_available;
    final l$free_delivery_km_range = free_delivery_km_range;
    final l$free_delivery_minimum_cost = free_delivery_minimum_cost;
    final l$id = id;
    final l$radius = radius;
    final l$minimum_cost = minimum_cost;
    final l$self_delivery = self_delivery;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$cost_per_km,
      l$customer_pickup,
      l$delivery_available,
      l$free_delivery_km_range,
      l$free_delivery_minimum_cost,
      l$id,
      l$radius,
      l$minimum_cost,
      l$self_delivery,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getDeliveryCompanyById$delivery_company_by_pk$delivery_details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$cost_per_km = cost_per_km;
    final lOther$cost_per_km = other.cost_per_km;
    if (l$cost_per_km != lOther$cost_per_km) {
      return false;
    }
    final l$customer_pickup = customer_pickup;
    final lOther$customer_pickup = other.customer_pickup;
    if (l$customer_pickup != lOther$customer_pickup) {
      return false;
    }
    final l$delivery_available = delivery_available;
    final lOther$delivery_available = other.delivery_available;
    if (l$delivery_available != lOther$delivery_available) {
      return false;
    }
    final l$free_delivery_km_range = free_delivery_km_range;
    final lOther$free_delivery_km_range = other.free_delivery_km_range;
    if (l$free_delivery_km_range != lOther$free_delivery_km_range) {
      return false;
    }
    final l$free_delivery_minimum_cost = free_delivery_minimum_cost;
    final lOther$free_delivery_minimum_cost = other.free_delivery_minimum_cost;
    if (l$free_delivery_minimum_cost != lOther$free_delivery_minimum_cost) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$radius = radius;
    final lOther$radius = other.radius;
    if (l$radius != lOther$radius) {
      return false;
    }
    final l$minimum_cost = minimum_cost;
    final lOther$minimum_cost = other.minimum_cost;
    if (l$minimum_cost != lOther$minimum_cost) {
      return false;
    }
    final l$self_delivery = self_delivery;
    final lOther$self_delivery = other.self_delivery;
    if (l$self_delivery != lOther$self_delivery) {
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

extension UtilityExtension$Query$getDeliveryCompanyById$delivery_company_by_pk$delivery_details
    on Query$getDeliveryCompanyById$delivery_company_by_pk$delivery_details {
  CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$delivery_details<
          Query$getDeliveryCompanyById$delivery_company_by_pk$delivery_details>
      get copyWith =>
          CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$delivery_details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$delivery_details<
    TRes> {
  factory CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$delivery_details(
    Query$getDeliveryCompanyById$delivery_company_by_pk$delivery_details
        instance,
    TRes Function(
            Query$getDeliveryCompanyById$delivery_company_by_pk$delivery_details)
        then,
  ) = _CopyWithImpl$Query$getDeliveryCompanyById$delivery_company_by_pk$delivery_details;

  factory CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$delivery_details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getDeliveryCompanyById$delivery_company_by_pk$delivery_details;

  TRes call({
    double? cost_per_km,
    bool? customer_pickup,
    bool? delivery_available,
    double? free_delivery_km_range,
    double? free_delivery_minimum_cost,
    int? id,
    int? radius,
    double? minimum_cost,
    bool? self_delivery,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getDeliveryCompanyById$delivery_company_by_pk$delivery_details<
        TRes>
    implements
        CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$delivery_details<
            TRes> {
  _CopyWithImpl$Query$getDeliveryCompanyById$delivery_company_by_pk$delivery_details(
    this._instance,
    this._then,
  );

  final Query$getDeliveryCompanyById$delivery_company_by_pk$delivery_details
      _instance;

  final TRes Function(
          Query$getDeliveryCompanyById$delivery_company_by_pk$delivery_details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? cost_per_km = _undefined,
    Object? customer_pickup = _undefined,
    Object? delivery_available = _undefined,
    Object? free_delivery_km_range = _undefined,
    Object? free_delivery_minimum_cost = _undefined,
    Object? id = _undefined,
    Object? radius = _undefined,
    Object? minimum_cost = _undefined,
    Object? self_delivery = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getDeliveryCompanyById$delivery_company_by_pk$delivery_details(
        cost_per_km: cost_per_km == _undefined || cost_per_km == null
            ? _instance.cost_per_km
            : (cost_per_km as double),
        customer_pickup:
            customer_pickup == _undefined || customer_pickup == null
                ? _instance.customer_pickup
                : (customer_pickup as bool),
        delivery_available:
            delivery_available == _undefined || delivery_available == null
                ? _instance.delivery_available
                : (delivery_available as bool),
        free_delivery_km_range: free_delivery_km_range == _undefined
            ? _instance.free_delivery_km_range
            : (free_delivery_km_range as double?),
        free_delivery_minimum_cost: free_delivery_minimum_cost == _undefined
            ? _instance.free_delivery_minimum_cost
            : (free_delivery_minimum_cost as double?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        radius: radius == _undefined || radius == null
            ? _instance.radius
            : (radius as int),
        minimum_cost: minimum_cost == _undefined || minimum_cost == null
            ? _instance.minimum_cost
            : (minimum_cost as double),
        self_delivery: self_delivery == _undefined || self_delivery == null
            ? _instance.self_delivery
            : (self_delivery as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getDeliveryCompanyById$delivery_company_by_pk$delivery_details<
        TRes>
    implements
        CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$delivery_details<
            TRes> {
  _CopyWithStubImpl$Query$getDeliveryCompanyById$delivery_company_by_pk$delivery_details(
      this._res);

  TRes _res;

  call({
    double? cost_per_km,
    bool? customer_pickup,
    bool? delivery_available,
    double? free_delivery_km_range,
    double? free_delivery_minimum_cost,
    int? id,
    int? radius,
    double? minimum_cost,
    bool? self_delivery,
    String? $__typename,
  }) =>
      _res;
}

class Query$getDeliveryCompanyById$delivery_company_by_pk$details {
  Query$getDeliveryCompanyById$delivery_company_by_pk$details({
    required this.id,
    this.schedule,
    required this.approved,
    this.description_id,
    required this.image,
    required this.location_id,
    required this.name,
    required this.language,
    required this.open_status,
    required this.creation_time,
    required this.service_provider_type,
    this.description,
    required this.location,
    required this.$__typename,
  });

  factory Query$getDeliveryCompanyById$delivery_company_by_pk$details.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$schedule = json['schedule'];
    final l$approved = json['approved'];
    final l$description_id = json['description_id'];
    final l$image = json['image'];
    final l$location_id = json['location_id'];
    final l$name = json['name'];
    final l$language = json['language'];
    final l$open_status = json['open_status'];
    final l$creation_time = json['creation_time'];
    final l$service_provider_type = json['service_provider_type'];
    final l$description = json['description'];
    final l$location = json['location'];
    final l$$__typename = json['__typename'];
    return Query$getDeliveryCompanyById$delivery_company_by_pk$details(
      id: (l$id as int),
      schedule: l$schedule == null ? null : mapFromJson(l$schedule),
      approved: (l$approved as bool),
      description_id: (l$description_id as int?),
      image: (l$image as String),
      location_id: (l$location_id as int),
      name: (l$name as String),
      language: mapFromJson(l$language),
      open_status: (l$open_status as String),
      creation_time: (l$creation_time as String),
      service_provider_type: (l$service_provider_type as String),
      description: l$description == null
          ? null
          : Query$getDeliveryCompanyById$delivery_company_by_pk$details$description
              .fromJson((l$description as Map<String, dynamic>)),
      location:
          Query$getDeliveryCompanyById$delivery_company_by_pk$details$location
              .fromJson((l$location as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final dynamic? schedule;

  final bool approved;

  final int? description_id;

  final String image;

  final int location_id;

  final String name;

  final dynamic language;

  final String open_status;

  final String creation_time;

  final String service_provider_type;

  final Query$getDeliveryCompanyById$delivery_company_by_pk$details$description?
      description;

  final Query$getDeliveryCompanyById$delivery_company_by_pk$details$location
      location;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$schedule = schedule;
    _resultData['schedule'] = l$schedule == null ? null : mapToJson(l$schedule);
    final l$approved = approved;
    _resultData['approved'] = l$approved;
    final l$description_id = description_id;
    _resultData['description_id'] = l$description_id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$location_id = location_id;
    _resultData['location_id'] = l$location_id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$language = language;
    _resultData['language'] = mapToJson(l$language);
    final l$open_status = open_status;
    _resultData['open_status'] = l$open_status;
    final l$creation_time = creation_time;
    _resultData['creation_time'] = l$creation_time;
    final l$service_provider_type = service_provider_type;
    _resultData['service_provider_type'] = l$service_provider_type;
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
    final l$location = location;
    _resultData['location'] = l$location.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$schedule = schedule;
    final l$approved = approved;
    final l$description_id = description_id;
    final l$image = image;
    final l$location_id = location_id;
    final l$name = name;
    final l$language = language;
    final l$open_status = open_status;
    final l$creation_time = creation_time;
    final l$service_provider_type = service_provider_type;
    final l$description = description;
    final l$location = location;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$schedule,
      l$approved,
      l$description_id,
      l$image,
      l$location_id,
      l$name,
      l$language,
      l$open_status,
      l$creation_time,
      l$service_provider_type,
      l$description,
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
            is Query$getDeliveryCompanyById$delivery_company_by_pk$details) ||
        runtimeType != other.runtimeType) {
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
    final l$approved = approved;
    final lOther$approved = other.approved;
    if (l$approved != lOther$approved) {
      return false;
    }
    final l$description_id = description_id;
    final lOther$description_id = other.description_id;
    if (l$description_id != lOther$description_id) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$location_id = location_id;
    final lOther$location_id = other.location_id;
    if (l$location_id != lOther$location_id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$language = language;
    final lOther$language = other.language;
    if (l$language != lOther$language) {
      return false;
    }
    final l$open_status = open_status;
    final lOther$open_status = other.open_status;
    if (l$open_status != lOther$open_status) {
      return false;
    }
    final l$creation_time = creation_time;
    final lOther$creation_time = other.creation_time;
    if (l$creation_time != lOther$creation_time) {
      return false;
    }
    final l$service_provider_type = service_provider_type;
    final lOther$service_provider_type = other.service_provider_type;
    if (l$service_provider_type != lOther$service_provider_type) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
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

extension UtilityExtension$Query$getDeliveryCompanyById$delivery_company_by_pk$details
    on Query$getDeliveryCompanyById$delivery_company_by_pk$details {
  CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details<
          Query$getDeliveryCompanyById$delivery_company_by_pk$details>
      get copyWith =>
          CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details<
    TRes> {
  factory CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details(
    Query$getDeliveryCompanyById$delivery_company_by_pk$details instance,
    TRes Function(Query$getDeliveryCompanyById$delivery_company_by_pk$details)
        then,
  ) = _CopyWithImpl$Query$getDeliveryCompanyById$delivery_company_by_pk$details;

  factory CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getDeliveryCompanyById$delivery_company_by_pk$details;

  TRes call({
    int? id,
    dynamic? schedule,
    bool? approved,
    int? description_id,
    String? image,
    int? location_id,
    String? name,
    dynamic? language,
    String? open_status,
    String? creation_time,
    String? service_provider_type,
    Query$getDeliveryCompanyById$delivery_company_by_pk$details$description?
        description,
    Query$getDeliveryCompanyById$delivery_company_by_pk$details$location?
        location,
    String? $__typename,
  });
  CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details$description<
      TRes> get description;
  CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details$location<
      TRes> get location;
}

class _CopyWithImpl$Query$getDeliveryCompanyById$delivery_company_by_pk$details<
        TRes>
    implements
        CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details<
            TRes> {
  _CopyWithImpl$Query$getDeliveryCompanyById$delivery_company_by_pk$details(
    this._instance,
    this._then,
  );

  final Query$getDeliveryCompanyById$delivery_company_by_pk$details _instance;

  final TRes Function(
      Query$getDeliveryCompanyById$delivery_company_by_pk$details) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? schedule = _undefined,
    Object? approved = _undefined,
    Object? description_id = _undefined,
    Object? image = _undefined,
    Object? location_id = _undefined,
    Object? name = _undefined,
    Object? language = _undefined,
    Object? open_status = _undefined,
    Object? creation_time = _undefined,
    Object? service_provider_type = _undefined,
    Object? description = _undefined,
    Object? location = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getDeliveryCompanyById$delivery_company_by_pk$details(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        schedule: schedule == _undefined
            ? _instance.schedule
            : (schedule as dynamic?),
        approved: approved == _undefined || approved == null
            ? _instance.approved
            : (approved as bool),
        description_id: description_id == _undefined
            ? _instance.description_id
            : (description_id as int?),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        location_id: location_id == _undefined || location_id == null
            ? _instance.location_id
            : (location_id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        language: language == _undefined || language == null
            ? _instance.language
            : (language as dynamic),
        open_status: open_status == _undefined || open_status == null
            ? _instance.open_status
            : (open_status as String),
        creation_time: creation_time == _undefined || creation_time == null
            ? _instance.creation_time
            : (creation_time as String),
        service_provider_type:
            service_provider_type == _undefined || service_provider_type == null
                ? _instance.service_provider_type
                : (service_provider_type as String),
        description: description == _undefined
            ? _instance.description
            : (description
                as Query$getDeliveryCompanyById$delivery_company_by_pk$details$description?),
        location: location == _undefined || location == null
            ? _instance.location
            : (location
                as Query$getDeliveryCompanyById$delivery_company_by_pk$details$location),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details$description<
      TRes> get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details$description
            .stub(_then(_instance))
        : CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details$description(
            local$description, (e) => call(description: e));
  }

  CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details$location<
      TRes> get location {
    final local$location = _instance.location;
    return CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details$location(
        local$location, (e) => call(location: e));
  }
}

class _CopyWithStubImpl$Query$getDeliveryCompanyById$delivery_company_by_pk$details<
        TRes>
    implements
        CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details<
            TRes> {
  _CopyWithStubImpl$Query$getDeliveryCompanyById$delivery_company_by_pk$details(
      this._res);

  TRes _res;

  call({
    int? id,
    dynamic? schedule,
    bool? approved,
    int? description_id,
    String? image,
    int? location_id,
    String? name,
    dynamic? language,
    String? open_status,
    String? creation_time,
    String? service_provider_type,
    Query$getDeliveryCompanyById$delivery_company_by_pk$details$description?
        description,
    Query$getDeliveryCompanyById$delivery_company_by_pk$details$location?
        location,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details$description<
          TRes>
      get description =>
          CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details$description
              .stub(_res);
  CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details$location<
          TRes>
      get location =>
          CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details$location
              .stub(_res);
}

class Query$getDeliveryCompanyById$delivery_company_by_pk$details$description {
  Query$getDeliveryCompanyById$delivery_company_by_pk$details$description({
    required this.id,
    required this.translations,
    required this.$__typename,
  });

  factory Query$getDeliveryCompanyById$delivery_company_by_pk$details$description.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getDeliveryCompanyById$delivery_company_by_pk$details$description(
      id: (l$id as int),
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getDeliveryCompanyById$delivery_company_by_pk$details$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final List<
          Query$getDeliveryCompanyById$delivery_company_by_pk$details$description$translations>
      translations;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$translations = translations;
    _resultData['translations'] =
        l$translations.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$translations = translations;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
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
            is Query$getDeliveryCompanyById$delivery_company_by_pk$details$description) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Query$getDeliveryCompanyById$delivery_company_by_pk$details$description
    on Query$getDeliveryCompanyById$delivery_company_by_pk$details$description {
  CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details$description<
          Query$getDeliveryCompanyById$delivery_company_by_pk$details$description>
      get copyWith =>
          CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details$description<
    TRes> {
  factory CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details$description(
    Query$getDeliveryCompanyById$delivery_company_by_pk$details$description
        instance,
    TRes Function(
            Query$getDeliveryCompanyById$delivery_company_by_pk$details$description)
        then,
  ) = _CopyWithImpl$Query$getDeliveryCompanyById$delivery_company_by_pk$details$description;

  factory CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details$description.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getDeliveryCompanyById$delivery_company_by_pk$details$description;

  TRes call({
    int? id,
    List<Query$getDeliveryCompanyById$delivery_company_by_pk$details$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getDeliveryCompanyById$delivery_company_by_pk$details$description$translations> Function(
              Iterable<
                  CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details$description$translations<
                      Query$getDeliveryCompanyById$delivery_company_by_pk$details$description$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getDeliveryCompanyById$delivery_company_by_pk$details$description<
        TRes>
    implements
        CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details$description<
            TRes> {
  _CopyWithImpl$Query$getDeliveryCompanyById$delivery_company_by_pk$details$description(
    this._instance,
    this._then,
  );

  final Query$getDeliveryCompanyById$delivery_company_by_pk$details$description
      _instance;

  final TRes Function(
          Query$getDeliveryCompanyById$delivery_company_by_pk$details$description)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getDeliveryCompanyById$delivery_company_by_pk$details$description(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getDeliveryCompanyById$delivery_company_by_pk$details$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getDeliveryCompanyById$delivery_company_by_pk$details$description$translations> Function(
                  Iterable<
                      CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details$description$translations<
                          Query$getDeliveryCompanyById$delivery_company_by_pk$details$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getDeliveryCompanyById$delivery_company_by_pk$details$description<
        TRes>
    implements
        CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details$description<
            TRes> {
  _CopyWithStubImpl$Query$getDeliveryCompanyById$delivery_company_by_pk$details$description(
      this._res);

  TRes _res;

  call({
    int? id,
    List<Query$getDeliveryCompanyById$delivery_company_by_pk$details$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getDeliveryCompanyById$delivery_company_by_pk$details$description$translations {
  Query$getDeliveryCompanyById$delivery_company_by_pk$details$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getDeliveryCompanyById$delivery_company_by_pk$details$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getDeliveryCompanyById$delivery_company_by_pk$details$description$translations(
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
            is Query$getDeliveryCompanyById$delivery_company_by_pk$details$description$translations) ||
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

extension UtilityExtension$Query$getDeliveryCompanyById$delivery_company_by_pk$details$description$translations
    on Query$getDeliveryCompanyById$delivery_company_by_pk$details$description$translations {
  CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details$description$translations<
          Query$getDeliveryCompanyById$delivery_company_by_pk$details$description$translations>
      get copyWith =>
          CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details$description$translations<
    TRes> {
  factory CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details$description$translations(
    Query$getDeliveryCompanyById$delivery_company_by_pk$details$description$translations
        instance,
    TRes Function(
            Query$getDeliveryCompanyById$delivery_company_by_pk$details$description$translations)
        then,
  ) = _CopyWithImpl$Query$getDeliveryCompanyById$delivery_company_by_pk$details$description$translations;

  factory CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getDeliveryCompanyById$delivery_company_by_pk$details$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getDeliveryCompanyById$delivery_company_by_pk$details$description$translations<
        TRes>
    implements
        CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details$description$translations<
            TRes> {
  _CopyWithImpl$Query$getDeliveryCompanyById$delivery_company_by_pk$details$description$translations(
    this._instance,
    this._then,
  );

  final Query$getDeliveryCompanyById$delivery_company_by_pk$details$description$translations
      _instance;

  final TRes Function(
          Query$getDeliveryCompanyById$delivery_company_by_pk$details$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getDeliveryCompanyById$delivery_company_by_pk$details$description$translations(
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

class _CopyWithStubImpl$Query$getDeliveryCompanyById$delivery_company_by_pk$details$description$translations<
        TRes>
    implements
        CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details$description$translations<
            TRes> {
  _CopyWithStubImpl$Query$getDeliveryCompanyById$delivery_company_by_pk$details$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$getDeliveryCompanyById$delivery_company_by_pk$details$location {
  Query$getDeliveryCompanyById$delivery_company_by_pk$details$location({
    required this.gps,
    required this.address,
    required this.$__typename,
  });

  factory Query$getDeliveryCompanyById$delivery_company_by_pk$details$location.fromJson(
      Map<String, dynamic> json) {
    final l$gps = json['gps'];
    final l$address = json['address'];
    final l$$__typename = json['__typename'];
    return Query$getDeliveryCompanyById$delivery_company_by_pk$details$location(
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
            is Query$getDeliveryCompanyById$delivery_company_by_pk$details$location) ||
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

extension UtilityExtension$Query$getDeliveryCompanyById$delivery_company_by_pk$details$location
    on Query$getDeliveryCompanyById$delivery_company_by_pk$details$location {
  CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details$location<
          Query$getDeliveryCompanyById$delivery_company_by_pk$details$location>
      get copyWith =>
          CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details$location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details$location<
    TRes> {
  factory CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details$location(
    Query$getDeliveryCompanyById$delivery_company_by_pk$details$location
        instance,
    TRes Function(
            Query$getDeliveryCompanyById$delivery_company_by_pk$details$location)
        then,
  ) = _CopyWithImpl$Query$getDeliveryCompanyById$delivery_company_by_pk$details$location;

  factory CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details$location.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getDeliveryCompanyById$delivery_company_by_pk$details$location;

  TRes call({
    Geography? gps,
    String? address,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getDeliveryCompanyById$delivery_company_by_pk$details$location<
        TRes>
    implements
        CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details$location<
            TRes> {
  _CopyWithImpl$Query$getDeliveryCompanyById$delivery_company_by_pk$details$location(
    this._instance,
    this._then,
  );

  final Query$getDeliveryCompanyById$delivery_company_by_pk$details$location
      _instance;

  final TRes Function(
          Query$getDeliveryCompanyById$delivery_company_by_pk$details$location)
      _then;

  static const _undefined = {};

  TRes call({
    Object? gps = _undefined,
    Object? address = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getDeliveryCompanyById$delivery_company_by_pk$details$location(
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

class _CopyWithStubImpl$Query$getDeliveryCompanyById$delivery_company_by_pk$details$location<
        TRes>
    implements
        CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$details$location<
            TRes> {
  _CopyWithStubImpl$Query$getDeliveryCompanyById$delivery_company_by_pk$details$location(
      this._res);

  TRes _res;

  call({
    Geography? gps,
    String? address,
    String? $__typename,
  }) =>
      _res;
}

class Query$getDeliveryCompanies {
  Query$getDeliveryCompanies({
    required this.delivery_company,
    required this.$__typename,
  });

  factory Query$getDeliveryCompanies.fromJson(Map<String, dynamic> json) {
    final l$delivery_company = json['delivery_company'];
    final l$$__typename = json['__typename'];
    return Query$getDeliveryCompanies(
      delivery_company: (l$delivery_company as List<dynamic>)
          .map((e) => Query$getDeliveryCompanies$delivery_company.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getDeliveryCompanies$delivery_company> delivery_company;

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
    if (!(other is Query$getDeliveryCompanies) ||
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

extension UtilityExtension$Query$getDeliveryCompanies
    on Query$getDeliveryCompanies {
  CopyWith$Query$getDeliveryCompanies<Query$getDeliveryCompanies>
      get copyWith => CopyWith$Query$getDeliveryCompanies(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getDeliveryCompanies<TRes> {
  factory CopyWith$Query$getDeliveryCompanies(
    Query$getDeliveryCompanies instance,
    TRes Function(Query$getDeliveryCompanies) then,
  ) = _CopyWithImpl$Query$getDeliveryCompanies;

  factory CopyWith$Query$getDeliveryCompanies.stub(TRes res) =
      _CopyWithStubImpl$Query$getDeliveryCompanies;

  TRes call({
    List<Query$getDeliveryCompanies$delivery_company>? delivery_company,
    String? $__typename,
  });
  TRes delivery_company(
      Iterable<Query$getDeliveryCompanies$delivery_company> Function(
              Iterable<
                  CopyWith$Query$getDeliveryCompanies$delivery_company<
                      Query$getDeliveryCompanies$delivery_company>>)
          _fn);
}

class _CopyWithImpl$Query$getDeliveryCompanies<TRes>
    implements CopyWith$Query$getDeliveryCompanies<TRes> {
  _CopyWithImpl$Query$getDeliveryCompanies(
    this._instance,
    this._then,
  );

  final Query$getDeliveryCompanies _instance;

  final TRes Function(Query$getDeliveryCompanies) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_company = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getDeliveryCompanies(
        delivery_company:
            delivery_company == _undefined || delivery_company == null
                ? _instance.delivery_company
                : (delivery_company
                    as List<Query$getDeliveryCompanies$delivery_company>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes delivery_company(
          Iterable<Query$getDeliveryCompanies$delivery_company> Function(
                  Iterable<
                      CopyWith$Query$getDeliveryCompanies$delivery_company<
                          Query$getDeliveryCompanies$delivery_company>>)
              _fn) =>
      call(
          delivery_company: _fn(_instance.delivery_company
              .map((e) => CopyWith$Query$getDeliveryCompanies$delivery_company(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getDeliveryCompanies<TRes>
    implements CopyWith$Query$getDeliveryCompanies<TRes> {
  _CopyWithStubImpl$Query$getDeliveryCompanies(this._res);

  TRes _res;

  call({
    List<Query$getDeliveryCompanies$delivery_company>? delivery_company,
    String? $__typename,
  }) =>
      _res;
  delivery_company(_fn) => _res;
}

const documentNodeQuerygetDeliveryCompanies = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getDeliveryCompanies'),
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
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
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
            name: NameNode(value: 'delivery_details'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'cost_per_km'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'customer_pickup'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'delivery_available'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'free_delivery_km_range'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'free_delivery_minimum_cost'),
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
                name: NameNode(value: 'radius'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'minimum_cost'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'self_delivery'),
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
                name: NameNode(value: 'schedule'),
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
                name: NameNode(value: 'description_id'),
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
                name: NameNode(value: 'location_id'),
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
                name: NameNode(value: 'language'),
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
                name: NameNode(value: 'creation_time'),
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
                name: NameNode(value: 'description'),
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
      
    ]),
  ),
]);
Query$getDeliveryCompanies _parserFn$Query$getDeliveryCompanies(
        Map<String, dynamic> data) =>
    Query$getDeliveryCompanies.fromJson(data);

class Options$Query$getDeliveryCompanies
    extends graphql.QueryOptions<Query$getDeliveryCompanies> {
  Options$Query$getDeliveryCompanies({
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
          document: documentNodeQuerygetDeliveryCompanies,
          parserFn: _parserFn$Query$getDeliveryCompanies,
        );
}

class WatchOptions$Query$getDeliveryCompanies
    extends graphql.WatchQueryOptions<Query$getDeliveryCompanies> {
  WatchOptions$Query$getDeliveryCompanies({
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
          document: documentNodeQuerygetDeliveryCompanies,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getDeliveryCompanies,
        );
}

class FetchMoreOptions$Query$getDeliveryCompanies
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getDeliveryCompanies(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQuerygetDeliveryCompanies,
        );
}

extension ClientExtension$Query$getDeliveryCompanies on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getDeliveryCompanies>>
      query$getDeliveryCompanies(
              [Options$Query$getDeliveryCompanies? options]) async =>
          await this.query(options ?? Options$Query$getDeliveryCompanies());
  graphql.ObservableQuery<Query$getDeliveryCompanies>
      watchQuery$getDeliveryCompanies(
              [WatchOptions$Query$getDeliveryCompanies? options]) =>
          this.watchQuery(options ?? WatchOptions$Query$getDeliveryCompanies());
  void writeQuery$getDeliveryCompanies({
    required Query$getDeliveryCompanies data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(
                document: documentNodeQuerygetDeliveryCompanies)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getDeliveryCompanies? readQuery$getDeliveryCompanies(
      {bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetDeliveryCompanies)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getDeliveryCompanies.fromJson(result);
  }
}

class Query$getDeliveryCompanies$delivery_company {
  Query$getDeliveryCompanies$delivery_company({
    required this.id,
    required this.reviews_aggregate,
    required this.delivery_details,
    this.details,
    required this.$__typename,
  });

  factory Query$getDeliveryCompanies$delivery_company.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$reviews_aggregate = json['reviews_aggregate'];
    final l$delivery_details = json['delivery_details'];
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$getDeliveryCompanies$delivery_company(
      id: (l$id as int),
      reviews_aggregate:
          Query$getDeliveryCompanies$delivery_company$reviews_aggregate
              .fromJson((l$reviews_aggregate as Map<String, dynamic>)),
      delivery_details:
          Query$getDeliveryCompanies$delivery_company$delivery_details.fromJson(
              (l$delivery_details as Map<String, dynamic>)),
      details: l$details == null
          ? null
          : Query$getDeliveryCompanies$delivery_company$details.fromJson(
              (l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$getDeliveryCompanies$delivery_company$reviews_aggregate
      reviews_aggregate;

  final Query$getDeliveryCompanies$delivery_company$delivery_details
      delivery_details;

  final Query$getDeliveryCompanies$delivery_company$details? details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$reviews_aggregate = reviews_aggregate;
    _resultData['reviews_aggregate'] = l$reviews_aggregate.toJson();
    final l$delivery_details = delivery_details;
    _resultData['delivery_details'] = l$delivery_details.toJson();
    final l$details = details;
    _resultData['details'] = l$details?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$reviews_aggregate = reviews_aggregate;
    final l$delivery_details = delivery_details;
    final l$details = details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$reviews_aggregate,
      l$delivery_details,
      l$details,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getDeliveryCompanies$delivery_company) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$reviews_aggregate = reviews_aggregate;
    final lOther$reviews_aggregate = other.reviews_aggregate;
    if (l$reviews_aggregate != lOther$reviews_aggregate) {
      return false;
    }
    final l$delivery_details = delivery_details;
    final lOther$delivery_details = other.delivery_details;
    if (l$delivery_details != lOther$delivery_details) {
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

extension UtilityExtension$Query$getDeliveryCompanies$delivery_company
    on Query$getDeliveryCompanies$delivery_company {
  CopyWith$Query$getDeliveryCompanies$delivery_company<
          Query$getDeliveryCompanies$delivery_company>
      get copyWith => CopyWith$Query$getDeliveryCompanies$delivery_company(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getDeliveryCompanies$delivery_company<TRes> {
  factory CopyWith$Query$getDeliveryCompanies$delivery_company(
    Query$getDeliveryCompanies$delivery_company instance,
    TRes Function(Query$getDeliveryCompanies$delivery_company) then,
  ) = _CopyWithImpl$Query$getDeliveryCompanies$delivery_company;

  factory CopyWith$Query$getDeliveryCompanies$delivery_company.stub(TRes res) =
      _CopyWithStubImpl$Query$getDeliveryCompanies$delivery_company;

  TRes call({
    int? id,
    Query$getDeliveryCompanies$delivery_company$reviews_aggregate?
        reviews_aggregate,
    Query$getDeliveryCompanies$delivery_company$delivery_details?
        delivery_details,
    Query$getDeliveryCompanies$delivery_company$details? details,
    String? $__typename,
  });
  CopyWith$Query$getDeliveryCompanies$delivery_company$reviews_aggregate<TRes>
      get reviews_aggregate;
  CopyWith$Query$getDeliveryCompanies$delivery_company$delivery_details<TRes>
      get delivery_details;
  CopyWith$Query$getDeliveryCompanies$delivery_company$details<TRes>
      get details;
}

class _CopyWithImpl$Query$getDeliveryCompanies$delivery_company<TRes>
    implements CopyWith$Query$getDeliveryCompanies$delivery_company<TRes> {
  _CopyWithImpl$Query$getDeliveryCompanies$delivery_company(
    this._instance,
    this._then,
  );

  final Query$getDeliveryCompanies$delivery_company _instance;

  final TRes Function(Query$getDeliveryCompanies$delivery_company) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? reviews_aggregate = _undefined,
    Object? delivery_details = _undefined,
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getDeliveryCompanies$delivery_company(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        reviews_aggregate: reviews_aggregate == _undefined ||
                reviews_aggregate == null
            ? _instance.reviews_aggregate
            : (reviews_aggregate
                as Query$getDeliveryCompanies$delivery_company$reviews_aggregate),
        delivery_details: delivery_details == _undefined ||
                delivery_details == null
            ? _instance.delivery_details
            : (delivery_details
                as Query$getDeliveryCompanies$delivery_company$delivery_details),
        details: details == _undefined
            ? _instance.details
            : (details as Query$getDeliveryCompanies$delivery_company$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getDeliveryCompanies$delivery_company$reviews_aggregate<TRes>
      get reviews_aggregate {
    final local$reviews_aggregate = _instance.reviews_aggregate;
    return CopyWith$Query$getDeliveryCompanies$delivery_company$reviews_aggregate(
        local$reviews_aggregate, (e) => call(reviews_aggregate: e));
  }

  CopyWith$Query$getDeliveryCompanies$delivery_company$delivery_details<TRes>
      get delivery_details {
    final local$delivery_details = _instance.delivery_details;
    return CopyWith$Query$getDeliveryCompanies$delivery_company$delivery_details(
        local$delivery_details, (e) => call(delivery_details: e));
  }

  CopyWith$Query$getDeliveryCompanies$delivery_company$details<TRes>
      get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$getDeliveryCompanies$delivery_company$details.stub(
            _then(_instance))
        : CopyWith$Query$getDeliveryCompanies$delivery_company$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$getDeliveryCompanies$delivery_company<TRes>
    implements CopyWith$Query$getDeliveryCompanies$delivery_company<TRes> {
  _CopyWithStubImpl$Query$getDeliveryCompanies$delivery_company(this._res);

  TRes _res;

  call({
    int? id,
    Query$getDeliveryCompanies$delivery_company$reviews_aggregate?
        reviews_aggregate,
    Query$getDeliveryCompanies$delivery_company$delivery_details?
        delivery_details,
    Query$getDeliveryCompanies$delivery_company$details? details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getDeliveryCompanies$delivery_company$reviews_aggregate<TRes>
      get reviews_aggregate =>
          CopyWith$Query$getDeliveryCompanies$delivery_company$reviews_aggregate
              .stub(_res);
  CopyWith$Query$getDeliveryCompanies$delivery_company$delivery_details<TRes>
      get delivery_details =>
          CopyWith$Query$getDeliveryCompanies$delivery_company$delivery_details
              .stub(_res);
  CopyWith$Query$getDeliveryCompanies$delivery_company$details<TRes>
      get details =>
          CopyWith$Query$getDeliveryCompanies$delivery_company$details.stub(
              _res);
}

class Query$getDeliveryCompanies$delivery_company$reviews_aggregate {
  Query$getDeliveryCompanies$delivery_company$reviews_aggregate({
    this.aggregate,
    required this.$__typename,
  });

  factory Query$getDeliveryCompanies$delivery_company$reviews_aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$aggregate = json['aggregate'];
    final l$$__typename = json['__typename'];
    return Query$getDeliveryCompanies$delivery_company$reviews_aggregate(
      aggregate: l$aggregate == null
          ? null
          : Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate
              .fromJson((l$aggregate as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate?
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
            is Query$getDeliveryCompanies$delivery_company$reviews_aggregate) ||
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

extension UtilityExtension$Query$getDeliveryCompanies$delivery_company$reviews_aggregate
    on Query$getDeliveryCompanies$delivery_company$reviews_aggregate {
  CopyWith$Query$getDeliveryCompanies$delivery_company$reviews_aggregate<
          Query$getDeliveryCompanies$delivery_company$reviews_aggregate>
      get copyWith =>
          CopyWith$Query$getDeliveryCompanies$delivery_company$reviews_aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getDeliveryCompanies$delivery_company$reviews_aggregate<
    TRes> {
  factory CopyWith$Query$getDeliveryCompanies$delivery_company$reviews_aggregate(
    Query$getDeliveryCompanies$delivery_company$reviews_aggregate instance,
    TRes Function(Query$getDeliveryCompanies$delivery_company$reviews_aggregate)
        then,
  ) = _CopyWithImpl$Query$getDeliveryCompanies$delivery_company$reviews_aggregate;

  factory CopyWith$Query$getDeliveryCompanies$delivery_company$reviews_aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getDeliveryCompanies$delivery_company$reviews_aggregate;

  TRes call({
    Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate?
        aggregate,
    String? $__typename,
  });
  CopyWith$Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate<
      TRes> get aggregate;
}

class _CopyWithImpl$Query$getDeliveryCompanies$delivery_company$reviews_aggregate<
        TRes>
    implements
        CopyWith$Query$getDeliveryCompanies$delivery_company$reviews_aggregate<
            TRes> {
  _CopyWithImpl$Query$getDeliveryCompanies$delivery_company$reviews_aggregate(
    this._instance,
    this._then,
  );

  final Query$getDeliveryCompanies$delivery_company$reviews_aggregate _instance;

  final TRes Function(
      Query$getDeliveryCompanies$delivery_company$reviews_aggregate) _then;

  static const _undefined = {};

  TRes call({
    Object? aggregate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getDeliveryCompanies$delivery_company$reviews_aggregate(
        aggregate: aggregate == _undefined
            ? _instance.aggregate
            : (aggregate
                as Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate<
      TRes> get aggregate {
    final local$aggregate = _instance.aggregate;
    return local$aggregate == null
        ? CopyWith$Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate
            .stub(_then(_instance))
        : CopyWith$Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate(
            local$aggregate, (e) => call(aggregate: e));
  }
}

class _CopyWithStubImpl$Query$getDeliveryCompanies$delivery_company$reviews_aggregate<
        TRes>
    implements
        CopyWith$Query$getDeliveryCompanies$delivery_company$reviews_aggregate<
            TRes> {
  _CopyWithStubImpl$Query$getDeliveryCompanies$delivery_company$reviews_aggregate(
      this._res);

  TRes _res;

  call({
    Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate?
        aggregate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate<
          TRes>
      get aggregate =>
          CopyWith$Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate
              .stub(_res);
}

class Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate {
  Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate({
    this.avg,
    required this.$__typename,
  });

  factory Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$avg = json['avg'];
    final l$$__typename = json['__typename'];
    return Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate(
      avg: l$avg == null
          ? null
          : Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate$avg
              .fromJson((l$avg as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate$avg?
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
            is Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate) ||
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

extension UtilityExtension$Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate
    on Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate {
  CopyWith$Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate<
          Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate>
      get copyWith =>
          CopyWith$Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate<
    TRes> {
  factory CopyWith$Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate(
    Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate
        instance,
    TRes Function(
            Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate)
        then,
  ) = _CopyWithImpl$Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate;

  factory CopyWith$Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate;

  TRes call({
    Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate$avg?
        avg,
    String? $__typename,
  });
  CopyWith$Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate$avg<
      TRes> get avg;
}

class _CopyWithImpl$Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate<
            TRes> {
  _CopyWithImpl$Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate(
    this._instance,
    this._then,
  );

  final Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate
      _instance;

  final TRes Function(
          Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate)
      _then;

  static const _undefined = {};

  TRes call({
    Object? avg = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate(
        avg: avg == _undefined
            ? _instance.avg
            : (avg
                as Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate$avg?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate$avg<
      TRes> get avg {
    final local$avg = _instance.avg;
    return local$avg == null
        ? CopyWith$Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate$avg
            .stub(_then(_instance))
        : CopyWith$Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate$avg(
            local$avg, (e) => call(avg: e));
  }
}

class _CopyWithStubImpl$Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate<
            TRes> {
  _CopyWithStubImpl$Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate(
      this._res);

  TRes _res;

  call({
    Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate$avg?
        avg,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate$avg<
          TRes>
      get avg =>
          CopyWith$Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate$avg
              .stub(_res);
}

class Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate$avg {
  Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate$avg({
    this.rating,
    required this.$__typename,
  });

  factory Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate$avg.fromJson(
      Map<String, dynamic> json) {
    final l$rating = json['rating'];
    final l$$__typename = json['__typename'];
    return Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate$avg(
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
            is Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate$avg) ||
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

extension UtilityExtension$Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate$avg
    on Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate$avg {
  CopyWith$Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate$avg<
          Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate$avg>
      get copyWith =>
          CopyWith$Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate$avg(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate$avg<
    TRes> {
  factory CopyWith$Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate$avg(
    Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate$avg
        instance,
    TRes Function(
            Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate$avg)
        then,
  ) = _CopyWithImpl$Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate$avg;

  factory CopyWith$Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate$avg.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate$avg;

  TRes call({
    double? rating,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate$avg<
        TRes>
    implements
        CopyWith$Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate$avg<
            TRes> {
  _CopyWithImpl$Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate$avg(
    this._instance,
    this._then,
  );

  final Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate$avg
      _instance;

  final TRes Function(
          Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate$avg)
      _then;

  static const _undefined = {};

  TRes call({
    Object? rating = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate$avg(
        rating: rating == _undefined ? _instance.rating : (rating as double?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate$avg<
        TRes>
    implements
        CopyWith$Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate$avg<
            TRes> {
  _CopyWithStubImpl$Query$getDeliveryCompanies$delivery_company$reviews_aggregate$aggregate$avg(
      this._res);

  TRes _res;

  call({
    double? rating,
    String? $__typename,
  }) =>
      _res;
}

class Query$getDeliveryCompanies$delivery_company$delivery_details {
  Query$getDeliveryCompanies$delivery_company$delivery_details({
    required this.cost_per_km,
    required this.customer_pickup,
    required this.delivery_available,
    this.free_delivery_km_range,
    this.free_delivery_minimum_cost,
    required this.id,
    required this.radius,
    required this.minimum_cost,
    required this.self_delivery,
    required this.$__typename,
  });

  factory Query$getDeliveryCompanies$delivery_company$delivery_details.fromJson(
      Map<String, dynamic> json) {
    final l$cost_per_km = json['cost_per_km'];
    final l$customer_pickup = json['customer_pickup'];
    final l$delivery_available = json['delivery_available'];
    final l$free_delivery_km_range = json['free_delivery_km_range'];
    final l$free_delivery_minimum_cost = json['free_delivery_minimum_cost'];
    final l$id = json['id'];
    final l$radius = json['radius'];
    final l$minimum_cost = json['minimum_cost'];
    final l$self_delivery = json['self_delivery'];
    final l$$__typename = json['__typename'];
    return Query$getDeliveryCompanies$delivery_company$delivery_details(
      cost_per_km: moneyFromJson(l$cost_per_km),
      customer_pickup: (l$customer_pickup as bool),
      delivery_available: (l$delivery_available as bool),
      free_delivery_km_range: (l$free_delivery_km_range as num?)?.toDouble(),
      free_delivery_minimum_cost: l$free_delivery_minimum_cost == null
          ? null
          : moneyFromJson(l$free_delivery_minimum_cost),
      id: (l$id as int),
      radius: (l$radius as int),
      minimum_cost: moneyFromJson(l$minimum_cost),
      self_delivery: (l$self_delivery as bool),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final double cost_per_km;

  final bool customer_pickup;

  final bool delivery_available;

  final double? free_delivery_km_range;

  final double? free_delivery_minimum_cost;

  final int id;

  final int radius;

  final double minimum_cost;

  final bool self_delivery;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$cost_per_km = cost_per_km;
    _resultData['cost_per_km'] = moneyToJson(l$cost_per_km);
    final l$customer_pickup = customer_pickup;
    _resultData['customer_pickup'] = l$customer_pickup;
    final l$delivery_available = delivery_available;
    _resultData['delivery_available'] = l$delivery_available;
    final l$free_delivery_km_range = free_delivery_km_range;
    _resultData['free_delivery_km_range'] = l$free_delivery_km_range;
    final l$free_delivery_minimum_cost = free_delivery_minimum_cost;
    _resultData['free_delivery_minimum_cost'] =
        l$free_delivery_minimum_cost == null
            ? null
            : moneyToJson(l$free_delivery_minimum_cost);
    final l$id = id;
    _resultData['id'] = l$id;
    final l$radius = radius;
    _resultData['radius'] = l$radius;
    final l$minimum_cost = minimum_cost;
    _resultData['minimum_cost'] = moneyToJson(l$minimum_cost);
    final l$self_delivery = self_delivery;
    _resultData['self_delivery'] = l$self_delivery;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$cost_per_km = cost_per_km;
    final l$customer_pickup = customer_pickup;
    final l$delivery_available = delivery_available;
    final l$free_delivery_km_range = free_delivery_km_range;
    final l$free_delivery_minimum_cost = free_delivery_minimum_cost;
    final l$id = id;
    final l$radius = radius;
    final l$minimum_cost = minimum_cost;
    final l$self_delivery = self_delivery;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$cost_per_km,
      l$customer_pickup,
      l$delivery_available,
      l$free_delivery_km_range,
      l$free_delivery_minimum_cost,
      l$id,
      l$radius,
      l$minimum_cost,
      l$self_delivery,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getDeliveryCompanies$delivery_company$delivery_details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$cost_per_km = cost_per_km;
    final lOther$cost_per_km = other.cost_per_km;
    if (l$cost_per_km != lOther$cost_per_km) {
      return false;
    }
    final l$customer_pickup = customer_pickup;
    final lOther$customer_pickup = other.customer_pickup;
    if (l$customer_pickup != lOther$customer_pickup) {
      return false;
    }
    final l$delivery_available = delivery_available;
    final lOther$delivery_available = other.delivery_available;
    if (l$delivery_available != lOther$delivery_available) {
      return false;
    }
    final l$free_delivery_km_range = free_delivery_km_range;
    final lOther$free_delivery_km_range = other.free_delivery_km_range;
    if (l$free_delivery_km_range != lOther$free_delivery_km_range) {
      return false;
    }
    final l$free_delivery_minimum_cost = free_delivery_minimum_cost;
    final lOther$free_delivery_minimum_cost = other.free_delivery_minimum_cost;
    if (l$free_delivery_minimum_cost != lOther$free_delivery_minimum_cost) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$radius = radius;
    final lOther$radius = other.radius;
    if (l$radius != lOther$radius) {
      return false;
    }
    final l$minimum_cost = minimum_cost;
    final lOther$minimum_cost = other.minimum_cost;
    if (l$minimum_cost != lOther$minimum_cost) {
      return false;
    }
    final l$self_delivery = self_delivery;
    final lOther$self_delivery = other.self_delivery;
    if (l$self_delivery != lOther$self_delivery) {
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

extension UtilityExtension$Query$getDeliveryCompanies$delivery_company$delivery_details
    on Query$getDeliveryCompanies$delivery_company$delivery_details {
  CopyWith$Query$getDeliveryCompanies$delivery_company$delivery_details<
          Query$getDeliveryCompanies$delivery_company$delivery_details>
      get copyWith =>
          CopyWith$Query$getDeliveryCompanies$delivery_company$delivery_details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getDeliveryCompanies$delivery_company$delivery_details<
    TRes> {
  factory CopyWith$Query$getDeliveryCompanies$delivery_company$delivery_details(
    Query$getDeliveryCompanies$delivery_company$delivery_details instance,
    TRes Function(Query$getDeliveryCompanies$delivery_company$delivery_details)
        then,
  ) = _CopyWithImpl$Query$getDeliveryCompanies$delivery_company$delivery_details;

  factory CopyWith$Query$getDeliveryCompanies$delivery_company$delivery_details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getDeliveryCompanies$delivery_company$delivery_details;

  TRes call({
    double? cost_per_km,
    bool? customer_pickup,
    bool? delivery_available,
    double? free_delivery_km_range,
    double? free_delivery_minimum_cost,
    int? id,
    int? radius,
    double? minimum_cost,
    bool? self_delivery,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getDeliveryCompanies$delivery_company$delivery_details<
        TRes>
    implements
        CopyWith$Query$getDeliveryCompanies$delivery_company$delivery_details<
            TRes> {
  _CopyWithImpl$Query$getDeliveryCompanies$delivery_company$delivery_details(
    this._instance,
    this._then,
  );

  final Query$getDeliveryCompanies$delivery_company$delivery_details _instance;

  final TRes Function(
      Query$getDeliveryCompanies$delivery_company$delivery_details) _then;

  static const _undefined = {};

  TRes call({
    Object? cost_per_km = _undefined,
    Object? customer_pickup = _undefined,
    Object? delivery_available = _undefined,
    Object? free_delivery_km_range = _undefined,
    Object? free_delivery_minimum_cost = _undefined,
    Object? id = _undefined,
    Object? radius = _undefined,
    Object? minimum_cost = _undefined,
    Object? self_delivery = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getDeliveryCompanies$delivery_company$delivery_details(
        cost_per_km: cost_per_km == _undefined || cost_per_km == null
            ? _instance.cost_per_km
            : (cost_per_km as double),
        customer_pickup:
            customer_pickup == _undefined || customer_pickup == null
                ? _instance.customer_pickup
                : (customer_pickup as bool),
        delivery_available:
            delivery_available == _undefined || delivery_available == null
                ? _instance.delivery_available
                : (delivery_available as bool),
        free_delivery_km_range: free_delivery_km_range == _undefined
            ? _instance.free_delivery_km_range
            : (free_delivery_km_range as double?),
        free_delivery_minimum_cost: free_delivery_minimum_cost == _undefined
            ? _instance.free_delivery_minimum_cost
            : (free_delivery_minimum_cost as double?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        radius: radius == _undefined || radius == null
            ? _instance.radius
            : (radius as int),
        minimum_cost: minimum_cost == _undefined || minimum_cost == null
            ? _instance.minimum_cost
            : (minimum_cost as double),
        self_delivery: self_delivery == _undefined || self_delivery == null
            ? _instance.self_delivery
            : (self_delivery as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getDeliveryCompanies$delivery_company$delivery_details<
        TRes>
    implements
        CopyWith$Query$getDeliveryCompanies$delivery_company$delivery_details<
            TRes> {
  _CopyWithStubImpl$Query$getDeliveryCompanies$delivery_company$delivery_details(
      this._res);

  TRes _res;

  call({
    double? cost_per_km,
    bool? customer_pickup,
    bool? delivery_available,
    double? free_delivery_km_range,
    double? free_delivery_minimum_cost,
    int? id,
    int? radius,
    double? minimum_cost,
    bool? self_delivery,
    String? $__typename,
  }) =>
      _res;
}

class Query$getDeliveryCompanies$delivery_company$details {
  Query$getDeliveryCompanies$delivery_company$details({
    required this.id,
    this.schedule,
    required this.approved,
    this.description_id,
    required this.image,
    required this.location_id,
    required this.name,
    required this.language,
    required this.open_status,
    required this.creation_time,
    required this.service_provider_type,
    this.description,
    required this.location,
    required this.$__typename,
  });

  factory Query$getDeliveryCompanies$delivery_company$details.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$schedule = json['schedule'];
    final l$approved = json['approved'];
    final l$description_id = json['description_id'];
    final l$image = json['image'];
    final l$location_id = json['location_id'];
    final l$name = json['name'];
    final l$language = json['language'];
    final l$open_status = json['open_status'];
    final l$creation_time = json['creation_time'];
    final l$service_provider_type = json['service_provider_type'];
    final l$description = json['description'];
    final l$location = json['location'];
    final l$$__typename = json['__typename'];
    return Query$getDeliveryCompanies$delivery_company$details(
      id: (l$id as int),
      schedule: l$schedule == null ? null : mapFromJson(l$schedule),
      approved: (l$approved as bool),
      description_id: (l$description_id as int?),
      image: (l$image as String),
      location_id: (l$location_id as int),
      name: (l$name as String),
      language: mapFromJson(l$language),
      open_status: (l$open_status as String),
      creation_time: (l$creation_time as String),
      service_provider_type: (l$service_provider_type as String),
      description: l$description == null
          ? null
          : Query$getDeliveryCompanies$delivery_company$details$description
              .fromJson((l$description as Map<String, dynamic>)),
      location:
          Query$getDeliveryCompanies$delivery_company$details$location.fromJson(
              (l$location as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final dynamic? schedule;

  final bool approved;

  final int? description_id;

  final String image;

  final int location_id;

  final String name;

  final dynamic language;

  final String open_status;

  final String creation_time;

  final String service_provider_type;

  final Query$getDeliveryCompanies$delivery_company$details$description?
      description;

  final Query$getDeliveryCompanies$delivery_company$details$location location;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$schedule = schedule;
    _resultData['schedule'] = l$schedule == null ? null : mapToJson(l$schedule);
    final l$approved = approved;
    _resultData['approved'] = l$approved;
    final l$description_id = description_id;
    _resultData['description_id'] = l$description_id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$location_id = location_id;
    _resultData['location_id'] = l$location_id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$language = language;
    _resultData['language'] = mapToJson(l$language);
    final l$open_status = open_status;
    _resultData['open_status'] = l$open_status;
    final l$creation_time = creation_time;
    _resultData['creation_time'] = l$creation_time;
    final l$service_provider_type = service_provider_type;
    _resultData['service_provider_type'] = l$service_provider_type;
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
    final l$location = location;
    _resultData['location'] = l$location.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$schedule = schedule;
    final l$approved = approved;
    final l$description_id = description_id;
    final l$image = image;
    final l$location_id = location_id;
    final l$name = name;
    final l$language = language;
    final l$open_status = open_status;
    final l$creation_time = creation_time;
    final l$service_provider_type = service_provider_type;
    final l$description = description;
    final l$location = location;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$schedule,
      l$approved,
      l$description_id,
      l$image,
      l$location_id,
      l$name,
      l$language,
      l$open_status,
      l$creation_time,
      l$service_provider_type,
      l$description,
      l$location,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getDeliveryCompanies$delivery_company$details) ||
        runtimeType != other.runtimeType) {
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
    final l$approved = approved;
    final lOther$approved = other.approved;
    if (l$approved != lOther$approved) {
      return false;
    }
    final l$description_id = description_id;
    final lOther$description_id = other.description_id;
    if (l$description_id != lOther$description_id) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$location_id = location_id;
    final lOther$location_id = other.location_id;
    if (l$location_id != lOther$location_id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$language = language;
    final lOther$language = other.language;
    if (l$language != lOther$language) {
      return false;
    }
    final l$open_status = open_status;
    final lOther$open_status = other.open_status;
    if (l$open_status != lOther$open_status) {
      return false;
    }
    final l$creation_time = creation_time;
    final lOther$creation_time = other.creation_time;
    if (l$creation_time != lOther$creation_time) {
      return false;
    }
    final l$service_provider_type = service_provider_type;
    final lOther$service_provider_type = other.service_provider_type;
    if (l$service_provider_type != lOther$service_provider_type) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
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

extension UtilityExtension$Query$getDeliveryCompanies$delivery_company$details
    on Query$getDeliveryCompanies$delivery_company$details {
  CopyWith$Query$getDeliveryCompanies$delivery_company$details<
          Query$getDeliveryCompanies$delivery_company$details>
      get copyWith =>
          CopyWith$Query$getDeliveryCompanies$delivery_company$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getDeliveryCompanies$delivery_company$details<
    TRes> {
  factory CopyWith$Query$getDeliveryCompanies$delivery_company$details(
    Query$getDeliveryCompanies$delivery_company$details instance,
    TRes Function(Query$getDeliveryCompanies$delivery_company$details) then,
  ) = _CopyWithImpl$Query$getDeliveryCompanies$delivery_company$details;

  factory CopyWith$Query$getDeliveryCompanies$delivery_company$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getDeliveryCompanies$delivery_company$details;

  TRes call({
    int? id,
    dynamic? schedule,
    bool? approved,
    int? description_id,
    String? image,
    int? location_id,
    String? name,
    dynamic? language,
    String? open_status,
    String? creation_time,
    String? service_provider_type,
    Query$getDeliveryCompanies$delivery_company$details$description?
        description,
    Query$getDeliveryCompanies$delivery_company$details$location? location,
    String? $__typename,
  });
  CopyWith$Query$getDeliveryCompanies$delivery_company$details$description<TRes>
      get description;
  CopyWith$Query$getDeliveryCompanies$delivery_company$details$location<TRes>
      get location;
}

class _CopyWithImpl$Query$getDeliveryCompanies$delivery_company$details<TRes>
    implements
        CopyWith$Query$getDeliveryCompanies$delivery_company$details<TRes> {
  _CopyWithImpl$Query$getDeliveryCompanies$delivery_company$details(
    this._instance,
    this._then,
  );

  final Query$getDeliveryCompanies$delivery_company$details _instance;

  final TRes Function(Query$getDeliveryCompanies$delivery_company$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? schedule = _undefined,
    Object? approved = _undefined,
    Object? description_id = _undefined,
    Object? image = _undefined,
    Object? location_id = _undefined,
    Object? name = _undefined,
    Object? language = _undefined,
    Object? open_status = _undefined,
    Object? creation_time = _undefined,
    Object? service_provider_type = _undefined,
    Object? description = _undefined,
    Object? location = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getDeliveryCompanies$delivery_company$details(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        schedule: schedule == _undefined
            ? _instance.schedule
            : (schedule as dynamic?),
        approved: approved == _undefined || approved == null
            ? _instance.approved
            : (approved as bool),
        description_id: description_id == _undefined
            ? _instance.description_id
            : (description_id as int?),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        location_id: location_id == _undefined || location_id == null
            ? _instance.location_id
            : (location_id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        language: language == _undefined || language == null
            ? _instance.language
            : (language as dynamic),
        open_status: open_status == _undefined || open_status == null
            ? _instance.open_status
            : (open_status as String),
        creation_time: creation_time == _undefined || creation_time == null
            ? _instance.creation_time
            : (creation_time as String),
        service_provider_type:
            service_provider_type == _undefined || service_provider_type == null
                ? _instance.service_provider_type
                : (service_provider_type as String),
        description: description == _undefined
            ? _instance.description
            : (description
                as Query$getDeliveryCompanies$delivery_company$details$description?),
        location: location == _undefined || location == null
            ? _instance.location
            : (location
                as Query$getDeliveryCompanies$delivery_company$details$location),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getDeliveryCompanies$delivery_company$details$description<TRes>
      get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Query$getDeliveryCompanies$delivery_company$details$description
            .stub(_then(_instance))
        : CopyWith$Query$getDeliveryCompanies$delivery_company$details$description(
            local$description, (e) => call(description: e));
  }

  CopyWith$Query$getDeliveryCompanies$delivery_company$details$location<TRes>
      get location {
    final local$location = _instance.location;
    return CopyWith$Query$getDeliveryCompanies$delivery_company$details$location(
        local$location, (e) => call(location: e));
  }
}

class _CopyWithStubImpl$Query$getDeliveryCompanies$delivery_company$details<
        TRes>
    implements
        CopyWith$Query$getDeliveryCompanies$delivery_company$details<TRes> {
  _CopyWithStubImpl$Query$getDeliveryCompanies$delivery_company$details(
      this._res);

  TRes _res;

  call({
    int? id,
    dynamic? schedule,
    bool? approved,
    int? description_id,
    String? image,
    int? location_id,
    String? name,
    dynamic? language,
    String? open_status,
    String? creation_time,
    String? service_provider_type,
    Query$getDeliveryCompanies$delivery_company$details$description?
        description,
    Query$getDeliveryCompanies$delivery_company$details$location? location,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getDeliveryCompanies$delivery_company$details$description<TRes>
      get description =>
          CopyWith$Query$getDeliveryCompanies$delivery_company$details$description
              .stub(_res);
  CopyWith$Query$getDeliveryCompanies$delivery_company$details$location<TRes>
      get location =>
          CopyWith$Query$getDeliveryCompanies$delivery_company$details$location
              .stub(_res);
}

class Query$getDeliveryCompanies$delivery_company$details$description {
  Query$getDeliveryCompanies$delivery_company$details$description({
    required this.id,
    required this.translations,
    required this.$__typename,
  });

  factory Query$getDeliveryCompanies$delivery_company$details$description.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getDeliveryCompanies$delivery_company$details$description(
      id: (l$id as int),
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getDeliveryCompanies$delivery_company$details$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final List<
          Query$getDeliveryCompanies$delivery_company$details$description$translations>
      translations;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$translations = translations;
    _resultData['translations'] =
        l$translations.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$translations = translations;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
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
            is Query$getDeliveryCompanies$delivery_company$details$description) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Query$getDeliveryCompanies$delivery_company$details$description
    on Query$getDeliveryCompanies$delivery_company$details$description {
  CopyWith$Query$getDeliveryCompanies$delivery_company$details$description<
          Query$getDeliveryCompanies$delivery_company$details$description>
      get copyWith =>
          CopyWith$Query$getDeliveryCompanies$delivery_company$details$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getDeliveryCompanies$delivery_company$details$description<
    TRes> {
  factory CopyWith$Query$getDeliveryCompanies$delivery_company$details$description(
    Query$getDeliveryCompanies$delivery_company$details$description instance,
    TRes Function(
            Query$getDeliveryCompanies$delivery_company$details$description)
        then,
  ) = _CopyWithImpl$Query$getDeliveryCompanies$delivery_company$details$description;

  factory CopyWith$Query$getDeliveryCompanies$delivery_company$details$description.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getDeliveryCompanies$delivery_company$details$description;

  TRes call({
    int? id,
    List<Query$getDeliveryCompanies$delivery_company$details$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getDeliveryCompanies$delivery_company$details$description$translations> Function(
              Iterable<
                  CopyWith$Query$getDeliveryCompanies$delivery_company$details$description$translations<
                      Query$getDeliveryCompanies$delivery_company$details$description$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getDeliveryCompanies$delivery_company$details$description<
        TRes>
    implements
        CopyWith$Query$getDeliveryCompanies$delivery_company$details$description<
            TRes> {
  _CopyWithImpl$Query$getDeliveryCompanies$delivery_company$details$description(
    this._instance,
    this._then,
  );

  final Query$getDeliveryCompanies$delivery_company$details$description
      _instance;

  final TRes Function(
      Query$getDeliveryCompanies$delivery_company$details$description) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getDeliveryCompanies$delivery_company$details$description(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getDeliveryCompanies$delivery_company$details$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getDeliveryCompanies$delivery_company$details$description$translations> Function(
                  Iterable<
                      CopyWith$Query$getDeliveryCompanies$delivery_company$details$description$translations<
                          Query$getDeliveryCompanies$delivery_company$details$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getDeliveryCompanies$delivery_company$details$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getDeliveryCompanies$delivery_company$details$description<
        TRes>
    implements
        CopyWith$Query$getDeliveryCompanies$delivery_company$details$description<
            TRes> {
  _CopyWithStubImpl$Query$getDeliveryCompanies$delivery_company$details$description(
      this._res);

  TRes _res;

  call({
    int? id,
    List<Query$getDeliveryCompanies$delivery_company$details$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getDeliveryCompanies$delivery_company$details$description$translations {
  Query$getDeliveryCompanies$delivery_company$details$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getDeliveryCompanies$delivery_company$details$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getDeliveryCompanies$delivery_company$details$description$translations(
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
            is Query$getDeliveryCompanies$delivery_company$details$description$translations) ||
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

extension UtilityExtension$Query$getDeliveryCompanies$delivery_company$details$description$translations
    on Query$getDeliveryCompanies$delivery_company$details$description$translations {
  CopyWith$Query$getDeliveryCompanies$delivery_company$details$description$translations<
          Query$getDeliveryCompanies$delivery_company$details$description$translations>
      get copyWith =>
          CopyWith$Query$getDeliveryCompanies$delivery_company$details$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getDeliveryCompanies$delivery_company$details$description$translations<
    TRes> {
  factory CopyWith$Query$getDeliveryCompanies$delivery_company$details$description$translations(
    Query$getDeliveryCompanies$delivery_company$details$description$translations
        instance,
    TRes Function(
            Query$getDeliveryCompanies$delivery_company$details$description$translations)
        then,
  ) = _CopyWithImpl$Query$getDeliveryCompanies$delivery_company$details$description$translations;

  factory CopyWith$Query$getDeliveryCompanies$delivery_company$details$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getDeliveryCompanies$delivery_company$details$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getDeliveryCompanies$delivery_company$details$description$translations<
        TRes>
    implements
        CopyWith$Query$getDeliveryCompanies$delivery_company$details$description$translations<
            TRes> {
  _CopyWithImpl$Query$getDeliveryCompanies$delivery_company$details$description$translations(
    this._instance,
    this._then,
  );

  final Query$getDeliveryCompanies$delivery_company$details$description$translations
      _instance;

  final TRes Function(
          Query$getDeliveryCompanies$delivery_company$details$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getDeliveryCompanies$delivery_company$details$description$translations(
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

class _CopyWithStubImpl$Query$getDeliveryCompanies$delivery_company$details$description$translations<
        TRes>
    implements
        CopyWith$Query$getDeliveryCompanies$delivery_company$details$description$translations<
            TRes> {
  _CopyWithStubImpl$Query$getDeliveryCompanies$delivery_company$details$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$getDeliveryCompanies$delivery_company$details$location {
  Query$getDeliveryCompanies$delivery_company$details$location({
    required this.gps,
    required this.address,
    required this.$__typename,
  });

  factory Query$getDeliveryCompanies$delivery_company$details$location.fromJson(
      Map<String, dynamic> json) {
    final l$gps = json['gps'];
    final l$address = json['address'];
    final l$$__typename = json['__typename'];
    return Query$getDeliveryCompanies$delivery_company$details$location(
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
            is Query$getDeliveryCompanies$delivery_company$details$location) ||
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

extension UtilityExtension$Query$getDeliveryCompanies$delivery_company$details$location
    on Query$getDeliveryCompanies$delivery_company$details$location {
  CopyWith$Query$getDeliveryCompanies$delivery_company$details$location<
          Query$getDeliveryCompanies$delivery_company$details$location>
      get copyWith =>
          CopyWith$Query$getDeliveryCompanies$delivery_company$details$location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getDeliveryCompanies$delivery_company$details$location<
    TRes> {
  factory CopyWith$Query$getDeliveryCompanies$delivery_company$details$location(
    Query$getDeliveryCompanies$delivery_company$details$location instance,
    TRes Function(Query$getDeliveryCompanies$delivery_company$details$location)
        then,
  ) = _CopyWithImpl$Query$getDeliveryCompanies$delivery_company$details$location;

  factory CopyWith$Query$getDeliveryCompanies$delivery_company$details$location.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getDeliveryCompanies$delivery_company$details$location;

  TRes call({
    Geography? gps,
    String? address,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getDeliveryCompanies$delivery_company$details$location<
        TRes>
    implements
        CopyWith$Query$getDeliveryCompanies$delivery_company$details$location<
            TRes> {
  _CopyWithImpl$Query$getDeliveryCompanies$delivery_company$details$location(
    this._instance,
    this._then,
  );

  final Query$getDeliveryCompanies$delivery_company$details$location _instance;

  final TRes Function(
      Query$getDeliveryCompanies$delivery_company$details$location) _then;

  static const _undefined = {};

  TRes call({
    Object? gps = _undefined,
    Object? address = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getDeliveryCompanies$delivery_company$details$location(
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

class _CopyWithStubImpl$Query$getDeliveryCompanies$delivery_company$details$location<
        TRes>
    implements
        CopyWith$Query$getDeliveryCompanies$delivery_company$details$location<
            TRes> {
  _CopyWithStubImpl$Query$getDeliveryCompanies$delivery_company$details$location(
      this._res);

  TRes _res;

  call({
    Geography? gps,
    String? address,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getNearByCompanies {
  factory Variables$Query$getNearByCompanies(
          {required Input$delivery_get_delivery_companies_args args}) =>
      Variables$Query$getNearByCompanies._({
        r'args': args,
      });

  Variables$Query$getNearByCompanies._(this._$data);

  factory Variables$Query$getNearByCompanies.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$args = data['args'];
    result$data['args'] = Input$delivery_get_delivery_companies_args.fromJson(
        (l$args as Map<String, dynamic>));
    return Variables$Query$getNearByCompanies._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$delivery_get_delivery_companies_args get args =>
      (_$data['args'] as Input$delivery_get_delivery_companies_args);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$args = args;
    result$data['args'] = l$args.toJson();
    return result$data;
  }

  CopyWith$Variables$Query$getNearByCompanies<
          Variables$Query$getNearByCompanies>
      get copyWith => CopyWith$Variables$Query$getNearByCompanies(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getNearByCompanies) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$args = args;
    final lOther$args = other.args;
    if (l$args != lOther$args) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$args = args;
    return Object.hashAll([l$args]);
  }
}

abstract class CopyWith$Variables$Query$getNearByCompanies<TRes> {
  factory CopyWith$Variables$Query$getNearByCompanies(
    Variables$Query$getNearByCompanies instance,
    TRes Function(Variables$Query$getNearByCompanies) then,
  ) = _CopyWithImpl$Variables$Query$getNearByCompanies;

  factory CopyWith$Variables$Query$getNearByCompanies.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getNearByCompanies;

  TRes call({Input$delivery_get_delivery_companies_args? args});
}

class _CopyWithImpl$Variables$Query$getNearByCompanies<TRes>
    implements CopyWith$Variables$Query$getNearByCompanies<TRes> {
  _CopyWithImpl$Variables$Query$getNearByCompanies(
    this._instance,
    this._then,
  );

  final Variables$Query$getNearByCompanies _instance;

  final TRes Function(Variables$Query$getNearByCompanies) _then;

  static const _undefined = {};

  TRes call({Object? args = _undefined}) =>
      _then(Variables$Query$getNearByCompanies._({
        ..._instance._$data,
        if (args != _undefined && args != null)
          'args': (args as Input$delivery_get_delivery_companies_args),
      }));
}

class _CopyWithStubImpl$Variables$Query$getNearByCompanies<TRes>
    implements CopyWith$Variables$Query$getNearByCompanies<TRes> {
  _CopyWithStubImpl$Variables$Query$getNearByCompanies(this._res);

  TRes _res;

  call({Input$delivery_get_delivery_companies_args? args}) => _res;
}

class Query$getNearByCompanies {
  Query$getNearByCompanies({
    required this.delivery_get_delivery_companies,
    required this.$__typename,
  });

  factory Query$getNearByCompanies.fromJson(Map<String, dynamic> json) {
    final l$delivery_get_delivery_companies =
        json['delivery_get_delivery_companies'];
    final l$$__typename = json['__typename'];
    return Query$getNearByCompanies(
      delivery_get_delivery_companies: (l$delivery_get_delivery_companies
              as List<dynamic>)
          .map((e) =>
              Query$getNearByCompanies$delivery_get_delivery_companies.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getNearByCompanies$delivery_get_delivery_companies>
      delivery_get_delivery_companies;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delivery_get_delivery_companies = delivery_get_delivery_companies;
    _resultData['delivery_get_delivery_companies'] =
        l$delivery_get_delivery_companies.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delivery_get_delivery_companies = delivery_get_delivery_companies;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$delivery_get_delivery_companies.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getNearByCompanies) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delivery_get_delivery_companies = delivery_get_delivery_companies;
    final lOther$delivery_get_delivery_companies =
        other.delivery_get_delivery_companies;
    if (l$delivery_get_delivery_companies.length !=
        lOther$delivery_get_delivery_companies.length) {
      return false;
    }
    for (int i = 0; i < l$delivery_get_delivery_companies.length; i++) {
      final l$delivery_get_delivery_companies$entry =
          l$delivery_get_delivery_companies[i];
      final lOther$delivery_get_delivery_companies$entry =
          lOther$delivery_get_delivery_companies[i];
      if (l$delivery_get_delivery_companies$entry !=
          lOther$delivery_get_delivery_companies$entry) {
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

extension UtilityExtension$Query$getNearByCompanies
    on Query$getNearByCompanies {
  CopyWith$Query$getNearByCompanies<Query$getNearByCompanies> get copyWith =>
      CopyWith$Query$getNearByCompanies(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getNearByCompanies<TRes> {
  factory CopyWith$Query$getNearByCompanies(
    Query$getNearByCompanies instance,
    TRes Function(Query$getNearByCompanies) then,
  ) = _CopyWithImpl$Query$getNearByCompanies;

  factory CopyWith$Query$getNearByCompanies.stub(TRes res) =
      _CopyWithStubImpl$Query$getNearByCompanies;

  TRes call({
    List<Query$getNearByCompanies$delivery_get_delivery_companies>?
        delivery_get_delivery_companies,
    String? $__typename,
  });
  TRes delivery_get_delivery_companies(
      Iterable<Query$getNearByCompanies$delivery_get_delivery_companies> Function(
              Iterable<
                  CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies<
                      Query$getNearByCompanies$delivery_get_delivery_companies>>)
          _fn);
}

class _CopyWithImpl$Query$getNearByCompanies<TRes>
    implements CopyWith$Query$getNearByCompanies<TRes> {
  _CopyWithImpl$Query$getNearByCompanies(
    this._instance,
    this._then,
  );

  final Query$getNearByCompanies _instance;

  final TRes Function(Query$getNearByCompanies) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_get_delivery_companies = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getNearByCompanies(
        delivery_get_delivery_companies:
            delivery_get_delivery_companies == _undefined ||
                    delivery_get_delivery_companies == null
                ? _instance.delivery_get_delivery_companies
                : (delivery_get_delivery_companies as List<
                    Query$getNearByCompanies$delivery_get_delivery_companies>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes delivery_get_delivery_companies(
          Iterable<Query$getNearByCompanies$delivery_get_delivery_companies> Function(
                  Iterable<
                      CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies<
                          Query$getNearByCompanies$delivery_get_delivery_companies>>)
              _fn) =>
      call(
          delivery_get_delivery_companies: _fn(
              _instance.delivery_get_delivery_companies.map((e) =>
                  CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getNearByCompanies<TRes>
    implements CopyWith$Query$getNearByCompanies<TRes> {
  _CopyWithStubImpl$Query$getNearByCompanies(this._res);

  TRes _res;

  call({
    List<Query$getNearByCompanies$delivery_get_delivery_companies>?
        delivery_get_delivery_companies,
    String? $__typename,
  }) =>
      _res;
  delivery_get_delivery_companies(_fn) => _res;
}

const documentNodeQuerygetNearByCompanies = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getNearByCompanies'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'args')),
        type: NamedTypeNode(
          name: NameNode(value: 'delivery_get_delivery_companies_args'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'delivery_get_delivery_companies'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'args'),
            value: VariableNode(name: NameNode(value: 'args')),
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
            name: NameNode(value: 'delivery_details'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'cost_per_km'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'customer_pickup'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'delivery_available'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'free_delivery_km_range'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'free_delivery_minimum_cost'),
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
                name: NameNode(value: 'radius'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'minimum_cost'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'self_delivery'),
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
                name: NameNode(value: 'approved'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'description_id'),
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
                name: NameNode(value: 'location_id'),
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
                name: NameNode(value: 'language'),
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
                name: NameNode(value: 'open_status'),
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
                name: NameNode(value: 'service_provider_type'),
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
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
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
      
    ]),
  ),
]);
Query$getNearByCompanies _parserFn$Query$getNearByCompanies(
        Map<String, dynamic> data) =>
    Query$getNearByCompanies.fromJson(data);

class Options$Query$getNearByCompanies
    extends graphql.QueryOptions<Query$getNearByCompanies> {
  Options$Query$getNearByCompanies({
    String? operationName,
    required Variables$Query$getNearByCompanies variables,
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
          document: documentNodeQuerygetNearByCompanies,
          parserFn: _parserFn$Query$getNearByCompanies,
        );
}

class WatchOptions$Query$getNearByCompanies
    extends graphql.WatchQueryOptions<Query$getNearByCompanies> {
  WatchOptions$Query$getNearByCompanies({
    String? operationName,
    required Variables$Query$getNearByCompanies variables,
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
          document: documentNodeQuerygetNearByCompanies,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getNearByCompanies,
        );
}

class FetchMoreOptions$Query$getNearByCompanies
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getNearByCompanies({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getNearByCompanies variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetNearByCompanies,
        );
}

extension ClientExtension$Query$getNearByCompanies on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getNearByCompanies>>
      query$getNearByCompanies(
              Options$Query$getNearByCompanies options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getNearByCompanies>
      watchQuery$getNearByCompanies(
              WatchOptions$Query$getNearByCompanies options) =>
          this.watchQuery(options);
  void writeQuery$getNearByCompanies({
    required Query$getNearByCompanies data,
    required Variables$Query$getNearByCompanies variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerygetNearByCompanies),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getNearByCompanies? readQuery$getNearByCompanies({
    required Variables$Query$getNearByCompanies variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetNearByCompanies),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getNearByCompanies.fromJson(result);
  }
}

class Query$getNearByCompanies$delivery_get_delivery_companies {
  Query$getNearByCompanies$delivery_get_delivery_companies({
    required this.id,
    required this.delivery_details,
    this.details,
    required this.$__typename,
  });

  factory Query$getNearByCompanies$delivery_get_delivery_companies.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$delivery_details = json['delivery_details'];
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$getNearByCompanies$delivery_get_delivery_companies(
      id: (l$id as int),
      delivery_details:
          Query$getNearByCompanies$delivery_get_delivery_companies$delivery_details
              .fromJson((l$delivery_details as Map<String, dynamic>)),
      details: l$details == null
          ? null
          : Query$getNearByCompanies$delivery_get_delivery_companies$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$getNearByCompanies$delivery_get_delivery_companies$delivery_details
      delivery_details;

  final Query$getNearByCompanies$delivery_get_delivery_companies$details?
      details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$delivery_details = delivery_details;
    _resultData['delivery_details'] = l$delivery_details.toJson();
    final l$details = details;
    _resultData['details'] = l$details?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$delivery_details = delivery_details;
    final l$details = details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$delivery_details,
      l$details,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getNearByCompanies$delivery_get_delivery_companies) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$delivery_details = delivery_details;
    final lOther$delivery_details = other.delivery_details;
    if (l$delivery_details != lOther$delivery_details) {
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

extension UtilityExtension$Query$getNearByCompanies$delivery_get_delivery_companies
    on Query$getNearByCompanies$delivery_get_delivery_companies {
  CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies<
          Query$getNearByCompanies$delivery_get_delivery_companies>
      get copyWith =>
          CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies<
    TRes> {
  factory CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies(
    Query$getNearByCompanies$delivery_get_delivery_companies instance,
    TRes Function(Query$getNearByCompanies$delivery_get_delivery_companies)
        then,
  ) = _CopyWithImpl$Query$getNearByCompanies$delivery_get_delivery_companies;

  factory CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getNearByCompanies$delivery_get_delivery_companies;

  TRes call({
    int? id,
    Query$getNearByCompanies$delivery_get_delivery_companies$delivery_details?
        delivery_details,
    Query$getNearByCompanies$delivery_get_delivery_companies$details? details,
    String? $__typename,
  });
  CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$delivery_details<
      TRes> get delivery_details;
  CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details<
      TRes> get details;
}

class _CopyWithImpl$Query$getNearByCompanies$delivery_get_delivery_companies<
        TRes>
    implements
        CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies<
            TRes> {
  _CopyWithImpl$Query$getNearByCompanies$delivery_get_delivery_companies(
    this._instance,
    this._then,
  );

  final Query$getNearByCompanies$delivery_get_delivery_companies _instance;

  final TRes Function(Query$getNearByCompanies$delivery_get_delivery_companies)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? delivery_details = _undefined,
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getNearByCompanies$delivery_get_delivery_companies(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        delivery_details: delivery_details == _undefined ||
                delivery_details == null
            ? _instance.delivery_details
            : (delivery_details
                as Query$getNearByCompanies$delivery_get_delivery_companies$delivery_details),
        details: details == _undefined
            ? _instance.details
            : (details
                as Query$getNearByCompanies$delivery_get_delivery_companies$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$delivery_details<
      TRes> get delivery_details {
    final local$delivery_details = _instance.delivery_details;
    return CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$delivery_details(
        local$delivery_details, (e) => call(delivery_details: e));
  }

  CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details<
      TRes> get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details
            .stub(_then(_instance))
        : CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$getNearByCompanies$delivery_get_delivery_companies<
        TRes>
    implements
        CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies<
            TRes> {
  _CopyWithStubImpl$Query$getNearByCompanies$delivery_get_delivery_companies(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$getNearByCompanies$delivery_get_delivery_companies$delivery_details?
        delivery_details,
    Query$getNearByCompanies$delivery_get_delivery_companies$details? details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$delivery_details<
          TRes>
      get delivery_details =>
          CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$delivery_details
              .stub(_res);
  CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details<
          TRes>
      get details =>
          CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details
              .stub(_res);
}

class Query$getNearByCompanies$delivery_get_delivery_companies$delivery_details {
  Query$getNearByCompanies$delivery_get_delivery_companies$delivery_details({
    required this.cost_per_km,
    required this.customer_pickup,
    required this.delivery_available,
    this.free_delivery_km_range,
    this.free_delivery_minimum_cost,
    required this.id,
    required this.radius,
    required this.minimum_cost,
    required this.self_delivery,
    required this.$__typename,
  });

  factory Query$getNearByCompanies$delivery_get_delivery_companies$delivery_details.fromJson(
      Map<String, dynamic> json) {
    final l$cost_per_km = json['cost_per_km'];
    final l$customer_pickup = json['customer_pickup'];
    final l$delivery_available = json['delivery_available'];
    final l$free_delivery_km_range = json['free_delivery_km_range'];
    final l$free_delivery_minimum_cost = json['free_delivery_minimum_cost'];
    final l$id = json['id'];
    final l$radius = json['radius'];
    final l$minimum_cost = json['minimum_cost'];
    final l$self_delivery = json['self_delivery'];
    final l$$__typename = json['__typename'];
    return Query$getNearByCompanies$delivery_get_delivery_companies$delivery_details(
      cost_per_km: moneyFromJson(l$cost_per_km),
      customer_pickup: (l$customer_pickup as bool),
      delivery_available: (l$delivery_available as bool),
      free_delivery_km_range: (l$free_delivery_km_range as num?)?.toDouble(),
      free_delivery_minimum_cost: l$free_delivery_minimum_cost == null
          ? null
          : moneyFromJson(l$free_delivery_minimum_cost),
      id: (l$id as int),
      radius: (l$radius as int),
      minimum_cost: moneyFromJson(l$minimum_cost),
      self_delivery: (l$self_delivery as bool),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final double cost_per_km;

  final bool customer_pickup;

  final bool delivery_available;

  final double? free_delivery_km_range;

  final double? free_delivery_minimum_cost;

  final int id;

  final int radius;

  final double minimum_cost;

  final bool self_delivery;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$cost_per_km = cost_per_km;
    _resultData['cost_per_km'] = moneyToJson(l$cost_per_km);
    final l$customer_pickup = customer_pickup;
    _resultData['customer_pickup'] = l$customer_pickup;
    final l$delivery_available = delivery_available;
    _resultData['delivery_available'] = l$delivery_available;
    final l$free_delivery_km_range = free_delivery_km_range;
    _resultData['free_delivery_km_range'] = l$free_delivery_km_range;
    final l$free_delivery_minimum_cost = free_delivery_minimum_cost;
    _resultData['free_delivery_minimum_cost'] =
        l$free_delivery_minimum_cost == null
            ? null
            : moneyToJson(l$free_delivery_minimum_cost);
    final l$id = id;
    _resultData['id'] = l$id;
    final l$radius = radius;
    _resultData['radius'] = l$radius;
    final l$minimum_cost = minimum_cost;
    _resultData['minimum_cost'] = moneyToJson(l$minimum_cost);
    final l$self_delivery = self_delivery;
    _resultData['self_delivery'] = l$self_delivery;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$cost_per_km = cost_per_km;
    final l$customer_pickup = customer_pickup;
    final l$delivery_available = delivery_available;
    final l$free_delivery_km_range = free_delivery_km_range;
    final l$free_delivery_minimum_cost = free_delivery_minimum_cost;
    final l$id = id;
    final l$radius = radius;
    final l$minimum_cost = minimum_cost;
    final l$self_delivery = self_delivery;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$cost_per_km,
      l$customer_pickup,
      l$delivery_available,
      l$free_delivery_km_range,
      l$free_delivery_minimum_cost,
      l$id,
      l$radius,
      l$minimum_cost,
      l$self_delivery,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getNearByCompanies$delivery_get_delivery_companies$delivery_details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$cost_per_km = cost_per_km;
    final lOther$cost_per_km = other.cost_per_km;
    if (l$cost_per_km != lOther$cost_per_km) {
      return false;
    }
    final l$customer_pickup = customer_pickup;
    final lOther$customer_pickup = other.customer_pickup;
    if (l$customer_pickup != lOther$customer_pickup) {
      return false;
    }
    final l$delivery_available = delivery_available;
    final lOther$delivery_available = other.delivery_available;
    if (l$delivery_available != lOther$delivery_available) {
      return false;
    }
    final l$free_delivery_km_range = free_delivery_km_range;
    final lOther$free_delivery_km_range = other.free_delivery_km_range;
    if (l$free_delivery_km_range != lOther$free_delivery_km_range) {
      return false;
    }
    final l$free_delivery_minimum_cost = free_delivery_minimum_cost;
    final lOther$free_delivery_minimum_cost = other.free_delivery_minimum_cost;
    if (l$free_delivery_minimum_cost != lOther$free_delivery_minimum_cost) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$radius = radius;
    final lOther$radius = other.radius;
    if (l$radius != lOther$radius) {
      return false;
    }
    final l$minimum_cost = minimum_cost;
    final lOther$minimum_cost = other.minimum_cost;
    if (l$minimum_cost != lOther$minimum_cost) {
      return false;
    }
    final l$self_delivery = self_delivery;
    final lOther$self_delivery = other.self_delivery;
    if (l$self_delivery != lOther$self_delivery) {
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

extension UtilityExtension$Query$getNearByCompanies$delivery_get_delivery_companies$delivery_details
    on Query$getNearByCompanies$delivery_get_delivery_companies$delivery_details {
  CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$delivery_details<
          Query$getNearByCompanies$delivery_get_delivery_companies$delivery_details>
      get copyWith =>
          CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$delivery_details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$delivery_details<
    TRes> {
  factory CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$delivery_details(
    Query$getNearByCompanies$delivery_get_delivery_companies$delivery_details
        instance,
    TRes Function(
            Query$getNearByCompanies$delivery_get_delivery_companies$delivery_details)
        then,
  ) = _CopyWithImpl$Query$getNearByCompanies$delivery_get_delivery_companies$delivery_details;

  factory CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$delivery_details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getNearByCompanies$delivery_get_delivery_companies$delivery_details;

  TRes call({
    double? cost_per_km,
    bool? customer_pickup,
    bool? delivery_available,
    double? free_delivery_km_range,
    double? free_delivery_minimum_cost,
    int? id,
    int? radius,
    double? minimum_cost,
    bool? self_delivery,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getNearByCompanies$delivery_get_delivery_companies$delivery_details<
        TRes>
    implements
        CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$delivery_details<
            TRes> {
  _CopyWithImpl$Query$getNearByCompanies$delivery_get_delivery_companies$delivery_details(
    this._instance,
    this._then,
  );

  final Query$getNearByCompanies$delivery_get_delivery_companies$delivery_details
      _instance;

  final TRes Function(
          Query$getNearByCompanies$delivery_get_delivery_companies$delivery_details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? cost_per_km = _undefined,
    Object? customer_pickup = _undefined,
    Object? delivery_available = _undefined,
    Object? free_delivery_km_range = _undefined,
    Object? free_delivery_minimum_cost = _undefined,
    Object? id = _undefined,
    Object? radius = _undefined,
    Object? minimum_cost = _undefined,
    Object? self_delivery = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getNearByCompanies$delivery_get_delivery_companies$delivery_details(
        cost_per_km: cost_per_km == _undefined || cost_per_km == null
            ? _instance.cost_per_km
            : (cost_per_km as double),
        customer_pickup:
            customer_pickup == _undefined || customer_pickup == null
                ? _instance.customer_pickup
                : (customer_pickup as bool),
        delivery_available:
            delivery_available == _undefined || delivery_available == null
                ? _instance.delivery_available
                : (delivery_available as bool),
        free_delivery_km_range: free_delivery_km_range == _undefined
            ? _instance.free_delivery_km_range
            : (free_delivery_km_range as double?),
        free_delivery_minimum_cost: free_delivery_minimum_cost == _undefined
            ? _instance.free_delivery_minimum_cost
            : (free_delivery_minimum_cost as double?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        radius: radius == _undefined || radius == null
            ? _instance.radius
            : (radius as int),
        minimum_cost: minimum_cost == _undefined || minimum_cost == null
            ? _instance.minimum_cost
            : (minimum_cost as double),
        self_delivery: self_delivery == _undefined || self_delivery == null
            ? _instance.self_delivery
            : (self_delivery as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getNearByCompanies$delivery_get_delivery_companies$delivery_details<
        TRes>
    implements
        CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$delivery_details<
            TRes> {
  _CopyWithStubImpl$Query$getNearByCompanies$delivery_get_delivery_companies$delivery_details(
      this._res);

  TRes _res;

  call({
    double? cost_per_km,
    bool? customer_pickup,
    bool? delivery_available,
    double? free_delivery_km_range,
    double? free_delivery_minimum_cost,
    int? id,
    int? radius,
    double? minimum_cost,
    bool? self_delivery,
    String? $__typename,
  }) =>
      _res;
}

class Query$getNearByCompanies$delivery_get_delivery_companies$details {
  Query$getNearByCompanies$delivery_get_delivery_companies$details({
    required this.id,
    required this.approved,
    this.description_id,
    required this.image,
    required this.location_id,
    required this.name,
    required this.language,
    this.schedule,
    required this.open_status,
    required this.creation_time,
    required this.service_provider_type,
    this.description,
    required this.location,
    required this.$__typename,
  });

  factory Query$getNearByCompanies$delivery_get_delivery_companies$details.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$approved = json['approved'];
    final l$description_id = json['description_id'];
    final l$image = json['image'];
    final l$location_id = json['location_id'];
    final l$name = json['name'];
    final l$language = json['language'];
    final l$schedule = json['schedule'];
    final l$open_status = json['open_status'];
    final l$creation_time = json['creation_time'];
    final l$service_provider_type = json['service_provider_type'];
    final l$description = json['description'];
    final l$location = json['location'];
    final l$$__typename = json['__typename'];
    return Query$getNearByCompanies$delivery_get_delivery_companies$details(
      id: (l$id as int),
      approved: (l$approved as bool),
      description_id: (l$description_id as int?),
      image: (l$image as String),
      location_id: (l$location_id as int),
      name: (l$name as String),
      language: mapFromJson(l$language),
      schedule: l$schedule == null ? null : mapFromJson(l$schedule),
      open_status: (l$open_status as String),
      creation_time: (l$creation_time as String),
      service_provider_type: (l$service_provider_type as String),
      description: l$description == null
          ? null
          : Query$getNearByCompanies$delivery_get_delivery_companies$details$description
              .fromJson((l$description as Map<String, dynamic>)),
      location:
          Query$getNearByCompanies$delivery_get_delivery_companies$details$location
              .fromJson((l$location as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final bool approved;

  final int? description_id;

  final String image;

  final int location_id;

  final String name;

  final dynamic language;

  final dynamic? schedule;

  final String open_status;

  final String creation_time;

  final String service_provider_type;

  final Query$getNearByCompanies$delivery_get_delivery_companies$details$description?
      description;

  final Query$getNearByCompanies$delivery_get_delivery_companies$details$location
      location;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$approved = approved;
    _resultData['approved'] = l$approved;
    final l$description_id = description_id;
    _resultData['description_id'] = l$description_id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$location_id = location_id;
    _resultData['location_id'] = l$location_id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$language = language;
    _resultData['language'] = mapToJson(l$language);
    final l$schedule = schedule;
    _resultData['schedule'] = l$schedule == null ? null : mapToJson(l$schedule);
    final l$open_status = open_status;
    _resultData['open_status'] = l$open_status;
    final l$creation_time = creation_time;
    _resultData['creation_time'] = l$creation_time;
    final l$service_provider_type = service_provider_type;
    _resultData['service_provider_type'] = l$service_provider_type;
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
    final l$location = location;
    _resultData['location'] = l$location.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$approved = approved;
    final l$description_id = description_id;
    final l$image = image;
    final l$location_id = location_id;
    final l$name = name;
    final l$language = language;
    final l$schedule = schedule;
    final l$open_status = open_status;
    final l$creation_time = creation_time;
    final l$service_provider_type = service_provider_type;
    final l$description = description;
    final l$location = location;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$approved,
      l$description_id,
      l$image,
      l$location_id,
      l$name,
      l$language,
      l$schedule,
      l$open_status,
      l$creation_time,
      l$service_provider_type,
      l$description,
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
            is Query$getNearByCompanies$delivery_get_delivery_companies$details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$approved = approved;
    final lOther$approved = other.approved;
    if (l$approved != lOther$approved) {
      return false;
    }
    final l$description_id = description_id;
    final lOther$description_id = other.description_id;
    if (l$description_id != lOther$description_id) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$location_id = location_id;
    final lOther$location_id = other.location_id;
    if (l$location_id != lOther$location_id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$language = language;
    final lOther$language = other.language;
    if (l$language != lOther$language) {
      return false;
    }
    final l$schedule = schedule;
    final lOther$schedule = other.schedule;
    if (l$schedule != lOther$schedule) {
      return false;
    }
    final l$open_status = open_status;
    final lOther$open_status = other.open_status;
    if (l$open_status != lOther$open_status) {
      return false;
    }
    final l$creation_time = creation_time;
    final lOther$creation_time = other.creation_time;
    if (l$creation_time != lOther$creation_time) {
      return false;
    }
    final l$service_provider_type = service_provider_type;
    final lOther$service_provider_type = other.service_provider_type;
    if (l$service_provider_type != lOther$service_provider_type) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
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

extension UtilityExtension$Query$getNearByCompanies$delivery_get_delivery_companies$details
    on Query$getNearByCompanies$delivery_get_delivery_companies$details {
  CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details<
          Query$getNearByCompanies$delivery_get_delivery_companies$details>
      get copyWith =>
          CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details<
    TRes> {
  factory CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details(
    Query$getNearByCompanies$delivery_get_delivery_companies$details instance,
    TRes Function(
            Query$getNearByCompanies$delivery_get_delivery_companies$details)
        then,
  ) = _CopyWithImpl$Query$getNearByCompanies$delivery_get_delivery_companies$details;

  factory CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getNearByCompanies$delivery_get_delivery_companies$details;

  TRes call({
    int? id,
    bool? approved,
    int? description_id,
    String? image,
    int? location_id,
    String? name,
    dynamic? language,
    dynamic? schedule,
    String? open_status,
    String? creation_time,
    String? service_provider_type,
    Query$getNearByCompanies$delivery_get_delivery_companies$details$description?
        description,
    Query$getNearByCompanies$delivery_get_delivery_companies$details$location?
        location,
    String? $__typename,
  });
  CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details$description<
      TRes> get description;
  CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details$location<
      TRes> get location;
}

class _CopyWithImpl$Query$getNearByCompanies$delivery_get_delivery_companies$details<
        TRes>
    implements
        CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details<
            TRes> {
  _CopyWithImpl$Query$getNearByCompanies$delivery_get_delivery_companies$details(
    this._instance,
    this._then,
  );

  final Query$getNearByCompanies$delivery_get_delivery_companies$details
      _instance;

  final TRes Function(
      Query$getNearByCompanies$delivery_get_delivery_companies$details) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? approved = _undefined,
    Object? description_id = _undefined,
    Object? image = _undefined,
    Object? location_id = _undefined,
    Object? name = _undefined,
    Object? language = _undefined,
    Object? schedule = _undefined,
    Object? open_status = _undefined,
    Object? creation_time = _undefined,
    Object? service_provider_type = _undefined,
    Object? description = _undefined,
    Object? location = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getNearByCompanies$delivery_get_delivery_companies$details(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        approved: approved == _undefined || approved == null
            ? _instance.approved
            : (approved as bool),
        description_id: description_id == _undefined
            ? _instance.description_id
            : (description_id as int?),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        location_id: location_id == _undefined || location_id == null
            ? _instance.location_id
            : (location_id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        language: language == _undefined || language == null
            ? _instance.language
            : (language as dynamic),
        schedule: schedule == _undefined
            ? _instance.schedule
            : (schedule as dynamic?),
        open_status: open_status == _undefined || open_status == null
            ? _instance.open_status
            : (open_status as String),
        creation_time: creation_time == _undefined || creation_time == null
            ? _instance.creation_time
            : (creation_time as String),
        service_provider_type:
            service_provider_type == _undefined || service_provider_type == null
                ? _instance.service_provider_type
                : (service_provider_type as String),
        description: description == _undefined
            ? _instance.description
            : (description
                as Query$getNearByCompanies$delivery_get_delivery_companies$details$description?),
        location: location == _undefined || location == null
            ? _instance.location
            : (location
                as Query$getNearByCompanies$delivery_get_delivery_companies$details$location),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details$description<
      TRes> get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details$description
            .stub(_then(_instance))
        : CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details$description(
            local$description, (e) => call(description: e));
  }

  CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details$location<
      TRes> get location {
    final local$location = _instance.location;
    return CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details$location(
        local$location, (e) => call(location: e));
  }
}

class _CopyWithStubImpl$Query$getNearByCompanies$delivery_get_delivery_companies$details<
        TRes>
    implements
        CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details<
            TRes> {
  _CopyWithStubImpl$Query$getNearByCompanies$delivery_get_delivery_companies$details(
      this._res);

  TRes _res;

  call({
    int? id,
    bool? approved,
    int? description_id,
    String? image,
    int? location_id,
    String? name,
    dynamic? language,
    dynamic? schedule,
    String? open_status,
    String? creation_time,
    String? service_provider_type,
    Query$getNearByCompanies$delivery_get_delivery_companies$details$description?
        description,
    Query$getNearByCompanies$delivery_get_delivery_companies$details$location?
        location,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details$description<
          TRes>
      get description =>
          CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details$description
              .stub(_res);
  CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details$location<
          TRes>
      get location =>
          CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details$location
              .stub(_res);
}

class Query$getNearByCompanies$delivery_get_delivery_companies$details$description {
  Query$getNearByCompanies$delivery_get_delivery_companies$details$description({
    required this.id,
    required this.translations,
    required this.$__typename,
  });

  factory Query$getNearByCompanies$delivery_get_delivery_companies$details$description.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getNearByCompanies$delivery_get_delivery_companies$details$description(
      id: (l$id as int),
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getNearByCompanies$delivery_get_delivery_companies$details$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final List<
          Query$getNearByCompanies$delivery_get_delivery_companies$details$description$translations>
      translations;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$translations = translations;
    _resultData['translations'] =
        l$translations.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$translations = translations;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
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
            is Query$getNearByCompanies$delivery_get_delivery_companies$details$description) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Query$getNearByCompanies$delivery_get_delivery_companies$details$description
    on Query$getNearByCompanies$delivery_get_delivery_companies$details$description {
  CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details$description<
          Query$getNearByCompanies$delivery_get_delivery_companies$details$description>
      get copyWith =>
          CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details$description<
    TRes> {
  factory CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details$description(
    Query$getNearByCompanies$delivery_get_delivery_companies$details$description
        instance,
    TRes Function(
            Query$getNearByCompanies$delivery_get_delivery_companies$details$description)
        then,
  ) = _CopyWithImpl$Query$getNearByCompanies$delivery_get_delivery_companies$details$description;

  factory CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details$description.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getNearByCompanies$delivery_get_delivery_companies$details$description;

  TRes call({
    int? id,
    List<Query$getNearByCompanies$delivery_get_delivery_companies$details$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getNearByCompanies$delivery_get_delivery_companies$details$description$translations> Function(
              Iterable<
                  CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details$description$translations<
                      Query$getNearByCompanies$delivery_get_delivery_companies$details$description$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getNearByCompanies$delivery_get_delivery_companies$details$description<
        TRes>
    implements
        CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details$description<
            TRes> {
  _CopyWithImpl$Query$getNearByCompanies$delivery_get_delivery_companies$details$description(
    this._instance,
    this._then,
  );

  final Query$getNearByCompanies$delivery_get_delivery_companies$details$description
      _instance;

  final TRes Function(
          Query$getNearByCompanies$delivery_get_delivery_companies$details$description)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getNearByCompanies$delivery_get_delivery_companies$details$description(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getNearByCompanies$delivery_get_delivery_companies$details$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getNearByCompanies$delivery_get_delivery_companies$details$description$translations> Function(
                  Iterable<
                      CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details$description$translations<
                          Query$getNearByCompanies$delivery_get_delivery_companies$details$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getNearByCompanies$delivery_get_delivery_companies$details$description<
        TRes>
    implements
        CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details$description<
            TRes> {
  _CopyWithStubImpl$Query$getNearByCompanies$delivery_get_delivery_companies$details$description(
      this._res);

  TRes _res;

  call({
    int? id,
    List<Query$getNearByCompanies$delivery_get_delivery_companies$details$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getNearByCompanies$delivery_get_delivery_companies$details$description$translations {
  Query$getNearByCompanies$delivery_get_delivery_companies$details$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getNearByCompanies$delivery_get_delivery_companies$details$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getNearByCompanies$delivery_get_delivery_companies$details$description$translations(
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
            is Query$getNearByCompanies$delivery_get_delivery_companies$details$description$translations) ||
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

extension UtilityExtension$Query$getNearByCompanies$delivery_get_delivery_companies$details$description$translations
    on Query$getNearByCompanies$delivery_get_delivery_companies$details$description$translations {
  CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details$description$translations<
          Query$getNearByCompanies$delivery_get_delivery_companies$details$description$translations>
      get copyWith =>
          CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details$description$translations<
    TRes> {
  factory CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details$description$translations(
    Query$getNearByCompanies$delivery_get_delivery_companies$details$description$translations
        instance,
    TRes Function(
            Query$getNearByCompanies$delivery_get_delivery_companies$details$description$translations)
        then,
  ) = _CopyWithImpl$Query$getNearByCompanies$delivery_get_delivery_companies$details$description$translations;

  factory CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getNearByCompanies$delivery_get_delivery_companies$details$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getNearByCompanies$delivery_get_delivery_companies$details$description$translations<
        TRes>
    implements
        CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details$description$translations<
            TRes> {
  _CopyWithImpl$Query$getNearByCompanies$delivery_get_delivery_companies$details$description$translations(
    this._instance,
    this._then,
  );

  final Query$getNearByCompanies$delivery_get_delivery_companies$details$description$translations
      _instance;

  final TRes Function(
          Query$getNearByCompanies$delivery_get_delivery_companies$details$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getNearByCompanies$delivery_get_delivery_companies$details$description$translations(
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

class _CopyWithStubImpl$Query$getNearByCompanies$delivery_get_delivery_companies$details$description$translations<
        TRes>
    implements
        CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details$description$translations<
            TRes> {
  _CopyWithStubImpl$Query$getNearByCompanies$delivery_get_delivery_companies$details$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$getNearByCompanies$delivery_get_delivery_companies$details$location {
  Query$getNearByCompanies$delivery_get_delivery_companies$details$location({
    required this.gps,
    required this.address,
    required this.$__typename,
  });

  factory Query$getNearByCompanies$delivery_get_delivery_companies$details$location.fromJson(
      Map<String, dynamic> json) {
    final l$gps = json['gps'];
    final l$address = json['address'];
    final l$$__typename = json['__typename'];
    return Query$getNearByCompanies$delivery_get_delivery_companies$details$location(
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
            is Query$getNearByCompanies$delivery_get_delivery_companies$details$location) ||
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

extension UtilityExtension$Query$getNearByCompanies$delivery_get_delivery_companies$details$location
    on Query$getNearByCompanies$delivery_get_delivery_companies$details$location {
  CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details$location<
          Query$getNearByCompanies$delivery_get_delivery_companies$details$location>
      get copyWith =>
          CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details$location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details$location<
    TRes> {
  factory CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details$location(
    Query$getNearByCompanies$delivery_get_delivery_companies$details$location
        instance,
    TRes Function(
            Query$getNearByCompanies$delivery_get_delivery_companies$details$location)
        then,
  ) = _CopyWithImpl$Query$getNearByCompanies$delivery_get_delivery_companies$details$location;

  factory CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details$location.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getNearByCompanies$delivery_get_delivery_companies$details$location;

  TRes call({
    Geography? gps,
    String? address,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getNearByCompanies$delivery_get_delivery_companies$details$location<
        TRes>
    implements
        CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details$location<
            TRes> {
  _CopyWithImpl$Query$getNearByCompanies$delivery_get_delivery_companies$details$location(
    this._instance,
    this._then,
  );

  final Query$getNearByCompanies$delivery_get_delivery_companies$details$location
      _instance;

  final TRes Function(
          Query$getNearByCompanies$delivery_get_delivery_companies$details$location)
      _then;

  static const _undefined = {};

  TRes call({
    Object? gps = _undefined,
    Object? address = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getNearByCompanies$delivery_get_delivery_companies$details$location(
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

class _CopyWithStubImpl$Query$getNearByCompanies$delivery_get_delivery_companies$details$location<
        TRes>
    implements
        CopyWith$Query$getNearByCompanies$delivery_get_delivery_companies$details$location<
            TRes> {
  _CopyWithStubImpl$Query$getNearByCompanies$delivery_get_delivery_companies$details$location(
      this._res);

  TRes _res;

  call({
    Geography? gps,
    String? address,
    String? $__typename,
  }) =>
      _res;
}
