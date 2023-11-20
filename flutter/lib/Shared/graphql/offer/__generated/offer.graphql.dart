import '../../__generated/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

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
            name: NameNode(value: 'influencer_details'),
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
    this.influencer_details,
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
    final l$influencer_details = json['influencer_details'];
    final l$$__typename = json['__typename'];
    return Query$get_service_provider_offers$service_provider_offer(
      id: (l$id as int),
      details: mapFromJson(l$details),
      name: Query$get_service_provider_offers$service_provider_offer$name
          .fromJson((l$name as Map<String, dynamic>)),
      status: (l$status as String),
      coupon_code: (l$coupon_code as String?),
      offer_type: (l$offer_type as String),
      influencer_details: l$influencer_details == null
          ? null
          : mapFromJson(l$influencer_details),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final dynamic details;

  final Query$get_service_provider_offers$service_provider_offer$name name;

  final String status;

  final String? coupon_code;

  final String offer_type;

  final dynamic? influencer_details;

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
    final l$influencer_details = influencer_details;
    _resultData['influencer_details'] =
        l$influencer_details == null ? null : mapToJson(l$influencer_details);
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
    final l$influencer_details = influencer_details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$details,
      l$name,
      l$status,
      l$coupon_code,
      l$offer_type,
      l$influencer_details,
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
    final l$influencer_details = influencer_details;
    final lOther$influencer_details = other.influencer_details;
    if (l$influencer_details != lOther$influencer_details) {
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
    dynamic? influencer_details,
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
    Object? influencer_details = _undefined,
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
        influencer_details: influencer_details == _undefined
            ? _instance.influencer_details
            : (influencer_details as dynamic?),
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
    dynamic? influencer_details,
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
    String? order_type,
  }) =>
      Variables$Query$check_offer_applied._({
        if (offer_id != null) r'offer_id': offer_id,
        if (customer_id != null) r'customer_id': customer_id,
        if (order_type != null) r'order_type': order_type,
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
    if (data.containsKey('order_type')) {
      final l$order_type = data['order_type'];
      result$data['order_type'] = (l$order_type as String?);
    }
    return Variables$Query$check_offer_applied._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get offer_id => (_$data['offer_id'] as int?);
  int? get customer_id => (_$data['customer_id'] as int?);
  String? get order_type => (_$data['order_type'] as String?);
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
    if (_$data.containsKey('order_type')) {
      final l$order_type = order_type;
      result$data['order_type'] = l$order_type;
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
    final l$order_type = order_type;
    final lOther$order_type = other.order_type;
    if (_$data.containsKey('order_type') !=
        other._$data.containsKey('order_type')) {
      return false;
    }
    if (l$order_type != lOther$order_type) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$offer_id = offer_id;
    final l$customer_id = customer_id;
    final l$order_type = order_type;
    return Object.hashAll([
      _$data.containsKey('offer_id') ? l$offer_id : const {},
      _$data.containsKey('customer_id') ? l$customer_id : const {},
      _$data.containsKey('order_type') ? l$order_type : const {},
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
    String? order_type,
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
    Object? order_type = _undefined,
  }) =>
      _then(Variables$Query$check_offer_applied._({
        ..._instance._$data,
        if (offer_id != _undefined) 'offer_id': (offer_id as int?),
        if (customer_id != _undefined) 'customer_id': (customer_id as int?),
        if (order_type != _undefined) 'order_type': (order_type as String?),
      }));
}

class _CopyWithStubImpl$Variables$Query$check_offer_applied<TRes>
    implements CopyWith$Variables$Query$check_offer_applied<TRes> {
  _CopyWithStubImpl$Variables$Query$check_offer_applied(this._res);

  TRes _res;

  call({
    int? offer_id,
    int? customer_id,
    String? order_type,
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
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'order_type')),
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
                    value: VariableNode(name: NameNode(value: 'order_type')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: '_or'),
                value: ListValueNode(values: [
                  ObjectValueNode(fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'business_order'),
                      value: ObjectValueNode(fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'customer_id'),
                          value: ObjectValueNode(fields: [
                            ObjectFieldNode(
                              name: NameNode(value: '_eq'),
                              value: VariableNode(
                                  name: NameNode(value: 'customer_id')),
                            )
                          ]),
                        )
                      ]),
                    )
                  ]),
                  ObjectValueNode(fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'restaurant_order'),
                      value: ObjectValueNode(fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'customer_id'),
                          value: ObjectValueNode(fields: [
                            ObjectFieldNode(
                              name: NameNode(value: '_eq'),
                              value: VariableNode(
                                  name: NameNode(value: 'customer_id')),
                            )
                          ]),
                        )
                      ]),
                    )
                  ]),
                  ObjectValueNode(fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'laundry_order'),
                      value: ObjectValueNode(fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'customer_id'),
                          value: ObjectValueNode(fields: [
                            ObjectFieldNode(
                              name: NameNode(value: '_eq'),
                              value: VariableNode(
                                  name: NameNode(value: 'customer_id')),
                            )
                          ]),
                        )
                      ]),
                    )
                  ]),
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
    this.order_id,
    required this.$__typename,
  });

  factory Query$check_offer_applied$service_provider_offer_applied.fromJson(
      Map<String, dynamic> json) {
    final l$order_id = json['order_id'];
    final l$$__typename = json['__typename'];
    return Query$check_offer_applied$service_provider_offer_applied(
      order_id: (l$order_id as int?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int? order_id;

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
        order_id:
            order_id == _undefined ? _instance.order_id : (order_id as int?),
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

class Variables$Query$fetchPromotions {
  factory Variables$Query$fetchPromotions({
    int? service_provider_id,
    String? service_provider_type,
  }) =>
      Variables$Query$fetchPromotions._({
        if (service_provider_id != null)
          r'service_provider_id': service_provider_id,
        if (service_provider_type != null)
          r'service_provider_type': service_provider_type,
      });

  Variables$Query$fetchPromotions._(this._$data);

  factory Variables$Query$fetchPromotions.fromJson(Map<String, dynamic> data) {
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
    return Variables$Query$fetchPromotions._(result$data);
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

  CopyWith$Variables$Query$fetchPromotions<Variables$Query$fetchPromotions>
      get copyWith => CopyWith$Variables$Query$fetchPromotions(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$fetchPromotions) ||
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

abstract class CopyWith$Variables$Query$fetchPromotions<TRes> {
  factory CopyWith$Variables$Query$fetchPromotions(
    Variables$Query$fetchPromotions instance,
    TRes Function(Variables$Query$fetchPromotions) then,
  ) = _CopyWithImpl$Variables$Query$fetchPromotions;

  factory CopyWith$Variables$Query$fetchPromotions.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$fetchPromotions;

  TRes call({
    int? service_provider_id,
    String? service_provider_type,
  });
}

class _CopyWithImpl$Variables$Query$fetchPromotions<TRes>
    implements CopyWith$Variables$Query$fetchPromotions<TRes> {
  _CopyWithImpl$Variables$Query$fetchPromotions(
    this._instance,
    this._then,
  );

  final Variables$Query$fetchPromotions _instance;

  final TRes Function(Variables$Query$fetchPromotions) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_id = _undefined,
    Object? service_provider_type = _undefined,
  }) =>
      _then(Variables$Query$fetchPromotions._({
        ..._instance._$data,
        if (service_provider_id != _undefined)
          'service_provider_id': (service_provider_id as int?),
        if (service_provider_type != _undefined)
          'service_provider_type': (service_provider_type as String?),
      }));
}

class _CopyWithStubImpl$Variables$Query$fetchPromotions<TRes>
    implements CopyWith$Variables$Query$fetchPromotions<TRes> {
  _CopyWithStubImpl$Variables$Query$fetchPromotions(this._res);

  TRes _res;

  call({
    int? service_provider_id,
    String? service_provider_type,
  }) =>
      _res;
}

class Query$fetchPromotions {
  Query$fetchPromotions({
    required this.service_provider_offer,
    required this.$__typename,
  });

  factory Query$fetchPromotions.fromJson(Map<String, dynamic> json) {
    final l$service_provider_offer = json['service_provider_offer'];
    final l$$__typename = json['__typename'];
    return Query$fetchPromotions(
      service_provider_offer: (l$service_provider_offer as List<dynamic>)
          .map((e) => Query$fetchPromotions$service_provider_offer.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$fetchPromotions$service_provider_offer>
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
    if (!(other is Query$fetchPromotions) || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$fetchPromotions on Query$fetchPromotions {
  CopyWith$Query$fetchPromotions<Query$fetchPromotions> get copyWith =>
      CopyWith$Query$fetchPromotions(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$fetchPromotions<TRes> {
  factory CopyWith$Query$fetchPromotions(
    Query$fetchPromotions instance,
    TRes Function(Query$fetchPromotions) then,
  ) = _CopyWithImpl$Query$fetchPromotions;

  factory CopyWith$Query$fetchPromotions.stub(TRes res) =
      _CopyWithStubImpl$Query$fetchPromotions;

  TRes call({
    List<Query$fetchPromotions$service_provider_offer>? service_provider_offer,
    String? $__typename,
  });
  TRes service_provider_offer(
      Iterable<Query$fetchPromotions$service_provider_offer> Function(
              Iterable<
                  CopyWith$Query$fetchPromotions$service_provider_offer<
                      Query$fetchPromotions$service_provider_offer>>)
          _fn);
}

class _CopyWithImpl$Query$fetchPromotions<TRes>
    implements CopyWith$Query$fetchPromotions<TRes> {
  _CopyWithImpl$Query$fetchPromotions(
    this._instance,
    this._then,
  );

  final Query$fetchPromotions _instance;

  final TRes Function(Query$fetchPromotions) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_offer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$fetchPromotions(
        service_provider_offer: service_provider_offer == _undefined ||
                service_provider_offer == null
            ? _instance.service_provider_offer
            : (service_provider_offer
                as List<Query$fetchPromotions$service_provider_offer>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes service_provider_offer(
          Iterable<Query$fetchPromotions$service_provider_offer> Function(
                  Iterable<
                      CopyWith$Query$fetchPromotions$service_provider_offer<
                          Query$fetchPromotions$service_provider_offer>>)
              _fn) =>
      call(
          service_provider_offer: _fn(_instance.service_provider_offer
              .map((e) => CopyWith$Query$fetchPromotions$service_provider_offer(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$fetchPromotions<TRes>
    implements CopyWith$Query$fetchPromotions<TRes> {
  _CopyWithStubImpl$Query$fetchPromotions(this._res);

  TRes _res;

  call({
    List<Query$fetchPromotions$service_provider_offer>? service_provider_offer,
    String? $__typename,
  }) =>
      _res;
  service_provider_offer(_fn) => _res;
}

const documentNodeQueryfetchPromotions = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'fetchPromotions'),
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
                name: NameNode(value: 'offer_type'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: StringValueNode(
                      value: 'promotion',
                      isBlock: false,
                    ),
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
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'details'),
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
            name: NameNode(value: 'name_id'),
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
Query$fetchPromotions _parserFn$Query$fetchPromotions(
        Map<String, dynamic> data) =>
    Query$fetchPromotions.fromJson(data);

class Options$Query$fetchPromotions
    extends graphql.QueryOptions<Query$fetchPromotions> {
  Options$Query$fetchPromotions({
    String? operationName,
    Variables$Query$fetchPromotions? variables,
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
          document: documentNodeQueryfetchPromotions,
          parserFn: _parserFn$Query$fetchPromotions,
        );
}

class WatchOptions$Query$fetchPromotions
    extends graphql.WatchQueryOptions<Query$fetchPromotions> {
  WatchOptions$Query$fetchPromotions({
    String? operationName,
    Variables$Query$fetchPromotions? variables,
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
          document: documentNodeQueryfetchPromotions,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$fetchPromotions,
        );
}

class FetchMoreOptions$Query$fetchPromotions extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$fetchPromotions({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$fetchPromotions? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQueryfetchPromotions,
        );
}

extension ClientExtension$Query$fetchPromotions on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$fetchPromotions>> query$fetchPromotions(
          [Options$Query$fetchPromotions? options]) async =>
      await this.query(options ?? Options$Query$fetchPromotions());
  graphql.ObservableQuery<Query$fetchPromotions> watchQuery$fetchPromotions(
          [WatchOptions$Query$fetchPromotions? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$fetchPromotions());
  void writeQuery$fetchPromotions({
    required Query$fetchPromotions data,
    Variables$Query$fetchPromotions? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryfetchPromotions),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$fetchPromotions? readQuery$fetchPromotions({
    Variables$Query$fetchPromotions? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryfetchPromotions),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$fetchPromotions.fromJson(result);
  }
}

class Query$fetchPromotions$service_provider_offer {
  Query$fetchPromotions$service_provider_offer({
    required this.details,
    required this.id,
    required this.name,
    required this.name_id,
    required this.$__typename,
  });

  factory Query$fetchPromotions$service_provider_offer.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$id = json['id'];
    final l$name = json['name'];
    final l$name_id = json['name_id'];
    final l$$__typename = json['__typename'];
    return Query$fetchPromotions$service_provider_offer(
      details: mapFromJson(l$details),
      id: (l$id as int),
      name: Query$fetchPromotions$service_provider_offer$name.fromJson(
          (l$name as Map<String, dynamic>)),
      name_id: (l$name_id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final dynamic details;

  final int id;

  final Query$fetchPromotions$service_provider_offer$name name;

  final int name_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$details = details;
    _resultData['details'] = mapToJson(l$details);
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$name_id = name_id;
    _resultData['name_id'] = l$name_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$details = details;
    final l$id = id;
    final l$name = name;
    final l$name_id = name_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$details,
      l$id,
      l$name,
      l$name_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$fetchPromotions$service_provider_offer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$details = details;
    final lOther$details = other.details;
    if (l$details != lOther$details) {
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
    final l$name_id = name_id;
    final lOther$name_id = other.name_id;
    if (l$name_id != lOther$name_id) {
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

extension UtilityExtension$Query$fetchPromotions$service_provider_offer
    on Query$fetchPromotions$service_provider_offer {
  CopyWith$Query$fetchPromotions$service_provider_offer<
          Query$fetchPromotions$service_provider_offer>
      get copyWith => CopyWith$Query$fetchPromotions$service_provider_offer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetchPromotions$service_provider_offer<TRes> {
  factory CopyWith$Query$fetchPromotions$service_provider_offer(
    Query$fetchPromotions$service_provider_offer instance,
    TRes Function(Query$fetchPromotions$service_provider_offer) then,
  ) = _CopyWithImpl$Query$fetchPromotions$service_provider_offer;

  factory CopyWith$Query$fetchPromotions$service_provider_offer.stub(TRes res) =
      _CopyWithStubImpl$Query$fetchPromotions$service_provider_offer;

  TRes call({
    dynamic? details,
    int? id,
    Query$fetchPromotions$service_provider_offer$name? name,
    int? name_id,
    String? $__typename,
  });
  CopyWith$Query$fetchPromotions$service_provider_offer$name<TRes> get name;
}

class _CopyWithImpl$Query$fetchPromotions$service_provider_offer<TRes>
    implements CopyWith$Query$fetchPromotions$service_provider_offer<TRes> {
  _CopyWithImpl$Query$fetchPromotions$service_provider_offer(
    this._instance,
    this._then,
  );

  final Query$fetchPromotions$service_provider_offer _instance;

  final TRes Function(Query$fetchPromotions$service_provider_offer) _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? id = _undefined,
    Object? name = _undefined,
    Object? name_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$fetchPromotions$service_provider_offer(
        details: details == _undefined || details == null
            ? _instance.details
            : (details as dynamic),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as Query$fetchPromotions$service_provider_offer$name),
        name_id: name_id == _undefined || name_id == null
            ? _instance.name_id
            : (name_id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$fetchPromotions$service_provider_offer$name<TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Query$fetchPromotions$service_provider_offer$name(
        local$name, (e) => call(name: e));
  }
}

class _CopyWithStubImpl$Query$fetchPromotions$service_provider_offer<TRes>
    implements CopyWith$Query$fetchPromotions$service_provider_offer<TRes> {
  _CopyWithStubImpl$Query$fetchPromotions$service_provider_offer(this._res);

  TRes _res;

  call({
    dynamic? details,
    int? id,
    Query$fetchPromotions$service_provider_offer$name? name,
    int? name_id,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$fetchPromotions$service_provider_offer$name<TRes> get name =>
      CopyWith$Query$fetchPromotions$service_provider_offer$name.stub(_res);
}

class Query$fetchPromotions$service_provider_offer$name {
  Query$fetchPromotions$service_provider_offer$name({
    required this.translations,
    required this.$__typename,
  });

  factory Query$fetchPromotions$service_provider_offer$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$fetchPromotions$service_provider_offer$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$fetchPromotions$service_provider_offer$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$fetchPromotions$service_provider_offer$name$translations>
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
    if (!(other is Query$fetchPromotions$service_provider_offer$name) ||
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

extension UtilityExtension$Query$fetchPromotions$service_provider_offer$name
    on Query$fetchPromotions$service_provider_offer$name {
  CopyWith$Query$fetchPromotions$service_provider_offer$name<
          Query$fetchPromotions$service_provider_offer$name>
      get copyWith =>
          CopyWith$Query$fetchPromotions$service_provider_offer$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetchPromotions$service_provider_offer$name<
    TRes> {
  factory CopyWith$Query$fetchPromotions$service_provider_offer$name(
    Query$fetchPromotions$service_provider_offer$name instance,
    TRes Function(Query$fetchPromotions$service_provider_offer$name) then,
  ) = _CopyWithImpl$Query$fetchPromotions$service_provider_offer$name;

  factory CopyWith$Query$fetchPromotions$service_provider_offer$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetchPromotions$service_provider_offer$name;

  TRes call({
    List<Query$fetchPromotions$service_provider_offer$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$fetchPromotions$service_provider_offer$name$translations> Function(
              Iterable<
                  CopyWith$Query$fetchPromotions$service_provider_offer$name$translations<
                      Query$fetchPromotions$service_provider_offer$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$fetchPromotions$service_provider_offer$name<TRes>
    implements
        CopyWith$Query$fetchPromotions$service_provider_offer$name<TRes> {
  _CopyWithImpl$Query$fetchPromotions$service_provider_offer$name(
    this._instance,
    this._then,
  );

  final Query$fetchPromotions$service_provider_offer$name _instance;

  final TRes Function(Query$fetchPromotions$service_provider_offer$name) _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$fetchPromotions$service_provider_offer$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$fetchPromotions$service_provider_offer$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$fetchPromotions$service_provider_offer$name$translations> Function(
                  Iterable<
                      CopyWith$Query$fetchPromotions$service_provider_offer$name$translations<
                          Query$fetchPromotions$service_provider_offer$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$fetchPromotions$service_provider_offer$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$fetchPromotions$service_provider_offer$name<TRes>
    implements
        CopyWith$Query$fetchPromotions$service_provider_offer$name<TRes> {
  _CopyWithStubImpl$Query$fetchPromotions$service_provider_offer$name(
      this._res);

  TRes _res;

  call({
    List<Query$fetchPromotions$service_provider_offer$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$fetchPromotions$service_provider_offer$name$translations {
  Query$fetchPromotions$service_provider_offer$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$fetchPromotions$service_provider_offer$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$fetchPromotions$service_provider_offer$name$translations(
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
            is Query$fetchPromotions$service_provider_offer$name$translations) ||
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

extension UtilityExtension$Query$fetchPromotions$service_provider_offer$name$translations
    on Query$fetchPromotions$service_provider_offer$name$translations {
  CopyWith$Query$fetchPromotions$service_provider_offer$name$translations<
          Query$fetchPromotions$service_provider_offer$name$translations>
      get copyWith =>
          CopyWith$Query$fetchPromotions$service_provider_offer$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetchPromotions$service_provider_offer$name$translations<
    TRes> {
  factory CopyWith$Query$fetchPromotions$service_provider_offer$name$translations(
    Query$fetchPromotions$service_provider_offer$name$translations instance,
    TRes Function(
            Query$fetchPromotions$service_provider_offer$name$translations)
        then,
  ) = _CopyWithImpl$Query$fetchPromotions$service_provider_offer$name$translations;

  factory CopyWith$Query$fetchPromotions$service_provider_offer$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetchPromotions$service_provider_offer$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$fetchPromotions$service_provider_offer$name$translations<
        TRes>
    implements
        CopyWith$Query$fetchPromotions$service_provider_offer$name$translations<
            TRes> {
  _CopyWithImpl$Query$fetchPromotions$service_provider_offer$name$translations(
    this._instance,
    this._then,
  );

  final Query$fetchPromotions$service_provider_offer$name$translations
      _instance;

  final TRes Function(
      Query$fetchPromotions$service_provider_offer$name$translations) _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$fetchPromotions$service_provider_offer$name$translations(
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

class _CopyWithStubImpl$Query$fetchPromotions$service_provider_offer$name$translations<
        TRes>
    implements
        CopyWith$Query$fetchPromotions$service_provider_offer$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$fetchPromotions$service_provider_offer$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$fetch_subscribed_promotions {
  factory Variables$Query$fetch_subscribed_promotions({
    int? customer_id,
    int? limit,
    int? offset,
  }) =>
      Variables$Query$fetch_subscribed_promotions._({
        if (customer_id != null) r'customer_id': customer_id,
        if (limit != null) r'limit': limit,
        if (offset != null) r'offset': offset,
      });

  Variables$Query$fetch_subscribed_promotions._(this._$data);

  factory Variables$Query$fetch_subscribed_promotions.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('customer_id')) {
      final l$customer_id = data['customer_id'];
      result$data['customer_id'] = (l$customer_id as int?);
    }
    if (data.containsKey('limit')) {
      final l$limit = data['limit'];
      result$data['limit'] = (l$limit as int?);
    }
    if (data.containsKey('offset')) {
      final l$offset = data['offset'];
      result$data['offset'] = (l$offset as int?);
    }
    return Variables$Query$fetch_subscribed_promotions._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get customer_id => (_$data['customer_id'] as int?);
  int? get limit => (_$data['limit'] as int?);
  int? get offset => (_$data['offset'] as int?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('customer_id')) {
      final l$customer_id = customer_id;
      result$data['customer_id'] = l$customer_id;
    }
    if (_$data.containsKey('limit')) {
      final l$limit = limit;
      result$data['limit'] = l$limit;
    }
    if (_$data.containsKey('offset')) {
      final l$offset = offset;
      result$data['offset'] = l$offset;
    }
    return result$data;
  }

  CopyWith$Variables$Query$fetch_subscribed_promotions<
          Variables$Query$fetch_subscribed_promotions>
      get copyWith => CopyWith$Variables$Query$fetch_subscribed_promotions(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$fetch_subscribed_promotions) ||
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
    return true;
  }

  @override
  int get hashCode {
    final l$customer_id = customer_id;
    final l$limit = limit;
    final l$offset = offset;
    return Object.hashAll([
      _$data.containsKey('customer_id') ? l$customer_id : const {},
      _$data.containsKey('limit') ? l$limit : const {},
      _$data.containsKey('offset') ? l$offset : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$fetch_subscribed_promotions<TRes> {
  factory CopyWith$Variables$Query$fetch_subscribed_promotions(
    Variables$Query$fetch_subscribed_promotions instance,
    TRes Function(Variables$Query$fetch_subscribed_promotions) then,
  ) = _CopyWithImpl$Variables$Query$fetch_subscribed_promotions;

  factory CopyWith$Variables$Query$fetch_subscribed_promotions.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$fetch_subscribed_promotions;

  TRes call({
    int? customer_id,
    int? limit,
    int? offset,
  });
}

class _CopyWithImpl$Variables$Query$fetch_subscribed_promotions<TRes>
    implements CopyWith$Variables$Query$fetch_subscribed_promotions<TRes> {
  _CopyWithImpl$Variables$Query$fetch_subscribed_promotions(
    this._instance,
    this._then,
  );

  final Variables$Query$fetch_subscribed_promotions _instance;

  final TRes Function(Variables$Query$fetch_subscribed_promotions) _then;

  static const _undefined = {};

  TRes call({
    Object? customer_id = _undefined,
    Object? limit = _undefined,
    Object? offset = _undefined,
  }) =>
      _then(Variables$Query$fetch_subscribed_promotions._({
        ..._instance._$data,
        if (customer_id != _undefined) 'customer_id': (customer_id as int?),
        if (limit != _undefined) 'limit': (limit as int?),
        if (offset != _undefined) 'offset': (offset as int?),
      }));
}

class _CopyWithStubImpl$Variables$Query$fetch_subscribed_promotions<TRes>
    implements CopyWith$Variables$Query$fetch_subscribed_promotions<TRes> {
  _CopyWithStubImpl$Variables$Query$fetch_subscribed_promotions(this._res);

  TRes _res;

  call({
    int? customer_id,
    int? limit,
    int? offset,
  }) =>
      _res;
}

class Query$fetch_subscribed_promotions {
  Query$fetch_subscribed_promotions({
    required this.service_provider_offer,
    required this.$__typename,
  });

  factory Query$fetch_subscribed_promotions.fromJson(
      Map<String, dynamic> json) {
    final l$service_provider_offer = json['service_provider_offer'];
    final l$$__typename = json['__typename'];
    return Query$fetch_subscribed_promotions(
      service_provider_offer: (l$service_provider_offer as List<dynamic>)
          .map((e) =>
              Query$fetch_subscribed_promotions$service_provider_offer.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$fetch_subscribed_promotions$service_provider_offer>
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
    if (!(other is Query$fetch_subscribed_promotions) ||
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

extension UtilityExtension$Query$fetch_subscribed_promotions
    on Query$fetch_subscribed_promotions {
  CopyWith$Query$fetch_subscribed_promotions<Query$fetch_subscribed_promotions>
      get copyWith => CopyWith$Query$fetch_subscribed_promotions(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_subscribed_promotions<TRes> {
  factory CopyWith$Query$fetch_subscribed_promotions(
    Query$fetch_subscribed_promotions instance,
    TRes Function(Query$fetch_subscribed_promotions) then,
  ) = _CopyWithImpl$Query$fetch_subscribed_promotions;

  factory CopyWith$Query$fetch_subscribed_promotions.stub(TRes res) =
      _CopyWithStubImpl$Query$fetch_subscribed_promotions;

  TRes call({
    List<Query$fetch_subscribed_promotions$service_provider_offer>?
        service_provider_offer,
    String? $__typename,
  });
  TRes service_provider_offer(
      Iterable<Query$fetch_subscribed_promotions$service_provider_offer> Function(
              Iterable<
                  CopyWith$Query$fetch_subscribed_promotions$service_provider_offer<
                      Query$fetch_subscribed_promotions$service_provider_offer>>)
          _fn);
}

class _CopyWithImpl$Query$fetch_subscribed_promotions<TRes>
    implements CopyWith$Query$fetch_subscribed_promotions<TRes> {
  _CopyWithImpl$Query$fetch_subscribed_promotions(
    this._instance,
    this._then,
  );

  final Query$fetch_subscribed_promotions _instance;

  final TRes Function(Query$fetch_subscribed_promotions) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_offer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$fetch_subscribed_promotions(
        service_provider_offer: service_provider_offer == _undefined ||
                service_provider_offer == null
            ? _instance.service_provider_offer
            : (service_provider_offer as List<
                Query$fetch_subscribed_promotions$service_provider_offer>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes service_provider_offer(
          Iterable<Query$fetch_subscribed_promotions$service_provider_offer> Function(
                  Iterable<
                      CopyWith$Query$fetch_subscribed_promotions$service_provider_offer<
                          Query$fetch_subscribed_promotions$service_provider_offer>>)
              _fn) =>
      call(
          service_provider_offer: _fn(_instance.service_provider_offer.map((e) =>
              CopyWith$Query$fetch_subscribed_promotions$service_provider_offer(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$fetch_subscribed_promotions<TRes>
    implements CopyWith$Query$fetch_subscribed_promotions<TRes> {
  _CopyWithStubImpl$Query$fetch_subscribed_promotions(this._res);

  TRes _res;

  call({
    List<Query$fetch_subscribed_promotions$service_provider_offer>?
        service_provider_offer,
    String? $__typename,
  }) =>
      _res;
  service_provider_offer(_fn) => _res;
}

const documentNodeQueryfetch_subscribed_promotions = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'fetch_subscribed_promotions'),
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
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'service_provider_offer'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'limit'),
            value: VariableNode(name: NameNode(value: 'limit')),
          ),
          ArgumentNode(
            name: NameNode(value: 'offset'),
            value: VariableNode(name: NameNode(value: 'offset')),
          ),
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: '_or'),
                value: ListValueNode(values: [
                  ObjectValueNode(fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'business'),
                      value: ObjectValueNode(fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'subscribers'),
                          value: ObjectValueNode(fields: [
                            ObjectFieldNode(
                              name: NameNode(value: 'customer_id'),
                              value: ObjectValueNode(fields: [
                                ObjectFieldNode(
                                  name: NameNode(value: '_eq'),
                                  value: VariableNode(
                                      name: NameNode(value: 'customer_id')),
                                )
                              ]),
                            )
                          ]),
                        )
                      ]),
                    )
                  ]),
                  ObjectValueNode(fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'laundry'),
                      value: ObjectValueNode(fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'subscribers'),
                          value: ObjectValueNode(fields: [
                            ObjectFieldNode(
                              name: NameNode(value: 'customer_id'),
                              value: ObjectValueNode(fields: [
                                ObjectFieldNode(
                                  name: NameNode(value: '_eq'),
                                  value: VariableNode(
                                      name: NameNode(value: 'customer_id')),
                                )
                              ]),
                            )
                          ]),
                        )
                      ]),
                    )
                  ]),
                  ObjectValueNode(fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'delivery_company'),
                      value: ObjectValueNode(fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'subscribers'),
                          value: ObjectValueNode(fields: [
                            ObjectFieldNode(
                              name: NameNode(value: 'customer_id'),
                              value: ObjectValueNode(fields: [
                                ObjectFieldNode(
                                  name: NameNode(value: '_eq'),
                                  value: VariableNode(
                                      name: NameNode(value: 'customer_id')),
                                )
                              ]),
                            )
                          ]),
                        )
                      ]),
                    )
                  ]),
                  ObjectValueNode(fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'restaurant'),
                      value: ObjectValueNode(fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'subscribers'),
                          value: ObjectValueNode(fields: [
                            ObjectFieldNode(
                              name: NameNode(value: 'customer_id'),
                              value: ObjectValueNode(fields: [
                                ObjectFieldNode(
                                  name: NameNode(value: '_eq'),
                                  value: VariableNode(
                                      name: NameNode(value: 'customer_id')),
                                )
                              ]),
                            )
                          ]),
                        )
                      ]),
                    )
                  ]),
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'offer_type'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: StringValueNode(
                      value: 'promotion',
                      isBlock: false,
                    ),
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
            name: NameNode(value: 'restaurant'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'details'),
                alias: null,
                arguments: [],
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
                    name: NameNode(value: 'image'),
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
            name: NameNode(value: 'laundry'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'details'),
                alias: null,
                arguments: [],
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
                    name: NameNode(value: 'image'),
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
            name: NameNode(value: 'delivery_company'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'details'),
                alias: null,
                arguments: [],
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
                    name: NameNode(value: 'image'),
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
            name: NameNode(value: 'business'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'details'),
                alias: null,
                arguments: [],
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
                    name: NameNode(value: 'image'),
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
Query$fetch_subscribed_promotions _parserFn$Query$fetch_subscribed_promotions(
        Map<String, dynamic> data) =>
    Query$fetch_subscribed_promotions.fromJson(data);

class Options$Query$fetch_subscribed_promotions
    extends graphql.QueryOptions<Query$fetch_subscribed_promotions> {
  Options$Query$fetch_subscribed_promotions({
    String? operationName,
    Variables$Query$fetch_subscribed_promotions? variables,
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
          document: documentNodeQueryfetch_subscribed_promotions,
          parserFn: _parserFn$Query$fetch_subscribed_promotions,
        );
}

class WatchOptions$Query$fetch_subscribed_promotions
    extends graphql.WatchQueryOptions<Query$fetch_subscribed_promotions> {
  WatchOptions$Query$fetch_subscribed_promotions({
    String? operationName,
    Variables$Query$fetch_subscribed_promotions? variables,
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
          document: documentNodeQueryfetch_subscribed_promotions,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$fetch_subscribed_promotions,
        );
}

class FetchMoreOptions$Query$fetch_subscribed_promotions
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$fetch_subscribed_promotions({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$fetch_subscribed_promotions? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQueryfetch_subscribed_promotions,
        );
}

extension ClientExtension$Query$fetch_subscribed_promotions
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$fetch_subscribed_promotions>>
      query$fetch_subscribed_promotions(
              [Options$Query$fetch_subscribed_promotions? options]) async =>
          await this
              .query(options ?? Options$Query$fetch_subscribed_promotions());
  graphql.ObservableQuery<Query$fetch_subscribed_promotions>
      watchQuery$fetch_subscribed_promotions(
              [WatchOptions$Query$fetch_subscribed_promotions? options]) =>
          this.watchQuery(
              options ?? WatchOptions$Query$fetch_subscribed_promotions());
  void writeQuery$fetch_subscribed_promotions({
    required Query$fetch_subscribed_promotions data,
    Variables$Query$fetch_subscribed_promotions? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryfetch_subscribed_promotions),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$fetch_subscribed_promotions? readQuery$fetch_subscribed_promotions({
    Variables$Query$fetch_subscribed_promotions? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryfetch_subscribed_promotions),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$fetch_subscribed_promotions.fromJson(result);
  }
}

class Query$fetch_subscribed_promotions$service_provider_offer {
  Query$fetch_subscribed_promotions$service_provider_offer({
    required this.id,
    required this.details,
    required this.name,
    required this.service_provider_id,
    required this.service_provider_type,
    this.restaurant,
    this.laundry,
    this.delivery_company,
    this.business,
    required this.$__typename,
  });

  factory Query$fetch_subscribed_promotions$service_provider_offer.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$details = json['details'];
    final l$name = json['name'];
    final l$service_provider_id = json['service_provider_id'];
    final l$service_provider_type = json['service_provider_type'];
    final l$restaurant = json['restaurant'];
    final l$laundry = json['laundry'];
    final l$delivery_company = json['delivery_company'];
    final l$business = json['business'];
    final l$$__typename = json['__typename'];
    return Query$fetch_subscribed_promotions$service_provider_offer(
      id: (l$id as int),
      details: mapFromJson(l$details),
      name: Query$fetch_subscribed_promotions$service_provider_offer$name
          .fromJson((l$name as Map<String, dynamic>)),
      service_provider_id: (l$service_provider_id as int),
      service_provider_type: (l$service_provider_type as String),
      restaurant: l$restaurant == null
          ? null
          : Query$fetch_subscribed_promotions$service_provider_offer$restaurant
              .fromJson((l$restaurant as Map<String, dynamic>)),
      laundry: l$laundry == null
          ? null
          : Query$fetch_subscribed_promotions$service_provider_offer$laundry
              .fromJson((l$laundry as Map<String, dynamic>)),
      delivery_company: l$delivery_company == null
          ? null
          : Query$fetch_subscribed_promotions$service_provider_offer$delivery_company
              .fromJson((l$delivery_company as Map<String, dynamic>)),
      business: l$business == null
          ? null
          : Query$fetch_subscribed_promotions$service_provider_offer$business
              .fromJson((l$business as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final dynamic details;

  final Query$fetch_subscribed_promotions$service_provider_offer$name name;

  final int service_provider_id;

  final String service_provider_type;

  final Query$fetch_subscribed_promotions$service_provider_offer$restaurant?
      restaurant;

  final Query$fetch_subscribed_promotions$service_provider_offer$laundry?
      laundry;

  final Query$fetch_subscribed_promotions$service_provider_offer$delivery_company?
      delivery_company;

  final Query$fetch_subscribed_promotions$service_provider_offer$business?
      business;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$details = details;
    _resultData['details'] = mapToJson(l$details);
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$service_provider_id = service_provider_id;
    _resultData['service_provider_id'] = l$service_provider_id;
    final l$service_provider_type = service_provider_type;
    _resultData['service_provider_type'] = l$service_provider_type;
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant?.toJson();
    final l$laundry = laundry;
    _resultData['laundry'] = l$laundry?.toJson();
    final l$delivery_company = delivery_company;
    _resultData['delivery_company'] = l$delivery_company?.toJson();
    final l$business = business;
    _resultData['business'] = l$business?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$details = details;
    final l$name = name;
    final l$service_provider_id = service_provider_id;
    final l$service_provider_type = service_provider_type;
    final l$restaurant = restaurant;
    final l$laundry = laundry;
    final l$delivery_company = delivery_company;
    final l$business = business;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$details,
      l$name,
      l$service_provider_id,
      l$service_provider_type,
      l$restaurant,
      l$laundry,
      l$delivery_company,
      l$business,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$fetch_subscribed_promotions$service_provider_offer) ||
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
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (l$restaurant != lOther$restaurant) {
      return false;
    }
    final l$laundry = laundry;
    final lOther$laundry = other.laundry;
    if (l$laundry != lOther$laundry) {
      return false;
    }
    final l$delivery_company = delivery_company;
    final lOther$delivery_company = other.delivery_company;
    if (l$delivery_company != lOther$delivery_company) {
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

extension UtilityExtension$Query$fetch_subscribed_promotions$service_provider_offer
    on Query$fetch_subscribed_promotions$service_provider_offer {
  CopyWith$Query$fetch_subscribed_promotions$service_provider_offer<
          Query$fetch_subscribed_promotions$service_provider_offer>
      get copyWith =>
          CopyWith$Query$fetch_subscribed_promotions$service_provider_offer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_subscribed_promotions$service_provider_offer<
    TRes> {
  factory CopyWith$Query$fetch_subscribed_promotions$service_provider_offer(
    Query$fetch_subscribed_promotions$service_provider_offer instance,
    TRes Function(Query$fetch_subscribed_promotions$service_provider_offer)
        then,
  ) = _CopyWithImpl$Query$fetch_subscribed_promotions$service_provider_offer;

  factory CopyWith$Query$fetch_subscribed_promotions$service_provider_offer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_subscribed_promotions$service_provider_offer;

  TRes call({
    int? id,
    dynamic? details,
    Query$fetch_subscribed_promotions$service_provider_offer$name? name,
    int? service_provider_id,
    String? service_provider_type,
    Query$fetch_subscribed_promotions$service_provider_offer$restaurant?
        restaurant,
    Query$fetch_subscribed_promotions$service_provider_offer$laundry? laundry,
    Query$fetch_subscribed_promotions$service_provider_offer$delivery_company?
        delivery_company,
    Query$fetch_subscribed_promotions$service_provider_offer$business? business,
    String? $__typename,
  });
  CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$name<TRes>
      get name;
  CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$restaurant<
      TRes> get restaurant;
  CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$laundry<
      TRes> get laundry;
  CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$delivery_company<
      TRes> get delivery_company;
  CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$business<
      TRes> get business;
}

class _CopyWithImpl$Query$fetch_subscribed_promotions$service_provider_offer<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_promotions$service_provider_offer<
            TRes> {
  _CopyWithImpl$Query$fetch_subscribed_promotions$service_provider_offer(
    this._instance,
    this._then,
  );

  final Query$fetch_subscribed_promotions$service_provider_offer _instance;

  final TRes Function(Query$fetch_subscribed_promotions$service_provider_offer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? details = _undefined,
    Object? name = _undefined,
    Object? service_provider_id = _undefined,
    Object? service_provider_type = _undefined,
    Object? restaurant = _undefined,
    Object? laundry = _undefined,
    Object? delivery_company = _undefined,
    Object? business = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$fetch_subscribed_promotions$service_provider_offer(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        details: details == _undefined || details == null
            ? _instance.details
            : (details as dynamic),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Query$fetch_subscribed_promotions$service_provider_offer$name),
        service_provider_id:
            service_provider_id == _undefined || service_provider_id == null
                ? _instance.service_provider_id
                : (service_provider_id as int),
        service_provider_type:
            service_provider_type == _undefined || service_provider_type == null
                ? _instance.service_provider_type
                : (service_provider_type as String),
        restaurant: restaurant == _undefined
            ? _instance.restaurant
            : (restaurant
                as Query$fetch_subscribed_promotions$service_provider_offer$restaurant?),
        laundry: laundry == _undefined
            ? _instance.laundry
            : (laundry
                as Query$fetch_subscribed_promotions$service_provider_offer$laundry?),
        delivery_company: delivery_company == _undefined
            ? _instance.delivery_company
            : (delivery_company
                as Query$fetch_subscribed_promotions$service_provider_offer$delivery_company?),
        business: business == _undefined
            ? _instance.business
            : (business
                as Query$fetch_subscribed_promotions$service_provider_offer$business?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$name<TRes>
      get name {
    final local$name = _instance.name;
    return CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$name(
        local$name, (e) => call(name: e));
  }

  CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$restaurant<
      TRes> get restaurant {
    final local$restaurant = _instance.restaurant;
    return local$restaurant == null
        ? CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$restaurant
            .stub(_then(_instance))
        : CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$restaurant(
            local$restaurant, (e) => call(restaurant: e));
  }

  CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$laundry<
      TRes> get laundry {
    final local$laundry = _instance.laundry;
    return local$laundry == null
        ? CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$laundry
            .stub(_then(_instance))
        : CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$laundry(
            local$laundry, (e) => call(laundry: e));
  }

  CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$delivery_company<
      TRes> get delivery_company {
    final local$delivery_company = _instance.delivery_company;
    return local$delivery_company == null
        ? CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$delivery_company
            .stub(_then(_instance))
        : CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$delivery_company(
            local$delivery_company, (e) => call(delivery_company: e));
  }

  CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$business<
      TRes> get business {
    final local$business = _instance.business;
    return local$business == null
        ? CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$business
            .stub(_then(_instance))
        : CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$business(
            local$business, (e) => call(business: e));
  }
}

class _CopyWithStubImpl$Query$fetch_subscribed_promotions$service_provider_offer<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_promotions$service_provider_offer<
            TRes> {
  _CopyWithStubImpl$Query$fetch_subscribed_promotions$service_provider_offer(
      this._res);

  TRes _res;

  call({
    int? id,
    dynamic? details,
    Query$fetch_subscribed_promotions$service_provider_offer$name? name,
    int? service_provider_id,
    String? service_provider_type,
    Query$fetch_subscribed_promotions$service_provider_offer$restaurant?
        restaurant,
    Query$fetch_subscribed_promotions$service_provider_offer$laundry? laundry,
    Query$fetch_subscribed_promotions$service_provider_offer$delivery_company?
        delivery_company,
    Query$fetch_subscribed_promotions$service_provider_offer$business? business,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$name<TRes>
      get name =>
          CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$name
              .stub(_res);
  CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$restaurant<
          TRes>
      get restaurant =>
          CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$restaurant
              .stub(_res);
  CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$laundry<
          TRes>
      get laundry =>
          CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$laundry
              .stub(_res);
  CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$delivery_company<
          TRes>
      get delivery_company =>
          CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$delivery_company
              .stub(_res);
  CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$business<
          TRes>
      get business =>
          CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$business
              .stub(_res);
}

class Query$fetch_subscribed_promotions$service_provider_offer$name {
  Query$fetch_subscribed_promotions$service_provider_offer$name({
    required this.id,
    required this.translations,
    required this.$__typename,
  });

  factory Query$fetch_subscribed_promotions$service_provider_offer$name.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$fetch_subscribed_promotions$service_provider_offer$name(
      id: (l$id as int),
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$fetch_subscribed_promotions$service_provider_offer$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final List<
          Query$fetch_subscribed_promotions$service_provider_offer$name$translations>
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
            is Query$fetch_subscribed_promotions$service_provider_offer$name) ||
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

extension UtilityExtension$Query$fetch_subscribed_promotions$service_provider_offer$name
    on Query$fetch_subscribed_promotions$service_provider_offer$name {
  CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$name<
          Query$fetch_subscribed_promotions$service_provider_offer$name>
      get copyWith =>
          CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$name<
    TRes> {
  factory CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$name(
    Query$fetch_subscribed_promotions$service_provider_offer$name instance,
    TRes Function(Query$fetch_subscribed_promotions$service_provider_offer$name)
        then,
  ) = _CopyWithImpl$Query$fetch_subscribed_promotions$service_provider_offer$name;

  factory CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_subscribed_promotions$service_provider_offer$name;

  TRes call({
    int? id,
    List<Query$fetch_subscribed_promotions$service_provider_offer$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$fetch_subscribed_promotions$service_provider_offer$name$translations> Function(
              Iterable<
                  CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$name$translations<
                      Query$fetch_subscribed_promotions$service_provider_offer$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$fetch_subscribed_promotions$service_provider_offer$name<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$name<
            TRes> {
  _CopyWithImpl$Query$fetch_subscribed_promotions$service_provider_offer$name(
    this._instance,
    this._then,
  );

  final Query$fetch_subscribed_promotions$service_provider_offer$name _instance;

  final TRes Function(
      Query$fetch_subscribed_promotions$service_provider_offer$name) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$fetch_subscribed_promotions$service_provider_offer$name(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$fetch_subscribed_promotions$service_provider_offer$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$fetch_subscribed_promotions$service_provider_offer$name$translations> Function(
                  Iterable<
                      CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$name$translations<
                          Query$fetch_subscribed_promotions$service_provider_offer$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$fetch_subscribed_promotions$service_provider_offer$name<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$name<
            TRes> {
  _CopyWithStubImpl$Query$fetch_subscribed_promotions$service_provider_offer$name(
      this._res);

  TRes _res;

  call({
    int? id,
    List<Query$fetch_subscribed_promotions$service_provider_offer$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$fetch_subscribed_promotions$service_provider_offer$name$translations {
  Query$fetch_subscribed_promotions$service_provider_offer$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$fetch_subscribed_promotions$service_provider_offer$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$fetch_subscribed_promotions$service_provider_offer$name$translations(
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
            is Query$fetch_subscribed_promotions$service_provider_offer$name$translations) ||
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

extension UtilityExtension$Query$fetch_subscribed_promotions$service_provider_offer$name$translations
    on Query$fetch_subscribed_promotions$service_provider_offer$name$translations {
  CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$name$translations<
          Query$fetch_subscribed_promotions$service_provider_offer$name$translations>
      get copyWith =>
          CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$name$translations<
    TRes> {
  factory CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$name$translations(
    Query$fetch_subscribed_promotions$service_provider_offer$name$translations
        instance,
    TRes Function(
            Query$fetch_subscribed_promotions$service_provider_offer$name$translations)
        then,
  ) = _CopyWithImpl$Query$fetch_subscribed_promotions$service_provider_offer$name$translations;

  factory CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_subscribed_promotions$service_provider_offer$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$fetch_subscribed_promotions$service_provider_offer$name$translations<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$name$translations<
            TRes> {
  _CopyWithImpl$Query$fetch_subscribed_promotions$service_provider_offer$name$translations(
    this._instance,
    this._then,
  );

  final Query$fetch_subscribed_promotions$service_provider_offer$name$translations
      _instance;

  final TRes Function(
          Query$fetch_subscribed_promotions$service_provider_offer$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$fetch_subscribed_promotions$service_provider_offer$name$translations(
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

class _CopyWithStubImpl$Query$fetch_subscribed_promotions$service_provider_offer$name$translations<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$fetch_subscribed_promotions$service_provider_offer$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$fetch_subscribed_promotions$service_provider_offer$restaurant {
  Query$fetch_subscribed_promotions$service_provider_offer$restaurant({
    this.details,
    required this.$__typename,
  });

  factory Query$fetch_subscribed_promotions$service_provider_offer$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$fetch_subscribed_promotions$service_provider_offer$restaurant(
      details: l$details == null
          ? null
          : Query$fetch_subscribed_promotions$service_provider_offer$restaurant$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$fetch_subscribed_promotions$service_provider_offer$restaurant$details?
      details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$details = details;
    _resultData['details'] = l$details?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$details = details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$details,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$fetch_subscribed_promotions$service_provider_offer$restaurant) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$fetch_subscribed_promotions$service_provider_offer$restaurant
    on Query$fetch_subscribed_promotions$service_provider_offer$restaurant {
  CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$restaurant<
          Query$fetch_subscribed_promotions$service_provider_offer$restaurant>
      get copyWith =>
          CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$restaurant<
    TRes> {
  factory CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$restaurant(
    Query$fetch_subscribed_promotions$service_provider_offer$restaurant
        instance,
    TRes Function(
            Query$fetch_subscribed_promotions$service_provider_offer$restaurant)
        then,
  ) = _CopyWithImpl$Query$fetch_subscribed_promotions$service_provider_offer$restaurant;

  factory CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_subscribed_promotions$service_provider_offer$restaurant;

  TRes call({
    Query$fetch_subscribed_promotions$service_provider_offer$restaurant$details?
        details,
    String? $__typename,
  });
  CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$restaurant$details<
      TRes> get details;
}

class _CopyWithImpl$Query$fetch_subscribed_promotions$service_provider_offer$restaurant<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$restaurant<
            TRes> {
  _CopyWithImpl$Query$fetch_subscribed_promotions$service_provider_offer$restaurant(
    this._instance,
    this._then,
  );

  final Query$fetch_subscribed_promotions$service_provider_offer$restaurant
      _instance;

  final TRes Function(
          Query$fetch_subscribed_promotions$service_provider_offer$restaurant)
      _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$fetch_subscribed_promotions$service_provider_offer$restaurant(
        details: details == _undefined
            ? _instance.details
            : (details
                as Query$fetch_subscribed_promotions$service_provider_offer$restaurant$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$restaurant$details<
      TRes> get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$restaurant$details
            .stub(_then(_instance))
        : CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$restaurant$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$fetch_subscribed_promotions$service_provider_offer$restaurant<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$restaurant<
            TRes> {
  _CopyWithStubImpl$Query$fetch_subscribed_promotions$service_provider_offer$restaurant(
      this._res);

  TRes _res;

  call({
    Query$fetch_subscribed_promotions$service_provider_offer$restaurant$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$restaurant$details<
          TRes>
      get details =>
          CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$restaurant$details
              .stub(_res);
}

class Query$fetch_subscribed_promotions$service_provider_offer$restaurant$details {
  Query$fetch_subscribed_promotions$service_provider_offer$restaurant$details({
    required this.name,
    required this.image,
    required this.$__typename,
  });

  factory Query$fetch_subscribed_promotions$service_provider_offer$restaurant$details.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$fetch_subscribed_promotions$service_provider_offer$restaurant$details(
      name: (l$name as String),
      image: (l$image as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String name;

  final String image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$image,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$fetch_subscribed_promotions$service_provider_offer$restaurant$details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
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

extension UtilityExtension$Query$fetch_subscribed_promotions$service_provider_offer$restaurant$details
    on Query$fetch_subscribed_promotions$service_provider_offer$restaurant$details {
  CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$restaurant$details<
          Query$fetch_subscribed_promotions$service_provider_offer$restaurant$details>
      get copyWith =>
          CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$restaurant$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$restaurant$details<
    TRes> {
  factory CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$restaurant$details(
    Query$fetch_subscribed_promotions$service_provider_offer$restaurant$details
        instance,
    TRes Function(
            Query$fetch_subscribed_promotions$service_provider_offer$restaurant$details)
        then,
  ) = _CopyWithImpl$Query$fetch_subscribed_promotions$service_provider_offer$restaurant$details;

  factory CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$restaurant$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_subscribed_promotions$service_provider_offer$restaurant$details;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$fetch_subscribed_promotions$service_provider_offer$restaurant$details<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$restaurant$details<
            TRes> {
  _CopyWithImpl$Query$fetch_subscribed_promotions$service_provider_offer$restaurant$details(
    this._instance,
    this._then,
  );

  final Query$fetch_subscribed_promotions$service_provider_offer$restaurant$details
      _instance;

  final TRes Function(
          Query$fetch_subscribed_promotions$service_provider_offer$restaurant$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$fetch_subscribed_promotions$service_provider_offer$restaurant$details(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$fetch_subscribed_promotions$service_provider_offer$restaurant$details<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$restaurant$details<
            TRes> {
  _CopyWithStubImpl$Query$fetch_subscribed_promotions$service_provider_offer$restaurant$details(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Query$fetch_subscribed_promotions$service_provider_offer$laundry {
  Query$fetch_subscribed_promotions$service_provider_offer$laundry({
    this.details,
    required this.$__typename,
  });

  factory Query$fetch_subscribed_promotions$service_provider_offer$laundry.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$fetch_subscribed_promotions$service_provider_offer$laundry(
      details: l$details == null
          ? null
          : Query$fetch_subscribed_promotions$service_provider_offer$laundry$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$fetch_subscribed_promotions$service_provider_offer$laundry$details?
      details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$details = details;
    _resultData['details'] = l$details?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$details = details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$details,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$fetch_subscribed_promotions$service_provider_offer$laundry) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$fetch_subscribed_promotions$service_provider_offer$laundry
    on Query$fetch_subscribed_promotions$service_provider_offer$laundry {
  CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$laundry<
          Query$fetch_subscribed_promotions$service_provider_offer$laundry>
      get copyWith =>
          CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$laundry(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$laundry<
    TRes> {
  factory CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$laundry(
    Query$fetch_subscribed_promotions$service_provider_offer$laundry instance,
    TRes Function(
            Query$fetch_subscribed_promotions$service_provider_offer$laundry)
        then,
  ) = _CopyWithImpl$Query$fetch_subscribed_promotions$service_provider_offer$laundry;

  factory CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$laundry.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_subscribed_promotions$service_provider_offer$laundry;

  TRes call({
    Query$fetch_subscribed_promotions$service_provider_offer$laundry$details?
        details,
    String? $__typename,
  });
  CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$laundry$details<
      TRes> get details;
}

class _CopyWithImpl$Query$fetch_subscribed_promotions$service_provider_offer$laundry<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$laundry<
            TRes> {
  _CopyWithImpl$Query$fetch_subscribed_promotions$service_provider_offer$laundry(
    this._instance,
    this._then,
  );

  final Query$fetch_subscribed_promotions$service_provider_offer$laundry
      _instance;

  final TRes Function(
      Query$fetch_subscribed_promotions$service_provider_offer$laundry) _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$fetch_subscribed_promotions$service_provider_offer$laundry(
        details: details == _undefined
            ? _instance.details
            : (details
                as Query$fetch_subscribed_promotions$service_provider_offer$laundry$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$laundry$details<
      TRes> get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$laundry$details
            .stub(_then(_instance))
        : CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$laundry$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$fetch_subscribed_promotions$service_provider_offer$laundry<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$laundry<
            TRes> {
  _CopyWithStubImpl$Query$fetch_subscribed_promotions$service_provider_offer$laundry(
      this._res);

  TRes _res;

  call({
    Query$fetch_subscribed_promotions$service_provider_offer$laundry$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$laundry$details<
          TRes>
      get details =>
          CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$laundry$details
              .stub(_res);
}

class Query$fetch_subscribed_promotions$service_provider_offer$laundry$details {
  Query$fetch_subscribed_promotions$service_provider_offer$laundry$details({
    required this.name,
    required this.image,
    required this.$__typename,
  });

  factory Query$fetch_subscribed_promotions$service_provider_offer$laundry$details.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$fetch_subscribed_promotions$service_provider_offer$laundry$details(
      name: (l$name as String),
      image: (l$image as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String name;

  final String image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$image,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$fetch_subscribed_promotions$service_provider_offer$laundry$details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
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

extension UtilityExtension$Query$fetch_subscribed_promotions$service_provider_offer$laundry$details
    on Query$fetch_subscribed_promotions$service_provider_offer$laundry$details {
  CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$laundry$details<
          Query$fetch_subscribed_promotions$service_provider_offer$laundry$details>
      get copyWith =>
          CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$laundry$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$laundry$details<
    TRes> {
  factory CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$laundry$details(
    Query$fetch_subscribed_promotions$service_provider_offer$laundry$details
        instance,
    TRes Function(
            Query$fetch_subscribed_promotions$service_provider_offer$laundry$details)
        then,
  ) = _CopyWithImpl$Query$fetch_subscribed_promotions$service_provider_offer$laundry$details;

  factory CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$laundry$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_subscribed_promotions$service_provider_offer$laundry$details;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$fetch_subscribed_promotions$service_provider_offer$laundry$details<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$laundry$details<
            TRes> {
  _CopyWithImpl$Query$fetch_subscribed_promotions$service_provider_offer$laundry$details(
    this._instance,
    this._then,
  );

  final Query$fetch_subscribed_promotions$service_provider_offer$laundry$details
      _instance;

  final TRes Function(
          Query$fetch_subscribed_promotions$service_provider_offer$laundry$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$fetch_subscribed_promotions$service_provider_offer$laundry$details(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$fetch_subscribed_promotions$service_provider_offer$laundry$details<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$laundry$details<
            TRes> {
  _CopyWithStubImpl$Query$fetch_subscribed_promotions$service_provider_offer$laundry$details(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Query$fetch_subscribed_promotions$service_provider_offer$delivery_company {
  Query$fetch_subscribed_promotions$service_provider_offer$delivery_company({
    this.details,
    required this.$__typename,
  });

  factory Query$fetch_subscribed_promotions$service_provider_offer$delivery_company.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$fetch_subscribed_promotions$service_provider_offer$delivery_company(
      details: l$details == null
          ? null
          : Query$fetch_subscribed_promotions$service_provider_offer$delivery_company$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$fetch_subscribed_promotions$service_provider_offer$delivery_company$details?
      details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$details = details;
    _resultData['details'] = l$details?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$details = details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$details,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$fetch_subscribed_promotions$service_provider_offer$delivery_company) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$fetch_subscribed_promotions$service_provider_offer$delivery_company
    on Query$fetch_subscribed_promotions$service_provider_offer$delivery_company {
  CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$delivery_company<
          Query$fetch_subscribed_promotions$service_provider_offer$delivery_company>
      get copyWith =>
          CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$delivery_company(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$delivery_company<
    TRes> {
  factory CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$delivery_company(
    Query$fetch_subscribed_promotions$service_provider_offer$delivery_company
        instance,
    TRes Function(
            Query$fetch_subscribed_promotions$service_provider_offer$delivery_company)
        then,
  ) = _CopyWithImpl$Query$fetch_subscribed_promotions$service_provider_offer$delivery_company;

  factory CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$delivery_company.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_subscribed_promotions$service_provider_offer$delivery_company;

  TRes call({
    Query$fetch_subscribed_promotions$service_provider_offer$delivery_company$details?
        details,
    String? $__typename,
  });
  CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$delivery_company$details<
      TRes> get details;
}

class _CopyWithImpl$Query$fetch_subscribed_promotions$service_provider_offer$delivery_company<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$delivery_company<
            TRes> {
  _CopyWithImpl$Query$fetch_subscribed_promotions$service_provider_offer$delivery_company(
    this._instance,
    this._then,
  );

  final Query$fetch_subscribed_promotions$service_provider_offer$delivery_company
      _instance;

  final TRes Function(
          Query$fetch_subscribed_promotions$service_provider_offer$delivery_company)
      _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$fetch_subscribed_promotions$service_provider_offer$delivery_company(
        details: details == _undefined
            ? _instance.details
            : (details
                as Query$fetch_subscribed_promotions$service_provider_offer$delivery_company$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$delivery_company$details<
      TRes> get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$delivery_company$details
            .stub(_then(_instance))
        : CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$delivery_company$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$fetch_subscribed_promotions$service_provider_offer$delivery_company<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$delivery_company<
            TRes> {
  _CopyWithStubImpl$Query$fetch_subscribed_promotions$service_provider_offer$delivery_company(
      this._res);

  TRes _res;

  call({
    Query$fetch_subscribed_promotions$service_provider_offer$delivery_company$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$delivery_company$details<
          TRes>
      get details =>
          CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$delivery_company$details
              .stub(_res);
}

class Query$fetch_subscribed_promotions$service_provider_offer$delivery_company$details {
  Query$fetch_subscribed_promotions$service_provider_offer$delivery_company$details({
    required this.name,
    required this.image,
    required this.$__typename,
  });

  factory Query$fetch_subscribed_promotions$service_provider_offer$delivery_company$details.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$fetch_subscribed_promotions$service_provider_offer$delivery_company$details(
      name: (l$name as String),
      image: (l$image as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String name;

  final String image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$image,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$fetch_subscribed_promotions$service_provider_offer$delivery_company$details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
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

extension UtilityExtension$Query$fetch_subscribed_promotions$service_provider_offer$delivery_company$details
    on Query$fetch_subscribed_promotions$service_provider_offer$delivery_company$details {
  CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$delivery_company$details<
          Query$fetch_subscribed_promotions$service_provider_offer$delivery_company$details>
      get copyWith =>
          CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$delivery_company$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$delivery_company$details<
    TRes> {
  factory CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$delivery_company$details(
    Query$fetch_subscribed_promotions$service_provider_offer$delivery_company$details
        instance,
    TRes Function(
            Query$fetch_subscribed_promotions$service_provider_offer$delivery_company$details)
        then,
  ) = _CopyWithImpl$Query$fetch_subscribed_promotions$service_provider_offer$delivery_company$details;

  factory CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$delivery_company$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_subscribed_promotions$service_provider_offer$delivery_company$details;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$fetch_subscribed_promotions$service_provider_offer$delivery_company$details<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$delivery_company$details<
            TRes> {
  _CopyWithImpl$Query$fetch_subscribed_promotions$service_provider_offer$delivery_company$details(
    this._instance,
    this._then,
  );

  final Query$fetch_subscribed_promotions$service_provider_offer$delivery_company$details
      _instance;

  final TRes Function(
          Query$fetch_subscribed_promotions$service_provider_offer$delivery_company$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$fetch_subscribed_promotions$service_provider_offer$delivery_company$details(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$fetch_subscribed_promotions$service_provider_offer$delivery_company$details<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$delivery_company$details<
            TRes> {
  _CopyWithStubImpl$Query$fetch_subscribed_promotions$service_provider_offer$delivery_company$details(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Query$fetch_subscribed_promotions$service_provider_offer$business {
  Query$fetch_subscribed_promotions$service_provider_offer$business({
    required this.details,
    required this.$__typename,
  });

  factory Query$fetch_subscribed_promotions$service_provider_offer$business.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$fetch_subscribed_promotions$service_provider_offer$business(
      details:
          Query$fetch_subscribed_promotions$service_provider_offer$business$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$fetch_subscribed_promotions$service_provider_offer$business$details
      details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$details = details;
    _resultData['details'] = l$details.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$details = details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$details,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$fetch_subscribed_promotions$service_provider_offer$business) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$fetch_subscribed_promotions$service_provider_offer$business
    on Query$fetch_subscribed_promotions$service_provider_offer$business {
  CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$business<
          Query$fetch_subscribed_promotions$service_provider_offer$business>
      get copyWith =>
          CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$business(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$business<
    TRes> {
  factory CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$business(
    Query$fetch_subscribed_promotions$service_provider_offer$business instance,
    TRes Function(
            Query$fetch_subscribed_promotions$service_provider_offer$business)
        then,
  ) = _CopyWithImpl$Query$fetch_subscribed_promotions$service_provider_offer$business;

  factory CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$business.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_subscribed_promotions$service_provider_offer$business;

  TRes call({
    Query$fetch_subscribed_promotions$service_provider_offer$business$details?
        details,
    String? $__typename,
  });
  CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$business$details<
      TRes> get details;
}

class _CopyWithImpl$Query$fetch_subscribed_promotions$service_provider_offer$business<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$business<
            TRes> {
  _CopyWithImpl$Query$fetch_subscribed_promotions$service_provider_offer$business(
    this._instance,
    this._then,
  );

  final Query$fetch_subscribed_promotions$service_provider_offer$business
      _instance;

  final TRes Function(
      Query$fetch_subscribed_promotions$service_provider_offer$business) _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$fetch_subscribed_promotions$service_provider_offer$business(
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Query$fetch_subscribed_promotions$service_provider_offer$business$details),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$business$details<
      TRes> get details {
    final local$details = _instance.details;
    return CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$business$details(
        local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$fetch_subscribed_promotions$service_provider_offer$business<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$business<
            TRes> {
  _CopyWithStubImpl$Query$fetch_subscribed_promotions$service_provider_offer$business(
      this._res);

  TRes _res;

  call({
    Query$fetch_subscribed_promotions$service_provider_offer$business$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$business$details<
          TRes>
      get details =>
          CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$business$details
              .stub(_res);
}

class Query$fetch_subscribed_promotions$service_provider_offer$business$details {
  Query$fetch_subscribed_promotions$service_provider_offer$business$details({
    required this.name,
    required this.image,
    required this.$__typename,
  });

  factory Query$fetch_subscribed_promotions$service_provider_offer$business$details.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$fetch_subscribed_promotions$service_provider_offer$business$details(
      name: (l$name as String),
      image: (l$image as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String name;

  final String image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$image,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$fetch_subscribed_promotions$service_provider_offer$business$details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
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

extension UtilityExtension$Query$fetch_subscribed_promotions$service_provider_offer$business$details
    on Query$fetch_subscribed_promotions$service_provider_offer$business$details {
  CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$business$details<
          Query$fetch_subscribed_promotions$service_provider_offer$business$details>
      get copyWith =>
          CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$business$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$business$details<
    TRes> {
  factory CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$business$details(
    Query$fetch_subscribed_promotions$service_provider_offer$business$details
        instance,
    TRes Function(
            Query$fetch_subscribed_promotions$service_provider_offer$business$details)
        then,
  ) = _CopyWithImpl$Query$fetch_subscribed_promotions$service_provider_offer$business$details;

  factory CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$business$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_subscribed_promotions$service_provider_offer$business$details;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$fetch_subscribed_promotions$service_provider_offer$business$details<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$business$details<
            TRes> {
  _CopyWithImpl$Query$fetch_subscribed_promotions$service_provider_offer$business$details(
    this._instance,
    this._then,
  );

  final Query$fetch_subscribed_promotions$service_provider_offer$business$details
      _instance;

  final TRes Function(
          Query$fetch_subscribed_promotions$service_provider_offer$business$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$fetch_subscribed_promotions$service_provider_offer$business$details(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$fetch_subscribed_promotions$service_provider_offer$business$details<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_promotions$service_provider_offer$business$details<
            TRes> {
  _CopyWithStubImpl$Query$fetch_subscribed_promotions$service_provider_offer$business$details(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$fetch_all_promotions_within_distance {
  factory Variables$Query$fetch_all_promotions_within_distance({
    required Geography from,
    required double distance,
    int? limit,
    int? offset,
  }) =>
      Variables$Query$fetch_all_promotions_within_distance._({
        r'from': from,
        r'distance': distance,
        if (limit != null) r'limit': limit,
        if (offset != null) r'offset': offset,
      });

  Variables$Query$fetch_all_promotions_within_distance._(this._$data);

  factory Variables$Query$fetch_all_promotions_within_distance.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$from = data['from'];
    result$data['from'] = geographyFromJson(l$from);
    final l$distance = data['distance'];
    result$data['distance'] = (l$distance as num).toDouble();
    if (data.containsKey('limit')) {
      final l$limit = data['limit'];
      result$data['limit'] = (l$limit as int?);
    }
    if (data.containsKey('offset')) {
      final l$offset = data['offset'];
      result$data['offset'] = (l$offset as int?);
    }
    return Variables$Query$fetch_all_promotions_within_distance._(result$data);
  }

  Map<String, dynamic> _$data;

  Geography get from => (_$data['from'] as Geography);
  double get distance => (_$data['distance'] as double);
  int? get limit => (_$data['limit'] as int?);
  int? get offset => (_$data['offset'] as int?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$from = from;
    result$data['from'] = geographyToJson(l$from);
    final l$distance = distance;
    result$data['distance'] = l$distance;
    if (_$data.containsKey('limit')) {
      final l$limit = limit;
      result$data['limit'] = l$limit;
    }
    if (_$data.containsKey('offset')) {
      final l$offset = offset;
      result$data['offset'] = l$offset;
    }
    return result$data;
  }

  CopyWith$Variables$Query$fetch_all_promotions_within_distance<
          Variables$Query$fetch_all_promotions_within_distance>
      get copyWith =>
          CopyWith$Variables$Query$fetch_all_promotions_within_distance(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$fetch_all_promotions_within_distance) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$from = from;
    final lOther$from = other.from;
    if (l$from != lOther$from) {
      return false;
    }
    final l$distance = distance;
    final lOther$distance = other.distance;
    if (l$distance != lOther$distance) {
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
    return true;
  }

  @override
  int get hashCode {
    final l$from = from;
    final l$distance = distance;
    final l$limit = limit;
    final l$offset = offset;
    return Object.hashAll([
      l$from,
      l$distance,
      _$data.containsKey('limit') ? l$limit : const {},
      _$data.containsKey('offset') ? l$offset : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$fetch_all_promotions_within_distance<
    TRes> {
  factory CopyWith$Variables$Query$fetch_all_promotions_within_distance(
    Variables$Query$fetch_all_promotions_within_distance instance,
    TRes Function(Variables$Query$fetch_all_promotions_within_distance) then,
  ) = _CopyWithImpl$Variables$Query$fetch_all_promotions_within_distance;

  factory CopyWith$Variables$Query$fetch_all_promotions_within_distance.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Query$fetch_all_promotions_within_distance;

  TRes call({
    Geography? from,
    double? distance,
    int? limit,
    int? offset,
  });
}

class _CopyWithImpl$Variables$Query$fetch_all_promotions_within_distance<TRes>
    implements
        CopyWith$Variables$Query$fetch_all_promotions_within_distance<TRes> {
  _CopyWithImpl$Variables$Query$fetch_all_promotions_within_distance(
    this._instance,
    this._then,
  );

  final Variables$Query$fetch_all_promotions_within_distance _instance;

  final TRes Function(Variables$Query$fetch_all_promotions_within_distance)
      _then;

  static const _undefined = {};

  TRes call({
    Object? from = _undefined,
    Object? distance = _undefined,
    Object? limit = _undefined,
    Object? offset = _undefined,
  }) =>
      _then(Variables$Query$fetch_all_promotions_within_distance._({
        ..._instance._$data,
        if (from != _undefined && from != null) 'from': (from as Geography),
        if (distance != _undefined && distance != null)
          'distance': (distance as double),
        if (limit != _undefined) 'limit': (limit as int?),
        if (offset != _undefined) 'offset': (offset as int?),
      }));
}

class _CopyWithStubImpl$Variables$Query$fetch_all_promotions_within_distance<
        TRes>
    implements
        CopyWith$Variables$Query$fetch_all_promotions_within_distance<TRes> {
  _CopyWithStubImpl$Variables$Query$fetch_all_promotions_within_distance(
      this._res);

  TRes _res;

  call({
    Geography? from,
    double? distance,
    int? limit,
    int? offset,
  }) =>
      _res;
}

class Query$fetch_all_promotions_within_distance {
  Query$fetch_all_promotions_within_distance({
    required this.service_provider_offer,
    required this.$__typename,
  });

  factory Query$fetch_all_promotions_within_distance.fromJson(
      Map<String, dynamic> json) {
    final l$service_provider_offer = json['service_provider_offer'];
    final l$$__typename = json['__typename'];
    return Query$fetch_all_promotions_within_distance(
      service_provider_offer: (l$service_provider_offer as List<dynamic>)
          .map((e) =>
              Query$fetch_all_promotions_within_distance$service_provider_offer
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$fetch_all_promotions_within_distance$service_provider_offer>
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
    if (!(other is Query$fetch_all_promotions_within_distance) ||
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

extension UtilityExtension$Query$fetch_all_promotions_within_distance
    on Query$fetch_all_promotions_within_distance {
  CopyWith$Query$fetch_all_promotions_within_distance<
          Query$fetch_all_promotions_within_distance>
      get copyWith => CopyWith$Query$fetch_all_promotions_within_distance(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_all_promotions_within_distance<TRes> {
  factory CopyWith$Query$fetch_all_promotions_within_distance(
    Query$fetch_all_promotions_within_distance instance,
    TRes Function(Query$fetch_all_promotions_within_distance) then,
  ) = _CopyWithImpl$Query$fetch_all_promotions_within_distance;

  factory CopyWith$Query$fetch_all_promotions_within_distance.stub(TRes res) =
      _CopyWithStubImpl$Query$fetch_all_promotions_within_distance;

  TRes call({
    List<Query$fetch_all_promotions_within_distance$service_provider_offer>?
        service_provider_offer,
    String? $__typename,
  });
  TRes service_provider_offer(
      Iterable<Query$fetch_all_promotions_within_distance$service_provider_offer> Function(
              Iterable<
                  CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer<
                      Query$fetch_all_promotions_within_distance$service_provider_offer>>)
          _fn);
}

class _CopyWithImpl$Query$fetch_all_promotions_within_distance<TRes>
    implements CopyWith$Query$fetch_all_promotions_within_distance<TRes> {
  _CopyWithImpl$Query$fetch_all_promotions_within_distance(
    this._instance,
    this._then,
  );

  final Query$fetch_all_promotions_within_distance _instance;

  final TRes Function(Query$fetch_all_promotions_within_distance) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_offer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$fetch_all_promotions_within_distance(
        service_provider_offer: service_provider_offer == _undefined ||
                service_provider_offer == null
            ? _instance.service_provider_offer
            : (service_provider_offer as List<
                Query$fetch_all_promotions_within_distance$service_provider_offer>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes service_provider_offer(
          Iterable<Query$fetch_all_promotions_within_distance$service_provider_offer> Function(
                  Iterable<
                      CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer<
                          Query$fetch_all_promotions_within_distance$service_provider_offer>>)
              _fn) =>
      call(
          service_provider_offer: _fn(_instance.service_provider_offer.map((e) =>
              CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$fetch_all_promotions_within_distance<TRes>
    implements CopyWith$Query$fetch_all_promotions_within_distance<TRes> {
  _CopyWithStubImpl$Query$fetch_all_promotions_within_distance(this._res);

  TRes _res;

  call({
    List<Query$fetch_all_promotions_within_distance$service_provider_offer>?
        service_provider_offer,
    String? $__typename,
  }) =>
      _res;
  service_provider_offer(_fn) => _res;
}

const documentNodeQueryfetch_all_promotions_within_distance =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'fetch_all_promotions_within_distance'),
    variableDefinitions: [
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
        variable: VariableNode(name: NameNode(value: 'distance')),
        type: NamedTypeNode(
          name: NameNode(value: 'Float'),
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
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'service_provider_offer'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'limit'),
            value: VariableNode(name: NameNode(value: 'limit')),
          ),
          ArgumentNode(
            name: NameNode(value: 'offset'),
            value: VariableNode(name: NameNode(value: 'offset')),
          ),
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: '_or'),
                value: ListValueNode(values: [
                  ObjectValueNode(fields: [
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
                                              name:
                                                  NameNode(value: 'distance')),
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
                    )
                  ]),
                  ObjectValueNode(fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'laundry'),
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
                                              name:
                                                  NameNode(value: 'distance')),
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
                    )
                  ]),
                  ObjectValueNode(fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'delivery_company'),
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
                                              name:
                                                  NameNode(value: 'distance')),
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
                    )
                  ]),
                  ObjectValueNode(fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'restaurant'),
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
                                              name:
                                                  NameNode(value: 'distance')),
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
                    )
                  ]),
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'offer_type'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: StringValueNode(
                      value: 'promotion',
                      isBlock: false,
                    ),
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
            name: NameNode(value: 'restaurant'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'details'),
                alias: null,
                arguments: [],
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
                    name: NameNode(value: 'image'),
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
            name: NameNode(value: 'laundry'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'details'),
                alias: null,
                arguments: [],
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
                    name: NameNode(value: 'image'),
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
            name: NameNode(value: 'delivery_company'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'details'),
                alias: null,
                arguments: [],
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
                    name: NameNode(value: 'image'),
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
            name: NameNode(value: 'business'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'details'),
                alias: null,
                arguments: [],
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
                    name: NameNode(value: 'image'),
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
Query$fetch_all_promotions_within_distance
    _parserFn$Query$fetch_all_promotions_within_distance(
            Map<String, dynamic> data) =>
        Query$fetch_all_promotions_within_distance.fromJson(data);

class Options$Query$fetch_all_promotions_within_distance
    extends graphql.QueryOptions<Query$fetch_all_promotions_within_distance> {
  Options$Query$fetch_all_promotions_within_distance({
    String? operationName,
    required Variables$Query$fetch_all_promotions_within_distance variables,
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
          document: documentNodeQueryfetch_all_promotions_within_distance,
          parserFn: _parserFn$Query$fetch_all_promotions_within_distance,
        );
}

class WatchOptions$Query$fetch_all_promotions_within_distance extends graphql
    .WatchQueryOptions<Query$fetch_all_promotions_within_distance> {
  WatchOptions$Query$fetch_all_promotions_within_distance({
    String? operationName,
    required Variables$Query$fetch_all_promotions_within_distance variables,
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
          document: documentNodeQueryfetch_all_promotions_within_distance,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$fetch_all_promotions_within_distance,
        );
}

class FetchMoreOptions$Query$fetch_all_promotions_within_distance
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$fetch_all_promotions_within_distance({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$fetch_all_promotions_within_distance variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryfetch_all_promotions_within_distance,
        );
}

extension ClientExtension$Query$fetch_all_promotions_within_distance
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$fetch_all_promotions_within_distance>>
      query$fetch_all_promotions_within_distance(
              Options$Query$fetch_all_promotions_within_distance
                  options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$fetch_all_promotions_within_distance>
      watchQuery$fetch_all_promotions_within_distance(
              WatchOptions$Query$fetch_all_promotions_within_distance
                  options) =>
          this.watchQuery(options);
  void writeQuery$fetch_all_promotions_within_distance({
    required Query$fetch_all_promotions_within_distance data,
    required Variables$Query$fetch_all_promotions_within_distance variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryfetch_all_promotions_within_distance),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$fetch_all_promotions_within_distance?
      readQuery$fetch_all_promotions_within_distance({
    required Variables$Query$fetch_all_promotions_within_distance variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryfetch_all_promotions_within_distance),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$fetch_all_promotions_within_distance.fromJson(result);
  }
}

class Query$fetch_all_promotions_within_distance$service_provider_offer {
  Query$fetch_all_promotions_within_distance$service_provider_offer({
    required this.id,
    required this.details,
    required this.name,
    required this.service_provider_id,
    required this.service_provider_type,
    this.restaurant,
    this.laundry,
    this.delivery_company,
    this.business,
    required this.$__typename,
  });

  factory Query$fetch_all_promotions_within_distance$service_provider_offer.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$details = json['details'];
    final l$name = json['name'];
    final l$service_provider_id = json['service_provider_id'];
    final l$service_provider_type = json['service_provider_type'];
    final l$restaurant = json['restaurant'];
    final l$laundry = json['laundry'];
    final l$delivery_company = json['delivery_company'];
    final l$business = json['business'];
    final l$$__typename = json['__typename'];
    return Query$fetch_all_promotions_within_distance$service_provider_offer(
      id: (l$id as int),
      details: mapFromJson(l$details),
      name:
          Query$fetch_all_promotions_within_distance$service_provider_offer$name
              .fromJson((l$name as Map<String, dynamic>)),
      service_provider_id: (l$service_provider_id as int),
      service_provider_type: (l$service_provider_type as String),
      restaurant: l$restaurant == null
          ? null
          : Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant
              .fromJson((l$restaurant as Map<String, dynamic>)),
      laundry: l$laundry == null
          ? null
          : Query$fetch_all_promotions_within_distance$service_provider_offer$laundry
              .fromJson((l$laundry as Map<String, dynamic>)),
      delivery_company: l$delivery_company == null
          ? null
          : Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company
              .fromJson((l$delivery_company as Map<String, dynamic>)),
      business: l$business == null
          ? null
          : Query$fetch_all_promotions_within_distance$service_provider_offer$business
              .fromJson((l$business as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final dynamic details;

  final Query$fetch_all_promotions_within_distance$service_provider_offer$name
      name;

  final int service_provider_id;

  final String service_provider_type;

  final Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant?
      restaurant;

  final Query$fetch_all_promotions_within_distance$service_provider_offer$laundry?
      laundry;

  final Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company?
      delivery_company;

  final Query$fetch_all_promotions_within_distance$service_provider_offer$business?
      business;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$details = details;
    _resultData['details'] = mapToJson(l$details);
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$service_provider_id = service_provider_id;
    _resultData['service_provider_id'] = l$service_provider_id;
    final l$service_provider_type = service_provider_type;
    _resultData['service_provider_type'] = l$service_provider_type;
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant?.toJson();
    final l$laundry = laundry;
    _resultData['laundry'] = l$laundry?.toJson();
    final l$delivery_company = delivery_company;
    _resultData['delivery_company'] = l$delivery_company?.toJson();
    final l$business = business;
    _resultData['business'] = l$business?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$details = details;
    final l$name = name;
    final l$service_provider_id = service_provider_id;
    final l$service_provider_type = service_provider_type;
    final l$restaurant = restaurant;
    final l$laundry = laundry;
    final l$delivery_company = delivery_company;
    final l$business = business;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$details,
      l$name,
      l$service_provider_id,
      l$service_provider_type,
      l$restaurant,
      l$laundry,
      l$delivery_company,
      l$business,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$fetch_all_promotions_within_distance$service_provider_offer) ||
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
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (l$restaurant != lOther$restaurant) {
      return false;
    }
    final l$laundry = laundry;
    final lOther$laundry = other.laundry;
    if (l$laundry != lOther$laundry) {
      return false;
    }
    final l$delivery_company = delivery_company;
    final lOther$delivery_company = other.delivery_company;
    if (l$delivery_company != lOther$delivery_company) {
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

extension UtilityExtension$Query$fetch_all_promotions_within_distance$service_provider_offer
    on Query$fetch_all_promotions_within_distance$service_provider_offer {
  CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer<
          Query$fetch_all_promotions_within_distance$service_provider_offer>
      get copyWith =>
          CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer<
    TRes> {
  factory CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer(
    Query$fetch_all_promotions_within_distance$service_provider_offer instance,
    TRes Function(
            Query$fetch_all_promotions_within_distance$service_provider_offer)
        then,
  ) = _CopyWithImpl$Query$fetch_all_promotions_within_distance$service_provider_offer;

  factory CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_all_promotions_within_distance$service_provider_offer;

  TRes call({
    int? id,
    dynamic? details,
    Query$fetch_all_promotions_within_distance$service_provider_offer$name?
        name,
    int? service_provider_id,
    String? service_provider_type,
    Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant?
        restaurant,
    Query$fetch_all_promotions_within_distance$service_provider_offer$laundry?
        laundry,
    Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company?
        delivery_company,
    Query$fetch_all_promotions_within_distance$service_provider_offer$business?
        business,
    String? $__typename,
  });
  CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$name<
      TRes> get name;
  CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant<
      TRes> get restaurant;
  CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$laundry<
      TRes> get laundry;
  CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company<
      TRes> get delivery_company;
  CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$business<
      TRes> get business;
}

class _CopyWithImpl$Query$fetch_all_promotions_within_distance$service_provider_offer<
        TRes>
    implements
        CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer<
            TRes> {
  _CopyWithImpl$Query$fetch_all_promotions_within_distance$service_provider_offer(
    this._instance,
    this._then,
  );

  final Query$fetch_all_promotions_within_distance$service_provider_offer
      _instance;

  final TRes Function(
      Query$fetch_all_promotions_within_distance$service_provider_offer) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? details = _undefined,
    Object? name = _undefined,
    Object? service_provider_id = _undefined,
    Object? service_provider_type = _undefined,
    Object? restaurant = _undefined,
    Object? laundry = _undefined,
    Object? delivery_company = _undefined,
    Object? business = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$fetch_all_promotions_within_distance$service_provider_offer(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        details: details == _undefined || details == null
            ? _instance.details
            : (details as dynamic),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Query$fetch_all_promotions_within_distance$service_provider_offer$name),
        service_provider_id:
            service_provider_id == _undefined || service_provider_id == null
                ? _instance.service_provider_id
                : (service_provider_id as int),
        service_provider_type:
            service_provider_type == _undefined || service_provider_type == null
                ? _instance.service_provider_type
                : (service_provider_type as String),
        restaurant: restaurant == _undefined
            ? _instance.restaurant
            : (restaurant
                as Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant?),
        laundry: laundry == _undefined
            ? _instance.laundry
            : (laundry
                as Query$fetch_all_promotions_within_distance$service_provider_offer$laundry?),
        delivery_company: delivery_company == _undefined
            ? _instance.delivery_company
            : (delivery_company
                as Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company?),
        business: business == _undefined
            ? _instance.business
            : (business
                as Query$fetch_all_promotions_within_distance$service_provider_offer$business?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$name<
      TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$name(
        local$name, (e) => call(name: e));
  }

  CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant<
      TRes> get restaurant {
    final local$restaurant = _instance.restaurant;
    return local$restaurant == null
        ? CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant
            .stub(_then(_instance))
        : CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant(
            local$restaurant, (e) => call(restaurant: e));
  }

  CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$laundry<
      TRes> get laundry {
    final local$laundry = _instance.laundry;
    return local$laundry == null
        ? CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$laundry
            .stub(_then(_instance))
        : CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$laundry(
            local$laundry, (e) => call(laundry: e));
  }

  CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company<
      TRes> get delivery_company {
    final local$delivery_company = _instance.delivery_company;
    return local$delivery_company == null
        ? CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company
            .stub(_then(_instance))
        : CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company(
            local$delivery_company, (e) => call(delivery_company: e));
  }

  CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$business<
      TRes> get business {
    final local$business = _instance.business;
    return local$business == null
        ? CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$business
            .stub(_then(_instance))
        : CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$business(
            local$business, (e) => call(business: e));
  }
}

class _CopyWithStubImpl$Query$fetch_all_promotions_within_distance$service_provider_offer<
        TRes>
    implements
        CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer<
            TRes> {
  _CopyWithStubImpl$Query$fetch_all_promotions_within_distance$service_provider_offer(
      this._res);

  TRes _res;

  call({
    int? id,
    dynamic? details,
    Query$fetch_all_promotions_within_distance$service_provider_offer$name?
        name,
    int? service_provider_id,
    String? service_provider_type,
    Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant?
        restaurant,
    Query$fetch_all_promotions_within_distance$service_provider_offer$laundry?
        laundry,
    Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company?
        delivery_company,
    Query$fetch_all_promotions_within_distance$service_provider_offer$business?
        business,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$name<
          TRes>
      get name =>
          CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$name
              .stub(_res);
  CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant<
          TRes>
      get restaurant =>
          CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant
              .stub(_res);
  CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$laundry<
          TRes>
      get laundry =>
          CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$laundry
              .stub(_res);
  CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company<
          TRes>
      get delivery_company =>
          CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company
              .stub(_res);
  CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$business<
          TRes>
      get business =>
          CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$business
              .stub(_res);
}

class Query$fetch_all_promotions_within_distance$service_provider_offer$name {
  Query$fetch_all_promotions_within_distance$service_provider_offer$name({
    required this.id,
    required this.translations,
    required this.$__typename,
  });

  factory Query$fetch_all_promotions_within_distance$service_provider_offer$name.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$fetch_all_promotions_within_distance$service_provider_offer$name(
      id: (l$id as int),
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$fetch_all_promotions_within_distance$service_provider_offer$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final List<
          Query$fetch_all_promotions_within_distance$service_provider_offer$name$translations>
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
            is Query$fetch_all_promotions_within_distance$service_provider_offer$name) ||
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

extension UtilityExtension$Query$fetch_all_promotions_within_distance$service_provider_offer$name
    on Query$fetch_all_promotions_within_distance$service_provider_offer$name {
  CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$name<
          Query$fetch_all_promotions_within_distance$service_provider_offer$name>
      get copyWith =>
          CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$name<
    TRes> {
  factory CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$name(
    Query$fetch_all_promotions_within_distance$service_provider_offer$name
        instance,
    TRes Function(
            Query$fetch_all_promotions_within_distance$service_provider_offer$name)
        then,
  ) = _CopyWithImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$name;

  factory CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$name;

  TRes call({
    int? id,
    List<Query$fetch_all_promotions_within_distance$service_provider_offer$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$fetch_all_promotions_within_distance$service_provider_offer$name$translations> Function(
              Iterable<
                  CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$name$translations<
                      Query$fetch_all_promotions_within_distance$service_provider_offer$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$name<
        TRes>
    implements
        CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$name<
            TRes> {
  _CopyWithImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$name(
    this._instance,
    this._then,
  );

  final Query$fetch_all_promotions_within_distance$service_provider_offer$name
      _instance;

  final TRes Function(
          Query$fetch_all_promotions_within_distance$service_provider_offer$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$fetch_all_promotions_within_distance$service_provider_offer$name(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$fetch_all_promotions_within_distance$service_provider_offer$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$fetch_all_promotions_within_distance$service_provider_offer$name$translations> Function(
                  Iterable<
                      CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$name$translations<
                          Query$fetch_all_promotions_within_distance$service_provider_offer$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$name<
        TRes>
    implements
        CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$name<
            TRes> {
  _CopyWithStubImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$name(
      this._res);

  TRes _res;

  call({
    int? id,
    List<Query$fetch_all_promotions_within_distance$service_provider_offer$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$fetch_all_promotions_within_distance$service_provider_offer$name$translations {
  Query$fetch_all_promotions_within_distance$service_provider_offer$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$fetch_all_promotions_within_distance$service_provider_offer$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$fetch_all_promotions_within_distance$service_provider_offer$name$translations(
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
            is Query$fetch_all_promotions_within_distance$service_provider_offer$name$translations) ||
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

extension UtilityExtension$Query$fetch_all_promotions_within_distance$service_provider_offer$name$translations
    on Query$fetch_all_promotions_within_distance$service_provider_offer$name$translations {
  CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$name$translations<
          Query$fetch_all_promotions_within_distance$service_provider_offer$name$translations>
      get copyWith =>
          CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$name$translations<
    TRes> {
  factory CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$name$translations(
    Query$fetch_all_promotions_within_distance$service_provider_offer$name$translations
        instance,
    TRes Function(
            Query$fetch_all_promotions_within_distance$service_provider_offer$name$translations)
        then,
  ) = _CopyWithImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$name$translations;

  factory CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$name$translations<
        TRes>
    implements
        CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$name$translations<
            TRes> {
  _CopyWithImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$name$translations(
    this._instance,
    this._then,
  );

  final Query$fetch_all_promotions_within_distance$service_provider_offer$name$translations
      _instance;

  final TRes Function(
          Query$fetch_all_promotions_within_distance$service_provider_offer$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$fetch_all_promotions_within_distance$service_provider_offer$name$translations(
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

class _CopyWithStubImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$name$translations<
        TRes>
    implements
        CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant {
  Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant({
    this.details,
    required this.$__typename,
  });

  factory Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant(
      details: l$details == null
          ? null
          : Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant$details?
      details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$details = details;
    _resultData['details'] = l$details?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$details = details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$details,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant
    on Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant {
  CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant<
          Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant>
      get copyWith =>
          CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant<
    TRes> {
  factory CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant(
    Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant
        instance,
    TRes Function(
            Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant)
        then,
  ) = _CopyWithImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant;

  factory CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant;

  TRes call({
    Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant$details?
        details,
    String? $__typename,
  });
  CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant$details<
      TRes> get details;
}

class _CopyWithImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant<
        TRes>
    implements
        CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant<
            TRes> {
  _CopyWithImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant(
    this._instance,
    this._then,
  );

  final Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant
      _instance;

  final TRes Function(
          Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant)
      _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant(
        details: details == _undefined
            ? _instance.details
            : (details
                as Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant$details<
      TRes> get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant$details
            .stub(_then(_instance))
        : CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant<
        TRes>
    implements
        CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant<
            TRes> {
  _CopyWithStubImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant(
      this._res);

  TRes _res;

  call({
    Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant$details<
          TRes>
      get details =>
          CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant$details
              .stub(_res);
}

class Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant$details {
  Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant$details({
    required this.name,
    required this.image,
    required this.$__typename,
  });

  factory Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant$details.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant$details(
      name: (l$name as String),
      image: (l$image as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String name;

  final String image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$image,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant$details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
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

extension UtilityExtension$Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant$details
    on Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant$details {
  CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant$details<
          Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant$details>
      get copyWith =>
          CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant$details<
    TRes> {
  factory CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant$details(
    Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant$details
        instance,
    TRes Function(
            Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant$details)
        then,
  ) = _CopyWithImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant$details;

  factory CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant$details;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant$details<
        TRes>
    implements
        CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant$details<
            TRes> {
  _CopyWithImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant$details(
    this._instance,
    this._then,
  );

  final Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant$details
      _instance;

  final TRes Function(
          Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant$details(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant$details<
        TRes>
    implements
        CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant$details<
            TRes> {
  _CopyWithStubImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$restaurant$details(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Query$fetch_all_promotions_within_distance$service_provider_offer$laundry {
  Query$fetch_all_promotions_within_distance$service_provider_offer$laundry({
    this.details,
    required this.$__typename,
  });

  factory Query$fetch_all_promotions_within_distance$service_provider_offer$laundry.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$fetch_all_promotions_within_distance$service_provider_offer$laundry(
      details: l$details == null
          ? null
          : Query$fetch_all_promotions_within_distance$service_provider_offer$laundry$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$fetch_all_promotions_within_distance$service_provider_offer$laundry$details?
      details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$details = details;
    _resultData['details'] = l$details?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$details = details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$details,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$fetch_all_promotions_within_distance$service_provider_offer$laundry) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$fetch_all_promotions_within_distance$service_provider_offer$laundry
    on Query$fetch_all_promotions_within_distance$service_provider_offer$laundry {
  CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$laundry<
          Query$fetch_all_promotions_within_distance$service_provider_offer$laundry>
      get copyWith =>
          CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$laundry(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$laundry<
    TRes> {
  factory CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$laundry(
    Query$fetch_all_promotions_within_distance$service_provider_offer$laundry
        instance,
    TRes Function(
            Query$fetch_all_promotions_within_distance$service_provider_offer$laundry)
        then,
  ) = _CopyWithImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$laundry;

  factory CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$laundry.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$laundry;

  TRes call({
    Query$fetch_all_promotions_within_distance$service_provider_offer$laundry$details?
        details,
    String? $__typename,
  });
  CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$laundry$details<
      TRes> get details;
}

class _CopyWithImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$laundry<
        TRes>
    implements
        CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$laundry<
            TRes> {
  _CopyWithImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$laundry(
    this._instance,
    this._then,
  );

  final Query$fetch_all_promotions_within_distance$service_provider_offer$laundry
      _instance;

  final TRes Function(
          Query$fetch_all_promotions_within_distance$service_provider_offer$laundry)
      _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$fetch_all_promotions_within_distance$service_provider_offer$laundry(
        details: details == _undefined
            ? _instance.details
            : (details
                as Query$fetch_all_promotions_within_distance$service_provider_offer$laundry$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$laundry$details<
      TRes> get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$laundry$details
            .stub(_then(_instance))
        : CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$laundry$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$laundry<
        TRes>
    implements
        CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$laundry<
            TRes> {
  _CopyWithStubImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$laundry(
      this._res);

  TRes _res;

  call({
    Query$fetch_all_promotions_within_distance$service_provider_offer$laundry$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$laundry$details<
          TRes>
      get details =>
          CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$laundry$details
              .stub(_res);
}

class Query$fetch_all_promotions_within_distance$service_provider_offer$laundry$details {
  Query$fetch_all_promotions_within_distance$service_provider_offer$laundry$details({
    required this.name,
    required this.image,
    required this.$__typename,
  });

  factory Query$fetch_all_promotions_within_distance$service_provider_offer$laundry$details.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$fetch_all_promotions_within_distance$service_provider_offer$laundry$details(
      name: (l$name as String),
      image: (l$image as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String name;

  final String image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$image,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$fetch_all_promotions_within_distance$service_provider_offer$laundry$details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
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

extension UtilityExtension$Query$fetch_all_promotions_within_distance$service_provider_offer$laundry$details
    on Query$fetch_all_promotions_within_distance$service_provider_offer$laundry$details {
  CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$laundry$details<
          Query$fetch_all_promotions_within_distance$service_provider_offer$laundry$details>
      get copyWith =>
          CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$laundry$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$laundry$details<
    TRes> {
  factory CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$laundry$details(
    Query$fetch_all_promotions_within_distance$service_provider_offer$laundry$details
        instance,
    TRes Function(
            Query$fetch_all_promotions_within_distance$service_provider_offer$laundry$details)
        then,
  ) = _CopyWithImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$laundry$details;

  factory CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$laundry$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$laundry$details;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$laundry$details<
        TRes>
    implements
        CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$laundry$details<
            TRes> {
  _CopyWithImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$laundry$details(
    this._instance,
    this._then,
  );

  final Query$fetch_all_promotions_within_distance$service_provider_offer$laundry$details
      _instance;

  final TRes Function(
          Query$fetch_all_promotions_within_distance$service_provider_offer$laundry$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$fetch_all_promotions_within_distance$service_provider_offer$laundry$details(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$laundry$details<
        TRes>
    implements
        CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$laundry$details<
            TRes> {
  _CopyWithStubImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$laundry$details(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company {
  Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company({
    this.details,
    required this.$__typename,
  });

  factory Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company(
      details: l$details == null
          ? null
          : Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company$details?
      details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$details = details;
    _resultData['details'] = l$details?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$details = details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$details,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company
    on Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company {
  CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company<
          Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company>
      get copyWith =>
          CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company<
    TRes> {
  factory CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company(
    Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company
        instance,
    TRes Function(
            Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company)
        then,
  ) = _CopyWithImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company;

  factory CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company;

  TRes call({
    Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company$details?
        details,
    String? $__typename,
  });
  CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company$details<
      TRes> get details;
}

class _CopyWithImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company<
        TRes>
    implements
        CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company<
            TRes> {
  _CopyWithImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company(
    this._instance,
    this._then,
  );

  final Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company
      _instance;

  final TRes Function(
          Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company)
      _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company(
        details: details == _undefined
            ? _instance.details
            : (details
                as Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company$details<
      TRes> get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company$details
            .stub(_then(_instance))
        : CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company<
        TRes>
    implements
        CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company<
            TRes> {
  _CopyWithStubImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company(
      this._res);

  TRes _res;

  call({
    Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company$details<
          TRes>
      get details =>
          CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company$details
              .stub(_res);
}

class Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company$details {
  Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company$details({
    required this.name,
    required this.image,
    required this.$__typename,
  });

  factory Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company$details.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company$details(
      name: (l$name as String),
      image: (l$image as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String name;

  final String image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$image,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company$details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
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

extension UtilityExtension$Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company$details
    on Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company$details {
  CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company$details<
          Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company$details>
      get copyWith =>
          CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company$details<
    TRes> {
  factory CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company$details(
    Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company$details
        instance,
    TRes Function(
            Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company$details)
        then,
  ) = _CopyWithImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company$details;

  factory CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company$details;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company$details<
        TRes>
    implements
        CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company$details<
            TRes> {
  _CopyWithImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company$details(
    this._instance,
    this._then,
  );

  final Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company$details
      _instance;

  final TRes Function(
          Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company$details(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company$details<
        TRes>
    implements
        CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company$details<
            TRes> {
  _CopyWithStubImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$delivery_company$details(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Query$fetch_all_promotions_within_distance$service_provider_offer$business {
  Query$fetch_all_promotions_within_distance$service_provider_offer$business({
    required this.details,
    required this.$__typename,
  });

  factory Query$fetch_all_promotions_within_distance$service_provider_offer$business.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$fetch_all_promotions_within_distance$service_provider_offer$business(
      details:
          Query$fetch_all_promotions_within_distance$service_provider_offer$business$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$fetch_all_promotions_within_distance$service_provider_offer$business$details
      details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$details = details;
    _resultData['details'] = l$details.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$details = details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$details,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$fetch_all_promotions_within_distance$service_provider_offer$business) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$fetch_all_promotions_within_distance$service_provider_offer$business
    on Query$fetch_all_promotions_within_distance$service_provider_offer$business {
  CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$business<
          Query$fetch_all_promotions_within_distance$service_provider_offer$business>
      get copyWith =>
          CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$business(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$business<
    TRes> {
  factory CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$business(
    Query$fetch_all_promotions_within_distance$service_provider_offer$business
        instance,
    TRes Function(
            Query$fetch_all_promotions_within_distance$service_provider_offer$business)
        then,
  ) = _CopyWithImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$business;

  factory CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$business.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$business;

  TRes call({
    Query$fetch_all_promotions_within_distance$service_provider_offer$business$details?
        details,
    String? $__typename,
  });
  CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$business$details<
      TRes> get details;
}

class _CopyWithImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$business<
        TRes>
    implements
        CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$business<
            TRes> {
  _CopyWithImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$business(
    this._instance,
    this._then,
  );

  final Query$fetch_all_promotions_within_distance$service_provider_offer$business
      _instance;

  final TRes Function(
          Query$fetch_all_promotions_within_distance$service_provider_offer$business)
      _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$fetch_all_promotions_within_distance$service_provider_offer$business(
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Query$fetch_all_promotions_within_distance$service_provider_offer$business$details),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$business$details<
      TRes> get details {
    final local$details = _instance.details;
    return CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$business$details(
        local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$business<
        TRes>
    implements
        CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$business<
            TRes> {
  _CopyWithStubImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$business(
      this._res);

  TRes _res;

  call({
    Query$fetch_all_promotions_within_distance$service_provider_offer$business$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$business$details<
          TRes>
      get details =>
          CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$business$details
              .stub(_res);
}

class Query$fetch_all_promotions_within_distance$service_provider_offer$business$details {
  Query$fetch_all_promotions_within_distance$service_provider_offer$business$details({
    required this.name,
    required this.image,
    required this.$__typename,
  });

  factory Query$fetch_all_promotions_within_distance$service_provider_offer$business$details.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$fetch_all_promotions_within_distance$service_provider_offer$business$details(
      name: (l$name as String),
      image: (l$image as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String name;

  final String image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$image,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$fetch_all_promotions_within_distance$service_provider_offer$business$details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
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

extension UtilityExtension$Query$fetch_all_promotions_within_distance$service_provider_offer$business$details
    on Query$fetch_all_promotions_within_distance$service_provider_offer$business$details {
  CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$business$details<
          Query$fetch_all_promotions_within_distance$service_provider_offer$business$details>
      get copyWith =>
          CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$business$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$business$details<
    TRes> {
  factory CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$business$details(
    Query$fetch_all_promotions_within_distance$service_provider_offer$business$details
        instance,
    TRes Function(
            Query$fetch_all_promotions_within_distance$service_provider_offer$business$details)
        then,
  ) = _CopyWithImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$business$details;

  factory CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$business$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$business$details;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$business$details<
        TRes>
    implements
        CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$business$details<
            TRes> {
  _CopyWithImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$business$details(
    this._instance,
    this._then,
  );

  final Query$fetch_all_promotions_within_distance$service_provider_offer$business$details
      _instance;

  final TRes Function(
          Query$fetch_all_promotions_within_distance$service_provider_offer$business$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$fetch_all_promotions_within_distance$service_provider_offer$business$details(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$business$details<
        TRes>
    implements
        CopyWith$Query$fetch_all_promotions_within_distance$service_provider_offer$business$details<
            TRes> {
  _CopyWithStubImpl$Query$fetch_all_promotions_within_distance$service_provider_offer$business$details(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$insertOfferApplied {
  factory Variables$Mutation$insertOfferApplied(
          {required Input$service_provider_offer_applied_insert_input
              object}) =>
      Variables$Mutation$insertOfferApplied._({
        r'object': object,
      });

  Variables$Mutation$insertOfferApplied._(this._$data);

  factory Variables$Mutation$insertOfferApplied.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$object = data['object'];
    result$data['object'] =
        Input$service_provider_offer_applied_insert_input.fromJson(
            (l$object as Map<String, dynamic>));
    return Variables$Mutation$insertOfferApplied._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$service_provider_offer_applied_insert_input get object =>
      (_$data['object'] as Input$service_provider_offer_applied_insert_input);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$object = object;
    result$data['object'] = l$object.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$insertOfferApplied<
          Variables$Mutation$insertOfferApplied>
      get copyWith => CopyWith$Variables$Mutation$insertOfferApplied(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$insertOfferApplied) ||
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

abstract class CopyWith$Variables$Mutation$insertOfferApplied<TRes> {
  factory CopyWith$Variables$Mutation$insertOfferApplied(
    Variables$Mutation$insertOfferApplied instance,
    TRes Function(Variables$Mutation$insertOfferApplied) then,
  ) = _CopyWithImpl$Variables$Mutation$insertOfferApplied;

  factory CopyWith$Variables$Mutation$insertOfferApplied.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$insertOfferApplied;

  TRes call({Input$service_provider_offer_applied_insert_input? object});
}

class _CopyWithImpl$Variables$Mutation$insertOfferApplied<TRes>
    implements CopyWith$Variables$Mutation$insertOfferApplied<TRes> {
  _CopyWithImpl$Variables$Mutation$insertOfferApplied(
    this._instance,
    this._then,
  );

  final Variables$Mutation$insertOfferApplied _instance;

  final TRes Function(Variables$Mutation$insertOfferApplied) _then;

  static const _undefined = {};

  TRes call({Object? object = _undefined}) =>
      _then(Variables$Mutation$insertOfferApplied._({
        ..._instance._$data,
        if (object != _undefined && object != null)
          'object':
              (object as Input$service_provider_offer_applied_insert_input),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$insertOfferApplied<TRes>
    implements CopyWith$Variables$Mutation$insertOfferApplied<TRes> {
  _CopyWithStubImpl$Variables$Mutation$insertOfferApplied(this._res);

  TRes _res;

  call({Input$service_provider_offer_applied_insert_input? object}) => _res;
}

class Mutation$insertOfferApplied {
  Mutation$insertOfferApplied({
    this.insert_service_provider_offer_applied_one,
    required this.$__typename,
  });

  factory Mutation$insertOfferApplied.fromJson(Map<String, dynamic> json) {
    final l$insert_service_provider_offer_applied_one =
        json['insert_service_provider_offer_applied_one'];
    final l$$__typename = json['__typename'];
    return Mutation$insertOfferApplied(
      insert_service_provider_offer_applied_one:
          l$insert_service_provider_offer_applied_one == null
              ? null
              : Mutation$insertOfferApplied$insert_service_provider_offer_applied_one
                  .fromJson((l$insert_service_provider_offer_applied_one
                      as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$insertOfferApplied$insert_service_provider_offer_applied_one?
      insert_service_provider_offer_applied_one;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insert_service_provider_offer_applied_one =
        insert_service_provider_offer_applied_one;
    _resultData['insert_service_provider_offer_applied_one'] =
        l$insert_service_provider_offer_applied_one?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insert_service_provider_offer_applied_one =
        insert_service_provider_offer_applied_one;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$insert_service_provider_offer_applied_one,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$insertOfferApplied) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$insert_service_provider_offer_applied_one =
        insert_service_provider_offer_applied_one;
    final lOther$insert_service_provider_offer_applied_one =
        other.insert_service_provider_offer_applied_one;
    if (l$insert_service_provider_offer_applied_one !=
        lOther$insert_service_provider_offer_applied_one) {
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

extension UtilityExtension$Mutation$insertOfferApplied
    on Mutation$insertOfferApplied {
  CopyWith$Mutation$insertOfferApplied<Mutation$insertOfferApplied>
      get copyWith => CopyWith$Mutation$insertOfferApplied(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$insertOfferApplied<TRes> {
  factory CopyWith$Mutation$insertOfferApplied(
    Mutation$insertOfferApplied instance,
    TRes Function(Mutation$insertOfferApplied) then,
  ) = _CopyWithImpl$Mutation$insertOfferApplied;

  factory CopyWith$Mutation$insertOfferApplied.stub(TRes res) =
      _CopyWithStubImpl$Mutation$insertOfferApplied;

  TRes call({
    Mutation$insertOfferApplied$insert_service_provider_offer_applied_one?
        insert_service_provider_offer_applied_one,
    String? $__typename,
  });
  CopyWith$Mutation$insertOfferApplied$insert_service_provider_offer_applied_one<
      TRes> get insert_service_provider_offer_applied_one;
}

class _CopyWithImpl$Mutation$insertOfferApplied<TRes>
    implements CopyWith$Mutation$insertOfferApplied<TRes> {
  _CopyWithImpl$Mutation$insertOfferApplied(
    this._instance,
    this._then,
  );

  final Mutation$insertOfferApplied _instance;

  final TRes Function(Mutation$insertOfferApplied) _then;

  static const _undefined = {};

  TRes call({
    Object? insert_service_provider_offer_applied_one = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$insertOfferApplied(
        insert_service_provider_offer_applied_one:
            insert_service_provider_offer_applied_one == _undefined
                ? _instance.insert_service_provider_offer_applied_one
                : (insert_service_provider_offer_applied_one
                    as Mutation$insertOfferApplied$insert_service_provider_offer_applied_one?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$insertOfferApplied$insert_service_provider_offer_applied_one<
      TRes> get insert_service_provider_offer_applied_one {
    final local$insert_service_provider_offer_applied_one =
        _instance.insert_service_provider_offer_applied_one;
    return local$insert_service_provider_offer_applied_one == null
        ? CopyWith$Mutation$insertOfferApplied$insert_service_provider_offer_applied_one
            .stub(_then(_instance))
        : CopyWith$Mutation$insertOfferApplied$insert_service_provider_offer_applied_one(
            local$insert_service_provider_offer_applied_one,
            (e) => call(insert_service_provider_offer_applied_one: e));
  }
}

class _CopyWithStubImpl$Mutation$insertOfferApplied<TRes>
    implements CopyWith$Mutation$insertOfferApplied<TRes> {
  _CopyWithStubImpl$Mutation$insertOfferApplied(this._res);

  TRes _res;

  call({
    Mutation$insertOfferApplied$insert_service_provider_offer_applied_one?
        insert_service_provider_offer_applied_one,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$insertOfferApplied$insert_service_provider_offer_applied_one<
          TRes>
      get insert_service_provider_offer_applied_one =>
          CopyWith$Mutation$insertOfferApplied$insert_service_provider_offer_applied_one
              .stub(_res);
}

const documentNodeMutationinsertOfferApplied = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'insertOfferApplied'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'object')),
        type: NamedTypeNode(
          name: NameNode(value: 'service_provider_offer_applied_insert_input'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'insert_service_provider_offer_applied_one'),
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
Mutation$insertOfferApplied _parserFn$Mutation$insertOfferApplied(
        Map<String, dynamic> data) =>
    Mutation$insertOfferApplied.fromJson(data);
typedef OnMutationCompleted$Mutation$insertOfferApplied = FutureOr<void>
    Function(
  dynamic,
  Mutation$insertOfferApplied?,
);

class Options$Mutation$insertOfferApplied
    extends graphql.MutationOptions<Mutation$insertOfferApplied> {
  Options$Mutation$insertOfferApplied({
    String? operationName,
    required Variables$Mutation$insertOfferApplied variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$insertOfferApplied? onCompleted,
    graphql.OnMutationUpdate<Mutation$insertOfferApplied>? update,
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
                        : _parserFn$Mutation$insertOfferApplied(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationinsertOfferApplied,
          parserFn: _parserFn$Mutation$insertOfferApplied,
        );

  final OnMutationCompleted$Mutation$insertOfferApplied? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$insertOfferApplied
    extends graphql.WatchQueryOptions<Mutation$insertOfferApplied> {
  WatchOptions$Mutation$insertOfferApplied({
    String? operationName,
    required Variables$Mutation$insertOfferApplied variables,
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
          document: documentNodeMutationinsertOfferApplied,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$insertOfferApplied,
        );
}

extension ClientExtension$Mutation$insertOfferApplied on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$insertOfferApplied>>
      mutate$insertOfferApplied(
              Options$Mutation$insertOfferApplied options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$insertOfferApplied>
      watchMutation$insertOfferApplied(
              WatchOptions$Mutation$insertOfferApplied options) =>
          this.watchMutation(options);
}

class Mutation$insertOfferApplied$insert_service_provider_offer_applied_one {
  Mutation$insertOfferApplied$insert_service_provider_offer_applied_one({
    required this.id,
    required this.$__typename,
  });

  factory Mutation$insertOfferApplied$insert_service_provider_offer_applied_one.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$insertOfferApplied$insert_service_provider_offer_applied_one(
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
            is Mutation$insertOfferApplied$insert_service_provider_offer_applied_one) ||
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

extension UtilityExtension$Mutation$insertOfferApplied$insert_service_provider_offer_applied_one
    on Mutation$insertOfferApplied$insert_service_provider_offer_applied_one {
  CopyWith$Mutation$insertOfferApplied$insert_service_provider_offer_applied_one<
          Mutation$insertOfferApplied$insert_service_provider_offer_applied_one>
      get copyWith =>
          CopyWith$Mutation$insertOfferApplied$insert_service_provider_offer_applied_one(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$insertOfferApplied$insert_service_provider_offer_applied_one<
    TRes> {
  factory CopyWith$Mutation$insertOfferApplied$insert_service_provider_offer_applied_one(
    Mutation$insertOfferApplied$insert_service_provider_offer_applied_one
        instance,
    TRes Function(
            Mutation$insertOfferApplied$insert_service_provider_offer_applied_one)
        then,
  ) = _CopyWithImpl$Mutation$insertOfferApplied$insert_service_provider_offer_applied_one;

  factory CopyWith$Mutation$insertOfferApplied$insert_service_provider_offer_applied_one.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$insertOfferApplied$insert_service_provider_offer_applied_one;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$insertOfferApplied$insert_service_provider_offer_applied_one<
        TRes>
    implements
        CopyWith$Mutation$insertOfferApplied$insert_service_provider_offer_applied_one<
            TRes> {
  _CopyWithImpl$Mutation$insertOfferApplied$insert_service_provider_offer_applied_one(
    this._instance,
    this._then,
  );

  final Mutation$insertOfferApplied$insert_service_provider_offer_applied_one
      _instance;

  final TRes Function(
          Mutation$insertOfferApplied$insert_service_provider_offer_applied_one)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$insertOfferApplied$insert_service_provider_offer_applied_one(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$insertOfferApplied$insert_service_provider_offer_applied_one<
        TRes>
    implements
        CopyWith$Mutation$insertOfferApplied$insert_service_provider_offer_applied_one<
            TRes> {
  _CopyWithStubImpl$Mutation$insertOfferApplied$insert_service_provider_offer_applied_one(
      this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getInfluencerIdByTag {
  factory Variables$Query$getInfluencerIdByTag({required String tag}) =>
      Variables$Query$getInfluencerIdByTag._({
        r'tag': tag,
      });

  Variables$Query$getInfluencerIdByTag._(this._$data);

  factory Variables$Query$getInfluencerIdByTag.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$tag = data['tag'];
    result$data['tag'] = (l$tag as String);
    return Variables$Query$getInfluencerIdByTag._(result$data);
  }

  Map<String, dynamic> _$data;

  String get tag => (_$data['tag'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$tag = tag;
    result$data['tag'] = l$tag;
    return result$data;
  }

  CopyWith$Variables$Query$getInfluencerIdByTag<
          Variables$Query$getInfluencerIdByTag>
      get copyWith => CopyWith$Variables$Query$getInfluencerIdByTag(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getInfluencerIdByTag) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$tag = tag;
    final lOther$tag = other.tag;
    if (l$tag != lOther$tag) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$tag = tag;
    return Object.hashAll([l$tag]);
  }
}

abstract class CopyWith$Variables$Query$getInfluencerIdByTag<TRes> {
  factory CopyWith$Variables$Query$getInfluencerIdByTag(
    Variables$Query$getInfluencerIdByTag instance,
    TRes Function(Variables$Query$getInfluencerIdByTag) then,
  ) = _CopyWithImpl$Variables$Query$getInfluencerIdByTag;

  factory CopyWith$Variables$Query$getInfluencerIdByTag.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getInfluencerIdByTag;

  TRes call({String? tag});
}

class _CopyWithImpl$Variables$Query$getInfluencerIdByTag<TRes>
    implements CopyWith$Variables$Query$getInfluencerIdByTag<TRes> {
  _CopyWithImpl$Variables$Query$getInfluencerIdByTag(
    this._instance,
    this._then,
  );

  final Variables$Query$getInfluencerIdByTag _instance;

  final TRes Function(Variables$Query$getInfluencerIdByTag) _then;

  static const _undefined = {};

  TRes call({Object? tag = _undefined}) =>
      _then(Variables$Query$getInfluencerIdByTag._({
        ..._instance._$data,
        if (tag != _undefined && tag != null) 'tag': (tag as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$getInfluencerIdByTag<TRes>
    implements CopyWith$Variables$Query$getInfluencerIdByTag<TRes> {
  _CopyWithStubImpl$Variables$Query$getInfluencerIdByTag(this._res);

  TRes _res;

  call({String? tag}) => _res;
}

class Query$getInfluencerIdByTag {
  Query$getInfluencerIdByTag({
    required this.service_provider_influencer,
    required this.$__typename,
  });

  factory Query$getInfluencerIdByTag.fromJson(Map<String, dynamic> json) {
    final l$service_provider_influencer = json['service_provider_influencer'];
    final l$$__typename = json['__typename'];
    return Query$getInfluencerIdByTag(
      service_provider_influencer: (l$service_provider_influencer
              as List<dynamic>)
          .map((e) =>
              Query$getInfluencerIdByTag$service_provider_influencer.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getInfluencerIdByTag$service_provider_influencer>
      service_provider_influencer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$service_provider_influencer = service_provider_influencer;
    _resultData['service_provider_influencer'] =
        l$service_provider_influencer.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$service_provider_influencer = service_provider_influencer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$service_provider_influencer.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getInfluencerIdByTag) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$service_provider_influencer = service_provider_influencer;
    final lOther$service_provider_influencer =
        other.service_provider_influencer;
    if (l$service_provider_influencer.length !=
        lOther$service_provider_influencer.length) {
      return false;
    }
    for (int i = 0; i < l$service_provider_influencer.length; i++) {
      final l$service_provider_influencer$entry =
          l$service_provider_influencer[i];
      final lOther$service_provider_influencer$entry =
          lOther$service_provider_influencer[i];
      if (l$service_provider_influencer$entry !=
          lOther$service_provider_influencer$entry) {
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

extension UtilityExtension$Query$getInfluencerIdByTag
    on Query$getInfluencerIdByTag {
  CopyWith$Query$getInfluencerIdByTag<Query$getInfluencerIdByTag>
      get copyWith => CopyWith$Query$getInfluencerIdByTag(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getInfluencerIdByTag<TRes> {
  factory CopyWith$Query$getInfluencerIdByTag(
    Query$getInfluencerIdByTag instance,
    TRes Function(Query$getInfluencerIdByTag) then,
  ) = _CopyWithImpl$Query$getInfluencerIdByTag;

  factory CopyWith$Query$getInfluencerIdByTag.stub(TRes res) =
      _CopyWithStubImpl$Query$getInfluencerIdByTag;

  TRes call({
    List<Query$getInfluencerIdByTag$service_provider_influencer>?
        service_provider_influencer,
    String? $__typename,
  });
  TRes service_provider_influencer(
      Iterable<Query$getInfluencerIdByTag$service_provider_influencer> Function(
              Iterable<
                  CopyWith$Query$getInfluencerIdByTag$service_provider_influencer<
                      Query$getInfluencerIdByTag$service_provider_influencer>>)
          _fn);
}

class _CopyWithImpl$Query$getInfluencerIdByTag<TRes>
    implements CopyWith$Query$getInfluencerIdByTag<TRes> {
  _CopyWithImpl$Query$getInfluencerIdByTag(
    this._instance,
    this._then,
  );

  final Query$getInfluencerIdByTag _instance;

  final TRes Function(Query$getInfluencerIdByTag) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_influencer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getInfluencerIdByTag(
        service_provider_influencer:
            service_provider_influencer == _undefined ||
                    service_provider_influencer == null
                ? _instance.service_provider_influencer
                : (service_provider_influencer as List<
                    Query$getInfluencerIdByTag$service_provider_influencer>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes service_provider_influencer(
          Iterable<Query$getInfluencerIdByTag$service_provider_influencer> Function(
                  Iterable<
                      CopyWith$Query$getInfluencerIdByTag$service_provider_influencer<
                          Query$getInfluencerIdByTag$service_provider_influencer>>)
              _fn) =>
      call(
          service_provider_influencer: _fn(_instance.service_provider_influencer
              .map((e) =>
                  CopyWith$Query$getInfluencerIdByTag$service_provider_influencer(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getInfluencerIdByTag<TRes>
    implements CopyWith$Query$getInfluencerIdByTag<TRes> {
  _CopyWithStubImpl$Query$getInfluencerIdByTag(this._res);

  TRes _res;

  call({
    List<Query$getInfluencerIdByTag$service_provider_influencer>?
        service_provider_influencer,
    String? $__typename,
  }) =>
      _res;
  service_provider_influencer(_fn) => _res;
}

const documentNodeQuerygetInfluencerIdByTag = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getInfluencerIdByTag'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'tag')),
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
        name: NameNode(value: 'service_provider_influencer'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'tag'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'tag')),
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
Query$getInfluencerIdByTag _parserFn$Query$getInfluencerIdByTag(
        Map<String, dynamic> data) =>
    Query$getInfluencerIdByTag.fromJson(data);

class Options$Query$getInfluencerIdByTag
    extends graphql.QueryOptions<Query$getInfluencerIdByTag> {
  Options$Query$getInfluencerIdByTag({
    String? operationName,
    required Variables$Query$getInfluencerIdByTag variables,
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
          document: documentNodeQuerygetInfluencerIdByTag,
          parserFn: _parserFn$Query$getInfluencerIdByTag,
        );
}

class WatchOptions$Query$getInfluencerIdByTag
    extends graphql.WatchQueryOptions<Query$getInfluencerIdByTag> {
  WatchOptions$Query$getInfluencerIdByTag({
    String? operationName,
    required Variables$Query$getInfluencerIdByTag variables,
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
          document: documentNodeQuerygetInfluencerIdByTag,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getInfluencerIdByTag,
        );
}

class FetchMoreOptions$Query$getInfluencerIdByTag
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getInfluencerIdByTag({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getInfluencerIdByTag variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetInfluencerIdByTag,
        );
}

extension ClientExtension$Query$getInfluencerIdByTag on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getInfluencerIdByTag>>
      query$getInfluencerIdByTag(
              Options$Query$getInfluencerIdByTag options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getInfluencerIdByTag>
      watchQuery$getInfluencerIdByTag(
              WatchOptions$Query$getInfluencerIdByTag options) =>
          this.watchQuery(options);
  void writeQuery$getInfluencerIdByTag({
    required Query$getInfluencerIdByTag data,
    required Variables$Query$getInfluencerIdByTag variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetInfluencerIdByTag),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getInfluencerIdByTag? readQuery$getInfluencerIdByTag({
    required Variables$Query$getInfluencerIdByTag variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetInfluencerIdByTag),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getInfluencerIdByTag.fromJson(result);
  }
}

class Query$getInfluencerIdByTag$service_provider_influencer {
  Query$getInfluencerIdByTag$service_provider_influencer({
    required this.id,
    required this.$__typename,
  });

  factory Query$getInfluencerIdByTag$service_provider_influencer.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Query$getInfluencerIdByTag$service_provider_influencer(
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
    if (!(other is Query$getInfluencerIdByTag$service_provider_influencer) ||
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

extension UtilityExtension$Query$getInfluencerIdByTag$service_provider_influencer
    on Query$getInfluencerIdByTag$service_provider_influencer {
  CopyWith$Query$getInfluencerIdByTag$service_provider_influencer<
          Query$getInfluencerIdByTag$service_provider_influencer>
      get copyWith =>
          CopyWith$Query$getInfluencerIdByTag$service_provider_influencer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getInfluencerIdByTag$service_provider_influencer<
    TRes> {
  factory CopyWith$Query$getInfluencerIdByTag$service_provider_influencer(
    Query$getInfluencerIdByTag$service_provider_influencer instance,
    TRes Function(Query$getInfluencerIdByTag$service_provider_influencer) then,
  ) = _CopyWithImpl$Query$getInfluencerIdByTag$service_provider_influencer;

  factory CopyWith$Query$getInfluencerIdByTag$service_provider_influencer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getInfluencerIdByTag$service_provider_influencer;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getInfluencerIdByTag$service_provider_influencer<TRes>
    implements
        CopyWith$Query$getInfluencerIdByTag$service_provider_influencer<TRes> {
  _CopyWithImpl$Query$getInfluencerIdByTag$service_provider_influencer(
    this._instance,
    this._then,
  );

  final Query$getInfluencerIdByTag$service_provider_influencer _instance;

  final TRes Function(Query$getInfluencerIdByTag$service_provider_influencer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getInfluencerIdByTag$service_provider_influencer(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getInfluencerIdByTag$service_provider_influencer<
        TRes>
    implements
        CopyWith$Query$getInfluencerIdByTag$service_provider_influencer<TRes> {
  _CopyWithStubImpl$Query$getInfluencerIdByTag$service_provider_influencer(
      this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getOfferTotalRevenue {
  factory Variables$Query$getOfferTotalRevenue({required int offer_id}) =>
      Variables$Query$getOfferTotalRevenue._({
        r'offer_id': offer_id,
      });

  Variables$Query$getOfferTotalRevenue._(this._$data);

  factory Variables$Query$getOfferTotalRevenue.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$offer_id = data['offer_id'];
    result$data['offer_id'] = (l$offer_id as int);
    return Variables$Query$getOfferTotalRevenue._(result$data);
  }

  Map<String, dynamic> _$data;

  int get offer_id => (_$data['offer_id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$offer_id = offer_id;
    result$data['offer_id'] = l$offer_id;
    return result$data;
  }

  CopyWith$Variables$Query$getOfferTotalRevenue<
          Variables$Query$getOfferTotalRevenue>
      get copyWith => CopyWith$Variables$Query$getOfferTotalRevenue(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getOfferTotalRevenue) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$offer_id = offer_id;
    final lOther$offer_id = other.offer_id;
    if (l$offer_id != lOther$offer_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$offer_id = offer_id;
    return Object.hashAll([l$offer_id]);
  }
}

abstract class CopyWith$Variables$Query$getOfferTotalRevenue<TRes> {
  factory CopyWith$Variables$Query$getOfferTotalRevenue(
    Variables$Query$getOfferTotalRevenue instance,
    TRes Function(Variables$Query$getOfferTotalRevenue) then,
  ) = _CopyWithImpl$Variables$Query$getOfferTotalRevenue;

  factory CopyWith$Variables$Query$getOfferTotalRevenue.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getOfferTotalRevenue;

  TRes call({int? offer_id});
}

class _CopyWithImpl$Variables$Query$getOfferTotalRevenue<TRes>
    implements CopyWith$Variables$Query$getOfferTotalRevenue<TRes> {
  _CopyWithImpl$Variables$Query$getOfferTotalRevenue(
    this._instance,
    this._then,
  );

  final Variables$Query$getOfferTotalRevenue _instance;

  final TRes Function(Variables$Query$getOfferTotalRevenue) _then;

  static const _undefined = {};

  TRes call({Object? offer_id = _undefined}) =>
      _then(Variables$Query$getOfferTotalRevenue._({
        ..._instance._$data,
        if (offer_id != _undefined && offer_id != null)
          'offer_id': (offer_id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getOfferTotalRevenue<TRes>
    implements CopyWith$Variables$Query$getOfferTotalRevenue<TRes> {
  _CopyWithStubImpl$Variables$Query$getOfferTotalRevenue(this._res);

  TRes _res;

  call({int? offer_id}) => _res;
}

class Query$getOfferTotalRevenue {
  Query$getOfferTotalRevenue({
    required this.service_provider_offer_applied_aggregate,
    required this.$__typename,
  });

  factory Query$getOfferTotalRevenue.fromJson(Map<String, dynamic> json) {
    final l$service_provider_offer_applied_aggregate =
        json['service_provider_offer_applied_aggregate'];
    final l$$__typename = json['__typename'];
    return Query$getOfferTotalRevenue(
      service_provider_offer_applied_aggregate:
          Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate
              .fromJson((l$service_provider_offer_applied_aggregate
                  as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate
      service_provider_offer_applied_aggregate;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$service_provider_offer_applied_aggregate =
        service_provider_offer_applied_aggregate;
    _resultData['service_provider_offer_applied_aggregate'] =
        l$service_provider_offer_applied_aggregate.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$service_provider_offer_applied_aggregate =
        service_provider_offer_applied_aggregate;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$service_provider_offer_applied_aggregate,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getOfferTotalRevenue) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$service_provider_offer_applied_aggregate =
        service_provider_offer_applied_aggregate;
    final lOther$service_provider_offer_applied_aggregate =
        other.service_provider_offer_applied_aggregate;
    if (l$service_provider_offer_applied_aggregate !=
        lOther$service_provider_offer_applied_aggregate) {
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

extension UtilityExtension$Query$getOfferTotalRevenue
    on Query$getOfferTotalRevenue {
  CopyWith$Query$getOfferTotalRevenue<Query$getOfferTotalRevenue>
      get copyWith => CopyWith$Query$getOfferTotalRevenue(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOfferTotalRevenue<TRes> {
  factory CopyWith$Query$getOfferTotalRevenue(
    Query$getOfferTotalRevenue instance,
    TRes Function(Query$getOfferTotalRevenue) then,
  ) = _CopyWithImpl$Query$getOfferTotalRevenue;

  factory CopyWith$Query$getOfferTotalRevenue.stub(TRes res) =
      _CopyWithStubImpl$Query$getOfferTotalRevenue;

  TRes call({
    Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate?
        service_provider_offer_applied_aggregate,
    String? $__typename,
  });
  CopyWith$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate<
      TRes> get service_provider_offer_applied_aggregate;
}

class _CopyWithImpl$Query$getOfferTotalRevenue<TRes>
    implements CopyWith$Query$getOfferTotalRevenue<TRes> {
  _CopyWithImpl$Query$getOfferTotalRevenue(
    this._instance,
    this._then,
  );

  final Query$getOfferTotalRevenue _instance;

  final TRes Function(Query$getOfferTotalRevenue) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_offer_applied_aggregate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOfferTotalRevenue(
        service_provider_offer_applied_aggregate:
            service_provider_offer_applied_aggregate == _undefined ||
                    service_provider_offer_applied_aggregate == null
                ? _instance.service_provider_offer_applied_aggregate
                : (service_provider_offer_applied_aggregate
                    as Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate<
      TRes> get service_provider_offer_applied_aggregate {
    final local$service_provider_offer_applied_aggregate =
        _instance.service_provider_offer_applied_aggregate;
    return CopyWith$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate(
        local$service_provider_offer_applied_aggregate,
        (e) => call(service_provider_offer_applied_aggregate: e));
  }
}

class _CopyWithStubImpl$Query$getOfferTotalRevenue<TRes>
    implements CopyWith$Query$getOfferTotalRevenue<TRes> {
  _CopyWithStubImpl$Query$getOfferTotalRevenue(this._res);

  TRes _res;

  call({
    Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate?
        service_provider_offer_applied_aggregate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate<
          TRes>
      get service_provider_offer_applied_aggregate =>
          CopyWith$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate
              .stub(_res);
}

const documentNodeQuerygetOfferTotalRevenue = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getOfferTotalRevenue'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'offer_id')),
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
        name: NameNode(value: 'service_provider_offer_applied_aggregate'),
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
              )
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'aggregate'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'sum'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'order_total'),
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
Query$getOfferTotalRevenue _parserFn$Query$getOfferTotalRevenue(
        Map<String, dynamic> data) =>
    Query$getOfferTotalRevenue.fromJson(data);

class Options$Query$getOfferTotalRevenue
    extends graphql.QueryOptions<Query$getOfferTotalRevenue> {
  Options$Query$getOfferTotalRevenue({
    String? operationName,
    required Variables$Query$getOfferTotalRevenue variables,
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
          document: documentNodeQuerygetOfferTotalRevenue,
          parserFn: _parserFn$Query$getOfferTotalRevenue,
        );
}

class WatchOptions$Query$getOfferTotalRevenue
    extends graphql.WatchQueryOptions<Query$getOfferTotalRevenue> {
  WatchOptions$Query$getOfferTotalRevenue({
    String? operationName,
    required Variables$Query$getOfferTotalRevenue variables,
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
          document: documentNodeQuerygetOfferTotalRevenue,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getOfferTotalRevenue,
        );
}

class FetchMoreOptions$Query$getOfferTotalRevenue
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getOfferTotalRevenue({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getOfferTotalRevenue variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetOfferTotalRevenue,
        );
}

extension ClientExtension$Query$getOfferTotalRevenue on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getOfferTotalRevenue>>
      query$getOfferTotalRevenue(
              Options$Query$getOfferTotalRevenue options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getOfferTotalRevenue>
      watchQuery$getOfferTotalRevenue(
              WatchOptions$Query$getOfferTotalRevenue options) =>
          this.watchQuery(options);
  void writeQuery$getOfferTotalRevenue({
    required Query$getOfferTotalRevenue data,
    required Variables$Query$getOfferTotalRevenue variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetOfferTotalRevenue),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getOfferTotalRevenue? readQuery$getOfferTotalRevenue({
    required Variables$Query$getOfferTotalRevenue variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetOfferTotalRevenue),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getOfferTotalRevenue.fromJson(result);
  }
}

class Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate {
  Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate({
    this.aggregate,
    required this.$__typename,
  });

  factory Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$aggregate = json['aggregate'];
    final l$$__typename = json['__typename'];
    return Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate(
      aggregate: l$aggregate == null
          ? null
          : Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate
              .fromJson((l$aggregate as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate?
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
            is Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate) ||
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

extension UtilityExtension$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate
    on Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate {
  CopyWith$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate<
          Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate>
      get copyWith =>
          CopyWith$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate<
    TRes> {
  factory CopyWith$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate(
    Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate
        instance,
    TRes Function(
            Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate)
        then,
  ) = _CopyWithImpl$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate;

  factory CopyWith$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate;

  TRes call({
    Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate?
        aggregate,
    String? $__typename,
  });
  CopyWith$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate<
      TRes> get aggregate;
}

class _CopyWithImpl$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate<
        TRes>
    implements
        CopyWith$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate<
            TRes> {
  _CopyWithImpl$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate(
    this._instance,
    this._then,
  );

  final Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate
      _instance;

  final TRes Function(
          Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate)
      _then;

  static const _undefined = {};

  TRes call({
    Object? aggregate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate(
        aggregate: aggregate == _undefined
            ? _instance.aggregate
            : (aggregate
                as Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate<
      TRes> get aggregate {
    final local$aggregate = _instance.aggregate;
    return local$aggregate == null
        ? CopyWith$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate
            .stub(_then(_instance))
        : CopyWith$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate(
            local$aggregate, (e) => call(aggregate: e));
  }
}

class _CopyWithStubImpl$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate<
        TRes>
    implements
        CopyWith$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate<
            TRes> {
  _CopyWithStubImpl$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate(
      this._res);

  TRes _res;

  call({
    Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate?
        aggregate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate<
          TRes>
      get aggregate =>
          CopyWith$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate
              .stub(_res);
}

class Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate {
  Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate({
    this.sum,
    required this.$__typename,
  });

  factory Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$sum = json['sum'];
    final l$$__typename = json['__typename'];
    return Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate(
      sum: l$sum == null
          ? null
          : Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate$sum
              .fromJson((l$sum as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate$sum?
      sum;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$sum = sum;
    _resultData['sum'] = l$sum?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$sum = sum;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$sum,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$sum = sum;
    final lOther$sum = other.sum;
    if (l$sum != lOther$sum) {
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

extension UtilityExtension$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate
    on Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate {
  CopyWith$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate<
          Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate>
      get copyWith =>
          CopyWith$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate<
    TRes> {
  factory CopyWith$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate(
    Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate
        instance,
    TRes Function(
            Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate)
        then,
  ) = _CopyWithImpl$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate;

  factory CopyWith$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate;

  TRes call({
    Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate$sum?
        sum,
    String? $__typename,
  });
  CopyWith$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate$sum<
      TRes> get sum;
}

class _CopyWithImpl$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate<
            TRes> {
  _CopyWithImpl$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate(
    this._instance,
    this._then,
  );

  final Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate
      _instance;

  final TRes Function(
          Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate)
      _then;

  static const _undefined = {};

  TRes call({
    Object? sum = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate(
        sum: sum == _undefined
            ? _instance.sum
            : (sum
                as Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate$sum?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate$sum<
      TRes> get sum {
    final local$sum = _instance.sum;
    return local$sum == null
        ? CopyWith$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate$sum
            .stub(_then(_instance))
        : CopyWith$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate$sum(
            local$sum, (e) => call(sum: e));
  }
}

class _CopyWithStubImpl$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate<
            TRes> {
  _CopyWithStubImpl$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate(
      this._res);

  TRes _res;

  call({
    Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate$sum?
        sum,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate$sum<
          TRes>
      get sum =>
          CopyWith$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate$sum
              .stub(_res);
}

class Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate$sum {
  Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate$sum({
    this.order_total,
    required this.$__typename,
  });

  factory Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate$sum.fromJson(
      Map<String, dynamic> json) {
    final l$order_total = json['order_total'];
    final l$$__typename = json['__typename'];
    return Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate$sum(
      order_total: l$order_total == null ? null : moneyFromJson(l$order_total),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final double? order_total;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$order_total = order_total;
    _resultData['order_total'] =
        l$order_total == null ? null : moneyToJson(l$order_total);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$order_total = order_total;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$order_total,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate$sum) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$order_total = order_total;
    final lOther$order_total = other.order_total;
    if (l$order_total != lOther$order_total) {
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

extension UtilityExtension$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate$sum
    on Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate$sum {
  CopyWith$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate$sum<
          Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate$sum>
      get copyWith =>
          CopyWith$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate$sum(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate$sum<
    TRes> {
  factory CopyWith$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate$sum(
    Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate$sum
        instance,
    TRes Function(
            Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate$sum)
        then,
  ) = _CopyWithImpl$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate$sum;

  factory CopyWith$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate$sum.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate$sum;

  TRes call({
    double? order_total,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate$sum<
        TRes>
    implements
        CopyWith$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate$sum<
            TRes> {
  _CopyWithImpl$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate$sum(
    this._instance,
    this._then,
  );

  final Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate$sum
      _instance;

  final TRes Function(
          Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate$sum)
      _then;

  static const _undefined = {};

  TRes call({
    Object? order_total = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate$sum(
        order_total: order_total == _undefined
            ? _instance.order_total
            : (order_total as double?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate$sum<
        TRes>
    implements
        CopyWith$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate$sum<
            TRes> {
  _CopyWithStubImpl$Query$getOfferTotalRevenue$service_provider_offer_applied_aggregate$aggregate$sum(
      this._res);

  TRes _res;

  call({
    double? order_total,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getOfferTotalLoss {
  factory Variables$Query$getOfferTotalLoss({required int offer_id}) =>
      Variables$Query$getOfferTotalLoss._({
        r'offer_id': offer_id,
      });

  Variables$Query$getOfferTotalLoss._(this._$data);

  factory Variables$Query$getOfferTotalLoss.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$offer_id = data['offer_id'];
    result$data['offer_id'] = (l$offer_id as int);
    return Variables$Query$getOfferTotalLoss._(result$data);
  }

  Map<String, dynamic> _$data;

  int get offer_id => (_$data['offer_id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$offer_id = offer_id;
    result$data['offer_id'] = l$offer_id;
    return result$data;
  }

  CopyWith$Variables$Query$getOfferTotalLoss<Variables$Query$getOfferTotalLoss>
      get copyWith => CopyWith$Variables$Query$getOfferTotalLoss(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getOfferTotalLoss) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$offer_id = offer_id;
    final lOther$offer_id = other.offer_id;
    if (l$offer_id != lOther$offer_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$offer_id = offer_id;
    return Object.hashAll([l$offer_id]);
  }
}

abstract class CopyWith$Variables$Query$getOfferTotalLoss<TRes> {
  factory CopyWith$Variables$Query$getOfferTotalLoss(
    Variables$Query$getOfferTotalLoss instance,
    TRes Function(Variables$Query$getOfferTotalLoss) then,
  ) = _CopyWithImpl$Variables$Query$getOfferTotalLoss;

  factory CopyWith$Variables$Query$getOfferTotalLoss.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getOfferTotalLoss;

  TRes call({int? offer_id});
}

class _CopyWithImpl$Variables$Query$getOfferTotalLoss<TRes>
    implements CopyWith$Variables$Query$getOfferTotalLoss<TRes> {
  _CopyWithImpl$Variables$Query$getOfferTotalLoss(
    this._instance,
    this._then,
  );

  final Variables$Query$getOfferTotalLoss _instance;

  final TRes Function(Variables$Query$getOfferTotalLoss) _then;

  static const _undefined = {};

  TRes call({Object? offer_id = _undefined}) =>
      _then(Variables$Query$getOfferTotalLoss._({
        ..._instance._$data,
        if (offer_id != _undefined && offer_id != null)
          'offer_id': (offer_id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getOfferTotalLoss<TRes>
    implements CopyWith$Variables$Query$getOfferTotalLoss<TRes> {
  _CopyWithStubImpl$Variables$Query$getOfferTotalLoss(this._res);

  TRes _res;

  call({int? offer_id}) => _res;
}

class Query$getOfferTotalLoss {
  Query$getOfferTotalLoss({
    required this.service_provider_offer_applied_aggregate,
    required this.$__typename,
  });

  factory Query$getOfferTotalLoss.fromJson(Map<String, dynamic> json) {
    final l$service_provider_offer_applied_aggregate =
        json['service_provider_offer_applied_aggregate'];
    final l$$__typename = json['__typename'];
    return Query$getOfferTotalLoss(
      service_provider_offer_applied_aggregate:
          Query$getOfferTotalLoss$service_provider_offer_applied_aggregate
              .fromJson((l$service_provider_offer_applied_aggregate
                  as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getOfferTotalLoss$service_provider_offer_applied_aggregate
      service_provider_offer_applied_aggregate;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$service_provider_offer_applied_aggregate =
        service_provider_offer_applied_aggregate;
    _resultData['service_provider_offer_applied_aggregate'] =
        l$service_provider_offer_applied_aggregate.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$service_provider_offer_applied_aggregate =
        service_provider_offer_applied_aggregate;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$service_provider_offer_applied_aggregate,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getOfferTotalLoss) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$service_provider_offer_applied_aggregate =
        service_provider_offer_applied_aggregate;
    final lOther$service_provider_offer_applied_aggregate =
        other.service_provider_offer_applied_aggregate;
    if (l$service_provider_offer_applied_aggregate !=
        lOther$service_provider_offer_applied_aggregate) {
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

extension UtilityExtension$Query$getOfferTotalLoss on Query$getOfferTotalLoss {
  CopyWith$Query$getOfferTotalLoss<Query$getOfferTotalLoss> get copyWith =>
      CopyWith$Query$getOfferTotalLoss(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getOfferTotalLoss<TRes> {
  factory CopyWith$Query$getOfferTotalLoss(
    Query$getOfferTotalLoss instance,
    TRes Function(Query$getOfferTotalLoss) then,
  ) = _CopyWithImpl$Query$getOfferTotalLoss;

  factory CopyWith$Query$getOfferTotalLoss.stub(TRes res) =
      _CopyWithStubImpl$Query$getOfferTotalLoss;

  TRes call({
    Query$getOfferTotalLoss$service_provider_offer_applied_aggregate?
        service_provider_offer_applied_aggregate,
    String? $__typename,
  });
  CopyWith$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate<
      TRes> get service_provider_offer_applied_aggregate;
}

class _CopyWithImpl$Query$getOfferTotalLoss<TRes>
    implements CopyWith$Query$getOfferTotalLoss<TRes> {
  _CopyWithImpl$Query$getOfferTotalLoss(
    this._instance,
    this._then,
  );

  final Query$getOfferTotalLoss _instance;

  final TRes Function(Query$getOfferTotalLoss) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_offer_applied_aggregate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOfferTotalLoss(
        service_provider_offer_applied_aggregate:
            service_provider_offer_applied_aggregate == _undefined ||
                    service_provider_offer_applied_aggregate == null
                ? _instance.service_provider_offer_applied_aggregate
                : (service_provider_offer_applied_aggregate
                    as Query$getOfferTotalLoss$service_provider_offer_applied_aggregate),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate<
      TRes> get service_provider_offer_applied_aggregate {
    final local$service_provider_offer_applied_aggregate =
        _instance.service_provider_offer_applied_aggregate;
    return CopyWith$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate(
        local$service_provider_offer_applied_aggregate,
        (e) => call(service_provider_offer_applied_aggregate: e));
  }
}

class _CopyWithStubImpl$Query$getOfferTotalLoss<TRes>
    implements CopyWith$Query$getOfferTotalLoss<TRes> {
  _CopyWithStubImpl$Query$getOfferTotalLoss(this._res);

  TRes _res;

  call({
    Query$getOfferTotalLoss$service_provider_offer_applied_aggregate?
        service_provider_offer_applied_aggregate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate<
          TRes>
      get service_provider_offer_applied_aggregate =>
          CopyWith$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate
              .stub(_res);
}

const documentNodeQuerygetOfferTotalLoss = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getOfferTotalLoss'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'offer_id')),
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
        name: NameNode(value: 'service_provider_offer_applied_aggregate'),
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
              )
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'aggregate'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'sum'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'loss'),
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
Query$getOfferTotalLoss _parserFn$Query$getOfferTotalLoss(
        Map<String, dynamic> data) =>
    Query$getOfferTotalLoss.fromJson(data);

class Options$Query$getOfferTotalLoss
    extends graphql.QueryOptions<Query$getOfferTotalLoss> {
  Options$Query$getOfferTotalLoss({
    String? operationName,
    required Variables$Query$getOfferTotalLoss variables,
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
          document: documentNodeQuerygetOfferTotalLoss,
          parserFn: _parserFn$Query$getOfferTotalLoss,
        );
}

class WatchOptions$Query$getOfferTotalLoss
    extends graphql.WatchQueryOptions<Query$getOfferTotalLoss> {
  WatchOptions$Query$getOfferTotalLoss({
    String? operationName,
    required Variables$Query$getOfferTotalLoss variables,
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
          document: documentNodeQuerygetOfferTotalLoss,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getOfferTotalLoss,
        );
}

class FetchMoreOptions$Query$getOfferTotalLoss
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getOfferTotalLoss({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getOfferTotalLoss variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetOfferTotalLoss,
        );
}

extension ClientExtension$Query$getOfferTotalLoss on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getOfferTotalLoss>> query$getOfferTotalLoss(
          Options$Query$getOfferTotalLoss options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$getOfferTotalLoss> watchQuery$getOfferTotalLoss(
          WatchOptions$Query$getOfferTotalLoss options) =>
      this.watchQuery(options);
  void writeQuery$getOfferTotalLoss({
    required Query$getOfferTotalLoss data,
    required Variables$Query$getOfferTotalLoss variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerygetOfferTotalLoss),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getOfferTotalLoss? readQuery$getOfferTotalLoss({
    required Variables$Query$getOfferTotalLoss variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetOfferTotalLoss),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getOfferTotalLoss.fromJson(result);
  }
}

class Query$getOfferTotalLoss$service_provider_offer_applied_aggregate {
  Query$getOfferTotalLoss$service_provider_offer_applied_aggregate({
    this.aggregate,
    required this.$__typename,
  });

  factory Query$getOfferTotalLoss$service_provider_offer_applied_aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$aggregate = json['aggregate'];
    final l$$__typename = json['__typename'];
    return Query$getOfferTotalLoss$service_provider_offer_applied_aggregate(
      aggregate: l$aggregate == null
          ? null
          : Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate
              .fromJson((l$aggregate as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate?
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
            is Query$getOfferTotalLoss$service_provider_offer_applied_aggregate) ||
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

extension UtilityExtension$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate
    on Query$getOfferTotalLoss$service_provider_offer_applied_aggregate {
  CopyWith$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate<
          Query$getOfferTotalLoss$service_provider_offer_applied_aggregate>
      get copyWith =>
          CopyWith$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate<
    TRes> {
  factory CopyWith$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate(
    Query$getOfferTotalLoss$service_provider_offer_applied_aggregate instance,
    TRes Function(
            Query$getOfferTotalLoss$service_provider_offer_applied_aggregate)
        then,
  ) = _CopyWithImpl$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate;

  factory CopyWith$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate;

  TRes call({
    Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate?
        aggregate,
    String? $__typename,
  });
  CopyWith$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate<
      TRes> get aggregate;
}

class _CopyWithImpl$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate<
        TRes>
    implements
        CopyWith$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate<
            TRes> {
  _CopyWithImpl$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate(
    this._instance,
    this._then,
  );

  final Query$getOfferTotalLoss$service_provider_offer_applied_aggregate
      _instance;

  final TRes Function(
      Query$getOfferTotalLoss$service_provider_offer_applied_aggregate) _then;

  static const _undefined = {};

  TRes call({
    Object? aggregate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOfferTotalLoss$service_provider_offer_applied_aggregate(
        aggregate: aggregate == _undefined
            ? _instance.aggregate
            : (aggregate
                as Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate<
      TRes> get aggregate {
    final local$aggregate = _instance.aggregate;
    return local$aggregate == null
        ? CopyWith$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate
            .stub(_then(_instance))
        : CopyWith$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate(
            local$aggregate, (e) => call(aggregate: e));
  }
}

class _CopyWithStubImpl$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate<
        TRes>
    implements
        CopyWith$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate<
            TRes> {
  _CopyWithStubImpl$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate(
      this._res);

  TRes _res;

  call({
    Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate?
        aggregate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate<
          TRes>
      get aggregate =>
          CopyWith$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate
              .stub(_res);
}

class Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate {
  Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate({
    this.sum,
    required this.$__typename,
  });

  factory Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$sum = json['sum'];
    final l$$__typename = json['__typename'];
    return Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate(
      sum: l$sum == null
          ? null
          : Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate$sum
              .fromJson((l$sum as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate$sum?
      sum;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$sum = sum;
    _resultData['sum'] = l$sum?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$sum = sum;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$sum,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$sum = sum;
    final lOther$sum = other.sum;
    if (l$sum != lOther$sum) {
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

extension UtilityExtension$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate
    on Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate {
  CopyWith$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate<
          Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate>
      get copyWith =>
          CopyWith$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate<
    TRes> {
  factory CopyWith$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate(
    Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate
        instance,
    TRes Function(
            Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate)
        then,
  ) = _CopyWithImpl$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate;

  factory CopyWith$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate;

  TRes call({
    Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate$sum?
        sum,
    String? $__typename,
  });
  CopyWith$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate$sum<
      TRes> get sum;
}

class _CopyWithImpl$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate<
            TRes> {
  _CopyWithImpl$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate(
    this._instance,
    this._then,
  );

  final Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate
      _instance;

  final TRes Function(
          Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate)
      _then;

  static const _undefined = {};

  TRes call({
    Object? sum = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate(
        sum: sum == _undefined
            ? _instance.sum
            : (sum
                as Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate$sum?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate$sum<
      TRes> get sum {
    final local$sum = _instance.sum;
    return local$sum == null
        ? CopyWith$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate$sum
            .stub(_then(_instance))
        : CopyWith$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate$sum(
            local$sum, (e) => call(sum: e));
  }
}

class _CopyWithStubImpl$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate<
            TRes> {
  _CopyWithStubImpl$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate(
      this._res);

  TRes _res;

  call({
    Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate$sum?
        sum,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate$sum<
          TRes>
      get sum =>
          CopyWith$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate$sum
              .stub(_res);
}

class Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate$sum {
  Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate$sum({
    this.loss,
    required this.$__typename,
  });

  factory Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate$sum.fromJson(
      Map<String, dynamic> json) {
    final l$loss = json['loss'];
    final l$$__typename = json['__typename'];
    return Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate$sum(
      loss: l$loss == null ? null : moneyFromJson(l$loss),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final double? loss;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$loss = loss;
    _resultData['loss'] = l$loss == null ? null : moneyToJson(l$loss);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$loss = loss;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$loss,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate$sum) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$loss = loss;
    final lOther$loss = other.loss;
    if (l$loss != lOther$loss) {
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

extension UtilityExtension$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate$sum
    on Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate$sum {
  CopyWith$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate$sum<
          Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate$sum>
      get copyWith =>
          CopyWith$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate$sum(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate$sum<
    TRes> {
  factory CopyWith$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate$sum(
    Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate$sum
        instance,
    TRes Function(
            Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate$sum)
        then,
  ) = _CopyWithImpl$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate$sum;

  factory CopyWith$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate$sum.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate$sum;

  TRes call({
    double? loss,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate$sum<
        TRes>
    implements
        CopyWith$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate$sum<
            TRes> {
  _CopyWithImpl$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate$sum(
    this._instance,
    this._then,
  );

  final Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate$sum
      _instance;

  final TRes Function(
          Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate$sum)
      _then;

  static const _undefined = {};

  TRes call({
    Object? loss = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate$sum(
        loss: loss == _undefined ? _instance.loss : (loss as double?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate$sum<
        TRes>
    implements
        CopyWith$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate$sum<
            TRes> {
  _CopyWithStubImpl$Query$getOfferTotalLoss$service_provider_offer_applied_aggregate$aggregate$sum(
      this._res);

  TRes _res;

  call({
    double? loss,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getOfferAppliedByOffer {
  factory Variables$Query$getOfferAppliedByOffer({
    required int offer_id,
    int? offset,
    int? limit,
  }) =>
      Variables$Query$getOfferAppliedByOffer._({
        r'offer_id': offer_id,
        if (offset != null) r'offset': offset,
        if (limit != null) r'limit': limit,
      });

  Variables$Query$getOfferAppliedByOffer._(this._$data);

  factory Variables$Query$getOfferAppliedByOffer.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$offer_id = data['offer_id'];
    result$data['offer_id'] = (l$offer_id as int);
    if (data.containsKey('offset')) {
      final l$offset = data['offset'];
      result$data['offset'] = (l$offset as int?);
    }
    if (data.containsKey('limit')) {
      final l$limit = data['limit'];
      result$data['limit'] = (l$limit as int?);
    }
    return Variables$Query$getOfferAppliedByOffer._(result$data);
  }

  Map<String, dynamic> _$data;

  int get offer_id => (_$data['offer_id'] as int);
  int? get offset => (_$data['offset'] as int?);
  int? get limit => (_$data['limit'] as int?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$offer_id = offer_id;
    result$data['offer_id'] = l$offer_id;
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

  CopyWith$Variables$Query$getOfferAppliedByOffer<
          Variables$Query$getOfferAppliedByOffer>
      get copyWith => CopyWith$Variables$Query$getOfferAppliedByOffer(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getOfferAppliedByOffer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$offer_id = offer_id;
    final lOther$offer_id = other.offer_id;
    if (l$offer_id != lOther$offer_id) {
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
    final l$offer_id = offer_id;
    final l$offset = offset;
    final l$limit = limit;
    return Object.hashAll([
      l$offer_id,
      _$data.containsKey('offset') ? l$offset : const {},
      _$data.containsKey('limit') ? l$limit : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$getOfferAppliedByOffer<TRes> {
  factory CopyWith$Variables$Query$getOfferAppliedByOffer(
    Variables$Query$getOfferAppliedByOffer instance,
    TRes Function(Variables$Query$getOfferAppliedByOffer) then,
  ) = _CopyWithImpl$Variables$Query$getOfferAppliedByOffer;

  factory CopyWith$Variables$Query$getOfferAppliedByOffer.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getOfferAppliedByOffer;

  TRes call({
    int? offer_id,
    int? offset,
    int? limit,
  });
}

class _CopyWithImpl$Variables$Query$getOfferAppliedByOffer<TRes>
    implements CopyWith$Variables$Query$getOfferAppliedByOffer<TRes> {
  _CopyWithImpl$Variables$Query$getOfferAppliedByOffer(
    this._instance,
    this._then,
  );

  final Variables$Query$getOfferAppliedByOffer _instance;

  final TRes Function(Variables$Query$getOfferAppliedByOffer) _then;

  static const _undefined = {};

  TRes call({
    Object? offer_id = _undefined,
    Object? offset = _undefined,
    Object? limit = _undefined,
  }) =>
      _then(Variables$Query$getOfferAppliedByOffer._({
        ..._instance._$data,
        if (offer_id != _undefined && offer_id != null)
          'offer_id': (offer_id as int),
        if (offset != _undefined) 'offset': (offset as int?),
        if (limit != _undefined) 'limit': (limit as int?),
      }));
}

class _CopyWithStubImpl$Variables$Query$getOfferAppliedByOffer<TRes>
    implements CopyWith$Variables$Query$getOfferAppliedByOffer<TRes> {
  _CopyWithStubImpl$Variables$Query$getOfferAppliedByOffer(this._res);

  TRes _res;

  call({
    int? offer_id,
    int? offset,
    int? limit,
  }) =>
      _res;
}

class Query$getOfferAppliedByOffer {
  Query$getOfferAppliedByOffer({
    required this.service_provider_offer_applied,
    required this.$__typename,
  });

  factory Query$getOfferAppliedByOffer.fromJson(Map<String, dynamic> json) {
    final l$service_provider_offer_applied =
        json['service_provider_offer_applied'];
    final l$$__typename = json['__typename'];
    return Query$getOfferAppliedByOffer(
      service_provider_offer_applied:
          (l$service_provider_offer_applied as List<dynamic>)
              .map((e) =>
                  Query$getOfferAppliedByOffer$service_provider_offer_applied
                      .fromJson((e as Map<String, dynamic>)))
              .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getOfferAppliedByOffer$service_provider_offer_applied>
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
    if (!(other is Query$getOfferAppliedByOffer) ||
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

extension UtilityExtension$Query$getOfferAppliedByOffer
    on Query$getOfferAppliedByOffer {
  CopyWith$Query$getOfferAppliedByOffer<Query$getOfferAppliedByOffer>
      get copyWith => CopyWith$Query$getOfferAppliedByOffer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOfferAppliedByOffer<TRes> {
  factory CopyWith$Query$getOfferAppliedByOffer(
    Query$getOfferAppliedByOffer instance,
    TRes Function(Query$getOfferAppliedByOffer) then,
  ) = _CopyWithImpl$Query$getOfferAppliedByOffer;

  factory CopyWith$Query$getOfferAppliedByOffer.stub(TRes res) =
      _CopyWithStubImpl$Query$getOfferAppliedByOffer;

  TRes call({
    List<Query$getOfferAppliedByOffer$service_provider_offer_applied>?
        service_provider_offer_applied,
    String? $__typename,
  });
  TRes service_provider_offer_applied(
      Iterable<Query$getOfferAppliedByOffer$service_provider_offer_applied> Function(
              Iterable<
                  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied<
                      Query$getOfferAppliedByOffer$service_provider_offer_applied>>)
          _fn);
}

class _CopyWithImpl$Query$getOfferAppliedByOffer<TRes>
    implements CopyWith$Query$getOfferAppliedByOffer<TRes> {
  _CopyWithImpl$Query$getOfferAppliedByOffer(
    this._instance,
    this._then,
  );

  final Query$getOfferAppliedByOffer _instance;

  final TRes Function(Query$getOfferAppliedByOffer) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_offer_applied = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOfferAppliedByOffer(
        service_provider_offer_applied: service_provider_offer_applied ==
                    _undefined ||
                service_provider_offer_applied == null
            ? _instance.service_provider_offer_applied
            : (service_provider_offer_applied as List<
                Query$getOfferAppliedByOffer$service_provider_offer_applied>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes service_provider_offer_applied(
          Iterable<Query$getOfferAppliedByOffer$service_provider_offer_applied> Function(
                  Iterable<
                      CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied<
                          Query$getOfferAppliedByOffer$service_provider_offer_applied>>)
              _fn) =>
      call(
          service_provider_offer_applied: _fn(
              _instance.service_provider_offer_applied.map((e) =>
                  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getOfferAppliedByOffer<TRes>
    implements CopyWith$Query$getOfferAppliedByOffer<TRes> {
  _CopyWithStubImpl$Query$getOfferAppliedByOffer(this._res);

  TRes _res;

  call({
    List<Query$getOfferAppliedByOffer$service_provider_offer_applied>?
        service_provider_offer_applied,
    String? $__typename,
  }) =>
      _res;
  service_provider_offer_applied(_fn) => _res;
}

const documentNodeQuerygetOfferAppliedByOffer = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getOfferAppliedByOffer'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'offer_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
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
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: 'order_by'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'restaurant_order'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'order_time'),
                    value: EnumValueNode(name: NameNode(value: 'desc')),
                  )
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
            name: NameNode(value: 'comission'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'discount'),
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
            name: NameNode(value: 'influencer_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'loss'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'offer_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'order_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'order_total'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'order_type'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'influencer'),
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
                name: NameNode(value: 'user'),
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
                    name: NameNode(value: 'phone'),
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
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'offer'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'influencer_details'),
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
                name: NameNode(value: 'details'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
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
                    name: NameNode(value: 'phone_number'),
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
            name: NameNode(value: 'restaurant_order'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
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
                    name: NameNode(value: 'details'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
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
                        name: NameNode(value: 'phone_number'),
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
                name: NameNode(value: 'customer'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'user'),
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
                        name: NameNode(value: 'phone'),
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
Query$getOfferAppliedByOffer _parserFn$Query$getOfferAppliedByOffer(
        Map<String, dynamic> data) =>
    Query$getOfferAppliedByOffer.fromJson(data);

class Options$Query$getOfferAppliedByOffer
    extends graphql.QueryOptions<Query$getOfferAppliedByOffer> {
  Options$Query$getOfferAppliedByOffer({
    String? operationName,
    required Variables$Query$getOfferAppliedByOffer variables,
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
          document: documentNodeQuerygetOfferAppliedByOffer,
          parserFn: _parserFn$Query$getOfferAppliedByOffer,
        );
}

class WatchOptions$Query$getOfferAppliedByOffer
    extends graphql.WatchQueryOptions<Query$getOfferAppliedByOffer> {
  WatchOptions$Query$getOfferAppliedByOffer({
    String? operationName,
    required Variables$Query$getOfferAppliedByOffer variables,
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
          document: documentNodeQuerygetOfferAppliedByOffer,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getOfferAppliedByOffer,
        );
}

class FetchMoreOptions$Query$getOfferAppliedByOffer
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getOfferAppliedByOffer({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getOfferAppliedByOffer variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetOfferAppliedByOffer,
        );
}

extension ClientExtension$Query$getOfferAppliedByOffer
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getOfferAppliedByOffer>>
      query$getOfferAppliedByOffer(
              Options$Query$getOfferAppliedByOffer options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getOfferAppliedByOffer>
      watchQuery$getOfferAppliedByOffer(
              WatchOptions$Query$getOfferAppliedByOffer options) =>
          this.watchQuery(options);
  void writeQuery$getOfferAppliedByOffer({
    required Query$getOfferAppliedByOffer data,
    required Variables$Query$getOfferAppliedByOffer variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetOfferAppliedByOffer),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getOfferAppliedByOffer? readQuery$getOfferAppliedByOffer({
    required Variables$Query$getOfferAppliedByOffer variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQuerygetOfferAppliedByOffer),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$getOfferAppliedByOffer.fromJson(result);
  }
}

class Query$getOfferAppliedByOffer$service_provider_offer_applied {
  Query$getOfferAppliedByOffer$service_provider_offer_applied({
    this.comission,
    required this.discount,
    required this.id,
    this.influencer_id,
    this.loss,
    required this.offer_id,
    this.order_id,
    this.order_total,
    required this.order_type,
    this.influencer,
    required this.offer,
    this.restaurant,
    this.restaurant_order,
    required this.$__typename,
  });

  factory Query$getOfferAppliedByOffer$service_provider_offer_applied.fromJson(
      Map<String, dynamic> json) {
    final l$comission = json['comission'];
    final l$discount = json['discount'];
    final l$id = json['id'];
    final l$influencer_id = json['influencer_id'];
    final l$loss = json['loss'];
    final l$offer_id = json['offer_id'];
    final l$order_id = json['order_id'];
    final l$order_total = json['order_total'];
    final l$order_type = json['order_type'];
    final l$influencer = json['influencer'];
    final l$offer = json['offer'];
    final l$restaurant = json['restaurant'];
    final l$restaurant_order = json['restaurant_order'];
    final l$$__typename = json['__typename'];
    return Query$getOfferAppliedByOffer$service_provider_offer_applied(
      comission: l$comission == null ? null : moneyFromJson(l$comission),
      discount: moneyFromJson(l$discount),
      id: (l$id as int),
      influencer_id: (l$influencer_id as int?),
      loss: l$loss == null ? null : moneyFromJson(l$loss),
      offer_id: (l$offer_id as int),
      order_id: (l$order_id as int?),
      order_total: l$order_total == null ? null : moneyFromJson(l$order_total),
      order_type: (l$order_type as String),
      influencer: l$influencer == null
          ? null
          : Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer
              .fromJson((l$influencer as Map<String, dynamic>)),
      offer: Query$getOfferAppliedByOffer$service_provider_offer_applied$offer
          .fromJson((l$offer as Map<String, dynamic>)),
      restaurant: l$restaurant == null
          ? null
          : Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant
              .fromJson((l$restaurant as Map<String, dynamic>)),
      restaurant_order: l$restaurant_order == null
          ? null
          : Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order
              .fromJson((l$restaurant_order as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final double? comission;

  final double discount;

  final int id;

  final int? influencer_id;

  final double? loss;

  final int offer_id;

  final int? order_id;

  final double? order_total;

  final String order_type;

  final Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer?
      influencer;

  final Query$getOfferAppliedByOffer$service_provider_offer_applied$offer offer;

  final Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant?
      restaurant;

  final Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order?
      restaurant_order;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$comission = comission;
    _resultData['comission'] =
        l$comission == null ? null : moneyToJson(l$comission);
    final l$discount = discount;
    _resultData['discount'] = moneyToJson(l$discount);
    final l$id = id;
    _resultData['id'] = l$id;
    final l$influencer_id = influencer_id;
    _resultData['influencer_id'] = l$influencer_id;
    final l$loss = loss;
    _resultData['loss'] = l$loss == null ? null : moneyToJson(l$loss);
    final l$offer_id = offer_id;
    _resultData['offer_id'] = l$offer_id;
    final l$order_id = order_id;
    _resultData['order_id'] = l$order_id;
    final l$order_total = order_total;
    _resultData['order_total'] =
        l$order_total == null ? null : moneyToJson(l$order_total);
    final l$order_type = order_type;
    _resultData['order_type'] = l$order_type;
    final l$influencer = influencer;
    _resultData['influencer'] = l$influencer?.toJson();
    final l$offer = offer;
    _resultData['offer'] = l$offer.toJson();
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant?.toJson();
    final l$restaurant_order = restaurant_order;
    _resultData['restaurant_order'] = l$restaurant_order?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$comission = comission;
    final l$discount = discount;
    final l$id = id;
    final l$influencer_id = influencer_id;
    final l$loss = loss;
    final l$offer_id = offer_id;
    final l$order_id = order_id;
    final l$order_total = order_total;
    final l$order_type = order_type;
    final l$influencer = influencer;
    final l$offer = offer;
    final l$restaurant = restaurant;
    final l$restaurant_order = restaurant_order;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$comission,
      l$discount,
      l$id,
      l$influencer_id,
      l$loss,
      l$offer_id,
      l$order_id,
      l$order_total,
      l$order_type,
      l$influencer,
      l$offer,
      l$restaurant,
      l$restaurant_order,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getOfferAppliedByOffer$service_provider_offer_applied) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$comission = comission;
    final lOther$comission = other.comission;
    if (l$comission != lOther$comission) {
      return false;
    }
    final l$discount = discount;
    final lOther$discount = other.discount;
    if (l$discount != lOther$discount) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$influencer_id = influencer_id;
    final lOther$influencer_id = other.influencer_id;
    if (l$influencer_id != lOther$influencer_id) {
      return false;
    }
    final l$loss = loss;
    final lOther$loss = other.loss;
    if (l$loss != lOther$loss) {
      return false;
    }
    final l$offer_id = offer_id;
    final lOther$offer_id = other.offer_id;
    if (l$offer_id != lOther$offer_id) {
      return false;
    }
    final l$order_id = order_id;
    final lOther$order_id = other.order_id;
    if (l$order_id != lOther$order_id) {
      return false;
    }
    final l$order_total = order_total;
    final lOther$order_total = other.order_total;
    if (l$order_total != lOther$order_total) {
      return false;
    }
    final l$order_type = order_type;
    final lOther$order_type = other.order_type;
    if (l$order_type != lOther$order_type) {
      return false;
    }
    final l$influencer = influencer;
    final lOther$influencer = other.influencer;
    if (l$influencer != lOther$influencer) {
      return false;
    }
    final l$offer = offer;
    final lOther$offer = other.offer;
    if (l$offer != lOther$offer) {
      return false;
    }
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (l$restaurant != lOther$restaurant) {
      return false;
    }
    final l$restaurant_order = restaurant_order;
    final lOther$restaurant_order = other.restaurant_order;
    if (l$restaurant_order != lOther$restaurant_order) {
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

extension UtilityExtension$Query$getOfferAppliedByOffer$service_provider_offer_applied
    on Query$getOfferAppliedByOffer$service_provider_offer_applied {
  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied<
          Query$getOfferAppliedByOffer$service_provider_offer_applied>
      get copyWith =>
          CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied<
    TRes> {
  factory CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied(
    Query$getOfferAppliedByOffer$service_provider_offer_applied instance,
    TRes Function(Query$getOfferAppliedByOffer$service_provider_offer_applied)
        then,
  ) = _CopyWithImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied;

  factory CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied;

  TRes call({
    double? comission,
    double? discount,
    int? id,
    int? influencer_id,
    double? loss,
    int? offer_id,
    int? order_id,
    double? order_total,
    String? order_type,
    Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer?
        influencer,
    Query$getOfferAppliedByOffer$service_provider_offer_applied$offer? offer,
    Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant?
        restaurant,
    Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order?
        restaurant_order,
    String? $__typename,
  });
  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer<
      TRes> get influencer;
  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$offer<
      TRes> get offer;
  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant<
      TRes> get restaurant;
  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order<
      TRes> get restaurant_order;
}

class _CopyWithImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied<
        TRes>
    implements
        CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied<
            TRes> {
  _CopyWithImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied(
    this._instance,
    this._then,
  );

  final Query$getOfferAppliedByOffer$service_provider_offer_applied _instance;

  final TRes Function(
      Query$getOfferAppliedByOffer$service_provider_offer_applied) _then;

  static const _undefined = {};

  TRes call({
    Object? comission = _undefined,
    Object? discount = _undefined,
    Object? id = _undefined,
    Object? influencer_id = _undefined,
    Object? loss = _undefined,
    Object? offer_id = _undefined,
    Object? order_id = _undefined,
    Object? order_total = _undefined,
    Object? order_type = _undefined,
    Object? influencer = _undefined,
    Object? offer = _undefined,
    Object? restaurant = _undefined,
    Object? restaurant_order = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOfferAppliedByOffer$service_provider_offer_applied(
        comission: comission == _undefined
            ? _instance.comission
            : (comission as double?),
        discount: discount == _undefined || discount == null
            ? _instance.discount
            : (discount as double),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        influencer_id: influencer_id == _undefined
            ? _instance.influencer_id
            : (influencer_id as int?),
        loss: loss == _undefined ? _instance.loss : (loss as double?),
        offer_id: offer_id == _undefined || offer_id == null
            ? _instance.offer_id
            : (offer_id as int),
        order_id:
            order_id == _undefined ? _instance.order_id : (order_id as int?),
        order_total: order_total == _undefined
            ? _instance.order_total
            : (order_total as double?),
        order_type: order_type == _undefined || order_type == null
            ? _instance.order_type
            : (order_type as String),
        influencer: influencer == _undefined
            ? _instance.influencer
            : (influencer
                as Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer?),
        offer: offer == _undefined || offer == null
            ? _instance.offer
            : (offer
                as Query$getOfferAppliedByOffer$service_provider_offer_applied$offer),
        restaurant: restaurant == _undefined
            ? _instance.restaurant
            : (restaurant
                as Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant?),
        restaurant_order: restaurant_order == _undefined
            ? _instance.restaurant_order
            : (restaurant_order
                as Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer<
      TRes> get influencer {
    final local$influencer = _instance.influencer;
    return local$influencer == null
        ? CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer
            .stub(_then(_instance))
        : CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer(
            local$influencer, (e) => call(influencer: e));
  }

  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$offer<
      TRes> get offer {
    final local$offer = _instance.offer;
    return CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$offer(
        local$offer, (e) => call(offer: e));
  }

  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant<
      TRes> get restaurant {
    final local$restaurant = _instance.restaurant;
    return local$restaurant == null
        ? CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant
            .stub(_then(_instance))
        : CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant(
            local$restaurant, (e) => call(restaurant: e));
  }

  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order<
      TRes> get restaurant_order {
    final local$restaurant_order = _instance.restaurant_order;
    return local$restaurant_order == null
        ? CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order
            .stub(_then(_instance))
        : CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order(
            local$restaurant_order, (e) => call(restaurant_order: e));
  }
}

class _CopyWithStubImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied<
        TRes>
    implements
        CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied<
            TRes> {
  _CopyWithStubImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied(
      this._res);

  TRes _res;

  call({
    double? comission,
    double? discount,
    int? id,
    int? influencer_id,
    double? loss,
    int? offer_id,
    int? order_id,
    double? order_total,
    String? order_type,
    Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer?
        influencer,
    Query$getOfferAppliedByOffer$service_provider_offer_applied$offer? offer,
    Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant?
        restaurant,
    Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order?
        restaurant_order,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer<
          TRes>
      get influencer =>
          CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer
              .stub(_res);
  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$offer<
          TRes>
      get offer =>
          CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$offer
              .stub(_res);
  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant<
          TRes>
      get restaurant =>
          CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant
              .stub(_res);
  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order<
          TRes>
      get restaurant_order =>
          CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order
              .stub(_res);
}

class Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer {
  Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer({
    required this.id,
    this.user,
    required this.$__typename,
  });

  factory Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer(
      id: (l$id as int),
      user: l$user == null
          ? null
          : Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer$user
              .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer$user?
      user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$user = user;
    _resultData['user'] = l$user?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$user,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
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

extension UtilityExtension$Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer
    on Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer {
  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer<
          Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer>
      get copyWith =>
          CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer<
    TRes> {
  factory CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer(
    Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer
        instance,
    TRes Function(
            Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer)
        then,
  ) = _CopyWithImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer;

  factory CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer;

  TRes call({
    int? id,
    Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer$user?
        user,
    String? $__typename,
  });
  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer$user<
      TRes> get user;
}

class _CopyWithImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer<
        TRes>
    implements
        CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer<
            TRes> {
  _CopyWithImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer(
    this._instance,
    this._then,
  );

  final Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer
      _instance;

  final TRes Function(
          Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        user: user == _undefined
            ? _instance.user
            : (user
                as Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer$user?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer$user<
      TRes> get user {
    final local$user = _instance.user;
    return local$user == null
        ? CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer$user
            .stub(_then(_instance))
        : CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer$user(
            local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer<
        TRes>
    implements
        CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer<
            TRes> {
  _CopyWithStubImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer$user?
        user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer$user<
          TRes>
      get user =>
          CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer$user
              .stub(_res);
}

class Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer$user {
  Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer$user({
    required this.id,
    this.phone,
    this.image,
    this.name,
    required this.$__typename,
  });

  factory Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer$user.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$phone = json['phone'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer$user(
      id: (l$id as int),
      phone: (l$phone as String?),
      image: (l$image as String?),
      name: (l$name as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? phone;

  final String? image;

  final String? name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$phone = phone;
    _resultData['phone'] = l$phone;
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
    final l$phone = phone;
    final l$image = image;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$phone,
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
            is Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer$user) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (l$phone != lOther$phone) {
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

extension UtilityExtension$Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer$user
    on Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer$user {
  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer$user<
          Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer$user>
      get copyWith =>
          CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer$user<
    TRes> {
  factory CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer$user(
    Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer$user
        instance,
    TRes Function(
            Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer$user)
        then,
  ) = _CopyWithImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer$user;

  factory CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer$user;

  TRes call({
    int? id,
    String? phone,
    String? image,
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer$user<
        TRes>
    implements
        CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer$user<
            TRes> {
  _CopyWithImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer$user(
    this._instance,
    this._then,
  );

  final Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer$user
      _instance;

  final TRes Function(
          Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? phone = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer$user(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        phone: phone == _undefined ? _instance.phone : (phone as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        name: name == _undefined ? _instance.name : (name as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer$user<
        TRes>
    implements
        CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer$user<
            TRes> {
  _CopyWithStubImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$influencer$user(
      this._res);

  TRes _res;

  call({
    int? id,
    String? phone,
    String? image,
    String? name,
    String? $__typename,
  }) =>
      _res;
}

class Query$getOfferAppliedByOffer$service_provider_offer_applied$offer {
  Query$getOfferAppliedByOffer$service_provider_offer_applied$offer({
    this.influencer_details,
    required this.$__typename,
  });

  factory Query$getOfferAppliedByOffer$service_provider_offer_applied$offer.fromJson(
      Map<String, dynamic> json) {
    final l$influencer_details = json['influencer_details'];
    final l$$__typename = json['__typename'];
    return Query$getOfferAppliedByOffer$service_provider_offer_applied$offer(
      influencer_details: l$influencer_details == null
          ? null
          : mapFromJson(l$influencer_details),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final dynamic? influencer_details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$influencer_details = influencer_details;
    _resultData['influencer_details'] =
        l$influencer_details == null ? null : mapToJson(l$influencer_details);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$influencer_details = influencer_details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$influencer_details,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getOfferAppliedByOffer$service_provider_offer_applied$offer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$influencer_details = influencer_details;
    final lOther$influencer_details = other.influencer_details;
    if (l$influencer_details != lOther$influencer_details) {
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

extension UtilityExtension$Query$getOfferAppliedByOffer$service_provider_offer_applied$offer
    on Query$getOfferAppliedByOffer$service_provider_offer_applied$offer {
  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$offer<
          Query$getOfferAppliedByOffer$service_provider_offer_applied$offer>
      get copyWith =>
          CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$offer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$offer<
    TRes> {
  factory CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$offer(
    Query$getOfferAppliedByOffer$service_provider_offer_applied$offer instance,
    TRes Function(
            Query$getOfferAppliedByOffer$service_provider_offer_applied$offer)
        then,
  ) = _CopyWithImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$offer;

  factory CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$offer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$offer;

  TRes call({
    dynamic? influencer_details,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$offer<
        TRes>
    implements
        CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$offer<
            TRes> {
  _CopyWithImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$offer(
    this._instance,
    this._then,
  );

  final Query$getOfferAppliedByOffer$service_provider_offer_applied$offer
      _instance;

  final TRes Function(
      Query$getOfferAppliedByOffer$service_provider_offer_applied$offer) _then;

  static const _undefined = {};

  TRes call({
    Object? influencer_details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOfferAppliedByOffer$service_provider_offer_applied$offer(
        influencer_details: influencer_details == _undefined
            ? _instance.influencer_details
            : (influencer_details as dynamic?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$offer<
        TRes>
    implements
        CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$offer<
            TRes> {
  _CopyWithStubImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$offer(
      this._res);

  TRes _res;

  call({
    dynamic? influencer_details,
    String? $__typename,
  }) =>
      _res;
}

class Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant {
  Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant({
    required this.id,
    this.details,
    required this.$__typename,
  });

  factory Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant(
      id: (l$id as int),
      details: l$details == null
          ? null
          : Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details?
      details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$details = details;
    _resultData['details'] = l$details?.toJson();
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
    if (!(other
            is Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant) ||
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

extension UtilityExtension$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant
    on Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant {
  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant<
          Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant>
      get copyWith =>
          CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant<
    TRes> {
  factory CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant(
    Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant
        instance,
    TRes Function(
            Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant)
        then,
  ) = _CopyWithImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant;

  factory CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant;

  TRes call({
    int? id,
    Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details?
        details,
    String? $__typename,
  });
  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details<
      TRes> get details;
}

class _CopyWithImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant<
        TRes>
    implements
        CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant<
            TRes> {
  _CopyWithImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant(
    this._instance,
    this._then,
  );

  final Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant
      _instance;

  final TRes Function(
          Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        details: details == _undefined
            ? _instance.details
            : (details
                as Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details<
      TRes> get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details
            .stub(_then(_instance))
        : CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant<
        TRes>
    implements
        CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant<
            TRes> {
  _CopyWithStubImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details<
          TRes>
      get details =>
          CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details
              .stub(_res);
}

class Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details {
  Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details({
    required this.image,
    required this.name,
    this.phone_number,
    required this.location,
    required this.$__typename,
  });

  factory Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details.fromJson(
      Map<String, dynamic> json) {
    final l$image = json['image'];
    final l$name = json['name'];
    final l$phone_number = json['phone_number'];
    final l$location = json['location'];
    final l$$__typename = json['__typename'];
    return Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details(
      image: (l$image as String),
      name: (l$name as String),
      phone_number: (l$phone_number as String?),
      location:
          Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details$location
              .fromJson((l$location as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String image;

  final String name;

  final String? phone_number;

  final Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details$location
      location;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$image = image;
    _resultData['image'] = l$image;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$phone_number = phone_number;
    _resultData['phone_number'] = l$phone_number;
    final l$location = location;
    _resultData['location'] = l$location.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$image = image;
    final l$name = name;
    final l$phone_number = phone_number;
    final l$location = location;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$image,
      l$name,
      l$phone_number,
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
            is Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details) ||
        runtimeType != other.runtimeType) {
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
    final l$phone_number = phone_number;
    final lOther$phone_number = other.phone_number;
    if (l$phone_number != lOther$phone_number) {
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

extension UtilityExtension$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details
    on Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details {
  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details<
          Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details>
      get copyWith =>
          CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details<
    TRes> {
  factory CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details(
    Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details
        instance,
    TRes Function(
            Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details)
        then,
  ) = _CopyWithImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details;

  factory CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details;

  TRes call({
    String? image,
    String? name,
    String? phone_number,
    Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details$location?
        location,
    String? $__typename,
  });
  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details$location<
      TRes> get location;
}

class _CopyWithImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details<
        TRes>
    implements
        CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details<
            TRes> {
  _CopyWithImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details(
    this._instance,
    this._then,
  );

  final Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details
      _instance;

  final TRes Function(
          Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? image = _undefined,
    Object? name = _undefined,
    Object? phone_number = _undefined,
    Object? location = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details(
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        phone_number: phone_number == _undefined
            ? _instance.phone_number
            : (phone_number as String?),
        location: location == _undefined || location == null
            ? _instance.location
            : (location
                as Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details$location),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details$location<
      TRes> get location {
    final local$location = _instance.location;
    return CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details$location(
        local$location, (e) => call(location: e));
  }
}

class _CopyWithStubImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details<
        TRes>
    implements
        CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details<
            TRes> {
  _CopyWithStubImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details(
      this._res);

  TRes _res;

  call({
    String? image,
    String? name,
    String? phone_number,
    Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details$location?
        location,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details$location<
          TRes>
      get location =>
          CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details$location
              .stub(_res);
}

class Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details$location {
  Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details$location({
    required this.gps,
    required this.address,
    required this.$__typename,
  });

  factory Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details$location.fromJson(
      Map<String, dynamic> json) {
    final l$gps = json['gps'];
    final l$address = json['address'];
    final l$$__typename = json['__typename'];
    return Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details$location(
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
            is Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details$location) ||
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

extension UtilityExtension$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details$location
    on Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details$location {
  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details$location<
          Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details$location>
      get copyWith =>
          CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details$location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details$location<
    TRes> {
  factory CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details$location(
    Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details$location
        instance,
    TRes Function(
            Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details$location)
        then,
  ) = _CopyWithImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details$location;

  factory CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details$location.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details$location;

  TRes call({
    Geography? gps,
    String? address,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details$location<
        TRes>
    implements
        CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details$location<
            TRes> {
  _CopyWithImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details$location(
    this._instance,
    this._then,
  );

  final Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details$location
      _instance;

  final TRes Function(
          Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details$location)
      _then;

  static const _undefined = {};

  TRes call({
    Object? gps = _undefined,
    Object? address = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details$location(
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

class _CopyWithStubImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details$location<
        TRes>
    implements
        CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details$location<
            TRes> {
  _CopyWithStubImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant$details$location(
      this._res);

  TRes _res;

  call({
    Geography? gps,
    String? address,
    String? $__typename,
  }) =>
      _res;
}

class Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order {
  Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order({
    required this.restaurant,
    required this.customer,
    required this.$__typename,
  });

  factory Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order.fromJson(
      Map<String, dynamic> json) {
    final l$restaurant = json['restaurant'];
    final l$customer = json['customer'];
    final l$$__typename = json['__typename'];
    return Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order(
      restaurant:
          Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant
              .fromJson((l$restaurant as Map<String, dynamic>)),
      customer:
          Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer
              .fromJson((l$customer as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant
      restaurant;

  final Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer
      customer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant.toJson();
    final l$customer = customer;
    _resultData['customer'] = l$customer.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant = restaurant;
    final l$customer = customer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$restaurant,
      l$customer,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (l$restaurant != lOther$restaurant) {
      return false;
    }
    final l$customer = customer;
    final lOther$customer = other.customer;
    if (l$customer != lOther$customer) {
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

extension UtilityExtension$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order
    on Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order {
  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order<
          Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order>
      get copyWith =>
          CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order<
    TRes> {
  factory CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order(
    Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order
        instance,
    TRes Function(
            Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order)
        then,
  ) = _CopyWithImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order;

  factory CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order;

  TRes call({
    Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant?
        restaurant,
    Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer?
        customer,
    String? $__typename,
  });
  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant<
      TRes> get restaurant;
  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer<
      TRes> get customer;
}

class _CopyWithImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order<
        TRes>
    implements
        CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order<
            TRes> {
  _CopyWithImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order(
    this._instance,
    this._then,
  );

  final Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order
      _instance;

  final TRes Function(
          Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order)
      _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant = _undefined,
    Object? customer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order(
        restaurant: restaurant == _undefined || restaurant == null
            ? _instance.restaurant
            : (restaurant
                as Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant),
        customer: customer == _undefined || customer == null
            ? _instance.customer
            : (customer
                as Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant<
      TRes> get restaurant {
    final local$restaurant = _instance.restaurant;
    return CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant(
        local$restaurant, (e) => call(restaurant: e));
  }

  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer<
      TRes> get customer {
    final local$customer = _instance.customer;
    return CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer(
        local$customer, (e) => call(customer: e));
  }
}

class _CopyWithStubImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order<
        TRes>
    implements
        CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order<
            TRes> {
  _CopyWithStubImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order(
      this._res);

  TRes _res;

  call({
    Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant?
        restaurant,
    Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer?
        customer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant<
          TRes>
      get restaurant =>
          CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant
              .stub(_res);
  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer<
          TRes>
      get customer =>
          CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer
              .stub(_res);
}

class Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant {
  Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant({
    required this.id,
    this.details,
    required this.$__typename,
  });

  factory Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant(
      id: (l$id as int),
      details: l$details == null
          ? null
          : Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details?
      details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$details = details;
    _resultData['details'] = l$details?.toJson();
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
    if (!(other
            is Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant) ||
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

extension UtilityExtension$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant
    on Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant {
  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant<
          Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant>
      get copyWith =>
          CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant<
    TRes> {
  factory CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant(
    Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant
        instance,
    TRes Function(
            Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant)
        then,
  ) = _CopyWithImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant;

  factory CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant;

  TRes call({
    int? id,
    Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details?
        details,
    String? $__typename,
  });
  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details<
      TRes> get details;
}

class _CopyWithImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant<
        TRes>
    implements
        CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant<
            TRes> {
  _CopyWithImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant(
    this._instance,
    this._then,
  );

  final Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant
      _instance;

  final TRes Function(
          Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        details: details == _undefined
            ? _instance.details
            : (details
                as Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details<
      TRes> get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details
            .stub(_then(_instance))
        : CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant<
        TRes>
    implements
        CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant<
            TRes> {
  _CopyWithStubImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details<
          TRes>
      get details =>
          CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details
              .stub(_res);
}

class Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details {
  Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details({
    required this.image,
    required this.name,
    this.phone_number,
    required this.location,
    required this.$__typename,
  });

  factory Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details.fromJson(
      Map<String, dynamic> json) {
    final l$image = json['image'];
    final l$name = json['name'];
    final l$phone_number = json['phone_number'];
    final l$location = json['location'];
    final l$$__typename = json['__typename'];
    return Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details(
      image: (l$image as String),
      name: (l$name as String),
      phone_number: (l$phone_number as String?),
      location:
          Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details$location
              .fromJson((l$location as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String image;

  final String name;

  final String? phone_number;

  final Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details$location
      location;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$image = image;
    _resultData['image'] = l$image;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$phone_number = phone_number;
    _resultData['phone_number'] = l$phone_number;
    final l$location = location;
    _resultData['location'] = l$location.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$image = image;
    final l$name = name;
    final l$phone_number = phone_number;
    final l$location = location;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$image,
      l$name,
      l$phone_number,
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
            is Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details) ||
        runtimeType != other.runtimeType) {
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
    final l$phone_number = phone_number;
    final lOther$phone_number = other.phone_number;
    if (l$phone_number != lOther$phone_number) {
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

extension UtilityExtension$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details
    on Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details {
  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details<
          Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details>
      get copyWith =>
          CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details<
    TRes> {
  factory CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details(
    Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details
        instance,
    TRes Function(
            Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details)
        then,
  ) = _CopyWithImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details;

  factory CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details;

  TRes call({
    String? image,
    String? name,
    String? phone_number,
    Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details$location?
        location,
    String? $__typename,
  });
  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details$location<
      TRes> get location;
}

class _CopyWithImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details<
        TRes>
    implements
        CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details<
            TRes> {
  _CopyWithImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details(
    this._instance,
    this._then,
  );

  final Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details
      _instance;

  final TRes Function(
          Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? image = _undefined,
    Object? name = _undefined,
    Object? phone_number = _undefined,
    Object? location = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details(
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        phone_number: phone_number == _undefined
            ? _instance.phone_number
            : (phone_number as String?),
        location: location == _undefined || location == null
            ? _instance.location
            : (location
                as Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details$location),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details$location<
      TRes> get location {
    final local$location = _instance.location;
    return CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details$location(
        local$location, (e) => call(location: e));
  }
}

class _CopyWithStubImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details<
        TRes>
    implements
        CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details<
            TRes> {
  _CopyWithStubImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details(
      this._res);

  TRes _res;

  call({
    String? image,
    String? name,
    String? phone_number,
    Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details$location?
        location,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details$location<
          TRes>
      get location =>
          CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details$location
              .stub(_res);
}

class Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details$location {
  Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details$location({
    required this.gps,
    required this.address,
    required this.$__typename,
  });

  factory Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details$location.fromJson(
      Map<String, dynamic> json) {
    final l$gps = json['gps'];
    final l$address = json['address'];
    final l$$__typename = json['__typename'];
    return Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details$location(
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
            is Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details$location) ||
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

extension UtilityExtension$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details$location
    on Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details$location {
  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details$location<
          Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details$location>
      get copyWith =>
          CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details$location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details$location<
    TRes> {
  factory CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details$location(
    Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details$location
        instance,
    TRes Function(
            Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details$location)
        then,
  ) = _CopyWithImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details$location;

  factory CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details$location.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details$location;

  TRes call({
    Geography? gps,
    String? address,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details$location<
        TRes>
    implements
        CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details$location<
            TRes> {
  _CopyWithImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details$location(
    this._instance,
    this._then,
  );

  final Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details$location
      _instance;

  final TRes Function(
          Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details$location)
      _then;

  static const _undefined = {};

  TRes call({
    Object? gps = _undefined,
    Object? address = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details$location(
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

class _CopyWithStubImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details$location<
        TRes>
    implements
        CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details$location<
            TRes> {
  _CopyWithStubImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$restaurant$details$location(
      this._res);

  TRes _res;

  call({
    Geography? gps,
    String? address,
    String? $__typename,
  }) =>
      _res;
}

class Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer {
  Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer({
    required this.user,
    required this.$__typename,
  });

  factory Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer(
      user:
          Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer$user
              .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer$user
      user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
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

extension UtilityExtension$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer
    on Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer {
  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer<
          Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer>
      get copyWith =>
          CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer<
    TRes> {
  factory CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer(
    Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer
        instance,
    TRes Function(
            Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer)
        then,
  ) = _CopyWithImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer;

  factory CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer;

  TRes call({
    Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer$user?
        user,
    String? $__typename,
  });
  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer$user<
      TRes> get user;
}

class _CopyWithImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer<
        TRes>
    implements
        CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer<
            TRes> {
  _CopyWithImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer(
    this._instance,
    this._then,
  );

  final Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer
      _instance;

  final TRes Function(
          Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer(
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer<
        TRes>
    implements
        CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer<
            TRes> {
  _CopyWithStubImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer(
      this._res);

  TRes _res;

  call({
    Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer$user?
        user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer$user<
          TRes>
      get user =>
          CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer$user
              .stub(_res);
}

class Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer$user {
  Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer$user({
    required this.id,
    this.phone,
    this.image,
    this.name,
    required this.$__typename,
  });

  factory Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$phone = json['phone'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer$user(
      id: (l$id as int),
      phone: (l$phone as String?),
      image: (l$image as String?),
      name: (l$name as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? phone;

  final String? image;

  final String? name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$phone = phone;
    _resultData['phone'] = l$phone;
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
    final l$phone = phone;
    final l$image = image;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$phone,
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
            is Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer$user) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (l$phone != lOther$phone) {
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

extension UtilityExtension$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer$user
    on Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer$user {
  CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer$user<
          Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer$user>
      get copyWith =>
          CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer$user<
    TRes> {
  factory CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer$user(
    Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer$user
        instance,
    TRes Function(
            Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer$user)
        then,
  ) = _CopyWithImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer$user;

  factory CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer$user;

  TRes call({
    int? id,
    String? phone,
    String? image,
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer$user<
        TRes>
    implements
        CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer$user<
            TRes> {
  _CopyWithImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer$user(
    this._instance,
    this._then,
  );

  final Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer$user
      _instance;

  final TRes Function(
          Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? phone = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer$user(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        phone: phone == _undefined ? _instance.phone : (phone as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        name: name == _undefined ? _instance.name : (name as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer$user<
        TRes>
    implements
        CopyWith$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer$user<
            TRes> {
  _CopyWithStubImpl$Query$getOfferAppliedByOffer$service_provider_offer_applied$restaurant_order$customer$user(
      this._res);

  TRes _res;

  call({
    int? id,
    String? phone,
    String? image,
    String? name,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$insertInfluencerPayout {
  factory Variables$Mutation$insertInfluencerPayout(
          {required Input$service_provider_influencer_payouts_insert_input
              object}) =>
      Variables$Mutation$insertInfluencerPayout._({
        r'object': object,
      });

  Variables$Mutation$insertInfluencerPayout._(this._$data);

  factory Variables$Mutation$insertInfluencerPayout.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$object = data['object'];
    result$data['object'] =
        Input$service_provider_influencer_payouts_insert_input.fromJson(
            (l$object as Map<String, dynamic>));
    return Variables$Mutation$insertInfluencerPayout._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$service_provider_influencer_payouts_insert_input get object =>
      (_$data['object']
          as Input$service_provider_influencer_payouts_insert_input);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$object = object;
    result$data['object'] = l$object.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$insertInfluencerPayout<
          Variables$Mutation$insertInfluencerPayout>
      get copyWith => CopyWith$Variables$Mutation$insertInfluencerPayout(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$insertInfluencerPayout) ||
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

abstract class CopyWith$Variables$Mutation$insertInfluencerPayout<TRes> {
  factory CopyWith$Variables$Mutation$insertInfluencerPayout(
    Variables$Mutation$insertInfluencerPayout instance,
    TRes Function(Variables$Mutation$insertInfluencerPayout) then,
  ) = _CopyWithImpl$Variables$Mutation$insertInfluencerPayout;

  factory CopyWith$Variables$Mutation$insertInfluencerPayout.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$insertInfluencerPayout;

  TRes call({Input$service_provider_influencer_payouts_insert_input? object});
}

class _CopyWithImpl$Variables$Mutation$insertInfluencerPayout<TRes>
    implements CopyWith$Variables$Mutation$insertInfluencerPayout<TRes> {
  _CopyWithImpl$Variables$Mutation$insertInfluencerPayout(
    this._instance,
    this._then,
  );

  final Variables$Mutation$insertInfluencerPayout _instance;

  final TRes Function(Variables$Mutation$insertInfluencerPayout) _then;

  static const _undefined = {};

  TRes call({Object? object = _undefined}) =>
      _then(Variables$Mutation$insertInfluencerPayout._({
        ..._instance._$data,
        if (object != _undefined && object != null)
          'object': (object
              as Input$service_provider_influencer_payouts_insert_input),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$insertInfluencerPayout<TRes>
    implements CopyWith$Variables$Mutation$insertInfluencerPayout<TRes> {
  _CopyWithStubImpl$Variables$Mutation$insertInfluencerPayout(this._res);

  TRes _res;

  call({Input$service_provider_influencer_payouts_insert_input? object}) =>
      _res;
}

class Mutation$insertInfluencerPayout {
  Mutation$insertInfluencerPayout({
    this.insert_service_provider_influencer_payouts_one,
    required this.$__typename,
  });

  factory Mutation$insertInfluencerPayout.fromJson(Map<String, dynamic> json) {
    final l$insert_service_provider_influencer_payouts_one =
        json['insert_service_provider_influencer_payouts_one'];
    final l$$__typename = json['__typename'];
    return Mutation$insertInfluencerPayout(
      insert_service_provider_influencer_payouts_one:
          l$insert_service_provider_influencer_payouts_one == null
              ? null
              : Mutation$insertInfluencerPayout$insert_service_provider_influencer_payouts_one
                  .fromJson((l$insert_service_provider_influencer_payouts_one
                      as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$insertInfluencerPayout$insert_service_provider_influencer_payouts_one?
      insert_service_provider_influencer_payouts_one;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insert_service_provider_influencer_payouts_one =
        insert_service_provider_influencer_payouts_one;
    _resultData['insert_service_provider_influencer_payouts_one'] =
        l$insert_service_provider_influencer_payouts_one?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insert_service_provider_influencer_payouts_one =
        insert_service_provider_influencer_payouts_one;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$insert_service_provider_influencer_payouts_one,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$insertInfluencerPayout) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$insert_service_provider_influencer_payouts_one =
        insert_service_provider_influencer_payouts_one;
    final lOther$insert_service_provider_influencer_payouts_one =
        other.insert_service_provider_influencer_payouts_one;
    if (l$insert_service_provider_influencer_payouts_one !=
        lOther$insert_service_provider_influencer_payouts_one) {
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

extension UtilityExtension$Mutation$insertInfluencerPayout
    on Mutation$insertInfluencerPayout {
  CopyWith$Mutation$insertInfluencerPayout<Mutation$insertInfluencerPayout>
      get copyWith => CopyWith$Mutation$insertInfluencerPayout(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$insertInfluencerPayout<TRes> {
  factory CopyWith$Mutation$insertInfluencerPayout(
    Mutation$insertInfluencerPayout instance,
    TRes Function(Mutation$insertInfluencerPayout) then,
  ) = _CopyWithImpl$Mutation$insertInfluencerPayout;

  factory CopyWith$Mutation$insertInfluencerPayout.stub(TRes res) =
      _CopyWithStubImpl$Mutation$insertInfluencerPayout;

  TRes call({
    Mutation$insertInfluencerPayout$insert_service_provider_influencer_payouts_one?
        insert_service_provider_influencer_payouts_one,
    String? $__typename,
  });
  CopyWith$Mutation$insertInfluencerPayout$insert_service_provider_influencer_payouts_one<
      TRes> get insert_service_provider_influencer_payouts_one;
}

class _CopyWithImpl$Mutation$insertInfluencerPayout<TRes>
    implements CopyWith$Mutation$insertInfluencerPayout<TRes> {
  _CopyWithImpl$Mutation$insertInfluencerPayout(
    this._instance,
    this._then,
  );

  final Mutation$insertInfluencerPayout _instance;

  final TRes Function(Mutation$insertInfluencerPayout) _then;

  static const _undefined = {};

  TRes call({
    Object? insert_service_provider_influencer_payouts_one = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$insertInfluencerPayout(
        insert_service_provider_influencer_payouts_one:
            insert_service_provider_influencer_payouts_one == _undefined
                ? _instance.insert_service_provider_influencer_payouts_one
                : (insert_service_provider_influencer_payouts_one
                    as Mutation$insertInfluencerPayout$insert_service_provider_influencer_payouts_one?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$insertInfluencerPayout$insert_service_provider_influencer_payouts_one<
      TRes> get insert_service_provider_influencer_payouts_one {
    final local$insert_service_provider_influencer_payouts_one =
        _instance.insert_service_provider_influencer_payouts_one;
    return local$insert_service_provider_influencer_payouts_one == null
        ? CopyWith$Mutation$insertInfluencerPayout$insert_service_provider_influencer_payouts_one
            .stub(_then(_instance))
        : CopyWith$Mutation$insertInfluencerPayout$insert_service_provider_influencer_payouts_one(
            local$insert_service_provider_influencer_payouts_one,
            (e) => call(insert_service_provider_influencer_payouts_one: e));
  }
}

class _CopyWithStubImpl$Mutation$insertInfluencerPayout<TRes>
    implements CopyWith$Mutation$insertInfluencerPayout<TRes> {
  _CopyWithStubImpl$Mutation$insertInfluencerPayout(this._res);

  TRes _res;

  call({
    Mutation$insertInfluencerPayout$insert_service_provider_influencer_payouts_one?
        insert_service_provider_influencer_payouts_one,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$insertInfluencerPayout$insert_service_provider_influencer_payouts_one<
          TRes>
      get insert_service_provider_influencer_payouts_one =>
          CopyWith$Mutation$insertInfluencerPayout$insert_service_provider_influencer_payouts_one
              .stub(_res);
}

const documentNodeMutationinsertInfluencerPayout = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'insertInfluencerPayout'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'object')),
        type: NamedTypeNode(
          name: NameNode(
              value: 'service_provider_influencer_payouts_insert_input'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'insert_service_provider_influencer_payouts_one'),
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
            name: NameNode(value: 'influencer_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'amount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'date'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'sp_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'sp_type'),
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
Mutation$insertInfluencerPayout _parserFn$Mutation$insertInfluencerPayout(
        Map<String, dynamic> data) =>
    Mutation$insertInfluencerPayout.fromJson(data);
typedef OnMutationCompleted$Mutation$insertInfluencerPayout = FutureOr<void>
    Function(
  dynamic,
  Mutation$insertInfluencerPayout?,
);

class Options$Mutation$insertInfluencerPayout
    extends graphql.MutationOptions<Mutation$insertInfluencerPayout> {
  Options$Mutation$insertInfluencerPayout({
    String? operationName,
    required Variables$Mutation$insertInfluencerPayout variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$insertInfluencerPayout? onCompleted,
    graphql.OnMutationUpdate<Mutation$insertInfluencerPayout>? update,
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
                        : _parserFn$Mutation$insertInfluencerPayout(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationinsertInfluencerPayout,
          parserFn: _parserFn$Mutation$insertInfluencerPayout,
        );

  final OnMutationCompleted$Mutation$insertInfluencerPayout?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$insertInfluencerPayout
    extends graphql.WatchQueryOptions<Mutation$insertInfluencerPayout> {
  WatchOptions$Mutation$insertInfluencerPayout({
    String? operationName,
    required Variables$Mutation$insertInfluencerPayout variables,
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
          document: documentNodeMutationinsertInfluencerPayout,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$insertInfluencerPayout,
        );
}

extension ClientExtension$Mutation$insertInfluencerPayout
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$insertInfluencerPayout>>
      mutate$insertInfluencerPayout(
              Options$Mutation$insertInfluencerPayout options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$insertInfluencerPayout>
      watchMutation$insertInfluencerPayout(
              WatchOptions$Mutation$insertInfluencerPayout options) =>
          this.watchMutation(options);
}

class Mutation$insertInfluencerPayout$insert_service_provider_influencer_payouts_one {
  Mutation$insertInfluencerPayout$insert_service_provider_influencer_payouts_one({
    required this.id,
    required this.influencer_id,
    required this.amount,
    required this.date,
    required this.sp_id,
    required this.sp_type,
    required this.$__typename,
  });

  factory Mutation$insertInfluencerPayout$insert_service_provider_influencer_payouts_one.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$influencer_id = json['influencer_id'];
    final l$amount = json['amount'];
    final l$date = json['date'];
    final l$sp_id = json['sp_id'];
    final l$sp_type = json['sp_type'];
    final l$$__typename = json['__typename'];
    return Mutation$insertInfluencerPayout$insert_service_provider_influencer_payouts_one(
      id: (l$id as int),
      influencer_id: (l$influencer_id as int),
      amount: moneyFromJson(l$amount),
      date: (l$date as String),
      sp_id: (l$sp_id as int),
      sp_type: (l$sp_type as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final int influencer_id;

  final double amount;

  final String date;

  final int sp_id;

  final String sp_type;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$influencer_id = influencer_id;
    _resultData['influencer_id'] = l$influencer_id;
    final l$amount = amount;
    _resultData['amount'] = moneyToJson(l$amount);
    final l$date = date;
    _resultData['date'] = l$date;
    final l$sp_id = sp_id;
    _resultData['sp_id'] = l$sp_id;
    final l$sp_type = sp_type;
    _resultData['sp_type'] = l$sp_type;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$influencer_id = influencer_id;
    final l$amount = amount;
    final l$date = date;
    final l$sp_id = sp_id;
    final l$sp_type = sp_type;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$influencer_id,
      l$amount,
      l$date,
      l$sp_id,
      l$sp_type,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$insertInfluencerPayout$insert_service_provider_influencer_payouts_one) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$influencer_id = influencer_id;
    final lOther$influencer_id = other.influencer_id;
    if (l$influencer_id != lOther$influencer_id) {
      return false;
    }
    final l$amount = amount;
    final lOther$amount = other.amount;
    if (l$amount != lOther$amount) {
      return false;
    }
    final l$date = date;
    final lOther$date = other.date;
    if (l$date != lOther$date) {
      return false;
    }
    final l$sp_id = sp_id;
    final lOther$sp_id = other.sp_id;
    if (l$sp_id != lOther$sp_id) {
      return false;
    }
    final l$sp_type = sp_type;
    final lOther$sp_type = other.sp_type;
    if (l$sp_type != lOther$sp_type) {
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

extension UtilityExtension$Mutation$insertInfluencerPayout$insert_service_provider_influencer_payouts_one
    on Mutation$insertInfluencerPayout$insert_service_provider_influencer_payouts_one {
  CopyWith$Mutation$insertInfluencerPayout$insert_service_provider_influencer_payouts_one<
          Mutation$insertInfluencerPayout$insert_service_provider_influencer_payouts_one>
      get copyWith =>
          CopyWith$Mutation$insertInfluencerPayout$insert_service_provider_influencer_payouts_one(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$insertInfluencerPayout$insert_service_provider_influencer_payouts_one<
    TRes> {
  factory CopyWith$Mutation$insertInfluencerPayout$insert_service_provider_influencer_payouts_one(
    Mutation$insertInfluencerPayout$insert_service_provider_influencer_payouts_one
        instance,
    TRes Function(
            Mutation$insertInfluencerPayout$insert_service_provider_influencer_payouts_one)
        then,
  ) = _CopyWithImpl$Mutation$insertInfluencerPayout$insert_service_provider_influencer_payouts_one;

  factory CopyWith$Mutation$insertInfluencerPayout$insert_service_provider_influencer_payouts_one.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$insertInfluencerPayout$insert_service_provider_influencer_payouts_one;

  TRes call({
    int? id,
    int? influencer_id,
    double? amount,
    String? date,
    int? sp_id,
    String? sp_type,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$insertInfluencerPayout$insert_service_provider_influencer_payouts_one<
        TRes>
    implements
        CopyWith$Mutation$insertInfluencerPayout$insert_service_provider_influencer_payouts_one<
            TRes> {
  _CopyWithImpl$Mutation$insertInfluencerPayout$insert_service_provider_influencer_payouts_one(
    this._instance,
    this._then,
  );

  final Mutation$insertInfluencerPayout$insert_service_provider_influencer_payouts_one
      _instance;

  final TRes Function(
          Mutation$insertInfluencerPayout$insert_service_provider_influencer_payouts_one)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? influencer_id = _undefined,
    Object? amount = _undefined,
    Object? date = _undefined,
    Object? sp_id = _undefined,
    Object? sp_type = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$insertInfluencerPayout$insert_service_provider_influencer_payouts_one(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        influencer_id: influencer_id == _undefined || influencer_id == null
            ? _instance.influencer_id
            : (influencer_id as int),
        amount: amount == _undefined || amount == null
            ? _instance.amount
            : (amount as double),
        date: date == _undefined || date == null
            ? _instance.date
            : (date as String),
        sp_id: sp_id == _undefined || sp_id == null
            ? _instance.sp_id
            : (sp_id as int),
        sp_type: sp_type == _undefined || sp_type == null
            ? _instance.sp_type
            : (sp_type as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$insertInfluencerPayout$insert_service_provider_influencer_payouts_one<
        TRes>
    implements
        CopyWith$Mutation$insertInfluencerPayout$insert_service_provider_influencer_payouts_one<
            TRes> {
  _CopyWithStubImpl$Mutation$insertInfluencerPayout$insert_service_provider_influencer_payouts_one(
      this._res);

  TRes _res;

  call({
    int? id,
    int? influencer_id,
    double? amount,
    String? date,
    int? sp_id,
    String? sp_type,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$GetServiceInfluencerPayoutsSum {
  factory Variables$Query$GetServiceInfluencerPayoutsSum({
    required int serviceId,
    required int influencerId,
    required String serviceType,
  }) =>
      Variables$Query$GetServiceInfluencerPayoutsSum._({
        r'serviceId': serviceId,
        r'influencerId': influencerId,
        r'serviceType': serviceType,
      });

  Variables$Query$GetServiceInfluencerPayoutsSum._(this._$data);

  factory Variables$Query$GetServiceInfluencerPayoutsSum.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$serviceId = data['serviceId'];
    result$data['serviceId'] = (l$serviceId as int);
    final l$influencerId = data['influencerId'];
    result$data['influencerId'] = (l$influencerId as int);
    final l$serviceType = data['serviceType'];
    result$data['serviceType'] = (l$serviceType as String);
    return Variables$Query$GetServiceInfluencerPayoutsSum._(result$data);
  }

  Map<String, dynamic> _$data;

  int get serviceId => (_$data['serviceId'] as int);
  int get influencerId => (_$data['influencerId'] as int);
  String get serviceType => (_$data['serviceType'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$serviceId = serviceId;
    result$data['serviceId'] = l$serviceId;
    final l$influencerId = influencerId;
    result$data['influencerId'] = l$influencerId;
    final l$serviceType = serviceType;
    result$data['serviceType'] = l$serviceType;
    return result$data;
  }

  CopyWith$Variables$Query$GetServiceInfluencerPayoutsSum<
          Variables$Query$GetServiceInfluencerPayoutsSum>
      get copyWith => CopyWith$Variables$Query$GetServiceInfluencerPayoutsSum(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$GetServiceInfluencerPayoutsSum) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$serviceId = serviceId;
    final lOther$serviceId = other.serviceId;
    if (l$serviceId != lOther$serviceId) {
      return false;
    }
    final l$influencerId = influencerId;
    final lOther$influencerId = other.influencerId;
    if (l$influencerId != lOther$influencerId) {
      return false;
    }
    final l$serviceType = serviceType;
    final lOther$serviceType = other.serviceType;
    if (l$serviceType != lOther$serviceType) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$serviceId = serviceId;
    final l$influencerId = influencerId;
    final l$serviceType = serviceType;
    return Object.hashAll([
      l$serviceId,
      l$influencerId,
      l$serviceType,
    ]);
  }
}

abstract class CopyWith$Variables$Query$GetServiceInfluencerPayoutsSum<TRes> {
  factory CopyWith$Variables$Query$GetServiceInfluencerPayoutsSum(
    Variables$Query$GetServiceInfluencerPayoutsSum instance,
    TRes Function(Variables$Query$GetServiceInfluencerPayoutsSum) then,
  ) = _CopyWithImpl$Variables$Query$GetServiceInfluencerPayoutsSum;

  factory CopyWith$Variables$Query$GetServiceInfluencerPayoutsSum.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Query$GetServiceInfluencerPayoutsSum;

  TRes call({
    int? serviceId,
    int? influencerId,
    String? serviceType,
  });
}

class _CopyWithImpl$Variables$Query$GetServiceInfluencerPayoutsSum<TRes>
    implements CopyWith$Variables$Query$GetServiceInfluencerPayoutsSum<TRes> {
  _CopyWithImpl$Variables$Query$GetServiceInfluencerPayoutsSum(
    this._instance,
    this._then,
  );

  final Variables$Query$GetServiceInfluencerPayoutsSum _instance;

  final TRes Function(Variables$Query$GetServiceInfluencerPayoutsSum) _then;

  static const _undefined = {};

  TRes call({
    Object? serviceId = _undefined,
    Object? influencerId = _undefined,
    Object? serviceType = _undefined,
  }) =>
      _then(Variables$Query$GetServiceInfluencerPayoutsSum._({
        ..._instance._$data,
        if (serviceId != _undefined && serviceId != null)
          'serviceId': (serviceId as int),
        if (influencerId != _undefined && influencerId != null)
          'influencerId': (influencerId as int),
        if (serviceType != _undefined && serviceType != null)
          'serviceType': (serviceType as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetServiceInfluencerPayoutsSum<TRes>
    implements CopyWith$Variables$Query$GetServiceInfluencerPayoutsSum<TRes> {
  _CopyWithStubImpl$Variables$Query$GetServiceInfluencerPayoutsSum(this._res);

  TRes _res;

  call({
    int? serviceId,
    int? influencerId,
    String? serviceType,
  }) =>
      _res;
}

class Query$GetServiceInfluencerPayoutsSum {
  Query$GetServiceInfluencerPayoutsSum({
    required this.service_provider_influencer_payouts_aggregate,
    required this.$__typename,
  });

  factory Query$GetServiceInfluencerPayoutsSum.fromJson(
      Map<String, dynamic> json) {
    final l$service_provider_influencer_payouts_aggregate =
        json['service_provider_influencer_payouts_aggregate'];
    final l$$__typename = json['__typename'];
    return Query$GetServiceInfluencerPayoutsSum(
      service_provider_influencer_payouts_aggregate:
          Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate
              .fromJson((l$service_provider_influencer_payouts_aggregate
                  as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate
      service_provider_influencer_payouts_aggregate;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$service_provider_influencer_payouts_aggregate =
        service_provider_influencer_payouts_aggregate;
    _resultData['service_provider_influencer_payouts_aggregate'] =
        l$service_provider_influencer_payouts_aggregate.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$service_provider_influencer_payouts_aggregate =
        service_provider_influencer_payouts_aggregate;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$service_provider_influencer_payouts_aggregate,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetServiceInfluencerPayoutsSum) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$service_provider_influencer_payouts_aggregate =
        service_provider_influencer_payouts_aggregate;
    final lOther$service_provider_influencer_payouts_aggregate =
        other.service_provider_influencer_payouts_aggregate;
    if (l$service_provider_influencer_payouts_aggregate !=
        lOther$service_provider_influencer_payouts_aggregate) {
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

extension UtilityExtension$Query$GetServiceInfluencerPayoutsSum
    on Query$GetServiceInfluencerPayoutsSum {
  CopyWith$Query$GetServiceInfluencerPayoutsSum<
          Query$GetServiceInfluencerPayoutsSum>
      get copyWith => CopyWith$Query$GetServiceInfluencerPayoutsSum(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetServiceInfluencerPayoutsSum<TRes> {
  factory CopyWith$Query$GetServiceInfluencerPayoutsSum(
    Query$GetServiceInfluencerPayoutsSum instance,
    TRes Function(Query$GetServiceInfluencerPayoutsSum) then,
  ) = _CopyWithImpl$Query$GetServiceInfluencerPayoutsSum;

  factory CopyWith$Query$GetServiceInfluencerPayoutsSum.stub(TRes res) =
      _CopyWithStubImpl$Query$GetServiceInfluencerPayoutsSum;

  TRes call({
    Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate?
        service_provider_influencer_payouts_aggregate,
    String? $__typename,
  });
  CopyWith$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate<
      TRes> get service_provider_influencer_payouts_aggregate;
}

class _CopyWithImpl$Query$GetServiceInfluencerPayoutsSum<TRes>
    implements CopyWith$Query$GetServiceInfluencerPayoutsSum<TRes> {
  _CopyWithImpl$Query$GetServiceInfluencerPayoutsSum(
    this._instance,
    this._then,
  );

  final Query$GetServiceInfluencerPayoutsSum _instance;

  final TRes Function(Query$GetServiceInfluencerPayoutsSum) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_influencer_payouts_aggregate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetServiceInfluencerPayoutsSum(
        service_provider_influencer_payouts_aggregate:
            service_provider_influencer_payouts_aggregate == _undefined ||
                    service_provider_influencer_payouts_aggregate == null
                ? _instance.service_provider_influencer_payouts_aggregate
                : (service_provider_influencer_payouts_aggregate
                    as Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate<
      TRes> get service_provider_influencer_payouts_aggregate {
    final local$service_provider_influencer_payouts_aggregate =
        _instance.service_provider_influencer_payouts_aggregate;
    return CopyWith$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate(
        local$service_provider_influencer_payouts_aggregate,
        (e) => call(service_provider_influencer_payouts_aggregate: e));
  }
}

class _CopyWithStubImpl$Query$GetServiceInfluencerPayoutsSum<TRes>
    implements CopyWith$Query$GetServiceInfluencerPayoutsSum<TRes> {
  _CopyWithStubImpl$Query$GetServiceInfluencerPayoutsSum(this._res);

  TRes _res;

  call({
    Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate?
        service_provider_influencer_payouts_aggregate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate<
          TRes>
      get service_provider_influencer_payouts_aggregate =>
          CopyWith$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate
              .stub(_res);
}

const documentNodeQueryGetServiceInfluencerPayoutsSum =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetServiceInfluencerPayoutsSum'),
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
        variable: VariableNode(name: NameNode(value: 'influencerId')),
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
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'service_provider_influencer_payouts_aggregate'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'influencer_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'influencerId')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'sp_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'serviceId')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'sp_type'),
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
            name: NameNode(value: 'aggregate'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'sum'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'amount'),
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
Query$GetServiceInfluencerPayoutsSum
    _parserFn$Query$GetServiceInfluencerPayoutsSum(Map<String, dynamic> data) =>
        Query$GetServiceInfluencerPayoutsSum.fromJson(data);

class Options$Query$GetServiceInfluencerPayoutsSum
    extends graphql.QueryOptions<Query$GetServiceInfluencerPayoutsSum> {
  Options$Query$GetServiceInfluencerPayoutsSum({
    String? operationName,
    required Variables$Query$GetServiceInfluencerPayoutsSum variables,
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
          document: documentNodeQueryGetServiceInfluencerPayoutsSum,
          parserFn: _parserFn$Query$GetServiceInfluencerPayoutsSum,
        );
}

class WatchOptions$Query$GetServiceInfluencerPayoutsSum
    extends graphql.WatchQueryOptions<Query$GetServiceInfluencerPayoutsSum> {
  WatchOptions$Query$GetServiceInfluencerPayoutsSum({
    String? operationName,
    required Variables$Query$GetServiceInfluencerPayoutsSum variables,
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
          document: documentNodeQueryGetServiceInfluencerPayoutsSum,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetServiceInfluencerPayoutsSum,
        );
}

class FetchMoreOptions$Query$GetServiceInfluencerPayoutsSum
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetServiceInfluencerPayoutsSum({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetServiceInfluencerPayoutsSum variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetServiceInfluencerPayoutsSum,
        );
}

extension ClientExtension$Query$GetServiceInfluencerPayoutsSum
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetServiceInfluencerPayoutsSum>>
      query$GetServiceInfluencerPayoutsSum(
              Options$Query$GetServiceInfluencerPayoutsSum options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$GetServiceInfluencerPayoutsSum>
      watchQuery$GetServiceInfluencerPayoutsSum(
              WatchOptions$Query$GetServiceInfluencerPayoutsSum options) =>
          this.watchQuery(options);
  void writeQuery$GetServiceInfluencerPayoutsSum({
    required Query$GetServiceInfluencerPayoutsSum data,
    required Variables$Query$GetServiceInfluencerPayoutsSum variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryGetServiceInfluencerPayoutsSum),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetServiceInfluencerPayoutsSum?
      readQuery$GetServiceInfluencerPayoutsSum({
    required Variables$Query$GetServiceInfluencerPayoutsSum variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryGetServiceInfluencerPayoutsSum),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$GetServiceInfluencerPayoutsSum.fromJson(result);
  }
}

class Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate {
  Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate({
    this.aggregate,
    required this.$__typename,
  });

  factory Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$aggregate = json['aggregate'];
    final l$$__typename = json['__typename'];
    return Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate(
      aggregate: l$aggregate == null
          ? null
          : Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate
              .fromJson((l$aggregate as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate?
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
            is Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate) ||
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

extension UtilityExtension$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate
    on Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate {
  CopyWith$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate<
          Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate>
      get copyWith =>
          CopyWith$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate<
    TRes> {
  factory CopyWith$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate(
    Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate
        instance,
    TRes Function(
            Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate)
        then,
  ) = _CopyWithImpl$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate;

  factory CopyWith$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate;

  TRes call({
    Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate?
        aggregate,
    String? $__typename,
  });
  CopyWith$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate<
      TRes> get aggregate;
}

class _CopyWithImpl$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate<
        TRes>
    implements
        CopyWith$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate<
            TRes> {
  _CopyWithImpl$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate(
    this._instance,
    this._then,
  );

  final Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate
      _instance;

  final TRes Function(
          Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate)
      _then;

  static const _undefined = {};

  TRes call({
    Object? aggregate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate(
        aggregate: aggregate == _undefined
            ? _instance.aggregate
            : (aggregate
                as Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate<
      TRes> get aggregate {
    final local$aggregate = _instance.aggregate;
    return local$aggregate == null
        ? CopyWith$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate
            .stub(_then(_instance))
        : CopyWith$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate(
            local$aggregate, (e) => call(aggregate: e));
  }
}

class _CopyWithStubImpl$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate<
        TRes>
    implements
        CopyWith$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate<
            TRes> {
  _CopyWithStubImpl$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate(
      this._res);

  TRes _res;

  call({
    Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate?
        aggregate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate<
          TRes>
      get aggregate =>
          CopyWith$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate
              .stub(_res);
}

class Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate {
  Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate({
    this.sum,
    required this.$__typename,
  });

  factory Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$sum = json['sum'];
    final l$$__typename = json['__typename'];
    return Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate(
      sum: l$sum == null
          ? null
          : Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate$sum
              .fromJson((l$sum as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate$sum?
      sum;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$sum = sum;
    _resultData['sum'] = l$sum?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$sum = sum;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$sum,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$sum = sum;
    final lOther$sum = other.sum;
    if (l$sum != lOther$sum) {
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

extension UtilityExtension$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate
    on Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate {
  CopyWith$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate<
          Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate>
      get copyWith =>
          CopyWith$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate<
    TRes> {
  factory CopyWith$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate(
    Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate
        instance,
    TRes Function(
            Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate)
        then,
  ) = _CopyWithImpl$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate;

  factory CopyWith$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate;

  TRes call({
    Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate$sum?
        sum,
    String? $__typename,
  });
  CopyWith$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate$sum<
      TRes> get sum;
}

class _CopyWithImpl$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate<
            TRes> {
  _CopyWithImpl$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate(
    this._instance,
    this._then,
  );

  final Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate
      _instance;

  final TRes Function(
          Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate)
      _then;

  static const _undefined = {};

  TRes call({
    Object? sum = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate(
        sum: sum == _undefined
            ? _instance.sum
            : (sum
                as Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate$sum?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate$sum<
      TRes> get sum {
    final local$sum = _instance.sum;
    return local$sum == null
        ? CopyWith$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate$sum
            .stub(_then(_instance))
        : CopyWith$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate$sum(
            local$sum, (e) => call(sum: e));
  }
}

class _CopyWithStubImpl$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate<
            TRes> {
  _CopyWithStubImpl$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate(
      this._res);

  TRes _res;

  call({
    Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate$sum?
        sum,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate$sum<
          TRes>
      get sum =>
          CopyWith$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate$sum
              .stub(_res);
}

class Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate$sum {
  Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate$sum({
    this.amount,
    required this.$__typename,
  });

  factory Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate$sum.fromJson(
      Map<String, dynamic> json) {
    final l$amount = json['amount'];
    final l$$__typename = json['__typename'];
    return Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate$sum(
      amount: l$amount == null ? null : moneyFromJson(l$amount),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final double? amount;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$amount = amount;
    _resultData['amount'] = l$amount == null ? null : moneyToJson(l$amount);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$amount = amount;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$amount,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate$sum) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$amount = amount;
    final lOther$amount = other.amount;
    if (l$amount != lOther$amount) {
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

extension UtilityExtension$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate$sum
    on Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate$sum {
  CopyWith$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate$sum<
          Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate$sum>
      get copyWith =>
          CopyWith$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate$sum(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate$sum<
    TRes> {
  factory CopyWith$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate$sum(
    Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate$sum
        instance,
    TRes Function(
            Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate$sum)
        then,
  ) = _CopyWithImpl$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate$sum;

  factory CopyWith$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate$sum.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate$sum;

  TRes call({
    double? amount,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate$sum<
        TRes>
    implements
        CopyWith$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate$sum<
            TRes> {
  _CopyWithImpl$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate$sum(
    this._instance,
    this._then,
  );

  final Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate$sum
      _instance;

  final TRes Function(
          Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate$sum)
      _then;

  static const _undefined = {};

  TRes call({
    Object? amount = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate$sum(
        amount: amount == _undefined ? _instance.amount : (amount as double?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate$sum<
        TRes>
    implements
        CopyWith$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate$sum<
            TRes> {
  _CopyWithStubImpl$Query$GetServiceInfluencerPayoutsSum$service_provider_influencer_payouts_aggregate$aggregate$sum(
      this._res);

  TRes _res;

  call({
    double? amount,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$GetAllServiceInfluencerPayouts {
  factory Variables$Query$GetAllServiceInfluencerPayouts({
    required int serviceId,
    required String serviceType,
    int? offset,
    int? limit,
  }) =>
      Variables$Query$GetAllServiceInfluencerPayouts._({
        r'serviceId': serviceId,
        r'serviceType': serviceType,
        if (offset != null) r'offset': offset,
        if (limit != null) r'limit': limit,
      });

  Variables$Query$GetAllServiceInfluencerPayouts._(this._$data);

  factory Variables$Query$GetAllServiceInfluencerPayouts.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$serviceId = data['serviceId'];
    result$data['serviceId'] = (l$serviceId as int);
    final l$serviceType = data['serviceType'];
    result$data['serviceType'] = (l$serviceType as String);
    if (data.containsKey('offset')) {
      final l$offset = data['offset'];
      result$data['offset'] = (l$offset as int?);
    }
    if (data.containsKey('limit')) {
      final l$limit = data['limit'];
      result$data['limit'] = (l$limit as int?);
    }
    return Variables$Query$GetAllServiceInfluencerPayouts._(result$data);
  }

  Map<String, dynamic> _$data;

  int get serviceId => (_$data['serviceId'] as int);
  String get serviceType => (_$data['serviceType'] as String);
  int? get offset => (_$data['offset'] as int?);
  int? get limit => (_$data['limit'] as int?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$serviceId = serviceId;
    result$data['serviceId'] = l$serviceId;
    final l$serviceType = serviceType;
    result$data['serviceType'] = l$serviceType;
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

  CopyWith$Variables$Query$GetAllServiceInfluencerPayouts<
          Variables$Query$GetAllServiceInfluencerPayouts>
      get copyWith => CopyWith$Variables$Query$GetAllServiceInfluencerPayouts(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$GetAllServiceInfluencerPayouts) ||
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
    if (l$serviceType != lOther$serviceType) {
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
    final l$serviceId = serviceId;
    final l$serviceType = serviceType;
    final l$offset = offset;
    final l$limit = limit;
    return Object.hashAll([
      l$serviceId,
      l$serviceType,
      _$data.containsKey('offset') ? l$offset : const {},
      _$data.containsKey('limit') ? l$limit : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$GetAllServiceInfluencerPayouts<TRes> {
  factory CopyWith$Variables$Query$GetAllServiceInfluencerPayouts(
    Variables$Query$GetAllServiceInfluencerPayouts instance,
    TRes Function(Variables$Query$GetAllServiceInfluencerPayouts) then,
  ) = _CopyWithImpl$Variables$Query$GetAllServiceInfluencerPayouts;

  factory CopyWith$Variables$Query$GetAllServiceInfluencerPayouts.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Query$GetAllServiceInfluencerPayouts;

  TRes call({
    int? serviceId,
    String? serviceType,
    int? offset,
    int? limit,
  });
}

class _CopyWithImpl$Variables$Query$GetAllServiceInfluencerPayouts<TRes>
    implements CopyWith$Variables$Query$GetAllServiceInfluencerPayouts<TRes> {
  _CopyWithImpl$Variables$Query$GetAllServiceInfluencerPayouts(
    this._instance,
    this._then,
  );

  final Variables$Query$GetAllServiceInfluencerPayouts _instance;

  final TRes Function(Variables$Query$GetAllServiceInfluencerPayouts) _then;

  static const _undefined = {};

  TRes call({
    Object? serviceId = _undefined,
    Object? serviceType = _undefined,
    Object? offset = _undefined,
    Object? limit = _undefined,
  }) =>
      _then(Variables$Query$GetAllServiceInfluencerPayouts._({
        ..._instance._$data,
        if (serviceId != _undefined && serviceId != null)
          'serviceId': (serviceId as int),
        if (serviceType != _undefined && serviceType != null)
          'serviceType': (serviceType as String),
        if (offset != _undefined) 'offset': (offset as int?),
        if (limit != _undefined) 'limit': (limit as int?),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetAllServiceInfluencerPayouts<TRes>
    implements CopyWith$Variables$Query$GetAllServiceInfluencerPayouts<TRes> {
  _CopyWithStubImpl$Variables$Query$GetAllServiceInfluencerPayouts(this._res);

  TRes _res;

  call({
    int? serviceId,
    String? serviceType,
    int? offset,
    int? limit,
  }) =>
      _res;
}

class Query$GetAllServiceInfluencerPayouts {
  Query$GetAllServiceInfluencerPayouts({
    required this.service_provider_influencer_payouts,
    required this.$__typename,
  });

  factory Query$GetAllServiceInfluencerPayouts.fromJson(
      Map<String, dynamic> json) {
    final l$service_provider_influencer_payouts =
        json['service_provider_influencer_payouts'];
    final l$$__typename = json['__typename'];
    return Query$GetAllServiceInfluencerPayouts(
      service_provider_influencer_payouts: (l$service_provider_influencer_payouts
              as List<dynamic>)
          .map((e) =>
              Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts>
      service_provider_influencer_payouts;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$service_provider_influencer_payouts =
        service_provider_influencer_payouts;
    _resultData['service_provider_influencer_payouts'] =
        l$service_provider_influencer_payouts.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$service_provider_influencer_payouts =
        service_provider_influencer_payouts;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$service_provider_influencer_payouts.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetAllServiceInfluencerPayouts) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$service_provider_influencer_payouts =
        service_provider_influencer_payouts;
    final lOther$service_provider_influencer_payouts =
        other.service_provider_influencer_payouts;
    if (l$service_provider_influencer_payouts.length !=
        lOther$service_provider_influencer_payouts.length) {
      return false;
    }
    for (int i = 0; i < l$service_provider_influencer_payouts.length; i++) {
      final l$service_provider_influencer_payouts$entry =
          l$service_provider_influencer_payouts[i];
      final lOther$service_provider_influencer_payouts$entry =
          lOther$service_provider_influencer_payouts[i];
      if (l$service_provider_influencer_payouts$entry !=
          lOther$service_provider_influencer_payouts$entry) {
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

extension UtilityExtension$Query$GetAllServiceInfluencerPayouts
    on Query$GetAllServiceInfluencerPayouts {
  CopyWith$Query$GetAllServiceInfluencerPayouts<
          Query$GetAllServiceInfluencerPayouts>
      get copyWith => CopyWith$Query$GetAllServiceInfluencerPayouts(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetAllServiceInfluencerPayouts<TRes> {
  factory CopyWith$Query$GetAllServiceInfluencerPayouts(
    Query$GetAllServiceInfluencerPayouts instance,
    TRes Function(Query$GetAllServiceInfluencerPayouts) then,
  ) = _CopyWithImpl$Query$GetAllServiceInfluencerPayouts;

  factory CopyWith$Query$GetAllServiceInfluencerPayouts.stub(TRes res) =
      _CopyWithStubImpl$Query$GetAllServiceInfluencerPayouts;

  TRes call({
    List<Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts>?
        service_provider_influencer_payouts,
    String? $__typename,
  });
  TRes service_provider_influencer_payouts(
      Iterable<Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts> Function(
              Iterable<
                  CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts<
                      Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts>>)
          _fn);
}

class _CopyWithImpl$Query$GetAllServiceInfluencerPayouts<TRes>
    implements CopyWith$Query$GetAllServiceInfluencerPayouts<TRes> {
  _CopyWithImpl$Query$GetAllServiceInfluencerPayouts(
    this._instance,
    this._then,
  );

  final Query$GetAllServiceInfluencerPayouts _instance;

  final TRes Function(Query$GetAllServiceInfluencerPayouts) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_influencer_payouts = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetAllServiceInfluencerPayouts(
        service_provider_influencer_payouts: service_provider_influencer_payouts ==
                    _undefined ||
                service_provider_influencer_payouts == null
            ? _instance.service_provider_influencer_payouts
            : (service_provider_influencer_payouts as List<
                Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes service_provider_influencer_payouts(
          Iterable<Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts> Function(
                  Iterable<
                      CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts<
                          Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts>>)
              _fn) =>
      call(
          service_provider_influencer_payouts: _fn(
              _instance.service_provider_influencer_payouts.map((e) =>
                  CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$GetAllServiceInfluencerPayouts<TRes>
    implements CopyWith$Query$GetAllServiceInfluencerPayouts<TRes> {
  _CopyWithStubImpl$Query$GetAllServiceInfluencerPayouts(this._res);

  TRes _res;

  call({
    List<Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts>?
        service_provider_influencer_payouts,
    String? $__typename,
  }) =>
      _res;
  service_provider_influencer_payouts(_fn) => _res;
}

const documentNodeQueryGetAllServiceInfluencerPayouts =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetAllServiceInfluencerPayouts'),
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
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'service_provider_influencer_payouts'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'sp_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'serviceId')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'sp_type'),
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
            name: NameNode(value: 'order_by'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'date'),
                value: EnumValueNode(name: NameNode(value: 'desc')),
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
            name: NameNode(value: 'influencer_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'sp_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'amount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'sp_type'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'date'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'influencer'),
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
                name: NameNode(value: 'user'),
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
                    name: NameNode(value: 'phone'),
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
                name: NameNode(value: 'details'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
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
                    name: NameNode(value: 'phone_number'),
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
Query$GetAllServiceInfluencerPayouts
    _parserFn$Query$GetAllServiceInfluencerPayouts(Map<String, dynamic> data) =>
        Query$GetAllServiceInfluencerPayouts.fromJson(data);

class Options$Query$GetAllServiceInfluencerPayouts
    extends graphql.QueryOptions<Query$GetAllServiceInfluencerPayouts> {
  Options$Query$GetAllServiceInfluencerPayouts({
    String? operationName,
    required Variables$Query$GetAllServiceInfluencerPayouts variables,
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
          document: documentNodeQueryGetAllServiceInfluencerPayouts,
          parserFn: _parserFn$Query$GetAllServiceInfluencerPayouts,
        );
}

class WatchOptions$Query$GetAllServiceInfluencerPayouts
    extends graphql.WatchQueryOptions<Query$GetAllServiceInfluencerPayouts> {
  WatchOptions$Query$GetAllServiceInfluencerPayouts({
    String? operationName,
    required Variables$Query$GetAllServiceInfluencerPayouts variables,
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
          document: documentNodeQueryGetAllServiceInfluencerPayouts,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetAllServiceInfluencerPayouts,
        );
}

class FetchMoreOptions$Query$GetAllServiceInfluencerPayouts
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetAllServiceInfluencerPayouts({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetAllServiceInfluencerPayouts variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetAllServiceInfluencerPayouts,
        );
}

extension ClientExtension$Query$GetAllServiceInfluencerPayouts
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetAllServiceInfluencerPayouts>>
      query$GetAllServiceInfluencerPayouts(
              Options$Query$GetAllServiceInfluencerPayouts options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$GetAllServiceInfluencerPayouts>
      watchQuery$GetAllServiceInfluencerPayouts(
              WatchOptions$Query$GetAllServiceInfluencerPayouts options) =>
          this.watchQuery(options);
  void writeQuery$GetAllServiceInfluencerPayouts({
    required Query$GetAllServiceInfluencerPayouts data,
    required Variables$Query$GetAllServiceInfluencerPayouts variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryGetAllServiceInfluencerPayouts),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetAllServiceInfluencerPayouts?
      readQuery$GetAllServiceInfluencerPayouts({
    required Variables$Query$GetAllServiceInfluencerPayouts variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryGetAllServiceInfluencerPayouts),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$GetAllServiceInfluencerPayouts.fromJson(result);
  }
}

class Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts {
  Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts({
    required this.id,
    required this.influencer_id,
    required this.sp_id,
    required this.amount,
    required this.sp_type,
    required this.date,
    this.influencer,
    this.restaurant,
    required this.$__typename,
  });

  factory Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$influencer_id = json['influencer_id'];
    final l$sp_id = json['sp_id'];
    final l$amount = json['amount'];
    final l$sp_type = json['sp_type'];
    final l$date = json['date'];
    final l$influencer = json['influencer'];
    final l$restaurant = json['restaurant'];
    final l$$__typename = json['__typename'];
    return Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts(
      id: (l$id as int),
      influencer_id: (l$influencer_id as int),
      sp_id: (l$sp_id as int),
      amount: moneyFromJson(l$amount),
      sp_type: (l$sp_type as String),
      date: (l$date as String),
      influencer: l$influencer == null
          ? null
          : Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer
              .fromJson((l$influencer as Map<String, dynamic>)),
      restaurant: l$restaurant == null
          ? null
          : Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant
              .fromJson((l$restaurant as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final int influencer_id;

  final int sp_id;

  final double amount;

  final String sp_type;

  final String date;

  final Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer?
      influencer;

  final Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant?
      restaurant;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$influencer_id = influencer_id;
    _resultData['influencer_id'] = l$influencer_id;
    final l$sp_id = sp_id;
    _resultData['sp_id'] = l$sp_id;
    final l$amount = amount;
    _resultData['amount'] = moneyToJson(l$amount);
    final l$sp_type = sp_type;
    _resultData['sp_type'] = l$sp_type;
    final l$date = date;
    _resultData['date'] = l$date;
    final l$influencer = influencer;
    _resultData['influencer'] = l$influencer?.toJson();
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$influencer_id = influencer_id;
    final l$sp_id = sp_id;
    final l$amount = amount;
    final l$sp_type = sp_type;
    final l$date = date;
    final l$influencer = influencer;
    final l$restaurant = restaurant;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$influencer_id,
      l$sp_id,
      l$amount,
      l$sp_type,
      l$date,
      l$influencer,
      l$restaurant,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$influencer_id = influencer_id;
    final lOther$influencer_id = other.influencer_id;
    if (l$influencer_id != lOther$influencer_id) {
      return false;
    }
    final l$sp_id = sp_id;
    final lOther$sp_id = other.sp_id;
    if (l$sp_id != lOther$sp_id) {
      return false;
    }
    final l$amount = amount;
    final lOther$amount = other.amount;
    if (l$amount != lOther$amount) {
      return false;
    }
    final l$sp_type = sp_type;
    final lOther$sp_type = other.sp_type;
    if (l$sp_type != lOther$sp_type) {
      return false;
    }
    final l$date = date;
    final lOther$date = other.date;
    if (l$date != lOther$date) {
      return false;
    }
    final l$influencer = influencer;
    final lOther$influencer = other.influencer;
    if (l$influencer != lOther$influencer) {
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

extension UtilityExtension$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts
    on Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts {
  CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts<
          Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts>
      get copyWith =>
          CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts<
    TRes> {
  factory CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts(
    Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts
        instance,
    TRes Function(
            Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts)
        then,
  ) = _CopyWithImpl$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts;

  factory CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts;

  TRes call({
    int? id,
    int? influencer_id,
    int? sp_id,
    double? amount,
    String? sp_type,
    String? date,
    Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer?
        influencer,
    Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant?
        restaurant,
    String? $__typename,
  });
  CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer<
      TRes> get influencer;
  CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant<
      TRes> get restaurant;
}

class _CopyWithImpl$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts<
        TRes>
    implements
        CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts<
            TRes> {
  _CopyWithImpl$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts(
    this._instance,
    this._then,
  );

  final Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts
      _instance;

  final TRes Function(
          Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? influencer_id = _undefined,
    Object? sp_id = _undefined,
    Object? amount = _undefined,
    Object? sp_type = _undefined,
    Object? date = _undefined,
    Object? influencer = _undefined,
    Object? restaurant = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        influencer_id: influencer_id == _undefined || influencer_id == null
            ? _instance.influencer_id
            : (influencer_id as int),
        sp_id: sp_id == _undefined || sp_id == null
            ? _instance.sp_id
            : (sp_id as int),
        amount: amount == _undefined || amount == null
            ? _instance.amount
            : (amount as double),
        sp_type: sp_type == _undefined || sp_type == null
            ? _instance.sp_type
            : (sp_type as String),
        date: date == _undefined || date == null
            ? _instance.date
            : (date as String),
        influencer: influencer == _undefined
            ? _instance.influencer
            : (influencer
                as Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer?),
        restaurant: restaurant == _undefined
            ? _instance.restaurant
            : (restaurant
                as Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer<
      TRes> get influencer {
    final local$influencer = _instance.influencer;
    return local$influencer == null
        ? CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer
            .stub(_then(_instance))
        : CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer(
            local$influencer, (e) => call(influencer: e));
  }

  CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant<
      TRes> get restaurant {
    final local$restaurant = _instance.restaurant;
    return local$restaurant == null
        ? CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant
            .stub(_then(_instance))
        : CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant(
            local$restaurant, (e) => call(restaurant: e));
  }
}

class _CopyWithStubImpl$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts<
        TRes>
    implements
        CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts<
            TRes> {
  _CopyWithStubImpl$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts(
      this._res);

  TRes _res;

  call({
    int? id,
    int? influencer_id,
    int? sp_id,
    double? amount,
    String? sp_type,
    String? date,
    Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer?
        influencer,
    Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant?
        restaurant,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer<
          TRes>
      get influencer =>
          CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer
              .stub(_res);
  CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant<
          TRes>
      get restaurant =>
          CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant
              .stub(_res);
}

class Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer {
  Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer({
    required this.id,
    this.user,
    required this.$__typename,
  });

  factory Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer(
      id: (l$id as int),
      user: l$user == null
          ? null
          : Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer$user
              .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer$user?
      user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$user = user;
    _resultData['user'] = l$user?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$user,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
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

extension UtilityExtension$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer
    on Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer {
  CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer<
          Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer>
      get copyWith =>
          CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer<
    TRes> {
  factory CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer(
    Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer
        instance,
    TRes Function(
            Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer)
        then,
  ) = _CopyWithImpl$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer;

  factory CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer;

  TRes call({
    int? id,
    Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer$user?
        user,
    String? $__typename,
  });
  CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer$user<
      TRes> get user;
}

class _CopyWithImpl$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer<
        TRes>
    implements
        CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer<
            TRes> {
  _CopyWithImpl$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer(
    this._instance,
    this._then,
  );

  final Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer
      _instance;

  final TRes Function(
          Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        user: user == _undefined
            ? _instance.user
            : (user
                as Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer$user?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer$user<
      TRes> get user {
    final local$user = _instance.user;
    return local$user == null
        ? CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer$user
            .stub(_then(_instance))
        : CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer$user(
            local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer<
        TRes>
    implements
        CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer<
            TRes> {
  _CopyWithStubImpl$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer$user?
        user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer$user<
          TRes>
      get user =>
          CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer$user
              .stub(_res);
}

class Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer$user {
  Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer$user({
    required this.id,
    this.phone,
    this.image,
    this.name,
    required this.$__typename,
  });

  factory Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer$user.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$phone = json['phone'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer$user(
      id: (l$id as int),
      phone: (l$phone as String?),
      image: (l$image as String?),
      name: (l$name as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? phone;

  final String? image;

  final String? name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$phone = phone;
    _resultData['phone'] = l$phone;
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
    final l$phone = phone;
    final l$image = image;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$phone,
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
            is Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer$user) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (l$phone != lOther$phone) {
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

extension UtilityExtension$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer$user
    on Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer$user {
  CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer$user<
          Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer$user>
      get copyWith =>
          CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer$user<
    TRes> {
  factory CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer$user(
    Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer$user
        instance,
    TRes Function(
            Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer$user)
        then,
  ) = _CopyWithImpl$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer$user;

  factory CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer$user;

  TRes call({
    int? id,
    String? phone,
    String? image,
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer$user<
        TRes>
    implements
        CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer$user<
            TRes> {
  _CopyWithImpl$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer$user(
    this._instance,
    this._then,
  );

  final Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer$user
      _instance;

  final TRes Function(
          Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? phone = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer$user(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        phone: phone == _undefined ? _instance.phone : (phone as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        name: name == _undefined ? _instance.name : (name as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer$user<
        TRes>
    implements
        CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer$user<
            TRes> {
  _CopyWithStubImpl$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$influencer$user(
      this._res);

  TRes _res;

  call({
    int? id,
    String? phone,
    String? image,
    String? name,
    String? $__typename,
  }) =>
      _res;
}

class Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant {
  Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant({
    required this.id,
    this.details,
    required this.$__typename,
  });

  factory Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant(
      id: (l$id as int),
      details: l$details == null
          ? null
          : Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details?
      details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$details = details;
    _resultData['details'] = l$details?.toJson();
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
    if (!(other
            is Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant) ||
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

extension UtilityExtension$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant
    on Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant {
  CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant<
          Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant>
      get copyWith =>
          CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant<
    TRes> {
  factory CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant(
    Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant
        instance,
    TRes Function(
            Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant)
        then,
  ) = _CopyWithImpl$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant;

  factory CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant;

  TRes call({
    int? id,
    Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details?
        details,
    String? $__typename,
  });
  CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details<
      TRes> get details;
}

class _CopyWithImpl$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant<
        TRes>
    implements
        CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant<
            TRes> {
  _CopyWithImpl$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant(
    this._instance,
    this._then,
  );

  final Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant
      _instance;

  final TRes Function(
          Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        details: details == _undefined
            ? _instance.details
            : (details
                as Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details<
      TRes> get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details
            .stub(_then(_instance))
        : CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant<
        TRes>
    implements
        CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant<
            TRes> {
  _CopyWithStubImpl$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details<
          TRes>
      get details =>
          CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details
              .stub(_res);
}

class Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details {
  Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details({
    required this.image,
    required this.name,
    this.phone_number,
    required this.location,
    required this.$__typename,
  });

  factory Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details.fromJson(
      Map<String, dynamic> json) {
    final l$image = json['image'];
    final l$name = json['name'];
    final l$phone_number = json['phone_number'];
    final l$location = json['location'];
    final l$$__typename = json['__typename'];
    return Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details(
      image: (l$image as String),
      name: (l$name as String),
      phone_number: (l$phone_number as String?),
      location:
          Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location
              .fromJson((l$location as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String image;

  final String name;

  final String? phone_number;

  final Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location
      location;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$image = image;
    _resultData['image'] = l$image;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$phone_number = phone_number;
    _resultData['phone_number'] = l$phone_number;
    final l$location = location;
    _resultData['location'] = l$location.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$image = image;
    final l$name = name;
    final l$phone_number = phone_number;
    final l$location = location;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$image,
      l$name,
      l$phone_number,
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
            is Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details) ||
        runtimeType != other.runtimeType) {
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
    final l$phone_number = phone_number;
    final lOther$phone_number = other.phone_number;
    if (l$phone_number != lOther$phone_number) {
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

extension UtilityExtension$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details
    on Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details {
  CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details<
          Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details>
      get copyWith =>
          CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details<
    TRes> {
  factory CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details(
    Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details
        instance,
    TRes Function(
            Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details)
        then,
  ) = _CopyWithImpl$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details;

  factory CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details;

  TRes call({
    String? image,
    String? name,
    String? phone_number,
    Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location?
        location,
    String? $__typename,
  });
  CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location<
      TRes> get location;
}

class _CopyWithImpl$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details<
        TRes>
    implements
        CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details<
            TRes> {
  _CopyWithImpl$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details(
    this._instance,
    this._then,
  );

  final Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details
      _instance;

  final TRes Function(
          Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? image = _undefined,
    Object? name = _undefined,
    Object? phone_number = _undefined,
    Object? location = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details(
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        phone_number: phone_number == _undefined
            ? _instance.phone_number
            : (phone_number as String?),
        location: location == _undefined || location == null
            ? _instance.location
            : (location
                as Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location<
      TRes> get location {
    final local$location = _instance.location;
    return CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location(
        local$location, (e) => call(location: e));
  }
}

class _CopyWithStubImpl$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details<
        TRes>
    implements
        CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details<
            TRes> {
  _CopyWithStubImpl$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details(
      this._res);

  TRes _res;

  call({
    String? image,
    String? name,
    String? phone_number,
    Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location?
        location,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location<
          TRes>
      get location =>
          CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location
              .stub(_res);
}

class Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location {
  Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location({
    required this.gps,
    required this.address,
    required this.$__typename,
  });

  factory Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location.fromJson(
      Map<String, dynamic> json) {
    final l$gps = json['gps'];
    final l$address = json['address'];
    final l$$__typename = json['__typename'];
    return Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location(
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
            is Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location) ||
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

extension UtilityExtension$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location
    on Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location {
  CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location<
          Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location>
      get copyWith =>
          CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location<
    TRes> {
  factory CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location(
    Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location
        instance,
    TRes Function(
            Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location)
        then,
  ) = _CopyWithImpl$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location;

  factory CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location;

  TRes call({
    Geography? gps,
    String? address,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location<
        TRes>
    implements
        CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location<
            TRes> {
  _CopyWithImpl$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location(
    this._instance,
    this._then,
  );

  final Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location
      _instance;

  final TRes Function(
          Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location)
      _then;

  static const _undefined = {};

  TRes call({
    Object? gps = _undefined,
    Object? address = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location(
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

class _CopyWithStubImpl$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location<
        TRes>
    implements
        CopyWith$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location<
            TRes> {
  _CopyWithStubImpl$Query$GetAllServiceInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location(
      this._res);

  TRes _res;

  call({
    Geography? gps,
    String? address,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$GetInfluencerPayouts {
  factory Variables$Query$GetInfluencerPayouts({
    required int influencerId,
    int? offset,
    int? limit,
  }) =>
      Variables$Query$GetInfluencerPayouts._({
        r'influencerId': influencerId,
        if (offset != null) r'offset': offset,
        if (limit != null) r'limit': limit,
      });

  Variables$Query$GetInfluencerPayouts._(this._$data);

  factory Variables$Query$GetInfluencerPayouts.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$influencerId = data['influencerId'];
    result$data['influencerId'] = (l$influencerId as int);
    if (data.containsKey('offset')) {
      final l$offset = data['offset'];
      result$data['offset'] = (l$offset as int?);
    }
    if (data.containsKey('limit')) {
      final l$limit = data['limit'];
      result$data['limit'] = (l$limit as int?);
    }
    return Variables$Query$GetInfluencerPayouts._(result$data);
  }

  Map<String, dynamic> _$data;

  int get influencerId => (_$data['influencerId'] as int);
  int? get offset => (_$data['offset'] as int?);
  int? get limit => (_$data['limit'] as int?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$influencerId = influencerId;
    result$data['influencerId'] = l$influencerId;
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

  CopyWith$Variables$Query$GetInfluencerPayouts<
          Variables$Query$GetInfluencerPayouts>
      get copyWith => CopyWith$Variables$Query$GetInfluencerPayouts(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$GetInfluencerPayouts) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$influencerId = influencerId;
    final lOther$influencerId = other.influencerId;
    if (l$influencerId != lOther$influencerId) {
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
    final l$influencerId = influencerId;
    final l$offset = offset;
    final l$limit = limit;
    return Object.hashAll([
      l$influencerId,
      _$data.containsKey('offset') ? l$offset : const {},
      _$data.containsKey('limit') ? l$limit : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$GetInfluencerPayouts<TRes> {
  factory CopyWith$Variables$Query$GetInfluencerPayouts(
    Variables$Query$GetInfluencerPayouts instance,
    TRes Function(Variables$Query$GetInfluencerPayouts) then,
  ) = _CopyWithImpl$Variables$Query$GetInfluencerPayouts;

  factory CopyWith$Variables$Query$GetInfluencerPayouts.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetInfluencerPayouts;

  TRes call({
    int? influencerId,
    int? offset,
    int? limit,
  });
}

class _CopyWithImpl$Variables$Query$GetInfluencerPayouts<TRes>
    implements CopyWith$Variables$Query$GetInfluencerPayouts<TRes> {
  _CopyWithImpl$Variables$Query$GetInfluencerPayouts(
    this._instance,
    this._then,
  );

  final Variables$Query$GetInfluencerPayouts _instance;

  final TRes Function(Variables$Query$GetInfluencerPayouts) _then;

  static const _undefined = {};

  TRes call({
    Object? influencerId = _undefined,
    Object? offset = _undefined,
    Object? limit = _undefined,
  }) =>
      _then(Variables$Query$GetInfluencerPayouts._({
        ..._instance._$data,
        if (influencerId != _undefined && influencerId != null)
          'influencerId': (influencerId as int),
        if (offset != _undefined) 'offset': (offset as int?),
        if (limit != _undefined) 'limit': (limit as int?),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetInfluencerPayouts<TRes>
    implements CopyWith$Variables$Query$GetInfluencerPayouts<TRes> {
  _CopyWithStubImpl$Variables$Query$GetInfluencerPayouts(this._res);

  TRes _res;

  call({
    int? influencerId,
    int? offset,
    int? limit,
  }) =>
      _res;
}

class Query$GetInfluencerPayouts {
  Query$GetInfluencerPayouts({
    required this.service_provider_influencer_payouts,
    required this.$__typename,
  });

  factory Query$GetInfluencerPayouts.fromJson(Map<String, dynamic> json) {
    final l$service_provider_influencer_payouts =
        json['service_provider_influencer_payouts'];
    final l$$__typename = json['__typename'];
    return Query$GetInfluencerPayouts(
      service_provider_influencer_payouts:
          (l$service_provider_influencer_payouts as List<dynamic>)
              .map((e) =>
                  Query$GetInfluencerPayouts$service_provider_influencer_payouts
                      .fromJson((e as Map<String, dynamic>)))
              .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$GetInfluencerPayouts$service_provider_influencer_payouts>
      service_provider_influencer_payouts;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$service_provider_influencer_payouts =
        service_provider_influencer_payouts;
    _resultData['service_provider_influencer_payouts'] =
        l$service_provider_influencer_payouts.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$service_provider_influencer_payouts =
        service_provider_influencer_payouts;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$service_provider_influencer_payouts.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetInfluencerPayouts) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$service_provider_influencer_payouts =
        service_provider_influencer_payouts;
    final lOther$service_provider_influencer_payouts =
        other.service_provider_influencer_payouts;
    if (l$service_provider_influencer_payouts.length !=
        lOther$service_provider_influencer_payouts.length) {
      return false;
    }
    for (int i = 0; i < l$service_provider_influencer_payouts.length; i++) {
      final l$service_provider_influencer_payouts$entry =
          l$service_provider_influencer_payouts[i];
      final lOther$service_provider_influencer_payouts$entry =
          lOther$service_provider_influencer_payouts[i];
      if (l$service_provider_influencer_payouts$entry !=
          lOther$service_provider_influencer_payouts$entry) {
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

extension UtilityExtension$Query$GetInfluencerPayouts
    on Query$GetInfluencerPayouts {
  CopyWith$Query$GetInfluencerPayouts<Query$GetInfluencerPayouts>
      get copyWith => CopyWith$Query$GetInfluencerPayouts(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetInfluencerPayouts<TRes> {
  factory CopyWith$Query$GetInfluencerPayouts(
    Query$GetInfluencerPayouts instance,
    TRes Function(Query$GetInfluencerPayouts) then,
  ) = _CopyWithImpl$Query$GetInfluencerPayouts;

  factory CopyWith$Query$GetInfluencerPayouts.stub(TRes res) =
      _CopyWithStubImpl$Query$GetInfluencerPayouts;

  TRes call({
    List<Query$GetInfluencerPayouts$service_provider_influencer_payouts>?
        service_provider_influencer_payouts,
    String? $__typename,
  });
  TRes service_provider_influencer_payouts(
      Iterable<Query$GetInfluencerPayouts$service_provider_influencer_payouts> Function(
              Iterable<
                  CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts<
                      Query$GetInfluencerPayouts$service_provider_influencer_payouts>>)
          _fn);
}

class _CopyWithImpl$Query$GetInfluencerPayouts<TRes>
    implements CopyWith$Query$GetInfluencerPayouts<TRes> {
  _CopyWithImpl$Query$GetInfluencerPayouts(
    this._instance,
    this._then,
  );

  final Query$GetInfluencerPayouts _instance;

  final TRes Function(Query$GetInfluencerPayouts) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_influencer_payouts = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetInfluencerPayouts(
        service_provider_influencer_payouts: service_provider_influencer_payouts ==
                    _undefined ||
                service_provider_influencer_payouts == null
            ? _instance.service_provider_influencer_payouts
            : (service_provider_influencer_payouts as List<
                Query$GetInfluencerPayouts$service_provider_influencer_payouts>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes service_provider_influencer_payouts(
          Iterable<Query$GetInfluencerPayouts$service_provider_influencer_payouts> Function(
                  Iterable<
                      CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts<
                          Query$GetInfluencerPayouts$service_provider_influencer_payouts>>)
              _fn) =>
      call(
          service_provider_influencer_payouts: _fn(
              _instance.service_provider_influencer_payouts.map((e) =>
                  CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$GetInfluencerPayouts<TRes>
    implements CopyWith$Query$GetInfluencerPayouts<TRes> {
  _CopyWithStubImpl$Query$GetInfluencerPayouts(this._res);

  TRes _res;

  call({
    List<Query$GetInfluencerPayouts$service_provider_influencer_payouts>?
        service_provider_influencer_payouts,
    String? $__typename,
  }) =>
      _res;
  service_provider_influencer_payouts(_fn) => _res;
}

const documentNodeQueryGetInfluencerPayouts = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetInfluencerPayouts'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'influencerId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
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
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'service_provider_influencer_payouts'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'order_by'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'date'),
                value: EnumValueNode(name: NameNode(value: 'desc')),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'influencer_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'influencerId')),
                  )
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
            name: NameNode(value: 'influencer_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'sp_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'amount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'sp_type'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'date'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'influencer'),
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
                name: NameNode(value: 'user'),
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
                    name: NameNode(value: 'phone'),
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
                name: NameNode(value: 'details'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
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
                    name: NameNode(value: 'phone_number'),
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
Query$GetInfluencerPayouts _parserFn$Query$GetInfluencerPayouts(
        Map<String, dynamic> data) =>
    Query$GetInfluencerPayouts.fromJson(data);

class Options$Query$GetInfluencerPayouts
    extends graphql.QueryOptions<Query$GetInfluencerPayouts> {
  Options$Query$GetInfluencerPayouts({
    String? operationName,
    required Variables$Query$GetInfluencerPayouts variables,
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
          document: documentNodeQueryGetInfluencerPayouts,
          parserFn: _parserFn$Query$GetInfluencerPayouts,
        );
}

class WatchOptions$Query$GetInfluencerPayouts
    extends graphql.WatchQueryOptions<Query$GetInfluencerPayouts> {
  WatchOptions$Query$GetInfluencerPayouts({
    String? operationName,
    required Variables$Query$GetInfluencerPayouts variables,
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
          document: documentNodeQueryGetInfluencerPayouts,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetInfluencerPayouts,
        );
}

class FetchMoreOptions$Query$GetInfluencerPayouts
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetInfluencerPayouts({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetInfluencerPayouts variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetInfluencerPayouts,
        );
}

extension ClientExtension$Query$GetInfluencerPayouts on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetInfluencerPayouts>>
      query$GetInfluencerPayouts(
              Options$Query$GetInfluencerPayouts options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$GetInfluencerPayouts>
      watchQuery$GetInfluencerPayouts(
              WatchOptions$Query$GetInfluencerPayouts options) =>
          this.watchQuery(options);
  void writeQuery$GetInfluencerPayouts({
    required Query$GetInfluencerPayouts data,
    required Variables$Query$GetInfluencerPayouts variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryGetInfluencerPayouts),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetInfluencerPayouts? readQuery$GetInfluencerPayouts({
    required Variables$Query$GetInfluencerPayouts variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryGetInfluencerPayouts),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetInfluencerPayouts.fromJson(result);
  }
}

class Query$GetInfluencerPayouts$service_provider_influencer_payouts {
  Query$GetInfluencerPayouts$service_provider_influencer_payouts({
    required this.id,
    required this.influencer_id,
    required this.sp_id,
    required this.amount,
    required this.sp_type,
    required this.date,
    this.influencer,
    this.restaurant,
    required this.$__typename,
  });

  factory Query$GetInfluencerPayouts$service_provider_influencer_payouts.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$influencer_id = json['influencer_id'];
    final l$sp_id = json['sp_id'];
    final l$amount = json['amount'];
    final l$sp_type = json['sp_type'];
    final l$date = json['date'];
    final l$influencer = json['influencer'];
    final l$restaurant = json['restaurant'];
    final l$$__typename = json['__typename'];
    return Query$GetInfluencerPayouts$service_provider_influencer_payouts(
      id: (l$id as int),
      influencer_id: (l$influencer_id as int),
      sp_id: (l$sp_id as int),
      amount: moneyFromJson(l$amount),
      sp_type: (l$sp_type as String),
      date: (l$date as String),
      influencer: l$influencer == null
          ? null
          : Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer
              .fromJson((l$influencer as Map<String, dynamic>)),
      restaurant: l$restaurant == null
          ? null
          : Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant
              .fromJson((l$restaurant as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final int influencer_id;

  final int sp_id;

  final double amount;

  final String sp_type;

  final String date;

  final Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer?
      influencer;

  final Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant?
      restaurant;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$influencer_id = influencer_id;
    _resultData['influencer_id'] = l$influencer_id;
    final l$sp_id = sp_id;
    _resultData['sp_id'] = l$sp_id;
    final l$amount = amount;
    _resultData['amount'] = moneyToJson(l$amount);
    final l$sp_type = sp_type;
    _resultData['sp_type'] = l$sp_type;
    final l$date = date;
    _resultData['date'] = l$date;
    final l$influencer = influencer;
    _resultData['influencer'] = l$influencer?.toJson();
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$influencer_id = influencer_id;
    final l$sp_id = sp_id;
    final l$amount = amount;
    final l$sp_type = sp_type;
    final l$date = date;
    final l$influencer = influencer;
    final l$restaurant = restaurant;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$influencer_id,
      l$sp_id,
      l$amount,
      l$sp_type,
      l$date,
      l$influencer,
      l$restaurant,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$GetInfluencerPayouts$service_provider_influencer_payouts) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$influencer_id = influencer_id;
    final lOther$influencer_id = other.influencer_id;
    if (l$influencer_id != lOther$influencer_id) {
      return false;
    }
    final l$sp_id = sp_id;
    final lOther$sp_id = other.sp_id;
    if (l$sp_id != lOther$sp_id) {
      return false;
    }
    final l$amount = amount;
    final lOther$amount = other.amount;
    if (l$amount != lOther$amount) {
      return false;
    }
    final l$sp_type = sp_type;
    final lOther$sp_type = other.sp_type;
    if (l$sp_type != lOther$sp_type) {
      return false;
    }
    final l$date = date;
    final lOther$date = other.date;
    if (l$date != lOther$date) {
      return false;
    }
    final l$influencer = influencer;
    final lOther$influencer = other.influencer;
    if (l$influencer != lOther$influencer) {
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

extension UtilityExtension$Query$GetInfluencerPayouts$service_provider_influencer_payouts
    on Query$GetInfluencerPayouts$service_provider_influencer_payouts {
  CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts<
          Query$GetInfluencerPayouts$service_provider_influencer_payouts>
      get copyWith =>
          CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts<
    TRes> {
  factory CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts(
    Query$GetInfluencerPayouts$service_provider_influencer_payouts instance,
    TRes Function(
            Query$GetInfluencerPayouts$service_provider_influencer_payouts)
        then,
  ) = _CopyWithImpl$Query$GetInfluencerPayouts$service_provider_influencer_payouts;

  factory CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetInfluencerPayouts$service_provider_influencer_payouts;

  TRes call({
    int? id,
    int? influencer_id,
    int? sp_id,
    double? amount,
    String? sp_type,
    String? date,
    Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer?
        influencer,
    Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant?
        restaurant,
    String? $__typename,
  });
  CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer<
      TRes> get influencer;
  CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant<
      TRes> get restaurant;
}

class _CopyWithImpl$Query$GetInfluencerPayouts$service_provider_influencer_payouts<
        TRes>
    implements
        CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts<
            TRes> {
  _CopyWithImpl$Query$GetInfluencerPayouts$service_provider_influencer_payouts(
    this._instance,
    this._then,
  );

  final Query$GetInfluencerPayouts$service_provider_influencer_payouts
      _instance;

  final TRes Function(
      Query$GetInfluencerPayouts$service_provider_influencer_payouts) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? influencer_id = _undefined,
    Object? sp_id = _undefined,
    Object? amount = _undefined,
    Object? sp_type = _undefined,
    Object? date = _undefined,
    Object? influencer = _undefined,
    Object? restaurant = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetInfluencerPayouts$service_provider_influencer_payouts(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        influencer_id: influencer_id == _undefined || influencer_id == null
            ? _instance.influencer_id
            : (influencer_id as int),
        sp_id: sp_id == _undefined || sp_id == null
            ? _instance.sp_id
            : (sp_id as int),
        amount: amount == _undefined || amount == null
            ? _instance.amount
            : (amount as double),
        sp_type: sp_type == _undefined || sp_type == null
            ? _instance.sp_type
            : (sp_type as String),
        date: date == _undefined || date == null
            ? _instance.date
            : (date as String),
        influencer: influencer == _undefined
            ? _instance.influencer
            : (influencer
                as Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer?),
        restaurant: restaurant == _undefined
            ? _instance.restaurant
            : (restaurant
                as Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer<
      TRes> get influencer {
    final local$influencer = _instance.influencer;
    return local$influencer == null
        ? CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer
            .stub(_then(_instance))
        : CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer(
            local$influencer, (e) => call(influencer: e));
  }

  CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant<
      TRes> get restaurant {
    final local$restaurant = _instance.restaurant;
    return local$restaurant == null
        ? CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant
            .stub(_then(_instance))
        : CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant(
            local$restaurant, (e) => call(restaurant: e));
  }
}

class _CopyWithStubImpl$Query$GetInfluencerPayouts$service_provider_influencer_payouts<
        TRes>
    implements
        CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts<
            TRes> {
  _CopyWithStubImpl$Query$GetInfluencerPayouts$service_provider_influencer_payouts(
      this._res);

  TRes _res;

  call({
    int? id,
    int? influencer_id,
    int? sp_id,
    double? amount,
    String? sp_type,
    String? date,
    Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer?
        influencer,
    Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant?
        restaurant,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer<
          TRes>
      get influencer =>
          CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer
              .stub(_res);
  CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant<
          TRes>
      get restaurant =>
          CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant
              .stub(_res);
}

class Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer {
  Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer({
    required this.id,
    this.user,
    required this.$__typename,
  });

  factory Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer(
      id: (l$id as int),
      user: l$user == null
          ? null
          : Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer$user
              .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer$user?
      user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$user = user;
    _resultData['user'] = l$user?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$user,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
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

extension UtilityExtension$Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer
    on Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer {
  CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer<
          Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer>
      get copyWith =>
          CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer<
    TRes> {
  factory CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer(
    Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer
        instance,
    TRes Function(
            Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer)
        then,
  ) = _CopyWithImpl$Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer;

  factory CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer;

  TRes call({
    int? id,
    Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer$user?
        user,
    String? $__typename,
  });
  CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer$user<
      TRes> get user;
}

class _CopyWithImpl$Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer<
        TRes>
    implements
        CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer<
            TRes> {
  _CopyWithImpl$Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer(
    this._instance,
    this._then,
  );

  final Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer
      _instance;

  final TRes Function(
          Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        user: user == _undefined
            ? _instance.user
            : (user
                as Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer$user?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer$user<
      TRes> get user {
    final local$user = _instance.user;
    return local$user == null
        ? CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer$user
            .stub(_then(_instance))
        : CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer$user(
            local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer<
        TRes>
    implements
        CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer<
            TRes> {
  _CopyWithStubImpl$Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer$user?
        user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer$user<
          TRes>
      get user =>
          CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer$user
              .stub(_res);
}

class Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer$user {
  Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer$user({
    required this.id,
    this.phone,
    this.image,
    this.name,
    required this.$__typename,
  });

  factory Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer$user.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$phone = json['phone'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer$user(
      id: (l$id as int),
      phone: (l$phone as String?),
      image: (l$image as String?),
      name: (l$name as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? phone;

  final String? image;

  final String? name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$phone = phone;
    _resultData['phone'] = l$phone;
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
    final l$phone = phone;
    final l$image = image;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$phone,
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
            is Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer$user) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (l$phone != lOther$phone) {
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

extension UtilityExtension$Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer$user
    on Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer$user {
  CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer$user<
          Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer$user>
      get copyWith =>
          CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer$user<
    TRes> {
  factory CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer$user(
    Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer$user
        instance,
    TRes Function(
            Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer$user)
        then,
  ) = _CopyWithImpl$Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer$user;

  factory CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer$user;

  TRes call({
    int? id,
    String? phone,
    String? image,
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer$user<
        TRes>
    implements
        CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer$user<
            TRes> {
  _CopyWithImpl$Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer$user(
    this._instance,
    this._then,
  );

  final Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer$user
      _instance;

  final TRes Function(
          Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? phone = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer$user(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        phone: phone == _undefined ? _instance.phone : (phone as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        name: name == _undefined ? _instance.name : (name as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer$user<
        TRes>
    implements
        CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer$user<
            TRes> {
  _CopyWithStubImpl$Query$GetInfluencerPayouts$service_provider_influencer_payouts$influencer$user(
      this._res);

  TRes _res;

  call({
    int? id,
    String? phone,
    String? image,
    String? name,
    String? $__typename,
  }) =>
      _res;
}

class Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant {
  Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant({
    required this.id,
    this.details,
    required this.$__typename,
  });

  factory Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant(
      id: (l$id as int),
      details: l$details == null
          ? null
          : Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details?
      details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$details = details;
    _resultData['details'] = l$details?.toJson();
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
    if (!(other
            is Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant) ||
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

extension UtilityExtension$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant
    on Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant {
  CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant<
          Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant>
      get copyWith =>
          CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant<
    TRes> {
  factory CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant(
    Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant
        instance,
    TRes Function(
            Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant)
        then,
  ) = _CopyWithImpl$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant;

  factory CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant;

  TRes call({
    int? id,
    Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details?
        details,
    String? $__typename,
  });
  CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details<
      TRes> get details;
}

class _CopyWithImpl$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant<
        TRes>
    implements
        CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant<
            TRes> {
  _CopyWithImpl$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant(
    this._instance,
    this._then,
  );

  final Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant
      _instance;

  final TRes Function(
          Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        details: details == _undefined
            ? _instance.details
            : (details
                as Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details<
      TRes> get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details
            .stub(_then(_instance))
        : CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant<
        TRes>
    implements
        CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant<
            TRes> {
  _CopyWithStubImpl$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details<
          TRes>
      get details =>
          CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details
              .stub(_res);
}

class Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details {
  Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details({
    required this.image,
    required this.name,
    this.phone_number,
    required this.location,
    required this.$__typename,
  });

  factory Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details.fromJson(
      Map<String, dynamic> json) {
    final l$image = json['image'];
    final l$name = json['name'];
    final l$phone_number = json['phone_number'];
    final l$location = json['location'];
    final l$$__typename = json['__typename'];
    return Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details(
      image: (l$image as String),
      name: (l$name as String),
      phone_number: (l$phone_number as String?),
      location:
          Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location
              .fromJson((l$location as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String image;

  final String name;

  final String? phone_number;

  final Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location
      location;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$image = image;
    _resultData['image'] = l$image;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$phone_number = phone_number;
    _resultData['phone_number'] = l$phone_number;
    final l$location = location;
    _resultData['location'] = l$location.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$image = image;
    final l$name = name;
    final l$phone_number = phone_number;
    final l$location = location;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$image,
      l$name,
      l$phone_number,
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
            is Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details) ||
        runtimeType != other.runtimeType) {
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
    final l$phone_number = phone_number;
    final lOther$phone_number = other.phone_number;
    if (l$phone_number != lOther$phone_number) {
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

extension UtilityExtension$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details
    on Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details {
  CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details<
          Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details>
      get copyWith =>
          CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details<
    TRes> {
  factory CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details(
    Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details
        instance,
    TRes Function(
            Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details)
        then,
  ) = _CopyWithImpl$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details;

  factory CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details;

  TRes call({
    String? image,
    String? name,
    String? phone_number,
    Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location?
        location,
    String? $__typename,
  });
  CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location<
      TRes> get location;
}

class _CopyWithImpl$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details<
        TRes>
    implements
        CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details<
            TRes> {
  _CopyWithImpl$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details(
    this._instance,
    this._then,
  );

  final Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details
      _instance;

  final TRes Function(
          Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? image = _undefined,
    Object? name = _undefined,
    Object? phone_number = _undefined,
    Object? location = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details(
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        phone_number: phone_number == _undefined
            ? _instance.phone_number
            : (phone_number as String?),
        location: location == _undefined || location == null
            ? _instance.location
            : (location
                as Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location<
      TRes> get location {
    final local$location = _instance.location;
    return CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location(
        local$location, (e) => call(location: e));
  }
}

class _CopyWithStubImpl$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details<
        TRes>
    implements
        CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details<
            TRes> {
  _CopyWithStubImpl$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details(
      this._res);

  TRes _res;

  call({
    String? image,
    String? name,
    String? phone_number,
    Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location?
        location,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location<
          TRes>
      get location =>
          CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location
              .stub(_res);
}

class Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location {
  Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location({
    required this.gps,
    required this.address,
    required this.$__typename,
  });

  factory Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location.fromJson(
      Map<String, dynamic> json) {
    final l$gps = json['gps'];
    final l$address = json['address'];
    final l$$__typename = json['__typename'];
    return Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location(
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
            is Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location) ||
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

extension UtilityExtension$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location
    on Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location {
  CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location<
          Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location>
      get copyWith =>
          CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location<
    TRes> {
  factory CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location(
    Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location
        instance,
    TRes Function(
            Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location)
        then,
  ) = _CopyWithImpl$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location;

  factory CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location;

  TRes call({
    Geography? gps,
    String? address,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location<
        TRes>
    implements
        CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location<
            TRes> {
  _CopyWithImpl$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location(
    this._instance,
    this._then,
  );

  final Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location
      _instance;

  final TRes Function(
          Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location)
      _then;

  static const _undefined = {};

  TRes call({
    Object? gps = _undefined,
    Object? address = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location(
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

class _CopyWithStubImpl$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location<
        TRes>
    implements
        CopyWith$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location<
            TRes> {
  _CopyWithStubImpl$Query$GetInfluencerPayouts$service_provider_influencer_payouts$restaurant$details$location(
      this._res);

  TRes _res;

  call({
    Geography? gps,
    String? address,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$deleteOfferById {
  factory Variables$Mutation$deleteOfferById({required int offerId}) =>
      Variables$Mutation$deleteOfferById._({
        r'offerId': offerId,
      });

  Variables$Mutation$deleteOfferById._(this._$data);

  factory Variables$Mutation$deleteOfferById.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$offerId = data['offerId'];
    result$data['offerId'] = (l$offerId as int);
    return Variables$Mutation$deleteOfferById._(result$data);
  }

  Map<String, dynamic> _$data;

  int get offerId => (_$data['offerId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$offerId = offerId;
    result$data['offerId'] = l$offerId;
    return result$data;
  }

  CopyWith$Variables$Mutation$deleteOfferById<
          Variables$Mutation$deleteOfferById>
      get copyWith => CopyWith$Variables$Mutation$deleteOfferById(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$deleteOfferById) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$offerId = offerId;
    final lOther$offerId = other.offerId;
    if (l$offerId != lOther$offerId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$offerId = offerId;
    return Object.hashAll([l$offerId]);
  }
}

abstract class CopyWith$Variables$Mutation$deleteOfferById<TRes> {
  factory CopyWith$Variables$Mutation$deleteOfferById(
    Variables$Mutation$deleteOfferById instance,
    TRes Function(Variables$Mutation$deleteOfferById) then,
  ) = _CopyWithImpl$Variables$Mutation$deleteOfferById;

  factory CopyWith$Variables$Mutation$deleteOfferById.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$deleteOfferById;

  TRes call({int? offerId});
}

class _CopyWithImpl$Variables$Mutation$deleteOfferById<TRes>
    implements CopyWith$Variables$Mutation$deleteOfferById<TRes> {
  _CopyWithImpl$Variables$Mutation$deleteOfferById(
    this._instance,
    this._then,
  );

  final Variables$Mutation$deleteOfferById _instance;

  final TRes Function(Variables$Mutation$deleteOfferById) _then;

  static const _undefined = {};

  TRes call({Object? offerId = _undefined}) =>
      _then(Variables$Mutation$deleteOfferById._({
        ..._instance._$data,
        if (offerId != _undefined && offerId != null)
          'offerId': (offerId as int),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$deleteOfferById<TRes>
    implements CopyWith$Variables$Mutation$deleteOfferById<TRes> {
  _CopyWithStubImpl$Variables$Mutation$deleteOfferById(this._res);

  TRes _res;

  call({int? offerId}) => _res;
}

class Mutation$deleteOfferById {
  Mutation$deleteOfferById({
    this.delete_service_provider_offer_by_pk,
    required this.$__typename,
  });

  factory Mutation$deleteOfferById.fromJson(Map<String, dynamic> json) {
    final l$delete_service_provider_offer_by_pk =
        json['delete_service_provider_offer_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$deleteOfferById(
      delete_service_provider_offer_by_pk:
          l$delete_service_provider_offer_by_pk == null
              ? null
              : Mutation$deleteOfferById$delete_service_provider_offer_by_pk
                  .fromJson((l$delete_service_provider_offer_by_pk
                      as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$deleteOfferById$delete_service_provider_offer_by_pk?
      delete_service_provider_offer_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delete_service_provider_offer_by_pk =
        delete_service_provider_offer_by_pk;
    _resultData['delete_service_provider_offer_by_pk'] =
        l$delete_service_provider_offer_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delete_service_provider_offer_by_pk =
        delete_service_provider_offer_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$delete_service_provider_offer_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$deleteOfferById) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delete_service_provider_offer_by_pk =
        delete_service_provider_offer_by_pk;
    final lOther$delete_service_provider_offer_by_pk =
        other.delete_service_provider_offer_by_pk;
    if (l$delete_service_provider_offer_by_pk !=
        lOther$delete_service_provider_offer_by_pk) {
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

extension UtilityExtension$Mutation$deleteOfferById
    on Mutation$deleteOfferById {
  CopyWith$Mutation$deleteOfferById<Mutation$deleteOfferById> get copyWith =>
      CopyWith$Mutation$deleteOfferById(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$deleteOfferById<TRes> {
  factory CopyWith$Mutation$deleteOfferById(
    Mutation$deleteOfferById instance,
    TRes Function(Mutation$deleteOfferById) then,
  ) = _CopyWithImpl$Mutation$deleteOfferById;

  factory CopyWith$Mutation$deleteOfferById.stub(TRes res) =
      _CopyWithStubImpl$Mutation$deleteOfferById;

  TRes call({
    Mutation$deleteOfferById$delete_service_provider_offer_by_pk?
        delete_service_provider_offer_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$deleteOfferById$delete_service_provider_offer_by_pk<TRes>
      get delete_service_provider_offer_by_pk;
}

class _CopyWithImpl$Mutation$deleteOfferById<TRes>
    implements CopyWith$Mutation$deleteOfferById<TRes> {
  _CopyWithImpl$Mutation$deleteOfferById(
    this._instance,
    this._then,
  );

  final Mutation$deleteOfferById _instance;

  final TRes Function(Mutation$deleteOfferById) _then;

  static const _undefined = {};

  TRes call({
    Object? delete_service_provider_offer_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$deleteOfferById(
        delete_service_provider_offer_by_pk: delete_service_provider_offer_by_pk ==
                _undefined
            ? _instance.delete_service_provider_offer_by_pk
            : (delete_service_provider_offer_by_pk
                as Mutation$deleteOfferById$delete_service_provider_offer_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$deleteOfferById$delete_service_provider_offer_by_pk<TRes>
      get delete_service_provider_offer_by_pk {
    final local$delete_service_provider_offer_by_pk =
        _instance.delete_service_provider_offer_by_pk;
    return local$delete_service_provider_offer_by_pk == null
        ? CopyWith$Mutation$deleteOfferById$delete_service_provider_offer_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$deleteOfferById$delete_service_provider_offer_by_pk(
            local$delete_service_provider_offer_by_pk,
            (e) => call(delete_service_provider_offer_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$deleteOfferById<TRes>
    implements CopyWith$Mutation$deleteOfferById<TRes> {
  _CopyWithStubImpl$Mutation$deleteOfferById(this._res);

  TRes _res;

  call({
    Mutation$deleteOfferById$delete_service_provider_offer_by_pk?
        delete_service_provider_offer_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$deleteOfferById$delete_service_provider_offer_by_pk<TRes>
      get delete_service_provider_offer_by_pk =>
          CopyWith$Mutation$deleteOfferById$delete_service_provider_offer_by_pk
              .stub(_res);
}

const documentNodeMutationdeleteOfferById = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'deleteOfferById'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'offerId')),
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
        name: NameNode(value: 'delete_service_provider_offer_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'offerId')),
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
Mutation$deleteOfferById _parserFn$Mutation$deleteOfferById(
        Map<String, dynamic> data) =>
    Mutation$deleteOfferById.fromJson(data);
typedef OnMutationCompleted$Mutation$deleteOfferById = FutureOr<void> Function(
  dynamic,
  Mutation$deleteOfferById?,
);

class Options$Mutation$deleteOfferById
    extends graphql.MutationOptions<Mutation$deleteOfferById> {
  Options$Mutation$deleteOfferById({
    String? operationName,
    required Variables$Mutation$deleteOfferById variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$deleteOfferById? onCompleted,
    graphql.OnMutationUpdate<Mutation$deleteOfferById>? update,
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
                        : _parserFn$Mutation$deleteOfferById(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationdeleteOfferById,
          parserFn: _parserFn$Mutation$deleteOfferById,
        );

  final OnMutationCompleted$Mutation$deleteOfferById? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$deleteOfferById
    extends graphql.WatchQueryOptions<Mutation$deleteOfferById> {
  WatchOptions$Mutation$deleteOfferById({
    String? operationName,
    required Variables$Mutation$deleteOfferById variables,
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
          document: documentNodeMutationdeleteOfferById,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$deleteOfferById,
        );
}

extension ClientExtension$Mutation$deleteOfferById on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$deleteOfferById>> mutate$deleteOfferById(
          Options$Mutation$deleteOfferById options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$deleteOfferById>
      watchMutation$deleteOfferById(
              WatchOptions$Mutation$deleteOfferById options) =>
          this.watchMutation(options);
}

class Mutation$deleteOfferById$delete_service_provider_offer_by_pk {
  Mutation$deleteOfferById$delete_service_provider_offer_by_pk({
    required this.id,
    required this.$__typename,
  });

  factory Mutation$deleteOfferById$delete_service_provider_offer_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$deleteOfferById$delete_service_provider_offer_by_pk(
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
            is Mutation$deleteOfferById$delete_service_provider_offer_by_pk) ||
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

extension UtilityExtension$Mutation$deleteOfferById$delete_service_provider_offer_by_pk
    on Mutation$deleteOfferById$delete_service_provider_offer_by_pk {
  CopyWith$Mutation$deleteOfferById$delete_service_provider_offer_by_pk<
          Mutation$deleteOfferById$delete_service_provider_offer_by_pk>
      get copyWith =>
          CopyWith$Mutation$deleteOfferById$delete_service_provider_offer_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$deleteOfferById$delete_service_provider_offer_by_pk<
    TRes> {
  factory CopyWith$Mutation$deleteOfferById$delete_service_provider_offer_by_pk(
    Mutation$deleteOfferById$delete_service_provider_offer_by_pk instance,
    TRes Function(Mutation$deleteOfferById$delete_service_provider_offer_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$deleteOfferById$delete_service_provider_offer_by_pk;

  factory CopyWith$Mutation$deleteOfferById$delete_service_provider_offer_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$deleteOfferById$delete_service_provider_offer_by_pk;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$deleteOfferById$delete_service_provider_offer_by_pk<
        TRes>
    implements
        CopyWith$Mutation$deleteOfferById$delete_service_provider_offer_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$deleteOfferById$delete_service_provider_offer_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$deleteOfferById$delete_service_provider_offer_by_pk _instance;

  final TRes Function(
      Mutation$deleteOfferById$delete_service_provider_offer_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$deleteOfferById$delete_service_provider_offer_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$deleteOfferById$delete_service_provider_offer_by_pk<
        TRes>
    implements
        CopyWith$Mutation$deleteOfferById$delete_service_provider_offer_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$deleteOfferById$delete_service_provider_offer_by_pk(
      this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}
