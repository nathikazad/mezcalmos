import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$getDeliveryPartner {
  factory Variables$Query$getDeliveryPartner({
    required int serviceId,
    String? serviceType,
  }) =>
      Variables$Query$getDeliveryPartner._({
        r'serviceId': serviceId,
        if (serviceType != null) r'serviceType': serviceType,
      });

  Variables$Query$getDeliveryPartner._(this._$data);

  factory Variables$Query$getDeliveryPartner.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$serviceId = data['serviceId'];
    result$data['serviceId'] = (l$serviceId as int);
    if (data.containsKey('serviceType')) {
      final l$serviceType = data['serviceType'];
      result$data['serviceType'] = (l$serviceType as String?);
    }
    return Variables$Query$getDeliveryPartner._(result$data);
  }

  Map<String, dynamic> _$data;

  int get serviceId => (_$data['serviceId'] as int);
  String? get serviceType => (_$data['serviceType'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$serviceId = serviceId;
    result$data['serviceId'] = l$serviceId;
    if (_$data.containsKey('serviceType')) {
      final l$serviceType = serviceType;
      result$data['serviceType'] = l$serviceType;
    }
    return result$data;
  }

  CopyWith$Variables$Query$getDeliveryPartner<
          Variables$Query$getDeliveryPartner>
      get copyWith => CopyWith$Variables$Query$getDeliveryPartner(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getDeliveryPartner) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$serviceId = serviceId;
    final lOther$serviceId = other.serviceId;
    if (l$serviceId != lOther$serviceId) {
      return false;
    }
    final l$serviceType = serviceType;
    final lOther$serviceType = other.serviceType;
    if (_$data.containsKey('serviceType') !=
        other._$data.containsKey('serviceType')) {
      return false;
    }
    if (l$serviceType != lOther$serviceType) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$serviceId = serviceId;
    final l$serviceType = serviceType;
    return Object.hashAll([
      l$serviceId,
      _$data.containsKey('serviceType') ? l$serviceType : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$getDeliveryPartner<TRes> {
  factory CopyWith$Variables$Query$getDeliveryPartner(
    Variables$Query$getDeliveryPartner instance,
    TRes Function(Variables$Query$getDeliveryPartner) then,
  ) = _CopyWithImpl$Variables$Query$getDeliveryPartner;

  factory CopyWith$Variables$Query$getDeliveryPartner.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getDeliveryPartner;

  TRes call({
    int? serviceId,
    String? serviceType,
  });
}

class _CopyWithImpl$Variables$Query$getDeliveryPartner<TRes>
    implements CopyWith$Variables$Query$getDeliveryPartner<TRes> {
  _CopyWithImpl$Variables$Query$getDeliveryPartner(
    this._instance,
    this._then,
  );

  final Variables$Query$getDeliveryPartner _instance;

  final TRes Function(Variables$Query$getDeliveryPartner) _then;

  static const _undefined = {};

  TRes call({
    Object? serviceId = _undefined,
    Object? serviceType = _undefined,
  }) =>
      _then(Variables$Query$getDeliveryPartner._({
        ..._instance._$data,
        if (serviceId != _undefined && serviceId != null)
          'serviceId': (serviceId as int),
        if (serviceType != _undefined) 'serviceType': (serviceType as String?),
      }));
}

class _CopyWithStubImpl$Variables$Query$getDeliveryPartner<TRes>
    implements CopyWith$Variables$Query$getDeliveryPartner<TRes> {
  _CopyWithStubImpl$Variables$Query$getDeliveryPartner(this._res);

  TRes _res;

  call({
    int? serviceId,
    String? serviceType,
  }) =>
      _res;
}

class Query$getDeliveryPartner {
  Query$getDeliveryPartner({
    required this.service_provider_delivery_partner,
    required this.$__typename,
  });

  factory Query$getDeliveryPartner.fromJson(Map<String, dynamic> json) {
    final l$service_provider_delivery_partner =
        json['service_provider_delivery_partner'];
    final l$$__typename = json['__typename'];
    return Query$getDeliveryPartner(
      service_provider_delivery_partner: (l$service_provider_delivery_partner
              as List<dynamic>)
          .map((e) => Query$getDeliveryPartner$service_provider_delivery_partner
              .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getDeliveryPartner$service_provider_delivery_partner>
      service_provider_delivery_partner;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$service_provider_delivery_partner =
        service_provider_delivery_partner;
    _resultData['service_provider_delivery_partner'] =
        l$service_provider_delivery_partner.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$service_provider_delivery_partner =
        service_provider_delivery_partner;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$service_provider_delivery_partner.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getDeliveryPartner) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$service_provider_delivery_partner =
        service_provider_delivery_partner;
    final lOther$service_provider_delivery_partner =
        other.service_provider_delivery_partner;
    if (l$service_provider_delivery_partner.length !=
        lOther$service_provider_delivery_partner.length) {
      return false;
    }
    for (int i = 0; i < l$service_provider_delivery_partner.length; i++) {
      final l$service_provider_delivery_partner$entry =
          l$service_provider_delivery_partner[i];
      final lOther$service_provider_delivery_partner$entry =
          lOther$service_provider_delivery_partner[i];
      if (l$service_provider_delivery_partner$entry !=
          lOther$service_provider_delivery_partner$entry) {
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

extension UtilityExtension$Query$getDeliveryPartner
    on Query$getDeliveryPartner {
  CopyWith$Query$getDeliveryPartner<Query$getDeliveryPartner> get copyWith =>
      CopyWith$Query$getDeliveryPartner(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getDeliveryPartner<TRes> {
  factory CopyWith$Query$getDeliveryPartner(
    Query$getDeliveryPartner instance,
    TRes Function(Query$getDeliveryPartner) then,
  ) = _CopyWithImpl$Query$getDeliveryPartner;

  factory CopyWith$Query$getDeliveryPartner.stub(TRes res) =
      _CopyWithStubImpl$Query$getDeliveryPartner;

  TRes call({
    List<Query$getDeliveryPartner$service_provider_delivery_partner>?
        service_provider_delivery_partner,
    String? $__typename,
  });
  TRes service_provider_delivery_partner(
      Iterable<Query$getDeliveryPartner$service_provider_delivery_partner> Function(
              Iterable<
                  CopyWith$Query$getDeliveryPartner$service_provider_delivery_partner<
                      Query$getDeliveryPartner$service_provider_delivery_partner>>)
          _fn);
}

class _CopyWithImpl$Query$getDeliveryPartner<TRes>
    implements CopyWith$Query$getDeliveryPartner<TRes> {
  _CopyWithImpl$Query$getDeliveryPartner(
    this._instance,
    this._then,
  );

  final Query$getDeliveryPartner _instance;

  final TRes Function(Query$getDeliveryPartner) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_delivery_partner = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getDeliveryPartner(
        service_provider_delivery_partner: service_provider_delivery_partner ==
                    _undefined ||
                service_provider_delivery_partner == null
            ? _instance.service_provider_delivery_partner
            : (service_provider_delivery_partner as List<
                Query$getDeliveryPartner$service_provider_delivery_partner>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes service_provider_delivery_partner(
          Iterable<Query$getDeliveryPartner$service_provider_delivery_partner> Function(
                  Iterable<
                      CopyWith$Query$getDeliveryPartner$service_provider_delivery_partner<
                          Query$getDeliveryPartner$service_provider_delivery_partner>>)
              _fn) =>
      call(
          service_provider_delivery_partner: _fn(
              _instance.service_provider_delivery_partner.map((e) =>
                  CopyWith$Query$getDeliveryPartner$service_provider_delivery_partner(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getDeliveryPartner<TRes>
    implements CopyWith$Query$getDeliveryPartner<TRes> {
  _CopyWithStubImpl$Query$getDeliveryPartner(this._res);

  TRes _res;

  call({
    List<Query$getDeliveryPartner$service_provider_delivery_partner>?
        service_provider_delivery_partner,
    String? $__typename,
  }) =>
      _res;
  service_provider_delivery_partner(_fn) => _res;
}

const documentNodeQuerygetDeliveryPartner = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getDeliveryPartner'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'serviceId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'serviceType')),
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
        name: NameNode(value: 'service_provider_delivery_partner'),
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
                    value: VariableNode(name: NameNode(value: 'serviceId')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'service_provider_type'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'serviceType')),
                  )
                ]),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'delivery_company_id'),
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
Query$getDeliveryPartner _parserFn$Query$getDeliveryPartner(
        Map<String, dynamic> data) =>
    Query$getDeliveryPartner.fromJson(data);

class Options$Query$getDeliveryPartner
    extends graphql.QueryOptions<Query$getDeliveryPartner> {
  Options$Query$getDeliveryPartner({
    String? operationName,
    required Variables$Query$getDeliveryPartner variables,
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
          document: documentNodeQuerygetDeliveryPartner,
          parserFn: _parserFn$Query$getDeliveryPartner,
        );
}

class WatchOptions$Query$getDeliveryPartner
    extends graphql.WatchQueryOptions<Query$getDeliveryPartner> {
  WatchOptions$Query$getDeliveryPartner({
    String? operationName,
    required Variables$Query$getDeliveryPartner variables,
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
          document: documentNodeQuerygetDeliveryPartner,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getDeliveryPartner,
        );
}

class FetchMoreOptions$Query$getDeliveryPartner
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getDeliveryPartner({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getDeliveryPartner variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetDeliveryPartner,
        );
}

extension ClientExtension$Query$getDeliveryPartner on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getDeliveryPartner>>
      query$getDeliveryPartner(
              Options$Query$getDeliveryPartner options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getDeliveryPartner>
      watchQuery$getDeliveryPartner(
              WatchOptions$Query$getDeliveryPartner options) =>
          this.watchQuery(options);
  void writeQuery$getDeliveryPartner({
    required Query$getDeliveryPartner data,
    required Variables$Query$getDeliveryPartner variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerygetDeliveryPartner),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getDeliveryPartner? readQuery$getDeliveryPartner({
    required Variables$Query$getDeliveryPartner variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetDeliveryPartner),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getDeliveryPartner.fromJson(result);
  }
}

class Query$getDeliveryPartner$service_provider_delivery_partner {
  Query$getDeliveryPartner$service_provider_delivery_partner({
    required this.delivery_company_id,
    required this.id,
    required this.service_provider_id,
    required this.service_provider_type,
    required this.$__typename,
  });

  factory Query$getDeliveryPartner$service_provider_delivery_partner.fromJson(
      Map<String, dynamic> json) {
    final l$delivery_company_id = json['delivery_company_id'];
    final l$id = json['id'];
    final l$service_provider_id = json['service_provider_id'];
    final l$service_provider_type = json['service_provider_type'];
    final l$$__typename = json['__typename'];
    return Query$getDeliveryPartner$service_provider_delivery_partner(
      delivery_company_id: (l$delivery_company_id as int),
      id: (l$id as int),
      service_provider_id: (l$service_provider_id as int),
      service_provider_type: (l$service_provider_type as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int delivery_company_id;

  final int id;

  final int service_provider_id;

  final String service_provider_type;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delivery_company_id = delivery_company_id;
    _resultData['delivery_company_id'] = l$delivery_company_id;
    final l$id = id;
    _resultData['id'] = l$id;
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
    final l$delivery_company_id = delivery_company_id;
    final l$id = id;
    final l$service_provider_id = service_provider_id;
    final l$service_provider_type = service_provider_type;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$delivery_company_id,
      l$id,
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
            is Query$getDeliveryPartner$service_provider_delivery_partner) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delivery_company_id = delivery_company_id;
    final lOther$delivery_company_id = other.delivery_company_id;
    if (l$delivery_company_id != lOther$delivery_company_id) {
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

extension UtilityExtension$Query$getDeliveryPartner$service_provider_delivery_partner
    on Query$getDeliveryPartner$service_provider_delivery_partner {
  CopyWith$Query$getDeliveryPartner$service_provider_delivery_partner<
          Query$getDeliveryPartner$service_provider_delivery_partner>
      get copyWith =>
          CopyWith$Query$getDeliveryPartner$service_provider_delivery_partner(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getDeliveryPartner$service_provider_delivery_partner<
    TRes> {
  factory CopyWith$Query$getDeliveryPartner$service_provider_delivery_partner(
    Query$getDeliveryPartner$service_provider_delivery_partner instance,
    TRes Function(Query$getDeliveryPartner$service_provider_delivery_partner)
        then,
  ) = _CopyWithImpl$Query$getDeliveryPartner$service_provider_delivery_partner;

  factory CopyWith$Query$getDeliveryPartner$service_provider_delivery_partner.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getDeliveryPartner$service_provider_delivery_partner;

  TRes call({
    int? delivery_company_id,
    int? id,
    int? service_provider_id,
    String? service_provider_type,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getDeliveryPartner$service_provider_delivery_partner<
        TRes>
    implements
        CopyWith$Query$getDeliveryPartner$service_provider_delivery_partner<
            TRes> {
  _CopyWithImpl$Query$getDeliveryPartner$service_provider_delivery_partner(
    this._instance,
    this._then,
  );

  final Query$getDeliveryPartner$service_provider_delivery_partner _instance;

  final TRes Function(
      Query$getDeliveryPartner$service_provider_delivery_partner) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_company_id = _undefined,
    Object? id = _undefined,
    Object? service_provider_id = _undefined,
    Object? service_provider_type = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getDeliveryPartner$service_provider_delivery_partner(
        delivery_company_id:
            delivery_company_id == _undefined || delivery_company_id == null
                ? _instance.delivery_company_id
                : (delivery_company_id as int),
        id: id == _undefined || id == null ? _instance.id : (id as int),
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

class _CopyWithStubImpl$Query$getDeliveryPartner$service_provider_delivery_partner<
        TRes>
    implements
        CopyWith$Query$getDeliveryPartner$service_provider_delivery_partner<
            TRes> {
  _CopyWithStubImpl$Query$getDeliveryPartner$service_provider_delivery_partner(
      this._res);

  TRes _res;

  call({
    int? delivery_company_id,
    int? id,
    int? service_provider_id,
    String? service_provider_type,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$updateDeliveryPartner {
  factory Variables$Mutation$updateDeliveryPartner({
    required int serviceId,
    String? serviceType,
    required int newCompanyId,
  }) =>
      Variables$Mutation$updateDeliveryPartner._({
        r'serviceId': serviceId,
        if (serviceType != null) r'serviceType': serviceType,
        r'newCompanyId': newCompanyId,
      });

  Variables$Mutation$updateDeliveryPartner._(this._$data);

  factory Variables$Mutation$updateDeliveryPartner.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$serviceId = data['serviceId'];
    result$data['serviceId'] = (l$serviceId as int);
    if (data.containsKey('serviceType')) {
      final l$serviceType = data['serviceType'];
      result$data['serviceType'] = (l$serviceType as String?);
    }
    final l$newCompanyId = data['newCompanyId'];
    result$data['newCompanyId'] = (l$newCompanyId as int);
    return Variables$Mutation$updateDeliveryPartner._(result$data);
  }

  Map<String, dynamic> _$data;

  int get serviceId => (_$data['serviceId'] as int);
  String? get serviceType => (_$data['serviceType'] as String?);
  int get newCompanyId => (_$data['newCompanyId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$serviceId = serviceId;
    result$data['serviceId'] = l$serviceId;
    if (_$data.containsKey('serviceType')) {
      final l$serviceType = serviceType;
      result$data['serviceType'] = l$serviceType;
    }
    final l$newCompanyId = newCompanyId;
    result$data['newCompanyId'] = l$newCompanyId;
    return result$data;
  }

  CopyWith$Variables$Mutation$updateDeliveryPartner<
          Variables$Mutation$updateDeliveryPartner>
      get copyWith => CopyWith$Variables$Mutation$updateDeliveryPartner(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$updateDeliveryPartner) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$serviceId = serviceId;
    final lOther$serviceId = other.serviceId;
    if (l$serviceId != lOther$serviceId) {
      return false;
    }
    final l$serviceType = serviceType;
    final lOther$serviceType = other.serviceType;
    if (_$data.containsKey('serviceType') !=
        other._$data.containsKey('serviceType')) {
      return false;
    }
    if (l$serviceType != lOther$serviceType) {
      return false;
    }
    final l$newCompanyId = newCompanyId;
    final lOther$newCompanyId = other.newCompanyId;
    if (l$newCompanyId != lOther$newCompanyId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$serviceId = serviceId;
    final l$serviceType = serviceType;
    final l$newCompanyId = newCompanyId;
    return Object.hashAll([
      l$serviceId,
      _$data.containsKey('serviceType') ? l$serviceType : const {},
      l$newCompanyId,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$updateDeliveryPartner<TRes> {
  factory CopyWith$Variables$Mutation$updateDeliveryPartner(
    Variables$Mutation$updateDeliveryPartner instance,
    TRes Function(Variables$Mutation$updateDeliveryPartner) then,
  ) = _CopyWithImpl$Variables$Mutation$updateDeliveryPartner;

  factory CopyWith$Variables$Mutation$updateDeliveryPartner.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$updateDeliveryPartner;

  TRes call({
    int? serviceId,
    String? serviceType,
    int? newCompanyId,
  });
}

class _CopyWithImpl$Variables$Mutation$updateDeliveryPartner<TRes>
    implements CopyWith$Variables$Mutation$updateDeliveryPartner<TRes> {
  _CopyWithImpl$Variables$Mutation$updateDeliveryPartner(
    this._instance,
    this._then,
  );

  final Variables$Mutation$updateDeliveryPartner _instance;

  final TRes Function(Variables$Mutation$updateDeliveryPartner) _then;

  static const _undefined = {};

  TRes call({
    Object? serviceId = _undefined,
    Object? serviceType = _undefined,
    Object? newCompanyId = _undefined,
  }) =>
      _then(Variables$Mutation$updateDeliveryPartner._({
        ..._instance._$data,
        if (serviceId != _undefined && serviceId != null)
          'serviceId': (serviceId as int),
        if (serviceType != _undefined) 'serviceType': (serviceType as String?),
        if (newCompanyId != _undefined && newCompanyId != null)
          'newCompanyId': (newCompanyId as int),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$updateDeliveryPartner<TRes>
    implements CopyWith$Variables$Mutation$updateDeliveryPartner<TRes> {
  _CopyWithStubImpl$Variables$Mutation$updateDeliveryPartner(this._res);

  TRes _res;

  call({
    int? serviceId,
    String? serviceType,
    int? newCompanyId,
  }) =>
      _res;
}

class Mutation$updateDeliveryPartner {
  Mutation$updateDeliveryPartner({
    this.update_service_provider_delivery_partner,
    required this.$__typename,
  });

  factory Mutation$updateDeliveryPartner.fromJson(Map<String, dynamic> json) {
    final l$update_service_provider_delivery_partner =
        json['update_service_provider_delivery_partner'];
    final l$$__typename = json['__typename'];
    return Mutation$updateDeliveryPartner(
      update_service_provider_delivery_partner:
          l$update_service_provider_delivery_partner == null
              ? null
              : Mutation$updateDeliveryPartner$update_service_provider_delivery_partner
                  .fromJson((l$update_service_provider_delivery_partner
                      as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$updateDeliveryPartner$update_service_provider_delivery_partner?
      update_service_provider_delivery_partner;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_service_provider_delivery_partner =
        update_service_provider_delivery_partner;
    _resultData['update_service_provider_delivery_partner'] =
        l$update_service_provider_delivery_partner?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_service_provider_delivery_partner =
        update_service_provider_delivery_partner;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_service_provider_delivery_partner,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$updateDeliveryPartner) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_service_provider_delivery_partner =
        update_service_provider_delivery_partner;
    final lOther$update_service_provider_delivery_partner =
        other.update_service_provider_delivery_partner;
    if (l$update_service_provider_delivery_partner !=
        lOther$update_service_provider_delivery_partner) {
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

extension UtilityExtension$Mutation$updateDeliveryPartner
    on Mutation$updateDeliveryPartner {
  CopyWith$Mutation$updateDeliveryPartner<Mutation$updateDeliveryPartner>
      get copyWith => CopyWith$Mutation$updateDeliveryPartner(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateDeliveryPartner<TRes> {
  factory CopyWith$Mutation$updateDeliveryPartner(
    Mutation$updateDeliveryPartner instance,
    TRes Function(Mutation$updateDeliveryPartner) then,
  ) = _CopyWithImpl$Mutation$updateDeliveryPartner;

  factory CopyWith$Mutation$updateDeliveryPartner.stub(TRes res) =
      _CopyWithStubImpl$Mutation$updateDeliveryPartner;

  TRes call({
    Mutation$updateDeliveryPartner$update_service_provider_delivery_partner?
        update_service_provider_delivery_partner,
    String? $__typename,
  });
  CopyWith$Mutation$updateDeliveryPartner$update_service_provider_delivery_partner<
      TRes> get update_service_provider_delivery_partner;
}

class _CopyWithImpl$Mutation$updateDeliveryPartner<TRes>
    implements CopyWith$Mutation$updateDeliveryPartner<TRes> {
  _CopyWithImpl$Mutation$updateDeliveryPartner(
    this._instance,
    this._then,
  );

  final Mutation$updateDeliveryPartner _instance;

  final TRes Function(Mutation$updateDeliveryPartner) _then;

  static const _undefined = {};

  TRes call({
    Object? update_service_provider_delivery_partner = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateDeliveryPartner(
        update_service_provider_delivery_partner:
            update_service_provider_delivery_partner == _undefined
                ? _instance.update_service_provider_delivery_partner
                : (update_service_provider_delivery_partner
                    as Mutation$updateDeliveryPartner$update_service_provider_delivery_partner?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$updateDeliveryPartner$update_service_provider_delivery_partner<
      TRes> get update_service_provider_delivery_partner {
    final local$update_service_provider_delivery_partner =
        _instance.update_service_provider_delivery_partner;
    return local$update_service_provider_delivery_partner == null
        ? CopyWith$Mutation$updateDeliveryPartner$update_service_provider_delivery_partner
            .stub(_then(_instance))
        : CopyWith$Mutation$updateDeliveryPartner$update_service_provider_delivery_partner(
            local$update_service_provider_delivery_partner,
            (e) => call(update_service_provider_delivery_partner: e));
  }
}

class _CopyWithStubImpl$Mutation$updateDeliveryPartner<TRes>
    implements CopyWith$Mutation$updateDeliveryPartner<TRes> {
  _CopyWithStubImpl$Mutation$updateDeliveryPartner(this._res);

  TRes _res;

  call({
    Mutation$updateDeliveryPartner$update_service_provider_delivery_partner?
        update_service_provider_delivery_partner,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$updateDeliveryPartner$update_service_provider_delivery_partner<
          TRes>
      get update_service_provider_delivery_partner =>
          CopyWith$Mutation$updateDeliveryPartner$update_service_provider_delivery_partner
              .stub(_res);
}

const documentNodeMutationupdateDeliveryPartner = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'updateDeliveryPartner'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'serviceId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'serviceType')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'newCompanyId')),
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
        name: NameNode(value: 'update_service_provider_delivery_partner'),
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
                    value: VariableNode(name: NameNode(value: 'serviceId')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'service_provider_type'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'serviceType')),
                  )
                ]),
              ),
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: '_set'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'delivery_company_id'),
                value: VariableNode(name: NameNode(value: 'newCompanyId')),
              )
            ]),
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
                name: NameNode(value: 'delivery_company_id'),
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
Mutation$updateDeliveryPartner _parserFn$Mutation$updateDeliveryPartner(
        Map<String, dynamic> data) =>
    Mutation$updateDeliveryPartner.fromJson(data);
typedef OnMutationCompleted$Mutation$updateDeliveryPartner = FutureOr<void>
    Function(
  dynamic,
  Mutation$updateDeliveryPartner?,
);

class Options$Mutation$updateDeliveryPartner
    extends graphql.MutationOptions<Mutation$updateDeliveryPartner> {
  Options$Mutation$updateDeliveryPartner({
    String? operationName,
    required Variables$Mutation$updateDeliveryPartner variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$updateDeliveryPartner? onCompleted,
    graphql.OnMutationUpdate<Mutation$updateDeliveryPartner>? update,
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
                        : _parserFn$Mutation$updateDeliveryPartner(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdateDeliveryPartner,
          parserFn: _parserFn$Mutation$updateDeliveryPartner,
        );

  final OnMutationCompleted$Mutation$updateDeliveryPartner?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$updateDeliveryPartner
    extends graphql.WatchQueryOptions<Mutation$updateDeliveryPartner> {
  WatchOptions$Mutation$updateDeliveryPartner({
    String? operationName,
    required Variables$Mutation$updateDeliveryPartner variables,
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
          document: documentNodeMutationupdateDeliveryPartner,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$updateDeliveryPartner,
        );
}

extension ClientExtension$Mutation$updateDeliveryPartner
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$updateDeliveryPartner>>
      mutate$updateDeliveryPartner(
              Options$Mutation$updateDeliveryPartner options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$updateDeliveryPartner>
      watchMutation$updateDeliveryPartner(
              WatchOptions$Mutation$updateDeliveryPartner options) =>
          this.watchMutation(options);
}

class Mutation$updateDeliveryPartner$update_service_provider_delivery_partner {
  Mutation$updateDeliveryPartner$update_service_provider_delivery_partner({
    required this.returning,
    required this.$__typename,
  });

  factory Mutation$updateDeliveryPartner$update_service_provider_delivery_partner.fromJson(
      Map<String, dynamic> json) {
    final l$returning = json['returning'];
    final l$$__typename = json['__typename'];
    return Mutation$updateDeliveryPartner$update_service_provider_delivery_partner(
      returning: (l$returning as List<dynamic>)
          .map((e) =>
              Mutation$updateDeliveryPartner$update_service_provider_delivery_partner$returning
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Mutation$updateDeliveryPartner$update_service_provider_delivery_partner$returning>
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
    if (!(other
            is Mutation$updateDeliveryPartner$update_service_provider_delivery_partner) ||
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

extension UtilityExtension$Mutation$updateDeliveryPartner$update_service_provider_delivery_partner
    on Mutation$updateDeliveryPartner$update_service_provider_delivery_partner {
  CopyWith$Mutation$updateDeliveryPartner$update_service_provider_delivery_partner<
          Mutation$updateDeliveryPartner$update_service_provider_delivery_partner>
      get copyWith =>
          CopyWith$Mutation$updateDeliveryPartner$update_service_provider_delivery_partner(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateDeliveryPartner$update_service_provider_delivery_partner<
    TRes> {
  factory CopyWith$Mutation$updateDeliveryPartner$update_service_provider_delivery_partner(
    Mutation$updateDeliveryPartner$update_service_provider_delivery_partner
        instance,
    TRes Function(
            Mutation$updateDeliveryPartner$update_service_provider_delivery_partner)
        then,
  ) = _CopyWithImpl$Mutation$updateDeliveryPartner$update_service_provider_delivery_partner;

  factory CopyWith$Mutation$updateDeliveryPartner$update_service_provider_delivery_partner.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateDeliveryPartner$update_service_provider_delivery_partner;

  TRes call({
    List<Mutation$updateDeliveryPartner$update_service_provider_delivery_partner$returning>?
        returning,
    String? $__typename,
  });
  TRes returning(
      Iterable<Mutation$updateDeliveryPartner$update_service_provider_delivery_partner$returning> Function(
              Iterable<
                  CopyWith$Mutation$updateDeliveryPartner$update_service_provider_delivery_partner$returning<
                      Mutation$updateDeliveryPartner$update_service_provider_delivery_partner$returning>>)
          _fn);
}

class _CopyWithImpl$Mutation$updateDeliveryPartner$update_service_provider_delivery_partner<
        TRes>
    implements
        CopyWith$Mutation$updateDeliveryPartner$update_service_provider_delivery_partner<
            TRes> {
  _CopyWithImpl$Mutation$updateDeliveryPartner$update_service_provider_delivery_partner(
    this._instance,
    this._then,
  );

  final Mutation$updateDeliveryPartner$update_service_provider_delivery_partner
      _instance;

  final TRes Function(
          Mutation$updateDeliveryPartner$update_service_provider_delivery_partner)
      _then;

  static const _undefined = {};

  TRes call({
    Object? returning = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$updateDeliveryPartner$update_service_provider_delivery_partner(
        returning: returning == _undefined || returning == null
            ? _instance.returning
            : (returning as List<
                Mutation$updateDeliveryPartner$update_service_provider_delivery_partner$returning>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes returning(
          Iterable<Mutation$updateDeliveryPartner$update_service_provider_delivery_partner$returning> Function(
                  Iterable<
                      CopyWith$Mutation$updateDeliveryPartner$update_service_provider_delivery_partner$returning<
                          Mutation$updateDeliveryPartner$update_service_provider_delivery_partner$returning>>)
              _fn) =>
      call(
          returning: _fn(_instance.returning.map((e) =>
              CopyWith$Mutation$updateDeliveryPartner$update_service_provider_delivery_partner$returning(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Mutation$updateDeliveryPartner$update_service_provider_delivery_partner<
        TRes>
    implements
        CopyWith$Mutation$updateDeliveryPartner$update_service_provider_delivery_partner<
            TRes> {
  _CopyWithStubImpl$Mutation$updateDeliveryPartner$update_service_provider_delivery_partner(
      this._res);

  TRes _res;

  call({
    List<Mutation$updateDeliveryPartner$update_service_provider_delivery_partner$returning>?
        returning,
    String? $__typename,
  }) =>
      _res;
  returning(_fn) => _res;
}

class Mutation$updateDeliveryPartner$update_service_provider_delivery_partner$returning {
  Mutation$updateDeliveryPartner$update_service_provider_delivery_partner$returning({
    required this.delivery_company_id,
    required this.$__typename,
  });

  factory Mutation$updateDeliveryPartner$update_service_provider_delivery_partner$returning.fromJson(
      Map<String, dynamic> json) {
    final l$delivery_company_id = json['delivery_company_id'];
    final l$$__typename = json['__typename'];
    return Mutation$updateDeliveryPartner$update_service_provider_delivery_partner$returning(
      delivery_company_id: (l$delivery_company_id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int delivery_company_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delivery_company_id = delivery_company_id;
    _resultData['delivery_company_id'] = l$delivery_company_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delivery_company_id = delivery_company_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$delivery_company_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$updateDeliveryPartner$update_service_provider_delivery_partner$returning) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delivery_company_id = delivery_company_id;
    final lOther$delivery_company_id = other.delivery_company_id;
    if (l$delivery_company_id != lOther$delivery_company_id) {
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

extension UtilityExtension$Mutation$updateDeliveryPartner$update_service_provider_delivery_partner$returning
    on Mutation$updateDeliveryPartner$update_service_provider_delivery_partner$returning {
  CopyWith$Mutation$updateDeliveryPartner$update_service_provider_delivery_partner$returning<
          Mutation$updateDeliveryPartner$update_service_provider_delivery_partner$returning>
      get copyWith =>
          CopyWith$Mutation$updateDeliveryPartner$update_service_provider_delivery_partner$returning(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateDeliveryPartner$update_service_provider_delivery_partner$returning<
    TRes> {
  factory CopyWith$Mutation$updateDeliveryPartner$update_service_provider_delivery_partner$returning(
    Mutation$updateDeliveryPartner$update_service_provider_delivery_partner$returning
        instance,
    TRes Function(
            Mutation$updateDeliveryPartner$update_service_provider_delivery_partner$returning)
        then,
  ) = _CopyWithImpl$Mutation$updateDeliveryPartner$update_service_provider_delivery_partner$returning;

  factory CopyWith$Mutation$updateDeliveryPartner$update_service_provider_delivery_partner$returning.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateDeliveryPartner$update_service_provider_delivery_partner$returning;

  TRes call({
    int? delivery_company_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$updateDeliveryPartner$update_service_provider_delivery_partner$returning<
        TRes>
    implements
        CopyWith$Mutation$updateDeliveryPartner$update_service_provider_delivery_partner$returning<
            TRes> {
  _CopyWithImpl$Mutation$updateDeliveryPartner$update_service_provider_delivery_partner$returning(
    this._instance,
    this._then,
  );

  final Mutation$updateDeliveryPartner$update_service_provider_delivery_partner$returning
      _instance;

  final TRes Function(
          Mutation$updateDeliveryPartner$update_service_provider_delivery_partner$returning)
      _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_company_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$updateDeliveryPartner$update_service_provider_delivery_partner$returning(
        delivery_company_id:
            delivery_company_id == _undefined || delivery_company_id == null
                ? _instance.delivery_company_id
                : (delivery_company_id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$updateDeliveryPartner$update_service_provider_delivery_partner$returning<
        TRes>
    implements
        CopyWith$Mutation$updateDeliveryPartner$update_service_provider_delivery_partner$returning<
            TRes> {
  _CopyWithStubImpl$Mutation$updateDeliveryPartner$update_service_provider_delivery_partner$returning(
      this._res);

  TRes _res;

  call({
    int? delivery_company_id,
    String? $__typename,
  }) =>
      _res;
}
