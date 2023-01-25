import '../../__generated/schema.graphql.dart';
import 'dart:async';
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
            name: NameNode(value: 'location'),
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
            name: NameNode(value: 'delivery_radius'),
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
    required this.approved,
    this.description_id,
    required this.id,
    required this.image,
    required this.name,
    required this.open_status,
    required this.location,
    required this.creation_time,
    required this.delivery_radius,
    required this.service_provider_type,
    this.description,
    required this.$__typename,
  });

  factory Query$getDeliveryCompanyById$delivery_company_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$approved = json['approved'];
    final l$description_id = json['description_id'];
    final l$id = json['id'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$open_status = json['open_status'];
    final l$location = json['location'];
    final l$creation_time = json['creation_time'];
    final l$delivery_radius = json['delivery_radius'];
    final l$service_provider_type = json['service_provider_type'];
    final l$description = json['description'];
    final l$$__typename = json['__typename'];
    return Query$getDeliveryCompanyById$delivery_company_by_pk(
      approved: (l$approved as bool),
      description_id: (l$description_id as int?),
      id: (l$id as int),
      image: (l$image as String),
      name: (l$name as String),
      open_status: (l$open_status as String),
      location: geographyFromJson(l$location),
      creation_time: (l$creation_time as String),
      delivery_radius: (l$delivery_radius as int),
      service_provider_type: (l$service_provider_type as String),
      description: l$description == null
          ? null
          : Query$getDeliveryCompanyById$delivery_company_by_pk$description
              .fromJson((l$description as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final bool approved;

  final int? description_id;

  final int id;

  final String image;

  final String name;

  final String open_status;

  final Geography location;

  final String creation_time;

  final int delivery_radius;

  final String service_provider_type;

  final Query$getDeliveryCompanyById$delivery_company_by_pk$description?
      description;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$approved = approved;
    _resultData['approved'] = l$approved;
    final l$description_id = description_id;
    _resultData['description_id'] = l$description_id;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$open_status = open_status;
    _resultData['open_status'] = l$open_status;
    final l$location = location;
    _resultData['location'] = geographyToJson(l$location);
    final l$creation_time = creation_time;
    _resultData['creation_time'] = l$creation_time;
    final l$delivery_radius = delivery_radius;
    _resultData['delivery_radius'] = l$delivery_radius;
    final l$service_provider_type = service_provider_type;
    _resultData['service_provider_type'] = l$service_provider_type;
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$approved = approved;
    final l$description_id = description_id;
    final l$id = id;
    final l$image = image;
    final l$name = name;
    final l$open_status = open_status;
    final l$location = location;
    final l$creation_time = creation_time;
    final l$delivery_radius = delivery_radius;
    final l$service_provider_type = service_provider_type;
    final l$description = description;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$approved,
      l$description_id,
      l$id,
      l$image,
      l$name,
      l$open_status,
      l$location,
      l$creation_time,
      l$delivery_radius,
      l$service_provider_type,
      l$description,
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
    final l$open_status = open_status;
    final lOther$open_status = other.open_status;
    if (l$open_status != lOther$open_status) {
      return false;
    }
    final l$location = location;
    final lOther$location = other.location;
    if (l$location != lOther$location) {
      return false;
    }
    final l$creation_time = creation_time;
    final lOther$creation_time = other.creation_time;
    if (l$creation_time != lOther$creation_time) {
      return false;
    }
    final l$delivery_radius = delivery_radius;
    final lOther$delivery_radius = other.delivery_radius;
    if (l$delivery_radius != lOther$delivery_radius) {
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
    bool? approved,
    int? description_id,
    int? id,
    String? image,
    String? name,
    String? open_status,
    Geography? location,
    String? creation_time,
    int? delivery_radius,
    String? service_provider_type,
    Query$getDeliveryCompanyById$delivery_company_by_pk$description?
        description,
    String? $__typename,
  });
  CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$description<TRes>
      get description;
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
    Object? approved = _undefined,
    Object? description_id = _undefined,
    Object? id = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? open_status = _undefined,
    Object? location = _undefined,
    Object? creation_time = _undefined,
    Object? delivery_radius = _undefined,
    Object? service_provider_type = _undefined,
    Object? description = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getDeliveryCompanyById$delivery_company_by_pk(
        approved: approved == _undefined || approved == null
            ? _instance.approved
            : (approved as bool),
        description_id: description_id == _undefined
            ? _instance.description_id
            : (description_id as int?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        open_status: open_status == _undefined || open_status == null
            ? _instance.open_status
            : (open_status as String),
        location: location == _undefined || location == null
            ? _instance.location
            : (location as Geography),
        creation_time: creation_time == _undefined || creation_time == null
            ? _instance.creation_time
            : (creation_time as String),
        delivery_radius:
            delivery_radius == _undefined || delivery_radius == null
                ? _instance.delivery_radius
                : (delivery_radius as int),
        service_provider_type:
            service_provider_type == _undefined || service_provider_type == null
                ? _instance.service_provider_type
                : (service_provider_type as String),
        description: description == _undefined
            ? _instance.description
            : (description
                as Query$getDeliveryCompanyById$delivery_company_by_pk$description?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$description<TRes>
      get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$description
            .stub(_then(_instance))
        : CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$description(
            local$description, (e) => call(description: e));
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
    bool? approved,
    int? description_id,
    int? id,
    String? image,
    String? name,
    String? open_status,
    Geography? location,
    String? creation_time,
    int? delivery_radius,
    String? service_provider_type,
    Query$getDeliveryCompanyById$delivery_company_by_pk$description?
        description,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$description<TRes>
      get description =>
          CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$description
              .stub(_res);
}

class Query$getDeliveryCompanyById$delivery_company_by_pk$description {
  Query$getDeliveryCompanyById$delivery_company_by_pk$description({
    required this.id,
    required this.translations,
    required this.$__typename,
  });

  factory Query$getDeliveryCompanyById$delivery_company_by_pk$description.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getDeliveryCompanyById$delivery_company_by_pk$description(
      id: (l$id as int),
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getDeliveryCompanyById$delivery_company_by_pk$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final List<
          Query$getDeliveryCompanyById$delivery_company_by_pk$description$translations>
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
            is Query$getDeliveryCompanyById$delivery_company_by_pk$description) ||
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

extension UtilityExtension$Query$getDeliveryCompanyById$delivery_company_by_pk$description
    on Query$getDeliveryCompanyById$delivery_company_by_pk$description {
  CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$description<
          Query$getDeliveryCompanyById$delivery_company_by_pk$description>
      get copyWith =>
          CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$description<
    TRes> {
  factory CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$description(
    Query$getDeliveryCompanyById$delivery_company_by_pk$description instance,
    TRes Function(
            Query$getDeliveryCompanyById$delivery_company_by_pk$description)
        then,
  ) = _CopyWithImpl$Query$getDeliveryCompanyById$delivery_company_by_pk$description;

  factory CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$description.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getDeliveryCompanyById$delivery_company_by_pk$description;

  TRes call({
    int? id,
    List<Query$getDeliveryCompanyById$delivery_company_by_pk$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getDeliveryCompanyById$delivery_company_by_pk$description$translations> Function(
              Iterable<
                  CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$description$translations<
                      Query$getDeliveryCompanyById$delivery_company_by_pk$description$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getDeliveryCompanyById$delivery_company_by_pk$description<
        TRes>
    implements
        CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$description<
            TRes> {
  _CopyWithImpl$Query$getDeliveryCompanyById$delivery_company_by_pk$description(
    this._instance,
    this._then,
  );

  final Query$getDeliveryCompanyById$delivery_company_by_pk$description
      _instance;

  final TRes Function(
      Query$getDeliveryCompanyById$delivery_company_by_pk$description) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getDeliveryCompanyById$delivery_company_by_pk$description(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getDeliveryCompanyById$delivery_company_by_pk$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getDeliveryCompanyById$delivery_company_by_pk$description$translations> Function(
                  Iterable<
                      CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$description$translations<
                          Query$getDeliveryCompanyById$delivery_company_by_pk$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getDeliveryCompanyById$delivery_company_by_pk$description<
        TRes>
    implements
        CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$description<
            TRes> {
  _CopyWithStubImpl$Query$getDeliveryCompanyById$delivery_company_by_pk$description(
      this._res);

  TRes _res;

  call({
    int? id,
    List<Query$getDeliveryCompanyById$delivery_company_by_pk$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getDeliveryCompanyById$delivery_company_by_pk$description$translations {
  Query$getDeliveryCompanyById$delivery_company_by_pk$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getDeliveryCompanyById$delivery_company_by_pk$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getDeliveryCompanyById$delivery_company_by_pk$description$translations(
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
            is Query$getDeliveryCompanyById$delivery_company_by_pk$description$translations) ||
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

extension UtilityExtension$Query$getDeliveryCompanyById$delivery_company_by_pk$description$translations
    on Query$getDeliveryCompanyById$delivery_company_by_pk$description$translations {
  CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$description$translations<
          Query$getDeliveryCompanyById$delivery_company_by_pk$description$translations>
      get copyWith =>
          CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$description$translations<
    TRes> {
  factory CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$description$translations(
    Query$getDeliveryCompanyById$delivery_company_by_pk$description$translations
        instance,
    TRes Function(
            Query$getDeliveryCompanyById$delivery_company_by_pk$description$translations)
        then,
  ) = _CopyWithImpl$Query$getDeliveryCompanyById$delivery_company_by_pk$description$translations;

  factory CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getDeliveryCompanyById$delivery_company_by_pk$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getDeliveryCompanyById$delivery_company_by_pk$description$translations<
        TRes>
    implements
        CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$description$translations<
            TRes> {
  _CopyWithImpl$Query$getDeliveryCompanyById$delivery_company_by_pk$description$translations(
    this._instance,
    this._then,
  );

  final Query$getDeliveryCompanyById$delivery_company_by_pk$description$translations
      _instance;

  final TRes Function(
          Query$getDeliveryCompanyById$delivery_company_by_pk$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getDeliveryCompanyById$delivery_company_by_pk$description$translations(
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

class _CopyWithStubImpl$Query$getDeliveryCompanyById$delivery_company_by_pk$description$translations<
        TRes>
    implements
        CopyWith$Query$getDeliveryCompanyById$delivery_company_by_pk$description$translations<
            TRes> {
  _CopyWithStubImpl$Query$getDeliveryCompanyById$delivery_company_by_pk$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$updateDeliveryCompany {
  factory Variables$Mutation$updateDeliveryCompany({
    required int id,
    Input$delivery_company_set_input? data,
  }) =>
      Variables$Mutation$updateDeliveryCompany._({
        r'id': id,
        if (data != null) r'data': data,
      });

  Variables$Mutation$updateDeliveryCompany._(this._$data);

  factory Variables$Mutation$updateDeliveryCompany.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    if (data.containsKey('data')) {
      final l$data = data['data'];
      result$data['data'] = l$data == null
          ? null
          : Input$delivery_company_set_input.fromJson(
              (l$data as Map<String, dynamic>));
    }
    return Variables$Mutation$updateDeliveryCompany._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  Input$delivery_company_set_input? get data =>
      (_$data['data'] as Input$delivery_company_set_input?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('data')) {
      final l$data = data;
      result$data['data'] = l$data?.toJson();
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$updateDeliveryCompany<
          Variables$Mutation$updateDeliveryCompany>
      get copyWith => CopyWith$Variables$Mutation$updateDeliveryCompany(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$updateDeliveryCompany) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$data = data;
    final lOther$data = other.data;
    if (_$data.containsKey('data') != other._$data.containsKey('data')) {
      return false;
    }
    if (l$data != lOther$data) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$data = data;
    return Object.hashAll([
      l$id,
      _$data.containsKey('data') ? l$data : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$updateDeliveryCompany<TRes> {
  factory CopyWith$Variables$Mutation$updateDeliveryCompany(
    Variables$Mutation$updateDeliveryCompany instance,
    TRes Function(Variables$Mutation$updateDeliveryCompany) then,
  ) = _CopyWithImpl$Variables$Mutation$updateDeliveryCompany;

  factory CopyWith$Variables$Mutation$updateDeliveryCompany.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$updateDeliveryCompany;

  TRes call({
    int? id,
    Input$delivery_company_set_input? data,
  });
}

class _CopyWithImpl$Variables$Mutation$updateDeliveryCompany<TRes>
    implements CopyWith$Variables$Mutation$updateDeliveryCompany<TRes> {
  _CopyWithImpl$Variables$Mutation$updateDeliveryCompany(
    this._instance,
    this._then,
  );

  final Variables$Mutation$updateDeliveryCompany _instance;

  final TRes Function(Variables$Mutation$updateDeliveryCompany) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? data = _undefined,
  }) =>
      _then(Variables$Mutation$updateDeliveryCompany._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
        if (data != _undefined)
          'data': (data as Input$delivery_company_set_input?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$updateDeliveryCompany<TRes>
    implements CopyWith$Variables$Mutation$updateDeliveryCompany<TRes> {
  _CopyWithStubImpl$Variables$Mutation$updateDeliveryCompany(this._res);

  TRes _res;

  call({
    int? id,
    Input$delivery_company_set_input? data,
  }) =>
      _res;
}

class Mutation$updateDeliveryCompany {
  Mutation$updateDeliveryCompany({
    this.update_delivery_company_by_pk,
    required this.$__typename,
  });

  factory Mutation$updateDeliveryCompany.fromJson(Map<String, dynamic> json) {
    final l$update_delivery_company_by_pk =
        json['update_delivery_company_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$updateDeliveryCompany(
      update_delivery_company_by_pk: l$update_delivery_company_by_pk == null
          ? null
          : Mutation$updateDeliveryCompany$update_delivery_company_by_pk
              .fromJson(
                  (l$update_delivery_company_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$updateDeliveryCompany$update_delivery_company_by_pk?
      update_delivery_company_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_delivery_company_by_pk = update_delivery_company_by_pk;
    _resultData['update_delivery_company_by_pk'] =
        l$update_delivery_company_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_delivery_company_by_pk = update_delivery_company_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_delivery_company_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$updateDeliveryCompany) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_delivery_company_by_pk = update_delivery_company_by_pk;
    final lOther$update_delivery_company_by_pk =
        other.update_delivery_company_by_pk;
    if (l$update_delivery_company_by_pk !=
        lOther$update_delivery_company_by_pk) {
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

extension UtilityExtension$Mutation$updateDeliveryCompany
    on Mutation$updateDeliveryCompany {
  CopyWith$Mutation$updateDeliveryCompany<Mutation$updateDeliveryCompany>
      get copyWith => CopyWith$Mutation$updateDeliveryCompany(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateDeliveryCompany<TRes> {
  factory CopyWith$Mutation$updateDeliveryCompany(
    Mutation$updateDeliveryCompany instance,
    TRes Function(Mutation$updateDeliveryCompany) then,
  ) = _CopyWithImpl$Mutation$updateDeliveryCompany;

  factory CopyWith$Mutation$updateDeliveryCompany.stub(TRes res) =
      _CopyWithStubImpl$Mutation$updateDeliveryCompany;

  TRes call({
    Mutation$updateDeliveryCompany$update_delivery_company_by_pk?
        update_delivery_company_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$updateDeliveryCompany$update_delivery_company_by_pk<TRes>
      get update_delivery_company_by_pk;
}

class _CopyWithImpl$Mutation$updateDeliveryCompany<TRes>
    implements CopyWith$Mutation$updateDeliveryCompany<TRes> {
  _CopyWithImpl$Mutation$updateDeliveryCompany(
    this._instance,
    this._then,
  );

  final Mutation$updateDeliveryCompany _instance;

  final TRes Function(Mutation$updateDeliveryCompany) _then;

  static const _undefined = {};

  TRes call({
    Object? update_delivery_company_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateDeliveryCompany(
        update_delivery_company_by_pk: update_delivery_company_by_pk ==
                _undefined
            ? _instance.update_delivery_company_by_pk
            : (update_delivery_company_by_pk
                as Mutation$updateDeliveryCompany$update_delivery_company_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$updateDeliveryCompany$update_delivery_company_by_pk<TRes>
      get update_delivery_company_by_pk {
    final local$update_delivery_company_by_pk =
        _instance.update_delivery_company_by_pk;
    return local$update_delivery_company_by_pk == null
        ? CopyWith$Mutation$updateDeliveryCompany$update_delivery_company_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$updateDeliveryCompany$update_delivery_company_by_pk(
            local$update_delivery_company_by_pk,
            (e) => call(update_delivery_company_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$updateDeliveryCompany<TRes>
    implements CopyWith$Mutation$updateDeliveryCompany<TRes> {
  _CopyWithStubImpl$Mutation$updateDeliveryCompany(this._res);

  TRes _res;

  call({
    Mutation$updateDeliveryCompany$update_delivery_company_by_pk?
        update_delivery_company_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$updateDeliveryCompany$update_delivery_company_by_pk<TRes>
      get update_delivery_company_by_pk =>
          CopyWith$Mutation$updateDeliveryCompany$update_delivery_company_by_pk
              .stub(_res);
}

const documentNodeMutationupdateDeliveryCompany = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'updateDeliveryCompany'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'data')),
        type: NamedTypeNode(
          name: NameNode(value: 'delivery_company_set_input'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'update_delivery_company_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'pk_columns'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: '_set'),
            value: VariableNode(name: NameNode(value: 'data')),
          ),
        ],
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
            name: NameNode(value: 'description_id'),
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
            name: NameNode(value: 'location'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'delivery_radius'),
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
Mutation$updateDeliveryCompany _parserFn$Mutation$updateDeliveryCompany(
        Map<String, dynamic> data) =>
    Mutation$updateDeliveryCompany.fromJson(data);
typedef OnMutationCompleted$Mutation$updateDeliveryCompany = FutureOr<void>
    Function(
  dynamic,
  Mutation$updateDeliveryCompany?,
);

class Options$Mutation$updateDeliveryCompany
    extends graphql.MutationOptions<Mutation$updateDeliveryCompany> {
  Options$Mutation$updateDeliveryCompany({
    String? operationName,
    required Variables$Mutation$updateDeliveryCompany variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$updateDeliveryCompany? onCompleted,
    graphql.OnMutationUpdate<Mutation$updateDeliveryCompany>? update,
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
                        : _parserFn$Mutation$updateDeliveryCompany(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdateDeliveryCompany,
          parserFn: _parserFn$Mutation$updateDeliveryCompany,
        );

  final OnMutationCompleted$Mutation$updateDeliveryCompany?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$updateDeliveryCompany
    extends graphql.WatchQueryOptions<Mutation$updateDeliveryCompany> {
  WatchOptions$Mutation$updateDeliveryCompany({
    String? operationName,
    required Variables$Mutation$updateDeliveryCompany variables,
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
          document: documentNodeMutationupdateDeliveryCompany,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$updateDeliveryCompany,
        );
}

extension ClientExtension$Mutation$updateDeliveryCompany
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$updateDeliveryCompany>>
      mutate$updateDeliveryCompany(
              Options$Mutation$updateDeliveryCompany options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$updateDeliveryCompany>
      watchMutation$updateDeliveryCompany(
              WatchOptions$Mutation$updateDeliveryCompany options) =>
          this.watchMutation(options);
}

class Mutation$updateDeliveryCompany$update_delivery_company_by_pk {
  Mutation$updateDeliveryCompany$update_delivery_company_by_pk({
    required this.approved,
    this.description_id,
    required this.id,
    required this.image,
    required this.name,
    required this.open_status,
    required this.location,
    required this.delivery_radius,
    required this.creation_time,
    required this.service_provider_type,
    this.description,
    required this.$__typename,
  });

  factory Mutation$updateDeliveryCompany$update_delivery_company_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$approved = json['approved'];
    final l$description_id = json['description_id'];
    final l$id = json['id'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$open_status = json['open_status'];
    final l$location = json['location'];
    final l$delivery_radius = json['delivery_radius'];
    final l$creation_time = json['creation_time'];
    final l$service_provider_type = json['service_provider_type'];
    final l$description = json['description'];
    final l$$__typename = json['__typename'];
    return Mutation$updateDeliveryCompany$update_delivery_company_by_pk(
      approved: (l$approved as bool),
      description_id: (l$description_id as int?),
      id: (l$id as int),
      image: (l$image as String),
      name: (l$name as String),
      open_status: (l$open_status as String),
      location: geographyFromJson(l$location),
      delivery_radius: (l$delivery_radius as int),
      creation_time: (l$creation_time as String),
      service_provider_type: (l$service_provider_type as String),
      description: l$description == null
          ? null
          : Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description
              .fromJson((l$description as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final bool approved;

  final int? description_id;

  final int id;

  final String image;

  final String name;

  final String open_status;

  final Geography location;

  final int delivery_radius;

  final String creation_time;

  final String service_provider_type;

  final Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description?
      description;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$approved = approved;
    _resultData['approved'] = l$approved;
    final l$description_id = description_id;
    _resultData['description_id'] = l$description_id;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$open_status = open_status;
    _resultData['open_status'] = l$open_status;
    final l$location = location;
    _resultData['location'] = geographyToJson(l$location);
    final l$delivery_radius = delivery_radius;
    _resultData['delivery_radius'] = l$delivery_radius;
    final l$creation_time = creation_time;
    _resultData['creation_time'] = l$creation_time;
    final l$service_provider_type = service_provider_type;
    _resultData['service_provider_type'] = l$service_provider_type;
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$approved = approved;
    final l$description_id = description_id;
    final l$id = id;
    final l$image = image;
    final l$name = name;
    final l$open_status = open_status;
    final l$location = location;
    final l$delivery_radius = delivery_radius;
    final l$creation_time = creation_time;
    final l$service_provider_type = service_provider_type;
    final l$description = description;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$approved,
      l$description_id,
      l$id,
      l$image,
      l$name,
      l$open_status,
      l$location,
      l$delivery_radius,
      l$creation_time,
      l$service_provider_type,
      l$description,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$updateDeliveryCompany$update_delivery_company_by_pk) ||
        runtimeType != other.runtimeType) {
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
    final l$open_status = open_status;
    final lOther$open_status = other.open_status;
    if (l$open_status != lOther$open_status) {
      return false;
    }
    final l$location = location;
    final lOther$location = other.location;
    if (l$location != lOther$location) {
      return false;
    }
    final l$delivery_radius = delivery_radius;
    final lOther$delivery_radius = other.delivery_radius;
    if (l$delivery_radius != lOther$delivery_radius) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$updateDeliveryCompany$update_delivery_company_by_pk
    on Mutation$updateDeliveryCompany$update_delivery_company_by_pk {
  CopyWith$Mutation$updateDeliveryCompany$update_delivery_company_by_pk<
          Mutation$updateDeliveryCompany$update_delivery_company_by_pk>
      get copyWith =>
          CopyWith$Mutation$updateDeliveryCompany$update_delivery_company_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateDeliveryCompany$update_delivery_company_by_pk<
    TRes> {
  factory CopyWith$Mutation$updateDeliveryCompany$update_delivery_company_by_pk(
    Mutation$updateDeliveryCompany$update_delivery_company_by_pk instance,
    TRes Function(Mutation$updateDeliveryCompany$update_delivery_company_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$updateDeliveryCompany$update_delivery_company_by_pk;

  factory CopyWith$Mutation$updateDeliveryCompany$update_delivery_company_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateDeliveryCompany$update_delivery_company_by_pk;

  TRes call({
    bool? approved,
    int? description_id,
    int? id,
    String? image,
    String? name,
    String? open_status,
    Geography? location,
    int? delivery_radius,
    String? creation_time,
    String? service_provider_type,
    Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description?
        description,
    String? $__typename,
  });
  CopyWith$Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description<
      TRes> get description;
}

class _CopyWithImpl$Mutation$updateDeliveryCompany$update_delivery_company_by_pk<
        TRes>
    implements
        CopyWith$Mutation$updateDeliveryCompany$update_delivery_company_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$updateDeliveryCompany$update_delivery_company_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$updateDeliveryCompany$update_delivery_company_by_pk _instance;

  final TRes Function(
      Mutation$updateDeliveryCompany$update_delivery_company_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? approved = _undefined,
    Object? description_id = _undefined,
    Object? id = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? open_status = _undefined,
    Object? location = _undefined,
    Object? delivery_radius = _undefined,
    Object? creation_time = _undefined,
    Object? service_provider_type = _undefined,
    Object? description = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateDeliveryCompany$update_delivery_company_by_pk(
        approved: approved == _undefined || approved == null
            ? _instance.approved
            : (approved as bool),
        description_id: description_id == _undefined
            ? _instance.description_id
            : (description_id as int?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        open_status: open_status == _undefined || open_status == null
            ? _instance.open_status
            : (open_status as String),
        location: location == _undefined || location == null
            ? _instance.location
            : (location as Geography),
        delivery_radius:
            delivery_radius == _undefined || delivery_radius == null
                ? _instance.delivery_radius
                : (delivery_radius as int),
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
                as Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description<
      TRes> get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description
            .stub(_then(_instance))
        : CopyWith$Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description(
            local$description, (e) => call(description: e));
  }
}

class _CopyWithStubImpl$Mutation$updateDeliveryCompany$update_delivery_company_by_pk<
        TRes>
    implements
        CopyWith$Mutation$updateDeliveryCompany$update_delivery_company_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$updateDeliveryCompany$update_delivery_company_by_pk(
      this._res);

  TRes _res;

  call({
    bool? approved,
    int? description_id,
    int? id,
    String? image,
    String? name,
    String? open_status,
    Geography? location,
    int? delivery_radius,
    String? creation_time,
    String? service_provider_type,
    Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description?
        description,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description<
          TRes>
      get description =>
          CopyWith$Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description
              .stub(_res);
}

class Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description {
  Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description({
    required this.id,
    required this.translations,
    required this.$__typename,
  });

  factory Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description(
      id: (l$id as int),
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final List<
          Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description$translations>
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
            is Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description) ||
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

extension UtilityExtension$Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description
    on Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description {
  CopyWith$Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description<
          Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description>
      get copyWith =>
          CopyWith$Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description<
    TRes> {
  factory CopyWith$Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description(
    Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description
        instance,
    TRes Function(
            Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description)
        then,
  ) = _CopyWithImpl$Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description;

  factory CopyWith$Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description;

  TRes call({
    int? id,
    List<Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description$translations> Function(
              Iterable<
                  CopyWith$Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description$translations<
                      Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description$translations>>)
          _fn);
}

class _CopyWithImpl$Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description<
        TRes>
    implements
        CopyWith$Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description<
            TRes> {
  _CopyWithImpl$Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description(
    this._instance,
    this._then,
  );

  final Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description
      _instance;

  final TRes Function(
          Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description$translations> Function(
                  Iterable<
                      CopyWith$Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description$translations<
                          Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description<
        TRes>
    implements
        CopyWith$Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description<
            TRes> {
  _CopyWithStubImpl$Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description(
      this._res);

  TRes _res;

  call({
    int? id,
    List<Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description$translations {
  Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description$translations(
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
            is Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description$translations) ||
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

extension UtilityExtension$Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description$translations
    on Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description$translations {
  CopyWith$Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description$translations<
          Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description$translations>
      get copyWith =>
          CopyWith$Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description$translations<
    TRes> {
  factory CopyWith$Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description$translations(
    Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description$translations
        instance,
    TRes Function(
            Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description$translations)
        then,
  ) = _CopyWithImpl$Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description$translations;

  factory CopyWith$Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description$translations<
        TRes>
    implements
        CopyWith$Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description$translations<
            TRes> {
  _CopyWithImpl$Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description$translations(
    this._instance,
    this._then,
  );

  final Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description$translations
      _instance;

  final TRes Function(
          Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description$translations(
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

class _CopyWithStubImpl$Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description$translations<
        TRes>
    implements
        CopyWith$Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description$translations<
            TRes> {
  _CopyWithStubImpl$Mutation$updateDeliveryCompany$update_delivery_company_by_pk$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getNearByCompanies {
  factory Variables$Query$getNearByCompanies(
          {required Input$delivery_fetch_delivery_company_args args}) =>
      Variables$Query$getNearByCompanies._({
        r'args': args,
      });

  Variables$Query$getNearByCompanies._(this._$data);

  factory Variables$Query$getNearByCompanies.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$args = data['args'];
    result$data['args'] = Input$delivery_fetch_delivery_company_args.fromJson(
        (l$args as Map<String, dynamic>));
    return Variables$Query$getNearByCompanies._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$delivery_fetch_delivery_company_args get args =>
      (_$data['args'] as Input$delivery_fetch_delivery_company_args);
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

  TRes call({Input$delivery_fetch_delivery_company_args? args});
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
          'args': (args as Input$delivery_fetch_delivery_company_args),
      }));
}

class _CopyWithStubImpl$Variables$Query$getNearByCompanies<TRes>
    implements CopyWith$Variables$Query$getNearByCompanies<TRes> {
  _CopyWithStubImpl$Variables$Query$getNearByCompanies(this._res);

  TRes _res;

  call({Input$delivery_fetch_delivery_company_args? args}) => _res;
}

class Query$getNearByCompanies {
  Query$getNearByCompanies({
    required this.delivery_fetch_delivery_company,
    required this.$__typename,
  });

  factory Query$getNearByCompanies.fromJson(Map<String, dynamic> json) {
    final l$delivery_fetch_delivery_company =
        json['delivery_fetch_delivery_company'];
    final l$$__typename = json['__typename'];
    return Query$getNearByCompanies(
      delivery_fetch_delivery_company: (l$delivery_fetch_delivery_company
              as List<dynamic>)
          .map((e) =>
              Query$getNearByCompanies$delivery_fetch_delivery_company.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getNearByCompanies$delivery_fetch_delivery_company>
      delivery_fetch_delivery_company;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delivery_fetch_delivery_company = delivery_fetch_delivery_company;
    _resultData['delivery_fetch_delivery_company'] =
        l$delivery_fetch_delivery_company.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delivery_fetch_delivery_company = delivery_fetch_delivery_company;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$delivery_fetch_delivery_company.map((v) => v)),
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
    final l$delivery_fetch_delivery_company = delivery_fetch_delivery_company;
    final lOther$delivery_fetch_delivery_company =
        other.delivery_fetch_delivery_company;
    if (l$delivery_fetch_delivery_company.length !=
        lOther$delivery_fetch_delivery_company.length) {
      return false;
    }
    for (int i = 0; i < l$delivery_fetch_delivery_company.length; i++) {
      final l$delivery_fetch_delivery_company$entry =
          l$delivery_fetch_delivery_company[i];
      final lOther$delivery_fetch_delivery_company$entry =
          lOther$delivery_fetch_delivery_company[i];
      if (l$delivery_fetch_delivery_company$entry !=
          lOther$delivery_fetch_delivery_company$entry) {
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
    List<Query$getNearByCompanies$delivery_fetch_delivery_company>?
        delivery_fetch_delivery_company,
    String? $__typename,
  });
  TRes delivery_fetch_delivery_company(
      Iterable<Query$getNearByCompanies$delivery_fetch_delivery_company> Function(
              Iterable<
                  CopyWith$Query$getNearByCompanies$delivery_fetch_delivery_company<
                      Query$getNearByCompanies$delivery_fetch_delivery_company>>)
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
    Object? delivery_fetch_delivery_company = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getNearByCompanies(
        delivery_fetch_delivery_company:
            delivery_fetch_delivery_company == _undefined ||
                    delivery_fetch_delivery_company == null
                ? _instance.delivery_fetch_delivery_company
                : (delivery_fetch_delivery_company as List<
                    Query$getNearByCompanies$delivery_fetch_delivery_company>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes delivery_fetch_delivery_company(
          Iterable<Query$getNearByCompanies$delivery_fetch_delivery_company> Function(
                  Iterable<
                      CopyWith$Query$getNearByCompanies$delivery_fetch_delivery_company<
                          Query$getNearByCompanies$delivery_fetch_delivery_company>>)
              _fn) =>
      call(
          delivery_fetch_delivery_company: _fn(
              _instance.delivery_fetch_delivery_company.map((e) =>
                  CopyWith$Query$getNearByCompanies$delivery_fetch_delivery_company(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getNearByCompanies<TRes>
    implements CopyWith$Query$getNearByCompanies<TRes> {
  _CopyWithStubImpl$Query$getNearByCompanies(this._res);

  TRes _res;

  call({
    List<Query$getNearByCompanies$delivery_fetch_delivery_company>?
        delivery_fetch_delivery_company,
    String? $__typename,
  }) =>
      _res;
  delivery_fetch_delivery_company(_fn) => _res;
}

const documentNodeQuerygetNearByCompanies = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getNearByCompanies'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'args')),
        type: NamedTypeNode(
          name: NameNode(value: 'delivery_fetch_delivery_company_args'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'delivery_fetch_delivery_company'),
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
            name: NameNode(value: 'delivery_radius'),
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
            name: NameNode(value: 'location'),
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
            name: NameNode(value: 'open_status'),
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

class Query$getNearByCompanies$delivery_fetch_delivery_company {
  Query$getNearByCompanies$delivery_fetch_delivery_company({
    required this.approved,
    required this.creation_time,
    required this.delivery_radius,
    required this.id,
    this.description_id,
    required this.image,
    required this.location,
    required this.service_provider_type,
    required this.open_status,
    required this.name,
    this.description,
    required this.$__typename,
  });

  factory Query$getNearByCompanies$delivery_fetch_delivery_company.fromJson(
      Map<String, dynamic> json) {
    final l$approved = json['approved'];
    final l$creation_time = json['creation_time'];
    final l$delivery_radius = json['delivery_radius'];
    final l$id = json['id'];
    final l$description_id = json['description_id'];
    final l$image = json['image'];
    final l$location = json['location'];
    final l$service_provider_type = json['service_provider_type'];
    final l$open_status = json['open_status'];
    final l$name = json['name'];
    final l$description = json['description'];
    final l$$__typename = json['__typename'];
    return Query$getNearByCompanies$delivery_fetch_delivery_company(
      approved: (l$approved as bool),
      creation_time: (l$creation_time as String),
      delivery_radius: (l$delivery_radius as int),
      id: (l$id as int),
      description_id: (l$description_id as int?),
      image: (l$image as String),
      location: geographyFromJson(l$location),
      service_provider_type: (l$service_provider_type as String),
      open_status: (l$open_status as String),
      name: (l$name as String),
      description: l$description == null
          ? null
          : Query$getNearByCompanies$delivery_fetch_delivery_company$description
              .fromJson((l$description as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final bool approved;

  final String creation_time;

  final int delivery_radius;

  final int id;

  final int? description_id;

  final String image;

  final Geography location;

  final String service_provider_type;

  final String open_status;

  final String name;

  final Query$getNearByCompanies$delivery_fetch_delivery_company$description?
      description;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$approved = approved;
    _resultData['approved'] = l$approved;
    final l$creation_time = creation_time;
    _resultData['creation_time'] = l$creation_time;
    final l$delivery_radius = delivery_radius;
    _resultData['delivery_radius'] = l$delivery_radius;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$description_id = description_id;
    _resultData['description_id'] = l$description_id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$location = location;
    _resultData['location'] = geographyToJson(l$location);
    final l$service_provider_type = service_provider_type;
    _resultData['service_provider_type'] = l$service_provider_type;
    final l$open_status = open_status;
    _resultData['open_status'] = l$open_status;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$approved = approved;
    final l$creation_time = creation_time;
    final l$delivery_radius = delivery_radius;
    final l$id = id;
    final l$description_id = description_id;
    final l$image = image;
    final l$location = location;
    final l$service_provider_type = service_provider_type;
    final l$open_status = open_status;
    final l$name = name;
    final l$description = description;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$approved,
      l$creation_time,
      l$delivery_radius,
      l$id,
      l$description_id,
      l$image,
      l$location,
      l$service_provider_type,
      l$open_status,
      l$name,
      l$description,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getNearByCompanies$delivery_fetch_delivery_company) ||
        runtimeType != other.runtimeType) {
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
    final l$delivery_radius = delivery_radius;
    final lOther$delivery_radius = other.delivery_radius;
    if (l$delivery_radius != lOther$delivery_radius) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
    final l$location = location;
    final lOther$location = other.location;
    if (l$location != lOther$location) {
      return false;
    }
    final l$service_provider_type = service_provider_type;
    final lOther$service_provider_type = other.service_provider_type;
    if (l$service_provider_type != lOther$service_provider_type) {
      return false;
    }
    final l$open_status = open_status;
    final lOther$open_status = other.open_status;
    if (l$open_status != lOther$open_status) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getNearByCompanies$delivery_fetch_delivery_company
    on Query$getNearByCompanies$delivery_fetch_delivery_company {
  CopyWith$Query$getNearByCompanies$delivery_fetch_delivery_company<
          Query$getNearByCompanies$delivery_fetch_delivery_company>
      get copyWith =>
          CopyWith$Query$getNearByCompanies$delivery_fetch_delivery_company(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getNearByCompanies$delivery_fetch_delivery_company<
    TRes> {
  factory CopyWith$Query$getNearByCompanies$delivery_fetch_delivery_company(
    Query$getNearByCompanies$delivery_fetch_delivery_company instance,
    TRes Function(Query$getNearByCompanies$delivery_fetch_delivery_company)
        then,
  ) = _CopyWithImpl$Query$getNearByCompanies$delivery_fetch_delivery_company;

  factory CopyWith$Query$getNearByCompanies$delivery_fetch_delivery_company.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getNearByCompanies$delivery_fetch_delivery_company;

  TRes call({
    bool? approved,
    String? creation_time,
    int? delivery_radius,
    int? id,
    int? description_id,
    String? image,
    Geography? location,
    String? service_provider_type,
    String? open_status,
    String? name,
    Query$getNearByCompanies$delivery_fetch_delivery_company$description?
        description,
    String? $__typename,
  });
  CopyWith$Query$getNearByCompanies$delivery_fetch_delivery_company$description<
      TRes> get description;
}

class _CopyWithImpl$Query$getNearByCompanies$delivery_fetch_delivery_company<
        TRes>
    implements
        CopyWith$Query$getNearByCompanies$delivery_fetch_delivery_company<
            TRes> {
  _CopyWithImpl$Query$getNearByCompanies$delivery_fetch_delivery_company(
    this._instance,
    this._then,
  );

  final Query$getNearByCompanies$delivery_fetch_delivery_company _instance;

  final TRes Function(Query$getNearByCompanies$delivery_fetch_delivery_company)
      _then;

  static const _undefined = {};

  TRes call({
    Object? approved = _undefined,
    Object? creation_time = _undefined,
    Object? delivery_radius = _undefined,
    Object? id = _undefined,
    Object? description_id = _undefined,
    Object? image = _undefined,
    Object? location = _undefined,
    Object? service_provider_type = _undefined,
    Object? open_status = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getNearByCompanies$delivery_fetch_delivery_company(
        approved: approved == _undefined || approved == null
            ? _instance.approved
            : (approved as bool),
        creation_time: creation_time == _undefined || creation_time == null
            ? _instance.creation_time
            : (creation_time as String),
        delivery_radius:
            delivery_radius == _undefined || delivery_radius == null
                ? _instance.delivery_radius
                : (delivery_radius as int),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        description_id: description_id == _undefined
            ? _instance.description_id
            : (description_id as int?),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        location: location == _undefined || location == null
            ? _instance.location
            : (location as Geography),
        service_provider_type:
            service_provider_type == _undefined || service_provider_type == null
                ? _instance.service_provider_type
                : (service_provider_type as String),
        open_status: open_status == _undefined || open_status == null
            ? _instance.open_status
            : (open_status as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        description: description == _undefined
            ? _instance.description
            : (description
                as Query$getNearByCompanies$delivery_fetch_delivery_company$description?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getNearByCompanies$delivery_fetch_delivery_company$description<
      TRes> get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Query$getNearByCompanies$delivery_fetch_delivery_company$description
            .stub(_then(_instance))
        : CopyWith$Query$getNearByCompanies$delivery_fetch_delivery_company$description(
            local$description, (e) => call(description: e));
  }
}

class _CopyWithStubImpl$Query$getNearByCompanies$delivery_fetch_delivery_company<
        TRes>
    implements
        CopyWith$Query$getNearByCompanies$delivery_fetch_delivery_company<
            TRes> {
  _CopyWithStubImpl$Query$getNearByCompanies$delivery_fetch_delivery_company(
      this._res);

  TRes _res;

  call({
    bool? approved,
    String? creation_time,
    int? delivery_radius,
    int? id,
    int? description_id,
    String? image,
    Geography? location,
    String? service_provider_type,
    String? open_status,
    String? name,
    Query$getNearByCompanies$delivery_fetch_delivery_company$description?
        description,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getNearByCompanies$delivery_fetch_delivery_company$description<
          TRes>
      get description =>
          CopyWith$Query$getNearByCompanies$delivery_fetch_delivery_company$description
              .stub(_res);
}

class Query$getNearByCompanies$delivery_fetch_delivery_company$description {
  Query$getNearByCompanies$delivery_fetch_delivery_company$description({
    required this.translations,
    required this.$__typename,
  });

  factory Query$getNearByCompanies$delivery_fetch_delivery_company$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getNearByCompanies$delivery_fetch_delivery_company$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getNearByCompanies$delivery_fetch_delivery_company$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$getNearByCompanies$delivery_fetch_delivery_company$description$translations>
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
            is Query$getNearByCompanies$delivery_fetch_delivery_company$description) ||
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

extension UtilityExtension$Query$getNearByCompanies$delivery_fetch_delivery_company$description
    on Query$getNearByCompanies$delivery_fetch_delivery_company$description {
  CopyWith$Query$getNearByCompanies$delivery_fetch_delivery_company$description<
          Query$getNearByCompanies$delivery_fetch_delivery_company$description>
      get copyWith =>
          CopyWith$Query$getNearByCompanies$delivery_fetch_delivery_company$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getNearByCompanies$delivery_fetch_delivery_company$description<
    TRes> {
  factory CopyWith$Query$getNearByCompanies$delivery_fetch_delivery_company$description(
    Query$getNearByCompanies$delivery_fetch_delivery_company$description
        instance,
    TRes Function(
            Query$getNearByCompanies$delivery_fetch_delivery_company$description)
        then,
  ) = _CopyWithImpl$Query$getNearByCompanies$delivery_fetch_delivery_company$description;

  factory CopyWith$Query$getNearByCompanies$delivery_fetch_delivery_company$description.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getNearByCompanies$delivery_fetch_delivery_company$description;

  TRes call({
    List<Query$getNearByCompanies$delivery_fetch_delivery_company$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getNearByCompanies$delivery_fetch_delivery_company$description$translations> Function(
              Iterable<
                  CopyWith$Query$getNearByCompanies$delivery_fetch_delivery_company$description$translations<
                      Query$getNearByCompanies$delivery_fetch_delivery_company$description$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getNearByCompanies$delivery_fetch_delivery_company$description<
        TRes>
    implements
        CopyWith$Query$getNearByCompanies$delivery_fetch_delivery_company$description<
            TRes> {
  _CopyWithImpl$Query$getNearByCompanies$delivery_fetch_delivery_company$description(
    this._instance,
    this._then,
  );

  final Query$getNearByCompanies$delivery_fetch_delivery_company$description
      _instance;

  final TRes Function(
          Query$getNearByCompanies$delivery_fetch_delivery_company$description)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getNearByCompanies$delivery_fetch_delivery_company$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getNearByCompanies$delivery_fetch_delivery_company$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getNearByCompanies$delivery_fetch_delivery_company$description$translations> Function(
                  Iterable<
                      CopyWith$Query$getNearByCompanies$delivery_fetch_delivery_company$description$translations<
                          Query$getNearByCompanies$delivery_fetch_delivery_company$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getNearByCompanies$delivery_fetch_delivery_company$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getNearByCompanies$delivery_fetch_delivery_company$description<
        TRes>
    implements
        CopyWith$Query$getNearByCompanies$delivery_fetch_delivery_company$description<
            TRes> {
  _CopyWithStubImpl$Query$getNearByCompanies$delivery_fetch_delivery_company$description(
      this._res);

  TRes _res;

  call({
    List<Query$getNearByCompanies$delivery_fetch_delivery_company$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getNearByCompanies$delivery_fetch_delivery_company$description$translations {
  Query$getNearByCompanies$delivery_fetch_delivery_company$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getNearByCompanies$delivery_fetch_delivery_company$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getNearByCompanies$delivery_fetch_delivery_company$description$translations(
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
            is Query$getNearByCompanies$delivery_fetch_delivery_company$description$translations) ||
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

extension UtilityExtension$Query$getNearByCompanies$delivery_fetch_delivery_company$description$translations
    on Query$getNearByCompanies$delivery_fetch_delivery_company$description$translations {
  CopyWith$Query$getNearByCompanies$delivery_fetch_delivery_company$description$translations<
          Query$getNearByCompanies$delivery_fetch_delivery_company$description$translations>
      get copyWith =>
          CopyWith$Query$getNearByCompanies$delivery_fetch_delivery_company$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getNearByCompanies$delivery_fetch_delivery_company$description$translations<
    TRes> {
  factory CopyWith$Query$getNearByCompanies$delivery_fetch_delivery_company$description$translations(
    Query$getNearByCompanies$delivery_fetch_delivery_company$description$translations
        instance,
    TRes Function(
            Query$getNearByCompanies$delivery_fetch_delivery_company$description$translations)
        then,
  ) = _CopyWithImpl$Query$getNearByCompanies$delivery_fetch_delivery_company$description$translations;

  factory CopyWith$Query$getNearByCompanies$delivery_fetch_delivery_company$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getNearByCompanies$delivery_fetch_delivery_company$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getNearByCompanies$delivery_fetch_delivery_company$description$translations<
        TRes>
    implements
        CopyWith$Query$getNearByCompanies$delivery_fetch_delivery_company$description$translations<
            TRes> {
  _CopyWithImpl$Query$getNearByCompanies$delivery_fetch_delivery_company$description$translations(
    this._instance,
    this._then,
  );

  final Query$getNearByCompanies$delivery_fetch_delivery_company$description$translations
      _instance;

  final TRes Function(
          Query$getNearByCompanies$delivery_fetch_delivery_company$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getNearByCompanies$delivery_fetch_delivery_company$description$translations(
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

class _CopyWithStubImpl$Query$getNearByCompanies$delivery_fetch_delivery_company$description$translations<
        TRes>
    implements
        CopyWith$Query$getNearByCompanies$delivery_fetch_delivery_company$description$translations<
            TRes> {
  _CopyWithStubImpl$Query$getNearByCompanies$delivery_fetch_delivery_company$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}
