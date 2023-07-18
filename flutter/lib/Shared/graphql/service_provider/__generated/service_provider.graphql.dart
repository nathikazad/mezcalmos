import '../../__generated/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Variables$Query$getServiceProviderLinks {
  factory Variables$Query$getServiceProviderLinks(
          {required int serviceLinkId}) =>
      Variables$Query$getServiceProviderLinks._({
        r'serviceLinkId': serviceLinkId,
      });

  Variables$Query$getServiceProviderLinks._(this._$data);

  factory Variables$Query$getServiceProviderLinks.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$serviceLinkId = data['serviceLinkId'];
    result$data['serviceLinkId'] = (l$serviceLinkId as int);
    return Variables$Query$getServiceProviderLinks._(result$data);
  }

  Map<String, dynamic> _$data;

  int get serviceLinkId => (_$data['serviceLinkId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$serviceLinkId = serviceLinkId;
    result$data['serviceLinkId'] = l$serviceLinkId;
    return result$data;
  }

  CopyWith$Variables$Query$getServiceProviderLinks<
          Variables$Query$getServiceProviderLinks>
      get copyWith => CopyWith$Variables$Query$getServiceProviderLinks(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getServiceProviderLinks) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$serviceLinkId = serviceLinkId;
    final lOther$serviceLinkId = other.serviceLinkId;
    if (l$serviceLinkId != lOther$serviceLinkId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$serviceLinkId = serviceLinkId;
    return Object.hashAll([l$serviceLinkId]);
  }
}

abstract class CopyWith$Variables$Query$getServiceProviderLinks<TRes> {
  factory CopyWith$Variables$Query$getServiceProviderLinks(
    Variables$Query$getServiceProviderLinks instance,
    TRes Function(Variables$Query$getServiceProviderLinks) then,
  ) = _CopyWithImpl$Variables$Query$getServiceProviderLinks;

  factory CopyWith$Variables$Query$getServiceProviderLinks.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getServiceProviderLinks;

  TRes call({int? serviceLinkId});
}

class _CopyWithImpl$Variables$Query$getServiceProviderLinks<TRes>
    implements CopyWith$Variables$Query$getServiceProviderLinks<TRes> {
  _CopyWithImpl$Variables$Query$getServiceProviderLinks(
    this._instance,
    this._then,
  );

  final Variables$Query$getServiceProviderLinks _instance;

  final TRes Function(Variables$Query$getServiceProviderLinks) _then;

  static const _undefined = {};

  TRes call({Object? serviceLinkId = _undefined}) =>
      _then(Variables$Query$getServiceProviderLinks._({
        ..._instance._$data,
        if (serviceLinkId != _undefined && serviceLinkId != null)
          'serviceLinkId': (serviceLinkId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getServiceProviderLinks<TRes>
    implements CopyWith$Variables$Query$getServiceProviderLinks<TRes> {
  _CopyWithStubImpl$Variables$Query$getServiceProviderLinks(this._res);

  TRes _res;

  call({int? serviceLinkId}) => _res;
}

class Query$getServiceProviderLinks {
  Query$getServiceProviderLinks({
    this.service_provider_service_link_by_pk,
    required this.$__typename,
  });

  factory Query$getServiceProviderLinks.fromJson(Map<String, dynamic> json) {
    final l$service_provider_service_link_by_pk =
        json['service_provider_service_link_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$getServiceProviderLinks(
      service_provider_service_link_by_pk:
          l$service_provider_service_link_by_pk == null
              ? null
              : Query$getServiceProviderLinks$service_provider_service_link_by_pk
                  .fromJson((l$service_provider_service_link_by_pk
                      as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getServiceProviderLinks$service_provider_service_link_by_pk?
      service_provider_service_link_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$service_provider_service_link_by_pk =
        service_provider_service_link_by_pk;
    _resultData['service_provider_service_link_by_pk'] =
        l$service_provider_service_link_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$service_provider_service_link_by_pk =
        service_provider_service_link_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$service_provider_service_link_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getServiceProviderLinks) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$service_provider_service_link_by_pk =
        service_provider_service_link_by_pk;
    final lOther$service_provider_service_link_by_pk =
        other.service_provider_service_link_by_pk;
    if (l$service_provider_service_link_by_pk !=
        lOther$service_provider_service_link_by_pk) {
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

extension UtilityExtension$Query$getServiceProviderLinks
    on Query$getServiceProviderLinks {
  CopyWith$Query$getServiceProviderLinks<Query$getServiceProviderLinks>
      get copyWith => CopyWith$Query$getServiceProviderLinks(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getServiceProviderLinks<TRes> {
  factory CopyWith$Query$getServiceProviderLinks(
    Query$getServiceProviderLinks instance,
    TRes Function(Query$getServiceProviderLinks) then,
  ) = _CopyWithImpl$Query$getServiceProviderLinks;

  factory CopyWith$Query$getServiceProviderLinks.stub(TRes res) =
      _CopyWithStubImpl$Query$getServiceProviderLinks;

  TRes call({
    Query$getServiceProviderLinks$service_provider_service_link_by_pk?
        service_provider_service_link_by_pk,
    String? $__typename,
  });
  CopyWith$Query$getServiceProviderLinks$service_provider_service_link_by_pk<
      TRes> get service_provider_service_link_by_pk;
}

class _CopyWithImpl$Query$getServiceProviderLinks<TRes>
    implements CopyWith$Query$getServiceProviderLinks<TRes> {
  _CopyWithImpl$Query$getServiceProviderLinks(
    this._instance,
    this._then,
  );

  final Query$getServiceProviderLinks _instance;

  final TRes Function(Query$getServiceProviderLinks) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_service_link_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getServiceProviderLinks(
        service_provider_service_link_by_pk: service_provider_service_link_by_pk ==
                _undefined
            ? _instance.service_provider_service_link_by_pk
            : (service_provider_service_link_by_pk
                as Query$getServiceProviderLinks$service_provider_service_link_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getServiceProviderLinks$service_provider_service_link_by_pk<
      TRes> get service_provider_service_link_by_pk {
    final local$service_provider_service_link_by_pk =
        _instance.service_provider_service_link_by_pk;
    return local$service_provider_service_link_by_pk == null
        ? CopyWith$Query$getServiceProviderLinks$service_provider_service_link_by_pk
            .stub(_then(_instance))
        : CopyWith$Query$getServiceProviderLinks$service_provider_service_link_by_pk(
            local$service_provider_service_link_by_pk,
            (e) => call(service_provider_service_link_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$getServiceProviderLinks<TRes>
    implements CopyWith$Query$getServiceProviderLinks<TRes> {
  _CopyWithStubImpl$Query$getServiceProviderLinks(this._res);

  TRes _res;

  call({
    Query$getServiceProviderLinks$service_provider_service_link_by_pk?
        service_provider_service_link_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getServiceProviderLinks$service_provider_service_link_by_pk<
          TRes>
      get service_provider_service_link_by_pk =>
          CopyWith$Query$getServiceProviderLinks$service_provider_service_link_by_pk
              .stub(_res);
}

const documentNodeQuerygetServiceProviderLinks = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getServiceProviderLinks'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'serviceLinkId')),
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
        name: NameNode(value: 'service_provider_service_link_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'serviceLinkId')),
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
            name: NameNode(value: 'driver_deep_link'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'driver_qr_image_link'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'operator_deep_link'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'operator_qr_image_link'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'customer_deep_link'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'customer_qr_image_link'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'customer_flyer_links'),
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
Query$getServiceProviderLinks _parserFn$Query$getServiceProviderLinks(
        Map<String, dynamic> data) =>
    Query$getServiceProviderLinks.fromJson(data);

class Options$Query$getServiceProviderLinks
    extends graphql.QueryOptions<Query$getServiceProviderLinks> {
  Options$Query$getServiceProviderLinks({
    String? operationName,
    required Variables$Query$getServiceProviderLinks variables,
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
          document: documentNodeQuerygetServiceProviderLinks,
          parserFn: _parserFn$Query$getServiceProviderLinks,
        );
}

class WatchOptions$Query$getServiceProviderLinks
    extends graphql.WatchQueryOptions<Query$getServiceProviderLinks> {
  WatchOptions$Query$getServiceProviderLinks({
    String? operationName,
    required Variables$Query$getServiceProviderLinks variables,
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
          document: documentNodeQuerygetServiceProviderLinks,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getServiceProviderLinks,
        );
}

class FetchMoreOptions$Query$getServiceProviderLinks
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getServiceProviderLinks({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getServiceProviderLinks variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetServiceProviderLinks,
        );
}

extension ClientExtension$Query$getServiceProviderLinks
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getServiceProviderLinks>>
      query$getServiceProviderLinks(
              Options$Query$getServiceProviderLinks options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getServiceProviderLinks>
      watchQuery$getServiceProviderLinks(
              WatchOptions$Query$getServiceProviderLinks options) =>
          this.watchQuery(options);
  void writeQuery$getServiceProviderLinks({
    required Query$getServiceProviderLinks data,
    required Variables$Query$getServiceProviderLinks variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetServiceProviderLinks),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getServiceProviderLinks? readQuery$getServiceProviderLinks({
    required Variables$Query$getServiceProviderLinks variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQuerygetServiceProviderLinks),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$getServiceProviderLinks.fromJson(result);
  }
}

class Query$getServiceProviderLinks$service_provider_service_link_by_pk {
  Query$getServiceProviderLinks$service_provider_service_link_by_pk({
    required this.id,
    this.driver_deep_link,
    this.driver_qr_image_link,
    this.operator_deep_link,
    this.operator_qr_image_link,
    this.customer_deep_link,
    this.customer_qr_image_link,
    this.customer_flyer_links,
    required this.$__typename,
  });

  factory Query$getServiceProviderLinks$service_provider_service_link_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$driver_deep_link = json['driver_deep_link'];
    final l$driver_qr_image_link = json['driver_qr_image_link'];
    final l$operator_deep_link = json['operator_deep_link'];
    final l$operator_qr_image_link = json['operator_qr_image_link'];
    final l$customer_deep_link = json['customer_deep_link'];
    final l$customer_qr_image_link = json['customer_qr_image_link'];
    final l$customer_flyer_links = json['customer_flyer_links'];
    final l$$__typename = json['__typename'];
    return Query$getServiceProviderLinks$service_provider_service_link_by_pk(
      id: (l$id as int),
      driver_deep_link: (l$driver_deep_link as String?),
      driver_qr_image_link: (l$driver_qr_image_link as String?),
      operator_deep_link: (l$operator_deep_link as String?),
      operator_qr_image_link: (l$operator_qr_image_link as String?),
      customer_deep_link: (l$customer_deep_link as String?),
      customer_qr_image_link: (l$customer_qr_image_link as String?),
      customer_flyer_links: l$customer_flyer_links == null
          ? null
          : mapFromJson(l$customer_flyer_links),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? driver_deep_link;

  final String? driver_qr_image_link;

  final String? operator_deep_link;

  final String? operator_qr_image_link;

  final String? customer_deep_link;

  final String? customer_qr_image_link;

  final dynamic? customer_flyer_links;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$driver_deep_link = driver_deep_link;
    _resultData['driver_deep_link'] = l$driver_deep_link;
    final l$driver_qr_image_link = driver_qr_image_link;
    _resultData['driver_qr_image_link'] = l$driver_qr_image_link;
    final l$operator_deep_link = operator_deep_link;
    _resultData['operator_deep_link'] = l$operator_deep_link;
    final l$operator_qr_image_link = operator_qr_image_link;
    _resultData['operator_qr_image_link'] = l$operator_qr_image_link;
    final l$customer_deep_link = customer_deep_link;
    _resultData['customer_deep_link'] = l$customer_deep_link;
    final l$customer_qr_image_link = customer_qr_image_link;
    _resultData['customer_qr_image_link'] = l$customer_qr_image_link;
    final l$customer_flyer_links = customer_flyer_links;
    _resultData['customer_flyer_links'] = l$customer_flyer_links == null
        ? null
        : mapToJson(l$customer_flyer_links);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$driver_deep_link = driver_deep_link;
    final l$driver_qr_image_link = driver_qr_image_link;
    final l$operator_deep_link = operator_deep_link;
    final l$operator_qr_image_link = operator_qr_image_link;
    final l$customer_deep_link = customer_deep_link;
    final l$customer_qr_image_link = customer_qr_image_link;
    final l$customer_flyer_links = customer_flyer_links;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$driver_deep_link,
      l$driver_qr_image_link,
      l$operator_deep_link,
      l$operator_qr_image_link,
      l$customer_deep_link,
      l$customer_qr_image_link,
      l$customer_flyer_links,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getServiceProviderLinks$service_provider_service_link_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$driver_deep_link = driver_deep_link;
    final lOther$driver_deep_link = other.driver_deep_link;
    if (l$driver_deep_link != lOther$driver_deep_link) {
      return false;
    }
    final l$driver_qr_image_link = driver_qr_image_link;
    final lOther$driver_qr_image_link = other.driver_qr_image_link;
    if (l$driver_qr_image_link != lOther$driver_qr_image_link) {
      return false;
    }
    final l$operator_deep_link = operator_deep_link;
    final lOther$operator_deep_link = other.operator_deep_link;
    if (l$operator_deep_link != lOther$operator_deep_link) {
      return false;
    }
    final l$operator_qr_image_link = operator_qr_image_link;
    final lOther$operator_qr_image_link = other.operator_qr_image_link;
    if (l$operator_qr_image_link != lOther$operator_qr_image_link) {
      return false;
    }
    final l$customer_deep_link = customer_deep_link;
    final lOther$customer_deep_link = other.customer_deep_link;
    if (l$customer_deep_link != lOther$customer_deep_link) {
      return false;
    }
    final l$customer_qr_image_link = customer_qr_image_link;
    final lOther$customer_qr_image_link = other.customer_qr_image_link;
    if (l$customer_qr_image_link != lOther$customer_qr_image_link) {
      return false;
    }
    final l$customer_flyer_links = customer_flyer_links;
    final lOther$customer_flyer_links = other.customer_flyer_links;
    if (l$customer_flyer_links != lOther$customer_flyer_links) {
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

extension UtilityExtension$Query$getServiceProviderLinks$service_provider_service_link_by_pk
    on Query$getServiceProviderLinks$service_provider_service_link_by_pk {
  CopyWith$Query$getServiceProviderLinks$service_provider_service_link_by_pk<
          Query$getServiceProviderLinks$service_provider_service_link_by_pk>
      get copyWith =>
          CopyWith$Query$getServiceProviderLinks$service_provider_service_link_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getServiceProviderLinks$service_provider_service_link_by_pk<
    TRes> {
  factory CopyWith$Query$getServiceProviderLinks$service_provider_service_link_by_pk(
    Query$getServiceProviderLinks$service_provider_service_link_by_pk instance,
    TRes Function(
            Query$getServiceProviderLinks$service_provider_service_link_by_pk)
        then,
  ) = _CopyWithImpl$Query$getServiceProviderLinks$service_provider_service_link_by_pk;

  factory CopyWith$Query$getServiceProviderLinks$service_provider_service_link_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getServiceProviderLinks$service_provider_service_link_by_pk;

  TRes call({
    int? id,
    String? driver_deep_link,
    String? driver_qr_image_link,
    String? operator_deep_link,
    String? operator_qr_image_link,
    String? customer_deep_link,
    String? customer_qr_image_link,
    dynamic? customer_flyer_links,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getServiceProviderLinks$service_provider_service_link_by_pk<
        TRes>
    implements
        CopyWith$Query$getServiceProviderLinks$service_provider_service_link_by_pk<
            TRes> {
  _CopyWithImpl$Query$getServiceProviderLinks$service_provider_service_link_by_pk(
    this._instance,
    this._then,
  );

  final Query$getServiceProviderLinks$service_provider_service_link_by_pk
      _instance;

  final TRes Function(
      Query$getServiceProviderLinks$service_provider_service_link_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? driver_deep_link = _undefined,
    Object? driver_qr_image_link = _undefined,
    Object? operator_deep_link = _undefined,
    Object? operator_qr_image_link = _undefined,
    Object? customer_deep_link = _undefined,
    Object? customer_qr_image_link = _undefined,
    Object? customer_flyer_links = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getServiceProviderLinks$service_provider_service_link_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        driver_deep_link: driver_deep_link == _undefined
            ? _instance.driver_deep_link
            : (driver_deep_link as String?),
        driver_qr_image_link: driver_qr_image_link == _undefined
            ? _instance.driver_qr_image_link
            : (driver_qr_image_link as String?),
        operator_deep_link: operator_deep_link == _undefined
            ? _instance.operator_deep_link
            : (operator_deep_link as String?),
        operator_qr_image_link: operator_qr_image_link == _undefined
            ? _instance.operator_qr_image_link
            : (operator_qr_image_link as String?),
        customer_deep_link: customer_deep_link == _undefined
            ? _instance.customer_deep_link
            : (customer_deep_link as String?),
        customer_qr_image_link: customer_qr_image_link == _undefined
            ? _instance.customer_qr_image_link
            : (customer_qr_image_link as String?),
        customer_flyer_links: customer_flyer_links == _undefined
            ? _instance.customer_flyer_links
            : (customer_flyer_links as dynamic?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getServiceProviderLinks$service_provider_service_link_by_pk<
        TRes>
    implements
        CopyWith$Query$getServiceProviderLinks$service_provider_service_link_by_pk<
            TRes> {
  _CopyWithStubImpl$Query$getServiceProviderLinks$service_provider_service_link_by_pk(
      this._res);

  TRes _res;

  call({
    int? id,
    String? driver_deep_link,
    String? driver_qr_image_link,
    String? operator_deep_link,
    String? operator_qr_image_link,
    String? customer_deep_link,
    String? customer_qr_image_link,
    dynamic? customer_flyer_links,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getServiceDetails {
  factory Variables$Query$getServiceDetails({required int id}) =>
      Variables$Query$getServiceDetails._({
        r'id': id,
      });

  Variables$Query$getServiceDetails._(this._$data);

  factory Variables$Query$getServiceDetails.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    return Variables$Query$getServiceDetails._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$getServiceDetails<Variables$Query$getServiceDetails>
      get copyWith => CopyWith$Variables$Query$getServiceDetails(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getServiceDetails) ||
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

abstract class CopyWith$Variables$Query$getServiceDetails<TRes> {
  factory CopyWith$Variables$Query$getServiceDetails(
    Variables$Query$getServiceDetails instance,
    TRes Function(Variables$Query$getServiceDetails) then,
  ) = _CopyWithImpl$Variables$Query$getServiceDetails;

  factory CopyWith$Variables$Query$getServiceDetails.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getServiceDetails;

  TRes call({int? id});
}

class _CopyWithImpl$Variables$Query$getServiceDetails<TRes>
    implements CopyWith$Variables$Query$getServiceDetails<TRes> {
  _CopyWithImpl$Variables$Query$getServiceDetails(
    this._instance,
    this._then,
  );

  final Variables$Query$getServiceDetails _instance;

  final TRes Function(Variables$Query$getServiceDetails) _then;

  static const _undefined = {};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$getServiceDetails._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getServiceDetails<TRes>
    implements CopyWith$Variables$Query$getServiceDetails<TRes> {
  _CopyWithStubImpl$Variables$Query$getServiceDetails(this._res);

  TRes _res;

  call({int? id}) => _res;
}

class Query$getServiceDetails {
  Query$getServiceDetails({
    this.service_provider_details_by_pk,
    required this.$__typename,
  });

  factory Query$getServiceDetails.fromJson(Map<String, dynamic> json) {
    final l$service_provider_details_by_pk =
        json['service_provider_details_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$getServiceDetails(
      service_provider_details_by_pk: l$service_provider_details_by_pk == null
          ? null
          : Query$getServiceDetails$service_provider_details_by_pk.fromJson(
              (l$service_provider_details_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getServiceDetails$service_provider_details_by_pk?
      service_provider_details_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$service_provider_details_by_pk = service_provider_details_by_pk;
    _resultData['service_provider_details_by_pk'] =
        l$service_provider_details_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$service_provider_details_by_pk = service_provider_details_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$service_provider_details_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getServiceDetails) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$service_provider_details_by_pk = service_provider_details_by_pk;
    final lOther$service_provider_details_by_pk =
        other.service_provider_details_by_pk;
    if (l$service_provider_details_by_pk !=
        lOther$service_provider_details_by_pk) {
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

extension UtilityExtension$Query$getServiceDetails on Query$getServiceDetails {
  CopyWith$Query$getServiceDetails<Query$getServiceDetails> get copyWith =>
      CopyWith$Query$getServiceDetails(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getServiceDetails<TRes> {
  factory CopyWith$Query$getServiceDetails(
    Query$getServiceDetails instance,
    TRes Function(Query$getServiceDetails) then,
  ) = _CopyWithImpl$Query$getServiceDetails;

  factory CopyWith$Query$getServiceDetails.stub(TRes res) =
      _CopyWithStubImpl$Query$getServiceDetails;

  TRes call({
    Query$getServiceDetails$service_provider_details_by_pk?
        service_provider_details_by_pk,
    String? $__typename,
  });
  CopyWith$Query$getServiceDetails$service_provider_details_by_pk<TRes>
      get service_provider_details_by_pk;
}

class _CopyWithImpl$Query$getServiceDetails<TRes>
    implements CopyWith$Query$getServiceDetails<TRes> {
  _CopyWithImpl$Query$getServiceDetails(
    this._instance,
    this._then,
  );

  final Query$getServiceDetails _instance;

  final TRes Function(Query$getServiceDetails) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_details_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getServiceDetails(
        service_provider_details_by_pk:
            service_provider_details_by_pk == _undefined
                ? _instance.service_provider_details_by_pk
                : (service_provider_details_by_pk
                    as Query$getServiceDetails$service_provider_details_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getServiceDetails$service_provider_details_by_pk<TRes>
      get service_provider_details_by_pk {
    final local$service_provider_details_by_pk =
        _instance.service_provider_details_by_pk;
    return local$service_provider_details_by_pk == null
        ? CopyWith$Query$getServiceDetails$service_provider_details_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$getServiceDetails$service_provider_details_by_pk(
            local$service_provider_details_by_pk,
            (e) => call(service_provider_details_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$getServiceDetails<TRes>
    implements CopyWith$Query$getServiceDetails<TRes> {
  _CopyWithStubImpl$Query$getServiceDetails(this._res);

  TRes _res;

  call({
    Query$getServiceDetails$service_provider_details_by_pk?
        service_provider_details_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getServiceDetails$service_provider_details_by_pk<TRes>
      get service_provider_details_by_pk =>
          CopyWith$Query$getServiceDetails$service_provider_details_by_pk.stub(
              _res);
}

const documentNodeQuerygetServiceDetails = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getServiceDetails'),
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
        name: NameNode(value: 'service_provider_details_by_pk'),
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
            name: NameNode(value: 'unique_id'),
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
            name: NameNode(value: 'approved'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'is_open'),
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
            name: NameNode(value: 'description_id'),
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
            name: NameNode(value: 'language'),
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
            name: NameNode(value: 'phone_number'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'online_ordering'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'service_link_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'stripe_info'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'charge_fees_on_customer'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'charges_enabled'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'details_submitted'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'email'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'payouts_enabled'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'requirements'),
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
                name: NameNode(value: 'status'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'stripe_id'),
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
            name: NameNode(value: 'service_provider_type'),
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
            name: NameNode(value: 'location'),
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
Query$getServiceDetails _parserFn$Query$getServiceDetails(
        Map<String, dynamic> data) =>
    Query$getServiceDetails.fromJson(data);

class Options$Query$getServiceDetails
    extends graphql.QueryOptions<Query$getServiceDetails> {
  Options$Query$getServiceDetails({
    String? operationName,
    required Variables$Query$getServiceDetails variables,
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
          document: documentNodeQuerygetServiceDetails,
          parserFn: _parserFn$Query$getServiceDetails,
        );
}

class WatchOptions$Query$getServiceDetails
    extends graphql.WatchQueryOptions<Query$getServiceDetails> {
  WatchOptions$Query$getServiceDetails({
    String? operationName,
    required Variables$Query$getServiceDetails variables,
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
          document: documentNodeQuerygetServiceDetails,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getServiceDetails,
        );
}

class FetchMoreOptions$Query$getServiceDetails
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getServiceDetails({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getServiceDetails variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetServiceDetails,
        );
}

extension ClientExtension$Query$getServiceDetails on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getServiceDetails>> query$getServiceDetails(
          Options$Query$getServiceDetails options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$getServiceDetails> watchQuery$getServiceDetails(
          WatchOptions$Query$getServiceDetails options) =>
      this.watchQuery(options);
  void writeQuery$getServiceDetails({
    required Query$getServiceDetails data,
    required Variables$Query$getServiceDetails variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerygetServiceDetails),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getServiceDetails? readQuery$getServiceDetails({
    required Variables$Query$getServiceDetails variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetServiceDetails),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getServiceDetails.fromJson(result);
  }
}

class Query$getServiceDetails$service_provider_details_by_pk {
  Query$getServiceDetails$service_provider_details_by_pk({
    required this.unique_id,
    required this.accepted_payments,
    required this.approved,
    this.is_open,
    required this.creation_time,
    this.description_id,
    this.firebase_id,
    required this.id,
    required this.image,
    required this.language,
    required this.name,
    required this.open_status,
    this.phone_number,
    required this.online_ordering,
    this.service_link_id,
    this.stripe_info,
    required this.service_provider_type,
    this.schedule,
    required this.location,
    this.description,
    required this.$__typename,
  });

  factory Query$getServiceDetails$service_provider_details_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$unique_id = json['unique_id'];
    final l$accepted_payments = json['accepted_payments'];
    final l$approved = json['approved'];
    final l$is_open = json['is_open'];
    final l$creation_time = json['creation_time'];
    final l$description_id = json['description_id'];
    final l$firebase_id = json['firebase_id'];
    final l$id = json['id'];
    final l$image = json['image'];
    final l$language = json['language'];
    final l$name = json['name'];
    final l$open_status = json['open_status'];
    final l$phone_number = json['phone_number'];
    final l$online_ordering = json['online_ordering'];
    final l$service_link_id = json['service_link_id'];
    final l$stripe_info = json['stripe_info'];
    final l$service_provider_type = json['service_provider_type'];
    final l$schedule = json['schedule'];
    final l$location = json['location'];
    final l$description = json['description'];
    final l$$__typename = json['__typename'];
    return Query$getServiceDetails$service_provider_details_by_pk(
      unique_id: (l$unique_id as String),
      accepted_payments: mapFromJson(l$accepted_payments),
      approved: (l$approved as bool),
      is_open: (l$is_open as bool?),
      creation_time: (l$creation_time as String),
      description_id: (l$description_id as int?),
      firebase_id: (l$firebase_id as String?),
      id: (l$id as int),
      image: (l$image as String),
      language: mapFromJson(l$language),
      name: (l$name as String),
      open_status: (l$open_status as String),
      phone_number: (l$phone_number as String?),
      online_ordering: (l$online_ordering as bool),
      service_link_id: (l$service_link_id as int?),
      stripe_info: l$stripe_info == null
          ? null
          : Query$getServiceDetails$service_provider_details_by_pk$stripe_info
              .fromJson((l$stripe_info as Map<String, dynamic>)),
      service_provider_type: (l$service_provider_type as String),
      schedule: l$schedule == null ? null : mapFromJson(l$schedule),
      location: Query$getServiceDetails$service_provider_details_by_pk$location
          .fromJson((l$location as Map<String, dynamic>)),
      description: l$description == null
          ? null
          : Query$getServiceDetails$service_provider_details_by_pk$description
              .fromJson((l$description as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String unique_id;

  final dynamic accepted_payments;

  final bool approved;

  final bool? is_open;

  final String creation_time;

  final int? description_id;

  final String? firebase_id;

  final int id;

  final String image;

  final dynamic language;

  final String name;

  final String open_status;

  final String? phone_number;

  final bool online_ordering;

  final int? service_link_id;

  final Query$getServiceDetails$service_provider_details_by_pk$stripe_info?
      stripe_info;

  final String service_provider_type;

  final dynamic? schedule;

  final Query$getServiceDetails$service_provider_details_by_pk$location
      location;

  final Query$getServiceDetails$service_provider_details_by_pk$description?
      description;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$unique_id = unique_id;
    _resultData['unique_id'] = l$unique_id;
    final l$accepted_payments = accepted_payments;
    _resultData['accepted_payments'] = mapToJson(l$accepted_payments);
    final l$approved = approved;
    _resultData['approved'] = l$approved;
    final l$is_open = is_open;
    _resultData['is_open'] = l$is_open;
    final l$creation_time = creation_time;
    _resultData['creation_time'] = l$creation_time;
    final l$description_id = description_id;
    _resultData['description_id'] = l$description_id;
    final l$firebase_id = firebase_id;
    _resultData['firebase_id'] = l$firebase_id;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$language = language;
    _resultData['language'] = mapToJson(l$language);
    final l$name = name;
    _resultData['name'] = l$name;
    final l$open_status = open_status;
    _resultData['open_status'] = l$open_status;
    final l$phone_number = phone_number;
    _resultData['phone_number'] = l$phone_number;
    final l$online_ordering = online_ordering;
    _resultData['online_ordering'] = l$online_ordering;
    final l$service_link_id = service_link_id;
    _resultData['service_link_id'] = l$service_link_id;
    final l$stripe_info = stripe_info;
    _resultData['stripe_info'] = l$stripe_info?.toJson();
    final l$service_provider_type = service_provider_type;
    _resultData['service_provider_type'] = l$service_provider_type;
    final l$schedule = schedule;
    _resultData['schedule'] = l$schedule == null ? null : mapToJson(l$schedule);
    final l$location = location;
    _resultData['location'] = l$location.toJson();
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$unique_id = unique_id;
    final l$accepted_payments = accepted_payments;
    final l$approved = approved;
    final l$is_open = is_open;
    final l$creation_time = creation_time;
    final l$description_id = description_id;
    final l$firebase_id = firebase_id;
    final l$id = id;
    final l$image = image;
    final l$language = language;
    final l$name = name;
    final l$open_status = open_status;
    final l$phone_number = phone_number;
    final l$online_ordering = online_ordering;
    final l$service_link_id = service_link_id;
    final l$stripe_info = stripe_info;
    final l$service_provider_type = service_provider_type;
    final l$schedule = schedule;
    final l$location = location;
    final l$description = description;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$unique_id,
      l$accepted_payments,
      l$approved,
      l$is_open,
      l$creation_time,
      l$description_id,
      l$firebase_id,
      l$id,
      l$image,
      l$language,
      l$name,
      l$open_status,
      l$phone_number,
      l$online_ordering,
      l$service_link_id,
      l$stripe_info,
      l$service_provider_type,
      l$schedule,
      l$location,
      l$description,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getServiceDetails$service_provider_details_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$unique_id = unique_id;
    final lOther$unique_id = other.unique_id;
    if (l$unique_id != lOther$unique_id) {
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
    final l$is_open = is_open;
    final lOther$is_open = other.is_open;
    if (l$is_open != lOther$is_open) {
      return false;
    }
    final l$creation_time = creation_time;
    final lOther$creation_time = other.creation_time;
    if (l$creation_time != lOther$creation_time) {
      return false;
    }
    final l$description_id = description_id;
    final lOther$description_id = other.description_id;
    if (l$description_id != lOther$description_id) {
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
    final l$language = language;
    final lOther$language = other.language;
    if (l$language != lOther$language) {
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
    final l$online_ordering = online_ordering;
    final lOther$online_ordering = other.online_ordering;
    if (l$online_ordering != lOther$online_ordering) {
      return false;
    }
    final l$service_link_id = service_link_id;
    final lOther$service_link_id = other.service_link_id;
    if (l$service_link_id != lOther$service_link_id) {
      return false;
    }
    final l$stripe_info = stripe_info;
    final lOther$stripe_info = other.stripe_info;
    if (l$stripe_info != lOther$stripe_info) {
      return false;
    }
    final l$service_provider_type = service_provider_type;
    final lOther$service_provider_type = other.service_provider_type;
    if (l$service_provider_type != lOther$service_provider_type) {
      return false;
    }
    final l$schedule = schedule;
    final lOther$schedule = other.schedule;
    if (l$schedule != lOther$schedule) {
      return false;
    }
    final l$location = location;
    final lOther$location = other.location;
    if (l$location != lOther$location) {
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

extension UtilityExtension$Query$getServiceDetails$service_provider_details_by_pk
    on Query$getServiceDetails$service_provider_details_by_pk {
  CopyWith$Query$getServiceDetails$service_provider_details_by_pk<
          Query$getServiceDetails$service_provider_details_by_pk>
      get copyWith =>
          CopyWith$Query$getServiceDetails$service_provider_details_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getServiceDetails$service_provider_details_by_pk<
    TRes> {
  factory CopyWith$Query$getServiceDetails$service_provider_details_by_pk(
    Query$getServiceDetails$service_provider_details_by_pk instance,
    TRes Function(Query$getServiceDetails$service_provider_details_by_pk) then,
  ) = _CopyWithImpl$Query$getServiceDetails$service_provider_details_by_pk;

  factory CopyWith$Query$getServiceDetails$service_provider_details_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getServiceDetails$service_provider_details_by_pk;

  TRes call({
    String? unique_id,
    dynamic? accepted_payments,
    bool? approved,
    bool? is_open,
    String? creation_time,
    int? description_id,
    String? firebase_id,
    int? id,
    String? image,
    dynamic? language,
    String? name,
    String? open_status,
    String? phone_number,
    bool? online_ordering,
    int? service_link_id,
    Query$getServiceDetails$service_provider_details_by_pk$stripe_info?
        stripe_info,
    String? service_provider_type,
    dynamic? schedule,
    Query$getServiceDetails$service_provider_details_by_pk$location? location,
    Query$getServiceDetails$service_provider_details_by_pk$description?
        description,
    String? $__typename,
  });
  CopyWith$Query$getServiceDetails$service_provider_details_by_pk$stripe_info<
      TRes> get stripe_info;
  CopyWith$Query$getServiceDetails$service_provider_details_by_pk$location<TRes>
      get location;
  CopyWith$Query$getServiceDetails$service_provider_details_by_pk$description<
      TRes> get description;
}

class _CopyWithImpl$Query$getServiceDetails$service_provider_details_by_pk<TRes>
    implements
        CopyWith$Query$getServiceDetails$service_provider_details_by_pk<TRes> {
  _CopyWithImpl$Query$getServiceDetails$service_provider_details_by_pk(
    this._instance,
    this._then,
  );

  final Query$getServiceDetails$service_provider_details_by_pk _instance;

  final TRes Function(Query$getServiceDetails$service_provider_details_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? unique_id = _undefined,
    Object? accepted_payments = _undefined,
    Object? approved = _undefined,
    Object? is_open = _undefined,
    Object? creation_time = _undefined,
    Object? description_id = _undefined,
    Object? firebase_id = _undefined,
    Object? id = _undefined,
    Object? image = _undefined,
    Object? language = _undefined,
    Object? name = _undefined,
    Object? open_status = _undefined,
    Object? phone_number = _undefined,
    Object? online_ordering = _undefined,
    Object? service_link_id = _undefined,
    Object? stripe_info = _undefined,
    Object? service_provider_type = _undefined,
    Object? schedule = _undefined,
    Object? location = _undefined,
    Object? description = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getServiceDetails$service_provider_details_by_pk(
        unique_id: unique_id == _undefined || unique_id == null
            ? _instance.unique_id
            : (unique_id as String),
        accepted_payments:
            accepted_payments == _undefined || accepted_payments == null
                ? _instance.accepted_payments
                : (accepted_payments as dynamic),
        approved: approved == _undefined || approved == null
            ? _instance.approved
            : (approved as bool),
        is_open: is_open == _undefined ? _instance.is_open : (is_open as bool?),
        creation_time: creation_time == _undefined || creation_time == null
            ? _instance.creation_time
            : (creation_time as String),
        description_id: description_id == _undefined
            ? _instance.description_id
            : (description_id as int?),
        firebase_id: firebase_id == _undefined
            ? _instance.firebase_id
            : (firebase_id as String?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        language: language == _undefined || language == null
            ? _instance.language
            : (language as dynamic),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        open_status: open_status == _undefined || open_status == null
            ? _instance.open_status
            : (open_status as String),
        phone_number: phone_number == _undefined
            ? _instance.phone_number
            : (phone_number as String?),
        online_ordering:
            online_ordering == _undefined || online_ordering == null
                ? _instance.online_ordering
                : (online_ordering as bool),
        service_link_id: service_link_id == _undefined
            ? _instance.service_link_id
            : (service_link_id as int?),
        stripe_info: stripe_info == _undefined
            ? _instance.stripe_info
            : (stripe_info
                as Query$getServiceDetails$service_provider_details_by_pk$stripe_info?),
        service_provider_type:
            service_provider_type == _undefined || service_provider_type == null
                ? _instance.service_provider_type
                : (service_provider_type as String),
        schedule: schedule == _undefined
            ? _instance.schedule
            : (schedule as dynamic?),
        location: location == _undefined || location == null
            ? _instance.location
            : (location
                as Query$getServiceDetails$service_provider_details_by_pk$location),
        description: description == _undefined
            ? _instance.description
            : (description
                as Query$getServiceDetails$service_provider_details_by_pk$description?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getServiceDetails$service_provider_details_by_pk$stripe_info<
      TRes> get stripe_info {
    final local$stripe_info = _instance.stripe_info;
    return local$stripe_info == null
        ? CopyWith$Query$getServiceDetails$service_provider_details_by_pk$stripe_info
            .stub(_then(_instance))
        : CopyWith$Query$getServiceDetails$service_provider_details_by_pk$stripe_info(
            local$stripe_info, (e) => call(stripe_info: e));
  }

  CopyWith$Query$getServiceDetails$service_provider_details_by_pk$location<TRes>
      get location {
    final local$location = _instance.location;
    return CopyWith$Query$getServiceDetails$service_provider_details_by_pk$location(
        local$location, (e) => call(location: e));
  }

  CopyWith$Query$getServiceDetails$service_provider_details_by_pk$description<
      TRes> get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Query$getServiceDetails$service_provider_details_by_pk$description
            .stub(_then(_instance))
        : CopyWith$Query$getServiceDetails$service_provider_details_by_pk$description(
            local$description, (e) => call(description: e));
  }
}

class _CopyWithStubImpl$Query$getServiceDetails$service_provider_details_by_pk<
        TRes>
    implements
        CopyWith$Query$getServiceDetails$service_provider_details_by_pk<TRes> {
  _CopyWithStubImpl$Query$getServiceDetails$service_provider_details_by_pk(
      this._res);

  TRes _res;

  call({
    String? unique_id,
    dynamic? accepted_payments,
    bool? approved,
    bool? is_open,
    String? creation_time,
    int? description_id,
    String? firebase_id,
    int? id,
    String? image,
    dynamic? language,
    String? name,
    String? open_status,
    String? phone_number,
    bool? online_ordering,
    int? service_link_id,
    Query$getServiceDetails$service_provider_details_by_pk$stripe_info?
        stripe_info,
    String? service_provider_type,
    dynamic? schedule,
    Query$getServiceDetails$service_provider_details_by_pk$location? location,
    Query$getServiceDetails$service_provider_details_by_pk$description?
        description,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getServiceDetails$service_provider_details_by_pk$stripe_info<
          TRes>
      get stripe_info =>
          CopyWith$Query$getServiceDetails$service_provider_details_by_pk$stripe_info
              .stub(_res);
  CopyWith$Query$getServiceDetails$service_provider_details_by_pk$location<TRes>
      get location =>
          CopyWith$Query$getServiceDetails$service_provider_details_by_pk$location
              .stub(_res);
  CopyWith$Query$getServiceDetails$service_provider_details_by_pk$description<
          TRes>
      get description =>
          CopyWith$Query$getServiceDetails$service_provider_details_by_pk$description
              .stub(_res);
}

class Query$getServiceDetails$service_provider_details_by_pk$stripe_info {
  Query$getServiceDetails$service_provider_details_by_pk$stripe_info({
    this.charge_fees_on_customer,
    required this.charges_enabled,
    required this.details_submitted,
    this.email,
    required this.payouts_enabled,
    this.requirements,
    required this.id,
    required this.status,
    required this.stripe_id,
    required this.$__typename,
  });

  factory Query$getServiceDetails$service_provider_details_by_pk$stripe_info.fromJson(
      Map<String, dynamic> json) {
    final l$charge_fees_on_customer = json['charge_fees_on_customer'];
    final l$charges_enabled = json['charges_enabled'];
    final l$details_submitted = json['details_submitted'];
    final l$email = json['email'];
    final l$payouts_enabled = json['payouts_enabled'];
    final l$requirements = json['requirements'];
    final l$id = json['id'];
    final l$status = json['status'];
    final l$stripe_id = json['stripe_id'];
    final l$$__typename = json['__typename'];
    return Query$getServiceDetails$service_provider_details_by_pk$stripe_info(
      charge_fees_on_customer: (l$charge_fees_on_customer as bool?),
      charges_enabled: (l$charges_enabled as bool),
      details_submitted: (l$details_submitted as bool),
      email: (l$email as String?),
      payouts_enabled: (l$payouts_enabled as bool),
      requirements: l$requirements == null ? null : mapFromJson(l$requirements),
      id: (l$id as int),
      status: (l$status as String),
      stripe_id: (l$stripe_id as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final bool? charge_fees_on_customer;

  final bool charges_enabled;

  final bool details_submitted;

  final String? email;

  final bool payouts_enabled;

  final dynamic? requirements;

  final int id;

  final String status;

  final String stripe_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$charge_fees_on_customer = charge_fees_on_customer;
    _resultData['charge_fees_on_customer'] = l$charge_fees_on_customer;
    final l$charges_enabled = charges_enabled;
    _resultData['charges_enabled'] = l$charges_enabled;
    final l$details_submitted = details_submitted;
    _resultData['details_submitted'] = l$details_submitted;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$payouts_enabled = payouts_enabled;
    _resultData['payouts_enabled'] = l$payouts_enabled;
    final l$requirements = requirements;
    _resultData['requirements'] =
        l$requirements == null ? null : mapToJson(l$requirements);
    final l$id = id;
    _resultData['id'] = l$id;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$stripe_id = stripe_id;
    _resultData['stripe_id'] = l$stripe_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$charge_fees_on_customer = charge_fees_on_customer;
    final l$charges_enabled = charges_enabled;
    final l$details_submitted = details_submitted;
    final l$email = email;
    final l$payouts_enabled = payouts_enabled;
    final l$requirements = requirements;
    final l$id = id;
    final l$status = status;
    final l$stripe_id = stripe_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$charge_fees_on_customer,
      l$charges_enabled,
      l$details_submitted,
      l$email,
      l$payouts_enabled,
      l$requirements,
      l$id,
      l$status,
      l$stripe_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getServiceDetails$service_provider_details_by_pk$stripe_info) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$charge_fees_on_customer = charge_fees_on_customer;
    final lOther$charge_fees_on_customer = other.charge_fees_on_customer;
    if (l$charge_fees_on_customer != lOther$charge_fees_on_customer) {
      return false;
    }
    final l$charges_enabled = charges_enabled;
    final lOther$charges_enabled = other.charges_enabled;
    if (l$charges_enabled != lOther$charges_enabled) {
      return false;
    }
    final l$details_submitted = details_submitted;
    final lOther$details_submitted = other.details_submitted;
    if (l$details_submitted != lOther$details_submitted) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$payouts_enabled = payouts_enabled;
    final lOther$payouts_enabled = other.payouts_enabled;
    if (l$payouts_enabled != lOther$payouts_enabled) {
      return false;
    }
    final l$requirements = requirements;
    final lOther$requirements = other.requirements;
    if (l$requirements != lOther$requirements) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$stripe_id = stripe_id;
    final lOther$stripe_id = other.stripe_id;
    if (l$stripe_id != lOther$stripe_id) {
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

extension UtilityExtension$Query$getServiceDetails$service_provider_details_by_pk$stripe_info
    on Query$getServiceDetails$service_provider_details_by_pk$stripe_info {
  CopyWith$Query$getServiceDetails$service_provider_details_by_pk$stripe_info<
          Query$getServiceDetails$service_provider_details_by_pk$stripe_info>
      get copyWith =>
          CopyWith$Query$getServiceDetails$service_provider_details_by_pk$stripe_info(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getServiceDetails$service_provider_details_by_pk$stripe_info<
    TRes> {
  factory CopyWith$Query$getServiceDetails$service_provider_details_by_pk$stripe_info(
    Query$getServiceDetails$service_provider_details_by_pk$stripe_info instance,
    TRes Function(
            Query$getServiceDetails$service_provider_details_by_pk$stripe_info)
        then,
  ) = _CopyWithImpl$Query$getServiceDetails$service_provider_details_by_pk$stripe_info;

  factory CopyWith$Query$getServiceDetails$service_provider_details_by_pk$stripe_info.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getServiceDetails$service_provider_details_by_pk$stripe_info;

  TRes call({
    bool? charge_fees_on_customer,
    bool? charges_enabled,
    bool? details_submitted,
    String? email,
    bool? payouts_enabled,
    dynamic? requirements,
    int? id,
    String? status,
    String? stripe_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getServiceDetails$service_provider_details_by_pk$stripe_info<
        TRes>
    implements
        CopyWith$Query$getServiceDetails$service_provider_details_by_pk$stripe_info<
            TRes> {
  _CopyWithImpl$Query$getServiceDetails$service_provider_details_by_pk$stripe_info(
    this._instance,
    this._then,
  );

  final Query$getServiceDetails$service_provider_details_by_pk$stripe_info
      _instance;

  final TRes Function(
      Query$getServiceDetails$service_provider_details_by_pk$stripe_info) _then;

  static const _undefined = {};

  TRes call({
    Object? charge_fees_on_customer = _undefined,
    Object? charges_enabled = _undefined,
    Object? details_submitted = _undefined,
    Object? email = _undefined,
    Object? payouts_enabled = _undefined,
    Object? requirements = _undefined,
    Object? id = _undefined,
    Object? status = _undefined,
    Object? stripe_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getServiceDetails$service_provider_details_by_pk$stripe_info(
        charge_fees_on_customer: charge_fees_on_customer == _undefined
            ? _instance.charge_fees_on_customer
            : (charge_fees_on_customer as bool?),
        charges_enabled:
            charges_enabled == _undefined || charges_enabled == null
                ? _instance.charges_enabled
                : (charges_enabled as bool),
        details_submitted:
            details_submitted == _undefined || details_submitted == null
                ? _instance.details_submitted
                : (details_submitted as bool),
        email: email == _undefined ? _instance.email : (email as String?),
        payouts_enabled:
            payouts_enabled == _undefined || payouts_enabled == null
                ? _instance.payouts_enabled
                : (payouts_enabled as bool),
        requirements: requirements == _undefined
            ? _instance.requirements
            : (requirements as dynamic?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        stripe_id: stripe_id == _undefined || stripe_id == null
            ? _instance.stripe_id
            : (stripe_id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getServiceDetails$service_provider_details_by_pk$stripe_info<
        TRes>
    implements
        CopyWith$Query$getServiceDetails$service_provider_details_by_pk$stripe_info<
            TRes> {
  _CopyWithStubImpl$Query$getServiceDetails$service_provider_details_by_pk$stripe_info(
      this._res);

  TRes _res;

  call({
    bool? charge_fees_on_customer,
    bool? charges_enabled,
    bool? details_submitted,
    String? email,
    bool? payouts_enabled,
    dynamic? requirements,
    int? id,
    String? status,
    String? stripe_id,
    String? $__typename,
  }) =>
      _res;
}

class Query$getServiceDetails$service_provider_details_by_pk$location {
  Query$getServiceDetails$service_provider_details_by_pk$location({
    required this.id,
    required this.gps,
    required this.address,
    required this.$__typename,
  });

  factory Query$getServiceDetails$service_provider_details_by_pk$location.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$gps = json['gps'];
    final l$address = json['address'];
    final l$$__typename = json['__typename'];
    return Query$getServiceDetails$service_provider_details_by_pk$location(
      id: (l$id as int),
      gps: geographyFromJson(l$gps),
      address: (l$address as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Geography gps;

  final String address;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
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
    final l$id = id;
    final l$gps = gps;
    final l$address = address;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
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
            is Query$getServiceDetails$service_provider_details_by_pk$location) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Query$getServiceDetails$service_provider_details_by_pk$location
    on Query$getServiceDetails$service_provider_details_by_pk$location {
  CopyWith$Query$getServiceDetails$service_provider_details_by_pk$location<
          Query$getServiceDetails$service_provider_details_by_pk$location>
      get copyWith =>
          CopyWith$Query$getServiceDetails$service_provider_details_by_pk$location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getServiceDetails$service_provider_details_by_pk$location<
    TRes> {
  factory CopyWith$Query$getServiceDetails$service_provider_details_by_pk$location(
    Query$getServiceDetails$service_provider_details_by_pk$location instance,
    TRes Function(
            Query$getServiceDetails$service_provider_details_by_pk$location)
        then,
  ) = _CopyWithImpl$Query$getServiceDetails$service_provider_details_by_pk$location;

  factory CopyWith$Query$getServiceDetails$service_provider_details_by_pk$location.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getServiceDetails$service_provider_details_by_pk$location;

  TRes call({
    int? id,
    Geography? gps,
    String? address,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getServiceDetails$service_provider_details_by_pk$location<
        TRes>
    implements
        CopyWith$Query$getServiceDetails$service_provider_details_by_pk$location<
            TRes> {
  _CopyWithImpl$Query$getServiceDetails$service_provider_details_by_pk$location(
    this._instance,
    this._then,
  );

  final Query$getServiceDetails$service_provider_details_by_pk$location
      _instance;

  final TRes Function(
      Query$getServiceDetails$service_provider_details_by_pk$location) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? gps = _undefined,
    Object? address = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getServiceDetails$service_provider_details_by_pk$location(
        id: id == _undefined || id == null ? _instance.id : (id as int),
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

class _CopyWithStubImpl$Query$getServiceDetails$service_provider_details_by_pk$location<
        TRes>
    implements
        CopyWith$Query$getServiceDetails$service_provider_details_by_pk$location<
            TRes> {
  _CopyWithStubImpl$Query$getServiceDetails$service_provider_details_by_pk$location(
      this._res);

  TRes _res;

  call({
    int? id,
    Geography? gps,
    String? address,
    String? $__typename,
  }) =>
      _res;
}

class Query$getServiceDetails$service_provider_details_by_pk$description {
  Query$getServiceDetails$service_provider_details_by_pk$description({
    required this.id,
    required this.translations,
    required this.$__typename,
  });

  factory Query$getServiceDetails$service_provider_details_by_pk$description.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getServiceDetails$service_provider_details_by_pk$description(
      id: (l$id as int),
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getServiceDetails$service_provider_details_by_pk$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final List<
          Query$getServiceDetails$service_provider_details_by_pk$description$translations>
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
            is Query$getServiceDetails$service_provider_details_by_pk$description) ||
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

extension UtilityExtension$Query$getServiceDetails$service_provider_details_by_pk$description
    on Query$getServiceDetails$service_provider_details_by_pk$description {
  CopyWith$Query$getServiceDetails$service_provider_details_by_pk$description<
          Query$getServiceDetails$service_provider_details_by_pk$description>
      get copyWith =>
          CopyWith$Query$getServiceDetails$service_provider_details_by_pk$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getServiceDetails$service_provider_details_by_pk$description<
    TRes> {
  factory CopyWith$Query$getServiceDetails$service_provider_details_by_pk$description(
    Query$getServiceDetails$service_provider_details_by_pk$description instance,
    TRes Function(
            Query$getServiceDetails$service_provider_details_by_pk$description)
        then,
  ) = _CopyWithImpl$Query$getServiceDetails$service_provider_details_by_pk$description;

  factory CopyWith$Query$getServiceDetails$service_provider_details_by_pk$description.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getServiceDetails$service_provider_details_by_pk$description;

  TRes call({
    int? id,
    List<Query$getServiceDetails$service_provider_details_by_pk$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getServiceDetails$service_provider_details_by_pk$description$translations> Function(
              Iterable<
                  CopyWith$Query$getServiceDetails$service_provider_details_by_pk$description$translations<
                      Query$getServiceDetails$service_provider_details_by_pk$description$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getServiceDetails$service_provider_details_by_pk$description<
        TRes>
    implements
        CopyWith$Query$getServiceDetails$service_provider_details_by_pk$description<
            TRes> {
  _CopyWithImpl$Query$getServiceDetails$service_provider_details_by_pk$description(
    this._instance,
    this._then,
  );

  final Query$getServiceDetails$service_provider_details_by_pk$description
      _instance;

  final TRes Function(
      Query$getServiceDetails$service_provider_details_by_pk$description) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getServiceDetails$service_provider_details_by_pk$description(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getServiceDetails$service_provider_details_by_pk$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getServiceDetails$service_provider_details_by_pk$description$translations> Function(
                  Iterable<
                      CopyWith$Query$getServiceDetails$service_provider_details_by_pk$description$translations<
                          Query$getServiceDetails$service_provider_details_by_pk$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getServiceDetails$service_provider_details_by_pk$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getServiceDetails$service_provider_details_by_pk$description<
        TRes>
    implements
        CopyWith$Query$getServiceDetails$service_provider_details_by_pk$description<
            TRes> {
  _CopyWithStubImpl$Query$getServiceDetails$service_provider_details_by_pk$description(
      this._res);

  TRes _res;

  call({
    int? id,
    List<Query$getServiceDetails$service_provider_details_by_pk$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getServiceDetails$service_provider_details_by_pk$description$translations {
  Query$getServiceDetails$service_provider_details_by_pk$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getServiceDetails$service_provider_details_by_pk$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getServiceDetails$service_provider_details_by_pk$description$translations(
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
            is Query$getServiceDetails$service_provider_details_by_pk$description$translations) ||
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

extension UtilityExtension$Query$getServiceDetails$service_provider_details_by_pk$description$translations
    on Query$getServiceDetails$service_provider_details_by_pk$description$translations {
  CopyWith$Query$getServiceDetails$service_provider_details_by_pk$description$translations<
          Query$getServiceDetails$service_provider_details_by_pk$description$translations>
      get copyWith =>
          CopyWith$Query$getServiceDetails$service_provider_details_by_pk$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getServiceDetails$service_provider_details_by_pk$description$translations<
    TRes> {
  factory CopyWith$Query$getServiceDetails$service_provider_details_by_pk$description$translations(
    Query$getServiceDetails$service_provider_details_by_pk$description$translations
        instance,
    TRes Function(
            Query$getServiceDetails$service_provider_details_by_pk$description$translations)
        then,
  ) = _CopyWithImpl$Query$getServiceDetails$service_provider_details_by_pk$description$translations;

  factory CopyWith$Query$getServiceDetails$service_provider_details_by_pk$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getServiceDetails$service_provider_details_by_pk$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getServiceDetails$service_provider_details_by_pk$description$translations<
        TRes>
    implements
        CopyWith$Query$getServiceDetails$service_provider_details_by_pk$description$translations<
            TRes> {
  _CopyWithImpl$Query$getServiceDetails$service_provider_details_by_pk$description$translations(
    this._instance,
    this._then,
  );

  final Query$getServiceDetails$service_provider_details_by_pk$description$translations
      _instance;

  final TRes Function(
          Query$getServiceDetails$service_provider_details_by_pk$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getServiceDetails$service_provider_details_by_pk$description$translations(
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

class _CopyWithStubImpl$Query$getServiceDetails$service_provider_details_by_pk$description$translations<
        TRes>
    implements
        CopyWith$Query$getServiceDetails$service_provider_details_by_pk$description$translations<
            TRes> {
  _CopyWithStubImpl$Query$getServiceDetails$service_provider_details_by_pk$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$updateServiceDetails {
  factory Variables$Mutation$updateServiceDetails({
    required int detailsId,
    Input$service_provider_details_set_input? data,
  }) =>
      Variables$Mutation$updateServiceDetails._({
        r'detailsId': detailsId,
        if (data != null) r'data': data,
      });

  Variables$Mutation$updateServiceDetails._(this._$data);

  factory Variables$Mutation$updateServiceDetails.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$detailsId = data['detailsId'];
    result$data['detailsId'] = (l$detailsId as int);
    if (data.containsKey('data')) {
      final l$data = data['data'];
      result$data['data'] = l$data == null
          ? null
          : Input$service_provider_details_set_input.fromJson(
              (l$data as Map<String, dynamic>));
    }
    return Variables$Mutation$updateServiceDetails._(result$data);
  }

  Map<String, dynamic> _$data;

  int get detailsId => (_$data['detailsId'] as int);
  Input$service_provider_details_set_input? get data =>
      (_$data['data'] as Input$service_provider_details_set_input?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$detailsId = detailsId;
    result$data['detailsId'] = l$detailsId;
    if (_$data.containsKey('data')) {
      final l$data = data;
      result$data['data'] = l$data?.toJson();
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$updateServiceDetails<
          Variables$Mutation$updateServiceDetails>
      get copyWith => CopyWith$Variables$Mutation$updateServiceDetails(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$updateServiceDetails) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$detailsId = detailsId;
    final lOther$detailsId = other.detailsId;
    if (l$detailsId != lOther$detailsId) {
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
    final l$detailsId = detailsId;
    final l$data = data;
    return Object.hashAll([
      l$detailsId,
      _$data.containsKey('data') ? l$data : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$updateServiceDetails<TRes> {
  factory CopyWith$Variables$Mutation$updateServiceDetails(
    Variables$Mutation$updateServiceDetails instance,
    TRes Function(Variables$Mutation$updateServiceDetails) then,
  ) = _CopyWithImpl$Variables$Mutation$updateServiceDetails;

  factory CopyWith$Variables$Mutation$updateServiceDetails.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$updateServiceDetails;

  TRes call({
    int? detailsId,
    Input$service_provider_details_set_input? data,
  });
}

class _CopyWithImpl$Variables$Mutation$updateServiceDetails<TRes>
    implements CopyWith$Variables$Mutation$updateServiceDetails<TRes> {
  _CopyWithImpl$Variables$Mutation$updateServiceDetails(
    this._instance,
    this._then,
  );

  final Variables$Mutation$updateServiceDetails _instance;

  final TRes Function(Variables$Mutation$updateServiceDetails) _then;

  static const _undefined = {};

  TRes call({
    Object? detailsId = _undefined,
    Object? data = _undefined,
  }) =>
      _then(Variables$Mutation$updateServiceDetails._({
        ..._instance._$data,
        if (detailsId != _undefined && detailsId != null)
          'detailsId': (detailsId as int),
        if (data != _undefined)
          'data': (data as Input$service_provider_details_set_input?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$updateServiceDetails<TRes>
    implements CopyWith$Variables$Mutation$updateServiceDetails<TRes> {
  _CopyWithStubImpl$Variables$Mutation$updateServiceDetails(this._res);

  TRes _res;

  call({
    int? detailsId,
    Input$service_provider_details_set_input? data,
  }) =>
      _res;
}

class Mutation$updateServiceDetails {
  Mutation$updateServiceDetails({
    this.update_service_provider_details_by_pk,
    required this.$__typename,
  });

  factory Mutation$updateServiceDetails.fromJson(Map<String, dynamic> json) {
    final l$update_service_provider_details_by_pk =
        json['update_service_provider_details_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$updateServiceDetails(
      update_service_provider_details_by_pk:
          l$update_service_provider_details_by_pk == null
              ? null
              : Mutation$updateServiceDetails$update_service_provider_details_by_pk
                  .fromJson((l$update_service_provider_details_by_pk
                      as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$updateServiceDetails$update_service_provider_details_by_pk?
      update_service_provider_details_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_service_provider_details_by_pk =
        update_service_provider_details_by_pk;
    _resultData['update_service_provider_details_by_pk'] =
        l$update_service_provider_details_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_service_provider_details_by_pk =
        update_service_provider_details_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_service_provider_details_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$updateServiceDetails) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_service_provider_details_by_pk =
        update_service_provider_details_by_pk;
    final lOther$update_service_provider_details_by_pk =
        other.update_service_provider_details_by_pk;
    if (l$update_service_provider_details_by_pk !=
        lOther$update_service_provider_details_by_pk) {
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

extension UtilityExtension$Mutation$updateServiceDetails
    on Mutation$updateServiceDetails {
  CopyWith$Mutation$updateServiceDetails<Mutation$updateServiceDetails>
      get copyWith => CopyWith$Mutation$updateServiceDetails(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateServiceDetails<TRes> {
  factory CopyWith$Mutation$updateServiceDetails(
    Mutation$updateServiceDetails instance,
    TRes Function(Mutation$updateServiceDetails) then,
  ) = _CopyWithImpl$Mutation$updateServiceDetails;

  factory CopyWith$Mutation$updateServiceDetails.stub(TRes res) =
      _CopyWithStubImpl$Mutation$updateServiceDetails;

  TRes call({
    Mutation$updateServiceDetails$update_service_provider_details_by_pk?
        update_service_provider_details_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk<
      TRes> get update_service_provider_details_by_pk;
}

class _CopyWithImpl$Mutation$updateServiceDetails<TRes>
    implements CopyWith$Mutation$updateServiceDetails<TRes> {
  _CopyWithImpl$Mutation$updateServiceDetails(
    this._instance,
    this._then,
  );

  final Mutation$updateServiceDetails _instance;

  final TRes Function(Mutation$updateServiceDetails) _then;

  static const _undefined = {};

  TRes call({
    Object? update_service_provider_details_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateServiceDetails(
        update_service_provider_details_by_pk:
            update_service_provider_details_by_pk == _undefined
                ? _instance.update_service_provider_details_by_pk
                : (update_service_provider_details_by_pk
                    as Mutation$updateServiceDetails$update_service_provider_details_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk<
      TRes> get update_service_provider_details_by_pk {
    final local$update_service_provider_details_by_pk =
        _instance.update_service_provider_details_by_pk;
    return local$update_service_provider_details_by_pk == null
        ? CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk(
            local$update_service_provider_details_by_pk,
            (e) => call(update_service_provider_details_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$updateServiceDetails<TRes>
    implements CopyWith$Mutation$updateServiceDetails<TRes> {
  _CopyWithStubImpl$Mutation$updateServiceDetails(this._res);

  TRes _res;

  call({
    Mutation$updateServiceDetails$update_service_provider_details_by_pk?
        update_service_provider_details_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk<
          TRes>
      get update_service_provider_details_by_pk =>
          CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk
              .stub(_res);
}

const documentNodeMutationupdateServiceDetails = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'updateServiceDetails'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'detailsId')),
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
          name: NameNode(value: 'service_provider_details_set_input'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'update_service_provider_details_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'pk_columns'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'detailsId')),
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
            name: NameNode(value: 'description_id'),
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
            name: NameNode(value: 'is_open'),
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
            name: NameNode(value: 'service_link_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'currency'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'stripe_info'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'charge_fees_on_customer'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'charges_enabled'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'details_submitted'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'email'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'payouts_enabled'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'requirements'),
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
                name: NameNode(value: 'status'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'stripe_id'),
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
            name: NameNode(value: 'service_provider_type'),
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
            name: NameNode(value: 'location'),
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
Mutation$updateServiceDetails _parserFn$Mutation$updateServiceDetails(
        Map<String, dynamic> data) =>
    Mutation$updateServiceDetails.fromJson(data);
typedef OnMutationCompleted$Mutation$updateServiceDetails = FutureOr<void>
    Function(
  dynamic,
  Mutation$updateServiceDetails?,
);

class Options$Mutation$updateServiceDetails
    extends graphql.MutationOptions<Mutation$updateServiceDetails> {
  Options$Mutation$updateServiceDetails({
    String? operationName,
    required Variables$Mutation$updateServiceDetails variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$updateServiceDetails? onCompleted,
    graphql.OnMutationUpdate<Mutation$updateServiceDetails>? update,
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
                        : _parserFn$Mutation$updateServiceDetails(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdateServiceDetails,
          parserFn: _parserFn$Mutation$updateServiceDetails,
        );

  final OnMutationCompleted$Mutation$updateServiceDetails?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$updateServiceDetails
    extends graphql.WatchQueryOptions<Mutation$updateServiceDetails> {
  WatchOptions$Mutation$updateServiceDetails({
    String? operationName,
    required Variables$Mutation$updateServiceDetails variables,
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
          document: documentNodeMutationupdateServiceDetails,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$updateServiceDetails,
        );
}

extension ClientExtension$Mutation$updateServiceDetails
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$updateServiceDetails>>
      mutate$updateServiceDetails(
              Options$Mutation$updateServiceDetails options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$updateServiceDetails>
      watchMutation$updateServiceDetails(
              WatchOptions$Mutation$updateServiceDetails options) =>
          this.watchMutation(options);
}

class Mutation$updateServiceDetails$update_service_provider_details_by_pk {
  Mutation$updateServiceDetails$update_service_provider_details_by_pk({
    required this.accepted_payments,
    required this.approved,
    required this.creation_time,
    this.description_id,
    this.firebase_id,
    required this.id,
    required this.image,
    this.is_open,
    required this.language,
    required this.name,
    required this.open_status,
    this.phone_number,
    this.service_link_id,
    required this.currency,
    this.stripe_info,
    required this.service_provider_type,
    this.schedule,
    required this.location,
    this.description,
    required this.$__typename,
  });

  factory Mutation$updateServiceDetails$update_service_provider_details_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$accepted_payments = json['accepted_payments'];
    final l$approved = json['approved'];
    final l$creation_time = json['creation_time'];
    final l$description_id = json['description_id'];
    final l$firebase_id = json['firebase_id'];
    final l$id = json['id'];
    final l$image = json['image'];
    final l$is_open = json['is_open'];
    final l$language = json['language'];
    final l$name = json['name'];
    final l$open_status = json['open_status'];
    final l$phone_number = json['phone_number'];
    final l$service_link_id = json['service_link_id'];
    final l$currency = json['currency'];
    final l$stripe_info = json['stripe_info'];
    final l$service_provider_type = json['service_provider_type'];
    final l$schedule = json['schedule'];
    final l$location = json['location'];
    final l$description = json['description'];
    final l$$__typename = json['__typename'];
    return Mutation$updateServiceDetails$update_service_provider_details_by_pk(
      accepted_payments: mapFromJson(l$accepted_payments),
      approved: (l$approved as bool),
      creation_time: (l$creation_time as String),
      description_id: (l$description_id as int?),
      firebase_id: (l$firebase_id as String?),
      id: (l$id as int),
      image: (l$image as String),
      is_open: (l$is_open as bool?),
      language: mapFromJson(l$language),
      name: (l$name as String),
      open_status: (l$open_status as String),
      phone_number: (l$phone_number as String?),
      service_link_id: (l$service_link_id as int?),
      currency: (l$currency as String),
      stripe_info: l$stripe_info == null
          ? null
          : Mutation$updateServiceDetails$update_service_provider_details_by_pk$stripe_info
              .fromJson((l$stripe_info as Map<String, dynamic>)),
      service_provider_type: (l$service_provider_type as String),
      schedule: l$schedule == null ? null : mapFromJson(l$schedule),
      location:
          Mutation$updateServiceDetails$update_service_provider_details_by_pk$location
              .fromJson((l$location as Map<String, dynamic>)),
      description: l$description == null
          ? null
          : Mutation$updateServiceDetails$update_service_provider_details_by_pk$description
              .fromJson((l$description as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final dynamic accepted_payments;

  final bool approved;

  final String creation_time;

  final int? description_id;

  final String? firebase_id;

  final int id;

  final String image;

  final bool? is_open;

  final dynamic language;

  final String name;

  final String open_status;

  final String? phone_number;

  final int? service_link_id;

  final String currency;

  final Mutation$updateServiceDetails$update_service_provider_details_by_pk$stripe_info?
      stripe_info;

  final String service_provider_type;

  final dynamic? schedule;

  final Mutation$updateServiceDetails$update_service_provider_details_by_pk$location
      location;

  final Mutation$updateServiceDetails$update_service_provider_details_by_pk$description?
      description;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$accepted_payments = accepted_payments;
    _resultData['accepted_payments'] = mapToJson(l$accepted_payments);
    final l$approved = approved;
    _resultData['approved'] = l$approved;
    final l$creation_time = creation_time;
    _resultData['creation_time'] = l$creation_time;
    final l$description_id = description_id;
    _resultData['description_id'] = l$description_id;
    final l$firebase_id = firebase_id;
    _resultData['firebase_id'] = l$firebase_id;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$is_open = is_open;
    _resultData['is_open'] = l$is_open;
    final l$language = language;
    _resultData['language'] = mapToJson(l$language);
    final l$name = name;
    _resultData['name'] = l$name;
    final l$open_status = open_status;
    _resultData['open_status'] = l$open_status;
    final l$phone_number = phone_number;
    _resultData['phone_number'] = l$phone_number;
    final l$service_link_id = service_link_id;
    _resultData['service_link_id'] = l$service_link_id;
    final l$currency = currency;
    _resultData['currency'] = l$currency;
    final l$stripe_info = stripe_info;
    _resultData['stripe_info'] = l$stripe_info?.toJson();
    final l$service_provider_type = service_provider_type;
    _resultData['service_provider_type'] = l$service_provider_type;
    final l$schedule = schedule;
    _resultData['schedule'] = l$schedule == null ? null : mapToJson(l$schedule);
    final l$location = location;
    _resultData['location'] = l$location.toJson();
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$accepted_payments = accepted_payments;
    final l$approved = approved;
    final l$creation_time = creation_time;
    final l$description_id = description_id;
    final l$firebase_id = firebase_id;
    final l$id = id;
    final l$image = image;
    final l$is_open = is_open;
    final l$language = language;
    final l$name = name;
    final l$open_status = open_status;
    final l$phone_number = phone_number;
    final l$service_link_id = service_link_id;
    final l$currency = currency;
    final l$stripe_info = stripe_info;
    final l$service_provider_type = service_provider_type;
    final l$schedule = schedule;
    final l$location = location;
    final l$description = description;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$accepted_payments,
      l$approved,
      l$creation_time,
      l$description_id,
      l$firebase_id,
      l$id,
      l$image,
      l$is_open,
      l$language,
      l$name,
      l$open_status,
      l$phone_number,
      l$service_link_id,
      l$currency,
      l$stripe_info,
      l$service_provider_type,
      l$schedule,
      l$location,
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
            is Mutation$updateServiceDetails$update_service_provider_details_by_pk) ||
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
    final l$description_id = description_id;
    final lOther$description_id = other.description_id;
    if (l$description_id != lOther$description_id) {
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
    final l$is_open = is_open;
    final lOther$is_open = other.is_open;
    if (l$is_open != lOther$is_open) {
      return false;
    }
    final l$language = language;
    final lOther$language = other.language;
    if (l$language != lOther$language) {
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
    final l$service_link_id = service_link_id;
    final lOther$service_link_id = other.service_link_id;
    if (l$service_link_id != lOther$service_link_id) {
      return false;
    }
    final l$currency = currency;
    final lOther$currency = other.currency;
    if (l$currency != lOther$currency) {
      return false;
    }
    final l$stripe_info = stripe_info;
    final lOther$stripe_info = other.stripe_info;
    if (l$stripe_info != lOther$stripe_info) {
      return false;
    }
    final l$service_provider_type = service_provider_type;
    final lOther$service_provider_type = other.service_provider_type;
    if (l$service_provider_type != lOther$service_provider_type) {
      return false;
    }
    final l$schedule = schedule;
    final lOther$schedule = other.schedule;
    if (l$schedule != lOther$schedule) {
      return false;
    }
    final l$location = location;
    final lOther$location = other.location;
    if (l$location != lOther$location) {
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

extension UtilityExtension$Mutation$updateServiceDetails$update_service_provider_details_by_pk
    on Mutation$updateServiceDetails$update_service_provider_details_by_pk {
  CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk<
          Mutation$updateServiceDetails$update_service_provider_details_by_pk>
      get copyWith =>
          CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk<
    TRes> {
  factory CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk(
    Mutation$updateServiceDetails$update_service_provider_details_by_pk
        instance,
    TRes Function(
            Mutation$updateServiceDetails$update_service_provider_details_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$updateServiceDetails$update_service_provider_details_by_pk;

  factory CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateServiceDetails$update_service_provider_details_by_pk;

  TRes call({
    dynamic? accepted_payments,
    bool? approved,
    String? creation_time,
    int? description_id,
    String? firebase_id,
    int? id,
    String? image,
    bool? is_open,
    dynamic? language,
    String? name,
    String? open_status,
    String? phone_number,
    int? service_link_id,
    String? currency,
    Mutation$updateServiceDetails$update_service_provider_details_by_pk$stripe_info?
        stripe_info,
    String? service_provider_type,
    dynamic? schedule,
    Mutation$updateServiceDetails$update_service_provider_details_by_pk$location?
        location,
    Mutation$updateServiceDetails$update_service_provider_details_by_pk$description?
        description,
    String? $__typename,
  });
  CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$stripe_info<
      TRes> get stripe_info;
  CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$location<
      TRes> get location;
  CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$description<
      TRes> get description;
}

class _CopyWithImpl$Mutation$updateServiceDetails$update_service_provider_details_by_pk<
        TRes>
    implements
        CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$updateServiceDetails$update_service_provider_details_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$updateServiceDetails$update_service_provider_details_by_pk
      _instance;

  final TRes Function(
          Mutation$updateServiceDetails$update_service_provider_details_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? accepted_payments = _undefined,
    Object? approved = _undefined,
    Object? creation_time = _undefined,
    Object? description_id = _undefined,
    Object? firebase_id = _undefined,
    Object? id = _undefined,
    Object? image = _undefined,
    Object? is_open = _undefined,
    Object? language = _undefined,
    Object? name = _undefined,
    Object? open_status = _undefined,
    Object? phone_number = _undefined,
    Object? service_link_id = _undefined,
    Object? currency = _undefined,
    Object? stripe_info = _undefined,
    Object? service_provider_type = _undefined,
    Object? schedule = _undefined,
    Object? location = _undefined,
    Object? description = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateServiceDetails$update_service_provider_details_by_pk(
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
        description_id: description_id == _undefined
            ? _instance.description_id
            : (description_id as int?),
        firebase_id: firebase_id == _undefined
            ? _instance.firebase_id
            : (firebase_id as String?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        is_open: is_open == _undefined ? _instance.is_open : (is_open as bool?),
        language: language == _undefined || language == null
            ? _instance.language
            : (language as dynamic),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        open_status: open_status == _undefined || open_status == null
            ? _instance.open_status
            : (open_status as String),
        phone_number: phone_number == _undefined
            ? _instance.phone_number
            : (phone_number as String?),
        service_link_id: service_link_id == _undefined
            ? _instance.service_link_id
            : (service_link_id as int?),
        currency: currency == _undefined || currency == null
            ? _instance.currency
            : (currency as String),
        stripe_info: stripe_info == _undefined
            ? _instance.stripe_info
            : (stripe_info
                as Mutation$updateServiceDetails$update_service_provider_details_by_pk$stripe_info?),
        service_provider_type:
            service_provider_type == _undefined || service_provider_type == null
                ? _instance.service_provider_type
                : (service_provider_type as String),
        schedule: schedule == _undefined
            ? _instance.schedule
            : (schedule as dynamic?),
        location: location == _undefined || location == null
            ? _instance.location
            : (location
                as Mutation$updateServiceDetails$update_service_provider_details_by_pk$location),
        description: description == _undefined
            ? _instance.description
            : (description
                as Mutation$updateServiceDetails$update_service_provider_details_by_pk$description?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$stripe_info<
      TRes> get stripe_info {
    final local$stripe_info = _instance.stripe_info;
    return local$stripe_info == null
        ? CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$stripe_info
            .stub(_then(_instance))
        : CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$stripe_info(
            local$stripe_info, (e) => call(stripe_info: e));
  }

  CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$location<
      TRes> get location {
    final local$location = _instance.location;
    return CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$location(
        local$location, (e) => call(location: e));
  }

  CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$description<
      TRes> get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$description
            .stub(_then(_instance))
        : CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$description(
            local$description, (e) => call(description: e));
  }
}

class _CopyWithStubImpl$Mutation$updateServiceDetails$update_service_provider_details_by_pk<
        TRes>
    implements
        CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$updateServiceDetails$update_service_provider_details_by_pk(
      this._res);

  TRes _res;

  call({
    dynamic? accepted_payments,
    bool? approved,
    String? creation_time,
    int? description_id,
    String? firebase_id,
    int? id,
    String? image,
    bool? is_open,
    dynamic? language,
    String? name,
    String? open_status,
    String? phone_number,
    int? service_link_id,
    String? currency,
    Mutation$updateServiceDetails$update_service_provider_details_by_pk$stripe_info?
        stripe_info,
    String? service_provider_type,
    dynamic? schedule,
    Mutation$updateServiceDetails$update_service_provider_details_by_pk$location?
        location,
    Mutation$updateServiceDetails$update_service_provider_details_by_pk$description?
        description,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$stripe_info<
          TRes>
      get stripe_info =>
          CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$stripe_info
              .stub(_res);
  CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$location<
          TRes>
      get location =>
          CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$location
              .stub(_res);
  CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$description<
          TRes>
      get description =>
          CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$description
              .stub(_res);
}

class Mutation$updateServiceDetails$update_service_provider_details_by_pk$stripe_info {
  Mutation$updateServiceDetails$update_service_provider_details_by_pk$stripe_info({
    this.charge_fees_on_customer,
    required this.charges_enabled,
    required this.details_submitted,
    this.email,
    required this.payouts_enabled,
    this.requirements,
    required this.id,
    required this.status,
    required this.stripe_id,
    required this.$__typename,
  });

  factory Mutation$updateServiceDetails$update_service_provider_details_by_pk$stripe_info.fromJson(
      Map<String, dynamic> json) {
    final l$charge_fees_on_customer = json['charge_fees_on_customer'];
    final l$charges_enabled = json['charges_enabled'];
    final l$details_submitted = json['details_submitted'];
    final l$email = json['email'];
    final l$payouts_enabled = json['payouts_enabled'];
    final l$requirements = json['requirements'];
    final l$id = json['id'];
    final l$status = json['status'];
    final l$stripe_id = json['stripe_id'];
    final l$$__typename = json['__typename'];
    return Mutation$updateServiceDetails$update_service_provider_details_by_pk$stripe_info(
      charge_fees_on_customer: (l$charge_fees_on_customer as bool?),
      charges_enabled: (l$charges_enabled as bool),
      details_submitted: (l$details_submitted as bool),
      email: (l$email as String?),
      payouts_enabled: (l$payouts_enabled as bool),
      requirements: l$requirements == null ? null : mapFromJson(l$requirements),
      id: (l$id as int),
      status: (l$status as String),
      stripe_id: (l$stripe_id as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final bool? charge_fees_on_customer;

  final bool charges_enabled;

  final bool details_submitted;

  final String? email;

  final bool payouts_enabled;

  final dynamic? requirements;

  final int id;

  final String status;

  final String stripe_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$charge_fees_on_customer = charge_fees_on_customer;
    _resultData['charge_fees_on_customer'] = l$charge_fees_on_customer;
    final l$charges_enabled = charges_enabled;
    _resultData['charges_enabled'] = l$charges_enabled;
    final l$details_submitted = details_submitted;
    _resultData['details_submitted'] = l$details_submitted;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$payouts_enabled = payouts_enabled;
    _resultData['payouts_enabled'] = l$payouts_enabled;
    final l$requirements = requirements;
    _resultData['requirements'] =
        l$requirements == null ? null : mapToJson(l$requirements);
    final l$id = id;
    _resultData['id'] = l$id;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$stripe_id = stripe_id;
    _resultData['stripe_id'] = l$stripe_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$charge_fees_on_customer = charge_fees_on_customer;
    final l$charges_enabled = charges_enabled;
    final l$details_submitted = details_submitted;
    final l$email = email;
    final l$payouts_enabled = payouts_enabled;
    final l$requirements = requirements;
    final l$id = id;
    final l$status = status;
    final l$stripe_id = stripe_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$charge_fees_on_customer,
      l$charges_enabled,
      l$details_submitted,
      l$email,
      l$payouts_enabled,
      l$requirements,
      l$id,
      l$status,
      l$stripe_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$updateServiceDetails$update_service_provider_details_by_pk$stripe_info) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$charge_fees_on_customer = charge_fees_on_customer;
    final lOther$charge_fees_on_customer = other.charge_fees_on_customer;
    if (l$charge_fees_on_customer != lOther$charge_fees_on_customer) {
      return false;
    }
    final l$charges_enabled = charges_enabled;
    final lOther$charges_enabled = other.charges_enabled;
    if (l$charges_enabled != lOther$charges_enabled) {
      return false;
    }
    final l$details_submitted = details_submitted;
    final lOther$details_submitted = other.details_submitted;
    if (l$details_submitted != lOther$details_submitted) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$payouts_enabled = payouts_enabled;
    final lOther$payouts_enabled = other.payouts_enabled;
    if (l$payouts_enabled != lOther$payouts_enabled) {
      return false;
    }
    final l$requirements = requirements;
    final lOther$requirements = other.requirements;
    if (l$requirements != lOther$requirements) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$stripe_id = stripe_id;
    final lOther$stripe_id = other.stripe_id;
    if (l$stripe_id != lOther$stripe_id) {
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

extension UtilityExtension$Mutation$updateServiceDetails$update_service_provider_details_by_pk$stripe_info
    on Mutation$updateServiceDetails$update_service_provider_details_by_pk$stripe_info {
  CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$stripe_info<
          Mutation$updateServiceDetails$update_service_provider_details_by_pk$stripe_info>
      get copyWith =>
          CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$stripe_info(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$stripe_info<
    TRes> {
  factory CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$stripe_info(
    Mutation$updateServiceDetails$update_service_provider_details_by_pk$stripe_info
        instance,
    TRes Function(
            Mutation$updateServiceDetails$update_service_provider_details_by_pk$stripe_info)
        then,
  ) = _CopyWithImpl$Mutation$updateServiceDetails$update_service_provider_details_by_pk$stripe_info;

  factory CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$stripe_info.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateServiceDetails$update_service_provider_details_by_pk$stripe_info;

  TRes call({
    bool? charge_fees_on_customer,
    bool? charges_enabled,
    bool? details_submitted,
    String? email,
    bool? payouts_enabled,
    dynamic? requirements,
    int? id,
    String? status,
    String? stripe_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$updateServiceDetails$update_service_provider_details_by_pk$stripe_info<
        TRes>
    implements
        CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$stripe_info<
            TRes> {
  _CopyWithImpl$Mutation$updateServiceDetails$update_service_provider_details_by_pk$stripe_info(
    this._instance,
    this._then,
  );

  final Mutation$updateServiceDetails$update_service_provider_details_by_pk$stripe_info
      _instance;

  final TRes Function(
          Mutation$updateServiceDetails$update_service_provider_details_by_pk$stripe_info)
      _then;

  static const _undefined = {};

  TRes call({
    Object? charge_fees_on_customer = _undefined,
    Object? charges_enabled = _undefined,
    Object? details_submitted = _undefined,
    Object? email = _undefined,
    Object? payouts_enabled = _undefined,
    Object? requirements = _undefined,
    Object? id = _undefined,
    Object? status = _undefined,
    Object? stripe_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$updateServiceDetails$update_service_provider_details_by_pk$stripe_info(
        charge_fees_on_customer: charge_fees_on_customer == _undefined
            ? _instance.charge_fees_on_customer
            : (charge_fees_on_customer as bool?),
        charges_enabled:
            charges_enabled == _undefined || charges_enabled == null
                ? _instance.charges_enabled
                : (charges_enabled as bool),
        details_submitted:
            details_submitted == _undefined || details_submitted == null
                ? _instance.details_submitted
                : (details_submitted as bool),
        email: email == _undefined ? _instance.email : (email as String?),
        payouts_enabled:
            payouts_enabled == _undefined || payouts_enabled == null
                ? _instance.payouts_enabled
                : (payouts_enabled as bool),
        requirements: requirements == _undefined
            ? _instance.requirements
            : (requirements as dynamic?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        stripe_id: stripe_id == _undefined || stripe_id == null
            ? _instance.stripe_id
            : (stripe_id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$updateServiceDetails$update_service_provider_details_by_pk$stripe_info<
        TRes>
    implements
        CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$stripe_info<
            TRes> {
  _CopyWithStubImpl$Mutation$updateServiceDetails$update_service_provider_details_by_pk$stripe_info(
      this._res);

  TRes _res;

  call({
    bool? charge_fees_on_customer,
    bool? charges_enabled,
    bool? details_submitted,
    String? email,
    bool? payouts_enabled,
    dynamic? requirements,
    int? id,
    String? status,
    String? stripe_id,
    String? $__typename,
  }) =>
      _res;
}

class Mutation$updateServiceDetails$update_service_provider_details_by_pk$location {
  Mutation$updateServiceDetails$update_service_provider_details_by_pk$location({
    required this.id,
    required this.gps,
    required this.address,
    required this.$__typename,
  });

  factory Mutation$updateServiceDetails$update_service_provider_details_by_pk$location.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$gps = json['gps'];
    final l$address = json['address'];
    final l$$__typename = json['__typename'];
    return Mutation$updateServiceDetails$update_service_provider_details_by_pk$location(
      id: (l$id as int),
      gps: geographyFromJson(l$gps),
      address: (l$address as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Geography gps;

  final String address;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
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
    final l$id = id;
    final l$gps = gps;
    final l$address = address;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
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
            is Mutation$updateServiceDetails$update_service_provider_details_by_pk$location) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Mutation$updateServiceDetails$update_service_provider_details_by_pk$location
    on Mutation$updateServiceDetails$update_service_provider_details_by_pk$location {
  CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$location<
          Mutation$updateServiceDetails$update_service_provider_details_by_pk$location>
      get copyWith =>
          CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$location<
    TRes> {
  factory CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$location(
    Mutation$updateServiceDetails$update_service_provider_details_by_pk$location
        instance,
    TRes Function(
            Mutation$updateServiceDetails$update_service_provider_details_by_pk$location)
        then,
  ) = _CopyWithImpl$Mutation$updateServiceDetails$update_service_provider_details_by_pk$location;

  factory CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$location.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateServiceDetails$update_service_provider_details_by_pk$location;

  TRes call({
    int? id,
    Geography? gps,
    String? address,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$updateServiceDetails$update_service_provider_details_by_pk$location<
        TRes>
    implements
        CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$location<
            TRes> {
  _CopyWithImpl$Mutation$updateServiceDetails$update_service_provider_details_by_pk$location(
    this._instance,
    this._then,
  );

  final Mutation$updateServiceDetails$update_service_provider_details_by_pk$location
      _instance;

  final TRes Function(
          Mutation$updateServiceDetails$update_service_provider_details_by_pk$location)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? gps = _undefined,
    Object? address = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$updateServiceDetails$update_service_provider_details_by_pk$location(
        id: id == _undefined || id == null ? _instance.id : (id as int),
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

class _CopyWithStubImpl$Mutation$updateServiceDetails$update_service_provider_details_by_pk$location<
        TRes>
    implements
        CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$location<
            TRes> {
  _CopyWithStubImpl$Mutation$updateServiceDetails$update_service_provider_details_by_pk$location(
      this._res);

  TRes _res;

  call({
    int? id,
    Geography? gps,
    String? address,
    String? $__typename,
  }) =>
      _res;
}

class Mutation$updateServiceDetails$update_service_provider_details_by_pk$description {
  Mutation$updateServiceDetails$update_service_provider_details_by_pk$description({
    required this.id,
    required this.translations,
    required this.$__typename,
  });

  factory Mutation$updateServiceDetails$update_service_provider_details_by_pk$description.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Mutation$updateServiceDetails$update_service_provider_details_by_pk$description(
      id: (l$id as int),
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Mutation$updateServiceDetails$update_service_provider_details_by_pk$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final List<
          Mutation$updateServiceDetails$update_service_provider_details_by_pk$description$translations>
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
            is Mutation$updateServiceDetails$update_service_provider_details_by_pk$description) ||
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

extension UtilityExtension$Mutation$updateServiceDetails$update_service_provider_details_by_pk$description
    on Mutation$updateServiceDetails$update_service_provider_details_by_pk$description {
  CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$description<
          Mutation$updateServiceDetails$update_service_provider_details_by_pk$description>
      get copyWith =>
          CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$description<
    TRes> {
  factory CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$description(
    Mutation$updateServiceDetails$update_service_provider_details_by_pk$description
        instance,
    TRes Function(
            Mutation$updateServiceDetails$update_service_provider_details_by_pk$description)
        then,
  ) = _CopyWithImpl$Mutation$updateServiceDetails$update_service_provider_details_by_pk$description;

  factory CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$description.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateServiceDetails$update_service_provider_details_by_pk$description;

  TRes call({
    int? id,
    List<Mutation$updateServiceDetails$update_service_provider_details_by_pk$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Mutation$updateServiceDetails$update_service_provider_details_by_pk$description$translations> Function(
              Iterable<
                  CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$description$translations<
                      Mutation$updateServiceDetails$update_service_provider_details_by_pk$description$translations>>)
          _fn);
}

class _CopyWithImpl$Mutation$updateServiceDetails$update_service_provider_details_by_pk$description<
        TRes>
    implements
        CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$description<
            TRes> {
  _CopyWithImpl$Mutation$updateServiceDetails$update_service_provider_details_by_pk$description(
    this._instance,
    this._then,
  );

  final Mutation$updateServiceDetails$update_service_provider_details_by_pk$description
      _instance;

  final TRes Function(
          Mutation$updateServiceDetails$update_service_provider_details_by_pk$description)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$updateServiceDetails$update_service_provider_details_by_pk$description(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Mutation$updateServiceDetails$update_service_provider_details_by_pk$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Mutation$updateServiceDetails$update_service_provider_details_by_pk$description$translations> Function(
                  Iterable<
                      CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$description$translations<
                          Mutation$updateServiceDetails$update_service_provider_details_by_pk$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Mutation$updateServiceDetails$update_service_provider_details_by_pk$description<
        TRes>
    implements
        CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$description<
            TRes> {
  _CopyWithStubImpl$Mutation$updateServiceDetails$update_service_provider_details_by_pk$description(
      this._res);

  TRes _res;

  call({
    int? id,
    List<Mutation$updateServiceDetails$update_service_provider_details_by_pk$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Mutation$updateServiceDetails$update_service_provider_details_by_pk$description$translations {
  Mutation$updateServiceDetails$update_service_provider_details_by_pk$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Mutation$updateServiceDetails$update_service_provider_details_by_pk$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Mutation$updateServiceDetails$update_service_provider_details_by_pk$description$translations(
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
            is Mutation$updateServiceDetails$update_service_provider_details_by_pk$description$translations) ||
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

extension UtilityExtension$Mutation$updateServiceDetails$update_service_provider_details_by_pk$description$translations
    on Mutation$updateServiceDetails$update_service_provider_details_by_pk$description$translations {
  CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$description$translations<
          Mutation$updateServiceDetails$update_service_provider_details_by_pk$description$translations>
      get copyWith =>
          CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$description$translations<
    TRes> {
  factory CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$description$translations(
    Mutation$updateServiceDetails$update_service_provider_details_by_pk$description$translations
        instance,
    TRes Function(
            Mutation$updateServiceDetails$update_service_provider_details_by_pk$description$translations)
        then,
  ) = _CopyWithImpl$Mutation$updateServiceDetails$update_service_provider_details_by_pk$description$translations;

  factory CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateServiceDetails$update_service_provider_details_by_pk$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$updateServiceDetails$update_service_provider_details_by_pk$description$translations<
        TRes>
    implements
        CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$description$translations<
            TRes> {
  _CopyWithImpl$Mutation$updateServiceDetails$update_service_provider_details_by_pk$description$translations(
    this._instance,
    this._then,
  );

  final Mutation$updateServiceDetails$update_service_provider_details_by_pk$description$translations
      _instance;

  final TRes Function(
          Mutation$updateServiceDetails$update_service_provider_details_by_pk$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$updateServiceDetails$update_service_provider_details_by_pk$description$translations(
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

class _CopyWithStubImpl$Mutation$updateServiceDetails$update_service_provider_details_by_pk$description$translations<
        TRes>
    implements
        CopyWith$Mutation$updateServiceDetails$update_service_provider_details_by_pk$description$translations<
            TRes> {
  _CopyWithStubImpl$Mutation$updateServiceDetails$update_service_provider_details_by_pk$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getServiceInfo {
  factory Variables$Query$getServiceInfo({required int serviceDetailsId}) =>
      Variables$Query$getServiceInfo._({
        r'serviceDetailsId': serviceDetailsId,
      });

  Variables$Query$getServiceInfo._(this._$data);

  factory Variables$Query$getServiceInfo.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$serviceDetailsId = data['serviceDetailsId'];
    result$data['serviceDetailsId'] = (l$serviceDetailsId as int);
    return Variables$Query$getServiceInfo._(result$data);
  }

  Map<String, dynamic> _$data;

  int get serviceDetailsId => (_$data['serviceDetailsId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$serviceDetailsId = serviceDetailsId;
    result$data['serviceDetailsId'] = l$serviceDetailsId;
    return result$data;
  }

  CopyWith$Variables$Query$getServiceInfo<Variables$Query$getServiceInfo>
      get copyWith => CopyWith$Variables$Query$getServiceInfo(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getServiceInfo) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$serviceDetailsId = serviceDetailsId;
    final lOther$serviceDetailsId = other.serviceDetailsId;
    if (l$serviceDetailsId != lOther$serviceDetailsId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$serviceDetailsId = serviceDetailsId;
    return Object.hashAll([l$serviceDetailsId]);
  }
}

abstract class CopyWith$Variables$Query$getServiceInfo<TRes> {
  factory CopyWith$Variables$Query$getServiceInfo(
    Variables$Query$getServiceInfo instance,
    TRes Function(Variables$Query$getServiceInfo) then,
  ) = _CopyWithImpl$Variables$Query$getServiceInfo;

  factory CopyWith$Variables$Query$getServiceInfo.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getServiceInfo;

  TRes call({int? serviceDetailsId});
}

class _CopyWithImpl$Variables$Query$getServiceInfo<TRes>
    implements CopyWith$Variables$Query$getServiceInfo<TRes> {
  _CopyWithImpl$Variables$Query$getServiceInfo(
    this._instance,
    this._then,
  );

  final Variables$Query$getServiceInfo _instance;

  final TRes Function(Variables$Query$getServiceInfo) _then;

  static const _undefined = {};

  TRes call({Object? serviceDetailsId = _undefined}) =>
      _then(Variables$Query$getServiceInfo._({
        ..._instance._$data,
        if (serviceDetailsId != _undefined && serviceDetailsId != null)
          'serviceDetailsId': (serviceDetailsId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getServiceInfo<TRes>
    implements CopyWith$Variables$Query$getServiceInfo<TRes> {
  _CopyWithStubImpl$Variables$Query$getServiceInfo(this._res);

  TRes _res;

  call({int? serviceDetailsId}) => _res;
}

class Query$getServiceInfo {
  Query$getServiceInfo({
    this.service_provider_details_by_pk,
    required this.$__typename,
  });

  factory Query$getServiceInfo.fromJson(Map<String, dynamic> json) {
    final l$service_provider_details_by_pk =
        json['service_provider_details_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$getServiceInfo(
      service_provider_details_by_pk: l$service_provider_details_by_pk == null
          ? null
          : Query$getServiceInfo$service_provider_details_by_pk.fromJson(
              (l$service_provider_details_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getServiceInfo$service_provider_details_by_pk?
      service_provider_details_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$service_provider_details_by_pk = service_provider_details_by_pk;
    _resultData['service_provider_details_by_pk'] =
        l$service_provider_details_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$service_provider_details_by_pk = service_provider_details_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$service_provider_details_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getServiceInfo) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$service_provider_details_by_pk = service_provider_details_by_pk;
    final lOther$service_provider_details_by_pk =
        other.service_provider_details_by_pk;
    if (l$service_provider_details_by_pk !=
        lOther$service_provider_details_by_pk) {
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

extension UtilityExtension$Query$getServiceInfo on Query$getServiceInfo {
  CopyWith$Query$getServiceInfo<Query$getServiceInfo> get copyWith =>
      CopyWith$Query$getServiceInfo(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getServiceInfo<TRes> {
  factory CopyWith$Query$getServiceInfo(
    Query$getServiceInfo instance,
    TRes Function(Query$getServiceInfo) then,
  ) = _CopyWithImpl$Query$getServiceInfo;

  factory CopyWith$Query$getServiceInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$getServiceInfo;

  TRes call({
    Query$getServiceInfo$service_provider_details_by_pk?
        service_provider_details_by_pk,
    String? $__typename,
  });
  CopyWith$Query$getServiceInfo$service_provider_details_by_pk<TRes>
      get service_provider_details_by_pk;
}

class _CopyWithImpl$Query$getServiceInfo<TRes>
    implements CopyWith$Query$getServiceInfo<TRes> {
  _CopyWithImpl$Query$getServiceInfo(
    this._instance,
    this._then,
  );

  final Query$getServiceInfo _instance;

  final TRes Function(Query$getServiceInfo) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_details_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getServiceInfo(
        service_provider_details_by_pk:
            service_provider_details_by_pk == _undefined
                ? _instance.service_provider_details_by_pk
                : (service_provider_details_by_pk
                    as Query$getServiceInfo$service_provider_details_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getServiceInfo$service_provider_details_by_pk<TRes>
      get service_provider_details_by_pk {
    final local$service_provider_details_by_pk =
        _instance.service_provider_details_by_pk;
    return local$service_provider_details_by_pk == null
        ? CopyWith$Query$getServiceInfo$service_provider_details_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$getServiceInfo$service_provider_details_by_pk(
            local$service_provider_details_by_pk,
            (e) => call(service_provider_details_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$getServiceInfo<TRes>
    implements CopyWith$Query$getServiceInfo<TRes> {
  _CopyWithStubImpl$Query$getServiceInfo(this._res);

  TRes _res;

  call({
    Query$getServiceInfo$service_provider_details_by_pk?
        service_provider_details_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getServiceInfo$service_provider_details_by_pk<TRes>
      get service_provider_details_by_pk =>
          CopyWith$Query$getServiceInfo$service_provider_details_by_pk.stub(
              _res);
}

const documentNodeQuerygetServiceInfo = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getServiceInfo'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'serviceDetailsId')),
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
        name: NameNode(value: 'service_provider_details_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'serviceDetailsId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'description_id'),
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
            name: NameNode(value: 'is_open'),
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
            name: NameNode(value: 'unique_id'),
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
            name: NameNode(value: 'language'),
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
            name: NameNode(value: 'location'),
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
Query$getServiceInfo _parserFn$Query$getServiceInfo(
        Map<String, dynamic> data) =>
    Query$getServiceInfo.fromJson(data);

class Options$Query$getServiceInfo
    extends graphql.QueryOptions<Query$getServiceInfo> {
  Options$Query$getServiceInfo({
    String? operationName,
    required Variables$Query$getServiceInfo variables,
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
          document: documentNodeQuerygetServiceInfo,
          parserFn: _parserFn$Query$getServiceInfo,
        );
}

class WatchOptions$Query$getServiceInfo
    extends graphql.WatchQueryOptions<Query$getServiceInfo> {
  WatchOptions$Query$getServiceInfo({
    String? operationName,
    required Variables$Query$getServiceInfo variables,
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
          document: documentNodeQuerygetServiceInfo,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getServiceInfo,
        );
}

class FetchMoreOptions$Query$getServiceInfo extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getServiceInfo({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getServiceInfo variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetServiceInfo,
        );
}

extension ClientExtension$Query$getServiceInfo on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getServiceInfo>> query$getServiceInfo(
          Options$Query$getServiceInfo options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$getServiceInfo> watchQuery$getServiceInfo(
          WatchOptions$Query$getServiceInfo options) =>
      this.watchQuery(options);
  void writeQuery$getServiceInfo({
    required Query$getServiceInfo data,
    required Variables$Query$getServiceInfo variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerygetServiceInfo),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getServiceInfo? readQuery$getServiceInfo({
    required Variables$Query$getServiceInfo variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQuerygetServiceInfo),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getServiceInfo.fromJson(result);
  }
}

class Query$getServiceInfo$service_provider_details_by_pk {
  Query$getServiceInfo$service_provider_details_by_pk({
    this.description_id,
    this.firebase_id,
    required this.id,
    required this.image,
    this.is_open,
    required this.name,
    required this.unique_id,
    this.phone_number,
    required this.language,
    required this.service_provider_type,
    required this.location,
    this.description,
    required this.$__typename,
  });

  factory Query$getServiceInfo$service_provider_details_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$description_id = json['description_id'];
    final l$firebase_id = json['firebase_id'];
    final l$id = json['id'];
    final l$image = json['image'];
    final l$is_open = json['is_open'];
    final l$name = json['name'];
    final l$unique_id = json['unique_id'];
    final l$phone_number = json['phone_number'];
    final l$language = json['language'];
    final l$service_provider_type = json['service_provider_type'];
    final l$location = json['location'];
    final l$description = json['description'];
    final l$$__typename = json['__typename'];
    return Query$getServiceInfo$service_provider_details_by_pk(
      description_id: (l$description_id as int?),
      firebase_id: (l$firebase_id as String?),
      id: (l$id as int),
      image: (l$image as String),
      is_open: (l$is_open as bool?),
      name: (l$name as String),
      unique_id: (l$unique_id as String),
      phone_number: (l$phone_number as String?),
      language: mapFromJson(l$language),
      service_provider_type: (l$service_provider_type as String),
      location:
          Query$getServiceInfo$service_provider_details_by_pk$location.fromJson(
              (l$location as Map<String, dynamic>)),
      description: l$description == null
          ? null
          : Query$getServiceInfo$service_provider_details_by_pk$description
              .fromJson((l$description as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int? description_id;

  final String? firebase_id;

  final int id;

  final String image;

  final bool? is_open;

  final String name;

  final String unique_id;

  final String? phone_number;

  final dynamic language;

  final String service_provider_type;

  final Query$getServiceInfo$service_provider_details_by_pk$location location;

  final Query$getServiceInfo$service_provider_details_by_pk$description?
      description;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$description_id = description_id;
    _resultData['description_id'] = l$description_id;
    final l$firebase_id = firebase_id;
    _resultData['firebase_id'] = l$firebase_id;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$is_open = is_open;
    _resultData['is_open'] = l$is_open;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$unique_id = unique_id;
    _resultData['unique_id'] = l$unique_id;
    final l$phone_number = phone_number;
    _resultData['phone_number'] = l$phone_number;
    final l$language = language;
    _resultData['language'] = mapToJson(l$language);
    final l$service_provider_type = service_provider_type;
    _resultData['service_provider_type'] = l$service_provider_type;
    final l$location = location;
    _resultData['location'] = l$location.toJson();
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$description_id = description_id;
    final l$firebase_id = firebase_id;
    final l$id = id;
    final l$image = image;
    final l$is_open = is_open;
    final l$name = name;
    final l$unique_id = unique_id;
    final l$phone_number = phone_number;
    final l$language = language;
    final l$service_provider_type = service_provider_type;
    final l$location = location;
    final l$description = description;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$description_id,
      l$firebase_id,
      l$id,
      l$image,
      l$is_open,
      l$name,
      l$unique_id,
      l$phone_number,
      l$language,
      l$service_provider_type,
      l$location,
      l$description,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getServiceInfo$service_provider_details_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$description_id = description_id;
    final lOther$description_id = other.description_id;
    if (l$description_id != lOther$description_id) {
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
    final l$is_open = is_open;
    final lOther$is_open = other.is_open;
    if (l$is_open != lOther$is_open) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$unique_id = unique_id;
    final lOther$unique_id = other.unique_id;
    if (l$unique_id != lOther$unique_id) {
      return false;
    }
    final l$phone_number = phone_number;
    final lOther$phone_number = other.phone_number;
    if (l$phone_number != lOther$phone_number) {
      return false;
    }
    final l$language = language;
    final lOther$language = other.language;
    if (l$language != lOther$language) {
      return false;
    }
    final l$service_provider_type = service_provider_type;
    final lOther$service_provider_type = other.service_provider_type;
    if (l$service_provider_type != lOther$service_provider_type) {
      return false;
    }
    final l$location = location;
    final lOther$location = other.location;
    if (l$location != lOther$location) {
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

extension UtilityExtension$Query$getServiceInfo$service_provider_details_by_pk
    on Query$getServiceInfo$service_provider_details_by_pk {
  CopyWith$Query$getServiceInfo$service_provider_details_by_pk<
          Query$getServiceInfo$service_provider_details_by_pk>
      get copyWith =>
          CopyWith$Query$getServiceInfo$service_provider_details_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getServiceInfo$service_provider_details_by_pk<
    TRes> {
  factory CopyWith$Query$getServiceInfo$service_provider_details_by_pk(
    Query$getServiceInfo$service_provider_details_by_pk instance,
    TRes Function(Query$getServiceInfo$service_provider_details_by_pk) then,
  ) = _CopyWithImpl$Query$getServiceInfo$service_provider_details_by_pk;

  factory CopyWith$Query$getServiceInfo$service_provider_details_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getServiceInfo$service_provider_details_by_pk;

  TRes call({
    int? description_id,
    String? firebase_id,
    int? id,
    String? image,
    bool? is_open,
    String? name,
    String? unique_id,
    String? phone_number,
    dynamic? language,
    String? service_provider_type,
    Query$getServiceInfo$service_provider_details_by_pk$location? location,
    Query$getServiceInfo$service_provider_details_by_pk$description?
        description,
    String? $__typename,
  });
  CopyWith$Query$getServiceInfo$service_provider_details_by_pk$location<TRes>
      get location;
  CopyWith$Query$getServiceInfo$service_provider_details_by_pk$description<TRes>
      get description;
}

class _CopyWithImpl$Query$getServiceInfo$service_provider_details_by_pk<TRes>
    implements
        CopyWith$Query$getServiceInfo$service_provider_details_by_pk<TRes> {
  _CopyWithImpl$Query$getServiceInfo$service_provider_details_by_pk(
    this._instance,
    this._then,
  );

  final Query$getServiceInfo$service_provider_details_by_pk _instance;

  final TRes Function(Query$getServiceInfo$service_provider_details_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? description_id = _undefined,
    Object? firebase_id = _undefined,
    Object? id = _undefined,
    Object? image = _undefined,
    Object? is_open = _undefined,
    Object? name = _undefined,
    Object? unique_id = _undefined,
    Object? phone_number = _undefined,
    Object? language = _undefined,
    Object? service_provider_type = _undefined,
    Object? location = _undefined,
    Object? description = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getServiceInfo$service_provider_details_by_pk(
        description_id: description_id == _undefined
            ? _instance.description_id
            : (description_id as int?),
        firebase_id: firebase_id == _undefined
            ? _instance.firebase_id
            : (firebase_id as String?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        is_open: is_open == _undefined ? _instance.is_open : (is_open as bool?),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        unique_id: unique_id == _undefined || unique_id == null
            ? _instance.unique_id
            : (unique_id as String),
        phone_number: phone_number == _undefined
            ? _instance.phone_number
            : (phone_number as String?),
        language: language == _undefined || language == null
            ? _instance.language
            : (language as dynamic),
        service_provider_type:
            service_provider_type == _undefined || service_provider_type == null
                ? _instance.service_provider_type
                : (service_provider_type as String),
        location: location == _undefined || location == null
            ? _instance.location
            : (location
                as Query$getServiceInfo$service_provider_details_by_pk$location),
        description: description == _undefined
            ? _instance.description
            : (description
                as Query$getServiceInfo$service_provider_details_by_pk$description?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getServiceInfo$service_provider_details_by_pk$location<TRes>
      get location {
    final local$location = _instance.location;
    return CopyWith$Query$getServiceInfo$service_provider_details_by_pk$location(
        local$location, (e) => call(location: e));
  }

  CopyWith$Query$getServiceInfo$service_provider_details_by_pk$description<TRes>
      get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Query$getServiceInfo$service_provider_details_by_pk$description
            .stub(_then(_instance))
        : CopyWith$Query$getServiceInfo$service_provider_details_by_pk$description(
            local$description, (e) => call(description: e));
  }
}

class _CopyWithStubImpl$Query$getServiceInfo$service_provider_details_by_pk<
        TRes>
    implements
        CopyWith$Query$getServiceInfo$service_provider_details_by_pk<TRes> {
  _CopyWithStubImpl$Query$getServiceInfo$service_provider_details_by_pk(
      this._res);

  TRes _res;

  call({
    int? description_id,
    String? firebase_id,
    int? id,
    String? image,
    bool? is_open,
    String? name,
    String? unique_id,
    String? phone_number,
    dynamic? language,
    String? service_provider_type,
    Query$getServiceInfo$service_provider_details_by_pk$location? location,
    Query$getServiceInfo$service_provider_details_by_pk$description?
        description,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getServiceInfo$service_provider_details_by_pk$location<TRes>
      get location =>
          CopyWith$Query$getServiceInfo$service_provider_details_by_pk$location
              .stub(_res);
  CopyWith$Query$getServiceInfo$service_provider_details_by_pk$description<TRes>
      get description =>
          CopyWith$Query$getServiceInfo$service_provider_details_by_pk$description
              .stub(_res);
}

class Query$getServiceInfo$service_provider_details_by_pk$location {
  Query$getServiceInfo$service_provider_details_by_pk$location({
    required this.id,
    required this.gps,
    required this.address,
    required this.$__typename,
  });

  factory Query$getServiceInfo$service_provider_details_by_pk$location.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$gps = json['gps'];
    final l$address = json['address'];
    final l$$__typename = json['__typename'];
    return Query$getServiceInfo$service_provider_details_by_pk$location(
      id: (l$id as int),
      gps: geographyFromJson(l$gps),
      address: (l$address as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Geography gps;

  final String address;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
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
    final l$id = id;
    final l$gps = gps;
    final l$address = address;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
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
            is Query$getServiceInfo$service_provider_details_by_pk$location) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Query$getServiceInfo$service_provider_details_by_pk$location
    on Query$getServiceInfo$service_provider_details_by_pk$location {
  CopyWith$Query$getServiceInfo$service_provider_details_by_pk$location<
          Query$getServiceInfo$service_provider_details_by_pk$location>
      get copyWith =>
          CopyWith$Query$getServiceInfo$service_provider_details_by_pk$location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getServiceInfo$service_provider_details_by_pk$location<
    TRes> {
  factory CopyWith$Query$getServiceInfo$service_provider_details_by_pk$location(
    Query$getServiceInfo$service_provider_details_by_pk$location instance,
    TRes Function(Query$getServiceInfo$service_provider_details_by_pk$location)
        then,
  ) = _CopyWithImpl$Query$getServiceInfo$service_provider_details_by_pk$location;

  factory CopyWith$Query$getServiceInfo$service_provider_details_by_pk$location.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getServiceInfo$service_provider_details_by_pk$location;

  TRes call({
    int? id,
    Geography? gps,
    String? address,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getServiceInfo$service_provider_details_by_pk$location<
        TRes>
    implements
        CopyWith$Query$getServiceInfo$service_provider_details_by_pk$location<
            TRes> {
  _CopyWithImpl$Query$getServiceInfo$service_provider_details_by_pk$location(
    this._instance,
    this._then,
  );

  final Query$getServiceInfo$service_provider_details_by_pk$location _instance;

  final TRes Function(
      Query$getServiceInfo$service_provider_details_by_pk$location) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? gps = _undefined,
    Object? address = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getServiceInfo$service_provider_details_by_pk$location(
        id: id == _undefined || id == null ? _instance.id : (id as int),
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

class _CopyWithStubImpl$Query$getServiceInfo$service_provider_details_by_pk$location<
        TRes>
    implements
        CopyWith$Query$getServiceInfo$service_provider_details_by_pk$location<
            TRes> {
  _CopyWithStubImpl$Query$getServiceInfo$service_provider_details_by_pk$location(
      this._res);

  TRes _res;

  call({
    int? id,
    Geography? gps,
    String? address,
    String? $__typename,
  }) =>
      _res;
}

class Query$getServiceInfo$service_provider_details_by_pk$description {
  Query$getServiceInfo$service_provider_details_by_pk$description({
    required this.translations,
    required this.$__typename,
  });

  factory Query$getServiceInfo$service_provider_details_by_pk$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getServiceInfo$service_provider_details_by_pk$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getServiceInfo$service_provider_details_by_pk$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$getServiceInfo$service_provider_details_by_pk$description$translations>
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
            is Query$getServiceInfo$service_provider_details_by_pk$description) ||
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

extension UtilityExtension$Query$getServiceInfo$service_provider_details_by_pk$description
    on Query$getServiceInfo$service_provider_details_by_pk$description {
  CopyWith$Query$getServiceInfo$service_provider_details_by_pk$description<
          Query$getServiceInfo$service_provider_details_by_pk$description>
      get copyWith =>
          CopyWith$Query$getServiceInfo$service_provider_details_by_pk$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getServiceInfo$service_provider_details_by_pk$description<
    TRes> {
  factory CopyWith$Query$getServiceInfo$service_provider_details_by_pk$description(
    Query$getServiceInfo$service_provider_details_by_pk$description instance,
    TRes Function(
            Query$getServiceInfo$service_provider_details_by_pk$description)
        then,
  ) = _CopyWithImpl$Query$getServiceInfo$service_provider_details_by_pk$description;

  factory CopyWith$Query$getServiceInfo$service_provider_details_by_pk$description.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getServiceInfo$service_provider_details_by_pk$description;

  TRes call({
    List<Query$getServiceInfo$service_provider_details_by_pk$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getServiceInfo$service_provider_details_by_pk$description$translations> Function(
              Iterable<
                  CopyWith$Query$getServiceInfo$service_provider_details_by_pk$description$translations<
                      Query$getServiceInfo$service_provider_details_by_pk$description$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getServiceInfo$service_provider_details_by_pk$description<
        TRes>
    implements
        CopyWith$Query$getServiceInfo$service_provider_details_by_pk$description<
            TRes> {
  _CopyWithImpl$Query$getServiceInfo$service_provider_details_by_pk$description(
    this._instance,
    this._then,
  );

  final Query$getServiceInfo$service_provider_details_by_pk$description
      _instance;

  final TRes Function(
      Query$getServiceInfo$service_provider_details_by_pk$description) _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getServiceInfo$service_provider_details_by_pk$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getServiceInfo$service_provider_details_by_pk$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getServiceInfo$service_provider_details_by_pk$description$translations> Function(
                  Iterable<
                      CopyWith$Query$getServiceInfo$service_provider_details_by_pk$description$translations<
                          Query$getServiceInfo$service_provider_details_by_pk$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getServiceInfo$service_provider_details_by_pk$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getServiceInfo$service_provider_details_by_pk$description<
        TRes>
    implements
        CopyWith$Query$getServiceInfo$service_provider_details_by_pk$description<
            TRes> {
  _CopyWithStubImpl$Query$getServiceInfo$service_provider_details_by_pk$description(
      this._res);

  TRes _res;

  call({
    List<Query$getServiceInfo$service_provider_details_by_pk$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getServiceInfo$service_provider_details_by_pk$description$translations {
  Query$getServiceInfo$service_provider_details_by_pk$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getServiceInfo$service_provider_details_by_pk$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getServiceInfo$service_provider_details_by_pk$description$translations(
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
            is Query$getServiceInfo$service_provider_details_by_pk$description$translations) ||
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

extension UtilityExtension$Query$getServiceInfo$service_provider_details_by_pk$description$translations
    on Query$getServiceInfo$service_provider_details_by_pk$description$translations {
  CopyWith$Query$getServiceInfo$service_provider_details_by_pk$description$translations<
          Query$getServiceInfo$service_provider_details_by_pk$description$translations>
      get copyWith =>
          CopyWith$Query$getServiceInfo$service_provider_details_by_pk$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getServiceInfo$service_provider_details_by_pk$description$translations<
    TRes> {
  factory CopyWith$Query$getServiceInfo$service_provider_details_by_pk$description$translations(
    Query$getServiceInfo$service_provider_details_by_pk$description$translations
        instance,
    TRes Function(
            Query$getServiceInfo$service_provider_details_by_pk$description$translations)
        then,
  ) = _CopyWithImpl$Query$getServiceInfo$service_provider_details_by_pk$description$translations;

  factory CopyWith$Query$getServiceInfo$service_provider_details_by_pk$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getServiceInfo$service_provider_details_by_pk$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getServiceInfo$service_provider_details_by_pk$description$translations<
        TRes>
    implements
        CopyWith$Query$getServiceInfo$service_provider_details_by_pk$description$translations<
            TRes> {
  _CopyWithImpl$Query$getServiceInfo$service_provider_details_by_pk$description$translations(
    this._instance,
    this._then,
  );

  final Query$getServiceInfo$service_provider_details_by_pk$description$translations
      _instance;

  final TRes Function(
          Query$getServiceInfo$service_provider_details_by_pk$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getServiceInfo$service_provider_details_by_pk$description$translations(
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

class _CopyWithStubImpl$Query$getServiceInfo$service_provider_details_by_pk$description$translations<
        TRes>
    implements
        CopyWith$Query$getServiceInfo$service_provider_details_by_pk$description$translations<
            TRes> {
  _CopyWithStubImpl$Query$getServiceInfo$service_provider_details_by_pk$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getServiceSchedule {
  factory Variables$Query$getServiceSchedule({required int serviceDetailsId}) =>
      Variables$Query$getServiceSchedule._({
        r'serviceDetailsId': serviceDetailsId,
      });

  Variables$Query$getServiceSchedule._(this._$data);

  factory Variables$Query$getServiceSchedule.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$serviceDetailsId = data['serviceDetailsId'];
    result$data['serviceDetailsId'] = (l$serviceDetailsId as int);
    return Variables$Query$getServiceSchedule._(result$data);
  }

  Map<String, dynamic> _$data;

  int get serviceDetailsId => (_$data['serviceDetailsId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$serviceDetailsId = serviceDetailsId;
    result$data['serviceDetailsId'] = l$serviceDetailsId;
    return result$data;
  }

  CopyWith$Variables$Query$getServiceSchedule<
          Variables$Query$getServiceSchedule>
      get copyWith => CopyWith$Variables$Query$getServiceSchedule(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getServiceSchedule) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$serviceDetailsId = serviceDetailsId;
    final lOther$serviceDetailsId = other.serviceDetailsId;
    if (l$serviceDetailsId != lOther$serviceDetailsId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$serviceDetailsId = serviceDetailsId;
    return Object.hashAll([l$serviceDetailsId]);
  }
}

abstract class CopyWith$Variables$Query$getServiceSchedule<TRes> {
  factory CopyWith$Variables$Query$getServiceSchedule(
    Variables$Query$getServiceSchedule instance,
    TRes Function(Variables$Query$getServiceSchedule) then,
  ) = _CopyWithImpl$Variables$Query$getServiceSchedule;

  factory CopyWith$Variables$Query$getServiceSchedule.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getServiceSchedule;

  TRes call({int? serviceDetailsId});
}

class _CopyWithImpl$Variables$Query$getServiceSchedule<TRes>
    implements CopyWith$Variables$Query$getServiceSchedule<TRes> {
  _CopyWithImpl$Variables$Query$getServiceSchedule(
    this._instance,
    this._then,
  );

  final Variables$Query$getServiceSchedule _instance;

  final TRes Function(Variables$Query$getServiceSchedule) _then;

  static const _undefined = {};

  TRes call({Object? serviceDetailsId = _undefined}) =>
      _then(Variables$Query$getServiceSchedule._({
        ..._instance._$data,
        if (serviceDetailsId != _undefined && serviceDetailsId != null)
          'serviceDetailsId': (serviceDetailsId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getServiceSchedule<TRes>
    implements CopyWith$Variables$Query$getServiceSchedule<TRes> {
  _CopyWithStubImpl$Variables$Query$getServiceSchedule(this._res);

  TRes _res;

  call({int? serviceDetailsId}) => _res;
}

class Query$getServiceSchedule {
  Query$getServiceSchedule({
    this.service_provider_details_by_pk,
    required this.$__typename,
  });

  factory Query$getServiceSchedule.fromJson(Map<String, dynamic> json) {
    final l$service_provider_details_by_pk =
        json['service_provider_details_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$getServiceSchedule(
      service_provider_details_by_pk: l$service_provider_details_by_pk == null
          ? null
          : Query$getServiceSchedule$service_provider_details_by_pk.fromJson(
              (l$service_provider_details_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getServiceSchedule$service_provider_details_by_pk?
      service_provider_details_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$service_provider_details_by_pk = service_provider_details_by_pk;
    _resultData['service_provider_details_by_pk'] =
        l$service_provider_details_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$service_provider_details_by_pk = service_provider_details_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$service_provider_details_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getServiceSchedule) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$service_provider_details_by_pk = service_provider_details_by_pk;
    final lOther$service_provider_details_by_pk =
        other.service_provider_details_by_pk;
    if (l$service_provider_details_by_pk !=
        lOther$service_provider_details_by_pk) {
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

extension UtilityExtension$Query$getServiceSchedule
    on Query$getServiceSchedule {
  CopyWith$Query$getServiceSchedule<Query$getServiceSchedule> get copyWith =>
      CopyWith$Query$getServiceSchedule(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getServiceSchedule<TRes> {
  factory CopyWith$Query$getServiceSchedule(
    Query$getServiceSchedule instance,
    TRes Function(Query$getServiceSchedule) then,
  ) = _CopyWithImpl$Query$getServiceSchedule;

  factory CopyWith$Query$getServiceSchedule.stub(TRes res) =
      _CopyWithStubImpl$Query$getServiceSchedule;

  TRes call({
    Query$getServiceSchedule$service_provider_details_by_pk?
        service_provider_details_by_pk,
    String? $__typename,
  });
  CopyWith$Query$getServiceSchedule$service_provider_details_by_pk<TRes>
      get service_provider_details_by_pk;
}

class _CopyWithImpl$Query$getServiceSchedule<TRes>
    implements CopyWith$Query$getServiceSchedule<TRes> {
  _CopyWithImpl$Query$getServiceSchedule(
    this._instance,
    this._then,
  );

  final Query$getServiceSchedule _instance;

  final TRes Function(Query$getServiceSchedule) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_details_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getServiceSchedule(
        service_provider_details_by_pk: service_provider_details_by_pk ==
                _undefined
            ? _instance.service_provider_details_by_pk
            : (service_provider_details_by_pk
                as Query$getServiceSchedule$service_provider_details_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getServiceSchedule$service_provider_details_by_pk<TRes>
      get service_provider_details_by_pk {
    final local$service_provider_details_by_pk =
        _instance.service_provider_details_by_pk;
    return local$service_provider_details_by_pk == null
        ? CopyWith$Query$getServiceSchedule$service_provider_details_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$getServiceSchedule$service_provider_details_by_pk(
            local$service_provider_details_by_pk,
            (e) => call(service_provider_details_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$getServiceSchedule<TRes>
    implements CopyWith$Query$getServiceSchedule<TRes> {
  _CopyWithStubImpl$Query$getServiceSchedule(this._res);

  TRes _res;

  call({
    Query$getServiceSchedule$service_provider_details_by_pk?
        service_provider_details_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getServiceSchedule$service_provider_details_by_pk<TRes>
      get service_provider_details_by_pk =>
          CopyWith$Query$getServiceSchedule$service_provider_details_by_pk.stub(
              _res);
}

const documentNodeQuerygetServiceSchedule = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getServiceSchedule'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'serviceDetailsId')),
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
        name: NameNode(value: 'service_provider_details_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'serviceDetailsId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
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
      
    ]),
  ),
]);
Query$getServiceSchedule _parserFn$Query$getServiceSchedule(
        Map<String, dynamic> data) =>
    Query$getServiceSchedule.fromJson(data);

class Options$Query$getServiceSchedule
    extends graphql.QueryOptions<Query$getServiceSchedule> {
  Options$Query$getServiceSchedule({
    String? operationName,
    required Variables$Query$getServiceSchedule variables,
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
          document: documentNodeQuerygetServiceSchedule,
          parserFn: _parserFn$Query$getServiceSchedule,
        );
}

class WatchOptions$Query$getServiceSchedule
    extends graphql.WatchQueryOptions<Query$getServiceSchedule> {
  WatchOptions$Query$getServiceSchedule({
    String? operationName,
    required Variables$Query$getServiceSchedule variables,
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
          document: documentNodeQuerygetServiceSchedule,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getServiceSchedule,
        );
}

class FetchMoreOptions$Query$getServiceSchedule
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getServiceSchedule({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getServiceSchedule variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetServiceSchedule,
        );
}

extension ClientExtension$Query$getServiceSchedule on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getServiceSchedule>>
      query$getServiceSchedule(
              Options$Query$getServiceSchedule options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getServiceSchedule>
      watchQuery$getServiceSchedule(
              WatchOptions$Query$getServiceSchedule options) =>
          this.watchQuery(options);
  void writeQuery$getServiceSchedule({
    required Query$getServiceSchedule data,
    required Variables$Query$getServiceSchedule variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerygetServiceSchedule),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getServiceSchedule? readQuery$getServiceSchedule({
    required Variables$Query$getServiceSchedule variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetServiceSchedule),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getServiceSchedule.fromJson(result);
  }
}

class Query$getServiceSchedule$service_provider_details_by_pk {
  Query$getServiceSchedule$service_provider_details_by_pk({
    this.schedule,
    required this.$__typename,
  });

  factory Query$getServiceSchedule$service_provider_details_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$schedule = json['schedule'];
    final l$$__typename = json['__typename'];
    return Query$getServiceSchedule$service_provider_details_by_pk(
      schedule: l$schedule == null ? null : mapFromJson(l$schedule),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final dynamic? schedule;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$schedule = schedule;
    _resultData['schedule'] = l$schedule == null ? null : mapToJson(l$schedule);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$schedule = schedule;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$schedule,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getServiceSchedule$service_provider_details_by_pk) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$getServiceSchedule$service_provider_details_by_pk
    on Query$getServiceSchedule$service_provider_details_by_pk {
  CopyWith$Query$getServiceSchedule$service_provider_details_by_pk<
          Query$getServiceSchedule$service_provider_details_by_pk>
      get copyWith =>
          CopyWith$Query$getServiceSchedule$service_provider_details_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getServiceSchedule$service_provider_details_by_pk<
    TRes> {
  factory CopyWith$Query$getServiceSchedule$service_provider_details_by_pk(
    Query$getServiceSchedule$service_provider_details_by_pk instance,
    TRes Function(Query$getServiceSchedule$service_provider_details_by_pk) then,
  ) = _CopyWithImpl$Query$getServiceSchedule$service_provider_details_by_pk;

  factory CopyWith$Query$getServiceSchedule$service_provider_details_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getServiceSchedule$service_provider_details_by_pk;

  TRes call({
    dynamic? schedule,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getServiceSchedule$service_provider_details_by_pk<
        TRes>
    implements
        CopyWith$Query$getServiceSchedule$service_provider_details_by_pk<TRes> {
  _CopyWithImpl$Query$getServiceSchedule$service_provider_details_by_pk(
    this._instance,
    this._then,
  );

  final Query$getServiceSchedule$service_provider_details_by_pk _instance;

  final TRes Function(Query$getServiceSchedule$service_provider_details_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? schedule = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getServiceSchedule$service_provider_details_by_pk(
        schedule: schedule == _undefined
            ? _instance.schedule
            : (schedule as dynamic?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getServiceSchedule$service_provider_details_by_pk<
        TRes>
    implements
        CopyWith$Query$getServiceSchedule$service_provider_details_by_pk<TRes> {
  _CopyWithStubImpl$Query$getServiceSchedule$service_provider_details_by_pk(
      this._res);

  TRes _res;

  call({
    dynamic? schedule,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getServicePaymentInfo {
  factory Variables$Query$getServicePaymentInfo(
          {required int serviceDetailsId}) =>
      Variables$Query$getServicePaymentInfo._({
        r'serviceDetailsId': serviceDetailsId,
      });

  Variables$Query$getServicePaymentInfo._(this._$data);

  factory Variables$Query$getServicePaymentInfo.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$serviceDetailsId = data['serviceDetailsId'];
    result$data['serviceDetailsId'] = (l$serviceDetailsId as int);
    return Variables$Query$getServicePaymentInfo._(result$data);
  }

  Map<String, dynamic> _$data;

  int get serviceDetailsId => (_$data['serviceDetailsId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$serviceDetailsId = serviceDetailsId;
    result$data['serviceDetailsId'] = l$serviceDetailsId;
    return result$data;
  }

  CopyWith$Variables$Query$getServicePaymentInfo<
          Variables$Query$getServicePaymentInfo>
      get copyWith => CopyWith$Variables$Query$getServicePaymentInfo(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getServicePaymentInfo) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$serviceDetailsId = serviceDetailsId;
    final lOther$serviceDetailsId = other.serviceDetailsId;
    if (l$serviceDetailsId != lOther$serviceDetailsId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$serviceDetailsId = serviceDetailsId;
    return Object.hashAll([l$serviceDetailsId]);
  }
}

abstract class CopyWith$Variables$Query$getServicePaymentInfo<TRes> {
  factory CopyWith$Variables$Query$getServicePaymentInfo(
    Variables$Query$getServicePaymentInfo instance,
    TRes Function(Variables$Query$getServicePaymentInfo) then,
  ) = _CopyWithImpl$Variables$Query$getServicePaymentInfo;

  factory CopyWith$Variables$Query$getServicePaymentInfo.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getServicePaymentInfo;

  TRes call({int? serviceDetailsId});
}

class _CopyWithImpl$Variables$Query$getServicePaymentInfo<TRes>
    implements CopyWith$Variables$Query$getServicePaymentInfo<TRes> {
  _CopyWithImpl$Variables$Query$getServicePaymentInfo(
    this._instance,
    this._then,
  );

  final Variables$Query$getServicePaymentInfo _instance;

  final TRes Function(Variables$Query$getServicePaymentInfo) _then;

  static const _undefined = {};

  TRes call({Object? serviceDetailsId = _undefined}) =>
      _then(Variables$Query$getServicePaymentInfo._({
        ..._instance._$data,
        if (serviceDetailsId != _undefined && serviceDetailsId != null)
          'serviceDetailsId': (serviceDetailsId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getServicePaymentInfo<TRes>
    implements CopyWith$Variables$Query$getServicePaymentInfo<TRes> {
  _CopyWithStubImpl$Variables$Query$getServicePaymentInfo(this._res);

  TRes _res;

  call({int? serviceDetailsId}) => _res;
}

class Query$getServicePaymentInfo {
  Query$getServicePaymentInfo({
    this.service_provider_details_by_pk,
    required this.$__typename,
  });

  factory Query$getServicePaymentInfo.fromJson(Map<String, dynamic> json) {
    final l$service_provider_details_by_pk =
        json['service_provider_details_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$getServicePaymentInfo(
      service_provider_details_by_pk: l$service_provider_details_by_pk == null
          ? null
          : Query$getServicePaymentInfo$service_provider_details_by_pk.fromJson(
              (l$service_provider_details_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getServicePaymentInfo$service_provider_details_by_pk?
      service_provider_details_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$service_provider_details_by_pk = service_provider_details_by_pk;
    _resultData['service_provider_details_by_pk'] =
        l$service_provider_details_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$service_provider_details_by_pk = service_provider_details_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$service_provider_details_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getServicePaymentInfo) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$service_provider_details_by_pk = service_provider_details_by_pk;
    final lOther$service_provider_details_by_pk =
        other.service_provider_details_by_pk;
    if (l$service_provider_details_by_pk !=
        lOther$service_provider_details_by_pk) {
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

extension UtilityExtension$Query$getServicePaymentInfo
    on Query$getServicePaymentInfo {
  CopyWith$Query$getServicePaymentInfo<Query$getServicePaymentInfo>
      get copyWith => CopyWith$Query$getServicePaymentInfo(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getServicePaymentInfo<TRes> {
  factory CopyWith$Query$getServicePaymentInfo(
    Query$getServicePaymentInfo instance,
    TRes Function(Query$getServicePaymentInfo) then,
  ) = _CopyWithImpl$Query$getServicePaymentInfo;

  factory CopyWith$Query$getServicePaymentInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$getServicePaymentInfo;

  TRes call({
    Query$getServicePaymentInfo$service_provider_details_by_pk?
        service_provider_details_by_pk,
    String? $__typename,
  });
  CopyWith$Query$getServicePaymentInfo$service_provider_details_by_pk<TRes>
      get service_provider_details_by_pk;
}

class _CopyWithImpl$Query$getServicePaymentInfo<TRes>
    implements CopyWith$Query$getServicePaymentInfo<TRes> {
  _CopyWithImpl$Query$getServicePaymentInfo(
    this._instance,
    this._then,
  );

  final Query$getServicePaymentInfo _instance;

  final TRes Function(Query$getServicePaymentInfo) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_details_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getServicePaymentInfo(
        service_provider_details_by_pk: service_provider_details_by_pk ==
                _undefined
            ? _instance.service_provider_details_by_pk
            : (service_provider_details_by_pk
                as Query$getServicePaymentInfo$service_provider_details_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getServicePaymentInfo$service_provider_details_by_pk<TRes>
      get service_provider_details_by_pk {
    final local$service_provider_details_by_pk =
        _instance.service_provider_details_by_pk;
    return local$service_provider_details_by_pk == null
        ? CopyWith$Query$getServicePaymentInfo$service_provider_details_by_pk
            .stub(_then(_instance))
        : CopyWith$Query$getServicePaymentInfo$service_provider_details_by_pk(
            local$service_provider_details_by_pk,
            (e) => call(service_provider_details_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$getServicePaymentInfo<TRes>
    implements CopyWith$Query$getServicePaymentInfo<TRes> {
  _CopyWithStubImpl$Query$getServicePaymentInfo(this._res);

  TRes _res;

  call({
    Query$getServicePaymentInfo$service_provider_details_by_pk?
        service_provider_details_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getServicePaymentInfo$service_provider_details_by_pk<TRes>
      get service_provider_details_by_pk =>
          CopyWith$Query$getServicePaymentInfo$service_provider_details_by_pk
              .stub(_res);
}

const documentNodeQuerygetServicePaymentInfo = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getServicePaymentInfo'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'serviceDetailsId')),
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
        name: NameNode(value: 'service_provider_details_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'serviceDetailsId')),
          )
        ],
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
            name: NameNode(value: 'stripe_info'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'charge_fees_on_customer'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'charges_enabled'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'details_submitted'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'email'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'payouts_enabled'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'requirements'),
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
                name: NameNode(value: 'status'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'stripe_id'),
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
Query$getServicePaymentInfo _parserFn$Query$getServicePaymentInfo(
        Map<String, dynamic> data) =>
    Query$getServicePaymentInfo.fromJson(data);

class Options$Query$getServicePaymentInfo
    extends graphql.QueryOptions<Query$getServicePaymentInfo> {
  Options$Query$getServicePaymentInfo({
    String? operationName,
    required Variables$Query$getServicePaymentInfo variables,
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
          document: documentNodeQuerygetServicePaymentInfo,
          parserFn: _parserFn$Query$getServicePaymentInfo,
        );
}

class WatchOptions$Query$getServicePaymentInfo
    extends graphql.WatchQueryOptions<Query$getServicePaymentInfo> {
  WatchOptions$Query$getServicePaymentInfo({
    String? operationName,
    required Variables$Query$getServicePaymentInfo variables,
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
          document: documentNodeQuerygetServicePaymentInfo,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getServicePaymentInfo,
        );
}

class FetchMoreOptions$Query$getServicePaymentInfo
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getServicePaymentInfo({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getServicePaymentInfo variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetServicePaymentInfo,
        );
}

extension ClientExtension$Query$getServicePaymentInfo on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getServicePaymentInfo>>
      query$getServicePaymentInfo(
              Options$Query$getServicePaymentInfo options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getServicePaymentInfo>
      watchQuery$getServicePaymentInfo(
              WatchOptions$Query$getServicePaymentInfo options) =>
          this.watchQuery(options);
  void writeQuery$getServicePaymentInfo({
    required Query$getServicePaymentInfo data,
    required Variables$Query$getServicePaymentInfo variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetServicePaymentInfo),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getServicePaymentInfo? readQuery$getServicePaymentInfo({
    required Variables$Query$getServicePaymentInfo variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetServicePaymentInfo),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getServicePaymentInfo.fromJson(result);
  }
}

class Query$getServicePaymentInfo$service_provider_details_by_pk {
  Query$getServicePaymentInfo$service_provider_details_by_pk({
    required this.accepted_payments,
    this.stripe_info,
    required this.$__typename,
  });

  factory Query$getServicePaymentInfo$service_provider_details_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$accepted_payments = json['accepted_payments'];
    final l$stripe_info = json['stripe_info'];
    final l$$__typename = json['__typename'];
    return Query$getServicePaymentInfo$service_provider_details_by_pk(
      accepted_payments: mapFromJson(l$accepted_payments),
      stripe_info: l$stripe_info == null
          ? null
          : Query$getServicePaymentInfo$service_provider_details_by_pk$stripe_info
              .fromJson((l$stripe_info as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final dynamic accepted_payments;

  final Query$getServicePaymentInfo$service_provider_details_by_pk$stripe_info?
      stripe_info;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$accepted_payments = accepted_payments;
    _resultData['accepted_payments'] = mapToJson(l$accepted_payments);
    final l$stripe_info = stripe_info;
    _resultData['stripe_info'] = l$stripe_info?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$accepted_payments = accepted_payments;
    final l$stripe_info = stripe_info;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$accepted_payments,
      l$stripe_info,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getServicePaymentInfo$service_provider_details_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$accepted_payments = accepted_payments;
    final lOther$accepted_payments = other.accepted_payments;
    if (l$accepted_payments != lOther$accepted_payments) {
      return false;
    }
    final l$stripe_info = stripe_info;
    final lOther$stripe_info = other.stripe_info;
    if (l$stripe_info != lOther$stripe_info) {
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

extension UtilityExtension$Query$getServicePaymentInfo$service_provider_details_by_pk
    on Query$getServicePaymentInfo$service_provider_details_by_pk {
  CopyWith$Query$getServicePaymentInfo$service_provider_details_by_pk<
          Query$getServicePaymentInfo$service_provider_details_by_pk>
      get copyWith =>
          CopyWith$Query$getServicePaymentInfo$service_provider_details_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getServicePaymentInfo$service_provider_details_by_pk<
    TRes> {
  factory CopyWith$Query$getServicePaymentInfo$service_provider_details_by_pk(
    Query$getServicePaymentInfo$service_provider_details_by_pk instance,
    TRes Function(Query$getServicePaymentInfo$service_provider_details_by_pk)
        then,
  ) = _CopyWithImpl$Query$getServicePaymentInfo$service_provider_details_by_pk;

  factory CopyWith$Query$getServicePaymentInfo$service_provider_details_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getServicePaymentInfo$service_provider_details_by_pk;

  TRes call({
    dynamic? accepted_payments,
    Query$getServicePaymentInfo$service_provider_details_by_pk$stripe_info?
        stripe_info,
    String? $__typename,
  });
  CopyWith$Query$getServicePaymentInfo$service_provider_details_by_pk$stripe_info<
      TRes> get stripe_info;
}

class _CopyWithImpl$Query$getServicePaymentInfo$service_provider_details_by_pk<
        TRes>
    implements
        CopyWith$Query$getServicePaymentInfo$service_provider_details_by_pk<
            TRes> {
  _CopyWithImpl$Query$getServicePaymentInfo$service_provider_details_by_pk(
    this._instance,
    this._then,
  );

  final Query$getServicePaymentInfo$service_provider_details_by_pk _instance;

  final TRes Function(
      Query$getServicePaymentInfo$service_provider_details_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? accepted_payments = _undefined,
    Object? stripe_info = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getServicePaymentInfo$service_provider_details_by_pk(
        accepted_payments:
            accepted_payments == _undefined || accepted_payments == null
                ? _instance.accepted_payments
                : (accepted_payments as dynamic),
        stripe_info: stripe_info == _undefined
            ? _instance.stripe_info
            : (stripe_info
                as Query$getServicePaymentInfo$service_provider_details_by_pk$stripe_info?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getServicePaymentInfo$service_provider_details_by_pk$stripe_info<
      TRes> get stripe_info {
    final local$stripe_info = _instance.stripe_info;
    return local$stripe_info == null
        ? CopyWith$Query$getServicePaymentInfo$service_provider_details_by_pk$stripe_info
            .stub(_then(_instance))
        : CopyWith$Query$getServicePaymentInfo$service_provider_details_by_pk$stripe_info(
            local$stripe_info, (e) => call(stripe_info: e));
  }
}

class _CopyWithStubImpl$Query$getServicePaymentInfo$service_provider_details_by_pk<
        TRes>
    implements
        CopyWith$Query$getServicePaymentInfo$service_provider_details_by_pk<
            TRes> {
  _CopyWithStubImpl$Query$getServicePaymentInfo$service_provider_details_by_pk(
      this._res);

  TRes _res;

  call({
    dynamic? accepted_payments,
    Query$getServicePaymentInfo$service_provider_details_by_pk$stripe_info?
        stripe_info,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getServicePaymentInfo$service_provider_details_by_pk$stripe_info<
          TRes>
      get stripe_info =>
          CopyWith$Query$getServicePaymentInfo$service_provider_details_by_pk$stripe_info
              .stub(_res);
}

class Query$getServicePaymentInfo$service_provider_details_by_pk$stripe_info {
  Query$getServicePaymentInfo$service_provider_details_by_pk$stripe_info({
    this.charge_fees_on_customer,
    required this.charges_enabled,
    required this.details_submitted,
    this.email,
    required this.payouts_enabled,
    this.requirements,
    required this.id,
    required this.status,
    required this.stripe_id,
    required this.$__typename,
  });

  factory Query$getServicePaymentInfo$service_provider_details_by_pk$stripe_info.fromJson(
      Map<String, dynamic> json) {
    final l$charge_fees_on_customer = json['charge_fees_on_customer'];
    final l$charges_enabled = json['charges_enabled'];
    final l$details_submitted = json['details_submitted'];
    final l$email = json['email'];
    final l$payouts_enabled = json['payouts_enabled'];
    final l$requirements = json['requirements'];
    final l$id = json['id'];
    final l$status = json['status'];
    final l$stripe_id = json['stripe_id'];
    final l$$__typename = json['__typename'];
    return Query$getServicePaymentInfo$service_provider_details_by_pk$stripe_info(
      charge_fees_on_customer: (l$charge_fees_on_customer as bool?),
      charges_enabled: (l$charges_enabled as bool),
      details_submitted: (l$details_submitted as bool),
      email: (l$email as String?),
      payouts_enabled: (l$payouts_enabled as bool),
      requirements: l$requirements == null ? null : mapFromJson(l$requirements),
      id: (l$id as int),
      status: (l$status as String),
      stripe_id: (l$stripe_id as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final bool? charge_fees_on_customer;

  final bool charges_enabled;

  final bool details_submitted;

  final String? email;

  final bool payouts_enabled;

  final dynamic? requirements;

  final int id;

  final String status;

  final String stripe_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$charge_fees_on_customer = charge_fees_on_customer;
    _resultData['charge_fees_on_customer'] = l$charge_fees_on_customer;
    final l$charges_enabled = charges_enabled;
    _resultData['charges_enabled'] = l$charges_enabled;
    final l$details_submitted = details_submitted;
    _resultData['details_submitted'] = l$details_submitted;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$payouts_enabled = payouts_enabled;
    _resultData['payouts_enabled'] = l$payouts_enabled;
    final l$requirements = requirements;
    _resultData['requirements'] =
        l$requirements == null ? null : mapToJson(l$requirements);
    final l$id = id;
    _resultData['id'] = l$id;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$stripe_id = stripe_id;
    _resultData['stripe_id'] = l$stripe_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$charge_fees_on_customer = charge_fees_on_customer;
    final l$charges_enabled = charges_enabled;
    final l$details_submitted = details_submitted;
    final l$email = email;
    final l$payouts_enabled = payouts_enabled;
    final l$requirements = requirements;
    final l$id = id;
    final l$status = status;
    final l$stripe_id = stripe_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$charge_fees_on_customer,
      l$charges_enabled,
      l$details_submitted,
      l$email,
      l$payouts_enabled,
      l$requirements,
      l$id,
      l$status,
      l$stripe_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getServicePaymentInfo$service_provider_details_by_pk$stripe_info) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$charge_fees_on_customer = charge_fees_on_customer;
    final lOther$charge_fees_on_customer = other.charge_fees_on_customer;
    if (l$charge_fees_on_customer != lOther$charge_fees_on_customer) {
      return false;
    }
    final l$charges_enabled = charges_enabled;
    final lOther$charges_enabled = other.charges_enabled;
    if (l$charges_enabled != lOther$charges_enabled) {
      return false;
    }
    final l$details_submitted = details_submitted;
    final lOther$details_submitted = other.details_submitted;
    if (l$details_submitted != lOther$details_submitted) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$payouts_enabled = payouts_enabled;
    final lOther$payouts_enabled = other.payouts_enabled;
    if (l$payouts_enabled != lOther$payouts_enabled) {
      return false;
    }
    final l$requirements = requirements;
    final lOther$requirements = other.requirements;
    if (l$requirements != lOther$requirements) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$stripe_id = stripe_id;
    final lOther$stripe_id = other.stripe_id;
    if (l$stripe_id != lOther$stripe_id) {
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

extension UtilityExtension$Query$getServicePaymentInfo$service_provider_details_by_pk$stripe_info
    on Query$getServicePaymentInfo$service_provider_details_by_pk$stripe_info {
  CopyWith$Query$getServicePaymentInfo$service_provider_details_by_pk$stripe_info<
          Query$getServicePaymentInfo$service_provider_details_by_pk$stripe_info>
      get copyWith =>
          CopyWith$Query$getServicePaymentInfo$service_provider_details_by_pk$stripe_info(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getServicePaymentInfo$service_provider_details_by_pk$stripe_info<
    TRes> {
  factory CopyWith$Query$getServicePaymentInfo$service_provider_details_by_pk$stripe_info(
    Query$getServicePaymentInfo$service_provider_details_by_pk$stripe_info
        instance,
    TRes Function(
            Query$getServicePaymentInfo$service_provider_details_by_pk$stripe_info)
        then,
  ) = _CopyWithImpl$Query$getServicePaymentInfo$service_provider_details_by_pk$stripe_info;

  factory CopyWith$Query$getServicePaymentInfo$service_provider_details_by_pk$stripe_info.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getServicePaymentInfo$service_provider_details_by_pk$stripe_info;

  TRes call({
    bool? charge_fees_on_customer,
    bool? charges_enabled,
    bool? details_submitted,
    String? email,
    bool? payouts_enabled,
    dynamic? requirements,
    int? id,
    String? status,
    String? stripe_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getServicePaymentInfo$service_provider_details_by_pk$stripe_info<
        TRes>
    implements
        CopyWith$Query$getServicePaymentInfo$service_provider_details_by_pk$stripe_info<
            TRes> {
  _CopyWithImpl$Query$getServicePaymentInfo$service_provider_details_by_pk$stripe_info(
    this._instance,
    this._then,
  );

  final Query$getServicePaymentInfo$service_provider_details_by_pk$stripe_info
      _instance;

  final TRes Function(
          Query$getServicePaymentInfo$service_provider_details_by_pk$stripe_info)
      _then;

  static const _undefined = {};

  TRes call({
    Object? charge_fees_on_customer = _undefined,
    Object? charges_enabled = _undefined,
    Object? details_submitted = _undefined,
    Object? email = _undefined,
    Object? payouts_enabled = _undefined,
    Object? requirements = _undefined,
    Object? id = _undefined,
    Object? status = _undefined,
    Object? stripe_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getServicePaymentInfo$service_provider_details_by_pk$stripe_info(
        charge_fees_on_customer: charge_fees_on_customer == _undefined
            ? _instance.charge_fees_on_customer
            : (charge_fees_on_customer as bool?),
        charges_enabled:
            charges_enabled == _undefined || charges_enabled == null
                ? _instance.charges_enabled
                : (charges_enabled as bool),
        details_submitted:
            details_submitted == _undefined || details_submitted == null
                ? _instance.details_submitted
                : (details_submitted as bool),
        email: email == _undefined ? _instance.email : (email as String?),
        payouts_enabled:
            payouts_enabled == _undefined || payouts_enabled == null
                ? _instance.payouts_enabled
                : (payouts_enabled as bool),
        requirements: requirements == _undefined
            ? _instance.requirements
            : (requirements as dynamic?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        stripe_id: stripe_id == _undefined || stripe_id == null
            ? _instance.stripe_id
            : (stripe_id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getServicePaymentInfo$service_provider_details_by_pk$stripe_info<
        TRes>
    implements
        CopyWith$Query$getServicePaymentInfo$service_provider_details_by_pk$stripe_info<
            TRes> {
  _CopyWithStubImpl$Query$getServicePaymentInfo$service_provider_details_by_pk$stripe_info(
      this._res);

  TRes _res;

  call({
    bool? charge_fees_on_customer,
    bool? charges_enabled,
    bool? details_submitted,
    String? email,
    bool? payouts_enabled,
    dynamic? requirements,
    int? id,
    String? status,
    String? stripe_id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getServiceProviderType {
  factory Variables$Query$getServiceProviderType({required String unique_id}) =>
      Variables$Query$getServiceProviderType._({
        r'unique_id': unique_id,
      });

  Variables$Query$getServiceProviderType._(this._$data);

  factory Variables$Query$getServiceProviderType.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$unique_id = data['unique_id'];
    result$data['unique_id'] = (l$unique_id as String);
    return Variables$Query$getServiceProviderType._(result$data);
  }

  Map<String, dynamic> _$data;

  String get unique_id => (_$data['unique_id'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$unique_id = unique_id;
    result$data['unique_id'] = l$unique_id;
    return result$data;
  }

  CopyWith$Variables$Query$getServiceProviderType<
          Variables$Query$getServiceProviderType>
      get copyWith => CopyWith$Variables$Query$getServiceProviderType(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getServiceProviderType) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$unique_id = unique_id;
    final lOther$unique_id = other.unique_id;
    if (l$unique_id != lOther$unique_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$unique_id = unique_id;
    return Object.hashAll([l$unique_id]);
  }
}

abstract class CopyWith$Variables$Query$getServiceProviderType<TRes> {
  factory CopyWith$Variables$Query$getServiceProviderType(
    Variables$Query$getServiceProviderType instance,
    TRes Function(Variables$Query$getServiceProviderType) then,
  ) = _CopyWithImpl$Variables$Query$getServiceProviderType;

  factory CopyWith$Variables$Query$getServiceProviderType.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getServiceProviderType;

  TRes call({String? unique_id});
}

class _CopyWithImpl$Variables$Query$getServiceProviderType<TRes>
    implements CopyWith$Variables$Query$getServiceProviderType<TRes> {
  _CopyWithImpl$Variables$Query$getServiceProviderType(
    this._instance,
    this._then,
  );

  final Variables$Query$getServiceProviderType _instance;

  final TRes Function(Variables$Query$getServiceProviderType) _then;

  static const _undefined = {};

  TRes call({Object? unique_id = _undefined}) =>
      _then(Variables$Query$getServiceProviderType._({
        ..._instance._$data,
        if (unique_id != _undefined && unique_id != null)
          'unique_id': (unique_id as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$getServiceProviderType<TRes>
    implements CopyWith$Variables$Query$getServiceProviderType<TRes> {
  _CopyWithStubImpl$Variables$Query$getServiceProviderType(this._res);

  TRes _res;

  call({String? unique_id}) => _res;
}

class Query$getServiceProviderType {
  Query$getServiceProviderType({
    required this.service_provider_details,
    required this.$__typename,
  });

  factory Query$getServiceProviderType.fromJson(Map<String, dynamic> json) {
    final l$service_provider_details = json['service_provider_details'];
    final l$$__typename = json['__typename'];
    return Query$getServiceProviderType(
      service_provider_details: (l$service_provider_details as List<dynamic>)
          .map((e) =>
              Query$getServiceProviderType$service_provider_details.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getServiceProviderType$service_provider_details>
      service_provider_details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$service_provider_details = service_provider_details;
    _resultData['service_provider_details'] =
        l$service_provider_details.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$service_provider_details = service_provider_details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$service_provider_details.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getServiceProviderType) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$service_provider_details = service_provider_details;
    final lOther$service_provider_details = other.service_provider_details;
    if (l$service_provider_details.length !=
        lOther$service_provider_details.length) {
      return false;
    }
    for (int i = 0; i < l$service_provider_details.length; i++) {
      final l$service_provider_details$entry = l$service_provider_details[i];
      final lOther$service_provider_details$entry =
          lOther$service_provider_details[i];
      if (l$service_provider_details$entry !=
          lOther$service_provider_details$entry) {
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

extension UtilityExtension$Query$getServiceProviderType
    on Query$getServiceProviderType {
  CopyWith$Query$getServiceProviderType<Query$getServiceProviderType>
      get copyWith => CopyWith$Query$getServiceProviderType(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getServiceProviderType<TRes> {
  factory CopyWith$Query$getServiceProviderType(
    Query$getServiceProviderType instance,
    TRes Function(Query$getServiceProviderType) then,
  ) = _CopyWithImpl$Query$getServiceProviderType;

  factory CopyWith$Query$getServiceProviderType.stub(TRes res) =
      _CopyWithStubImpl$Query$getServiceProviderType;

  TRes call({
    List<Query$getServiceProviderType$service_provider_details>?
        service_provider_details,
    String? $__typename,
  });
  TRes service_provider_details(
      Iterable<Query$getServiceProviderType$service_provider_details> Function(
              Iterable<
                  CopyWith$Query$getServiceProviderType$service_provider_details<
                      Query$getServiceProviderType$service_provider_details>>)
          _fn);
}

class _CopyWithImpl$Query$getServiceProviderType<TRes>
    implements CopyWith$Query$getServiceProviderType<TRes> {
  _CopyWithImpl$Query$getServiceProviderType(
    this._instance,
    this._then,
  );

  final Query$getServiceProviderType _instance;

  final TRes Function(Query$getServiceProviderType) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getServiceProviderType(
        service_provider_details: service_provider_details == _undefined ||
                service_provider_details == null
            ? _instance.service_provider_details
            : (service_provider_details
                as List<Query$getServiceProviderType$service_provider_details>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes service_provider_details(
          Iterable<Query$getServiceProviderType$service_provider_details> Function(
                  Iterable<
                      CopyWith$Query$getServiceProviderType$service_provider_details<
                          Query$getServiceProviderType$service_provider_details>>)
              _fn) =>
      call(
          service_provider_details: _fn(_instance.service_provider_details.map(
              (e) =>
                  CopyWith$Query$getServiceProviderType$service_provider_details(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getServiceProviderType<TRes>
    implements CopyWith$Query$getServiceProviderType<TRes> {
  _CopyWithStubImpl$Query$getServiceProviderType(this._res);

  TRes _res;

  call({
    List<Query$getServiceProviderType$service_provider_details>?
        service_provider_details,
    String? $__typename,
  }) =>
      _res;
  service_provider_details(_fn) => _res;
}

const documentNodeQuerygetServiceProviderType = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getServiceProviderType'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'unique_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'service_provider_details'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'unique_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'unique_id')),
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
            name: NameNode(value: 'service_provider_type'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'laundry_store'),
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
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'restaurant'),
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
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
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
Query$getServiceProviderType _parserFn$Query$getServiceProviderType(
        Map<String, dynamic> data) =>
    Query$getServiceProviderType.fromJson(data);

class Options$Query$getServiceProviderType
    extends graphql.QueryOptions<Query$getServiceProviderType> {
  Options$Query$getServiceProviderType({
    String? operationName,
    required Variables$Query$getServiceProviderType variables,
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
          document: documentNodeQuerygetServiceProviderType,
          parserFn: _parserFn$Query$getServiceProviderType,
        );
}

class WatchOptions$Query$getServiceProviderType
    extends graphql.WatchQueryOptions<Query$getServiceProviderType> {
  WatchOptions$Query$getServiceProviderType({
    String? operationName,
    required Variables$Query$getServiceProviderType variables,
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
          document: documentNodeQuerygetServiceProviderType,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getServiceProviderType,
        );
}

class FetchMoreOptions$Query$getServiceProviderType
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getServiceProviderType({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getServiceProviderType variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetServiceProviderType,
        );
}

extension ClientExtension$Query$getServiceProviderType
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getServiceProviderType>>
      query$getServiceProviderType(
              Options$Query$getServiceProviderType options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getServiceProviderType>
      watchQuery$getServiceProviderType(
              WatchOptions$Query$getServiceProviderType options) =>
          this.watchQuery(options);
  void writeQuery$getServiceProviderType({
    required Query$getServiceProviderType data,
    required Variables$Query$getServiceProviderType variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetServiceProviderType),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getServiceProviderType? readQuery$getServiceProviderType({
    required Variables$Query$getServiceProviderType variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQuerygetServiceProviderType),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$getServiceProviderType.fromJson(result);
  }
}

class Query$getServiceProviderType$service_provider_details {
  Query$getServiceProviderType$service_provider_details({
    required this.id,
    required this.service_provider_type,
    this.laundry_store,
    this.restaurant,
    this.business,
    required this.$__typename,
  });

  factory Query$getServiceProviderType$service_provider_details.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$service_provider_type = json['service_provider_type'];
    final l$laundry_store = json['laundry_store'];
    final l$restaurant = json['restaurant'];
    final l$business = json['business'];
    final l$$__typename = json['__typename'];
    return Query$getServiceProviderType$service_provider_details(
      id: (l$id as int),
      service_provider_type: (l$service_provider_type as String),
      laundry_store: l$laundry_store == null
          ? null
          : Query$getServiceProviderType$service_provider_details$laundry_store
              .fromJson((l$laundry_store as Map<String, dynamic>)),
      restaurant: l$restaurant == null
          ? null
          : Query$getServiceProviderType$service_provider_details$restaurant
              .fromJson((l$restaurant as Map<String, dynamic>)),
      business: l$business == null
          ? null
          : Query$getServiceProviderType$service_provider_details$business
              .fromJson((l$business as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String service_provider_type;

  final Query$getServiceProviderType$service_provider_details$laundry_store?
      laundry_store;

  final Query$getServiceProviderType$service_provider_details$restaurant?
      restaurant;

  final Query$getServiceProviderType$service_provider_details$business?
      business;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$service_provider_type = service_provider_type;
    _resultData['service_provider_type'] = l$service_provider_type;
    final l$laundry_store = laundry_store;
    _resultData['laundry_store'] = l$laundry_store?.toJson();
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant?.toJson();
    final l$business = business;
    _resultData['business'] = l$business?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$service_provider_type = service_provider_type;
    final l$laundry_store = laundry_store;
    final l$restaurant = restaurant;
    final l$business = business;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$service_provider_type,
      l$laundry_store,
      l$restaurant,
      l$business,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getServiceProviderType$service_provider_details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$service_provider_type = service_provider_type;
    final lOther$service_provider_type = other.service_provider_type;
    if (l$service_provider_type != lOther$service_provider_type) {
      return false;
    }
    final l$laundry_store = laundry_store;
    final lOther$laundry_store = other.laundry_store;
    if (l$laundry_store != lOther$laundry_store) {
      return false;
    }
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (l$restaurant != lOther$restaurant) {
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

extension UtilityExtension$Query$getServiceProviderType$service_provider_details
    on Query$getServiceProviderType$service_provider_details {
  CopyWith$Query$getServiceProviderType$service_provider_details<
          Query$getServiceProviderType$service_provider_details>
      get copyWith =>
          CopyWith$Query$getServiceProviderType$service_provider_details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getServiceProviderType$service_provider_details<
    TRes> {
  factory CopyWith$Query$getServiceProviderType$service_provider_details(
    Query$getServiceProviderType$service_provider_details instance,
    TRes Function(Query$getServiceProviderType$service_provider_details) then,
  ) = _CopyWithImpl$Query$getServiceProviderType$service_provider_details;

  factory CopyWith$Query$getServiceProviderType$service_provider_details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getServiceProviderType$service_provider_details;

  TRes call({
    int? id,
    String? service_provider_type,
    Query$getServiceProviderType$service_provider_details$laundry_store?
        laundry_store,
    Query$getServiceProviderType$service_provider_details$restaurant?
        restaurant,
    Query$getServiceProviderType$service_provider_details$business? business,
    String? $__typename,
  });
  CopyWith$Query$getServiceProviderType$service_provider_details$laundry_store<
      TRes> get laundry_store;
  CopyWith$Query$getServiceProviderType$service_provider_details$restaurant<
      TRes> get restaurant;
  CopyWith$Query$getServiceProviderType$service_provider_details$business<TRes>
      get business;
}

class _CopyWithImpl$Query$getServiceProviderType$service_provider_details<TRes>
    implements
        CopyWith$Query$getServiceProviderType$service_provider_details<TRes> {
  _CopyWithImpl$Query$getServiceProviderType$service_provider_details(
    this._instance,
    this._then,
  );

  final Query$getServiceProviderType$service_provider_details _instance;

  final TRes Function(Query$getServiceProviderType$service_provider_details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? service_provider_type = _undefined,
    Object? laundry_store = _undefined,
    Object? restaurant = _undefined,
    Object? business = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getServiceProviderType$service_provider_details(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        service_provider_type:
            service_provider_type == _undefined || service_provider_type == null
                ? _instance.service_provider_type
                : (service_provider_type as String),
        laundry_store: laundry_store == _undefined
            ? _instance.laundry_store
            : (laundry_store
                as Query$getServiceProviderType$service_provider_details$laundry_store?),
        restaurant: restaurant == _undefined
            ? _instance.restaurant
            : (restaurant
                as Query$getServiceProviderType$service_provider_details$restaurant?),
        business: business == _undefined
            ? _instance.business
            : (business
                as Query$getServiceProviderType$service_provider_details$business?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getServiceProviderType$service_provider_details$laundry_store<
      TRes> get laundry_store {
    final local$laundry_store = _instance.laundry_store;
    return local$laundry_store == null
        ? CopyWith$Query$getServiceProviderType$service_provider_details$laundry_store
            .stub(_then(_instance))
        : CopyWith$Query$getServiceProviderType$service_provider_details$laundry_store(
            local$laundry_store, (e) => call(laundry_store: e));
  }

  CopyWith$Query$getServiceProviderType$service_provider_details$restaurant<
      TRes> get restaurant {
    final local$restaurant = _instance.restaurant;
    return local$restaurant == null
        ? CopyWith$Query$getServiceProviderType$service_provider_details$restaurant
            .stub(_then(_instance))
        : CopyWith$Query$getServiceProviderType$service_provider_details$restaurant(
            local$restaurant, (e) => call(restaurant: e));
  }

  CopyWith$Query$getServiceProviderType$service_provider_details$business<TRes>
      get business {
    final local$business = _instance.business;
    return local$business == null
        ? CopyWith$Query$getServiceProviderType$service_provider_details$business
            .stub(_then(_instance))
        : CopyWith$Query$getServiceProviderType$service_provider_details$business(
            local$business, (e) => call(business: e));
  }
}

class _CopyWithStubImpl$Query$getServiceProviderType$service_provider_details<
        TRes>
    implements
        CopyWith$Query$getServiceProviderType$service_provider_details<TRes> {
  _CopyWithStubImpl$Query$getServiceProviderType$service_provider_details(
      this._res);

  TRes _res;

  call({
    int? id,
    String? service_provider_type,
    Query$getServiceProviderType$service_provider_details$laundry_store?
        laundry_store,
    Query$getServiceProviderType$service_provider_details$restaurant?
        restaurant,
    Query$getServiceProviderType$service_provider_details$business? business,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getServiceProviderType$service_provider_details$laundry_store<
          TRes>
      get laundry_store =>
          CopyWith$Query$getServiceProviderType$service_provider_details$laundry_store
              .stub(_res);
  CopyWith$Query$getServiceProviderType$service_provider_details$restaurant<
          TRes>
      get restaurant =>
          CopyWith$Query$getServiceProviderType$service_provider_details$restaurant
              .stub(_res);
  CopyWith$Query$getServiceProviderType$service_provider_details$business<TRes>
      get business =>
          CopyWith$Query$getServiceProviderType$service_provider_details$business
              .stub(_res);
}

class Query$getServiceProviderType$service_provider_details$laundry_store {
  Query$getServiceProviderType$service_provider_details$laundry_store({
    required this.id,
    required this.$__typename,
  });

  factory Query$getServiceProviderType$service_provider_details$laundry_store.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Query$getServiceProviderType$service_provider_details$laundry_store(
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
            is Query$getServiceProviderType$service_provider_details$laundry_store) ||
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

extension UtilityExtension$Query$getServiceProviderType$service_provider_details$laundry_store
    on Query$getServiceProviderType$service_provider_details$laundry_store {
  CopyWith$Query$getServiceProviderType$service_provider_details$laundry_store<
          Query$getServiceProviderType$service_provider_details$laundry_store>
      get copyWith =>
          CopyWith$Query$getServiceProviderType$service_provider_details$laundry_store(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getServiceProviderType$service_provider_details$laundry_store<
    TRes> {
  factory CopyWith$Query$getServiceProviderType$service_provider_details$laundry_store(
    Query$getServiceProviderType$service_provider_details$laundry_store
        instance,
    TRes Function(
            Query$getServiceProviderType$service_provider_details$laundry_store)
        then,
  ) = _CopyWithImpl$Query$getServiceProviderType$service_provider_details$laundry_store;

  factory CopyWith$Query$getServiceProviderType$service_provider_details$laundry_store.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getServiceProviderType$service_provider_details$laundry_store;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getServiceProviderType$service_provider_details$laundry_store<
        TRes>
    implements
        CopyWith$Query$getServiceProviderType$service_provider_details$laundry_store<
            TRes> {
  _CopyWithImpl$Query$getServiceProviderType$service_provider_details$laundry_store(
    this._instance,
    this._then,
  );

  final Query$getServiceProviderType$service_provider_details$laundry_store
      _instance;

  final TRes Function(
          Query$getServiceProviderType$service_provider_details$laundry_store)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getServiceProviderType$service_provider_details$laundry_store(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getServiceProviderType$service_provider_details$laundry_store<
        TRes>
    implements
        CopyWith$Query$getServiceProviderType$service_provider_details$laundry_store<
            TRes> {
  _CopyWithStubImpl$Query$getServiceProviderType$service_provider_details$laundry_store(
      this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}

class Query$getServiceProviderType$service_provider_details$restaurant {
  Query$getServiceProviderType$service_provider_details$restaurant({
    required this.id,
    required this.$__typename,
  });

  factory Query$getServiceProviderType$service_provider_details$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Query$getServiceProviderType$service_provider_details$restaurant(
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
            is Query$getServiceProviderType$service_provider_details$restaurant) ||
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

extension UtilityExtension$Query$getServiceProviderType$service_provider_details$restaurant
    on Query$getServiceProviderType$service_provider_details$restaurant {
  CopyWith$Query$getServiceProviderType$service_provider_details$restaurant<
          Query$getServiceProviderType$service_provider_details$restaurant>
      get copyWith =>
          CopyWith$Query$getServiceProviderType$service_provider_details$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getServiceProviderType$service_provider_details$restaurant<
    TRes> {
  factory CopyWith$Query$getServiceProviderType$service_provider_details$restaurant(
    Query$getServiceProviderType$service_provider_details$restaurant instance,
    TRes Function(
            Query$getServiceProviderType$service_provider_details$restaurant)
        then,
  ) = _CopyWithImpl$Query$getServiceProviderType$service_provider_details$restaurant;

  factory CopyWith$Query$getServiceProviderType$service_provider_details$restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getServiceProviderType$service_provider_details$restaurant;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getServiceProviderType$service_provider_details$restaurant<
        TRes>
    implements
        CopyWith$Query$getServiceProviderType$service_provider_details$restaurant<
            TRes> {
  _CopyWithImpl$Query$getServiceProviderType$service_provider_details$restaurant(
    this._instance,
    this._then,
  );

  final Query$getServiceProviderType$service_provider_details$restaurant
      _instance;

  final TRes Function(
      Query$getServiceProviderType$service_provider_details$restaurant) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getServiceProviderType$service_provider_details$restaurant(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getServiceProviderType$service_provider_details$restaurant<
        TRes>
    implements
        CopyWith$Query$getServiceProviderType$service_provider_details$restaurant<
            TRes> {
  _CopyWithStubImpl$Query$getServiceProviderType$service_provider_details$restaurant(
      this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}

class Query$getServiceProviderType$service_provider_details$business {
  Query$getServiceProviderType$service_provider_details$business({
    required this.id,
    required this.$__typename,
  });

  factory Query$getServiceProviderType$service_provider_details$business.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Query$getServiceProviderType$service_provider_details$business(
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
            is Query$getServiceProviderType$service_provider_details$business) ||
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

extension UtilityExtension$Query$getServiceProviderType$service_provider_details$business
    on Query$getServiceProviderType$service_provider_details$business {
  CopyWith$Query$getServiceProviderType$service_provider_details$business<
          Query$getServiceProviderType$service_provider_details$business>
      get copyWith =>
          CopyWith$Query$getServiceProviderType$service_provider_details$business(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getServiceProviderType$service_provider_details$business<
    TRes> {
  factory CopyWith$Query$getServiceProviderType$service_provider_details$business(
    Query$getServiceProviderType$service_provider_details$business instance,
    TRes Function(
            Query$getServiceProviderType$service_provider_details$business)
        then,
  ) = _CopyWithImpl$Query$getServiceProviderType$service_provider_details$business;

  factory CopyWith$Query$getServiceProviderType$service_provider_details$business.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getServiceProviderType$service_provider_details$business;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getServiceProviderType$service_provider_details$business<
        TRes>
    implements
        CopyWith$Query$getServiceProviderType$service_provider_details$business<
            TRes> {
  _CopyWithImpl$Query$getServiceProviderType$service_provider_details$business(
    this._instance,
    this._then,
  );

  final Query$getServiceProviderType$service_provider_details$business
      _instance;

  final TRes Function(
      Query$getServiceProviderType$service_provider_details$business) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getServiceProviderType$service_provider_details$business(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getServiceProviderType$service_provider_details$business<
        TRes>
    implements
        CopyWith$Query$getServiceProviderType$service_provider_details$business<
            TRes> {
  _CopyWithStubImpl$Query$getServiceProviderType$service_provider_details$business(
      this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getServiceProviderId {
  factory Variables$Query$getServiceProviderId({String? uniqueId}) =>
      Variables$Query$getServiceProviderId._({
        if (uniqueId != null) r'uniqueId': uniqueId,
      });

  Variables$Query$getServiceProviderId._(this._$data);

  factory Variables$Query$getServiceProviderId.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('uniqueId')) {
      final l$uniqueId = data['uniqueId'];
      result$data['uniqueId'] = (l$uniqueId as String?);
    }
    return Variables$Query$getServiceProviderId._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get uniqueId => (_$data['uniqueId'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('uniqueId')) {
      final l$uniqueId = uniqueId;
      result$data['uniqueId'] = l$uniqueId;
    }
    return result$data;
  }

  CopyWith$Variables$Query$getServiceProviderId<
          Variables$Query$getServiceProviderId>
      get copyWith => CopyWith$Variables$Query$getServiceProviderId(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getServiceProviderId) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$uniqueId = uniqueId;
    final lOther$uniqueId = other.uniqueId;
    if (_$data.containsKey('uniqueId') !=
        other._$data.containsKey('uniqueId')) {
      return false;
    }
    if (l$uniqueId != lOther$uniqueId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$uniqueId = uniqueId;
    return Object.hashAll(
        [_$data.containsKey('uniqueId') ? l$uniqueId : const {}]);
  }
}

abstract class CopyWith$Variables$Query$getServiceProviderId<TRes> {
  factory CopyWith$Variables$Query$getServiceProviderId(
    Variables$Query$getServiceProviderId instance,
    TRes Function(Variables$Query$getServiceProviderId) then,
  ) = _CopyWithImpl$Variables$Query$getServiceProviderId;

  factory CopyWith$Variables$Query$getServiceProviderId.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getServiceProviderId;

  TRes call({String? uniqueId});
}

class _CopyWithImpl$Variables$Query$getServiceProviderId<TRes>
    implements CopyWith$Variables$Query$getServiceProviderId<TRes> {
  _CopyWithImpl$Variables$Query$getServiceProviderId(
    this._instance,
    this._then,
  );

  final Variables$Query$getServiceProviderId _instance;

  final TRes Function(Variables$Query$getServiceProviderId) _then;

  static const _undefined = {};

  TRes call({Object? uniqueId = _undefined}) =>
      _then(Variables$Query$getServiceProviderId._({
        ..._instance._$data,
        if (uniqueId != _undefined) 'uniqueId': (uniqueId as String?),
      }));
}

class _CopyWithStubImpl$Variables$Query$getServiceProviderId<TRes>
    implements CopyWith$Variables$Query$getServiceProviderId<TRes> {
  _CopyWithStubImpl$Variables$Query$getServiceProviderId(this._res);

  TRes _res;

  call({String? uniqueId}) => _res;
}

class Query$getServiceProviderId {
  Query$getServiceProviderId({
    required this.service_provider_details,
    required this.$__typename,
  });

  factory Query$getServiceProviderId.fromJson(Map<String, dynamic> json) {
    final l$service_provider_details = json['service_provider_details'];
    final l$$__typename = json['__typename'];
    return Query$getServiceProviderId(
      service_provider_details: (l$service_provider_details as List<dynamic>)
          .map((e) =>
              Query$getServiceProviderId$service_provider_details.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getServiceProviderId$service_provider_details>
      service_provider_details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$service_provider_details = service_provider_details;
    _resultData['service_provider_details'] =
        l$service_provider_details.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$service_provider_details = service_provider_details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$service_provider_details.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getServiceProviderId) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$service_provider_details = service_provider_details;
    final lOther$service_provider_details = other.service_provider_details;
    if (l$service_provider_details.length !=
        lOther$service_provider_details.length) {
      return false;
    }
    for (int i = 0; i < l$service_provider_details.length; i++) {
      final l$service_provider_details$entry = l$service_provider_details[i];
      final lOther$service_provider_details$entry =
          lOther$service_provider_details[i];
      if (l$service_provider_details$entry !=
          lOther$service_provider_details$entry) {
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

extension UtilityExtension$Query$getServiceProviderId
    on Query$getServiceProviderId {
  CopyWith$Query$getServiceProviderId<Query$getServiceProviderId>
      get copyWith => CopyWith$Query$getServiceProviderId(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getServiceProviderId<TRes> {
  factory CopyWith$Query$getServiceProviderId(
    Query$getServiceProviderId instance,
    TRes Function(Query$getServiceProviderId) then,
  ) = _CopyWithImpl$Query$getServiceProviderId;

  factory CopyWith$Query$getServiceProviderId.stub(TRes res) =
      _CopyWithStubImpl$Query$getServiceProviderId;

  TRes call({
    List<Query$getServiceProviderId$service_provider_details>?
        service_provider_details,
    String? $__typename,
  });
  TRes service_provider_details(
      Iterable<Query$getServiceProviderId$service_provider_details> Function(
              Iterable<
                  CopyWith$Query$getServiceProviderId$service_provider_details<
                      Query$getServiceProviderId$service_provider_details>>)
          _fn);
}

class _CopyWithImpl$Query$getServiceProviderId<TRes>
    implements CopyWith$Query$getServiceProviderId<TRes> {
  _CopyWithImpl$Query$getServiceProviderId(
    this._instance,
    this._then,
  );

  final Query$getServiceProviderId _instance;

  final TRes Function(Query$getServiceProviderId) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getServiceProviderId(
        service_provider_details: service_provider_details == _undefined ||
                service_provider_details == null
            ? _instance.service_provider_details
            : (service_provider_details
                as List<Query$getServiceProviderId$service_provider_details>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes service_provider_details(
          Iterable<Query$getServiceProviderId$service_provider_details> Function(
                  Iterable<
                      CopyWith$Query$getServiceProviderId$service_provider_details<
                          Query$getServiceProviderId$service_provider_details>>)
              _fn) =>
      call(
          service_provider_details: _fn(_instance.service_provider_details.map(
              (e) =>
                  CopyWith$Query$getServiceProviderId$service_provider_details(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getServiceProviderId<TRes>
    implements CopyWith$Query$getServiceProviderId<TRes> {
  _CopyWithStubImpl$Query$getServiceProviderId(this._res);

  TRes _res;

  call({
    List<Query$getServiceProviderId$service_provider_details>?
        service_provider_details,
    String? $__typename,
  }) =>
      _res;
  service_provider_details(_fn) => _res;
}

const documentNodeQuerygetServiceProviderId = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getServiceProviderId'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'uniqueId')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'service_provider_details'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'unique_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'uniqueId')),
                  )
                ]),
              )
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'service_provider_type'),
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
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
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
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'laundry_store'),
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
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'restaurant'),
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
Query$getServiceProviderId _parserFn$Query$getServiceProviderId(
        Map<String, dynamic> data) =>
    Query$getServiceProviderId.fromJson(data);

class Options$Query$getServiceProviderId
    extends graphql.QueryOptions<Query$getServiceProviderId> {
  Options$Query$getServiceProviderId({
    String? operationName,
    Variables$Query$getServiceProviderId? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
  }) : super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          pollInterval: pollInterval,
          context: context,
          document: documentNodeQuerygetServiceProviderId,
          parserFn: _parserFn$Query$getServiceProviderId,
        );
}

class WatchOptions$Query$getServiceProviderId
    extends graphql.WatchQueryOptions<Query$getServiceProviderId> {
  WatchOptions$Query$getServiceProviderId({
    String? operationName,
    Variables$Query$getServiceProviderId? variables,
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
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeQuerygetServiceProviderId,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getServiceProviderId,
        );
}

class FetchMoreOptions$Query$getServiceProviderId
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getServiceProviderId({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$getServiceProviderId? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQuerygetServiceProviderId,
        );
}

extension ClientExtension$Query$getServiceProviderId on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getServiceProviderId>>
      query$getServiceProviderId(
              [Options$Query$getServiceProviderId? options]) async =>
          await this.query(options ?? Options$Query$getServiceProviderId());
  graphql.ObservableQuery<Query$getServiceProviderId>
      watchQuery$getServiceProviderId(
              [WatchOptions$Query$getServiceProviderId? options]) =>
          this.watchQuery(options ?? WatchOptions$Query$getServiceProviderId());
  void writeQuery$getServiceProviderId({
    required Query$getServiceProviderId data,
    Variables$Query$getServiceProviderId? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetServiceProviderId),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getServiceProviderId? readQuery$getServiceProviderId({
    Variables$Query$getServiceProviderId? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetServiceProviderId),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getServiceProviderId.fromJson(result);
  }
}

class Query$getServiceProviderId$service_provider_details {
  Query$getServiceProviderId$service_provider_details({
    required this.service_provider_type,
    this.business,
    this.delivery_company,
    this.laundry_store,
    this.restaurant,
    required this.$__typename,
  });

  factory Query$getServiceProviderId$service_provider_details.fromJson(
      Map<String, dynamic> json) {
    final l$service_provider_type = json['service_provider_type'];
    final l$business = json['business'];
    final l$delivery_company = json['delivery_company'];
    final l$laundry_store = json['laundry_store'];
    final l$restaurant = json['restaurant'];
    final l$$__typename = json['__typename'];
    return Query$getServiceProviderId$service_provider_details(
      service_provider_type: (l$service_provider_type as String),
      business: l$business == null
          ? null
          : Query$getServiceProviderId$service_provider_details$business
              .fromJson((l$business as Map<String, dynamic>)),
      delivery_company: l$delivery_company == null
          ? null
          : Query$getServiceProviderId$service_provider_details$delivery_company
              .fromJson((l$delivery_company as Map<String, dynamic>)),
      laundry_store: l$laundry_store == null
          ? null
          : Query$getServiceProviderId$service_provider_details$laundry_store
              .fromJson((l$laundry_store as Map<String, dynamic>)),
      restaurant: l$restaurant == null
          ? null
          : Query$getServiceProviderId$service_provider_details$restaurant
              .fromJson((l$restaurant as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String service_provider_type;

  final Query$getServiceProviderId$service_provider_details$business? business;

  final Query$getServiceProviderId$service_provider_details$delivery_company?
      delivery_company;

  final Query$getServiceProviderId$service_provider_details$laundry_store?
      laundry_store;

  final Query$getServiceProviderId$service_provider_details$restaurant?
      restaurant;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$service_provider_type = service_provider_type;
    _resultData['service_provider_type'] = l$service_provider_type;
    final l$business = business;
    _resultData['business'] = l$business?.toJson();
    final l$delivery_company = delivery_company;
    _resultData['delivery_company'] = l$delivery_company?.toJson();
    final l$laundry_store = laundry_store;
    _resultData['laundry_store'] = l$laundry_store?.toJson();
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$service_provider_type = service_provider_type;
    final l$business = business;
    final l$delivery_company = delivery_company;
    final l$laundry_store = laundry_store;
    final l$restaurant = restaurant;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$service_provider_type,
      l$business,
      l$delivery_company,
      l$laundry_store,
      l$restaurant,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getServiceProviderId$service_provider_details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$service_provider_type = service_provider_type;
    final lOther$service_provider_type = other.service_provider_type;
    if (l$service_provider_type != lOther$service_provider_type) {
      return false;
    }
    final l$business = business;
    final lOther$business = other.business;
    if (l$business != lOther$business) {
      return false;
    }
    final l$delivery_company = delivery_company;
    final lOther$delivery_company = other.delivery_company;
    if (l$delivery_company != lOther$delivery_company) {
      return false;
    }
    final l$laundry_store = laundry_store;
    final lOther$laundry_store = other.laundry_store;
    if (l$laundry_store != lOther$laundry_store) {
      return false;
    }
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (l$restaurant != lOther$restaurant) {
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

extension UtilityExtension$Query$getServiceProviderId$service_provider_details
    on Query$getServiceProviderId$service_provider_details {
  CopyWith$Query$getServiceProviderId$service_provider_details<
          Query$getServiceProviderId$service_provider_details>
      get copyWith =>
          CopyWith$Query$getServiceProviderId$service_provider_details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getServiceProviderId$service_provider_details<
    TRes> {
  factory CopyWith$Query$getServiceProviderId$service_provider_details(
    Query$getServiceProviderId$service_provider_details instance,
    TRes Function(Query$getServiceProviderId$service_provider_details) then,
  ) = _CopyWithImpl$Query$getServiceProviderId$service_provider_details;

  factory CopyWith$Query$getServiceProviderId$service_provider_details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getServiceProviderId$service_provider_details;

  TRes call({
    String? service_provider_type,
    Query$getServiceProviderId$service_provider_details$business? business,
    Query$getServiceProviderId$service_provider_details$delivery_company?
        delivery_company,
    Query$getServiceProviderId$service_provider_details$laundry_store?
        laundry_store,
    Query$getServiceProviderId$service_provider_details$restaurant? restaurant,
    String? $__typename,
  });
  CopyWith$Query$getServiceProviderId$service_provider_details$business<TRes>
      get business;
  CopyWith$Query$getServiceProviderId$service_provider_details$delivery_company<
      TRes> get delivery_company;
  CopyWith$Query$getServiceProviderId$service_provider_details$laundry_store<
      TRes> get laundry_store;
  CopyWith$Query$getServiceProviderId$service_provider_details$restaurant<TRes>
      get restaurant;
}

class _CopyWithImpl$Query$getServiceProviderId$service_provider_details<TRes>
    implements
        CopyWith$Query$getServiceProviderId$service_provider_details<TRes> {
  _CopyWithImpl$Query$getServiceProviderId$service_provider_details(
    this._instance,
    this._then,
  );

  final Query$getServiceProviderId$service_provider_details _instance;

  final TRes Function(Query$getServiceProviderId$service_provider_details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_type = _undefined,
    Object? business = _undefined,
    Object? delivery_company = _undefined,
    Object? laundry_store = _undefined,
    Object? restaurant = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getServiceProviderId$service_provider_details(
        service_provider_type:
            service_provider_type == _undefined || service_provider_type == null
                ? _instance.service_provider_type
                : (service_provider_type as String),
        business: business == _undefined
            ? _instance.business
            : (business
                as Query$getServiceProviderId$service_provider_details$business?),
        delivery_company: delivery_company == _undefined
            ? _instance.delivery_company
            : (delivery_company
                as Query$getServiceProviderId$service_provider_details$delivery_company?),
        laundry_store: laundry_store == _undefined
            ? _instance.laundry_store
            : (laundry_store
                as Query$getServiceProviderId$service_provider_details$laundry_store?),
        restaurant: restaurant == _undefined
            ? _instance.restaurant
            : (restaurant
                as Query$getServiceProviderId$service_provider_details$restaurant?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getServiceProviderId$service_provider_details$business<TRes>
      get business {
    final local$business = _instance.business;
    return local$business == null
        ? CopyWith$Query$getServiceProviderId$service_provider_details$business
            .stub(_then(_instance))
        : CopyWith$Query$getServiceProviderId$service_provider_details$business(
            local$business, (e) => call(business: e));
  }

  CopyWith$Query$getServiceProviderId$service_provider_details$delivery_company<
      TRes> get delivery_company {
    final local$delivery_company = _instance.delivery_company;
    return local$delivery_company == null
        ? CopyWith$Query$getServiceProviderId$service_provider_details$delivery_company
            .stub(_then(_instance))
        : CopyWith$Query$getServiceProviderId$service_provider_details$delivery_company(
            local$delivery_company, (e) => call(delivery_company: e));
  }

  CopyWith$Query$getServiceProviderId$service_provider_details$laundry_store<
      TRes> get laundry_store {
    final local$laundry_store = _instance.laundry_store;
    return local$laundry_store == null
        ? CopyWith$Query$getServiceProviderId$service_provider_details$laundry_store
            .stub(_then(_instance))
        : CopyWith$Query$getServiceProviderId$service_provider_details$laundry_store(
            local$laundry_store, (e) => call(laundry_store: e));
  }

  CopyWith$Query$getServiceProviderId$service_provider_details$restaurant<TRes>
      get restaurant {
    final local$restaurant = _instance.restaurant;
    return local$restaurant == null
        ? CopyWith$Query$getServiceProviderId$service_provider_details$restaurant
            .stub(_then(_instance))
        : CopyWith$Query$getServiceProviderId$service_provider_details$restaurant(
            local$restaurant, (e) => call(restaurant: e));
  }
}

class _CopyWithStubImpl$Query$getServiceProviderId$service_provider_details<
        TRes>
    implements
        CopyWith$Query$getServiceProviderId$service_provider_details<TRes> {
  _CopyWithStubImpl$Query$getServiceProviderId$service_provider_details(
      this._res);

  TRes _res;

  call({
    String? service_provider_type,
    Query$getServiceProviderId$service_provider_details$business? business,
    Query$getServiceProviderId$service_provider_details$delivery_company?
        delivery_company,
    Query$getServiceProviderId$service_provider_details$laundry_store?
        laundry_store,
    Query$getServiceProviderId$service_provider_details$restaurant? restaurant,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getServiceProviderId$service_provider_details$business<TRes>
      get business =>
          CopyWith$Query$getServiceProviderId$service_provider_details$business
              .stub(_res);
  CopyWith$Query$getServiceProviderId$service_provider_details$delivery_company<
          TRes>
      get delivery_company =>
          CopyWith$Query$getServiceProviderId$service_provider_details$delivery_company
              .stub(_res);
  CopyWith$Query$getServiceProviderId$service_provider_details$laundry_store<
          TRes>
      get laundry_store =>
          CopyWith$Query$getServiceProviderId$service_provider_details$laundry_store
              .stub(_res);
  CopyWith$Query$getServiceProviderId$service_provider_details$restaurant<TRes>
      get restaurant =>
          CopyWith$Query$getServiceProviderId$service_provider_details$restaurant
              .stub(_res);
}

class Query$getServiceProviderId$service_provider_details$business {
  Query$getServiceProviderId$service_provider_details$business({
    required this.id,
    required this.$__typename,
  });

  factory Query$getServiceProviderId$service_provider_details$business.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Query$getServiceProviderId$service_provider_details$business(
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
            is Query$getServiceProviderId$service_provider_details$business) ||
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

extension UtilityExtension$Query$getServiceProviderId$service_provider_details$business
    on Query$getServiceProviderId$service_provider_details$business {
  CopyWith$Query$getServiceProviderId$service_provider_details$business<
          Query$getServiceProviderId$service_provider_details$business>
      get copyWith =>
          CopyWith$Query$getServiceProviderId$service_provider_details$business(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getServiceProviderId$service_provider_details$business<
    TRes> {
  factory CopyWith$Query$getServiceProviderId$service_provider_details$business(
    Query$getServiceProviderId$service_provider_details$business instance,
    TRes Function(Query$getServiceProviderId$service_provider_details$business)
        then,
  ) = _CopyWithImpl$Query$getServiceProviderId$service_provider_details$business;

  factory CopyWith$Query$getServiceProviderId$service_provider_details$business.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getServiceProviderId$service_provider_details$business;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getServiceProviderId$service_provider_details$business<
        TRes>
    implements
        CopyWith$Query$getServiceProviderId$service_provider_details$business<
            TRes> {
  _CopyWithImpl$Query$getServiceProviderId$service_provider_details$business(
    this._instance,
    this._then,
  );

  final Query$getServiceProviderId$service_provider_details$business _instance;

  final TRes Function(
      Query$getServiceProviderId$service_provider_details$business) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getServiceProviderId$service_provider_details$business(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getServiceProviderId$service_provider_details$business<
        TRes>
    implements
        CopyWith$Query$getServiceProviderId$service_provider_details$business<
            TRes> {
  _CopyWithStubImpl$Query$getServiceProviderId$service_provider_details$business(
      this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}

class Query$getServiceProviderId$service_provider_details$delivery_company {
  Query$getServiceProviderId$service_provider_details$delivery_company({
    required this.id,
    required this.$__typename,
  });

  factory Query$getServiceProviderId$service_provider_details$delivery_company.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Query$getServiceProviderId$service_provider_details$delivery_company(
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
            is Query$getServiceProviderId$service_provider_details$delivery_company) ||
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

extension UtilityExtension$Query$getServiceProviderId$service_provider_details$delivery_company
    on Query$getServiceProviderId$service_provider_details$delivery_company {
  CopyWith$Query$getServiceProviderId$service_provider_details$delivery_company<
          Query$getServiceProviderId$service_provider_details$delivery_company>
      get copyWith =>
          CopyWith$Query$getServiceProviderId$service_provider_details$delivery_company(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getServiceProviderId$service_provider_details$delivery_company<
    TRes> {
  factory CopyWith$Query$getServiceProviderId$service_provider_details$delivery_company(
    Query$getServiceProviderId$service_provider_details$delivery_company
        instance,
    TRes Function(
            Query$getServiceProviderId$service_provider_details$delivery_company)
        then,
  ) = _CopyWithImpl$Query$getServiceProviderId$service_provider_details$delivery_company;

  factory CopyWith$Query$getServiceProviderId$service_provider_details$delivery_company.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getServiceProviderId$service_provider_details$delivery_company;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getServiceProviderId$service_provider_details$delivery_company<
        TRes>
    implements
        CopyWith$Query$getServiceProviderId$service_provider_details$delivery_company<
            TRes> {
  _CopyWithImpl$Query$getServiceProviderId$service_provider_details$delivery_company(
    this._instance,
    this._then,
  );

  final Query$getServiceProviderId$service_provider_details$delivery_company
      _instance;

  final TRes Function(
          Query$getServiceProviderId$service_provider_details$delivery_company)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getServiceProviderId$service_provider_details$delivery_company(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getServiceProviderId$service_provider_details$delivery_company<
        TRes>
    implements
        CopyWith$Query$getServiceProviderId$service_provider_details$delivery_company<
            TRes> {
  _CopyWithStubImpl$Query$getServiceProviderId$service_provider_details$delivery_company(
      this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}

class Query$getServiceProviderId$service_provider_details$laundry_store {
  Query$getServiceProviderId$service_provider_details$laundry_store({
    required this.id,
    required this.$__typename,
  });

  factory Query$getServiceProviderId$service_provider_details$laundry_store.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Query$getServiceProviderId$service_provider_details$laundry_store(
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
            is Query$getServiceProviderId$service_provider_details$laundry_store) ||
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

extension UtilityExtension$Query$getServiceProviderId$service_provider_details$laundry_store
    on Query$getServiceProviderId$service_provider_details$laundry_store {
  CopyWith$Query$getServiceProviderId$service_provider_details$laundry_store<
          Query$getServiceProviderId$service_provider_details$laundry_store>
      get copyWith =>
          CopyWith$Query$getServiceProviderId$service_provider_details$laundry_store(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getServiceProviderId$service_provider_details$laundry_store<
    TRes> {
  factory CopyWith$Query$getServiceProviderId$service_provider_details$laundry_store(
    Query$getServiceProviderId$service_provider_details$laundry_store instance,
    TRes Function(
            Query$getServiceProviderId$service_provider_details$laundry_store)
        then,
  ) = _CopyWithImpl$Query$getServiceProviderId$service_provider_details$laundry_store;

  factory CopyWith$Query$getServiceProviderId$service_provider_details$laundry_store.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getServiceProviderId$service_provider_details$laundry_store;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getServiceProviderId$service_provider_details$laundry_store<
        TRes>
    implements
        CopyWith$Query$getServiceProviderId$service_provider_details$laundry_store<
            TRes> {
  _CopyWithImpl$Query$getServiceProviderId$service_provider_details$laundry_store(
    this._instance,
    this._then,
  );

  final Query$getServiceProviderId$service_provider_details$laundry_store
      _instance;

  final TRes Function(
      Query$getServiceProviderId$service_provider_details$laundry_store) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getServiceProviderId$service_provider_details$laundry_store(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getServiceProviderId$service_provider_details$laundry_store<
        TRes>
    implements
        CopyWith$Query$getServiceProviderId$service_provider_details$laundry_store<
            TRes> {
  _CopyWithStubImpl$Query$getServiceProviderId$service_provider_details$laundry_store(
      this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}

class Query$getServiceProviderId$service_provider_details$restaurant {
  Query$getServiceProviderId$service_provider_details$restaurant({
    required this.id,
    required this.$__typename,
  });

  factory Query$getServiceProviderId$service_provider_details$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Query$getServiceProviderId$service_provider_details$restaurant(
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
            is Query$getServiceProviderId$service_provider_details$restaurant) ||
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

extension UtilityExtension$Query$getServiceProviderId$service_provider_details$restaurant
    on Query$getServiceProviderId$service_provider_details$restaurant {
  CopyWith$Query$getServiceProviderId$service_provider_details$restaurant<
          Query$getServiceProviderId$service_provider_details$restaurant>
      get copyWith =>
          CopyWith$Query$getServiceProviderId$service_provider_details$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getServiceProviderId$service_provider_details$restaurant<
    TRes> {
  factory CopyWith$Query$getServiceProviderId$service_provider_details$restaurant(
    Query$getServiceProviderId$service_provider_details$restaurant instance,
    TRes Function(
            Query$getServiceProviderId$service_provider_details$restaurant)
        then,
  ) = _CopyWithImpl$Query$getServiceProviderId$service_provider_details$restaurant;

  factory CopyWith$Query$getServiceProviderId$service_provider_details$restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getServiceProviderId$service_provider_details$restaurant;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getServiceProviderId$service_provider_details$restaurant<
        TRes>
    implements
        CopyWith$Query$getServiceProviderId$service_provider_details$restaurant<
            TRes> {
  _CopyWithImpl$Query$getServiceProviderId$service_provider_details$restaurant(
    this._instance,
    this._then,
  );

  final Query$getServiceProviderId$service_provider_details$restaurant
      _instance;

  final TRes Function(
      Query$getServiceProviderId$service_provider_details$restaurant) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getServiceProviderId$service_provider_details$restaurant(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getServiceProviderId$service_provider_details$restaurant<
        TRes>
    implements
        CopyWith$Query$getServiceProviderId$service_provider_details$restaurant<
            TRes> {
  _CopyWithStubImpl$Query$getServiceProviderId$service_provider_details$restaurant(
      this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getServiceLanguage {
  factory Variables$Query$getServiceLanguage({required int serviceDetailsId}) =>
      Variables$Query$getServiceLanguage._({
        r'serviceDetailsId': serviceDetailsId,
      });

  Variables$Query$getServiceLanguage._(this._$data);

  factory Variables$Query$getServiceLanguage.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$serviceDetailsId = data['serviceDetailsId'];
    result$data['serviceDetailsId'] = (l$serviceDetailsId as int);
    return Variables$Query$getServiceLanguage._(result$data);
  }

  Map<String, dynamic> _$data;

  int get serviceDetailsId => (_$data['serviceDetailsId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$serviceDetailsId = serviceDetailsId;
    result$data['serviceDetailsId'] = l$serviceDetailsId;
    return result$data;
  }

  CopyWith$Variables$Query$getServiceLanguage<
          Variables$Query$getServiceLanguage>
      get copyWith => CopyWith$Variables$Query$getServiceLanguage(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getServiceLanguage) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$serviceDetailsId = serviceDetailsId;
    final lOther$serviceDetailsId = other.serviceDetailsId;
    if (l$serviceDetailsId != lOther$serviceDetailsId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$serviceDetailsId = serviceDetailsId;
    return Object.hashAll([l$serviceDetailsId]);
  }
}

abstract class CopyWith$Variables$Query$getServiceLanguage<TRes> {
  factory CopyWith$Variables$Query$getServiceLanguage(
    Variables$Query$getServiceLanguage instance,
    TRes Function(Variables$Query$getServiceLanguage) then,
  ) = _CopyWithImpl$Variables$Query$getServiceLanguage;

  factory CopyWith$Variables$Query$getServiceLanguage.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getServiceLanguage;

  TRes call({int? serviceDetailsId});
}

class _CopyWithImpl$Variables$Query$getServiceLanguage<TRes>
    implements CopyWith$Variables$Query$getServiceLanguage<TRes> {
  _CopyWithImpl$Variables$Query$getServiceLanguage(
    this._instance,
    this._then,
  );

  final Variables$Query$getServiceLanguage _instance;

  final TRes Function(Variables$Query$getServiceLanguage) _then;

  static const _undefined = {};

  TRes call({Object? serviceDetailsId = _undefined}) =>
      _then(Variables$Query$getServiceLanguage._({
        ..._instance._$data,
        if (serviceDetailsId != _undefined && serviceDetailsId != null)
          'serviceDetailsId': (serviceDetailsId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getServiceLanguage<TRes>
    implements CopyWith$Variables$Query$getServiceLanguage<TRes> {
  _CopyWithStubImpl$Variables$Query$getServiceLanguage(this._res);

  TRes _res;

  call({int? serviceDetailsId}) => _res;
}

class Query$getServiceLanguage {
  Query$getServiceLanguage({
    this.service_provider_details_by_pk,
    required this.$__typename,
  });

  factory Query$getServiceLanguage.fromJson(Map<String, dynamic> json) {
    final l$service_provider_details_by_pk =
        json['service_provider_details_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$getServiceLanguage(
      service_provider_details_by_pk: l$service_provider_details_by_pk == null
          ? null
          : Query$getServiceLanguage$service_provider_details_by_pk.fromJson(
              (l$service_provider_details_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getServiceLanguage$service_provider_details_by_pk?
      service_provider_details_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$service_provider_details_by_pk = service_provider_details_by_pk;
    _resultData['service_provider_details_by_pk'] =
        l$service_provider_details_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$service_provider_details_by_pk = service_provider_details_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$service_provider_details_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getServiceLanguage) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$service_provider_details_by_pk = service_provider_details_by_pk;
    final lOther$service_provider_details_by_pk =
        other.service_provider_details_by_pk;
    if (l$service_provider_details_by_pk !=
        lOther$service_provider_details_by_pk) {
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

extension UtilityExtension$Query$getServiceLanguage
    on Query$getServiceLanguage {
  CopyWith$Query$getServiceLanguage<Query$getServiceLanguage> get copyWith =>
      CopyWith$Query$getServiceLanguage(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getServiceLanguage<TRes> {
  factory CopyWith$Query$getServiceLanguage(
    Query$getServiceLanguage instance,
    TRes Function(Query$getServiceLanguage) then,
  ) = _CopyWithImpl$Query$getServiceLanguage;

  factory CopyWith$Query$getServiceLanguage.stub(TRes res) =
      _CopyWithStubImpl$Query$getServiceLanguage;

  TRes call({
    Query$getServiceLanguage$service_provider_details_by_pk?
        service_provider_details_by_pk,
    String? $__typename,
  });
  CopyWith$Query$getServiceLanguage$service_provider_details_by_pk<TRes>
      get service_provider_details_by_pk;
}

class _CopyWithImpl$Query$getServiceLanguage<TRes>
    implements CopyWith$Query$getServiceLanguage<TRes> {
  _CopyWithImpl$Query$getServiceLanguage(
    this._instance,
    this._then,
  );

  final Query$getServiceLanguage _instance;

  final TRes Function(Query$getServiceLanguage) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_details_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getServiceLanguage(
        service_provider_details_by_pk: service_provider_details_by_pk ==
                _undefined
            ? _instance.service_provider_details_by_pk
            : (service_provider_details_by_pk
                as Query$getServiceLanguage$service_provider_details_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getServiceLanguage$service_provider_details_by_pk<TRes>
      get service_provider_details_by_pk {
    final local$service_provider_details_by_pk =
        _instance.service_provider_details_by_pk;
    return local$service_provider_details_by_pk == null
        ? CopyWith$Query$getServiceLanguage$service_provider_details_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$getServiceLanguage$service_provider_details_by_pk(
            local$service_provider_details_by_pk,
            (e) => call(service_provider_details_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$getServiceLanguage<TRes>
    implements CopyWith$Query$getServiceLanguage<TRes> {
  _CopyWithStubImpl$Query$getServiceLanguage(this._res);

  TRes _res;

  call({
    Query$getServiceLanguage$service_provider_details_by_pk?
        service_provider_details_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getServiceLanguage$service_provider_details_by_pk<TRes>
      get service_provider_details_by_pk =>
          CopyWith$Query$getServiceLanguage$service_provider_details_by_pk.stub(
              _res);
}

const documentNodeQuerygetServiceLanguage = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getServiceLanguage'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'serviceDetailsId')),
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
        name: NameNode(value: 'service_provider_details_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'serviceDetailsId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'language'),
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
Query$getServiceLanguage _parserFn$Query$getServiceLanguage(
        Map<String, dynamic> data) =>
    Query$getServiceLanguage.fromJson(data);

class Options$Query$getServiceLanguage
    extends graphql.QueryOptions<Query$getServiceLanguage> {
  Options$Query$getServiceLanguage({
    String? operationName,
    required Variables$Query$getServiceLanguage variables,
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
          document: documentNodeQuerygetServiceLanguage,
          parserFn: _parserFn$Query$getServiceLanguage,
        );
}

class WatchOptions$Query$getServiceLanguage
    extends graphql.WatchQueryOptions<Query$getServiceLanguage> {
  WatchOptions$Query$getServiceLanguage({
    String? operationName,
    required Variables$Query$getServiceLanguage variables,
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
          document: documentNodeQuerygetServiceLanguage,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getServiceLanguage,
        );
}

class FetchMoreOptions$Query$getServiceLanguage
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getServiceLanguage({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getServiceLanguage variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetServiceLanguage,
        );
}

extension ClientExtension$Query$getServiceLanguage on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getServiceLanguage>>
      query$getServiceLanguage(
              Options$Query$getServiceLanguage options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getServiceLanguage>
      watchQuery$getServiceLanguage(
              WatchOptions$Query$getServiceLanguage options) =>
          this.watchQuery(options);
  void writeQuery$getServiceLanguage({
    required Query$getServiceLanguage data,
    required Variables$Query$getServiceLanguage variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerygetServiceLanguage),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getServiceLanguage? readQuery$getServiceLanguage({
    required Variables$Query$getServiceLanguage variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetServiceLanguage),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getServiceLanguage.fromJson(result);
  }
}

class Query$getServiceLanguage$service_provider_details_by_pk {
  Query$getServiceLanguage$service_provider_details_by_pk({
    required this.language,
    required this.$__typename,
  });

  factory Query$getServiceLanguage$service_provider_details_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$language = json['language'];
    final l$$__typename = json['__typename'];
    return Query$getServiceLanguage$service_provider_details_by_pk(
      language: mapFromJson(l$language),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final dynamic language;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$language = language;
    _resultData['language'] = mapToJson(l$language);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$language = language;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$language,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getServiceLanguage$service_provider_details_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$language = language;
    final lOther$language = other.language;
    if (l$language != lOther$language) {
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

extension UtilityExtension$Query$getServiceLanguage$service_provider_details_by_pk
    on Query$getServiceLanguage$service_provider_details_by_pk {
  CopyWith$Query$getServiceLanguage$service_provider_details_by_pk<
          Query$getServiceLanguage$service_provider_details_by_pk>
      get copyWith =>
          CopyWith$Query$getServiceLanguage$service_provider_details_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getServiceLanguage$service_provider_details_by_pk<
    TRes> {
  factory CopyWith$Query$getServiceLanguage$service_provider_details_by_pk(
    Query$getServiceLanguage$service_provider_details_by_pk instance,
    TRes Function(Query$getServiceLanguage$service_provider_details_by_pk) then,
  ) = _CopyWithImpl$Query$getServiceLanguage$service_provider_details_by_pk;

  factory CopyWith$Query$getServiceLanguage$service_provider_details_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getServiceLanguage$service_provider_details_by_pk;

  TRes call({
    dynamic? language,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getServiceLanguage$service_provider_details_by_pk<
        TRes>
    implements
        CopyWith$Query$getServiceLanguage$service_provider_details_by_pk<TRes> {
  _CopyWithImpl$Query$getServiceLanguage$service_provider_details_by_pk(
    this._instance,
    this._then,
  );

  final Query$getServiceLanguage$service_provider_details_by_pk _instance;

  final TRes Function(Query$getServiceLanguage$service_provider_details_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getServiceLanguage$service_provider_details_by_pk(
        language: language == _undefined || language == null
            ? _instance.language
            : (language as dynamic),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getServiceLanguage$service_provider_details_by_pk<
        TRes>
    implements
        CopyWith$Query$getServiceLanguage$service_provider_details_by_pk<TRes> {
  _CopyWithStubImpl$Query$getServiceLanguage$service_provider_details_by_pk(
      this._res);

  TRes _res;

  call({
    dynamic? language,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getServiceIsOpen {
  factory Variables$Query$getServiceIsOpen({required int serviceDetailsId}) =>
      Variables$Query$getServiceIsOpen._({
        r'serviceDetailsId': serviceDetailsId,
      });

  Variables$Query$getServiceIsOpen._(this._$data);

  factory Variables$Query$getServiceIsOpen.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$serviceDetailsId = data['serviceDetailsId'];
    result$data['serviceDetailsId'] = (l$serviceDetailsId as int);
    return Variables$Query$getServiceIsOpen._(result$data);
  }

  Map<String, dynamic> _$data;

  int get serviceDetailsId => (_$data['serviceDetailsId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$serviceDetailsId = serviceDetailsId;
    result$data['serviceDetailsId'] = l$serviceDetailsId;
    return result$data;
  }

  CopyWith$Variables$Query$getServiceIsOpen<Variables$Query$getServiceIsOpen>
      get copyWith => CopyWith$Variables$Query$getServiceIsOpen(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getServiceIsOpen) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$serviceDetailsId = serviceDetailsId;
    final lOther$serviceDetailsId = other.serviceDetailsId;
    if (l$serviceDetailsId != lOther$serviceDetailsId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$serviceDetailsId = serviceDetailsId;
    return Object.hashAll([l$serviceDetailsId]);
  }
}

abstract class CopyWith$Variables$Query$getServiceIsOpen<TRes> {
  factory CopyWith$Variables$Query$getServiceIsOpen(
    Variables$Query$getServiceIsOpen instance,
    TRes Function(Variables$Query$getServiceIsOpen) then,
  ) = _CopyWithImpl$Variables$Query$getServiceIsOpen;

  factory CopyWith$Variables$Query$getServiceIsOpen.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getServiceIsOpen;

  TRes call({int? serviceDetailsId});
}

class _CopyWithImpl$Variables$Query$getServiceIsOpen<TRes>
    implements CopyWith$Variables$Query$getServiceIsOpen<TRes> {
  _CopyWithImpl$Variables$Query$getServiceIsOpen(
    this._instance,
    this._then,
  );

  final Variables$Query$getServiceIsOpen _instance;

  final TRes Function(Variables$Query$getServiceIsOpen) _then;

  static const _undefined = {};

  TRes call({Object? serviceDetailsId = _undefined}) =>
      _then(Variables$Query$getServiceIsOpen._({
        ..._instance._$data,
        if (serviceDetailsId != _undefined && serviceDetailsId != null)
          'serviceDetailsId': (serviceDetailsId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getServiceIsOpen<TRes>
    implements CopyWith$Variables$Query$getServiceIsOpen<TRes> {
  _CopyWithStubImpl$Variables$Query$getServiceIsOpen(this._res);

  TRes _res;

  call({int? serviceDetailsId}) => _res;
}

class Query$getServiceIsOpen {
  Query$getServiceIsOpen({
    this.service_provider_details_by_pk,
    required this.$__typename,
  });

  factory Query$getServiceIsOpen.fromJson(Map<String, dynamic> json) {
    final l$service_provider_details_by_pk =
        json['service_provider_details_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$getServiceIsOpen(
      service_provider_details_by_pk: l$service_provider_details_by_pk == null
          ? null
          : Query$getServiceIsOpen$service_provider_details_by_pk.fromJson(
              (l$service_provider_details_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getServiceIsOpen$service_provider_details_by_pk?
      service_provider_details_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$service_provider_details_by_pk = service_provider_details_by_pk;
    _resultData['service_provider_details_by_pk'] =
        l$service_provider_details_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$service_provider_details_by_pk = service_provider_details_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$service_provider_details_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getServiceIsOpen) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$service_provider_details_by_pk = service_provider_details_by_pk;
    final lOther$service_provider_details_by_pk =
        other.service_provider_details_by_pk;
    if (l$service_provider_details_by_pk !=
        lOther$service_provider_details_by_pk) {
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

extension UtilityExtension$Query$getServiceIsOpen on Query$getServiceIsOpen {
  CopyWith$Query$getServiceIsOpen<Query$getServiceIsOpen> get copyWith =>
      CopyWith$Query$getServiceIsOpen(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getServiceIsOpen<TRes> {
  factory CopyWith$Query$getServiceIsOpen(
    Query$getServiceIsOpen instance,
    TRes Function(Query$getServiceIsOpen) then,
  ) = _CopyWithImpl$Query$getServiceIsOpen;

  factory CopyWith$Query$getServiceIsOpen.stub(TRes res) =
      _CopyWithStubImpl$Query$getServiceIsOpen;

  TRes call({
    Query$getServiceIsOpen$service_provider_details_by_pk?
        service_provider_details_by_pk,
    String? $__typename,
  });
  CopyWith$Query$getServiceIsOpen$service_provider_details_by_pk<TRes>
      get service_provider_details_by_pk;
}

class _CopyWithImpl$Query$getServiceIsOpen<TRes>
    implements CopyWith$Query$getServiceIsOpen<TRes> {
  _CopyWithImpl$Query$getServiceIsOpen(
    this._instance,
    this._then,
  );

  final Query$getServiceIsOpen _instance;

  final TRes Function(Query$getServiceIsOpen) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_details_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getServiceIsOpen(
        service_provider_details_by_pk:
            service_provider_details_by_pk == _undefined
                ? _instance.service_provider_details_by_pk
                : (service_provider_details_by_pk
                    as Query$getServiceIsOpen$service_provider_details_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getServiceIsOpen$service_provider_details_by_pk<TRes>
      get service_provider_details_by_pk {
    final local$service_provider_details_by_pk =
        _instance.service_provider_details_by_pk;
    return local$service_provider_details_by_pk == null
        ? CopyWith$Query$getServiceIsOpen$service_provider_details_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$getServiceIsOpen$service_provider_details_by_pk(
            local$service_provider_details_by_pk,
            (e) => call(service_provider_details_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$getServiceIsOpen<TRes>
    implements CopyWith$Query$getServiceIsOpen<TRes> {
  _CopyWithStubImpl$Query$getServiceIsOpen(this._res);

  TRes _res;

  call({
    Query$getServiceIsOpen$service_provider_details_by_pk?
        service_provider_details_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getServiceIsOpen$service_provider_details_by_pk<TRes>
      get service_provider_details_by_pk =>
          CopyWith$Query$getServiceIsOpen$service_provider_details_by_pk.stub(
              _res);
}

const documentNodeQuerygetServiceIsOpen = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getServiceIsOpen'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'serviceDetailsId')),
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
        name: NameNode(value: 'service_provider_details_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'serviceDetailsId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'is_open'),
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
Query$getServiceIsOpen _parserFn$Query$getServiceIsOpen(
        Map<String, dynamic> data) =>
    Query$getServiceIsOpen.fromJson(data);

class Options$Query$getServiceIsOpen
    extends graphql.QueryOptions<Query$getServiceIsOpen> {
  Options$Query$getServiceIsOpen({
    String? operationName,
    required Variables$Query$getServiceIsOpen variables,
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
          document: documentNodeQuerygetServiceIsOpen,
          parserFn: _parserFn$Query$getServiceIsOpen,
        );
}

class WatchOptions$Query$getServiceIsOpen
    extends graphql.WatchQueryOptions<Query$getServiceIsOpen> {
  WatchOptions$Query$getServiceIsOpen({
    String? operationName,
    required Variables$Query$getServiceIsOpen variables,
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
          document: documentNodeQuerygetServiceIsOpen,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getServiceIsOpen,
        );
}

class FetchMoreOptions$Query$getServiceIsOpen extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getServiceIsOpen({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getServiceIsOpen variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetServiceIsOpen,
        );
}

extension ClientExtension$Query$getServiceIsOpen on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getServiceIsOpen>> query$getServiceIsOpen(
          Options$Query$getServiceIsOpen options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$getServiceIsOpen> watchQuery$getServiceIsOpen(
          WatchOptions$Query$getServiceIsOpen options) =>
      this.watchQuery(options);
  void writeQuery$getServiceIsOpen({
    required Query$getServiceIsOpen data,
    required Variables$Query$getServiceIsOpen variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerygetServiceIsOpen),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getServiceIsOpen? readQuery$getServiceIsOpen({
    required Variables$Query$getServiceIsOpen variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetServiceIsOpen),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getServiceIsOpen.fromJson(result);
  }
}

class Query$getServiceIsOpen$service_provider_details_by_pk {
  Query$getServiceIsOpen$service_provider_details_by_pk({
    this.is_open,
    required this.$__typename,
  });

  factory Query$getServiceIsOpen$service_provider_details_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$is_open = json['is_open'];
    final l$$__typename = json['__typename'];
    return Query$getServiceIsOpen$service_provider_details_by_pk(
      is_open: (l$is_open as bool?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final bool? is_open;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$is_open = is_open;
    _resultData['is_open'] = l$is_open;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$is_open = is_open;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$is_open,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getServiceIsOpen$service_provider_details_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$is_open = is_open;
    final lOther$is_open = other.is_open;
    if (l$is_open != lOther$is_open) {
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

extension UtilityExtension$Query$getServiceIsOpen$service_provider_details_by_pk
    on Query$getServiceIsOpen$service_provider_details_by_pk {
  CopyWith$Query$getServiceIsOpen$service_provider_details_by_pk<
          Query$getServiceIsOpen$service_provider_details_by_pk>
      get copyWith =>
          CopyWith$Query$getServiceIsOpen$service_provider_details_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getServiceIsOpen$service_provider_details_by_pk<
    TRes> {
  factory CopyWith$Query$getServiceIsOpen$service_provider_details_by_pk(
    Query$getServiceIsOpen$service_provider_details_by_pk instance,
    TRes Function(Query$getServiceIsOpen$service_provider_details_by_pk) then,
  ) = _CopyWithImpl$Query$getServiceIsOpen$service_provider_details_by_pk;

  factory CopyWith$Query$getServiceIsOpen$service_provider_details_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getServiceIsOpen$service_provider_details_by_pk;

  TRes call({
    bool? is_open,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getServiceIsOpen$service_provider_details_by_pk<TRes>
    implements
        CopyWith$Query$getServiceIsOpen$service_provider_details_by_pk<TRes> {
  _CopyWithImpl$Query$getServiceIsOpen$service_provider_details_by_pk(
    this._instance,
    this._then,
  );

  final Query$getServiceIsOpen$service_provider_details_by_pk _instance;

  final TRes Function(Query$getServiceIsOpen$service_provider_details_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? is_open = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getServiceIsOpen$service_provider_details_by_pk(
        is_open: is_open == _undefined ? _instance.is_open : (is_open as bool?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getServiceIsOpen$service_provider_details_by_pk<
        TRes>
    implements
        CopyWith$Query$getServiceIsOpen$service_provider_details_by_pk<TRes> {
  _CopyWithStubImpl$Query$getServiceIsOpen$service_provider_details_by_pk(
      this._res);

  TRes _res;

  call({
    bool? is_open,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$setLastActiveTime {
  factory Variables$Mutation$setLastActiveTime({required int id}) =>
      Variables$Mutation$setLastActiveTime._({
        r'id': id,
      });

  Variables$Mutation$setLastActiveTime._(this._$data);

  factory Variables$Mutation$setLastActiveTime.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    return Variables$Mutation$setLastActiveTime._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Mutation$setLastActiveTime<
          Variables$Mutation$setLastActiveTime>
      get copyWith => CopyWith$Variables$Mutation$setLastActiveTime(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$setLastActiveTime) ||
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

abstract class CopyWith$Variables$Mutation$setLastActiveTime<TRes> {
  factory CopyWith$Variables$Mutation$setLastActiveTime(
    Variables$Mutation$setLastActiveTime instance,
    TRes Function(Variables$Mutation$setLastActiveTime) then,
  ) = _CopyWithImpl$Variables$Mutation$setLastActiveTime;

  factory CopyWith$Variables$Mutation$setLastActiveTime.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$setLastActiveTime;

  TRes call({int? id});
}

class _CopyWithImpl$Variables$Mutation$setLastActiveTime<TRes>
    implements CopyWith$Variables$Mutation$setLastActiveTime<TRes> {
  _CopyWithImpl$Variables$Mutation$setLastActiveTime(
    this._instance,
    this._then,
  );

  final Variables$Mutation$setLastActiveTime _instance;

  final TRes Function(Variables$Mutation$setLastActiveTime) _then;

  static const _undefined = {};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Mutation$setLastActiveTime._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$setLastActiveTime<TRes>
    implements CopyWith$Variables$Mutation$setLastActiveTime<TRes> {
  _CopyWithStubImpl$Variables$Mutation$setLastActiveTime(this._res);

  TRes _res;

  call({int? id}) => _res;
}

class Mutation$setLastActiveTime {
  Mutation$setLastActiveTime({
    this.update_service_provider_details_by_pk,
    required this.$__typename,
  });

  factory Mutation$setLastActiveTime.fromJson(Map<String, dynamic> json) {
    final l$update_service_provider_details_by_pk =
        json['update_service_provider_details_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$setLastActiveTime(
      update_service_provider_details_by_pk:
          l$update_service_provider_details_by_pk == null
              ? null
              : Mutation$setLastActiveTime$update_service_provider_details_by_pk
                  .fromJson((l$update_service_provider_details_by_pk
                      as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$setLastActiveTime$update_service_provider_details_by_pk?
      update_service_provider_details_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_service_provider_details_by_pk =
        update_service_provider_details_by_pk;
    _resultData['update_service_provider_details_by_pk'] =
        l$update_service_provider_details_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_service_provider_details_by_pk =
        update_service_provider_details_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_service_provider_details_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$setLastActiveTime) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_service_provider_details_by_pk =
        update_service_provider_details_by_pk;
    final lOther$update_service_provider_details_by_pk =
        other.update_service_provider_details_by_pk;
    if (l$update_service_provider_details_by_pk !=
        lOther$update_service_provider_details_by_pk) {
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

extension UtilityExtension$Mutation$setLastActiveTime
    on Mutation$setLastActiveTime {
  CopyWith$Mutation$setLastActiveTime<Mutation$setLastActiveTime>
      get copyWith => CopyWith$Mutation$setLastActiveTime(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$setLastActiveTime<TRes> {
  factory CopyWith$Mutation$setLastActiveTime(
    Mutation$setLastActiveTime instance,
    TRes Function(Mutation$setLastActiveTime) then,
  ) = _CopyWithImpl$Mutation$setLastActiveTime;

  factory CopyWith$Mutation$setLastActiveTime.stub(TRes res) =
      _CopyWithStubImpl$Mutation$setLastActiveTime;

  TRes call({
    Mutation$setLastActiveTime$update_service_provider_details_by_pk?
        update_service_provider_details_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$setLastActiveTime$update_service_provider_details_by_pk<
      TRes> get update_service_provider_details_by_pk;
}

class _CopyWithImpl$Mutation$setLastActiveTime<TRes>
    implements CopyWith$Mutation$setLastActiveTime<TRes> {
  _CopyWithImpl$Mutation$setLastActiveTime(
    this._instance,
    this._then,
  );

  final Mutation$setLastActiveTime _instance;

  final TRes Function(Mutation$setLastActiveTime) _then;

  static const _undefined = {};

  TRes call({
    Object? update_service_provider_details_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$setLastActiveTime(
        update_service_provider_details_by_pk:
            update_service_provider_details_by_pk == _undefined
                ? _instance.update_service_provider_details_by_pk
                : (update_service_provider_details_by_pk
                    as Mutation$setLastActiveTime$update_service_provider_details_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$setLastActiveTime$update_service_provider_details_by_pk<
      TRes> get update_service_provider_details_by_pk {
    final local$update_service_provider_details_by_pk =
        _instance.update_service_provider_details_by_pk;
    return local$update_service_provider_details_by_pk == null
        ? CopyWith$Mutation$setLastActiveTime$update_service_provider_details_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$setLastActiveTime$update_service_provider_details_by_pk(
            local$update_service_provider_details_by_pk,
            (e) => call(update_service_provider_details_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$setLastActiveTime<TRes>
    implements CopyWith$Mutation$setLastActiveTime<TRes> {
  _CopyWithStubImpl$Mutation$setLastActiveTime(this._res);

  TRes _res;

  call({
    Mutation$setLastActiveTime$update_service_provider_details_by_pk?
        update_service_provider_details_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$setLastActiveTime$update_service_provider_details_by_pk<
          TRes>
      get update_service_provider_details_by_pk =>
          CopyWith$Mutation$setLastActiveTime$update_service_provider_details_by_pk
              .stub(_res);
}

const documentNodeMutationsetLastActiveTime = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'setLastActiveTime'),
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
        name: NameNode(value: 'update_service_provider_details_by_pk'),
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
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'last_active_time'),
                value: StringValueNode(
                  value: 'now()',
                  isBlock: false,
                ),
              )
            ]),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'last_active_time'),
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
Mutation$setLastActiveTime _parserFn$Mutation$setLastActiveTime(
        Map<String, dynamic> data) =>
    Mutation$setLastActiveTime.fromJson(data);
typedef OnMutationCompleted$Mutation$setLastActiveTime = FutureOr<void>
    Function(
  dynamic,
  Mutation$setLastActiveTime?,
);

class Options$Mutation$setLastActiveTime
    extends graphql.MutationOptions<Mutation$setLastActiveTime> {
  Options$Mutation$setLastActiveTime({
    String? operationName,
    required Variables$Mutation$setLastActiveTime variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$setLastActiveTime? onCompleted,
    graphql.OnMutationUpdate<Mutation$setLastActiveTime>? update,
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
                        : _parserFn$Mutation$setLastActiveTime(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationsetLastActiveTime,
          parserFn: _parserFn$Mutation$setLastActiveTime,
        );

  final OnMutationCompleted$Mutation$setLastActiveTime? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$setLastActiveTime
    extends graphql.WatchQueryOptions<Mutation$setLastActiveTime> {
  WatchOptions$Mutation$setLastActiveTime({
    String? operationName,
    required Variables$Mutation$setLastActiveTime variables,
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
          document: documentNodeMutationsetLastActiveTime,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$setLastActiveTime,
        );
}

extension ClientExtension$Mutation$setLastActiveTime on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$setLastActiveTime>>
      mutate$setLastActiveTime(
              Options$Mutation$setLastActiveTime options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$setLastActiveTime>
      watchMutation$setLastActiveTime(
              WatchOptions$Mutation$setLastActiveTime options) =>
          this.watchMutation(options);
}

class Mutation$setLastActiveTime$update_service_provider_details_by_pk {
  Mutation$setLastActiveTime$update_service_provider_details_by_pk({
    required this.last_active_time,
    required this.$__typename,
  });

  factory Mutation$setLastActiveTime$update_service_provider_details_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$last_active_time = json['last_active_time'];
    final l$$__typename = json['__typename'];
    return Mutation$setLastActiveTime$update_service_provider_details_by_pk(
      last_active_time: (l$last_active_time as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String last_active_time;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$last_active_time = last_active_time;
    _resultData['last_active_time'] = l$last_active_time;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$last_active_time = last_active_time;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$last_active_time,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$setLastActiveTime$update_service_provider_details_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$last_active_time = last_active_time;
    final lOther$last_active_time = other.last_active_time;
    if (l$last_active_time != lOther$last_active_time) {
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

extension UtilityExtension$Mutation$setLastActiveTime$update_service_provider_details_by_pk
    on Mutation$setLastActiveTime$update_service_provider_details_by_pk {
  CopyWith$Mutation$setLastActiveTime$update_service_provider_details_by_pk<
          Mutation$setLastActiveTime$update_service_provider_details_by_pk>
      get copyWith =>
          CopyWith$Mutation$setLastActiveTime$update_service_provider_details_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$setLastActiveTime$update_service_provider_details_by_pk<
    TRes> {
  factory CopyWith$Mutation$setLastActiveTime$update_service_provider_details_by_pk(
    Mutation$setLastActiveTime$update_service_provider_details_by_pk instance,
    TRes Function(
            Mutation$setLastActiveTime$update_service_provider_details_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$setLastActiveTime$update_service_provider_details_by_pk;

  factory CopyWith$Mutation$setLastActiveTime$update_service_provider_details_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$setLastActiveTime$update_service_provider_details_by_pk;

  TRes call({
    String? last_active_time,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$setLastActiveTime$update_service_provider_details_by_pk<
        TRes>
    implements
        CopyWith$Mutation$setLastActiveTime$update_service_provider_details_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$setLastActiveTime$update_service_provider_details_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$setLastActiveTime$update_service_provider_details_by_pk
      _instance;

  final TRes Function(
      Mutation$setLastActiveTime$update_service_provider_details_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? last_active_time = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$setLastActiveTime$update_service_provider_details_by_pk(
        last_active_time:
            last_active_time == _undefined || last_active_time == null
                ? _instance.last_active_time
                : (last_active_time as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$setLastActiveTime$update_service_provider_details_by_pk<
        TRes>
    implements
        CopyWith$Mutation$setLastActiveTime$update_service_provider_details_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$setLastActiveTime$update_service_provider_details_by_pk(
      this._res);

  TRes _res;

  call({
    String? last_active_time,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$update_business_online_ordering {
  factory Variables$Mutation$update_business_online_ordering({
    required bool online_ordering,
    required int id,
  }) =>
      Variables$Mutation$update_business_online_ordering._({
        r'online_ordering': online_ordering,
        r'id': id,
      });

  Variables$Mutation$update_business_online_ordering._(this._$data);

  factory Variables$Mutation$update_business_online_ordering.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$online_ordering = data['online_ordering'];
    result$data['online_ordering'] = (l$online_ordering as bool);
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    return Variables$Mutation$update_business_online_ordering._(result$data);
  }

  Map<String, dynamic> _$data;

  bool get online_ordering => (_$data['online_ordering'] as bool);
  int get id => (_$data['id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$online_ordering = online_ordering;
    result$data['online_ordering'] = l$online_ordering;
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Mutation$update_business_online_ordering<
          Variables$Mutation$update_business_online_ordering>
      get copyWith =>
          CopyWith$Variables$Mutation$update_business_online_ordering(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$update_business_online_ordering) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$online_ordering = online_ordering;
    final lOther$online_ordering = other.online_ordering;
    if (l$online_ordering != lOther$online_ordering) {
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
    final l$online_ordering = online_ordering;
    final l$id = id;
    return Object.hashAll([
      l$online_ordering,
      l$id,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$update_business_online_ordering<
    TRes> {
  factory CopyWith$Variables$Mutation$update_business_online_ordering(
    Variables$Mutation$update_business_online_ordering instance,
    TRes Function(Variables$Mutation$update_business_online_ordering) then,
  ) = _CopyWithImpl$Variables$Mutation$update_business_online_ordering;

  factory CopyWith$Variables$Mutation$update_business_online_ordering.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Mutation$update_business_online_ordering;

  TRes call({
    bool? online_ordering,
    int? id,
  });
}

class _CopyWithImpl$Variables$Mutation$update_business_online_ordering<TRes>
    implements
        CopyWith$Variables$Mutation$update_business_online_ordering<TRes> {
  _CopyWithImpl$Variables$Mutation$update_business_online_ordering(
    this._instance,
    this._then,
  );

  final Variables$Mutation$update_business_online_ordering _instance;

  final TRes Function(Variables$Mutation$update_business_online_ordering) _then;

  static const _undefined = {};

  TRes call({
    Object? online_ordering = _undefined,
    Object? id = _undefined,
  }) =>
      _then(Variables$Mutation$update_business_online_ordering._({
        ..._instance._$data,
        if (online_ordering != _undefined && online_ordering != null)
          'online_ordering': (online_ordering as bool),
        if (id != _undefined && id != null) 'id': (id as int),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$update_business_online_ordering<TRes>
    implements
        CopyWith$Variables$Mutation$update_business_online_ordering<TRes> {
  _CopyWithStubImpl$Variables$Mutation$update_business_online_ordering(
      this._res);

  TRes _res;

  call({
    bool? online_ordering,
    int? id,
  }) =>
      _res;
}

class Mutation$update_business_online_ordering {
  Mutation$update_business_online_ordering({
    this.update_service_provider_details_by_pk,
    required this.$__typename,
  });

  factory Mutation$update_business_online_ordering.fromJson(
      Map<String, dynamic> json) {
    final l$update_service_provider_details_by_pk =
        json['update_service_provider_details_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$update_business_online_ordering(
      update_service_provider_details_by_pk:
          l$update_service_provider_details_by_pk == null
              ? null
              : Mutation$update_business_online_ordering$update_service_provider_details_by_pk
                  .fromJson((l$update_service_provider_details_by_pk
                      as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$update_business_online_ordering$update_service_provider_details_by_pk?
      update_service_provider_details_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_service_provider_details_by_pk =
        update_service_provider_details_by_pk;
    _resultData['update_service_provider_details_by_pk'] =
        l$update_service_provider_details_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_service_provider_details_by_pk =
        update_service_provider_details_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_service_provider_details_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$update_business_online_ordering) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_service_provider_details_by_pk =
        update_service_provider_details_by_pk;
    final lOther$update_service_provider_details_by_pk =
        other.update_service_provider_details_by_pk;
    if (l$update_service_provider_details_by_pk !=
        lOther$update_service_provider_details_by_pk) {
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

extension UtilityExtension$Mutation$update_business_online_ordering
    on Mutation$update_business_online_ordering {
  CopyWith$Mutation$update_business_online_ordering<
          Mutation$update_business_online_ordering>
      get copyWith => CopyWith$Mutation$update_business_online_ordering(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$update_business_online_ordering<TRes> {
  factory CopyWith$Mutation$update_business_online_ordering(
    Mutation$update_business_online_ordering instance,
    TRes Function(Mutation$update_business_online_ordering) then,
  ) = _CopyWithImpl$Mutation$update_business_online_ordering;

  factory CopyWith$Mutation$update_business_online_ordering.stub(TRes res) =
      _CopyWithStubImpl$Mutation$update_business_online_ordering;

  TRes call({
    Mutation$update_business_online_ordering$update_service_provider_details_by_pk?
        update_service_provider_details_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$update_business_online_ordering$update_service_provider_details_by_pk<
      TRes> get update_service_provider_details_by_pk;
}

class _CopyWithImpl$Mutation$update_business_online_ordering<TRes>
    implements CopyWith$Mutation$update_business_online_ordering<TRes> {
  _CopyWithImpl$Mutation$update_business_online_ordering(
    this._instance,
    this._then,
  );

  final Mutation$update_business_online_ordering _instance;

  final TRes Function(Mutation$update_business_online_ordering) _then;

  static const _undefined = {};

  TRes call({
    Object? update_service_provider_details_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$update_business_online_ordering(
        update_service_provider_details_by_pk:
            update_service_provider_details_by_pk == _undefined
                ? _instance.update_service_provider_details_by_pk
                : (update_service_provider_details_by_pk
                    as Mutation$update_business_online_ordering$update_service_provider_details_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$update_business_online_ordering$update_service_provider_details_by_pk<
      TRes> get update_service_provider_details_by_pk {
    final local$update_service_provider_details_by_pk =
        _instance.update_service_provider_details_by_pk;
    return local$update_service_provider_details_by_pk == null
        ? CopyWith$Mutation$update_business_online_ordering$update_service_provider_details_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$update_business_online_ordering$update_service_provider_details_by_pk(
            local$update_service_provider_details_by_pk,
            (e) => call(update_service_provider_details_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$update_business_online_ordering<TRes>
    implements CopyWith$Mutation$update_business_online_ordering<TRes> {
  _CopyWithStubImpl$Mutation$update_business_online_ordering(this._res);

  TRes _res;

  call({
    Mutation$update_business_online_ordering$update_service_provider_details_by_pk?
        update_service_provider_details_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$update_business_online_ordering$update_service_provider_details_by_pk<
          TRes>
      get update_service_provider_details_by_pk =>
          CopyWith$Mutation$update_business_online_ordering$update_service_provider_details_by_pk
              .stub(_res);
}

const documentNodeMutationupdate_business_online_ordering =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'update_business_online_ordering'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'online_ordering')),
        type: NamedTypeNode(
          name: NameNode(value: 'Boolean'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'update_service_provider_details_by_pk'),
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
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'online_ordering'),
                value: VariableNode(name: NameNode(value: 'online_ordering')),
              )
            ]),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'online_ordering'),
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
Mutation$update_business_online_ordering
    _parserFn$Mutation$update_business_online_ordering(
            Map<String, dynamic> data) =>
        Mutation$update_business_online_ordering.fromJson(data);
typedef OnMutationCompleted$Mutation$update_business_online_ordering
    = FutureOr<void> Function(
  dynamic,
  Mutation$update_business_online_ordering?,
);

class Options$Mutation$update_business_online_ordering
    extends graphql.MutationOptions<Mutation$update_business_online_ordering> {
  Options$Mutation$update_business_online_ordering({
    String? operationName,
    required Variables$Mutation$update_business_online_ordering variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$update_business_online_ordering? onCompleted,
    graphql.OnMutationUpdate<Mutation$update_business_online_ordering>? update,
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
                        : _parserFn$Mutation$update_business_online_ordering(
                            data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdate_business_online_ordering,
          parserFn: _parserFn$Mutation$update_business_online_ordering,
        );

  final OnMutationCompleted$Mutation$update_business_online_ordering?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$update_business_online_ordering extends graphql
    .WatchQueryOptions<Mutation$update_business_online_ordering> {
  WatchOptions$Mutation$update_business_online_ordering({
    String? operationName,
    required Variables$Mutation$update_business_online_ordering variables,
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
          document: documentNodeMutationupdate_business_online_ordering,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$update_business_online_ordering,
        );
}

extension ClientExtension$Mutation$update_business_online_ordering
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$update_business_online_ordering>>
      mutate$update_business_online_ordering(
              Options$Mutation$update_business_online_ordering options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$update_business_online_ordering>
      watchMutation$update_business_online_ordering(
              WatchOptions$Mutation$update_business_online_ordering options) =>
          this.watchMutation(options);
}

class Mutation$update_business_online_ordering$update_service_provider_details_by_pk {
  Mutation$update_business_online_ordering$update_service_provider_details_by_pk({
    required this.online_ordering,
    required this.$__typename,
  });

  factory Mutation$update_business_online_ordering$update_service_provider_details_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$online_ordering = json['online_ordering'];
    final l$$__typename = json['__typename'];
    return Mutation$update_business_online_ordering$update_service_provider_details_by_pk(
      online_ordering: (l$online_ordering as bool),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final bool online_ordering;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$online_ordering = online_ordering;
    _resultData['online_ordering'] = l$online_ordering;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$online_ordering = online_ordering;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$online_ordering,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$update_business_online_ordering$update_service_provider_details_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$online_ordering = online_ordering;
    final lOther$online_ordering = other.online_ordering;
    if (l$online_ordering != lOther$online_ordering) {
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

extension UtilityExtension$Mutation$update_business_online_ordering$update_service_provider_details_by_pk
    on Mutation$update_business_online_ordering$update_service_provider_details_by_pk {
  CopyWith$Mutation$update_business_online_ordering$update_service_provider_details_by_pk<
          Mutation$update_business_online_ordering$update_service_provider_details_by_pk>
      get copyWith =>
          CopyWith$Mutation$update_business_online_ordering$update_service_provider_details_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$update_business_online_ordering$update_service_provider_details_by_pk<
    TRes> {
  factory CopyWith$Mutation$update_business_online_ordering$update_service_provider_details_by_pk(
    Mutation$update_business_online_ordering$update_service_provider_details_by_pk
        instance,
    TRes Function(
            Mutation$update_business_online_ordering$update_service_provider_details_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$update_business_online_ordering$update_service_provider_details_by_pk;

  factory CopyWith$Mutation$update_business_online_ordering$update_service_provider_details_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$update_business_online_ordering$update_service_provider_details_by_pk;

  TRes call({
    bool? online_ordering,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$update_business_online_ordering$update_service_provider_details_by_pk<
        TRes>
    implements
        CopyWith$Mutation$update_business_online_ordering$update_service_provider_details_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$update_business_online_ordering$update_service_provider_details_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$update_business_online_ordering$update_service_provider_details_by_pk
      _instance;

  final TRes Function(
          Mutation$update_business_online_ordering$update_service_provider_details_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? online_ordering = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$update_business_online_ordering$update_service_provider_details_by_pk(
        online_ordering:
            online_ordering == _undefined || online_ordering == null
                ? _instance.online_ordering
                : (online_ordering as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$update_business_online_ordering$update_service_provider_details_by_pk<
        TRes>
    implements
        CopyWith$Mutation$update_business_online_ordering$update_service_provider_details_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$update_business_online_ordering$update_service_provider_details_by_pk(
      this._res);

  TRes _res;

  call({
    bool? online_ordering,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$subscribe_service_provider {
  factory Variables$Mutation$subscribe_service_provider({
    int? customer_id,
    int? service_provider_id,
    String? service_provider_type,
  }) =>
      Variables$Mutation$subscribe_service_provider._({
        if (customer_id != null) r'customer_id': customer_id,
        if (service_provider_id != null)
          r'service_provider_id': service_provider_id,
        if (service_provider_type != null)
          r'service_provider_type': service_provider_type,
      });

  Variables$Mutation$subscribe_service_provider._(this._$data);

  factory Variables$Mutation$subscribe_service_provider.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('customer_id')) {
      final l$customer_id = data['customer_id'];
      result$data['customer_id'] = (l$customer_id as int?);
    }
    if (data.containsKey('service_provider_id')) {
      final l$service_provider_id = data['service_provider_id'];
      result$data['service_provider_id'] = (l$service_provider_id as int?);
    }
    if (data.containsKey('service_provider_type')) {
      final l$service_provider_type = data['service_provider_type'];
      result$data['service_provider_type'] =
          (l$service_provider_type as String?);
    }
    return Variables$Mutation$subscribe_service_provider._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get customer_id => (_$data['customer_id'] as int?);
  int? get service_provider_id => (_$data['service_provider_id'] as int?);
  String? get service_provider_type =>
      (_$data['service_provider_type'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('customer_id')) {
      final l$customer_id = customer_id;
      result$data['customer_id'] = l$customer_id;
    }
    if (_$data.containsKey('service_provider_id')) {
      final l$service_provider_id = service_provider_id;
      result$data['service_provider_id'] = l$service_provider_id;
    }
    if (_$data.containsKey('service_provider_type')) {
      final l$service_provider_type = service_provider_type;
      result$data['service_provider_type'] = l$service_provider_type;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$subscribe_service_provider<
          Variables$Mutation$subscribe_service_provider>
      get copyWith => CopyWith$Variables$Mutation$subscribe_service_provider(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$subscribe_service_provider) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$customer_id = customer_id;
    final lOther$customer_id = other.customer_id;
    if (_$data.containsKey('customer_id') !=
        other._$data.containsKey('customer_id')) {
      return false;
    }
    if (l$customer_id != lOther$customer_id) {
      return false;
    }
    final l$service_provider_id = service_provider_id;
    final lOther$service_provider_id = other.service_provider_id;
    if (_$data.containsKey('service_provider_id') !=
        other._$data.containsKey('service_provider_id')) {
      return false;
    }
    if (l$service_provider_id != lOther$service_provider_id) {
      return false;
    }
    final l$service_provider_type = service_provider_type;
    final lOther$service_provider_type = other.service_provider_type;
    if (_$data.containsKey('service_provider_type') !=
        other._$data.containsKey('service_provider_type')) {
      return false;
    }
    if (l$service_provider_type != lOther$service_provider_type) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$customer_id = customer_id;
    final l$service_provider_id = service_provider_id;
    final l$service_provider_type = service_provider_type;
    return Object.hashAll([
      _$data.containsKey('customer_id') ? l$customer_id : const {},
      _$data.containsKey('service_provider_id')
          ? l$service_provider_id
          : const {},
      _$data.containsKey('service_provider_type')
          ? l$service_provider_type
          : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$subscribe_service_provider<TRes> {
  factory CopyWith$Variables$Mutation$subscribe_service_provider(
    Variables$Mutation$subscribe_service_provider instance,
    TRes Function(Variables$Mutation$subscribe_service_provider) then,
  ) = _CopyWithImpl$Variables$Mutation$subscribe_service_provider;

  factory CopyWith$Variables$Mutation$subscribe_service_provider.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Mutation$subscribe_service_provider;

  TRes call({
    int? customer_id,
    int? service_provider_id,
    String? service_provider_type,
  });
}

class _CopyWithImpl$Variables$Mutation$subscribe_service_provider<TRes>
    implements CopyWith$Variables$Mutation$subscribe_service_provider<TRes> {
  _CopyWithImpl$Variables$Mutation$subscribe_service_provider(
    this._instance,
    this._then,
  );

  final Variables$Mutation$subscribe_service_provider _instance;

  final TRes Function(Variables$Mutation$subscribe_service_provider) _then;

  static const _undefined = {};

  TRes call({
    Object? customer_id = _undefined,
    Object? service_provider_id = _undefined,
    Object? service_provider_type = _undefined,
  }) =>
      _then(Variables$Mutation$subscribe_service_provider._({
        ..._instance._$data,
        if (customer_id != _undefined) 'customer_id': (customer_id as int?),
        if (service_provider_id != _undefined)
          'service_provider_id': (service_provider_id as int?),
        if (service_provider_type != _undefined)
          'service_provider_type': (service_provider_type as String?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$subscribe_service_provider<TRes>
    implements CopyWith$Variables$Mutation$subscribe_service_provider<TRes> {
  _CopyWithStubImpl$Variables$Mutation$subscribe_service_provider(this._res);

  TRes _res;

  call({
    int? customer_id,
    int? service_provider_id,
    String? service_provider_type,
  }) =>
      _res;
}

class Mutation$subscribe_service_provider {
  Mutation$subscribe_service_provider({
    this.insert_service_provider_subscriber_one,
    required this.$__typename,
  });

  factory Mutation$subscribe_service_provider.fromJson(
      Map<String, dynamic> json) {
    final l$insert_service_provider_subscriber_one =
        json['insert_service_provider_subscriber_one'];
    final l$$__typename = json['__typename'];
    return Mutation$subscribe_service_provider(
      insert_service_provider_subscriber_one:
          l$insert_service_provider_subscriber_one == null
              ? null
              : Mutation$subscribe_service_provider$insert_service_provider_subscriber_one
                  .fromJson((l$insert_service_provider_subscriber_one
                      as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$subscribe_service_provider$insert_service_provider_subscriber_one?
      insert_service_provider_subscriber_one;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insert_service_provider_subscriber_one =
        insert_service_provider_subscriber_one;
    _resultData['insert_service_provider_subscriber_one'] =
        l$insert_service_provider_subscriber_one?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insert_service_provider_subscriber_one =
        insert_service_provider_subscriber_one;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$insert_service_provider_subscriber_one,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$subscribe_service_provider) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$insert_service_provider_subscriber_one =
        insert_service_provider_subscriber_one;
    final lOther$insert_service_provider_subscriber_one =
        other.insert_service_provider_subscriber_one;
    if (l$insert_service_provider_subscriber_one !=
        lOther$insert_service_provider_subscriber_one) {
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

extension UtilityExtension$Mutation$subscribe_service_provider
    on Mutation$subscribe_service_provider {
  CopyWith$Mutation$subscribe_service_provider<
          Mutation$subscribe_service_provider>
      get copyWith => CopyWith$Mutation$subscribe_service_provider(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$subscribe_service_provider<TRes> {
  factory CopyWith$Mutation$subscribe_service_provider(
    Mutation$subscribe_service_provider instance,
    TRes Function(Mutation$subscribe_service_provider) then,
  ) = _CopyWithImpl$Mutation$subscribe_service_provider;

  factory CopyWith$Mutation$subscribe_service_provider.stub(TRes res) =
      _CopyWithStubImpl$Mutation$subscribe_service_provider;

  TRes call({
    Mutation$subscribe_service_provider$insert_service_provider_subscriber_one?
        insert_service_provider_subscriber_one,
    String? $__typename,
  });
  CopyWith$Mutation$subscribe_service_provider$insert_service_provider_subscriber_one<
      TRes> get insert_service_provider_subscriber_one;
}

class _CopyWithImpl$Mutation$subscribe_service_provider<TRes>
    implements CopyWith$Mutation$subscribe_service_provider<TRes> {
  _CopyWithImpl$Mutation$subscribe_service_provider(
    this._instance,
    this._then,
  );

  final Mutation$subscribe_service_provider _instance;

  final TRes Function(Mutation$subscribe_service_provider) _then;

  static const _undefined = {};

  TRes call({
    Object? insert_service_provider_subscriber_one = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$subscribe_service_provider(
        insert_service_provider_subscriber_one:
            insert_service_provider_subscriber_one == _undefined
                ? _instance.insert_service_provider_subscriber_one
                : (insert_service_provider_subscriber_one
                    as Mutation$subscribe_service_provider$insert_service_provider_subscriber_one?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$subscribe_service_provider$insert_service_provider_subscriber_one<
      TRes> get insert_service_provider_subscriber_one {
    final local$insert_service_provider_subscriber_one =
        _instance.insert_service_provider_subscriber_one;
    return local$insert_service_provider_subscriber_one == null
        ? CopyWith$Mutation$subscribe_service_provider$insert_service_provider_subscriber_one
            .stub(_then(_instance))
        : CopyWith$Mutation$subscribe_service_provider$insert_service_provider_subscriber_one(
            local$insert_service_provider_subscriber_one,
            (e) => call(insert_service_provider_subscriber_one: e));
  }
}

class _CopyWithStubImpl$Mutation$subscribe_service_provider<TRes>
    implements CopyWith$Mutation$subscribe_service_provider<TRes> {
  _CopyWithStubImpl$Mutation$subscribe_service_provider(this._res);

  TRes _res;

  call({
    Mutation$subscribe_service_provider$insert_service_provider_subscriber_one?
        insert_service_provider_subscriber_one,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$subscribe_service_provider$insert_service_provider_subscriber_one<
          TRes>
      get insert_service_provider_subscriber_one =>
          CopyWith$Mutation$subscribe_service_provider$insert_service_provider_subscriber_one
              .stub(_res);
}

const documentNodeMutationsubscribe_service_provider =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'subscribe_service_provider'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'customer_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'service_provider_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'service_provider_type')),
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
        name: NameNode(value: 'insert_service_provider_subscriber_one'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'object'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'customer_id'),
                value: VariableNode(name: NameNode(value: 'customer_id')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'service_provider_id'),
                value:
                    VariableNode(name: NameNode(value: 'service_provider_id')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'service_provider_type'),
                value: VariableNode(
                    name: NameNode(value: 'service_provider_type')),
              ),
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
Mutation$subscribe_service_provider
    _parserFn$Mutation$subscribe_service_provider(Map<String, dynamic> data) =>
        Mutation$subscribe_service_provider.fromJson(data);
typedef OnMutationCompleted$Mutation$subscribe_service_provider = FutureOr<void>
    Function(
  dynamic,
  Mutation$subscribe_service_provider?,
);

class Options$Mutation$subscribe_service_provider
    extends graphql.MutationOptions<Mutation$subscribe_service_provider> {
  Options$Mutation$subscribe_service_provider({
    String? operationName,
    Variables$Mutation$subscribe_service_provider? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$subscribe_service_provider? onCompleted,
    graphql.OnMutationUpdate<Mutation$subscribe_service_provider>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables?.toJson() ?? {},
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
                        : _parserFn$Mutation$subscribe_service_provider(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationsubscribe_service_provider,
          parserFn: _parserFn$Mutation$subscribe_service_provider,
        );

  final OnMutationCompleted$Mutation$subscribe_service_provider?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$subscribe_service_provider
    extends graphql.WatchQueryOptions<Mutation$subscribe_service_provider> {
  WatchOptions$Mutation$subscribe_service_provider({
    String? operationName,
    Variables$Mutation$subscribe_service_provider? variables,
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
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeMutationsubscribe_service_provider,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$subscribe_service_provider,
        );
}

extension ClientExtension$Mutation$subscribe_service_provider
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$subscribe_service_provider>>
      mutate$subscribe_service_provider(
              [Options$Mutation$subscribe_service_provider? options]) async =>
          await this
              .mutate(options ?? Options$Mutation$subscribe_service_provider());
  graphql.ObservableQuery<Mutation$subscribe_service_provider>
      watchMutation$subscribe_service_provider(
              [WatchOptions$Mutation$subscribe_service_provider? options]) =>
          this.watchMutation(
              options ?? WatchOptions$Mutation$subscribe_service_provider());
}

class Mutation$subscribe_service_provider$insert_service_provider_subscriber_one {
  Mutation$subscribe_service_provider$insert_service_provider_subscriber_one({
    required this.id,
    required this.$__typename,
  });

  factory Mutation$subscribe_service_provider$insert_service_provider_subscriber_one.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$subscribe_service_provider$insert_service_provider_subscriber_one(
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
            is Mutation$subscribe_service_provider$insert_service_provider_subscriber_one) ||
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

extension UtilityExtension$Mutation$subscribe_service_provider$insert_service_provider_subscriber_one
    on Mutation$subscribe_service_provider$insert_service_provider_subscriber_one {
  CopyWith$Mutation$subscribe_service_provider$insert_service_provider_subscriber_one<
          Mutation$subscribe_service_provider$insert_service_provider_subscriber_one>
      get copyWith =>
          CopyWith$Mutation$subscribe_service_provider$insert_service_provider_subscriber_one(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$subscribe_service_provider$insert_service_provider_subscriber_one<
    TRes> {
  factory CopyWith$Mutation$subscribe_service_provider$insert_service_provider_subscriber_one(
    Mutation$subscribe_service_provider$insert_service_provider_subscriber_one
        instance,
    TRes Function(
            Mutation$subscribe_service_provider$insert_service_provider_subscriber_one)
        then,
  ) = _CopyWithImpl$Mutation$subscribe_service_provider$insert_service_provider_subscriber_one;

  factory CopyWith$Mutation$subscribe_service_provider$insert_service_provider_subscriber_one.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$subscribe_service_provider$insert_service_provider_subscriber_one;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$subscribe_service_provider$insert_service_provider_subscriber_one<
        TRes>
    implements
        CopyWith$Mutation$subscribe_service_provider$insert_service_provider_subscriber_one<
            TRes> {
  _CopyWithImpl$Mutation$subscribe_service_provider$insert_service_provider_subscriber_one(
    this._instance,
    this._then,
  );

  final Mutation$subscribe_service_provider$insert_service_provider_subscriber_one
      _instance;

  final TRes Function(
          Mutation$subscribe_service_provider$insert_service_provider_subscriber_one)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$subscribe_service_provider$insert_service_provider_subscriber_one(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$subscribe_service_provider$insert_service_provider_subscriber_one<
        TRes>
    implements
        CopyWith$Mutation$subscribe_service_provider$insert_service_provider_subscriber_one<
            TRes> {
  _CopyWithStubImpl$Mutation$subscribe_service_provider$insert_service_provider_subscriber_one(
      this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$add_new_offer {
  factory Variables$Mutation$add_new_offer(
          {required Input$service_provider_offer_insert_input object}) =>
      Variables$Mutation$add_new_offer._({
        r'object': object,
      });

  Variables$Mutation$add_new_offer._(this._$data);

  factory Variables$Mutation$add_new_offer.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$object = data['object'];
    result$data['object'] = Input$service_provider_offer_insert_input.fromJson(
        (l$object as Map<String, dynamic>));
    return Variables$Mutation$add_new_offer._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$service_provider_offer_insert_input get object =>
      (_$data['object'] as Input$service_provider_offer_insert_input);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$object = object;
    result$data['object'] = l$object.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$add_new_offer<Variables$Mutation$add_new_offer>
      get copyWith => CopyWith$Variables$Mutation$add_new_offer(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$add_new_offer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$object = object;
    final lOther$object = other.object;
    if (l$object != lOther$object) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$object = object;
    return Object.hashAll([l$object]);
  }
}

abstract class CopyWith$Variables$Mutation$add_new_offer<TRes> {
  factory CopyWith$Variables$Mutation$add_new_offer(
    Variables$Mutation$add_new_offer instance,
    TRes Function(Variables$Mutation$add_new_offer) then,
  ) = _CopyWithImpl$Variables$Mutation$add_new_offer;

  factory CopyWith$Variables$Mutation$add_new_offer.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$add_new_offer;

  TRes call({Input$service_provider_offer_insert_input? object});
}

class _CopyWithImpl$Variables$Mutation$add_new_offer<TRes>
    implements CopyWith$Variables$Mutation$add_new_offer<TRes> {
  _CopyWithImpl$Variables$Mutation$add_new_offer(
    this._instance,
    this._then,
  );

  final Variables$Mutation$add_new_offer _instance;

  final TRes Function(Variables$Mutation$add_new_offer) _then;

  static const _undefined = {};

  TRes call({Object? object = _undefined}) =>
      _then(Variables$Mutation$add_new_offer._({
        ..._instance._$data,
        if (object != _undefined && object != null)
          'object': (object as Input$service_provider_offer_insert_input),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$add_new_offer<TRes>
    implements CopyWith$Variables$Mutation$add_new_offer<TRes> {
  _CopyWithStubImpl$Variables$Mutation$add_new_offer(this._res);

  TRes _res;

  call({Input$service_provider_offer_insert_input? object}) => _res;
}

class Mutation$add_new_offer {
  Mutation$add_new_offer({
    this.insert_service_provider_offer_one,
    required this.$__typename,
  });

  factory Mutation$add_new_offer.fromJson(Map<String, dynamic> json) {
    final l$insert_service_provider_offer_one =
        json['insert_service_provider_offer_one'];
    final l$$__typename = json['__typename'];
    return Mutation$add_new_offer(
      insert_service_provider_offer_one: l$insert_service_provider_offer_one ==
              null
          ? null
          : Mutation$add_new_offer$insert_service_provider_offer_one.fromJson(
              (l$insert_service_provider_offer_one as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$add_new_offer$insert_service_provider_offer_one?
      insert_service_provider_offer_one;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insert_service_provider_offer_one =
        insert_service_provider_offer_one;
    _resultData['insert_service_provider_offer_one'] =
        l$insert_service_provider_offer_one?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insert_service_provider_offer_one =
        insert_service_provider_offer_one;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$insert_service_provider_offer_one,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$add_new_offer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$insert_service_provider_offer_one =
        insert_service_provider_offer_one;
    final lOther$insert_service_provider_offer_one =
        other.insert_service_provider_offer_one;
    if (l$insert_service_provider_offer_one !=
        lOther$insert_service_provider_offer_one) {
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

extension UtilityExtension$Mutation$add_new_offer on Mutation$add_new_offer {
  CopyWith$Mutation$add_new_offer<Mutation$add_new_offer> get copyWith =>
      CopyWith$Mutation$add_new_offer(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$add_new_offer<TRes> {
  factory CopyWith$Mutation$add_new_offer(
    Mutation$add_new_offer instance,
    TRes Function(Mutation$add_new_offer) then,
  ) = _CopyWithImpl$Mutation$add_new_offer;

  factory CopyWith$Mutation$add_new_offer.stub(TRes res) =
      _CopyWithStubImpl$Mutation$add_new_offer;

  TRes call({
    Mutation$add_new_offer$insert_service_provider_offer_one?
        insert_service_provider_offer_one,
    String? $__typename,
  });
  CopyWith$Mutation$add_new_offer$insert_service_provider_offer_one<TRes>
      get insert_service_provider_offer_one;
}

class _CopyWithImpl$Mutation$add_new_offer<TRes>
    implements CopyWith$Mutation$add_new_offer<TRes> {
  _CopyWithImpl$Mutation$add_new_offer(
    this._instance,
    this._then,
  );

  final Mutation$add_new_offer _instance;

  final TRes Function(Mutation$add_new_offer) _then;

  static const _undefined = {};

  TRes call({
    Object? insert_service_provider_offer_one = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$add_new_offer(
        insert_service_provider_offer_one: insert_service_provider_offer_one ==
                _undefined
            ? _instance.insert_service_provider_offer_one
            : (insert_service_provider_offer_one
                as Mutation$add_new_offer$insert_service_provider_offer_one?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$add_new_offer$insert_service_provider_offer_one<TRes>
      get insert_service_provider_offer_one {
    final local$insert_service_provider_offer_one =
        _instance.insert_service_provider_offer_one;
    return local$insert_service_provider_offer_one == null
        ? CopyWith$Mutation$add_new_offer$insert_service_provider_offer_one
            .stub(_then(_instance))
        : CopyWith$Mutation$add_new_offer$insert_service_provider_offer_one(
            local$insert_service_provider_offer_one,
            (e) => call(insert_service_provider_offer_one: e));
  }
}

class _CopyWithStubImpl$Mutation$add_new_offer<TRes>
    implements CopyWith$Mutation$add_new_offer<TRes> {
  _CopyWithStubImpl$Mutation$add_new_offer(this._res);

  TRes _res;

  call({
    Mutation$add_new_offer$insert_service_provider_offer_one?
        insert_service_provider_offer_one,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$add_new_offer$insert_service_provider_offer_one<TRes>
      get insert_service_provider_offer_one =>
          CopyWith$Mutation$add_new_offer$insert_service_provider_offer_one
              .stub(_res);
}

const documentNodeMutationadd_new_offer = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'add_new_offer'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'object')),
        type: NamedTypeNode(
          name: NameNode(value: 'service_provider_offer_insert_input'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'insert_service_provider_offer_one'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'object'),
            value: VariableNode(name: NameNode(value: 'object')),
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
Mutation$add_new_offer _parserFn$Mutation$add_new_offer(
        Map<String, dynamic> data) =>
    Mutation$add_new_offer.fromJson(data);
typedef OnMutationCompleted$Mutation$add_new_offer = FutureOr<void> Function(
  dynamic,
  Mutation$add_new_offer?,
);

class Options$Mutation$add_new_offer
    extends graphql.MutationOptions<Mutation$add_new_offer> {
  Options$Mutation$add_new_offer({
    String? operationName,
    required Variables$Mutation$add_new_offer variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$add_new_offer? onCompleted,
    graphql.OnMutationUpdate<Mutation$add_new_offer>? update,
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
                        : _parserFn$Mutation$add_new_offer(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationadd_new_offer,
          parserFn: _parserFn$Mutation$add_new_offer,
        );

  final OnMutationCompleted$Mutation$add_new_offer? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$add_new_offer
    extends graphql.WatchQueryOptions<Mutation$add_new_offer> {
  WatchOptions$Mutation$add_new_offer({
    String? operationName,
    required Variables$Mutation$add_new_offer variables,
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
          document: documentNodeMutationadd_new_offer,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$add_new_offer,
        );
}

extension ClientExtension$Mutation$add_new_offer on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$add_new_offer>> mutate$add_new_offer(
          Options$Mutation$add_new_offer options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$add_new_offer> watchMutation$add_new_offer(
          WatchOptions$Mutation$add_new_offer options) =>
      this.watchMutation(options);
}

class Mutation$add_new_offer$insert_service_provider_offer_one {
  Mutation$add_new_offer$insert_service_provider_offer_one({
    required this.id,
    required this.$__typename,
  });

  factory Mutation$add_new_offer$insert_service_provider_offer_one.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$add_new_offer$insert_service_provider_offer_one(
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
    if (!(other is Mutation$add_new_offer$insert_service_provider_offer_one) ||
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

extension UtilityExtension$Mutation$add_new_offer$insert_service_provider_offer_one
    on Mutation$add_new_offer$insert_service_provider_offer_one {
  CopyWith$Mutation$add_new_offer$insert_service_provider_offer_one<
          Mutation$add_new_offer$insert_service_provider_offer_one>
      get copyWith =>
          CopyWith$Mutation$add_new_offer$insert_service_provider_offer_one(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$add_new_offer$insert_service_provider_offer_one<
    TRes> {
  factory CopyWith$Mutation$add_new_offer$insert_service_provider_offer_one(
    Mutation$add_new_offer$insert_service_provider_offer_one instance,
    TRes Function(Mutation$add_new_offer$insert_service_provider_offer_one)
        then,
  ) = _CopyWithImpl$Mutation$add_new_offer$insert_service_provider_offer_one;

  factory CopyWith$Mutation$add_new_offer$insert_service_provider_offer_one.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$add_new_offer$insert_service_provider_offer_one;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$add_new_offer$insert_service_provider_offer_one<
        TRes>
    implements
        CopyWith$Mutation$add_new_offer$insert_service_provider_offer_one<
            TRes> {
  _CopyWithImpl$Mutation$add_new_offer$insert_service_provider_offer_one(
    this._instance,
    this._then,
  );

  final Mutation$add_new_offer$insert_service_provider_offer_one _instance;

  final TRes Function(Mutation$add_new_offer$insert_service_provider_offer_one)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$add_new_offer$insert_service_provider_offer_one(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$add_new_offer$insert_service_provider_offer_one<
        TRes>
    implements
        CopyWith$Mutation$add_new_offer$insert_service_provider_offer_one<
            TRes> {
  _CopyWithStubImpl$Mutation$add_new_offer$insert_service_provider_offer_one(
      this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$get_offer_by_id {
  factory Variables$Query$get_offer_by_id({required int id}) =>
      Variables$Query$get_offer_by_id._({
        r'id': id,
      });

  Variables$Query$get_offer_by_id._(this._$data);

  factory Variables$Query$get_offer_by_id.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    return Variables$Query$get_offer_by_id._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$get_offer_by_id<Variables$Query$get_offer_by_id>
      get copyWith => CopyWith$Variables$Query$get_offer_by_id(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_offer_by_id) ||
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

abstract class CopyWith$Variables$Query$get_offer_by_id<TRes> {
  factory CopyWith$Variables$Query$get_offer_by_id(
    Variables$Query$get_offer_by_id instance,
    TRes Function(Variables$Query$get_offer_by_id) then,
  ) = _CopyWithImpl$Variables$Query$get_offer_by_id;

  factory CopyWith$Variables$Query$get_offer_by_id.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$get_offer_by_id;

  TRes call({int? id});
}

class _CopyWithImpl$Variables$Query$get_offer_by_id<TRes>
    implements CopyWith$Variables$Query$get_offer_by_id<TRes> {
  _CopyWithImpl$Variables$Query$get_offer_by_id(
    this._instance,
    this._then,
  );

  final Variables$Query$get_offer_by_id _instance;

  final TRes Function(Variables$Query$get_offer_by_id) _then;

  static const _undefined = {};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$get_offer_by_id._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_offer_by_id<TRes>
    implements CopyWith$Variables$Query$get_offer_by_id<TRes> {
  _CopyWithStubImpl$Variables$Query$get_offer_by_id(this._res);

  TRes _res;

  call({int? id}) => _res;
}

class Query$get_offer_by_id {
  Query$get_offer_by_id({
    this.service_provider_offer_by_pk,
    required this.$__typename,
  });

  factory Query$get_offer_by_id.fromJson(Map<String, dynamic> json) {
    final l$service_provider_offer_by_pk = json['service_provider_offer_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$get_offer_by_id(
      service_provider_offer_by_pk: l$service_provider_offer_by_pk == null
          ? null
          : Query$get_offer_by_id$service_provider_offer_by_pk.fromJson(
              (l$service_provider_offer_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_offer_by_id$service_provider_offer_by_pk?
      service_provider_offer_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$service_provider_offer_by_pk = service_provider_offer_by_pk;
    _resultData['service_provider_offer_by_pk'] =
        l$service_provider_offer_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$service_provider_offer_by_pk = service_provider_offer_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$service_provider_offer_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_offer_by_id) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$service_provider_offer_by_pk = service_provider_offer_by_pk;
    final lOther$service_provider_offer_by_pk =
        other.service_provider_offer_by_pk;
    if (l$service_provider_offer_by_pk != lOther$service_provider_offer_by_pk) {
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

extension UtilityExtension$Query$get_offer_by_id on Query$get_offer_by_id {
  CopyWith$Query$get_offer_by_id<Query$get_offer_by_id> get copyWith =>
      CopyWith$Query$get_offer_by_id(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$get_offer_by_id<TRes> {
  factory CopyWith$Query$get_offer_by_id(
    Query$get_offer_by_id instance,
    TRes Function(Query$get_offer_by_id) then,
  ) = _CopyWithImpl$Query$get_offer_by_id;

  factory CopyWith$Query$get_offer_by_id.stub(TRes res) =
      _CopyWithStubImpl$Query$get_offer_by_id;

  TRes call({
    Query$get_offer_by_id$service_provider_offer_by_pk?
        service_provider_offer_by_pk,
    String? $__typename,
  });
  CopyWith$Query$get_offer_by_id$service_provider_offer_by_pk<TRes>
      get service_provider_offer_by_pk;
}

class _CopyWithImpl$Query$get_offer_by_id<TRes>
    implements CopyWith$Query$get_offer_by_id<TRes> {
  _CopyWithImpl$Query$get_offer_by_id(
    this._instance,
    this._then,
  );

  final Query$get_offer_by_id _instance;

  final TRes Function(Query$get_offer_by_id) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_offer_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_offer_by_id(
        service_provider_offer_by_pk: service_provider_offer_by_pk == _undefined
            ? _instance.service_provider_offer_by_pk
            : (service_provider_offer_by_pk
                as Query$get_offer_by_id$service_provider_offer_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_offer_by_id$service_provider_offer_by_pk<TRes>
      get service_provider_offer_by_pk {
    final local$service_provider_offer_by_pk =
        _instance.service_provider_offer_by_pk;
    return local$service_provider_offer_by_pk == null
        ? CopyWith$Query$get_offer_by_id$service_provider_offer_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$get_offer_by_id$service_provider_offer_by_pk(
            local$service_provider_offer_by_pk,
            (e) => call(service_provider_offer_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$get_offer_by_id<TRes>
    implements CopyWith$Query$get_offer_by_id<TRes> {
  _CopyWithStubImpl$Query$get_offer_by_id(this._res);

  TRes _res;

  call({
    Query$get_offer_by_id$service_provider_offer_by_pk?
        service_provider_offer_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_offer_by_id$service_provider_offer_by_pk<TRes>
      get service_provider_offer_by_pk =>
          CopyWith$Query$get_offer_by_id$service_provider_offer_by_pk.stub(
              _res);
}

const documentNodeQueryget_offer_by_id = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_offer_by_id'),
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
        name: NameNode(value: 'service_provider_offer_by_pk'),
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
            name: NameNode(value: 'status'),
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
            name: NameNode(value: 'service_provider_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'offer_type'),
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
            name: NameNode(value: 'details'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'coupon_code'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'name_id'),
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
                    name: NameNode(value: 'value'),
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
Query$get_offer_by_id _parserFn$Query$get_offer_by_id(
        Map<String, dynamic> data) =>
    Query$get_offer_by_id.fromJson(data);

class Options$Query$get_offer_by_id
    extends graphql.QueryOptions<Query$get_offer_by_id> {
  Options$Query$get_offer_by_id({
    String? operationName,
    required Variables$Query$get_offer_by_id variables,
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
          document: documentNodeQueryget_offer_by_id,
          parserFn: _parserFn$Query$get_offer_by_id,
        );
}

class WatchOptions$Query$get_offer_by_id
    extends graphql.WatchQueryOptions<Query$get_offer_by_id> {
  WatchOptions$Query$get_offer_by_id({
    String? operationName,
    required Variables$Query$get_offer_by_id variables,
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
          document: documentNodeQueryget_offer_by_id,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_offer_by_id,
        );
}

class FetchMoreOptions$Query$get_offer_by_id extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_offer_by_id({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_offer_by_id variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_offer_by_id,
        );
}

extension ClientExtension$Query$get_offer_by_id on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_offer_by_id>> query$get_offer_by_id(
          Options$Query$get_offer_by_id options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$get_offer_by_id> watchQuery$get_offer_by_id(
          WatchOptions$Query$get_offer_by_id options) =>
      this.watchQuery(options);
  void writeQuery$get_offer_by_id({
    required Query$get_offer_by_id data,
    required Variables$Query$get_offer_by_id variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryget_offer_by_id),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_offer_by_id? readQuery$get_offer_by_id({
    required Variables$Query$get_offer_by_id variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryget_offer_by_id),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$get_offer_by_id.fromJson(result);
  }
}

class Query$get_offer_by_id$service_provider_offer_by_pk {
  Query$get_offer_by_id$service_provider_offer_by_pk({
    required this.status,
    required this.service_provider_type,
    required this.service_provider_id,
    required this.offer_type,
    required this.id,
    required this.details,
    this.coupon_code,
    required this.name_id,
    required this.name,
    required this.$__typename,
  });

  factory Query$get_offer_by_id$service_provider_offer_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$status = json['status'];
    final l$service_provider_type = json['service_provider_type'];
    final l$service_provider_id = json['service_provider_id'];
    final l$offer_type = json['offer_type'];
    final l$id = json['id'];
    final l$details = json['details'];
    final l$coupon_code = json['coupon_code'];
    final l$name_id = json['name_id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$get_offer_by_id$service_provider_offer_by_pk(
      status: (l$status as String),
      service_provider_type: (l$service_provider_type as String),
      service_provider_id: (l$service_provider_id as int),
      offer_type: (l$offer_type as String),
      id: (l$id as int),
      details: mapFromJson(l$details),
      coupon_code: (l$coupon_code as String?),
      name_id: (l$name_id as int),
      name: Query$get_offer_by_id$service_provider_offer_by_pk$name.fromJson(
          (l$name as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String status;

  final String service_provider_type;

  final int service_provider_id;

  final String offer_type;

  final int id;

  final dynamic details;

  final String? coupon_code;

  final int name_id;

  final Query$get_offer_by_id$service_provider_offer_by_pk$name name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$status = status;
    _resultData['status'] = l$status;
    final l$service_provider_type = service_provider_type;
    _resultData['service_provider_type'] = l$service_provider_type;
    final l$service_provider_id = service_provider_id;
    _resultData['service_provider_id'] = l$service_provider_id;
    final l$offer_type = offer_type;
    _resultData['offer_type'] = l$offer_type;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$details = details;
    _resultData['details'] = mapToJson(l$details);
    final l$coupon_code = coupon_code;
    _resultData['coupon_code'] = l$coupon_code;
    final l$name_id = name_id;
    _resultData['name_id'] = l$name_id;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$status = status;
    final l$service_provider_type = service_provider_type;
    final l$service_provider_id = service_provider_id;
    final l$offer_type = offer_type;
    final l$id = id;
    final l$details = details;
    final l$coupon_code = coupon_code;
    final l$name_id = name_id;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$status,
      l$service_provider_type,
      l$service_provider_id,
      l$offer_type,
      l$id,
      l$details,
      l$coupon_code,
      l$name_id,
      l$name,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_offer_by_id$service_provider_offer_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$service_provider_type = service_provider_type;
    final lOther$service_provider_type = other.service_provider_type;
    if (l$service_provider_type != lOther$service_provider_type) {
      return false;
    }
    final l$service_provider_id = service_provider_id;
    final lOther$service_provider_id = other.service_provider_id;
    if (l$service_provider_id != lOther$service_provider_id) {
      return false;
    }
    final l$offer_type = offer_type;
    final lOther$offer_type = other.offer_type;
    if (l$offer_type != lOther$offer_type) {
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
    final l$coupon_code = coupon_code;
    final lOther$coupon_code = other.coupon_code;
    if (l$coupon_code != lOther$coupon_code) {
      return false;
    }
    final l$name_id = name_id;
    final lOther$name_id = other.name_id;
    if (l$name_id != lOther$name_id) {
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

extension UtilityExtension$Query$get_offer_by_id$service_provider_offer_by_pk
    on Query$get_offer_by_id$service_provider_offer_by_pk {
  CopyWith$Query$get_offer_by_id$service_provider_offer_by_pk<
          Query$get_offer_by_id$service_provider_offer_by_pk>
      get copyWith =>
          CopyWith$Query$get_offer_by_id$service_provider_offer_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_offer_by_id$service_provider_offer_by_pk<
    TRes> {
  factory CopyWith$Query$get_offer_by_id$service_provider_offer_by_pk(
    Query$get_offer_by_id$service_provider_offer_by_pk instance,
    TRes Function(Query$get_offer_by_id$service_provider_offer_by_pk) then,
  ) = _CopyWithImpl$Query$get_offer_by_id$service_provider_offer_by_pk;

  factory CopyWith$Query$get_offer_by_id$service_provider_offer_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_offer_by_id$service_provider_offer_by_pk;

  TRes call({
    String? status,
    String? service_provider_type,
    int? service_provider_id,
    String? offer_type,
    int? id,
    dynamic? details,
    String? coupon_code,
    int? name_id,
    Query$get_offer_by_id$service_provider_offer_by_pk$name? name,
    String? $__typename,
  });
  CopyWith$Query$get_offer_by_id$service_provider_offer_by_pk$name<TRes>
      get name;
}

class _CopyWithImpl$Query$get_offer_by_id$service_provider_offer_by_pk<TRes>
    implements
        CopyWith$Query$get_offer_by_id$service_provider_offer_by_pk<TRes> {
  _CopyWithImpl$Query$get_offer_by_id$service_provider_offer_by_pk(
    this._instance,
    this._then,
  );

  final Query$get_offer_by_id$service_provider_offer_by_pk _instance;

  final TRes Function(Query$get_offer_by_id$service_provider_offer_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? status = _undefined,
    Object? service_provider_type = _undefined,
    Object? service_provider_id = _undefined,
    Object? offer_type = _undefined,
    Object? id = _undefined,
    Object? details = _undefined,
    Object? coupon_code = _undefined,
    Object? name_id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_offer_by_id$service_provider_offer_by_pk(
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        service_provider_type:
            service_provider_type == _undefined || service_provider_type == null
                ? _instance.service_provider_type
                : (service_provider_type as String),
        service_provider_id:
            service_provider_id == _undefined || service_provider_id == null
                ? _instance.service_provider_id
                : (service_provider_id as int),
        offer_type: offer_type == _undefined || offer_type == null
            ? _instance.offer_type
            : (offer_type as String),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        details: details == _undefined || details == null
            ? _instance.details
            : (details as dynamic),
        coupon_code: coupon_code == _undefined
            ? _instance.coupon_code
            : (coupon_code as String?),
        name_id: name_id == _undefined || name_id == null
            ? _instance.name_id
            : (name_id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as Query$get_offer_by_id$service_provider_offer_by_pk$name),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_offer_by_id$service_provider_offer_by_pk$name<TRes>
      get name {
    final local$name = _instance.name;
    return CopyWith$Query$get_offer_by_id$service_provider_offer_by_pk$name(
        local$name, (e) => call(name: e));
  }
}

class _CopyWithStubImpl$Query$get_offer_by_id$service_provider_offer_by_pk<TRes>
    implements
        CopyWith$Query$get_offer_by_id$service_provider_offer_by_pk<TRes> {
  _CopyWithStubImpl$Query$get_offer_by_id$service_provider_offer_by_pk(
      this._res);

  TRes _res;

  call({
    String? status,
    String? service_provider_type,
    int? service_provider_id,
    String? offer_type,
    int? id,
    dynamic? details,
    String? coupon_code,
    int? name_id,
    Query$get_offer_by_id$service_provider_offer_by_pk$name? name,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_offer_by_id$service_provider_offer_by_pk$name<TRes>
      get name =>
          CopyWith$Query$get_offer_by_id$service_provider_offer_by_pk$name.stub(
              _res);
}

class Query$get_offer_by_id$service_provider_offer_by_pk$name {
  Query$get_offer_by_id$service_provider_offer_by_pk$name({
    required this.translations,
    required this.$__typename,
  });

  factory Query$get_offer_by_id$service_provider_offer_by_pk$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$get_offer_by_id$service_provider_offer_by_pk$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$get_offer_by_id$service_provider_offer_by_pk$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$get_offer_by_id$service_provider_offer_by_pk$name$translations>
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
    if (!(other is Query$get_offer_by_id$service_provider_offer_by_pk$name) ||
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

extension UtilityExtension$Query$get_offer_by_id$service_provider_offer_by_pk$name
    on Query$get_offer_by_id$service_provider_offer_by_pk$name {
  CopyWith$Query$get_offer_by_id$service_provider_offer_by_pk$name<
          Query$get_offer_by_id$service_provider_offer_by_pk$name>
      get copyWith =>
          CopyWith$Query$get_offer_by_id$service_provider_offer_by_pk$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_offer_by_id$service_provider_offer_by_pk$name<
    TRes> {
  factory CopyWith$Query$get_offer_by_id$service_provider_offer_by_pk$name(
    Query$get_offer_by_id$service_provider_offer_by_pk$name instance,
    TRes Function(Query$get_offer_by_id$service_provider_offer_by_pk$name) then,
  ) = _CopyWithImpl$Query$get_offer_by_id$service_provider_offer_by_pk$name;

  factory CopyWith$Query$get_offer_by_id$service_provider_offer_by_pk$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_offer_by_id$service_provider_offer_by_pk$name;

  TRes call({
    List<Query$get_offer_by_id$service_provider_offer_by_pk$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$get_offer_by_id$service_provider_offer_by_pk$name$translations> Function(
              Iterable<
                  CopyWith$Query$get_offer_by_id$service_provider_offer_by_pk$name$translations<
                      Query$get_offer_by_id$service_provider_offer_by_pk$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$get_offer_by_id$service_provider_offer_by_pk$name<
        TRes>
    implements
        CopyWith$Query$get_offer_by_id$service_provider_offer_by_pk$name<TRes> {
  _CopyWithImpl$Query$get_offer_by_id$service_provider_offer_by_pk$name(
    this._instance,
    this._then,
  );

  final Query$get_offer_by_id$service_provider_offer_by_pk$name _instance;

  final TRes Function(Query$get_offer_by_id$service_provider_offer_by_pk$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_offer_by_id$service_provider_offer_by_pk$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$get_offer_by_id$service_provider_offer_by_pk$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$get_offer_by_id$service_provider_offer_by_pk$name$translations> Function(
                  Iterable<
                      CopyWith$Query$get_offer_by_id$service_provider_offer_by_pk$name$translations<
                          Query$get_offer_by_id$service_provider_offer_by_pk$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$get_offer_by_id$service_provider_offer_by_pk$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_offer_by_id$service_provider_offer_by_pk$name<
        TRes>
    implements
        CopyWith$Query$get_offer_by_id$service_provider_offer_by_pk$name<TRes> {
  _CopyWithStubImpl$Query$get_offer_by_id$service_provider_offer_by_pk$name(
      this._res);

  TRes _res;

  call({
    List<Query$get_offer_by_id$service_provider_offer_by_pk$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$get_offer_by_id$service_provider_offer_by_pk$name$translations {
  Query$get_offer_by_id$service_provider_offer_by_pk$name$translations({
    required this.value,
    required this.language_id,
    required this.$__typename,
  });

  factory Query$get_offer_by_id$service_provider_offer_by_pk$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$value = json['value'];
    final l$language_id = json['language_id'];
    final l$$__typename = json['__typename'];
    return Query$get_offer_by_id$service_provider_offer_by_pk$name$translations(
      value: (l$value as String),
      language_id: (l$language_id as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String value;

  final String language_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$value = value;
    _resultData['value'] = l$value;
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$value = value;
    final l$language_id = language_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$value,
      l$language_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$get_offer_by_id$service_provider_offer_by_pk$name$translations) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (l$value != lOther$value) {
      return false;
    }
    final l$language_id = language_id;
    final lOther$language_id = other.language_id;
    if (l$language_id != lOther$language_id) {
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

extension UtilityExtension$Query$get_offer_by_id$service_provider_offer_by_pk$name$translations
    on Query$get_offer_by_id$service_provider_offer_by_pk$name$translations {
  CopyWith$Query$get_offer_by_id$service_provider_offer_by_pk$name$translations<
          Query$get_offer_by_id$service_provider_offer_by_pk$name$translations>
      get copyWith =>
          CopyWith$Query$get_offer_by_id$service_provider_offer_by_pk$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_offer_by_id$service_provider_offer_by_pk$name$translations<
    TRes> {
  factory CopyWith$Query$get_offer_by_id$service_provider_offer_by_pk$name$translations(
    Query$get_offer_by_id$service_provider_offer_by_pk$name$translations
        instance,
    TRes Function(
            Query$get_offer_by_id$service_provider_offer_by_pk$name$translations)
        then,
  ) = _CopyWithImpl$Query$get_offer_by_id$service_provider_offer_by_pk$name$translations;

  factory CopyWith$Query$get_offer_by_id$service_provider_offer_by_pk$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_offer_by_id$service_provider_offer_by_pk$name$translations;

  TRes call({
    String? value,
    String? language_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_offer_by_id$service_provider_offer_by_pk$name$translations<
        TRes>
    implements
        CopyWith$Query$get_offer_by_id$service_provider_offer_by_pk$name$translations<
            TRes> {
  _CopyWithImpl$Query$get_offer_by_id$service_provider_offer_by_pk$name$translations(
    this._instance,
    this._then,
  );

  final Query$get_offer_by_id$service_provider_offer_by_pk$name$translations
      _instance;

  final TRes Function(
          Query$get_offer_by_id$service_provider_offer_by_pk$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? value = _undefined,
    Object? language_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_offer_by_id$service_provider_offer_by_pk$name$translations(
        value: value == _undefined || value == null
            ? _instance.value
            : (value as String),
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_offer_by_id$service_provider_offer_by_pk$name$translations<
        TRes>
    implements
        CopyWith$Query$get_offer_by_id$service_provider_offer_by_pk$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$get_offer_by_id$service_provider_offer_by_pk$name$translations(
      this._res);

  TRes _res;

  call({
    String? value,
    String? language_id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$update_offer {
  factory Variables$Mutation$update_offer({
    required int id,
    required int service_provider_id,
    Input$service_provider_offer_set_input? offer,
  }) =>
      Variables$Mutation$update_offer._({
        r'id': id,
        r'service_provider_id': service_provider_id,
        if (offer != null) r'offer': offer,
      });

  Variables$Mutation$update_offer._(this._$data);

  factory Variables$Mutation$update_offer.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    final l$service_provider_id = data['service_provider_id'];
    result$data['service_provider_id'] = (l$service_provider_id as int);
    if (data.containsKey('offer')) {
      final l$offer = data['offer'];
      result$data['offer'] = l$offer == null
          ? null
          : Input$service_provider_offer_set_input.fromJson(
              (l$offer as Map<String, dynamic>));
    }
    return Variables$Mutation$update_offer._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  int get service_provider_id => (_$data['service_provider_id'] as int);
  Input$service_provider_offer_set_input? get offer =>
      (_$data['offer'] as Input$service_provider_offer_set_input?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$service_provider_id = service_provider_id;
    result$data['service_provider_id'] = l$service_provider_id;
    if (_$data.containsKey('offer')) {
      final l$offer = offer;
      result$data['offer'] = l$offer?.toJson();
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$update_offer<Variables$Mutation$update_offer>
      get copyWith => CopyWith$Variables$Mutation$update_offer(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$update_offer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$service_provider_id = service_provider_id;
    final lOther$service_provider_id = other.service_provider_id;
    if (l$service_provider_id != lOther$service_provider_id) {
      return false;
    }
    final l$offer = offer;
    final lOther$offer = other.offer;
    if (_$data.containsKey('offer') != other._$data.containsKey('offer')) {
      return false;
    }
    if (l$offer != lOther$offer) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$service_provider_id = service_provider_id;
    final l$offer = offer;
    return Object.hashAll([
      l$id,
      l$service_provider_id,
      _$data.containsKey('offer') ? l$offer : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$update_offer<TRes> {
  factory CopyWith$Variables$Mutation$update_offer(
    Variables$Mutation$update_offer instance,
    TRes Function(Variables$Mutation$update_offer) then,
  ) = _CopyWithImpl$Variables$Mutation$update_offer;

  factory CopyWith$Variables$Mutation$update_offer.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$update_offer;

  TRes call({
    int? id,
    int? service_provider_id,
    Input$service_provider_offer_set_input? offer,
  });
}

class _CopyWithImpl$Variables$Mutation$update_offer<TRes>
    implements CopyWith$Variables$Mutation$update_offer<TRes> {
  _CopyWithImpl$Variables$Mutation$update_offer(
    this._instance,
    this._then,
  );

  final Variables$Mutation$update_offer _instance;

  final TRes Function(Variables$Mutation$update_offer) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? service_provider_id = _undefined,
    Object? offer = _undefined,
  }) =>
      _then(Variables$Mutation$update_offer._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
        if (service_provider_id != _undefined && service_provider_id != null)
          'service_provider_id': (service_provider_id as int),
        if (offer != _undefined)
          'offer': (offer as Input$service_provider_offer_set_input?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$update_offer<TRes>
    implements CopyWith$Variables$Mutation$update_offer<TRes> {
  _CopyWithStubImpl$Variables$Mutation$update_offer(this._res);

  TRes _res;

  call({
    int? id,
    int? service_provider_id,
    Input$service_provider_offer_set_input? offer,
  }) =>
      _res;
}

class Mutation$update_offer {
  Mutation$update_offer({
    this.update_service_provider_offer,
    required this.$__typename,
  });

  factory Mutation$update_offer.fromJson(Map<String, dynamic> json) {
    final l$update_service_provider_offer =
        json['update_service_provider_offer'];
    final l$$__typename = json['__typename'];
    return Mutation$update_offer(
      update_service_provider_offer: l$update_service_provider_offer == null
          ? null
          : Mutation$update_offer$update_service_provider_offer.fromJson(
              (l$update_service_provider_offer as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$update_offer$update_service_provider_offer?
      update_service_provider_offer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_service_provider_offer = update_service_provider_offer;
    _resultData['update_service_provider_offer'] =
        l$update_service_provider_offer?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_service_provider_offer = update_service_provider_offer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_service_provider_offer,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$update_offer) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_service_provider_offer = update_service_provider_offer;
    final lOther$update_service_provider_offer =
        other.update_service_provider_offer;
    if (l$update_service_provider_offer !=
        lOther$update_service_provider_offer) {
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

extension UtilityExtension$Mutation$update_offer on Mutation$update_offer {
  CopyWith$Mutation$update_offer<Mutation$update_offer> get copyWith =>
      CopyWith$Mutation$update_offer(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$update_offer<TRes> {
  factory CopyWith$Mutation$update_offer(
    Mutation$update_offer instance,
    TRes Function(Mutation$update_offer) then,
  ) = _CopyWithImpl$Mutation$update_offer;

  factory CopyWith$Mutation$update_offer.stub(TRes res) =
      _CopyWithStubImpl$Mutation$update_offer;

  TRes call({
    Mutation$update_offer$update_service_provider_offer?
        update_service_provider_offer,
    String? $__typename,
  });
  CopyWith$Mutation$update_offer$update_service_provider_offer<TRes>
      get update_service_provider_offer;
}

class _CopyWithImpl$Mutation$update_offer<TRes>
    implements CopyWith$Mutation$update_offer<TRes> {
  _CopyWithImpl$Mutation$update_offer(
    this._instance,
    this._then,
  );

  final Mutation$update_offer _instance;

  final TRes Function(Mutation$update_offer) _then;

  static const _undefined = {};

  TRes call({
    Object? update_service_provider_offer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$update_offer(
        update_service_provider_offer:
            update_service_provider_offer == _undefined
                ? _instance.update_service_provider_offer
                : (update_service_provider_offer
                    as Mutation$update_offer$update_service_provider_offer?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$update_offer$update_service_provider_offer<TRes>
      get update_service_provider_offer {
    final local$update_service_provider_offer =
        _instance.update_service_provider_offer;
    return local$update_service_provider_offer == null
        ? CopyWith$Mutation$update_offer$update_service_provider_offer.stub(
            _then(_instance))
        : CopyWith$Mutation$update_offer$update_service_provider_offer(
            local$update_service_provider_offer,
            (e) => call(update_service_provider_offer: e));
  }
}

class _CopyWithStubImpl$Mutation$update_offer<TRes>
    implements CopyWith$Mutation$update_offer<TRes> {
  _CopyWithStubImpl$Mutation$update_offer(this._res);

  TRes _res;

  call({
    Mutation$update_offer$update_service_provider_offer?
        update_service_provider_offer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$update_offer$update_service_provider_offer<TRes>
      get update_service_provider_offer =>
          CopyWith$Mutation$update_offer$update_service_provider_offer.stub(
              _res);
}

const documentNodeMutationupdate_offer = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'update_offer'),
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
        variable: VariableNode(name: NameNode(value: 'service_provider_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'offer')),
        type: NamedTypeNode(
          name: NameNode(value: 'service_provider_offer_set_input'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'update_service_provider_offer'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'id')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'service_provider_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(
                        name: NameNode(value: 'service_provider_id')),
                  )
                ]),
              ),
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: '_set'),
            value: VariableNode(name: NameNode(value: 'offer')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'returning'),
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
Mutation$update_offer _parserFn$Mutation$update_offer(
        Map<String, dynamic> data) =>
    Mutation$update_offer.fromJson(data);
typedef OnMutationCompleted$Mutation$update_offer = FutureOr<void> Function(
  dynamic,
  Mutation$update_offer?,
);

class Options$Mutation$update_offer
    extends graphql.MutationOptions<Mutation$update_offer> {
  Options$Mutation$update_offer({
    String? operationName,
    required Variables$Mutation$update_offer variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$update_offer? onCompleted,
    graphql.OnMutationUpdate<Mutation$update_offer>? update,
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
                    data == null ? null : _parserFn$Mutation$update_offer(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdate_offer,
          parserFn: _parserFn$Mutation$update_offer,
        );

  final OnMutationCompleted$Mutation$update_offer? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$update_offer
    extends graphql.WatchQueryOptions<Mutation$update_offer> {
  WatchOptions$Mutation$update_offer({
    String? operationName,
    required Variables$Mutation$update_offer variables,
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
          document: documentNodeMutationupdate_offer,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$update_offer,
        );
}

extension ClientExtension$Mutation$update_offer on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$update_offer>> mutate$update_offer(
          Options$Mutation$update_offer options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$update_offer> watchMutation$update_offer(
          WatchOptions$Mutation$update_offer options) =>
      this.watchMutation(options);
}

class Mutation$update_offer$update_service_provider_offer {
  Mutation$update_offer$update_service_provider_offer({
    required this.returning,
    required this.$__typename,
  });

  factory Mutation$update_offer$update_service_provider_offer.fromJson(
      Map<String, dynamic> json) {
    final l$returning = json['returning'];
    final l$$__typename = json['__typename'];
    return Mutation$update_offer$update_service_provider_offer(
      returning: (l$returning as List<dynamic>)
          .map((e) =>
              Mutation$update_offer$update_service_provider_offer$returning
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Mutation$update_offer$update_service_provider_offer$returning>
      returning;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$returning = returning;
    _resultData['returning'] = l$returning.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$returning = returning;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$returning.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$update_offer$update_service_provider_offer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$returning = returning;
    final lOther$returning = other.returning;
    if (l$returning.length != lOther$returning.length) {
      return false;
    }
    for (int i = 0; i < l$returning.length; i++) {
      final l$returning$entry = l$returning[i];
      final lOther$returning$entry = lOther$returning[i];
      if (l$returning$entry != lOther$returning$entry) {
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

extension UtilityExtension$Mutation$update_offer$update_service_provider_offer
    on Mutation$update_offer$update_service_provider_offer {
  CopyWith$Mutation$update_offer$update_service_provider_offer<
          Mutation$update_offer$update_service_provider_offer>
      get copyWith =>
          CopyWith$Mutation$update_offer$update_service_provider_offer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$update_offer$update_service_provider_offer<
    TRes> {
  factory CopyWith$Mutation$update_offer$update_service_provider_offer(
    Mutation$update_offer$update_service_provider_offer instance,
    TRes Function(Mutation$update_offer$update_service_provider_offer) then,
  ) = _CopyWithImpl$Mutation$update_offer$update_service_provider_offer;

  factory CopyWith$Mutation$update_offer$update_service_provider_offer.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$update_offer$update_service_provider_offer;

  TRes call({
    List<Mutation$update_offer$update_service_provider_offer$returning>?
        returning,
    String? $__typename,
  });
  TRes returning(
      Iterable<Mutation$update_offer$update_service_provider_offer$returning> Function(
              Iterable<
                  CopyWith$Mutation$update_offer$update_service_provider_offer$returning<
                      Mutation$update_offer$update_service_provider_offer$returning>>)
          _fn);
}

class _CopyWithImpl$Mutation$update_offer$update_service_provider_offer<TRes>
    implements
        CopyWith$Mutation$update_offer$update_service_provider_offer<TRes> {
  _CopyWithImpl$Mutation$update_offer$update_service_provider_offer(
    this._instance,
    this._then,
  );

  final Mutation$update_offer$update_service_provider_offer _instance;

  final TRes Function(Mutation$update_offer$update_service_provider_offer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? returning = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$update_offer$update_service_provider_offer(
        returning: returning == _undefined || returning == null
            ? _instance.returning
            : (returning as List<
                Mutation$update_offer$update_service_provider_offer$returning>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes returning(
          Iterable<Mutation$update_offer$update_service_provider_offer$returning> Function(
                  Iterable<
                      CopyWith$Mutation$update_offer$update_service_provider_offer$returning<
                          Mutation$update_offer$update_service_provider_offer$returning>>)
              _fn) =>
      call(
          returning: _fn(_instance.returning.map((e) =>
              CopyWith$Mutation$update_offer$update_service_provider_offer$returning(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Mutation$update_offer$update_service_provider_offer<
        TRes>
    implements
        CopyWith$Mutation$update_offer$update_service_provider_offer<TRes> {
  _CopyWithStubImpl$Mutation$update_offer$update_service_provider_offer(
      this._res);

  TRes _res;

  call({
    List<Mutation$update_offer$update_service_provider_offer$returning>?
        returning,
    String? $__typename,
  }) =>
      _res;
  returning(_fn) => _res;
}

class Mutation$update_offer$update_service_provider_offer$returning {
  Mutation$update_offer$update_service_provider_offer$returning({
    required this.id,
    required this.$__typename,
  });

  factory Mutation$update_offer$update_service_provider_offer$returning.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$update_offer$update_service_provider_offer$returning(
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
            is Mutation$update_offer$update_service_provider_offer$returning) ||
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

extension UtilityExtension$Mutation$update_offer$update_service_provider_offer$returning
    on Mutation$update_offer$update_service_provider_offer$returning {
  CopyWith$Mutation$update_offer$update_service_provider_offer$returning<
          Mutation$update_offer$update_service_provider_offer$returning>
      get copyWith =>
          CopyWith$Mutation$update_offer$update_service_provider_offer$returning(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$update_offer$update_service_provider_offer$returning<
    TRes> {
  factory CopyWith$Mutation$update_offer$update_service_provider_offer$returning(
    Mutation$update_offer$update_service_provider_offer$returning instance,
    TRes Function(Mutation$update_offer$update_service_provider_offer$returning)
        then,
  ) = _CopyWithImpl$Mutation$update_offer$update_service_provider_offer$returning;

  factory CopyWith$Mutation$update_offer$update_service_provider_offer$returning.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$update_offer$update_service_provider_offer$returning;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$update_offer$update_service_provider_offer$returning<
        TRes>
    implements
        CopyWith$Mutation$update_offer$update_service_provider_offer$returning<
            TRes> {
  _CopyWithImpl$Mutation$update_offer$update_service_provider_offer$returning(
    this._instance,
    this._then,
  );

  final Mutation$update_offer$update_service_provider_offer$returning _instance;

  final TRes Function(
      Mutation$update_offer$update_service_provider_offer$returning) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$update_offer$update_service_provider_offer$returning(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$update_offer$update_service_provider_offer$returning<
        TRes>
    implements
        CopyWith$Mutation$update_offer$update_service_provider_offer$returning<
            TRes> {
  _CopyWithStubImpl$Mutation$update_offer$update_service_provider_offer$returning(
      this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$check_coupon {
  factory Variables$Query$check_coupon({
    String? coupon_code,
    int? service_provider_id,
    String? service_provider_type,
  }) =>
      Variables$Query$check_coupon._({
        if (coupon_code != null) r'coupon_code': coupon_code,
        if (service_provider_id != null)
          r'service_provider_id': service_provider_id,
        if (service_provider_type != null)
          r'service_provider_type': service_provider_type,
      });

  Variables$Query$check_coupon._(this._$data);

  factory Variables$Query$check_coupon.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('coupon_code')) {
      final l$coupon_code = data['coupon_code'];
      result$data['coupon_code'] = (l$coupon_code as String?);
    }
    if (data.containsKey('service_provider_id')) {
      final l$service_provider_id = data['service_provider_id'];
      result$data['service_provider_id'] = (l$service_provider_id as int?);
    }
    if (data.containsKey('service_provider_type')) {
      final l$service_provider_type = data['service_provider_type'];
      result$data['service_provider_type'] =
          (l$service_provider_type as String?);
    }
    return Variables$Query$check_coupon._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get coupon_code => (_$data['coupon_code'] as String?);
  int? get service_provider_id => (_$data['service_provider_id'] as int?);
  String? get service_provider_type =>
      (_$data['service_provider_type'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('coupon_code')) {
      final l$coupon_code = coupon_code;
      result$data['coupon_code'] = l$coupon_code;
    }
    if (_$data.containsKey('service_provider_id')) {
      final l$service_provider_id = service_provider_id;
      result$data['service_provider_id'] = l$service_provider_id;
    }
    if (_$data.containsKey('service_provider_type')) {
      final l$service_provider_type = service_provider_type;
      result$data['service_provider_type'] = l$service_provider_type;
    }
    return result$data;
  }

  CopyWith$Variables$Query$check_coupon<Variables$Query$check_coupon>
      get copyWith => CopyWith$Variables$Query$check_coupon(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$check_coupon) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$coupon_code = coupon_code;
    final lOther$coupon_code = other.coupon_code;
    if (_$data.containsKey('coupon_code') !=
        other._$data.containsKey('coupon_code')) {
      return false;
    }
    if (l$coupon_code != lOther$coupon_code) {
      return false;
    }
    final l$service_provider_id = service_provider_id;
    final lOther$service_provider_id = other.service_provider_id;
    if (_$data.containsKey('service_provider_id') !=
        other._$data.containsKey('service_provider_id')) {
      return false;
    }
    if (l$service_provider_id != lOther$service_provider_id) {
      return false;
    }
    final l$service_provider_type = service_provider_type;
    final lOther$service_provider_type = other.service_provider_type;
    if (_$data.containsKey('service_provider_type') !=
        other._$data.containsKey('service_provider_type')) {
      return false;
    }
    if (l$service_provider_type != lOther$service_provider_type) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$coupon_code = coupon_code;
    final l$service_provider_id = service_provider_id;
    final l$service_provider_type = service_provider_type;
    return Object.hashAll([
      _$data.containsKey('coupon_code') ? l$coupon_code : const {},
      _$data.containsKey('service_provider_id')
          ? l$service_provider_id
          : const {},
      _$data.containsKey('service_provider_type')
          ? l$service_provider_type
          : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$check_coupon<TRes> {
  factory CopyWith$Variables$Query$check_coupon(
    Variables$Query$check_coupon instance,
    TRes Function(Variables$Query$check_coupon) then,
  ) = _CopyWithImpl$Variables$Query$check_coupon;

  factory CopyWith$Variables$Query$check_coupon.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$check_coupon;

  TRes call({
    String? coupon_code,
    int? service_provider_id,
    String? service_provider_type,
  });
}

class _CopyWithImpl$Variables$Query$check_coupon<TRes>
    implements CopyWith$Variables$Query$check_coupon<TRes> {
  _CopyWithImpl$Variables$Query$check_coupon(
    this._instance,
    this._then,
  );

  final Variables$Query$check_coupon _instance;

  final TRes Function(Variables$Query$check_coupon) _then;

  static const _undefined = {};

  TRes call({
    Object? coupon_code = _undefined,
    Object? service_provider_id = _undefined,
    Object? service_provider_type = _undefined,
  }) =>
      _then(Variables$Query$check_coupon._({
        ..._instance._$data,
        if (coupon_code != _undefined) 'coupon_code': (coupon_code as String?),
        if (service_provider_id != _undefined)
          'service_provider_id': (service_provider_id as int?),
        if (service_provider_type != _undefined)
          'service_provider_type': (service_provider_type as String?),
      }));
}

class _CopyWithStubImpl$Variables$Query$check_coupon<TRes>
    implements CopyWith$Variables$Query$check_coupon<TRes> {
  _CopyWithStubImpl$Variables$Query$check_coupon(this._res);

  TRes _res;

  call({
    String? coupon_code,
    int? service_provider_id,
    String? service_provider_type,
  }) =>
      _res;
}

class Query$check_coupon {
  Query$check_coupon({
    required this.service_provider_offer,
    required this.$__typename,
  });

  factory Query$check_coupon.fromJson(Map<String, dynamic> json) {
    final l$service_provider_offer = json['service_provider_offer'];
    final l$$__typename = json['__typename'];
    return Query$check_coupon(
      service_provider_offer: (l$service_provider_offer as List<dynamic>)
          .map((e) => Query$check_coupon$service_provider_offer.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$check_coupon$service_provider_offer> service_provider_offer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$service_provider_offer = service_provider_offer;
    _resultData['service_provider_offer'] =
        l$service_provider_offer.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$service_provider_offer = service_provider_offer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$service_provider_offer.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$check_coupon) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$service_provider_offer = service_provider_offer;
    final lOther$service_provider_offer = other.service_provider_offer;
    if (l$service_provider_offer.length !=
        lOther$service_provider_offer.length) {
      return false;
    }
    for (int i = 0; i < l$service_provider_offer.length; i++) {
      final l$service_provider_offer$entry = l$service_provider_offer[i];
      final lOther$service_provider_offer$entry =
          lOther$service_provider_offer[i];
      if (l$service_provider_offer$entry !=
          lOther$service_provider_offer$entry) {
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

extension UtilityExtension$Query$check_coupon on Query$check_coupon {
  CopyWith$Query$check_coupon<Query$check_coupon> get copyWith =>
      CopyWith$Query$check_coupon(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$check_coupon<TRes> {
  factory CopyWith$Query$check_coupon(
    Query$check_coupon instance,
    TRes Function(Query$check_coupon) then,
  ) = _CopyWithImpl$Query$check_coupon;

  factory CopyWith$Query$check_coupon.stub(TRes res) =
      _CopyWithStubImpl$Query$check_coupon;

  TRes call({
    List<Query$check_coupon$service_provider_offer>? service_provider_offer,
    String? $__typename,
  });
  TRes service_provider_offer(
      Iterable<Query$check_coupon$service_provider_offer> Function(
              Iterable<
                  CopyWith$Query$check_coupon$service_provider_offer<
                      Query$check_coupon$service_provider_offer>>)
          _fn);
}

class _CopyWithImpl$Query$check_coupon<TRes>
    implements CopyWith$Query$check_coupon<TRes> {
  _CopyWithImpl$Query$check_coupon(
    this._instance,
    this._then,
  );

  final Query$check_coupon _instance;

  final TRes Function(Query$check_coupon) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_offer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$check_coupon(
        service_provider_offer: service_provider_offer == _undefined ||
                service_provider_offer == null
            ? _instance.service_provider_offer
            : (service_provider_offer
                as List<Query$check_coupon$service_provider_offer>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes service_provider_offer(
          Iterable<Query$check_coupon$service_provider_offer> Function(
                  Iterable<
                      CopyWith$Query$check_coupon$service_provider_offer<
                          Query$check_coupon$service_provider_offer>>)
              _fn) =>
      call(
          service_provider_offer: _fn(_instance.service_provider_offer
              .map((e) => CopyWith$Query$check_coupon$service_provider_offer(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$check_coupon<TRes>
    implements CopyWith$Query$check_coupon<TRes> {
  _CopyWithStubImpl$Query$check_coupon(this._res);

  TRes _res;

  call({
    List<Query$check_coupon$service_provider_offer>? service_provider_offer,
    String? $__typename,
  }) =>
      _res;
  service_provider_offer(_fn) => _res;
}

const documentNodeQuerycheck_coupon = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'check_coupon'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'coupon_code')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'service_provider_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'service_provider_type')),
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
        name: NameNode(value: 'service_provider_offer'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'coupon_code'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'coupon_code')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'service_provider_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(
                        name: NameNode(value: 'service_provider_id')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'service_provider_type'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(
                        name: NameNode(value: 'service_provider_type')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'status'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: StringValueNode(
                      value: 'active',
                      isBlock: false,
                    ),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'offer_type'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: StringValueNode(
                      value: 'coupon',
                      isBlock: false,
                    ),
                  )
                ]),
              ),
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
Query$check_coupon _parserFn$Query$check_coupon(Map<String, dynamic> data) =>
    Query$check_coupon.fromJson(data);

class Options$Query$check_coupon
    extends graphql.QueryOptions<Query$check_coupon> {
  Options$Query$check_coupon({
    String? operationName,
    Variables$Query$check_coupon? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
  }) : super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          pollInterval: pollInterval,
          context: context,
          document: documentNodeQuerycheck_coupon,
          parserFn: _parserFn$Query$check_coupon,
        );
}

class WatchOptions$Query$check_coupon
    extends graphql.WatchQueryOptions<Query$check_coupon> {
  WatchOptions$Query$check_coupon({
    String? operationName,
    Variables$Query$check_coupon? variables,
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
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeQuerycheck_coupon,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$check_coupon,
        );
}

class FetchMoreOptions$Query$check_coupon extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$check_coupon({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$check_coupon? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQuerycheck_coupon,
        );
}

extension ClientExtension$Query$check_coupon on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$check_coupon>> query$check_coupon(
          [Options$Query$check_coupon? options]) async =>
      await this.query(options ?? Options$Query$check_coupon());
  graphql.ObservableQuery<Query$check_coupon> watchQuery$check_coupon(
          [WatchOptions$Query$check_coupon? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$check_coupon());
  void writeQuery$check_coupon({
    required Query$check_coupon data,
    Variables$Query$check_coupon? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQuerycheck_coupon),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$check_coupon? readQuery$check_coupon({
    Variables$Query$check_coupon? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQuerycheck_coupon),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$check_coupon.fromJson(result);
  }
}

class Query$check_coupon$service_provider_offer {
  Query$check_coupon$service_provider_offer({
    required this.id,
    required this.details,
    required this.$__typename,
  });

  factory Query$check_coupon$service_provider_offer.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$check_coupon$service_provider_offer(
      id: (l$id as int),
      details: mapFromJson(l$details),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final dynamic details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$details = details;
    _resultData['details'] = mapToJson(l$details);
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
    if (!(other is Query$check_coupon$service_provider_offer) ||
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

extension UtilityExtension$Query$check_coupon$service_provider_offer
    on Query$check_coupon$service_provider_offer {
  CopyWith$Query$check_coupon$service_provider_offer<
          Query$check_coupon$service_provider_offer>
      get copyWith => CopyWith$Query$check_coupon$service_provider_offer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$check_coupon$service_provider_offer<TRes> {
  factory CopyWith$Query$check_coupon$service_provider_offer(
    Query$check_coupon$service_provider_offer instance,
    TRes Function(Query$check_coupon$service_provider_offer) then,
  ) = _CopyWithImpl$Query$check_coupon$service_provider_offer;

  factory CopyWith$Query$check_coupon$service_provider_offer.stub(TRes res) =
      _CopyWithStubImpl$Query$check_coupon$service_provider_offer;

  TRes call({
    int? id,
    dynamic? details,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$check_coupon$service_provider_offer<TRes>
    implements CopyWith$Query$check_coupon$service_provider_offer<TRes> {
  _CopyWithImpl$Query$check_coupon$service_provider_offer(
    this._instance,
    this._then,
  );

  final Query$check_coupon$service_provider_offer _instance;

  final TRes Function(Query$check_coupon$service_provider_offer) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$check_coupon$service_provider_offer(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        details: details == _undefined || details == null
            ? _instance.details
            : (details as dynamic),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$check_coupon$service_provider_offer<TRes>
    implements CopyWith$Query$check_coupon$service_provider_offer<TRes> {
  _CopyWithStubImpl$Query$check_coupon$service_provider_offer(this._res);

  TRes _res;

  call({
    int? id,
    dynamic? details,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$check_offer_applied {
  factory Variables$Query$check_offer_applied({
    int? offer_id,
    int? customer_id,
  }) =>
      Variables$Query$check_offer_applied._({
        if (offer_id != null) r'offer_id': offer_id,
        if (customer_id != null) r'customer_id': customer_id,
      });

  Variables$Query$check_offer_applied._(this._$data);

  factory Variables$Query$check_offer_applied.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('offer_id')) {
      final l$offer_id = data['offer_id'];
      result$data['offer_id'] = (l$offer_id as int?);
    }
    if (data.containsKey('customer_id')) {
      final l$customer_id = data['customer_id'];
      result$data['customer_id'] = (l$customer_id as int?);
    }
    return Variables$Query$check_offer_applied._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get offer_id => (_$data['offer_id'] as int?);
  int? get customer_id => (_$data['customer_id'] as int?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('offer_id')) {
      final l$offer_id = offer_id;
      result$data['offer_id'] = l$offer_id;
    }
    if (_$data.containsKey('customer_id')) {
      final l$customer_id = customer_id;
      result$data['customer_id'] = l$customer_id;
    }
    return result$data;
  }

  CopyWith$Variables$Query$check_offer_applied<
          Variables$Query$check_offer_applied>
      get copyWith => CopyWith$Variables$Query$check_offer_applied(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$check_offer_applied) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$offer_id = offer_id;
    final lOther$offer_id = other.offer_id;
    if (_$data.containsKey('offer_id') !=
        other._$data.containsKey('offer_id')) {
      return false;
    }
    if (l$offer_id != lOther$offer_id) {
      return false;
    }
    final l$customer_id = customer_id;
    final lOther$customer_id = other.customer_id;
    if (_$data.containsKey('customer_id') !=
        other._$data.containsKey('customer_id')) {
      return false;
    }
    if (l$customer_id != lOther$customer_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$offer_id = offer_id;
    final l$customer_id = customer_id;
    return Object.hashAll([
      _$data.containsKey('offer_id') ? l$offer_id : const {},
      _$data.containsKey('customer_id') ? l$customer_id : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$check_offer_applied<TRes> {
  factory CopyWith$Variables$Query$check_offer_applied(
    Variables$Query$check_offer_applied instance,
    TRes Function(Variables$Query$check_offer_applied) then,
  ) = _CopyWithImpl$Variables$Query$check_offer_applied;

  factory CopyWith$Variables$Query$check_offer_applied.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$check_offer_applied;

  TRes call({
    int? offer_id,
    int? customer_id,
  });
}

class _CopyWithImpl$Variables$Query$check_offer_applied<TRes>
    implements CopyWith$Variables$Query$check_offer_applied<TRes> {
  _CopyWithImpl$Variables$Query$check_offer_applied(
    this._instance,
    this._then,
  );

  final Variables$Query$check_offer_applied _instance;

  final TRes Function(Variables$Query$check_offer_applied) _then;

  static const _undefined = {};

  TRes call({
    Object? offer_id = _undefined,
    Object? customer_id = _undefined,
  }) =>
      _then(Variables$Query$check_offer_applied._({
        ..._instance._$data,
        if (offer_id != _undefined) 'offer_id': (offer_id as int?),
        if (customer_id != _undefined) 'customer_id': (customer_id as int?),
      }));
}

class _CopyWithStubImpl$Variables$Query$check_offer_applied<TRes>
    implements CopyWith$Variables$Query$check_offer_applied<TRes> {
  _CopyWithStubImpl$Variables$Query$check_offer_applied(this._res);

  TRes _res;

  call({
    int? offer_id,
    int? customer_id,
  }) =>
      _res;
}

class Query$check_offer_applied {
  Query$check_offer_applied({
    required this.service_provider_offer_applied,
    required this.$__typename,
  });

  factory Query$check_offer_applied.fromJson(Map<String, dynamic> json) {
    final l$service_provider_offer_applied =
        json['service_provider_offer_applied'];
    final l$$__typename = json['__typename'];
    return Query$check_offer_applied(
      service_provider_offer_applied: (l$service_provider_offer_applied
              as List<dynamic>)
          .map((e) =>
              Query$check_offer_applied$service_provider_offer_applied.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$check_offer_applied$service_provider_offer_applied>
      service_provider_offer_applied;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$service_provider_offer_applied = service_provider_offer_applied;
    _resultData['service_provider_offer_applied'] =
        l$service_provider_offer_applied.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$service_provider_offer_applied = service_provider_offer_applied;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$service_provider_offer_applied.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$check_offer_applied) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$service_provider_offer_applied = service_provider_offer_applied;
    final lOther$service_provider_offer_applied =
        other.service_provider_offer_applied;
    if (l$service_provider_offer_applied.length !=
        lOther$service_provider_offer_applied.length) {
      return false;
    }
    for (int i = 0; i < l$service_provider_offer_applied.length; i++) {
      final l$service_provider_offer_applied$entry =
          l$service_provider_offer_applied[i];
      final lOther$service_provider_offer_applied$entry =
          lOther$service_provider_offer_applied[i];
      if (l$service_provider_offer_applied$entry !=
          lOther$service_provider_offer_applied$entry) {
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

extension UtilityExtension$Query$check_offer_applied
    on Query$check_offer_applied {
  CopyWith$Query$check_offer_applied<Query$check_offer_applied> get copyWith =>
      CopyWith$Query$check_offer_applied(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$check_offer_applied<TRes> {
  factory CopyWith$Query$check_offer_applied(
    Query$check_offer_applied instance,
    TRes Function(Query$check_offer_applied) then,
  ) = _CopyWithImpl$Query$check_offer_applied;

  factory CopyWith$Query$check_offer_applied.stub(TRes res) =
      _CopyWithStubImpl$Query$check_offer_applied;

  TRes call({
    List<Query$check_offer_applied$service_provider_offer_applied>?
        service_provider_offer_applied,
    String? $__typename,
  });
  TRes service_provider_offer_applied(
      Iterable<Query$check_offer_applied$service_provider_offer_applied> Function(
              Iterable<
                  CopyWith$Query$check_offer_applied$service_provider_offer_applied<
                      Query$check_offer_applied$service_provider_offer_applied>>)
          _fn);
}

class _CopyWithImpl$Query$check_offer_applied<TRes>
    implements CopyWith$Query$check_offer_applied<TRes> {
  _CopyWithImpl$Query$check_offer_applied(
    this._instance,
    this._then,
  );

  final Query$check_offer_applied _instance;

  final TRes Function(Query$check_offer_applied) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_offer_applied = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$check_offer_applied(
        service_provider_offer_applied:
            service_provider_offer_applied == _undefined ||
                    service_provider_offer_applied == null
                ? _instance.service_provider_offer_applied
                : (service_provider_offer_applied as List<
                    Query$check_offer_applied$service_provider_offer_applied>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes service_provider_offer_applied(
          Iterable<Query$check_offer_applied$service_provider_offer_applied> Function(
                  Iterable<
                      CopyWith$Query$check_offer_applied$service_provider_offer_applied<
                          Query$check_offer_applied$service_provider_offer_applied>>)
              _fn) =>
      call(
          service_provider_offer_applied: _fn(
              _instance.service_provider_offer_applied.map((e) =>
                  CopyWith$Query$check_offer_applied$service_provider_offer_applied(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$check_offer_applied<TRes>
    implements CopyWith$Query$check_offer_applied<TRes> {
  _CopyWithStubImpl$Query$check_offer_applied(this._res);

  TRes _res;

  call({
    List<Query$check_offer_applied$service_provider_offer_applied>?
        service_provider_offer_applied,
    String? $__typename,
  }) =>
      _res;
  service_provider_offer_applied(_fn) => _res;
}

const documentNodeQuerycheck_offer_applied = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'check_offer_applied'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'offer_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'customer_id')),
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
        name: NameNode(value: 'service_provider_offer_applied'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'offer_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'offer_id')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'order_type'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: StringValueNode(
                      value: 'restaurant',
                      isBlock: false,
                    ),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'restaurant_order'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'customer_id'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                        name: NameNode(value: '_eq'),
                        value:
                            VariableNode(name: NameNode(value: 'customer_id')),
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
            name: NameNode(value: 'order_id'),
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
Query$check_offer_applied _parserFn$Query$check_offer_applied(
        Map<String, dynamic> data) =>
    Query$check_offer_applied.fromJson(data);

class Options$Query$check_offer_applied
    extends graphql.QueryOptions<Query$check_offer_applied> {
  Options$Query$check_offer_applied({
    String? operationName,
    Variables$Query$check_offer_applied? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
  }) : super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          pollInterval: pollInterval,
          context: context,
          document: documentNodeQuerycheck_offer_applied,
          parserFn: _parserFn$Query$check_offer_applied,
        );
}

class WatchOptions$Query$check_offer_applied
    extends graphql.WatchQueryOptions<Query$check_offer_applied> {
  WatchOptions$Query$check_offer_applied({
    String? operationName,
    Variables$Query$check_offer_applied? variables,
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
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeQuerycheck_offer_applied,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$check_offer_applied,
        );
}

class FetchMoreOptions$Query$check_offer_applied
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$check_offer_applied({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$check_offer_applied? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQuerycheck_offer_applied,
        );
}

extension ClientExtension$Query$check_offer_applied on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$check_offer_applied>>
      query$check_offer_applied(
              [Options$Query$check_offer_applied? options]) async =>
          await this.query(options ?? Options$Query$check_offer_applied());
  graphql.ObservableQuery<Query$check_offer_applied>
      watchQuery$check_offer_applied(
              [WatchOptions$Query$check_offer_applied? options]) =>
          this.watchQuery(options ?? WatchOptions$Query$check_offer_applied());
  void writeQuery$check_offer_applied({
    required Query$check_offer_applied data,
    Variables$Query$check_offer_applied? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerycheck_offer_applied),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$check_offer_applied? readQuery$check_offer_applied({
    Variables$Query$check_offer_applied? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerycheck_offer_applied),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$check_offer_applied.fromJson(result);
  }
}

class Query$check_offer_applied$service_provider_offer_applied {
  Query$check_offer_applied$service_provider_offer_applied({
    required this.order_id,
    required this.$__typename,
  });

  factory Query$check_offer_applied$service_provider_offer_applied.fromJson(
      Map<String, dynamic> json) {
    final l$order_id = json['order_id'];
    final l$$__typename = json['__typename'];
    return Query$check_offer_applied$service_provider_offer_applied(
      order_id: (l$order_id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int order_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$order_id = order_id;
    _resultData['order_id'] = l$order_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$order_id = order_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$order_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$check_offer_applied$service_provider_offer_applied) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$order_id = order_id;
    final lOther$order_id = other.order_id;
    if (l$order_id != lOther$order_id) {
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

extension UtilityExtension$Query$check_offer_applied$service_provider_offer_applied
    on Query$check_offer_applied$service_provider_offer_applied {
  CopyWith$Query$check_offer_applied$service_provider_offer_applied<
          Query$check_offer_applied$service_provider_offer_applied>
      get copyWith =>
          CopyWith$Query$check_offer_applied$service_provider_offer_applied(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$check_offer_applied$service_provider_offer_applied<
    TRes> {
  factory CopyWith$Query$check_offer_applied$service_provider_offer_applied(
    Query$check_offer_applied$service_provider_offer_applied instance,
    TRes Function(Query$check_offer_applied$service_provider_offer_applied)
        then,
  ) = _CopyWithImpl$Query$check_offer_applied$service_provider_offer_applied;

  factory CopyWith$Query$check_offer_applied$service_provider_offer_applied.stub(
          TRes res) =
      _CopyWithStubImpl$Query$check_offer_applied$service_provider_offer_applied;

  TRes call({
    int? order_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$check_offer_applied$service_provider_offer_applied<
        TRes>
    implements
        CopyWith$Query$check_offer_applied$service_provider_offer_applied<
            TRes> {
  _CopyWithImpl$Query$check_offer_applied$service_provider_offer_applied(
    this._instance,
    this._then,
  );

  final Query$check_offer_applied$service_provider_offer_applied _instance;

  final TRes Function(Query$check_offer_applied$service_provider_offer_applied)
      _then;

  static const _undefined = {};

  TRes call({
    Object? order_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$check_offer_applied$service_provider_offer_applied(
        order_id: order_id == _undefined || order_id == null
            ? _instance.order_id
            : (order_id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$check_offer_applied$service_provider_offer_applied<
        TRes>
    implements
        CopyWith$Query$check_offer_applied$service_provider_offer_applied<
            TRes> {
  _CopyWithStubImpl$Query$check_offer_applied$service_provider_offer_applied(
      this._res);

  TRes _res;

  call({
    int? order_id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$get_service_provider_offers {
  factory Variables$Query$get_service_provider_offers({
    int? service_provider_id,
    String? service_provider_type,
  }) =>
      Variables$Query$get_service_provider_offers._({
        if (service_provider_id != null)
          r'service_provider_id': service_provider_id,
        if (service_provider_type != null)
          r'service_provider_type': service_provider_type,
      });

  Variables$Query$get_service_provider_offers._(this._$data);

  factory Variables$Query$get_service_provider_offers.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('service_provider_id')) {
      final l$service_provider_id = data['service_provider_id'];
      result$data['service_provider_id'] = (l$service_provider_id as int?);
    }
    if (data.containsKey('service_provider_type')) {
      final l$service_provider_type = data['service_provider_type'];
      result$data['service_provider_type'] =
          (l$service_provider_type as String?);
    }
    return Variables$Query$get_service_provider_offers._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get service_provider_id => (_$data['service_provider_id'] as int?);
  String? get service_provider_type =>
      (_$data['service_provider_type'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('service_provider_id')) {
      final l$service_provider_id = service_provider_id;
      result$data['service_provider_id'] = l$service_provider_id;
    }
    if (_$data.containsKey('service_provider_type')) {
      final l$service_provider_type = service_provider_type;
      result$data['service_provider_type'] = l$service_provider_type;
    }
    return result$data;
  }

  CopyWith$Variables$Query$get_service_provider_offers<
          Variables$Query$get_service_provider_offers>
      get copyWith => CopyWith$Variables$Query$get_service_provider_offers(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_service_provider_offers) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$service_provider_id = service_provider_id;
    final lOther$service_provider_id = other.service_provider_id;
    if (_$data.containsKey('service_provider_id') !=
        other._$data.containsKey('service_provider_id')) {
      return false;
    }
    if (l$service_provider_id != lOther$service_provider_id) {
      return false;
    }
    final l$service_provider_type = service_provider_type;
    final lOther$service_provider_type = other.service_provider_type;
    if (_$data.containsKey('service_provider_type') !=
        other._$data.containsKey('service_provider_type')) {
      return false;
    }
    if (l$service_provider_type != lOther$service_provider_type) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$service_provider_id = service_provider_id;
    final l$service_provider_type = service_provider_type;
    return Object.hashAll([
      _$data.containsKey('service_provider_id')
          ? l$service_provider_id
          : const {},
      _$data.containsKey('service_provider_type')
          ? l$service_provider_type
          : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$get_service_provider_offers<TRes> {
  factory CopyWith$Variables$Query$get_service_provider_offers(
    Variables$Query$get_service_provider_offers instance,
    TRes Function(Variables$Query$get_service_provider_offers) then,
  ) = _CopyWithImpl$Variables$Query$get_service_provider_offers;

  factory CopyWith$Variables$Query$get_service_provider_offers.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$get_service_provider_offers;

  TRes call({
    int? service_provider_id,
    String? service_provider_type,
  });
}

class _CopyWithImpl$Variables$Query$get_service_provider_offers<TRes>
    implements CopyWith$Variables$Query$get_service_provider_offers<TRes> {
  _CopyWithImpl$Variables$Query$get_service_provider_offers(
    this._instance,
    this._then,
  );

  final Variables$Query$get_service_provider_offers _instance;

  final TRes Function(Variables$Query$get_service_provider_offers) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_id = _undefined,
    Object? service_provider_type = _undefined,
  }) =>
      _then(Variables$Query$get_service_provider_offers._({
        ..._instance._$data,
        if (service_provider_id != _undefined)
          'service_provider_id': (service_provider_id as int?),
        if (service_provider_type != _undefined)
          'service_provider_type': (service_provider_type as String?),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_service_provider_offers<TRes>
    implements CopyWith$Variables$Query$get_service_provider_offers<TRes> {
  _CopyWithStubImpl$Variables$Query$get_service_provider_offers(this._res);

  TRes _res;

  call({
    int? service_provider_id,
    String? service_provider_type,
  }) =>
      _res;
}

class Query$get_service_provider_offers {
  Query$get_service_provider_offers({
    required this.service_provider_offer,
    required this.$__typename,
  });

  factory Query$get_service_provider_offers.fromJson(
      Map<String, dynamic> json) {
    final l$service_provider_offer = json['service_provider_offer'];
    final l$$__typename = json['__typename'];
    return Query$get_service_provider_offers(
      service_provider_offer: (l$service_provider_offer as List<dynamic>)
          .map((e) =>
              Query$get_service_provider_offers$service_provider_offer.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$get_service_provider_offers$service_provider_offer>
      service_provider_offer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$service_provider_offer = service_provider_offer;
    _resultData['service_provider_offer'] =
        l$service_provider_offer.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$service_provider_offer = service_provider_offer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$service_provider_offer.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_service_provider_offers) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$service_provider_offer = service_provider_offer;
    final lOther$service_provider_offer = other.service_provider_offer;
    if (l$service_provider_offer.length !=
        lOther$service_provider_offer.length) {
      return false;
    }
    for (int i = 0; i < l$service_provider_offer.length; i++) {
      final l$service_provider_offer$entry = l$service_provider_offer[i];
      final lOther$service_provider_offer$entry =
          lOther$service_provider_offer[i];
      if (l$service_provider_offer$entry !=
          lOther$service_provider_offer$entry) {
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

extension UtilityExtension$Query$get_service_provider_offers
    on Query$get_service_provider_offers {
  CopyWith$Query$get_service_provider_offers<Query$get_service_provider_offers>
      get copyWith => CopyWith$Query$get_service_provider_offers(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_service_provider_offers<TRes> {
  factory CopyWith$Query$get_service_provider_offers(
    Query$get_service_provider_offers instance,
    TRes Function(Query$get_service_provider_offers) then,
  ) = _CopyWithImpl$Query$get_service_provider_offers;

  factory CopyWith$Query$get_service_provider_offers.stub(TRes res) =
      _CopyWithStubImpl$Query$get_service_provider_offers;

  TRes call({
    List<Query$get_service_provider_offers$service_provider_offer>?
        service_provider_offer,
    String? $__typename,
  });
  TRes service_provider_offer(
      Iterable<Query$get_service_provider_offers$service_provider_offer> Function(
              Iterable<
                  CopyWith$Query$get_service_provider_offers$service_provider_offer<
                      Query$get_service_provider_offers$service_provider_offer>>)
          _fn);
}

class _CopyWithImpl$Query$get_service_provider_offers<TRes>
    implements CopyWith$Query$get_service_provider_offers<TRes> {
  _CopyWithImpl$Query$get_service_provider_offers(
    this._instance,
    this._then,
  );

  final Query$get_service_provider_offers _instance;

  final TRes Function(Query$get_service_provider_offers) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_offer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_service_provider_offers(
        service_provider_offer: service_provider_offer == _undefined ||
                service_provider_offer == null
            ? _instance.service_provider_offer
            : (service_provider_offer as List<
                Query$get_service_provider_offers$service_provider_offer>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes service_provider_offer(
          Iterable<Query$get_service_provider_offers$service_provider_offer> Function(
                  Iterable<
                      CopyWith$Query$get_service_provider_offers$service_provider_offer<
                          Query$get_service_provider_offers$service_provider_offer>>)
              _fn) =>
      call(
          service_provider_offer: _fn(_instance.service_provider_offer.map((e) =>
              CopyWith$Query$get_service_provider_offers$service_provider_offer(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_service_provider_offers<TRes>
    implements CopyWith$Query$get_service_provider_offers<TRes> {
  _CopyWithStubImpl$Query$get_service_provider_offers(this._res);

  TRes _res;

  call({
    List<Query$get_service_provider_offers$service_provider_offer>?
        service_provider_offer,
    String? $__typename,
  }) =>
      _res;
  service_provider_offer(_fn) => _res;
}

const documentNodeQueryget_service_provider_offers = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_service_provider_offers'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'service_provider_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'service_provider_type')),
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
        name: NameNode(value: 'service_provider_offer'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'service_provider_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(
                        name: NameNode(value: 'service_provider_id')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'service_provider_type'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(
                        name: NameNode(value: 'service_provider_type')),
                  )
                ]),
              ),
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
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'coupon_code'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'offer_type'),
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
Query$get_service_provider_offers _parserFn$Query$get_service_provider_offers(
        Map<String, dynamic> data) =>
    Query$get_service_provider_offers.fromJson(data);

class Options$Query$get_service_provider_offers
    extends graphql.QueryOptions<Query$get_service_provider_offers> {
  Options$Query$get_service_provider_offers({
    String? operationName,
    Variables$Query$get_service_provider_offers? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
  }) : super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          pollInterval: pollInterval,
          context: context,
          document: documentNodeQueryget_service_provider_offers,
          parserFn: _parserFn$Query$get_service_provider_offers,
        );
}

class WatchOptions$Query$get_service_provider_offers
    extends graphql.WatchQueryOptions<Query$get_service_provider_offers> {
  WatchOptions$Query$get_service_provider_offers({
    String? operationName,
    Variables$Query$get_service_provider_offers? variables,
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
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeQueryget_service_provider_offers,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_service_provider_offers,
        );
}

class FetchMoreOptions$Query$get_service_provider_offers
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_service_provider_offers({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$get_service_provider_offers? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQueryget_service_provider_offers,
        );
}

extension ClientExtension$Query$get_service_provider_offers
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_service_provider_offers>>
      query$get_service_provider_offers(
              [Options$Query$get_service_provider_offers? options]) async =>
          await this
              .query(options ?? Options$Query$get_service_provider_offers());
  graphql.ObservableQuery<Query$get_service_provider_offers>
      watchQuery$get_service_provider_offers(
              [WatchOptions$Query$get_service_provider_offers? options]) =>
          this.watchQuery(
              options ?? WatchOptions$Query$get_service_provider_offers());
  void writeQuery$get_service_provider_offers({
    required Query$get_service_provider_offers data,
    Variables$Query$get_service_provider_offers? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryget_service_provider_offers),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_service_provider_offers? readQuery$get_service_provider_offers({
    Variables$Query$get_service_provider_offers? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryget_service_provider_offers),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$get_service_provider_offers.fromJson(result);
  }
}

class Query$get_service_provider_offers$service_provider_offer {
  Query$get_service_provider_offers$service_provider_offer({
    required this.id,
    required this.details,
    required this.name,
    required this.status,
    this.coupon_code,
    required this.offer_type,
    required this.$__typename,
  });

  factory Query$get_service_provider_offers$service_provider_offer.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$details = json['details'];
    final l$name = json['name'];
    final l$status = json['status'];
    final l$coupon_code = json['coupon_code'];
    final l$offer_type = json['offer_type'];
    final l$$__typename = json['__typename'];
    return Query$get_service_provider_offers$service_provider_offer(
      id: (l$id as int),
      details: mapFromJson(l$details),
      name: Query$get_service_provider_offers$service_provider_offer$name
          .fromJson((l$name as Map<String, dynamic>)),
      status: (l$status as String),
      coupon_code: (l$coupon_code as String?),
      offer_type: (l$offer_type as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final dynamic details;

  final Query$get_service_provider_offers$service_provider_offer$name name;

  final String status;

  final String? coupon_code;

  final String offer_type;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$details = details;
    _resultData['details'] = mapToJson(l$details);
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$status = status;
    _resultData['status'] = l$status;
    final l$coupon_code = coupon_code;
    _resultData['coupon_code'] = l$coupon_code;
    final l$offer_type = offer_type;
    _resultData['offer_type'] = l$offer_type;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$details = details;
    final l$name = name;
    final l$status = status;
    final l$coupon_code = coupon_code;
    final l$offer_type = offer_type;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$details,
      l$name,
      l$status,
      l$coupon_code,
      l$offer_type,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_service_provider_offers$service_provider_offer) ||
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
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$coupon_code = coupon_code;
    final lOther$coupon_code = other.coupon_code;
    if (l$coupon_code != lOther$coupon_code) {
      return false;
    }
    final l$offer_type = offer_type;
    final lOther$offer_type = other.offer_type;
    if (l$offer_type != lOther$offer_type) {
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

extension UtilityExtension$Query$get_service_provider_offers$service_provider_offer
    on Query$get_service_provider_offers$service_provider_offer {
  CopyWith$Query$get_service_provider_offers$service_provider_offer<
          Query$get_service_provider_offers$service_provider_offer>
      get copyWith =>
          CopyWith$Query$get_service_provider_offers$service_provider_offer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_service_provider_offers$service_provider_offer<
    TRes> {
  factory CopyWith$Query$get_service_provider_offers$service_provider_offer(
    Query$get_service_provider_offers$service_provider_offer instance,
    TRes Function(Query$get_service_provider_offers$service_provider_offer)
        then,
  ) = _CopyWithImpl$Query$get_service_provider_offers$service_provider_offer;

  factory CopyWith$Query$get_service_provider_offers$service_provider_offer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_service_provider_offers$service_provider_offer;

  TRes call({
    int? id,
    dynamic? details,
    Query$get_service_provider_offers$service_provider_offer$name? name,
    String? status,
    String? coupon_code,
    String? offer_type,
    String? $__typename,
  });
  CopyWith$Query$get_service_provider_offers$service_provider_offer$name<TRes>
      get name;
}

class _CopyWithImpl$Query$get_service_provider_offers$service_provider_offer<
        TRes>
    implements
        CopyWith$Query$get_service_provider_offers$service_provider_offer<
            TRes> {
  _CopyWithImpl$Query$get_service_provider_offers$service_provider_offer(
    this._instance,
    this._then,
  );

  final Query$get_service_provider_offers$service_provider_offer _instance;

  final TRes Function(Query$get_service_provider_offers$service_provider_offer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? details = _undefined,
    Object? name = _undefined,
    Object? status = _undefined,
    Object? coupon_code = _undefined,
    Object? offer_type = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_service_provider_offers$service_provider_offer(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        details: details == _undefined || details == null
            ? _instance.details
            : (details as dynamic),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Query$get_service_provider_offers$service_provider_offer$name),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        coupon_code: coupon_code == _undefined
            ? _instance.coupon_code
            : (coupon_code as String?),
        offer_type: offer_type == _undefined || offer_type == null
            ? _instance.offer_type
            : (offer_type as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_service_provider_offers$service_provider_offer$name<TRes>
      get name {
    final local$name = _instance.name;
    return CopyWith$Query$get_service_provider_offers$service_provider_offer$name(
        local$name, (e) => call(name: e));
  }
}

class _CopyWithStubImpl$Query$get_service_provider_offers$service_provider_offer<
        TRes>
    implements
        CopyWith$Query$get_service_provider_offers$service_provider_offer<
            TRes> {
  _CopyWithStubImpl$Query$get_service_provider_offers$service_provider_offer(
      this._res);

  TRes _res;

  call({
    int? id,
    dynamic? details,
    Query$get_service_provider_offers$service_provider_offer$name? name,
    String? status,
    String? coupon_code,
    String? offer_type,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_service_provider_offers$service_provider_offer$name<TRes>
      get name =>
          CopyWith$Query$get_service_provider_offers$service_provider_offer$name
              .stub(_res);
}

class Query$get_service_provider_offers$service_provider_offer$name {
  Query$get_service_provider_offers$service_provider_offer$name({
    required this.translations,
    required this.$__typename,
  });

  factory Query$get_service_provider_offers$service_provider_offer$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$get_service_provider_offers$service_provider_offer$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$get_service_provider_offers$service_provider_offer$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$get_service_provider_offers$service_provider_offer$name$translations>
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
            is Query$get_service_provider_offers$service_provider_offer$name) ||
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

extension UtilityExtension$Query$get_service_provider_offers$service_provider_offer$name
    on Query$get_service_provider_offers$service_provider_offer$name {
  CopyWith$Query$get_service_provider_offers$service_provider_offer$name<
          Query$get_service_provider_offers$service_provider_offer$name>
      get copyWith =>
          CopyWith$Query$get_service_provider_offers$service_provider_offer$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_service_provider_offers$service_provider_offer$name<
    TRes> {
  factory CopyWith$Query$get_service_provider_offers$service_provider_offer$name(
    Query$get_service_provider_offers$service_provider_offer$name instance,
    TRes Function(Query$get_service_provider_offers$service_provider_offer$name)
        then,
  ) = _CopyWithImpl$Query$get_service_provider_offers$service_provider_offer$name;

  factory CopyWith$Query$get_service_provider_offers$service_provider_offer$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_service_provider_offers$service_provider_offer$name;

  TRes call({
    List<Query$get_service_provider_offers$service_provider_offer$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$get_service_provider_offers$service_provider_offer$name$translations> Function(
              Iterable<
                  CopyWith$Query$get_service_provider_offers$service_provider_offer$name$translations<
                      Query$get_service_provider_offers$service_provider_offer$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$get_service_provider_offers$service_provider_offer$name<
        TRes>
    implements
        CopyWith$Query$get_service_provider_offers$service_provider_offer$name<
            TRes> {
  _CopyWithImpl$Query$get_service_provider_offers$service_provider_offer$name(
    this._instance,
    this._then,
  );

  final Query$get_service_provider_offers$service_provider_offer$name _instance;

  final TRes Function(
      Query$get_service_provider_offers$service_provider_offer$name) _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_service_provider_offers$service_provider_offer$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$get_service_provider_offers$service_provider_offer$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$get_service_provider_offers$service_provider_offer$name$translations> Function(
                  Iterable<
                      CopyWith$Query$get_service_provider_offers$service_provider_offer$name$translations<
                          Query$get_service_provider_offers$service_provider_offer$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$get_service_provider_offers$service_provider_offer$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_service_provider_offers$service_provider_offer$name<
        TRes>
    implements
        CopyWith$Query$get_service_provider_offers$service_provider_offer$name<
            TRes> {
  _CopyWithStubImpl$Query$get_service_provider_offers$service_provider_offer$name(
      this._res);

  TRes _res;

  call({
    List<Query$get_service_provider_offers$service_provider_offer$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$get_service_provider_offers$service_provider_offer$name$translations {
  Query$get_service_provider_offers$service_provider_offer$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$get_service_provider_offers$service_provider_offer$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$get_service_provider_offers$service_provider_offer$name$translations(
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
            is Query$get_service_provider_offers$service_provider_offer$name$translations) ||
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

extension UtilityExtension$Query$get_service_provider_offers$service_provider_offer$name$translations
    on Query$get_service_provider_offers$service_provider_offer$name$translations {
  CopyWith$Query$get_service_provider_offers$service_provider_offer$name$translations<
          Query$get_service_provider_offers$service_provider_offer$name$translations>
      get copyWith =>
          CopyWith$Query$get_service_provider_offers$service_provider_offer$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_service_provider_offers$service_provider_offer$name$translations<
    TRes> {
  factory CopyWith$Query$get_service_provider_offers$service_provider_offer$name$translations(
    Query$get_service_provider_offers$service_provider_offer$name$translations
        instance,
    TRes Function(
            Query$get_service_provider_offers$service_provider_offer$name$translations)
        then,
  ) = _CopyWithImpl$Query$get_service_provider_offers$service_provider_offer$name$translations;

  factory CopyWith$Query$get_service_provider_offers$service_provider_offer$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_service_provider_offers$service_provider_offer$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_service_provider_offers$service_provider_offer$name$translations<
        TRes>
    implements
        CopyWith$Query$get_service_provider_offers$service_provider_offer$name$translations<
            TRes> {
  _CopyWithImpl$Query$get_service_provider_offers$service_provider_offer$name$translations(
    this._instance,
    this._then,
  );

  final Query$get_service_provider_offers$service_provider_offer$name$translations
      _instance;

  final TRes Function(
          Query$get_service_provider_offers$service_provider_offer$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_service_provider_offers$service_provider_offer$name$translations(
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

class _CopyWithStubImpl$Query$get_service_provider_offers$service_provider_offer$name$translations<
        TRes>
    implements
        CopyWith$Query$get_service_provider_offers$service_provider_offer$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$get_service_provider_offers$service_provider_offer$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}
