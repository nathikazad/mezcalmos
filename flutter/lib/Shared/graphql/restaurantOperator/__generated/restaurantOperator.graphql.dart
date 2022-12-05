import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$getOperatorRestaurantInfo {
  factory Variables$Query$getOperatorRestaurantInfo(
          {required int operatorId}) =>
      Variables$Query$getOperatorRestaurantInfo._({
        r'operatorId': operatorId,
      });

  Variables$Query$getOperatorRestaurantInfo._(this._$data);

  factory Variables$Query$getOperatorRestaurantInfo.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$operatorId = data['operatorId'];
    result$data['operatorId'] = (l$operatorId as int);
    return Variables$Query$getOperatorRestaurantInfo._(result$data);
  }

  Map<String, dynamic> _$data;

  int get operatorId => (_$data['operatorId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$operatorId = operatorId;
    result$data['operatorId'] = l$operatorId;
    return result$data;
  }

  CopyWith$Variables$Query$getOperatorRestaurantInfo<
          Variables$Query$getOperatorRestaurantInfo>
      get copyWith => CopyWith$Variables$Query$getOperatorRestaurantInfo(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getOperatorRestaurantInfo) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$operatorId = operatorId;
    final lOther$operatorId = other.operatorId;
    if (l$operatorId != lOther$operatorId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$operatorId = operatorId;
    return Object.hashAll([l$operatorId]);
  }
}

abstract class CopyWith$Variables$Query$getOperatorRestaurantInfo<TRes> {
  factory CopyWith$Variables$Query$getOperatorRestaurantInfo(
    Variables$Query$getOperatorRestaurantInfo instance,
    TRes Function(Variables$Query$getOperatorRestaurantInfo) then,
  ) = _CopyWithImpl$Variables$Query$getOperatorRestaurantInfo;

  factory CopyWith$Variables$Query$getOperatorRestaurantInfo.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getOperatorRestaurantInfo;

  TRes call({int? operatorId});
}

class _CopyWithImpl$Variables$Query$getOperatorRestaurantInfo<TRes>
    implements CopyWith$Variables$Query$getOperatorRestaurantInfo<TRes> {
  _CopyWithImpl$Variables$Query$getOperatorRestaurantInfo(
    this._instance,
    this._then,
  );

  final Variables$Query$getOperatorRestaurantInfo _instance;

  final TRes Function(Variables$Query$getOperatorRestaurantInfo) _then;

  static const _undefined = {};

  TRes call({Object? operatorId = _undefined}) =>
      _then(Variables$Query$getOperatorRestaurantInfo._({
        ..._instance._$data,
        if (operatorId != _undefined && operatorId != null)
          'operatorId': (operatorId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getOperatorRestaurantInfo<TRes>
    implements CopyWith$Variables$Query$getOperatorRestaurantInfo<TRes> {
  _CopyWithStubImpl$Variables$Query$getOperatorRestaurantInfo(this._res);

  TRes _res;

  call({int? operatorId}) => _res;
}

class Query$getOperatorRestaurantInfo {
  Query$getOperatorRestaurantInfo({
    required this.restaurant_operator,
    required this.$__typename,
  });

  factory Query$getOperatorRestaurantInfo.fromJson(Map<String, dynamic> json) {
    final l$restaurant_operator = json['restaurant_operator'];
    final l$$__typename = json['__typename'];
    return Query$getOperatorRestaurantInfo(
      restaurant_operator: (l$restaurant_operator as List<dynamic>)
          .map((e) =>
              Query$getOperatorRestaurantInfo$restaurant_operator.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getOperatorRestaurantInfo$restaurant_operator>
      restaurant_operator;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_operator = restaurant_operator;
    _resultData['restaurant_operator'] =
        l$restaurant_operator.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_operator = restaurant_operator;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$restaurant_operator.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getOperatorRestaurantInfo) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_operator = restaurant_operator;
    final lOther$restaurant_operator = other.restaurant_operator;
    if (l$restaurant_operator.length != lOther$restaurant_operator.length) {
      return false;
    }
    for (int i = 0; i < l$restaurant_operator.length; i++) {
      final l$restaurant_operator$entry = l$restaurant_operator[i];
      final lOther$restaurant_operator$entry = lOther$restaurant_operator[i];
      if (l$restaurant_operator$entry != lOther$restaurant_operator$entry) {
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

extension UtilityExtension$Query$getOperatorRestaurantInfo
    on Query$getOperatorRestaurantInfo {
  CopyWith$Query$getOperatorRestaurantInfo<Query$getOperatorRestaurantInfo>
      get copyWith => CopyWith$Query$getOperatorRestaurantInfo(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOperatorRestaurantInfo<TRes> {
  factory CopyWith$Query$getOperatorRestaurantInfo(
    Query$getOperatorRestaurantInfo instance,
    TRes Function(Query$getOperatorRestaurantInfo) then,
  ) = _CopyWithImpl$Query$getOperatorRestaurantInfo;

  factory CopyWith$Query$getOperatorRestaurantInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$getOperatorRestaurantInfo;

  TRes call({
    List<Query$getOperatorRestaurantInfo$restaurant_operator>?
        restaurant_operator,
    String? $__typename,
  });
  TRes restaurant_operator(
      Iterable<Query$getOperatorRestaurantInfo$restaurant_operator> Function(
              Iterable<
                  CopyWith$Query$getOperatorRestaurantInfo$restaurant_operator<
                      Query$getOperatorRestaurantInfo$restaurant_operator>>)
          _fn);
}

class _CopyWithImpl$Query$getOperatorRestaurantInfo<TRes>
    implements CopyWith$Query$getOperatorRestaurantInfo<TRes> {
  _CopyWithImpl$Query$getOperatorRestaurantInfo(
    this._instance,
    this._then,
  );

  final Query$getOperatorRestaurantInfo _instance;

  final TRes Function(Query$getOperatorRestaurantInfo) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_operator = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOperatorRestaurantInfo(
        restaurant_operator: restaurant_operator == _undefined ||
                restaurant_operator == null
            ? _instance.restaurant_operator
            : (restaurant_operator
                as List<Query$getOperatorRestaurantInfo$restaurant_operator>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes restaurant_operator(
          Iterable<Query$getOperatorRestaurantInfo$restaurant_operator> Function(
                  Iterable<
                      CopyWith$Query$getOperatorRestaurantInfo$restaurant_operator<
                          Query$getOperatorRestaurantInfo$restaurant_operator>>)
              _fn) =>
      call(
          restaurant_operator: _fn(_instance.restaurant_operator.map((e) =>
              CopyWith$Query$getOperatorRestaurantInfo$restaurant_operator(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getOperatorRestaurantInfo<TRes>
    implements CopyWith$Query$getOperatorRestaurantInfo<TRes> {
  _CopyWithStubImpl$Query$getOperatorRestaurantInfo(this._res);

  TRes _res;

  call({
    List<Query$getOperatorRestaurantInfo$restaurant_operator>?
        restaurant_operator,
    String? $__typename,
  }) =>
      _res;
  restaurant_operator(_fn) => _res;
}

const documentNodeQuerygetOperatorRestaurantInfo = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getOperatorRestaurantInfo'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'operatorId')),
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
        name: NameNode(value: 'restaurant_operator'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'user_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'operatorId')),
                  )
                ]),
              )
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'restaurant_id'),
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
            name: NameNode(value: 'owner'),
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
Query$getOperatorRestaurantInfo _parserFn$Query$getOperatorRestaurantInfo(
        Map<String, dynamic> data) =>
    Query$getOperatorRestaurantInfo.fromJson(data);

class Options$Query$getOperatorRestaurantInfo
    extends graphql.QueryOptions<Query$getOperatorRestaurantInfo> {
  Options$Query$getOperatorRestaurantInfo({
    String? operationName,
    required Variables$Query$getOperatorRestaurantInfo variables,
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
          document: documentNodeQuerygetOperatorRestaurantInfo,
          parserFn: _parserFn$Query$getOperatorRestaurantInfo,
        );
}

class WatchOptions$Query$getOperatorRestaurantInfo
    extends graphql.WatchQueryOptions<Query$getOperatorRestaurantInfo> {
  WatchOptions$Query$getOperatorRestaurantInfo({
    String? operationName,
    required Variables$Query$getOperatorRestaurantInfo variables,
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
          document: documentNodeQuerygetOperatorRestaurantInfo,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getOperatorRestaurantInfo,
        );
}

class FetchMoreOptions$Query$getOperatorRestaurantInfo
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getOperatorRestaurantInfo({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getOperatorRestaurantInfo variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetOperatorRestaurantInfo,
        );
}

extension ClientExtension$Query$getOperatorRestaurantInfo
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getOperatorRestaurantInfo>>
      query$getOperatorRestaurantInfo(
              Options$Query$getOperatorRestaurantInfo options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getOperatorRestaurantInfo>
      watchQuery$getOperatorRestaurantInfo(
              WatchOptions$Query$getOperatorRestaurantInfo options) =>
          this.watchQuery(options);
  void writeQuery$getOperatorRestaurantInfo({
    required Query$getOperatorRestaurantInfo data,
    required Variables$Query$getOperatorRestaurantInfo variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetOperatorRestaurantInfo),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getOperatorRestaurantInfo? readQuery$getOperatorRestaurantInfo({
    required Variables$Query$getOperatorRestaurantInfo variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQuerygetOperatorRestaurantInfo),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$getOperatorRestaurantInfo.fromJson(result);
  }
}

class Query$getOperatorRestaurantInfo$restaurant_operator {
  Query$getOperatorRestaurantInfo$restaurant_operator({
    required this.restaurant_id,
    required this.status,
    required this.owner,
    required this.$__typename,
  });

  factory Query$getOperatorRestaurantInfo$restaurant_operator.fromJson(
      Map<String, dynamic> json) {
    final l$restaurant_id = json['restaurant_id'];
    final l$status = json['status'];
    final l$owner = json['owner'];
    final l$$__typename = json['__typename'];
    return Query$getOperatorRestaurantInfo$restaurant_operator(
      restaurant_id: (l$restaurant_id as int),
      status: (l$status as String),
      owner: (l$owner as bool),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int restaurant_id;

  final String status;

  final bool owner;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_id = restaurant_id;
    _resultData['restaurant_id'] = l$restaurant_id;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$owner = owner;
    _resultData['owner'] = l$owner;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_id = restaurant_id;
    final l$status = status;
    final l$owner = owner;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$restaurant_id,
      l$status,
      l$owner,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getOperatorRestaurantInfo$restaurant_operator) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_id = restaurant_id;
    final lOther$restaurant_id = other.restaurant_id;
    if (l$restaurant_id != lOther$restaurant_id) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$owner = owner;
    final lOther$owner = other.owner;
    if (l$owner != lOther$owner) {
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

extension UtilityExtension$Query$getOperatorRestaurantInfo$restaurant_operator
    on Query$getOperatorRestaurantInfo$restaurant_operator {
  CopyWith$Query$getOperatorRestaurantInfo$restaurant_operator<
          Query$getOperatorRestaurantInfo$restaurant_operator>
      get copyWith =>
          CopyWith$Query$getOperatorRestaurantInfo$restaurant_operator(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOperatorRestaurantInfo$restaurant_operator<
    TRes> {
  factory CopyWith$Query$getOperatorRestaurantInfo$restaurant_operator(
    Query$getOperatorRestaurantInfo$restaurant_operator instance,
    TRes Function(Query$getOperatorRestaurantInfo$restaurant_operator) then,
  ) = _CopyWithImpl$Query$getOperatorRestaurantInfo$restaurant_operator;

  factory CopyWith$Query$getOperatorRestaurantInfo$restaurant_operator.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOperatorRestaurantInfo$restaurant_operator;

  TRes call({
    int? restaurant_id,
    String? status,
    bool? owner,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getOperatorRestaurantInfo$restaurant_operator<TRes>
    implements
        CopyWith$Query$getOperatorRestaurantInfo$restaurant_operator<TRes> {
  _CopyWithImpl$Query$getOperatorRestaurantInfo$restaurant_operator(
    this._instance,
    this._then,
  );

  final Query$getOperatorRestaurantInfo$restaurant_operator _instance;

  final TRes Function(Query$getOperatorRestaurantInfo$restaurant_operator)
      _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_id = _undefined,
    Object? status = _undefined,
    Object? owner = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOperatorRestaurantInfo$restaurant_operator(
        restaurant_id: restaurant_id == _undefined || restaurant_id == null
            ? _instance.restaurant_id
            : (restaurant_id as int),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        owner: owner == _undefined || owner == null
            ? _instance.owner
            : (owner as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getOperatorRestaurantInfo$restaurant_operator<
        TRes>
    implements
        CopyWith$Query$getOperatorRestaurantInfo$restaurant_operator<TRes> {
  _CopyWithStubImpl$Query$getOperatorRestaurantInfo$restaurant_operator(
      this._res);

  TRes _res;

  call({
    int? restaurant_id,
    String? status,
    bool? owner,
    String? $__typename,
  }) =>
      _res;
}
