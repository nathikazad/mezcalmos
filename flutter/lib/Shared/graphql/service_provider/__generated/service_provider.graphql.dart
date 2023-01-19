import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$getServiceProviderLinks {
  factory Variables$Query$getServiceProviderLinks(
          {required int serviceProviderId}) =>
      Variables$Query$getServiceProviderLinks._({
        r'serviceProviderId': serviceProviderId,
      });

  Variables$Query$getServiceProviderLinks._(this._$data);

  factory Variables$Query$getServiceProviderLinks.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$serviceProviderId = data['serviceProviderId'];
    result$data['serviceProviderId'] = (l$serviceProviderId as int);
    return Variables$Query$getServiceProviderLinks._(result$data);
  }

  Map<String, dynamic> _$data;

  int get serviceProviderId => (_$data['serviceProviderId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$serviceProviderId = serviceProviderId;
    result$data['serviceProviderId'] = l$serviceProviderId;
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
    final l$serviceProviderId = serviceProviderId;
    final lOther$serviceProviderId = other.serviceProviderId;
    if (l$serviceProviderId != lOther$serviceProviderId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$serviceProviderId = serviceProviderId;
    return Object.hashAll([l$serviceProviderId]);
  }
}

abstract class CopyWith$Variables$Query$getServiceProviderLinks<TRes> {
  factory CopyWith$Variables$Query$getServiceProviderLinks(
    Variables$Query$getServiceProviderLinks instance,
    TRes Function(Variables$Query$getServiceProviderLinks) then,
  ) = _CopyWithImpl$Variables$Query$getServiceProviderLinks;

  factory CopyWith$Variables$Query$getServiceProviderLinks.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getServiceProviderLinks;

  TRes call({int? serviceProviderId});
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

  TRes call({Object? serviceProviderId = _undefined}) =>
      _then(Variables$Query$getServiceProviderLinks._({
        ..._instance._$data,
        if (serviceProviderId != _undefined && serviceProviderId != null)
          'serviceProviderId': (serviceProviderId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getServiceProviderLinks<TRes>
    implements CopyWith$Variables$Query$getServiceProviderLinks<TRes> {
  _CopyWithStubImpl$Variables$Query$getServiceProviderLinks(this._res);

  TRes _res;

  call({int? serviceProviderId}) => _res;
}

class Query$getServiceProviderLinks {
  Query$getServiceProviderLinks({
    required this.service_provider_service_link,
    required this.$__typename,
  });

  factory Query$getServiceProviderLinks.fromJson(Map<String, dynamic> json) {
    final l$service_provider_service_link =
        json['service_provider_service_link'];
    final l$$__typename = json['__typename'];
    return Query$getServiceProviderLinks(
      service_provider_service_link:
          (l$service_provider_service_link as List<dynamic>)
              .map((e) =>
                  Query$getServiceProviderLinks$service_provider_service_link
                      .fromJson((e as Map<String, dynamic>)))
              .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getServiceProviderLinks$service_provider_service_link>
      service_provider_service_link;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$service_provider_service_link = service_provider_service_link;
    _resultData['service_provider_service_link'] =
        l$service_provider_service_link.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$service_provider_service_link = service_provider_service_link;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$service_provider_service_link.map((v) => v)),
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
    final l$service_provider_service_link = service_provider_service_link;
    final lOther$service_provider_service_link =
        other.service_provider_service_link;
    if (l$service_provider_service_link.length !=
        lOther$service_provider_service_link.length) {
      return false;
    }
    for (int i = 0; i < l$service_provider_service_link.length; i++) {
      final l$service_provider_service_link$entry =
          l$service_provider_service_link[i];
      final lOther$service_provider_service_link$entry =
          lOther$service_provider_service_link[i];
      if (l$service_provider_service_link$entry !=
          lOther$service_provider_service_link$entry) {
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
    List<Query$getServiceProviderLinks$service_provider_service_link>?
        service_provider_service_link,
    String? $__typename,
  });
  TRes service_provider_service_link(
      Iterable<Query$getServiceProviderLinks$service_provider_service_link> Function(
              Iterable<
                  CopyWith$Query$getServiceProviderLinks$service_provider_service_link<
                      Query$getServiceProviderLinks$service_provider_service_link>>)
          _fn);
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
    Object? service_provider_service_link = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getServiceProviderLinks(
        service_provider_service_link: service_provider_service_link ==
                    _undefined ||
                service_provider_service_link == null
            ? _instance.service_provider_service_link
            : (service_provider_service_link as List<
                Query$getServiceProviderLinks$service_provider_service_link>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes service_provider_service_link(
          Iterable<Query$getServiceProviderLinks$service_provider_service_link> Function(
                  Iterable<
                      CopyWith$Query$getServiceProviderLinks$service_provider_service_link<
                          Query$getServiceProviderLinks$service_provider_service_link>>)
              _fn) =>
      call(
          service_provider_service_link: _fn(
              _instance.service_provider_service_link.map((e) =>
                  CopyWith$Query$getServiceProviderLinks$service_provider_service_link(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getServiceProviderLinks<TRes>
    implements CopyWith$Query$getServiceProviderLinks<TRes> {
  _CopyWithStubImpl$Query$getServiceProviderLinks(this._res);

  TRes _res;

  call({
    List<Query$getServiceProviderLinks$service_provider_service_link>?
        service_provider_service_link,
    String? $__typename,
  }) =>
      _res;
  service_provider_service_link(_fn) => _res;
}

const documentNodeQuerygetServiceProviderLinks = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getServiceProviderLinks'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'serviceProviderId')),
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
        name: NameNode(value: 'service_provider_service_link'),
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
                        name: NameNode(value: 'serviceProviderId')),
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
            name: NameNode(value: 'service_provider_id'),
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

class Query$getServiceProviderLinks$service_provider_service_link {
  Query$getServiceProviderLinks$service_provider_service_link({
    required this.id,
    this.driver_deep_link,
    this.driver_qr_image_link,
    this.operator_deep_link,
    this.operator_qr_image_link,
    required this.service_provider_id,
    required this.service_provider_type,
    required this.$__typename,
  });

  factory Query$getServiceProviderLinks$service_provider_service_link.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$driver_deep_link = json['driver_deep_link'];
    final l$driver_qr_image_link = json['driver_qr_image_link'];
    final l$operator_deep_link = json['operator_deep_link'];
    final l$operator_qr_image_link = json['operator_qr_image_link'];
    final l$service_provider_id = json['service_provider_id'];
    final l$service_provider_type = json['service_provider_type'];
    final l$$__typename = json['__typename'];
    return Query$getServiceProviderLinks$service_provider_service_link(
      id: (l$id as int),
      driver_deep_link: (l$driver_deep_link as String?),
      driver_qr_image_link: (l$driver_qr_image_link as String?),
      operator_deep_link: (l$operator_deep_link as String?),
      operator_qr_image_link: (l$operator_qr_image_link as String?),
      service_provider_id: (l$service_provider_id as int),
      service_provider_type: (l$service_provider_type as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? driver_deep_link;

  final String? driver_qr_image_link;

  final String? operator_deep_link;

  final String? operator_qr_image_link;

  final int service_provider_id;

  final String service_provider_type;

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
    final l$service_provider_id = service_provider_id;
    _resultData['service_provider_id'] = l$service_provider_id;
    final l$service_provider_type = service_provider_type;
    _resultData['service_provider_type'] = l$service_provider_type;
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
    final l$service_provider_id = service_provider_id;
    final l$service_provider_type = service_provider_type;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$driver_deep_link,
      l$driver_qr_image_link,
      l$operator_deep_link,
      l$operator_qr_image_link,
      l$service_provider_id,
      l$service_provider_type,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getServiceProviderLinks$service_provider_service_link) ||
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
    final l$service_provider_id = service_provider_id;
    final lOther$service_provider_id = other.service_provider_id;
    if (l$service_provider_id != lOther$service_provider_id) {
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

extension UtilityExtension$Query$getServiceProviderLinks$service_provider_service_link
    on Query$getServiceProviderLinks$service_provider_service_link {
  CopyWith$Query$getServiceProviderLinks$service_provider_service_link<
          Query$getServiceProviderLinks$service_provider_service_link>
      get copyWith =>
          CopyWith$Query$getServiceProviderLinks$service_provider_service_link(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getServiceProviderLinks$service_provider_service_link<
    TRes> {
  factory CopyWith$Query$getServiceProviderLinks$service_provider_service_link(
    Query$getServiceProviderLinks$service_provider_service_link instance,
    TRes Function(Query$getServiceProviderLinks$service_provider_service_link)
        then,
  ) = _CopyWithImpl$Query$getServiceProviderLinks$service_provider_service_link;

  factory CopyWith$Query$getServiceProviderLinks$service_provider_service_link.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getServiceProviderLinks$service_provider_service_link;

  TRes call({
    int? id,
    String? driver_deep_link,
    String? driver_qr_image_link,
    String? operator_deep_link,
    String? operator_qr_image_link,
    int? service_provider_id,
    String? service_provider_type,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getServiceProviderLinks$service_provider_service_link<
        TRes>
    implements
        CopyWith$Query$getServiceProviderLinks$service_provider_service_link<
            TRes> {
  _CopyWithImpl$Query$getServiceProviderLinks$service_provider_service_link(
    this._instance,
    this._then,
  );

  final Query$getServiceProviderLinks$service_provider_service_link _instance;

  final TRes Function(
      Query$getServiceProviderLinks$service_provider_service_link) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? driver_deep_link = _undefined,
    Object? driver_qr_image_link = _undefined,
    Object? operator_deep_link = _undefined,
    Object? operator_qr_image_link = _undefined,
    Object? service_provider_id = _undefined,
    Object? service_provider_type = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getServiceProviderLinks$service_provider_service_link(
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
        service_provider_id:
            service_provider_id == _undefined || service_provider_id == null
                ? _instance.service_provider_id
                : (service_provider_id as int),
        service_provider_type:
            service_provider_type == _undefined || service_provider_type == null
                ? _instance.service_provider_type
                : (service_provider_type as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getServiceProviderLinks$service_provider_service_link<
        TRes>
    implements
        CopyWith$Query$getServiceProviderLinks$service_provider_service_link<
            TRes> {
  _CopyWithStubImpl$Query$getServiceProviderLinks$service_provider_service_link(
      this._res);

  TRes _res;

  call({
    int? id,
    String? driver_deep_link,
    String? driver_qr_image_link,
    String? operator_deep_link,
    String? operator_qr_image_link,
    int? service_provider_id,
    String? service_provider_type,
    String? $__typename,
  }) =>
      _res;
}
