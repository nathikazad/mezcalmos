import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Variables$Mutation$setCusAppVersion {
  factory Variables$Mutation$setCusAppVersion({
    required int customer_id,
    required String version,
  }) =>
      Variables$Mutation$setCusAppVersion._({
        r'customer_id': customer_id,
        r'version': version,
      });

  Variables$Mutation$setCusAppVersion._(this._$data);

  factory Variables$Mutation$setCusAppVersion.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$customer_id = data['customer_id'];
    result$data['customer_id'] = (l$customer_id as int);
    final l$version = data['version'];
    result$data['version'] = (l$version as String);
    return Variables$Mutation$setCusAppVersion._(result$data);
  }

  Map<String, dynamic> _$data;

  int get customer_id => (_$data['customer_id'] as int);
  String get version => (_$data['version'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$customer_id = customer_id;
    result$data['customer_id'] = l$customer_id;
    final l$version = version;
    result$data['version'] = l$version;
    return result$data;
  }

  CopyWith$Variables$Mutation$setCusAppVersion<
          Variables$Mutation$setCusAppVersion>
      get copyWith => CopyWith$Variables$Mutation$setCusAppVersion(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$setCusAppVersion) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$customer_id = customer_id;
    final lOther$customer_id = other.customer_id;
    if (l$customer_id != lOther$customer_id) {
      return false;
    }
    final l$version = version;
    final lOther$version = other.version;
    if (l$version != lOther$version) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$customer_id = customer_id;
    final l$version = version;
    return Object.hashAll([
      l$customer_id,
      l$version,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$setCusAppVersion<TRes> {
  factory CopyWith$Variables$Mutation$setCusAppVersion(
    Variables$Mutation$setCusAppVersion instance,
    TRes Function(Variables$Mutation$setCusAppVersion) then,
  ) = _CopyWithImpl$Variables$Mutation$setCusAppVersion;

  factory CopyWith$Variables$Mutation$setCusAppVersion.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$setCusAppVersion;

  TRes call({
    int? customer_id,
    String? version,
  });
}

class _CopyWithImpl$Variables$Mutation$setCusAppVersion<TRes>
    implements CopyWith$Variables$Mutation$setCusAppVersion<TRes> {
  _CopyWithImpl$Variables$Mutation$setCusAppVersion(
    this._instance,
    this._then,
  );

  final Variables$Mutation$setCusAppVersion _instance;

  final TRes Function(Variables$Mutation$setCusAppVersion) _then;

  static const _undefined = {};

  TRes call({
    Object? customer_id = _undefined,
    Object? version = _undefined,
  }) =>
      _then(Variables$Mutation$setCusAppVersion._({
        ..._instance._$data,
        if (customer_id != _undefined && customer_id != null)
          'customer_id': (customer_id as int),
        if (version != _undefined && version != null)
          'version': (version as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$setCusAppVersion<TRes>
    implements CopyWith$Variables$Mutation$setCusAppVersion<TRes> {
  _CopyWithStubImpl$Variables$Mutation$setCusAppVersion(this._res);

  TRes _res;

  call({
    int? customer_id,
    String? version,
  }) =>
      _res;
}

class Mutation$setCusAppVersion {
  Mutation$setCusAppVersion({
    this.update_customer_by_pk,
    required this.$__typename,
  });

  factory Mutation$setCusAppVersion.fromJson(Map<String, dynamic> json) {
    final l$update_customer_by_pk = json['update_customer_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$setCusAppVersion(
      update_customer_by_pk: l$update_customer_by_pk == null
          ? null
          : Mutation$setCusAppVersion$update_customer_by_pk.fromJson(
              (l$update_customer_by_pk as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$setCusAppVersion$update_customer_by_pk? update_customer_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_customer_by_pk = update_customer_by_pk;
    _resultData['update_customer_by_pk'] = l$update_customer_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_customer_by_pk = update_customer_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_customer_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$setCusAppVersion) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_customer_by_pk = update_customer_by_pk;
    final lOther$update_customer_by_pk = other.update_customer_by_pk;
    if (l$update_customer_by_pk != lOther$update_customer_by_pk) {
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

extension UtilityExtension$Mutation$setCusAppVersion
    on Mutation$setCusAppVersion {
  CopyWith$Mutation$setCusAppVersion<Mutation$setCusAppVersion> get copyWith =>
      CopyWith$Mutation$setCusAppVersion(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$setCusAppVersion<TRes> {
  factory CopyWith$Mutation$setCusAppVersion(
    Mutation$setCusAppVersion instance,
    TRes Function(Mutation$setCusAppVersion) then,
  ) = _CopyWithImpl$Mutation$setCusAppVersion;

  factory CopyWith$Mutation$setCusAppVersion.stub(TRes res) =
      _CopyWithStubImpl$Mutation$setCusAppVersion;

  TRes call({
    Mutation$setCusAppVersion$update_customer_by_pk? update_customer_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$setCusAppVersion$update_customer_by_pk<TRes>
      get update_customer_by_pk;
}

class _CopyWithImpl$Mutation$setCusAppVersion<TRes>
    implements CopyWith$Mutation$setCusAppVersion<TRes> {
  _CopyWithImpl$Mutation$setCusAppVersion(
    this._instance,
    this._then,
  );

  final Mutation$setCusAppVersion _instance;

  final TRes Function(Mutation$setCusAppVersion) _then;

  static const _undefined = {};

  TRes call({
    Object? update_customer_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$setCusAppVersion(
        update_customer_by_pk: update_customer_by_pk == _undefined
            ? _instance.update_customer_by_pk
            : (update_customer_by_pk
                as Mutation$setCusAppVersion$update_customer_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$setCusAppVersion$update_customer_by_pk<TRes>
      get update_customer_by_pk {
    final local$update_customer_by_pk = _instance.update_customer_by_pk;
    return local$update_customer_by_pk == null
        ? CopyWith$Mutation$setCusAppVersion$update_customer_by_pk.stub(
            _then(_instance))
        : CopyWith$Mutation$setCusAppVersion$update_customer_by_pk(
            local$update_customer_by_pk, (e) => call(update_customer_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$setCusAppVersion<TRes>
    implements CopyWith$Mutation$setCusAppVersion<TRes> {
  _CopyWithStubImpl$Mutation$setCusAppVersion(this._res);

  TRes _res;

  call({
    Mutation$setCusAppVersion$update_customer_by_pk? update_customer_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$setCusAppVersion$update_customer_by_pk<TRes>
      get update_customer_by_pk =>
          CopyWith$Mutation$setCusAppVersion$update_customer_by_pk.stub(_res);
}

const documentNodeMutationsetCusAppVersion = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'setCusAppVersion'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'customer_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'version')),
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
        name: NameNode(value: 'update_customer_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'pk_columns'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'user_id'),
                value: VariableNode(name: NameNode(value: 'customer_id')),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: '_set'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'app_version'),
                value: VariableNode(name: NameNode(value: 'version')),
              )
            ]),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'app_version'),
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
]);
Mutation$setCusAppVersion _parserFn$Mutation$setCusAppVersion(
        Map<String, dynamic> data) =>
    Mutation$setCusAppVersion.fromJson(data);
typedef OnMutationCompleted$Mutation$setCusAppVersion = FutureOr<void> Function(
  dynamic,
  Mutation$setCusAppVersion?,
);

class Options$Mutation$setCusAppVersion
    extends graphql.MutationOptions<Mutation$setCusAppVersion> {
  Options$Mutation$setCusAppVersion({
    String? operationName,
    required Variables$Mutation$setCusAppVersion variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$setCusAppVersion? onCompleted,
    graphql.OnMutationUpdate<Mutation$setCusAppVersion>? update,
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
                        : _parserFn$Mutation$setCusAppVersion(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationsetCusAppVersion,
          parserFn: _parserFn$Mutation$setCusAppVersion,
        );

  final OnMutationCompleted$Mutation$setCusAppVersion? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$setCusAppVersion
    extends graphql.WatchQueryOptions<Mutation$setCusAppVersion> {
  WatchOptions$Mutation$setCusAppVersion({
    String? operationName,
    required Variables$Mutation$setCusAppVersion variables,
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
          document: documentNodeMutationsetCusAppVersion,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$setCusAppVersion,
        );
}

extension ClientExtension$Mutation$setCusAppVersion on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$setCusAppVersion>>
      mutate$setCusAppVersion(
              Options$Mutation$setCusAppVersion options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$setCusAppVersion>
      watchMutation$setCusAppVersion(
              WatchOptions$Mutation$setCusAppVersion options) =>
          this.watchMutation(options);
}

class Mutation$setCusAppVersion$update_customer_by_pk {
  Mutation$setCusAppVersion$update_customer_by_pk({
    required this.app_version,
    required this.$__typename,
  });

  factory Mutation$setCusAppVersion$update_customer_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$app_version = json['app_version'];
    final l$$__typename = json['__typename'];
    return Mutation$setCusAppVersion$update_customer_by_pk(
      app_version: (l$app_version as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String app_version;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$app_version = app_version;
    _resultData['app_version'] = l$app_version;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$app_version = app_version;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$app_version,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$setCusAppVersion$update_customer_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$app_version = app_version;
    final lOther$app_version = other.app_version;
    if (l$app_version != lOther$app_version) {
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

extension UtilityExtension$Mutation$setCusAppVersion$update_customer_by_pk
    on Mutation$setCusAppVersion$update_customer_by_pk {
  CopyWith$Mutation$setCusAppVersion$update_customer_by_pk<
          Mutation$setCusAppVersion$update_customer_by_pk>
      get copyWith => CopyWith$Mutation$setCusAppVersion$update_customer_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$setCusAppVersion$update_customer_by_pk<TRes> {
  factory CopyWith$Mutation$setCusAppVersion$update_customer_by_pk(
    Mutation$setCusAppVersion$update_customer_by_pk instance,
    TRes Function(Mutation$setCusAppVersion$update_customer_by_pk) then,
  ) = _CopyWithImpl$Mutation$setCusAppVersion$update_customer_by_pk;

  factory CopyWith$Mutation$setCusAppVersion$update_customer_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$setCusAppVersion$update_customer_by_pk;

  TRes call({
    String? app_version,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$setCusAppVersion$update_customer_by_pk<TRes>
    implements CopyWith$Mutation$setCusAppVersion$update_customer_by_pk<TRes> {
  _CopyWithImpl$Mutation$setCusAppVersion$update_customer_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$setCusAppVersion$update_customer_by_pk _instance;

  final TRes Function(Mutation$setCusAppVersion$update_customer_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? app_version = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$setCusAppVersion$update_customer_by_pk(
        app_version: app_version == _undefined || app_version == null
            ? _instance.app_version
            : (app_version as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$setCusAppVersion$update_customer_by_pk<TRes>
    implements CopyWith$Mutation$setCusAppVersion$update_customer_by_pk<TRes> {
  _CopyWithStubImpl$Mutation$setCusAppVersion$update_customer_by_pk(this._res);

  TRes _res;

  call({
    String? app_version,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getCustomerCart {
  factory Variables$Query$getCustomerCart({required int customer_id}) =>
      Variables$Query$getCustomerCart._({
        r'customer_id': customer_id,
      });

  Variables$Query$getCustomerCart._(this._$data);

  factory Variables$Query$getCustomerCart.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$customer_id = data['customer_id'];
    result$data['customer_id'] = (l$customer_id as int);
    return Variables$Query$getCustomerCart._(result$data);
  }

  Map<String, dynamic> _$data;

  int get customer_id => (_$data['customer_id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$customer_id = customer_id;
    result$data['customer_id'] = l$customer_id;
    return result$data;
  }

  CopyWith$Variables$Query$getCustomerCart<Variables$Query$getCustomerCart>
      get copyWith => CopyWith$Variables$Query$getCustomerCart(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getCustomerCart) ||
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

abstract class CopyWith$Variables$Query$getCustomerCart<TRes> {
  factory CopyWith$Variables$Query$getCustomerCart(
    Variables$Query$getCustomerCart instance,
    TRes Function(Variables$Query$getCustomerCart) then,
  ) = _CopyWithImpl$Variables$Query$getCustomerCart;

  factory CopyWith$Variables$Query$getCustomerCart.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getCustomerCart;

  TRes call({int? customer_id});
}

class _CopyWithImpl$Variables$Query$getCustomerCart<TRes>
    implements CopyWith$Variables$Query$getCustomerCart<TRes> {
  _CopyWithImpl$Variables$Query$getCustomerCart(
    this._instance,
    this._then,
  );

  final Variables$Query$getCustomerCart _instance;

  final TRes Function(Variables$Query$getCustomerCart) _then;

  static const _undefined = {};

  TRes call({Object? customer_id = _undefined}) =>
      _then(Variables$Query$getCustomerCart._({
        ..._instance._$data,
        if (customer_id != _undefined && customer_id != null)
          'customer_id': (customer_id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getCustomerCart<TRes>
    implements CopyWith$Variables$Query$getCustomerCart<TRes> {
  _CopyWithStubImpl$Variables$Query$getCustomerCart(this._res);

  TRes _res;

  call({int? customer_id}) => _res;
}

class Query$getCustomerCart {
  Query$getCustomerCart({
    this.customer_by_pk,
    required this.$__typename,
  });

  factory Query$getCustomerCart.fromJson(Map<String, dynamic> json) {
    final l$customer_by_pk = json['customer_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerCart(
      customer_by_pk: l$customer_by_pk == null
          ? null
          : Query$getCustomerCart$customer_by_pk.fromJson(
              (l$customer_by_pk as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$getCustomerCart$customer_by_pk? customer_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$customer_by_pk = customer_by_pk;
    _resultData['customer_by_pk'] = l$customer_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$customer_by_pk = customer_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$customer_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getCustomerCart) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$customer_by_pk = customer_by_pk;
    final lOther$customer_by_pk = other.customer_by_pk;
    if (l$customer_by_pk != lOther$customer_by_pk) {
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

extension UtilityExtension$Query$getCustomerCart on Query$getCustomerCart {
  CopyWith$Query$getCustomerCart<Query$getCustomerCart> get copyWith =>
      CopyWith$Query$getCustomerCart(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getCustomerCart<TRes> {
  factory CopyWith$Query$getCustomerCart(
    Query$getCustomerCart instance,
    TRes Function(Query$getCustomerCart) then,
  ) = _CopyWithImpl$Query$getCustomerCart;

  factory CopyWith$Query$getCustomerCart.stub(TRes res) =
      _CopyWithStubImpl$Query$getCustomerCart;

  TRes call({
    Query$getCustomerCart$customer_by_pk? customer_by_pk,
    String? $__typename,
  });
  CopyWith$Query$getCustomerCart$customer_by_pk<TRes> get customer_by_pk;
}

class _CopyWithImpl$Query$getCustomerCart<TRes>
    implements CopyWith$Query$getCustomerCart<TRes> {
  _CopyWithImpl$Query$getCustomerCart(
    this._instance,
    this._then,
  );

  final Query$getCustomerCart _instance;

  final TRes Function(Query$getCustomerCart) _then;

  static const _undefined = {};

  TRes call({
    Object? customer_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getCustomerCart(
        customer_by_pk: customer_by_pk == _undefined
            ? _instance.customer_by_pk
            : (customer_by_pk as Query$getCustomerCart$customer_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getCustomerCart$customer_by_pk<TRes> get customer_by_pk {
    final local$customer_by_pk = _instance.customer_by_pk;
    return local$customer_by_pk == null
        ? CopyWith$Query$getCustomerCart$customer_by_pk.stub(_then(_instance))
        : CopyWith$Query$getCustomerCart$customer_by_pk(
            local$customer_by_pk, (e) => call(customer_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$getCustomerCart<TRes>
    implements CopyWith$Query$getCustomerCart<TRes> {
  _CopyWithStubImpl$Query$getCustomerCart(this._res);

  TRes _res;

  call({
    Query$getCustomerCart$customer_by_pk? customer_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getCustomerCart$customer_by_pk<TRes> get customer_by_pk =>
      CopyWith$Query$getCustomerCart$customer_by_pk.stub(_res);
}

const documentNodeQuerygetCustomerCart = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getCustomerCart'),
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
        name: NameNode(value: 'customer_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'user_id'),
            value: VariableNode(name: NameNode(value: 'customer_id')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'cart'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'items'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'cost_per_one'),
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
                    name: NameNode(value: 'note'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'quantity'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'restaurant_item_id'),
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
]);
Query$getCustomerCart _parserFn$Query$getCustomerCart(
        Map<String, dynamic> data) =>
    Query$getCustomerCart.fromJson(data);

class Options$Query$getCustomerCart
    extends graphql.QueryOptions<Query$getCustomerCart> {
  Options$Query$getCustomerCart({
    String? operationName,
    required Variables$Query$getCustomerCart variables,
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
          document: documentNodeQuerygetCustomerCart,
          parserFn: _parserFn$Query$getCustomerCart,
        );
}

class WatchOptions$Query$getCustomerCart
    extends graphql.WatchQueryOptions<Query$getCustomerCart> {
  WatchOptions$Query$getCustomerCart({
    String? operationName,
    required Variables$Query$getCustomerCart variables,
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
          document: documentNodeQuerygetCustomerCart,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getCustomerCart,
        );
}

class FetchMoreOptions$Query$getCustomerCart extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getCustomerCart({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getCustomerCart variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetCustomerCart,
        );
}

extension ClientExtension$Query$getCustomerCart on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getCustomerCart>> query$getCustomerCart(
          Options$Query$getCustomerCart options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$getCustomerCart> watchQuery$getCustomerCart(
          WatchOptions$Query$getCustomerCart options) =>
      this.watchQuery(options);
  void writeQuery$getCustomerCart({
    required Query$getCustomerCart data,
    required Variables$Query$getCustomerCart variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerygetCustomerCart),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getCustomerCart? readQuery$getCustomerCart({
    required Variables$Query$getCustomerCart variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetCustomerCart),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getCustomerCart.fromJson(result);
  }
}

class Query$getCustomerCart$customer_by_pk {
  Query$getCustomerCart$customer_by_pk({
    this.cart,
    required this.$__typename,
  });

  factory Query$getCustomerCart$customer_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$cart = json['cart'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerCart$customer_by_pk(
      cart: l$cart == null
          ? null
          : Query$getCustomerCart$customer_by_pk$cart.fromJson(
              (l$cart as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$getCustomerCart$customer_by_pk$cart? cart;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$cart = cart;
    _resultData['cart'] = l$cart?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$cart = cart;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$cart,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getCustomerCart$customer_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$cart = cart;
    final lOther$cart = other.cart;
    if (l$cart != lOther$cart) {
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

extension UtilityExtension$Query$getCustomerCart$customer_by_pk
    on Query$getCustomerCart$customer_by_pk {
  CopyWith$Query$getCustomerCart$customer_by_pk<
          Query$getCustomerCart$customer_by_pk>
      get copyWith => CopyWith$Query$getCustomerCart$customer_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerCart$customer_by_pk<TRes> {
  factory CopyWith$Query$getCustomerCart$customer_by_pk(
    Query$getCustomerCart$customer_by_pk instance,
    TRes Function(Query$getCustomerCart$customer_by_pk) then,
  ) = _CopyWithImpl$Query$getCustomerCart$customer_by_pk;

  factory CopyWith$Query$getCustomerCart$customer_by_pk.stub(TRes res) =
      _CopyWithStubImpl$Query$getCustomerCart$customer_by_pk;

  TRes call({
    Query$getCustomerCart$customer_by_pk$cart? cart,
    String? $__typename,
  });
  CopyWith$Query$getCustomerCart$customer_by_pk$cart<TRes> get cart;
}

class _CopyWithImpl$Query$getCustomerCart$customer_by_pk<TRes>
    implements CopyWith$Query$getCustomerCart$customer_by_pk<TRes> {
  _CopyWithImpl$Query$getCustomerCart$customer_by_pk(
    this._instance,
    this._then,
  );

  final Query$getCustomerCart$customer_by_pk _instance;

  final TRes Function(Query$getCustomerCart$customer_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? cart = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getCustomerCart$customer_by_pk(
        cart: cart == _undefined
            ? _instance.cart
            : (cart as Query$getCustomerCart$customer_by_pk$cart?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getCustomerCart$customer_by_pk$cart<TRes> get cart {
    final local$cart = _instance.cart;
    return local$cart == null
        ? CopyWith$Query$getCustomerCart$customer_by_pk$cart.stub(
            _then(_instance))
        : CopyWith$Query$getCustomerCart$customer_by_pk$cart(
            local$cart, (e) => call(cart: e));
  }
}

class _CopyWithStubImpl$Query$getCustomerCart$customer_by_pk<TRes>
    implements CopyWith$Query$getCustomerCart$customer_by_pk<TRes> {
  _CopyWithStubImpl$Query$getCustomerCart$customer_by_pk(this._res);

  TRes _res;

  call({
    Query$getCustomerCart$customer_by_pk$cart? cart,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getCustomerCart$customer_by_pk$cart<TRes> get cart =>
      CopyWith$Query$getCustomerCart$customer_by_pk$cart.stub(_res);
}

class Query$getCustomerCart$customer_by_pk$cart {
  Query$getCustomerCart$customer_by_pk$cart({
    required this.items,
    required this.$__typename,
  });

  factory Query$getCustomerCart$customer_by_pk$cart.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerCart$customer_by_pk$cart(
      items: (l$items as List<dynamic>)
          .map((e) => Query$getCustomerCart$customer_by_pk$cart$items.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$getCustomerCart$customer_by_pk$cart$items> items;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$items = items;
    _resultData['items'] = l$items.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$items = items;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$items.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getCustomerCart$customer_by_pk$cart) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
    if (l$items.length != lOther$items.length) {
      return false;
    }
    for (int i = 0; i < l$items.length; i++) {
      final l$items$entry = l$items[i];
      final lOther$items$entry = lOther$items[i];
      if (l$items$entry != lOther$items$entry) {
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

extension UtilityExtension$Query$getCustomerCart$customer_by_pk$cart
    on Query$getCustomerCart$customer_by_pk$cart {
  CopyWith$Query$getCustomerCart$customer_by_pk$cart<
          Query$getCustomerCart$customer_by_pk$cart>
      get copyWith => CopyWith$Query$getCustomerCart$customer_by_pk$cart(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerCart$customer_by_pk$cart<TRes> {
  factory CopyWith$Query$getCustomerCart$customer_by_pk$cart(
    Query$getCustomerCart$customer_by_pk$cart instance,
    TRes Function(Query$getCustomerCart$customer_by_pk$cart) then,
  ) = _CopyWithImpl$Query$getCustomerCart$customer_by_pk$cart;

  factory CopyWith$Query$getCustomerCart$customer_by_pk$cart.stub(TRes res) =
      _CopyWithStubImpl$Query$getCustomerCart$customer_by_pk$cart;

  TRes call({
    List<Query$getCustomerCart$customer_by_pk$cart$items>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Query$getCustomerCart$customer_by_pk$cart$items> Function(
              Iterable<
                  CopyWith$Query$getCustomerCart$customer_by_pk$cart$items<
                      Query$getCustomerCart$customer_by_pk$cart$items>>)
          _fn);
}

class _CopyWithImpl$Query$getCustomerCart$customer_by_pk$cart<TRes>
    implements CopyWith$Query$getCustomerCart$customer_by_pk$cart<TRes> {
  _CopyWithImpl$Query$getCustomerCart$customer_by_pk$cart(
    this._instance,
    this._then,
  );

  final Query$getCustomerCart$customer_by_pk$cart _instance;

  final TRes Function(Query$getCustomerCart$customer_by_pk$cart) _then;

  static const _undefined = {};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getCustomerCart$customer_by_pk$cart(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Query$getCustomerCart$customer_by_pk$cart$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Query$getCustomerCart$customer_by_pk$cart$items> Function(
                  Iterable<
                      CopyWith$Query$getCustomerCart$customer_by_pk$cart$items<
                          Query$getCustomerCart$customer_by_pk$cart$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map(
              (e) => CopyWith$Query$getCustomerCart$customer_by_pk$cart$items(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getCustomerCart$customer_by_pk$cart<TRes>
    implements CopyWith$Query$getCustomerCart$customer_by_pk$cart<TRes> {
  _CopyWithStubImpl$Query$getCustomerCart$customer_by_pk$cart(this._res);

  TRes _res;

  call({
    List<Query$getCustomerCart$customer_by_pk$cart$items>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Query$getCustomerCart$customer_by_pk$cart$items {
  Query$getCustomerCart$customer_by_pk$cart$items({
    required this.cost_per_one,
    required this.id,
    this.note,
    required this.quantity,
    required this.restaurant_item_id,
    required this.$__typename,
  });

  factory Query$getCustomerCart$customer_by_pk$cart$items.fromJson(
      Map<String, dynamic> json) {
    final l$cost_per_one = json['cost_per_one'];
    final l$id = json['id'];
    final l$note = json['note'];
    final l$quantity = json['quantity'];
    final l$restaurant_item_id = json['restaurant_item_id'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerCart$customer_by_pk$cart$items(
      cost_per_one: MoneyFromJson(l$cost_per_one),
      id: (l$id as int),
      note: (l$note as String?),
      quantity: (l$quantity as int),
      restaurant_item_id: (l$restaurant_item_id as int),
      $__typename: (l$$__typename as String),
    );
  }

  final double cost_per_one;

  final int id;

  final String? note;

  final int quantity;

  final int restaurant_item_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$cost_per_one = cost_per_one;
    _resultData['cost_per_one'] = MoneyToJson(l$cost_per_one);
    final l$id = id;
    _resultData['id'] = l$id;
    final l$note = note;
    _resultData['note'] = l$note;
    final l$quantity = quantity;
    _resultData['quantity'] = l$quantity;
    final l$restaurant_item_id = restaurant_item_id;
    _resultData['restaurant_item_id'] = l$restaurant_item_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$cost_per_one = cost_per_one;
    final l$id = id;
    final l$note = note;
    final l$quantity = quantity;
    final l$restaurant_item_id = restaurant_item_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$cost_per_one,
      l$id,
      l$note,
      l$quantity,
      l$restaurant_item_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getCustomerCart$customer_by_pk$cart$items) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$cost_per_one = cost_per_one;
    final lOther$cost_per_one = other.cost_per_one;
    if (l$cost_per_one != lOther$cost_per_one) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$note = note;
    final lOther$note = other.note;
    if (l$note != lOther$note) {
      return false;
    }
    final l$quantity = quantity;
    final lOther$quantity = other.quantity;
    if (l$quantity != lOther$quantity) {
      return false;
    }
    final l$restaurant_item_id = restaurant_item_id;
    final lOther$restaurant_item_id = other.restaurant_item_id;
    if (l$restaurant_item_id != lOther$restaurant_item_id) {
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

extension UtilityExtension$Query$getCustomerCart$customer_by_pk$cart$items
    on Query$getCustomerCart$customer_by_pk$cart$items {
  CopyWith$Query$getCustomerCart$customer_by_pk$cart$items<
          Query$getCustomerCart$customer_by_pk$cart$items>
      get copyWith => CopyWith$Query$getCustomerCart$customer_by_pk$cart$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerCart$customer_by_pk$cart$items<TRes> {
  factory CopyWith$Query$getCustomerCart$customer_by_pk$cart$items(
    Query$getCustomerCart$customer_by_pk$cart$items instance,
    TRes Function(Query$getCustomerCart$customer_by_pk$cart$items) then,
  ) = _CopyWithImpl$Query$getCustomerCart$customer_by_pk$cart$items;

  factory CopyWith$Query$getCustomerCart$customer_by_pk$cart$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCustomerCart$customer_by_pk$cart$items;

  TRes call({
    double? cost_per_one,
    int? id,
    String? note,
    int? quantity,
    int? restaurant_item_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getCustomerCart$customer_by_pk$cart$items<TRes>
    implements CopyWith$Query$getCustomerCart$customer_by_pk$cart$items<TRes> {
  _CopyWithImpl$Query$getCustomerCart$customer_by_pk$cart$items(
    this._instance,
    this._then,
  );

  final Query$getCustomerCart$customer_by_pk$cart$items _instance;

  final TRes Function(Query$getCustomerCart$customer_by_pk$cart$items) _then;

  static const _undefined = {};

  TRes call({
    Object? cost_per_one = _undefined,
    Object? id = _undefined,
    Object? note = _undefined,
    Object? quantity = _undefined,
    Object? restaurant_item_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getCustomerCart$customer_by_pk$cart$items(
        cost_per_one: cost_per_one == _undefined || cost_per_one == null
            ? _instance.cost_per_one
            : (cost_per_one as double),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        note: note == _undefined ? _instance.note : (note as String?),
        quantity: quantity == _undefined || quantity == null
            ? _instance.quantity
            : (quantity as int),
        restaurant_item_id:
            restaurant_item_id == _undefined || restaurant_item_id == null
                ? _instance.restaurant_item_id
                : (restaurant_item_id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getCustomerCart$customer_by_pk$cart$items<TRes>
    implements CopyWith$Query$getCustomerCart$customer_by_pk$cart$items<TRes> {
  _CopyWithStubImpl$Query$getCustomerCart$customer_by_pk$cart$items(this._res);

  TRes _res;

  call({
    double? cost_per_one,
    int? id,
    String? note,
    int? quantity,
    int? restaurant_item_id,
    String? $__typename,
  }) =>
      _res;
}
