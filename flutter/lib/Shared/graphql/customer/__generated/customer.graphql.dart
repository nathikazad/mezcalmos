import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Variables$Mutation$set_customer_app_version {
  factory Variables$Mutation$set_customer_app_version({
    required int customer_id,
    required String version,
  }) =>
      Variables$Mutation$set_customer_app_version._({
        r'customer_id': customer_id,
        r'version': version,
      });

  Variables$Mutation$set_customer_app_version._(this._$data);

  factory Variables$Mutation$set_customer_app_version.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$customer_id = data['customer_id'];
    result$data['customer_id'] = (l$customer_id as int);
    final l$version = data['version'];
    result$data['version'] = (l$version as String);
    return Variables$Mutation$set_customer_app_version._(result$data);
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

  CopyWith$Variables$Mutation$set_customer_app_version<
          Variables$Mutation$set_customer_app_version>
      get copyWith => CopyWith$Variables$Mutation$set_customer_app_version(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$set_customer_app_version) ||
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

abstract class CopyWith$Variables$Mutation$set_customer_app_version<TRes> {
  factory CopyWith$Variables$Mutation$set_customer_app_version(
    Variables$Mutation$set_customer_app_version instance,
    TRes Function(Variables$Mutation$set_customer_app_version) then,
  ) = _CopyWithImpl$Variables$Mutation$set_customer_app_version;

  factory CopyWith$Variables$Mutation$set_customer_app_version.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$set_customer_app_version;

  TRes call({
    int? customer_id,
    String? version,
  });
}

class _CopyWithImpl$Variables$Mutation$set_customer_app_version<TRes>
    implements CopyWith$Variables$Mutation$set_customer_app_version<TRes> {
  _CopyWithImpl$Variables$Mutation$set_customer_app_version(
    this._instance,
    this._then,
  );

  final Variables$Mutation$set_customer_app_version _instance;

  final TRes Function(Variables$Mutation$set_customer_app_version) _then;

  static const _undefined = {};

  TRes call({
    Object? customer_id = _undefined,
    Object? version = _undefined,
  }) =>
      _then(Variables$Mutation$set_customer_app_version._({
        ..._instance._$data,
        if (customer_id != _undefined && customer_id != null)
          'customer_id': (customer_id as int),
        if (version != _undefined && version != null)
          'version': (version as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$set_customer_app_version<TRes>
    implements CopyWith$Variables$Mutation$set_customer_app_version<TRes> {
  _CopyWithStubImpl$Variables$Mutation$set_customer_app_version(this._res);

  TRes _res;

  call({
    int? customer_id,
    String? version,
  }) =>
      _res;
}

class Mutation$set_customer_app_version {
  Mutation$set_customer_app_version({
    this.update_customer_by_pk,
    required this.$__typename,
  });

  factory Mutation$set_customer_app_version.fromJson(
      Map<String, dynamic> json) {
    final l$update_customer_by_pk = json['update_customer_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$set_customer_app_version(
      update_customer_by_pk: l$update_customer_by_pk == null
          ? null
          : Mutation$set_customer_app_version$update_customer_by_pk.fromJson(
              (l$update_customer_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$set_customer_app_version$update_customer_by_pk?
      update_customer_by_pk;

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
    if (!(other is Mutation$set_customer_app_version) ||
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

extension UtilityExtension$Mutation$set_customer_app_version
    on Mutation$set_customer_app_version {
  CopyWith$Mutation$set_customer_app_version<Mutation$set_customer_app_version>
      get copyWith => CopyWith$Mutation$set_customer_app_version(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$set_customer_app_version<TRes> {
  factory CopyWith$Mutation$set_customer_app_version(
    Mutation$set_customer_app_version instance,
    TRes Function(Mutation$set_customer_app_version) then,
  ) = _CopyWithImpl$Mutation$set_customer_app_version;

  factory CopyWith$Mutation$set_customer_app_version.stub(TRes res) =
      _CopyWithStubImpl$Mutation$set_customer_app_version;

  TRes call({
    Mutation$set_customer_app_version$update_customer_by_pk?
        update_customer_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$set_customer_app_version$update_customer_by_pk<TRes>
      get update_customer_by_pk;
}

class _CopyWithImpl$Mutation$set_customer_app_version<TRes>
    implements CopyWith$Mutation$set_customer_app_version<TRes> {
  _CopyWithImpl$Mutation$set_customer_app_version(
    this._instance,
    this._then,
  );

  final Mutation$set_customer_app_version _instance;

  final TRes Function(Mutation$set_customer_app_version) _then;

  static const _undefined = {};

  TRes call({
    Object? update_customer_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$set_customer_app_version(
        update_customer_by_pk: update_customer_by_pk == _undefined
            ? _instance.update_customer_by_pk
            : (update_customer_by_pk
                as Mutation$set_customer_app_version$update_customer_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$set_customer_app_version$update_customer_by_pk<TRes>
      get update_customer_by_pk {
    final local$update_customer_by_pk = _instance.update_customer_by_pk;
    return local$update_customer_by_pk == null
        ? CopyWith$Mutation$set_customer_app_version$update_customer_by_pk.stub(
            _then(_instance))
        : CopyWith$Mutation$set_customer_app_version$update_customer_by_pk(
            local$update_customer_by_pk, (e) => call(update_customer_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$set_customer_app_version<TRes>
    implements CopyWith$Mutation$set_customer_app_version<TRes> {
  _CopyWithStubImpl$Mutation$set_customer_app_version(this._res);

  TRes _res;

  call({
    Mutation$set_customer_app_version$update_customer_by_pk?
        update_customer_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$set_customer_app_version$update_customer_by_pk<TRes>
      get update_customer_by_pk =>
          CopyWith$Mutation$set_customer_app_version$update_customer_by_pk.stub(
              _res);
}

const documentNodeMutationset_customer_app_version = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'set_customer_app_version'),
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
    ]),
  ),
]);
Mutation$set_customer_app_version _parserFn$Mutation$set_customer_app_version(
        Map<String, dynamic> data) =>
    Mutation$set_customer_app_version.fromJson(data);
typedef OnMutationCompleted$Mutation$set_customer_app_version = FutureOr<void>
    Function(
  dynamic,
  Mutation$set_customer_app_version?,
);

class Options$Mutation$set_customer_app_version
    extends graphql.MutationOptions<Mutation$set_customer_app_version> {
  Options$Mutation$set_customer_app_version({
    String? operationName,
    required Variables$Mutation$set_customer_app_version variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$set_customer_app_version? onCompleted,
    graphql.OnMutationUpdate<Mutation$set_customer_app_version>? update,
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
                        : _parserFn$Mutation$set_customer_app_version(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationset_customer_app_version,
          parserFn: _parserFn$Mutation$set_customer_app_version,
        );

  final OnMutationCompleted$Mutation$set_customer_app_version?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$set_customer_app_version
    extends graphql.WatchQueryOptions<Mutation$set_customer_app_version> {
  WatchOptions$Mutation$set_customer_app_version({
    String? operationName,
    required Variables$Mutation$set_customer_app_version variables,
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
          document: documentNodeMutationset_customer_app_version,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$set_customer_app_version,
        );
}

extension ClientExtension$Mutation$set_customer_app_version
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$set_customer_app_version>>
      mutate$set_customer_app_version(
              Options$Mutation$set_customer_app_version options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$set_customer_app_version>
      watchMutation$set_customer_app_version(
              WatchOptions$Mutation$set_customer_app_version options) =>
          this.watchMutation(options);
}

class Mutation$set_customer_app_version$update_customer_by_pk {
  Mutation$set_customer_app_version$update_customer_by_pk({
    required this.app_version,
    required this.$__typename,
  });

  factory Mutation$set_customer_app_version$update_customer_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$app_version = json['app_version'];
    final l$$__typename = json['__typename'];
    return Mutation$set_customer_app_version$update_customer_by_pk(
      app_version: (l$app_version as String),
      $__typename: ((l$$__typename ?? "none") as String),
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
    if (!(other is Mutation$set_customer_app_version$update_customer_by_pk) ||
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

extension UtilityExtension$Mutation$set_customer_app_version$update_customer_by_pk
    on Mutation$set_customer_app_version$update_customer_by_pk {
  CopyWith$Mutation$set_customer_app_version$update_customer_by_pk<
          Mutation$set_customer_app_version$update_customer_by_pk>
      get copyWith =>
          CopyWith$Mutation$set_customer_app_version$update_customer_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$set_customer_app_version$update_customer_by_pk<
    TRes> {
  factory CopyWith$Mutation$set_customer_app_version$update_customer_by_pk(
    Mutation$set_customer_app_version$update_customer_by_pk instance,
    TRes Function(Mutation$set_customer_app_version$update_customer_by_pk) then,
  ) = _CopyWithImpl$Mutation$set_customer_app_version$update_customer_by_pk;

  factory CopyWith$Mutation$set_customer_app_version$update_customer_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$set_customer_app_version$update_customer_by_pk;

  TRes call({
    String? app_version,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$set_customer_app_version$update_customer_by_pk<
        TRes>
    implements
        CopyWith$Mutation$set_customer_app_version$update_customer_by_pk<TRes> {
  _CopyWithImpl$Mutation$set_customer_app_version$update_customer_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$set_customer_app_version$update_customer_by_pk _instance;

  final TRes Function(Mutation$set_customer_app_version$update_customer_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? app_version = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$set_customer_app_version$update_customer_by_pk(
        app_version: app_version == _undefined || app_version == null
            ? _instance.app_version
            : (app_version as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$set_customer_app_version$update_customer_by_pk<
        TRes>
    implements
        CopyWith$Mutation$set_customer_app_version$update_customer_by_pk<TRes> {
  _CopyWithStubImpl$Mutation$set_customer_app_version$update_customer_by_pk(
      this._res);

  TRes _res;

  call({
    String? app_version,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$set_notif_token {
  factory Variables$Mutation$set_notif_token({
    required int customer_id,
    required String token,
  }) =>
      Variables$Mutation$set_notif_token._({
        r'customer_id': customer_id,
        r'token': token,
      });

  Variables$Mutation$set_notif_token._(this._$data);

  factory Variables$Mutation$set_notif_token.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$customer_id = data['customer_id'];
    result$data['customer_id'] = (l$customer_id as int);
    final l$token = data['token'];
    result$data['token'] = (l$token as String);
    return Variables$Mutation$set_notif_token._(result$data);
  }

  Map<String, dynamic> _$data;

  int get customer_id => (_$data['customer_id'] as int);
  String get token => (_$data['token'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$customer_id = customer_id;
    result$data['customer_id'] = l$customer_id;
    final l$token = token;
    result$data['token'] = l$token;
    return result$data;
  }

  CopyWith$Variables$Mutation$set_notif_token<
          Variables$Mutation$set_notif_token>
      get copyWith => CopyWith$Variables$Mutation$set_notif_token(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$set_notif_token) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$customer_id = customer_id;
    final lOther$customer_id = other.customer_id;
    if (l$customer_id != lOther$customer_id) {
      return false;
    }
    final l$token = token;
    final lOther$token = other.token;
    if (l$token != lOther$token) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$customer_id = customer_id;
    final l$token = token;
    return Object.hashAll([
      l$customer_id,
      l$token,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$set_notif_token<TRes> {
  factory CopyWith$Variables$Mutation$set_notif_token(
    Variables$Mutation$set_notif_token instance,
    TRes Function(Variables$Mutation$set_notif_token) then,
  ) = _CopyWithImpl$Variables$Mutation$set_notif_token;

  factory CopyWith$Variables$Mutation$set_notif_token.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$set_notif_token;

  TRes call({
    int? customer_id,
    String? token,
  });
}

class _CopyWithImpl$Variables$Mutation$set_notif_token<TRes>
    implements CopyWith$Variables$Mutation$set_notif_token<TRes> {
  _CopyWithImpl$Variables$Mutation$set_notif_token(
    this._instance,
    this._then,
  );

  final Variables$Mutation$set_notif_token _instance;

  final TRes Function(Variables$Mutation$set_notif_token) _then;

  static const _undefined = {};

  TRes call({
    Object? customer_id = _undefined,
    Object? token = _undefined,
  }) =>
      _then(Variables$Mutation$set_notif_token._({
        ..._instance._$data,
        if (customer_id != _undefined && customer_id != null)
          'customer_id': (customer_id as int),
        if (token != _undefined && token != null) 'token': (token as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$set_notif_token<TRes>
    implements CopyWith$Variables$Mutation$set_notif_token<TRes> {
  _CopyWithStubImpl$Variables$Mutation$set_notif_token(this._res);

  TRes _res;

  call({
    int? customer_id,
    String? token,
  }) =>
      _res;
}

class Mutation$set_notif_token {
  Mutation$set_notif_token({
    this.update_notification_info,
    required this.$__typename,
  });

  factory Mutation$set_notif_token.fromJson(Map<String, dynamic> json) {
    final l$update_notification_info = json['update_notification_info'];
    final l$$__typename = json['__typename'];
    return Mutation$set_notif_token(
      update_notification_info: l$update_notification_info == null
          ? null
          : Mutation$set_notif_token$update_notification_info.fromJson(
              (l$update_notification_info as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$set_notif_token$update_notification_info?
      update_notification_info;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_notification_info = update_notification_info;
    _resultData['update_notification_info'] =
        l$update_notification_info?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_notification_info = update_notification_info;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_notification_info,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$set_notif_token) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_notification_info = update_notification_info;
    final lOther$update_notification_info = other.update_notification_info;
    if (l$update_notification_info != lOther$update_notification_info) {
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

extension UtilityExtension$Mutation$set_notif_token
    on Mutation$set_notif_token {
  CopyWith$Mutation$set_notif_token<Mutation$set_notif_token> get copyWith =>
      CopyWith$Mutation$set_notif_token(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$set_notif_token<TRes> {
  factory CopyWith$Mutation$set_notif_token(
    Mutation$set_notif_token instance,
    TRes Function(Mutation$set_notif_token) then,
  ) = _CopyWithImpl$Mutation$set_notif_token;

  factory CopyWith$Mutation$set_notif_token.stub(TRes res) =
      _CopyWithStubImpl$Mutation$set_notif_token;

  TRes call({
    Mutation$set_notif_token$update_notification_info? update_notification_info,
    String? $__typename,
  });
  CopyWith$Mutation$set_notif_token$update_notification_info<TRes>
      get update_notification_info;
}

class _CopyWithImpl$Mutation$set_notif_token<TRes>
    implements CopyWith$Mutation$set_notif_token<TRes> {
  _CopyWithImpl$Mutation$set_notif_token(
    this._instance,
    this._then,
  );

  final Mutation$set_notif_token _instance;

  final TRes Function(Mutation$set_notif_token) _then;

  static const _undefined = {};

  TRes call({
    Object? update_notification_info = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$set_notif_token(
        update_notification_info: update_notification_info == _undefined
            ? _instance.update_notification_info
            : (update_notification_info
                as Mutation$set_notif_token$update_notification_info?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$set_notif_token$update_notification_info<TRes>
      get update_notification_info {
    final local$update_notification_info = _instance.update_notification_info;
    return local$update_notification_info == null
        ? CopyWith$Mutation$set_notif_token$update_notification_info.stub(
            _then(_instance))
        : CopyWith$Mutation$set_notif_token$update_notification_info(
            local$update_notification_info,
            (e) => call(update_notification_info: e));
  }
}

class _CopyWithStubImpl$Mutation$set_notif_token<TRes>
    implements CopyWith$Mutation$set_notif_token<TRes> {
  _CopyWithStubImpl$Mutation$set_notif_token(this._res);

  TRes _res;

  call({
    Mutation$set_notif_token$update_notification_info? update_notification_info,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$set_notif_token$update_notification_info<TRes>
      get update_notification_info =>
          CopyWith$Mutation$set_notif_token$update_notification_info.stub(_res);
}

const documentNodeMutationset_notif_token = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'set_notif_token'),
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
        variable: VariableNode(name: NameNode(value: 'token')),
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
        name: NameNode(value: 'update_notification_info'),
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
                    value: VariableNode(name: NameNode(value: 'customer_id')),
                  )
                ]),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: '_set'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'token'),
                value: VariableNode(name: NameNode(value: 'token')),
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
                name: NameNode(value: 'token'),
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
Mutation$set_notif_token _parserFn$Mutation$set_notif_token(
        Map<String, dynamic> data) =>
    Mutation$set_notif_token.fromJson(data);
typedef OnMutationCompleted$Mutation$set_notif_token = FutureOr<void> Function(
  dynamic,
  Mutation$set_notif_token?,
);

class Options$Mutation$set_notif_token
    extends graphql.MutationOptions<Mutation$set_notif_token> {
  Options$Mutation$set_notif_token({
    String? operationName,
    required Variables$Mutation$set_notif_token variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$set_notif_token? onCompleted,
    graphql.OnMutationUpdate<Mutation$set_notif_token>? update,
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
                        : _parserFn$Mutation$set_notif_token(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationset_notif_token,
          parserFn: _parserFn$Mutation$set_notif_token,
        );

  final OnMutationCompleted$Mutation$set_notif_token? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$set_notif_token
    extends graphql.WatchQueryOptions<Mutation$set_notif_token> {
  WatchOptions$Mutation$set_notif_token({
    String? operationName,
    required Variables$Mutation$set_notif_token variables,
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
          document: documentNodeMutationset_notif_token,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$set_notif_token,
        );
}

extension ClientExtension$Mutation$set_notif_token on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$set_notif_token>> mutate$set_notif_token(
          Options$Mutation$set_notif_token options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$set_notif_token>
      watchMutation$set_notif_token(
              WatchOptions$Mutation$set_notif_token options) =>
          this.watchMutation(options);
}

class Mutation$set_notif_token$update_notification_info {
  Mutation$set_notif_token$update_notification_info({
    required this.returning,
    required this.$__typename,
  });

  factory Mutation$set_notif_token$update_notification_info.fromJson(
      Map<String, dynamic> json) {
    final l$returning = json['returning'];
    final l$$__typename = json['__typename'];
    return Mutation$set_notif_token$update_notification_info(
      returning: (l$returning as List<dynamic>)
          .map((e) =>
              Mutation$set_notif_token$update_notification_info$returning
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Mutation$set_notif_token$update_notification_info$returning>
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
    if (!(other is Mutation$set_notif_token$update_notification_info) ||
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

extension UtilityExtension$Mutation$set_notif_token$update_notification_info
    on Mutation$set_notif_token$update_notification_info {
  CopyWith$Mutation$set_notif_token$update_notification_info<
          Mutation$set_notif_token$update_notification_info>
      get copyWith =>
          CopyWith$Mutation$set_notif_token$update_notification_info(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$set_notif_token$update_notification_info<
    TRes> {
  factory CopyWith$Mutation$set_notif_token$update_notification_info(
    Mutation$set_notif_token$update_notification_info instance,
    TRes Function(Mutation$set_notif_token$update_notification_info) then,
  ) = _CopyWithImpl$Mutation$set_notif_token$update_notification_info;

  factory CopyWith$Mutation$set_notif_token$update_notification_info.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$set_notif_token$update_notification_info;

  TRes call({
    List<Mutation$set_notif_token$update_notification_info$returning>?
        returning,
    String? $__typename,
  });
  TRes returning(
      Iterable<Mutation$set_notif_token$update_notification_info$returning> Function(
              Iterable<
                  CopyWith$Mutation$set_notif_token$update_notification_info$returning<
                      Mutation$set_notif_token$update_notification_info$returning>>)
          _fn);
}

class _CopyWithImpl$Mutation$set_notif_token$update_notification_info<TRes>
    implements
        CopyWith$Mutation$set_notif_token$update_notification_info<TRes> {
  _CopyWithImpl$Mutation$set_notif_token$update_notification_info(
    this._instance,
    this._then,
  );

  final Mutation$set_notif_token$update_notification_info _instance;

  final TRes Function(Mutation$set_notif_token$update_notification_info) _then;

  static const _undefined = {};

  TRes call({
    Object? returning = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$set_notif_token$update_notification_info(
        returning: returning == _undefined || returning == null
            ? _instance.returning
            : (returning as List<
                Mutation$set_notif_token$update_notification_info$returning>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes returning(
          Iterable<Mutation$set_notif_token$update_notification_info$returning> Function(
                  Iterable<
                      CopyWith$Mutation$set_notif_token$update_notification_info$returning<
                          Mutation$set_notif_token$update_notification_info$returning>>)
              _fn) =>
      call(
          returning: _fn(_instance.returning.map((e) =>
              CopyWith$Mutation$set_notif_token$update_notification_info$returning(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Mutation$set_notif_token$update_notification_info<TRes>
    implements
        CopyWith$Mutation$set_notif_token$update_notification_info<TRes> {
  _CopyWithStubImpl$Mutation$set_notif_token$update_notification_info(
      this._res);

  TRes _res;

  call({
    List<Mutation$set_notif_token$update_notification_info$returning>?
        returning,
    String? $__typename,
  }) =>
      _res;
  returning(_fn) => _res;
}

class Mutation$set_notif_token$update_notification_info$returning {
  Mutation$set_notif_token$update_notification_info$returning({
    required this.token,
    required this.$__typename,
  });

  factory Mutation$set_notif_token$update_notification_info$returning.fromJson(
      Map<String, dynamic> json) {
    final l$token = json['token'];
    final l$$__typename = json['__typename'];
    return Mutation$set_notif_token$update_notification_info$returning(
      token: (l$token as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String token;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$token = token;
    _resultData['token'] = l$token;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$token = token;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$token,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$set_notif_token$update_notification_info$returning) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$token = token;
    final lOther$token = other.token;
    if (l$token != lOther$token) {
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

extension UtilityExtension$Mutation$set_notif_token$update_notification_info$returning
    on Mutation$set_notif_token$update_notification_info$returning {
  CopyWith$Mutation$set_notif_token$update_notification_info$returning<
          Mutation$set_notif_token$update_notification_info$returning>
      get copyWith =>
          CopyWith$Mutation$set_notif_token$update_notification_info$returning(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$set_notif_token$update_notification_info$returning<
    TRes> {
  factory CopyWith$Mutation$set_notif_token$update_notification_info$returning(
    Mutation$set_notif_token$update_notification_info$returning instance,
    TRes Function(Mutation$set_notif_token$update_notification_info$returning)
        then,
  ) = _CopyWithImpl$Mutation$set_notif_token$update_notification_info$returning;

  factory CopyWith$Mutation$set_notif_token$update_notification_info$returning.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$set_notif_token$update_notification_info$returning;

  TRes call({
    String? token,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$set_notif_token$update_notification_info$returning<
        TRes>
    implements
        CopyWith$Mutation$set_notif_token$update_notification_info$returning<
            TRes> {
  _CopyWithImpl$Mutation$set_notif_token$update_notification_info$returning(
    this._instance,
    this._then,
  );

  final Mutation$set_notif_token$update_notification_info$returning _instance;

  final TRes Function(
      Mutation$set_notif_token$update_notification_info$returning) _then;

  static const _undefined = {};

  TRes call({
    Object? token = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$set_notif_token$update_notification_info$returning(
        token: token == _undefined || token == null
            ? _instance.token
            : (token as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$set_notif_token$update_notification_info$returning<
        TRes>
    implements
        CopyWith$Mutation$set_notif_token$update_notification_info$returning<
            TRes> {
  _CopyWithStubImpl$Mutation$set_notif_token$update_notification_info$returning(
      this._res);

  TRes _res;

  call({
    String? token,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$get_customer_info {
  factory Variables$Query$get_customer_info({required int customer_id}) =>
      Variables$Query$get_customer_info._({
        r'customer_id': customer_id,
      });

  Variables$Query$get_customer_info._(this._$data);

  factory Variables$Query$get_customer_info.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$customer_id = data['customer_id'];
    result$data['customer_id'] = (l$customer_id as int);
    return Variables$Query$get_customer_info._(result$data);
  }

  Map<String, dynamic> _$data;

  int get customer_id => (_$data['customer_id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$customer_id = customer_id;
    result$data['customer_id'] = l$customer_id;
    return result$data;
  }

  CopyWith$Variables$Query$get_customer_info<Variables$Query$get_customer_info>
      get copyWith => CopyWith$Variables$Query$get_customer_info(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_customer_info) ||
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

abstract class CopyWith$Variables$Query$get_customer_info<TRes> {
  factory CopyWith$Variables$Query$get_customer_info(
    Variables$Query$get_customer_info instance,
    TRes Function(Variables$Query$get_customer_info) then,
  ) = _CopyWithImpl$Variables$Query$get_customer_info;

  factory CopyWith$Variables$Query$get_customer_info.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$get_customer_info;

  TRes call({int? customer_id});
}

class _CopyWithImpl$Variables$Query$get_customer_info<TRes>
    implements CopyWith$Variables$Query$get_customer_info<TRes> {
  _CopyWithImpl$Variables$Query$get_customer_info(
    this._instance,
    this._then,
  );

  final Variables$Query$get_customer_info _instance;

  final TRes Function(Variables$Query$get_customer_info) _then;

  static const _undefined = {};

  TRes call({Object? customer_id = _undefined}) =>
      _then(Variables$Query$get_customer_info._({
        ..._instance._$data,
        if (customer_id != _undefined && customer_id != null)
          'customer_id': (customer_id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_customer_info<TRes>
    implements CopyWith$Variables$Query$get_customer_info<TRes> {
  _CopyWithStubImpl$Variables$Query$get_customer_info(this._res);

  TRes _res;

  call({int? customer_id}) => _res;
}

class Query$get_customer_info {
  Query$get_customer_info({
    required this.customer,
    required this.$__typename,
  });

  factory Query$get_customer_info.fromJson(Map<String, dynamic> json) {
    final l$customer = json['customer'];
    final l$$__typename = json['__typename'];
    return Query$get_customer_info(
      customer: (l$customer as List<dynamic>)
          .map((e) => Query$get_customer_info$customer.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$get_customer_info$customer> customer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$customer = customer;
    _resultData['customer'] = l$customer.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$customer = customer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$customer.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_customer_info) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$customer = customer;
    final lOther$customer = other.customer;
    if (l$customer.length != lOther$customer.length) {
      return false;
    }
    for (int i = 0; i < l$customer.length; i++) {
      final l$customer$entry = l$customer[i];
      final lOther$customer$entry = lOther$customer[i];
      if (l$customer$entry != lOther$customer$entry) {
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

extension UtilityExtension$Query$get_customer_info on Query$get_customer_info {
  CopyWith$Query$get_customer_info<Query$get_customer_info> get copyWith =>
      CopyWith$Query$get_customer_info(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$get_customer_info<TRes> {
  factory CopyWith$Query$get_customer_info(
    Query$get_customer_info instance,
    TRes Function(Query$get_customer_info) then,
  ) = _CopyWithImpl$Query$get_customer_info;

  factory CopyWith$Query$get_customer_info.stub(TRes res) =
      _CopyWithStubImpl$Query$get_customer_info;

  TRes call({
    List<Query$get_customer_info$customer>? customer,
    String? $__typename,
  });
  TRes customer(
      Iterable<Query$get_customer_info$customer> Function(
              Iterable<
                  CopyWith$Query$get_customer_info$customer<
                      Query$get_customer_info$customer>>)
          _fn);
}

class _CopyWithImpl$Query$get_customer_info<TRes>
    implements CopyWith$Query$get_customer_info<TRes> {
  _CopyWithImpl$Query$get_customer_info(
    this._instance,
    this._then,
  );

  final Query$get_customer_info _instance;

  final TRes Function(Query$get_customer_info) _then;

  static const _undefined = {};

  TRes call({
    Object? customer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_customer_info(
        customer: customer == _undefined || customer == null
            ? _instance.customer
            : (customer as List<Query$get_customer_info$customer>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes customer(
          Iterable<Query$get_customer_info$customer> Function(
                  Iterable<
                      CopyWith$Query$get_customer_info$customer<
                          Query$get_customer_info$customer>>)
              _fn) =>
      call(
          customer: _fn(_instance.customer
              .map((e) => CopyWith$Query$get_customer_info$customer(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$get_customer_info<TRes>
    implements CopyWith$Query$get_customer_info<TRes> {
  _CopyWithStubImpl$Query$get_customer_info(this._res);

  TRes _res;

  call({
    List<Query$get_customer_info$customer>? customer,
    String? $__typename,
  }) =>
      _res;
  customer(_fn) => _res;
}

const documentNodeQueryget_customer_info = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_customer_info'),
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
        name: NameNode(value: 'customer'),
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
                    value: VariableNode(name: NameNode(value: 'customer_id')),
                  )
                ]),
              )
            ]),
          )
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
            name: NameNode(value: 'notification_token'),
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
                name: NameNode(value: 'email'),
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
            name: NameNode(value: 'saved_locations'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'where'),
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
                name: NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'location_gps'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'location_text'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'default'),
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
Query$get_customer_info _parserFn$Query$get_customer_info(
        Map<String, dynamic> data) =>
    Query$get_customer_info.fromJson(data);

class Options$Query$get_customer_info
    extends graphql.QueryOptions<Query$get_customer_info> {
  Options$Query$get_customer_info({
    String? operationName,
    required Variables$Query$get_customer_info variables,
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
          document: documentNodeQueryget_customer_info,
          parserFn: _parserFn$Query$get_customer_info,
        );
}

class WatchOptions$Query$get_customer_info
    extends graphql.WatchQueryOptions<Query$get_customer_info> {
  WatchOptions$Query$get_customer_info({
    String? operationName,
    required Variables$Query$get_customer_info variables,
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
          document: documentNodeQueryget_customer_info,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_customer_info,
        );
}

class FetchMoreOptions$Query$get_customer_info
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_customer_info({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_customer_info variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_customer_info,
        );
}

extension ClientExtension$Query$get_customer_info on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_customer_info>> query$get_customer_info(
          Options$Query$get_customer_info options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$get_customer_info> watchQuery$get_customer_info(
          WatchOptions$Query$get_customer_info options) =>
      this.watchQuery(options);
  void writeQuery$get_customer_info({
    required Query$get_customer_info data,
    required Variables$Query$get_customer_info variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryget_customer_info),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_customer_info? readQuery$get_customer_info({
    required Variables$Query$get_customer_info variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryget_customer_info),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$get_customer_info.fromJson(result);
  }
}

class Query$get_customer_info$customer {
  Query$get_customer_info$customer({
    required this.app_version,
    this.notification_token,
    required this.user,
    required this.saved_locations,
    required this.$__typename,
  });

  factory Query$get_customer_info$customer.fromJson(Map<String, dynamic> json) {
    final l$app_version = json['app_version'];
    final l$notification_token = json['notification_token'];
    final l$user = json['user'];
    final l$saved_locations = json['saved_locations'];
    final l$$__typename = json['__typename'];
    return Query$get_customer_info$customer(
      app_version: (l$app_version as String),
      notification_token: (l$notification_token as String?),
      user: Query$get_customer_info$customer$user.fromJson(
          (l$user as Map<String, dynamic>)),
      saved_locations: (l$saved_locations as List<dynamic>)
          .map((e) => Query$get_customer_info$customer$saved_locations.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String app_version;

  final String? notification_token;

  final Query$get_customer_info$customer$user user;

  final List<Query$get_customer_info$customer$saved_locations> saved_locations;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$app_version = app_version;
    _resultData['app_version'] = l$app_version;
    final l$notification_token = notification_token;
    _resultData['notification_token'] = l$notification_token;
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$saved_locations = saved_locations;
    _resultData['saved_locations'] =
        l$saved_locations.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$app_version = app_version;
    final l$notification_token = notification_token;
    final l$user = user;
    final l$saved_locations = saved_locations;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$app_version,
      l$notification_token,
      l$user,
      Object.hashAll(l$saved_locations.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_customer_info$customer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$app_version = app_version;
    final lOther$app_version = other.app_version;
    if (l$app_version != lOther$app_version) {
      return false;
    }
    final l$notification_token = notification_token;
    final lOther$notification_token = other.notification_token;
    if (l$notification_token != lOther$notification_token) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
      return false;
    }
    final l$saved_locations = saved_locations;
    final lOther$saved_locations = other.saved_locations;
    if (l$saved_locations.length != lOther$saved_locations.length) {
      return false;
    }
    for (int i = 0; i < l$saved_locations.length; i++) {
      final l$saved_locations$entry = l$saved_locations[i];
      final lOther$saved_locations$entry = lOther$saved_locations[i];
      if (l$saved_locations$entry != lOther$saved_locations$entry) {
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

extension UtilityExtension$Query$get_customer_info$customer
    on Query$get_customer_info$customer {
  CopyWith$Query$get_customer_info$customer<Query$get_customer_info$customer>
      get copyWith => CopyWith$Query$get_customer_info$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_customer_info$customer<TRes> {
  factory CopyWith$Query$get_customer_info$customer(
    Query$get_customer_info$customer instance,
    TRes Function(Query$get_customer_info$customer) then,
  ) = _CopyWithImpl$Query$get_customer_info$customer;

  factory CopyWith$Query$get_customer_info$customer.stub(TRes res) =
      _CopyWithStubImpl$Query$get_customer_info$customer;

  TRes call({
    String? app_version,
    String? notification_token,
    Query$get_customer_info$customer$user? user,
    List<Query$get_customer_info$customer$saved_locations>? saved_locations,
    String? $__typename,
  });
  CopyWith$Query$get_customer_info$customer$user<TRes> get user;
  TRes saved_locations(
      Iterable<Query$get_customer_info$customer$saved_locations> Function(
              Iterable<
                  CopyWith$Query$get_customer_info$customer$saved_locations<
                      Query$get_customer_info$customer$saved_locations>>)
          _fn);
}

class _CopyWithImpl$Query$get_customer_info$customer<TRes>
    implements CopyWith$Query$get_customer_info$customer<TRes> {
  _CopyWithImpl$Query$get_customer_info$customer(
    this._instance,
    this._then,
  );

  final Query$get_customer_info$customer _instance;

  final TRes Function(Query$get_customer_info$customer) _then;

  static const _undefined = {};

  TRes call({
    Object? app_version = _undefined,
    Object? notification_token = _undefined,
    Object? user = _undefined,
    Object? saved_locations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_customer_info$customer(
        app_version: app_version == _undefined || app_version == null
            ? _instance.app_version
            : (app_version as String),
        notification_token: notification_token == _undefined
            ? _instance.notification_token
            : (notification_token as String?),
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Query$get_customer_info$customer$user),
        saved_locations:
            saved_locations == _undefined || saved_locations == null
                ? _instance.saved_locations
                : (saved_locations
                    as List<Query$get_customer_info$customer$saved_locations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_customer_info$customer$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$get_customer_info$customer$user(
        local$user, (e) => call(user: e));
  }

  TRes saved_locations(
          Iterable<Query$get_customer_info$customer$saved_locations> Function(
                  Iterable<
                      CopyWith$Query$get_customer_info$customer$saved_locations<
                          Query$get_customer_info$customer$saved_locations>>)
              _fn) =>
      call(
          saved_locations: _fn(_instance.saved_locations.map(
              (e) => CopyWith$Query$get_customer_info$customer$saved_locations(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$get_customer_info$customer<TRes>
    implements CopyWith$Query$get_customer_info$customer<TRes> {
  _CopyWithStubImpl$Query$get_customer_info$customer(this._res);

  TRes _res;

  call({
    String? app_version,
    String? notification_token,
    Query$get_customer_info$customer$user? user,
    List<Query$get_customer_info$customer$saved_locations>? saved_locations,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_customer_info$customer$user<TRes> get user =>
      CopyWith$Query$get_customer_info$customer$user.stub(_res);
  saved_locations(_fn) => _res;
}

class Query$get_customer_info$customer$user {
  Query$get_customer_info$customer$user({
    required this.id,
    this.name,
    this.image,
    this.email,
    this.phone,
    required this.language_id,
    required this.$__typename,
  });

  factory Query$get_customer_info$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$image = json['image'];
    final l$email = json['email'];
    final l$phone = json['phone'];
    final l$language_id = json['language_id'];
    final l$$__typename = json['__typename'];
    return Query$get_customer_info$customer$user(
      id: (l$id as int),
      name: (l$name as String?),
      image: (l$image as String?),
      email: (l$email as String?),
      phone: (l$phone as String?),
      language_id: (l$language_id as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? name;

  final String? image;

  final String? email;

  final String? phone;

  final String language_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$phone = phone;
    _resultData['phone'] = l$phone;
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$image = image;
    final l$email = email;
    final l$phone = phone;
    final l$language_id = language_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$image,
      l$email,
      l$phone,
      l$language_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_customer_info$customer$user) ||
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
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (l$phone != lOther$phone) {
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

extension UtilityExtension$Query$get_customer_info$customer$user
    on Query$get_customer_info$customer$user {
  CopyWith$Query$get_customer_info$customer$user<
          Query$get_customer_info$customer$user>
      get copyWith => CopyWith$Query$get_customer_info$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_customer_info$customer$user<TRes> {
  factory CopyWith$Query$get_customer_info$customer$user(
    Query$get_customer_info$customer$user instance,
    TRes Function(Query$get_customer_info$customer$user) then,
  ) = _CopyWithImpl$Query$get_customer_info$customer$user;

  factory CopyWith$Query$get_customer_info$customer$user.stub(TRes res) =
      _CopyWithStubImpl$Query$get_customer_info$customer$user;

  TRes call({
    int? id,
    String? name,
    String? image,
    String? email,
    String? phone,
    String? language_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_customer_info$customer$user<TRes>
    implements CopyWith$Query$get_customer_info$customer$user<TRes> {
  _CopyWithImpl$Query$get_customer_info$customer$user(
    this._instance,
    this._then,
  );

  final Query$get_customer_info$customer$user _instance;

  final TRes Function(Query$get_customer_info$customer$user) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? image = _undefined,
    Object? email = _undefined,
    Object? phone = _undefined,
    Object? language_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_customer_info$customer$user(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        email: email == _undefined ? _instance.email : (email as String?),
        phone: phone == _undefined ? _instance.phone : (phone as String?),
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_customer_info$customer$user<TRes>
    implements CopyWith$Query$get_customer_info$customer$user<TRes> {
  _CopyWithStubImpl$Query$get_customer_info$customer$user(this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    String? image,
    String? email,
    String? phone,
    String? language_id,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_customer_info$customer$saved_locations {
  Query$get_customer_info$customer$saved_locations({
    required this.id,
    required this.name,
    required this.location_gps,
    required this.location_text,
    required this.$default,
    required this.$__typename,
  });

  factory Query$get_customer_info$customer$saved_locations.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$location_gps = json['location_gps'];
    final l$location_text = json['location_text'];
    final l$$default = json['default'];
    final l$$__typename = json['__typename'];
    return Query$get_customer_info$customer$saved_locations(
      id: (l$id as int),
      name: (l$name as String),
      location_gps: geographyFromJson(l$location_gps),
      location_text: (l$location_text as String),
      $default: (l$$default as bool),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String name;

  final Geography location_gps;

  final String location_text;

  final bool $default;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$location_gps = location_gps;
    _resultData['location_gps'] = geographyToJson(l$location_gps);
    final l$location_text = location_text;
    _resultData['location_text'] = l$location_text;
    final l$$default = $default;
    _resultData['default'] = l$$default;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$location_gps = location_gps;
    final l$location_text = location_text;
    final l$$default = $default;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$location_gps,
      l$location_text,
      l$$default,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_customer_info$customer$saved_locations) ||
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
    final l$location_gps = location_gps;
    final lOther$location_gps = other.location_gps;
    if (l$location_gps != lOther$location_gps) {
      return false;
    }
    final l$location_text = location_text;
    final lOther$location_text = other.location_text;
    if (l$location_text != lOther$location_text) {
      return false;
    }
    final l$$default = $default;
    final lOther$$default = other.$default;
    if (l$$default != lOther$$default) {
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

extension UtilityExtension$Query$get_customer_info$customer$saved_locations
    on Query$get_customer_info$customer$saved_locations {
  CopyWith$Query$get_customer_info$customer$saved_locations<
          Query$get_customer_info$customer$saved_locations>
      get copyWith => CopyWith$Query$get_customer_info$customer$saved_locations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_customer_info$customer$saved_locations<TRes> {
  factory CopyWith$Query$get_customer_info$customer$saved_locations(
    Query$get_customer_info$customer$saved_locations instance,
    TRes Function(Query$get_customer_info$customer$saved_locations) then,
  ) = _CopyWithImpl$Query$get_customer_info$customer$saved_locations;

  factory CopyWith$Query$get_customer_info$customer$saved_locations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_customer_info$customer$saved_locations;

  TRes call({
    int? id,
    String? name,
    Geography? location_gps,
    String? location_text,
    bool? $default,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_customer_info$customer$saved_locations<TRes>
    implements CopyWith$Query$get_customer_info$customer$saved_locations<TRes> {
  _CopyWithImpl$Query$get_customer_info$customer$saved_locations(
    this._instance,
    this._then,
  );

  final Query$get_customer_info$customer$saved_locations _instance;

  final TRes Function(Query$get_customer_info$customer$saved_locations) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? location_gps = _undefined,
    Object? location_text = _undefined,
    Object? $default = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_customer_info$customer$saved_locations(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        location_gps: location_gps == _undefined || location_gps == null
            ? _instance.location_gps
            : (location_gps as Geography),
        location_text: location_text == _undefined || location_text == null
            ? _instance.location_text
            : (location_text as String),
        $default: $default == _undefined || $default == null
            ? _instance.$default
            : ($default as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_customer_info$customer$saved_locations<TRes>
    implements CopyWith$Query$get_customer_info$customer$saved_locations<TRes> {
  _CopyWithStubImpl$Query$get_customer_info$customer$saved_locations(this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    Geography? location_gps,
    String? location_text,
    bool? $default,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$get_customer_orders {
  factory Variables$Query$get_customer_orders({required int customer_id}) =>
      Variables$Query$get_customer_orders._({
        r'customer_id': customer_id,
      });

  Variables$Query$get_customer_orders._(this._$data);

  factory Variables$Query$get_customer_orders.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$customer_id = data['customer_id'];
    result$data['customer_id'] = (l$customer_id as int);
    return Variables$Query$get_customer_orders._(result$data);
  }

  Map<String, dynamic> _$data;

  int get customer_id => (_$data['customer_id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$customer_id = customer_id;
    result$data['customer_id'] = l$customer_id;
    return result$data;
  }

  CopyWith$Variables$Query$get_customer_orders<
          Variables$Query$get_customer_orders>
      get copyWith => CopyWith$Variables$Query$get_customer_orders(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_customer_orders) ||
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

abstract class CopyWith$Variables$Query$get_customer_orders<TRes> {
  factory CopyWith$Variables$Query$get_customer_orders(
    Variables$Query$get_customer_orders instance,
    TRes Function(Variables$Query$get_customer_orders) then,
  ) = _CopyWithImpl$Variables$Query$get_customer_orders;

  factory CopyWith$Variables$Query$get_customer_orders.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$get_customer_orders;

  TRes call({int? customer_id});
}

class _CopyWithImpl$Variables$Query$get_customer_orders<TRes>
    implements CopyWith$Variables$Query$get_customer_orders<TRes> {
  _CopyWithImpl$Variables$Query$get_customer_orders(
    this._instance,
    this._then,
  );

  final Variables$Query$get_customer_orders _instance;

  final TRes Function(Variables$Query$get_customer_orders) _then;

  static const _undefined = {};

  TRes call({Object? customer_id = _undefined}) =>
      _then(Variables$Query$get_customer_orders._({
        ..._instance._$data,
        if (customer_id != _undefined && customer_id != null)
          'customer_id': (customer_id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_customer_orders<TRes>
    implements CopyWith$Variables$Query$get_customer_orders<TRes> {
  _CopyWithStubImpl$Variables$Query$get_customer_orders(this._res);

  TRes _res;

  call({int? customer_id}) => _res;
}

class Query$get_customer_orders {
  Query$get_customer_orders({
    required this.restaurant_order,
    required this.$__typename,
  });

  factory Query$get_customer_orders.fromJson(Map<String, dynamic> json) {
    final l$restaurant_order = json['restaurant_order'];
    final l$$__typename = json['__typename'];
    return Query$get_customer_orders(
      restaurant_order: (l$restaurant_order as List<dynamic>)
          .map((e) => Query$get_customer_orders$restaurant_order.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$get_customer_orders$restaurant_order> restaurant_order;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_order = restaurant_order;
    _resultData['restaurant_order'] =
        l$restaurant_order.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_order = restaurant_order;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$restaurant_order.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_customer_orders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_order = restaurant_order;
    final lOther$restaurant_order = other.restaurant_order;
    if (l$restaurant_order.length != lOther$restaurant_order.length) {
      return false;
    }
    for (int i = 0; i < l$restaurant_order.length; i++) {
      final l$restaurant_order$entry = l$restaurant_order[i];
      final lOther$restaurant_order$entry = lOther$restaurant_order[i];
      if (l$restaurant_order$entry != lOther$restaurant_order$entry) {
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

extension UtilityExtension$Query$get_customer_orders
    on Query$get_customer_orders {
  CopyWith$Query$get_customer_orders<Query$get_customer_orders> get copyWith =>
      CopyWith$Query$get_customer_orders(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$get_customer_orders<TRes> {
  factory CopyWith$Query$get_customer_orders(
    Query$get_customer_orders instance,
    TRes Function(Query$get_customer_orders) then,
  ) = _CopyWithImpl$Query$get_customer_orders;

  factory CopyWith$Query$get_customer_orders.stub(TRes res) =
      _CopyWithStubImpl$Query$get_customer_orders;

  TRes call({
    List<Query$get_customer_orders$restaurant_order>? restaurant_order,
    String? $__typename,
  });
  TRes restaurant_order(
      Iterable<Query$get_customer_orders$restaurant_order> Function(
              Iterable<
                  CopyWith$Query$get_customer_orders$restaurant_order<
                      Query$get_customer_orders$restaurant_order>>)
          _fn);
}

class _CopyWithImpl$Query$get_customer_orders<TRes>
    implements CopyWith$Query$get_customer_orders<TRes> {
  _CopyWithImpl$Query$get_customer_orders(
    this._instance,
    this._then,
  );

  final Query$get_customer_orders _instance;

  final TRes Function(Query$get_customer_orders) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_order = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_customer_orders(
        restaurant_order:
            restaurant_order == _undefined || restaurant_order == null
                ? _instance.restaurant_order
                : (restaurant_order
                    as List<Query$get_customer_orders$restaurant_order>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes restaurant_order(
          Iterable<Query$get_customer_orders$restaurant_order> Function(
                  Iterable<
                      CopyWith$Query$get_customer_orders$restaurant_order<
                          Query$get_customer_orders$restaurant_order>>)
              _fn) =>
      call(
          restaurant_order: _fn(_instance.restaurant_order
              .map((e) => CopyWith$Query$get_customer_orders$restaurant_order(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$get_customer_orders<TRes>
    implements CopyWith$Query$get_customer_orders<TRes> {
  _CopyWithStubImpl$Query$get_customer_orders(this._res);

  TRes _res;

  call({
    List<Query$get_customer_orders$restaurant_order>? restaurant_order,
    String? $__typename,
  }) =>
      _res;
  restaurant_order(_fn) => _res;
}

const documentNodeQueryget_customer_orders = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_customer_orders'),
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
        name: NameNode(value: 'restaurant_order'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'customer_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'customer_id')),
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
                name: NameNode(value: 'firebase_id'),
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
                name: NameNode(value: 'language_id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'location_gps'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'location_text'),
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
            name: NameNode(value: 'items'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'restaurant_item'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'item_type'),
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
                    name: NameNode(value: 'position'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'category_id'),
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
                    name: NameNode(value: 'restaurant_id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'special_period_end'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'special_period_start'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'archived'),
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
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
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
                name: NameNode(value: 'notes'),
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
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'payment_type'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'to_location_gps'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'to_location_address'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'estimated_food_ready_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'actual_food_ready_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'stripe_payment_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'refund_amount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'delivery_id'),
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
            name: NameNode(value: 'review_id'),
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
            name: NameNode(value: 'order_time'),
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
            name: NameNode(value: 'customer_app_type'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'notes'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'tax'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'chat_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'delivery_cost'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'delivery'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'actual_delivered_time'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'actual_package_ready_time'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'actual_arrival_at_pickup_time'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'actual_arrival_at_dropoff_time'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'cancellation_time'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'current_gps'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'deliverer_id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'delivery_cost'),
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
Query$get_customer_orders _parserFn$Query$get_customer_orders(
        Map<String, dynamic> data) =>
    Query$get_customer_orders.fromJson(data);

class Options$Query$get_customer_orders
    extends graphql.QueryOptions<Query$get_customer_orders> {
  Options$Query$get_customer_orders({
    String? operationName,
    required Variables$Query$get_customer_orders variables,
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
          document: documentNodeQueryget_customer_orders,
          parserFn: _parserFn$Query$get_customer_orders,
        );
}

class WatchOptions$Query$get_customer_orders
    extends graphql.WatchQueryOptions<Query$get_customer_orders> {
  WatchOptions$Query$get_customer_orders({
    String? operationName,
    required Variables$Query$get_customer_orders variables,
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
          document: documentNodeQueryget_customer_orders,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_customer_orders,
        );
}

class FetchMoreOptions$Query$get_customer_orders
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_customer_orders({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_customer_orders variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_customer_orders,
        );
}

extension ClientExtension$Query$get_customer_orders on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_customer_orders>>
      query$get_customer_orders(
              Options$Query$get_customer_orders options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$get_customer_orders>
      watchQuery$get_customer_orders(
              WatchOptions$Query$get_customer_orders options) =>
          this.watchQuery(options);
  void writeQuery$get_customer_orders({
    required Query$get_customer_orders data,
    required Variables$Query$get_customer_orders variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryget_customer_orders),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_customer_orders? readQuery$get_customer_orders({
    required Variables$Query$get_customer_orders variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryget_customer_orders),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$get_customer_orders.fromJson(result);
  }
}

class Query$get_customer_orders$restaurant_order {
  Query$get_customer_orders$restaurant_order({
    required this.id,
    required this.restaurant,
    required this.items,
    required this.payment_type,
    this.to_location_gps,
    this.to_location_address,
    this.estimated_food_ready_time,
    this.actual_food_ready_time,
    this.stripe_payment_id,
    required this.refund_amount,
    this.delivery_id,
    required this.status,
    this.review_id,
    required this.order_type,
    required this.order_time,
    this.firebase_id,
    required this.customer_app_type,
    this.notes,
    required this.tax,
    required this.chat_id,
    required this.delivery_cost,
    this.delivery,
    required this.$__typename,
  });

  factory Query$get_customer_orders$restaurant_order.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$restaurant = json['restaurant'];
    final l$items = json['items'];
    final l$payment_type = json['payment_type'];
    final l$to_location_gps = json['to_location_gps'];
    final l$to_location_address = json['to_location_address'];
    final l$estimated_food_ready_time = json['estimated_food_ready_time'];
    final l$actual_food_ready_time = json['actual_food_ready_time'];
    final l$stripe_payment_id = json['stripe_payment_id'];
    final l$refund_amount = json['refund_amount'];
    final l$delivery_id = json['delivery_id'];
    final l$status = json['status'];
    final l$review_id = json['review_id'];
    final l$order_type = json['order_type'];
    final l$order_time = json['order_time'];
    final l$firebase_id = json['firebase_id'];
    final l$customer_app_type = json['customer_app_type'];
    final l$notes = json['notes'];
    final l$tax = json['tax'];
    final l$chat_id = json['chat_id'];
    final l$delivery_cost = json['delivery_cost'];
    final l$delivery = json['delivery'];
    final l$$__typename = json['__typename'];
    return Query$get_customer_orders$restaurant_order(
      id: (l$id as int),
      restaurant:
          Query$get_customer_orders$restaurant_order$restaurant.fromJson(
              (l$restaurant as Map<String, dynamic>)),
      items: (l$items as List<dynamic>)
          .map((e) => Query$get_customer_orders$restaurant_order$items.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      payment_type: (l$payment_type as String),
      to_location_gps: l$to_location_gps == null
          ? null
          : geographyFromJson(l$to_location_gps),
      to_location_address: (l$to_location_address as String?),
      estimated_food_ready_time: (l$estimated_food_ready_time as String?),
      actual_food_ready_time: (l$actual_food_ready_time as String?),
      stripe_payment_id: (l$stripe_payment_id as int?),
      refund_amount: (l$refund_amount as int),
      delivery_id: (l$delivery_id as int?),
      status: (l$status as String),
      review_id: (l$review_id as int?),
      order_type: (l$order_type as String),
      order_time: (l$order_time as String),
      firebase_id: (l$firebase_id as String?),
      customer_app_type: (l$customer_app_type as String),
      notes: (l$notes as String?),
      tax: (l$tax as num),
      chat_id: (l$chat_id as int),
      delivery_cost: moneyFromJson(l$delivery_cost),
      delivery: l$delivery == null
          ? null
          : Query$get_customer_orders$restaurant_order$delivery.fromJson(
              (l$delivery as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$get_customer_orders$restaurant_order$restaurant restaurant;

  final List<Query$get_customer_orders$restaurant_order$items> items;

  final String payment_type;

  final Geography? to_location_gps;

  final String? to_location_address;

  final String? estimated_food_ready_time;

  final String? actual_food_ready_time;

  final int? stripe_payment_id;

  final int refund_amount;

  final int? delivery_id;

  final String status;

  final int? review_id;

  final String order_type;

  final String order_time;

  final String? firebase_id;

  final String customer_app_type;

  final String? notes;

  final num tax;

  final int chat_id;

  final double delivery_cost;

  final Query$get_customer_orders$restaurant_order$delivery? delivery;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant.toJson();
    final l$items = items;
    _resultData['items'] = l$items.map((e) => e.toJson()).toList();
    final l$payment_type = payment_type;
    _resultData['payment_type'] = l$payment_type;
    final l$to_location_gps = to_location_gps;
    _resultData['to_location_gps'] =
        l$to_location_gps == null ? null : geographyToJson(l$to_location_gps);
    final l$to_location_address = to_location_address;
    _resultData['to_location_address'] = l$to_location_address;
    final l$estimated_food_ready_time = estimated_food_ready_time;
    _resultData['estimated_food_ready_time'] = l$estimated_food_ready_time;
    final l$actual_food_ready_time = actual_food_ready_time;
    _resultData['actual_food_ready_time'] = l$actual_food_ready_time;
    final l$stripe_payment_id = stripe_payment_id;
    _resultData['stripe_payment_id'] = l$stripe_payment_id;
    final l$refund_amount = refund_amount;
    _resultData['refund_amount'] = l$refund_amount;
    final l$delivery_id = delivery_id;
    _resultData['delivery_id'] = l$delivery_id;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$review_id = review_id;
    _resultData['review_id'] = l$review_id;
    final l$order_type = order_type;
    _resultData['order_type'] = l$order_type;
    final l$order_time = order_time;
    _resultData['order_time'] = l$order_time;
    final l$firebase_id = firebase_id;
    _resultData['firebase_id'] = l$firebase_id;
    final l$customer_app_type = customer_app_type;
    _resultData['customer_app_type'] = l$customer_app_type;
    final l$notes = notes;
    _resultData['notes'] = l$notes;
    final l$tax = tax;
    _resultData['tax'] = l$tax;
    final l$chat_id = chat_id;
    _resultData['chat_id'] = l$chat_id;
    final l$delivery_cost = delivery_cost;
    _resultData['delivery_cost'] = moneyToJson(l$delivery_cost);
    final l$delivery = delivery;
    _resultData['delivery'] = l$delivery?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$restaurant = restaurant;
    final l$items = items;
    final l$payment_type = payment_type;
    final l$to_location_gps = to_location_gps;
    final l$to_location_address = to_location_address;
    final l$estimated_food_ready_time = estimated_food_ready_time;
    final l$actual_food_ready_time = actual_food_ready_time;
    final l$stripe_payment_id = stripe_payment_id;
    final l$refund_amount = refund_amount;
    final l$delivery_id = delivery_id;
    final l$status = status;
    final l$review_id = review_id;
    final l$order_type = order_type;
    final l$order_time = order_time;
    final l$firebase_id = firebase_id;
    final l$customer_app_type = customer_app_type;
    final l$notes = notes;
    final l$tax = tax;
    final l$chat_id = chat_id;
    final l$delivery_cost = delivery_cost;
    final l$delivery = delivery;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$restaurant,
      Object.hashAll(l$items.map((v) => v)),
      l$payment_type,
      l$to_location_gps,
      l$to_location_address,
      l$estimated_food_ready_time,
      l$actual_food_ready_time,
      l$stripe_payment_id,
      l$refund_amount,
      l$delivery_id,
      l$status,
      l$review_id,
      l$order_type,
      l$order_time,
      l$firebase_id,
      l$customer_app_type,
      l$notes,
      l$tax,
      l$chat_id,
      l$delivery_cost,
      l$delivery,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_customer_orders$restaurant_order) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (l$restaurant != lOther$restaurant) {
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
    final l$payment_type = payment_type;
    final lOther$payment_type = other.payment_type;
    if (l$payment_type != lOther$payment_type) {
      return false;
    }
    final l$to_location_gps = to_location_gps;
    final lOther$to_location_gps = other.to_location_gps;
    if (l$to_location_gps != lOther$to_location_gps) {
      return false;
    }
    final l$to_location_address = to_location_address;
    final lOther$to_location_address = other.to_location_address;
    if (l$to_location_address != lOther$to_location_address) {
      return false;
    }
    final l$estimated_food_ready_time = estimated_food_ready_time;
    final lOther$estimated_food_ready_time = other.estimated_food_ready_time;
    if (l$estimated_food_ready_time != lOther$estimated_food_ready_time) {
      return false;
    }
    final l$actual_food_ready_time = actual_food_ready_time;
    final lOther$actual_food_ready_time = other.actual_food_ready_time;
    if (l$actual_food_ready_time != lOther$actual_food_ready_time) {
      return false;
    }
    final l$stripe_payment_id = stripe_payment_id;
    final lOther$stripe_payment_id = other.stripe_payment_id;
    if (l$stripe_payment_id != lOther$stripe_payment_id) {
      return false;
    }
    final l$refund_amount = refund_amount;
    final lOther$refund_amount = other.refund_amount;
    if (l$refund_amount != lOther$refund_amount) {
      return false;
    }
    final l$delivery_id = delivery_id;
    final lOther$delivery_id = other.delivery_id;
    if (l$delivery_id != lOther$delivery_id) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$review_id = review_id;
    final lOther$review_id = other.review_id;
    if (l$review_id != lOther$review_id) {
      return false;
    }
    final l$order_type = order_type;
    final lOther$order_type = other.order_type;
    if (l$order_type != lOther$order_type) {
      return false;
    }
    final l$order_time = order_time;
    final lOther$order_time = other.order_time;
    if (l$order_time != lOther$order_time) {
      return false;
    }
    final l$firebase_id = firebase_id;
    final lOther$firebase_id = other.firebase_id;
    if (l$firebase_id != lOther$firebase_id) {
      return false;
    }
    final l$customer_app_type = customer_app_type;
    final lOther$customer_app_type = other.customer_app_type;
    if (l$customer_app_type != lOther$customer_app_type) {
      return false;
    }
    final l$notes = notes;
    final lOther$notes = other.notes;
    if (l$notes != lOther$notes) {
      return false;
    }
    final l$tax = tax;
    final lOther$tax = other.tax;
    if (l$tax != lOther$tax) {
      return false;
    }
    final l$chat_id = chat_id;
    final lOther$chat_id = other.chat_id;
    if (l$chat_id != lOther$chat_id) {
      return false;
    }
    final l$delivery_cost = delivery_cost;
    final lOther$delivery_cost = other.delivery_cost;
    if (l$delivery_cost != lOther$delivery_cost) {
      return false;
    }
    final l$delivery = delivery;
    final lOther$delivery = other.delivery;
    if (l$delivery != lOther$delivery) {
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

extension UtilityExtension$Query$get_customer_orders$restaurant_order
    on Query$get_customer_orders$restaurant_order {
  CopyWith$Query$get_customer_orders$restaurant_order<
          Query$get_customer_orders$restaurant_order>
      get copyWith => CopyWith$Query$get_customer_orders$restaurant_order(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_customer_orders$restaurant_order<TRes> {
  factory CopyWith$Query$get_customer_orders$restaurant_order(
    Query$get_customer_orders$restaurant_order instance,
    TRes Function(Query$get_customer_orders$restaurant_order) then,
  ) = _CopyWithImpl$Query$get_customer_orders$restaurant_order;

  factory CopyWith$Query$get_customer_orders$restaurant_order.stub(TRes res) =
      _CopyWithStubImpl$Query$get_customer_orders$restaurant_order;

  TRes call({
    int? id,
    Query$get_customer_orders$restaurant_order$restaurant? restaurant,
    List<Query$get_customer_orders$restaurant_order$items>? items,
    String? payment_type,
    Geography? to_location_gps,
    String? to_location_address,
    String? estimated_food_ready_time,
    String? actual_food_ready_time,
    int? stripe_payment_id,
    int? refund_amount,
    int? delivery_id,
    String? status,
    int? review_id,
    String? order_type,
    String? order_time,
    String? firebase_id,
    String? customer_app_type,
    String? notes,
    num? tax,
    int? chat_id,
    double? delivery_cost,
    Query$get_customer_orders$restaurant_order$delivery? delivery,
    String? $__typename,
  });
  CopyWith$Query$get_customer_orders$restaurant_order$restaurant<TRes>
      get restaurant;
  TRes items(
      Iterable<Query$get_customer_orders$restaurant_order$items> Function(
              Iterable<
                  CopyWith$Query$get_customer_orders$restaurant_order$items<
                      Query$get_customer_orders$restaurant_order$items>>)
          _fn);
  CopyWith$Query$get_customer_orders$restaurant_order$delivery<TRes>
      get delivery;
}

class _CopyWithImpl$Query$get_customer_orders$restaurant_order<TRes>
    implements CopyWith$Query$get_customer_orders$restaurant_order<TRes> {
  _CopyWithImpl$Query$get_customer_orders$restaurant_order(
    this._instance,
    this._then,
  );

  final Query$get_customer_orders$restaurant_order _instance;

  final TRes Function(Query$get_customer_orders$restaurant_order) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? restaurant = _undefined,
    Object? items = _undefined,
    Object? payment_type = _undefined,
    Object? to_location_gps = _undefined,
    Object? to_location_address = _undefined,
    Object? estimated_food_ready_time = _undefined,
    Object? actual_food_ready_time = _undefined,
    Object? stripe_payment_id = _undefined,
    Object? refund_amount = _undefined,
    Object? delivery_id = _undefined,
    Object? status = _undefined,
    Object? review_id = _undefined,
    Object? order_type = _undefined,
    Object? order_time = _undefined,
    Object? firebase_id = _undefined,
    Object? customer_app_type = _undefined,
    Object? notes = _undefined,
    Object? tax = _undefined,
    Object? chat_id = _undefined,
    Object? delivery_cost = _undefined,
    Object? delivery = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_customer_orders$restaurant_order(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        restaurant: restaurant == _undefined || restaurant == null
            ? _instance.restaurant
            : (restaurant
                as Query$get_customer_orders$restaurant_order$restaurant),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Query$get_customer_orders$restaurant_order$items>),
        payment_type: payment_type == _undefined || payment_type == null
            ? _instance.payment_type
            : (payment_type as String),
        to_location_gps: to_location_gps == _undefined
            ? _instance.to_location_gps
            : (to_location_gps as Geography?),
        to_location_address: to_location_address == _undefined
            ? _instance.to_location_address
            : (to_location_address as String?),
        estimated_food_ready_time: estimated_food_ready_time == _undefined
            ? _instance.estimated_food_ready_time
            : (estimated_food_ready_time as String?),
        actual_food_ready_time: actual_food_ready_time == _undefined
            ? _instance.actual_food_ready_time
            : (actual_food_ready_time as String?),
        stripe_payment_id: stripe_payment_id == _undefined
            ? _instance.stripe_payment_id
            : (stripe_payment_id as int?),
        refund_amount: refund_amount == _undefined || refund_amount == null
            ? _instance.refund_amount
            : (refund_amount as int),
        delivery_id: delivery_id == _undefined
            ? _instance.delivery_id
            : (delivery_id as int?),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        review_id:
            review_id == _undefined ? _instance.review_id : (review_id as int?),
        order_type: order_type == _undefined || order_type == null
            ? _instance.order_type
            : (order_type as String),
        order_time: order_time == _undefined || order_time == null
            ? _instance.order_time
            : (order_time as String),
        firebase_id: firebase_id == _undefined
            ? _instance.firebase_id
            : (firebase_id as String?),
        customer_app_type:
            customer_app_type == _undefined || customer_app_type == null
                ? _instance.customer_app_type
                : (customer_app_type as String),
        notes: notes == _undefined ? _instance.notes : (notes as String?),
        tax: tax == _undefined || tax == null ? _instance.tax : (tax as num),
        chat_id: chat_id == _undefined || chat_id == null
            ? _instance.chat_id
            : (chat_id as int),
        delivery_cost: delivery_cost == _undefined || delivery_cost == null
            ? _instance.delivery_cost
            : (delivery_cost as double),
        delivery: delivery == _undefined
            ? _instance.delivery
            : (delivery
                as Query$get_customer_orders$restaurant_order$delivery?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_customer_orders$restaurant_order$restaurant<TRes>
      get restaurant {
    final local$restaurant = _instance.restaurant;
    return CopyWith$Query$get_customer_orders$restaurant_order$restaurant(
        local$restaurant, (e) => call(restaurant: e));
  }

  TRes items(
          Iterable<Query$get_customer_orders$restaurant_order$items> Function(
                  Iterable<
                      CopyWith$Query$get_customer_orders$restaurant_order$items<
                          Query$get_customer_orders$restaurant_order$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map(
              (e) => CopyWith$Query$get_customer_orders$restaurant_order$items(
                    e,
                    (i) => i,
                  ))).toList());
  CopyWith$Query$get_customer_orders$restaurant_order$delivery<TRes>
      get delivery {
    final local$delivery = _instance.delivery;
    return local$delivery == null
        ? CopyWith$Query$get_customer_orders$restaurant_order$delivery.stub(
            _then(_instance))
        : CopyWith$Query$get_customer_orders$restaurant_order$delivery(
            local$delivery, (e) => call(delivery: e));
  }
}

class _CopyWithStubImpl$Query$get_customer_orders$restaurant_order<TRes>
    implements CopyWith$Query$get_customer_orders$restaurant_order<TRes> {
  _CopyWithStubImpl$Query$get_customer_orders$restaurant_order(this._res);

  TRes _res;

  call({
    int? id,
    Query$get_customer_orders$restaurant_order$restaurant? restaurant,
    List<Query$get_customer_orders$restaurant_order$items>? items,
    String? payment_type,
    Geography? to_location_gps,
    String? to_location_address,
    String? estimated_food_ready_time,
    String? actual_food_ready_time,
    int? stripe_payment_id,
    int? refund_amount,
    int? delivery_id,
    String? status,
    int? review_id,
    String? order_type,
    String? order_time,
    String? firebase_id,
    String? customer_app_type,
    String? notes,
    num? tax,
    int? chat_id,
    double? delivery_cost,
    Query$get_customer_orders$restaurant_order$delivery? delivery,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_customer_orders$restaurant_order$restaurant<TRes>
      get restaurant =>
          CopyWith$Query$get_customer_orders$restaurant_order$restaurant.stub(
              _res);
  items(_fn) => _res;
  CopyWith$Query$get_customer_orders$restaurant_order$delivery<TRes>
      get delivery =>
          CopyWith$Query$get_customer_orders$restaurant_order$delivery.stub(
              _res);
}

class Query$get_customer_orders$restaurant_order$restaurant {
  Query$get_customer_orders$restaurant_order$restaurant({
    required this.id,
    this.firebase_id,
    required this.image,
    required this.language_id,
    required this.location_gps,
    required this.location_text,
    required this.name,
    required this.$__typename,
  });

  factory Query$get_customer_orders$restaurant_order$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$firebase_id = json['firebase_id'];
    final l$image = json['image'];
    final l$language_id = json['language_id'];
    final l$location_gps = json['location_gps'];
    final l$location_text = json['location_text'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$get_customer_orders$restaurant_order$restaurant(
      id: (l$id as int),
      firebase_id: (l$firebase_id as String?),
      image: (l$image as String),
      language_id: (l$language_id as String),
      location_gps: geographyFromJson(l$location_gps),
      location_text: (l$location_text as String),
      name: (l$name as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? firebase_id;

  final String image;

  final String language_id;

  final Geography location_gps;

  final String location_text;

  final String name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$firebase_id = firebase_id;
    _resultData['firebase_id'] = l$firebase_id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
    final l$location_gps = location_gps;
    _resultData['location_gps'] = geographyToJson(l$location_gps);
    final l$location_text = location_text;
    _resultData['location_text'] = l$location_text;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$firebase_id = firebase_id;
    final l$image = image;
    final l$language_id = language_id;
    final l$location_gps = location_gps;
    final l$location_text = location_text;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$firebase_id,
      l$image,
      l$language_id,
      l$location_gps,
      l$location_text,
      l$name,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_customer_orders$restaurant_order$restaurant) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$firebase_id = firebase_id;
    final lOther$firebase_id = other.firebase_id;
    if (l$firebase_id != lOther$firebase_id) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$language_id = language_id;
    final lOther$language_id = other.language_id;
    if (l$language_id != lOther$language_id) {
      return false;
    }
    final l$location_gps = location_gps;
    final lOther$location_gps = other.location_gps;
    if (l$location_gps != lOther$location_gps) {
      return false;
    }
    final l$location_text = location_text;
    final lOther$location_text = other.location_text;
    if (l$location_text != lOther$location_text) {
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

extension UtilityExtension$Query$get_customer_orders$restaurant_order$restaurant
    on Query$get_customer_orders$restaurant_order$restaurant {
  CopyWith$Query$get_customer_orders$restaurant_order$restaurant<
          Query$get_customer_orders$restaurant_order$restaurant>
      get copyWith =>
          CopyWith$Query$get_customer_orders$restaurant_order$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_customer_orders$restaurant_order$restaurant<
    TRes> {
  factory CopyWith$Query$get_customer_orders$restaurant_order$restaurant(
    Query$get_customer_orders$restaurant_order$restaurant instance,
    TRes Function(Query$get_customer_orders$restaurant_order$restaurant) then,
  ) = _CopyWithImpl$Query$get_customer_orders$restaurant_order$restaurant;

  factory CopyWith$Query$get_customer_orders$restaurant_order$restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_customer_orders$restaurant_order$restaurant;

  TRes call({
    int? id,
    String? firebase_id,
    String? image,
    String? language_id,
    Geography? location_gps,
    String? location_text,
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_customer_orders$restaurant_order$restaurant<TRes>
    implements
        CopyWith$Query$get_customer_orders$restaurant_order$restaurant<TRes> {
  _CopyWithImpl$Query$get_customer_orders$restaurant_order$restaurant(
    this._instance,
    this._then,
  );

  final Query$get_customer_orders$restaurant_order$restaurant _instance;

  final TRes Function(Query$get_customer_orders$restaurant_order$restaurant)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? firebase_id = _undefined,
    Object? image = _undefined,
    Object? language_id = _undefined,
    Object? location_gps = _undefined,
    Object? location_text = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_customer_orders$restaurant_order$restaurant(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        firebase_id: firebase_id == _undefined
            ? _instance.firebase_id
            : (firebase_id as String?),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        location_gps: location_gps == _undefined || location_gps == null
            ? _instance.location_gps
            : (location_gps as Geography),
        location_text: location_text == _undefined || location_text == null
            ? _instance.location_text
            : (location_text as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_customer_orders$restaurant_order$restaurant<
        TRes>
    implements
        CopyWith$Query$get_customer_orders$restaurant_order$restaurant<TRes> {
  _CopyWithStubImpl$Query$get_customer_orders$restaurant_order$restaurant(
      this._res);

  TRes _res;

  call({
    int? id,
    String? firebase_id,
    String? image,
    String? language_id,
    Geography? location_gps,
    String? location_text,
    String? name,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_customer_orders$restaurant_order$items {
  Query$get_customer_orders$restaurant_order$items({
    required this.restaurant_item,
    required this.cost_per_one,
    required this.id,
    this.notes,
    required this.quantity,
    required this.$__typename,
  });

  factory Query$get_customer_orders$restaurant_order$items.fromJson(
      Map<String, dynamic> json) {
    final l$restaurant_item = json['restaurant_item'];
    final l$cost_per_one = json['cost_per_one'];
    final l$id = json['id'];
    final l$notes = json['notes'];
    final l$quantity = json['quantity'];
    final l$$__typename = json['__typename'];
    return Query$get_customer_orders$restaurant_order$items(
      restaurant_item:
          Query$get_customer_orders$restaurant_order$items$restaurant_item
              .fromJson((l$restaurant_item as Map<String, dynamic>)),
      cost_per_one: moneyFromJson(l$cost_per_one),
      id: (l$id as int),
      notes: (l$notes as String?),
      quantity: (l$quantity as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_customer_orders$restaurant_order$items$restaurant_item
      restaurant_item;

  final double cost_per_one;

  final int id;

  final String? notes;

  final int quantity;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_item = restaurant_item;
    _resultData['restaurant_item'] = l$restaurant_item.toJson();
    final l$cost_per_one = cost_per_one;
    _resultData['cost_per_one'] = moneyToJson(l$cost_per_one);
    final l$id = id;
    _resultData['id'] = l$id;
    final l$notes = notes;
    _resultData['notes'] = l$notes;
    final l$quantity = quantity;
    _resultData['quantity'] = l$quantity;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_item = restaurant_item;
    final l$cost_per_one = cost_per_one;
    final l$id = id;
    final l$notes = notes;
    final l$quantity = quantity;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$restaurant_item,
      l$cost_per_one,
      l$id,
      l$notes,
      l$quantity,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_customer_orders$restaurant_order$items) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_item = restaurant_item;
    final lOther$restaurant_item = other.restaurant_item;
    if (l$restaurant_item != lOther$restaurant_item) {
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
    final l$notes = notes;
    final lOther$notes = other.notes;
    if (l$notes != lOther$notes) {
      return false;
    }
    final l$quantity = quantity;
    final lOther$quantity = other.quantity;
    if (l$quantity != lOther$quantity) {
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

extension UtilityExtension$Query$get_customer_orders$restaurant_order$items
    on Query$get_customer_orders$restaurant_order$items {
  CopyWith$Query$get_customer_orders$restaurant_order$items<
          Query$get_customer_orders$restaurant_order$items>
      get copyWith => CopyWith$Query$get_customer_orders$restaurant_order$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_customer_orders$restaurant_order$items<TRes> {
  factory CopyWith$Query$get_customer_orders$restaurant_order$items(
    Query$get_customer_orders$restaurant_order$items instance,
    TRes Function(Query$get_customer_orders$restaurant_order$items) then,
  ) = _CopyWithImpl$Query$get_customer_orders$restaurant_order$items;

  factory CopyWith$Query$get_customer_orders$restaurant_order$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_customer_orders$restaurant_order$items;

  TRes call({
    Query$get_customer_orders$restaurant_order$items$restaurant_item?
        restaurant_item,
    double? cost_per_one,
    int? id,
    String? notes,
    int? quantity,
    String? $__typename,
  });
  CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item<
      TRes> get restaurant_item;
}

class _CopyWithImpl$Query$get_customer_orders$restaurant_order$items<TRes>
    implements CopyWith$Query$get_customer_orders$restaurant_order$items<TRes> {
  _CopyWithImpl$Query$get_customer_orders$restaurant_order$items(
    this._instance,
    this._then,
  );

  final Query$get_customer_orders$restaurant_order$items _instance;

  final TRes Function(Query$get_customer_orders$restaurant_order$items) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_item = _undefined,
    Object? cost_per_one = _undefined,
    Object? id = _undefined,
    Object? notes = _undefined,
    Object? quantity = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_customer_orders$restaurant_order$items(
        restaurant_item: restaurant_item == _undefined ||
                restaurant_item == null
            ? _instance.restaurant_item
            : (restaurant_item
                as Query$get_customer_orders$restaurant_order$items$restaurant_item),
        cost_per_one: cost_per_one == _undefined || cost_per_one == null
            ? _instance.cost_per_one
            : (cost_per_one as double),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        notes: notes == _undefined ? _instance.notes : (notes as String?),
        quantity: quantity == _undefined || quantity == null
            ? _instance.quantity
            : (quantity as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item<
      TRes> get restaurant_item {
    final local$restaurant_item = _instance.restaurant_item;
    return CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item(
        local$restaurant_item, (e) => call(restaurant_item: e));
  }
}

class _CopyWithStubImpl$Query$get_customer_orders$restaurant_order$items<TRes>
    implements CopyWith$Query$get_customer_orders$restaurant_order$items<TRes> {
  _CopyWithStubImpl$Query$get_customer_orders$restaurant_order$items(this._res);

  TRes _res;

  call({
    Query$get_customer_orders$restaurant_order$items$restaurant_item?
        restaurant_item,
    double? cost_per_one,
    int? id,
    String? notes,
    int? quantity,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item<
          TRes>
      get restaurant_item =>
          CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item
              .stub(_res);
}

class Query$get_customer_orders$restaurant_order$items$restaurant_item {
  Query$get_customer_orders$restaurant_order$items$restaurant_item({
    required this.item_type,
    required this.name,
    this.description,
    required this.position,
    this.category_id,
    required this.available,
    required this.restaurant_id,
    this.special_period_end,
    this.special_period_start,
    required this.archived,
    required this.cost,
    required this.$__typename,
  });

  factory Query$get_customer_orders$restaurant_order$items$restaurant_item.fromJson(
      Map<String, dynamic> json) {
    final l$item_type = json['item_type'];
    final l$name = json['name'];
    final l$description = json['description'];
    final l$position = json['position'];
    final l$category_id = json['category_id'];
    final l$available = json['available'];
    final l$restaurant_id = json['restaurant_id'];
    final l$special_period_end = json['special_period_end'];
    final l$special_period_start = json['special_period_start'];
    final l$archived = json['archived'];
    final l$cost = json['cost'];
    final l$$__typename = json['__typename'];
    return Query$get_customer_orders$restaurant_order$items$restaurant_item(
      item_type: (l$item_type as String),
      name:
          Query$get_customer_orders$restaurant_order$items$restaurant_item$name
              .fromJson((l$name as Map<String, dynamic>)),
      description: l$description == null
          ? null
          : Query$get_customer_orders$restaurant_order$items$restaurant_item$description
              .fromJson((l$description as Map<String, dynamic>)),
      position: (l$position as int),
      category_id: (l$category_id as int?),
      available: (l$available as bool),
      restaurant_id: (l$restaurant_id as int),
      special_period_end: (l$special_period_end as String?),
      special_period_start: (l$special_period_start as String?),
      archived: (l$archived as bool),
      cost: moneyFromJson(l$cost),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String item_type;

  final Query$get_customer_orders$restaurant_order$items$restaurant_item$name
      name;

  final Query$get_customer_orders$restaurant_order$items$restaurant_item$description?
      description;

  final int position;

  final int? category_id;

  final bool available;

  final int restaurant_id;

  final String? special_period_end;

  final String? special_period_start;

  final bool archived;

  final double cost;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$item_type = item_type;
    _resultData['item_type'] = l$item_type;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
    final l$position = position;
    _resultData['position'] = l$position;
    final l$category_id = category_id;
    _resultData['category_id'] = l$category_id;
    final l$available = available;
    _resultData['available'] = l$available;
    final l$restaurant_id = restaurant_id;
    _resultData['restaurant_id'] = l$restaurant_id;
    final l$special_period_end = special_period_end;
    _resultData['special_period_end'] = l$special_period_end;
    final l$special_period_start = special_period_start;
    _resultData['special_period_start'] = l$special_period_start;
    final l$archived = archived;
    _resultData['archived'] = l$archived;
    final l$cost = cost;
    _resultData['cost'] = moneyToJson(l$cost);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$item_type = item_type;
    final l$name = name;
    final l$description = description;
    final l$position = position;
    final l$category_id = category_id;
    final l$available = available;
    final l$restaurant_id = restaurant_id;
    final l$special_period_end = special_period_end;
    final l$special_period_start = special_period_start;
    final l$archived = archived;
    final l$cost = cost;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$item_type,
      l$name,
      l$description,
      l$position,
      l$category_id,
      l$available,
      l$restaurant_id,
      l$special_period_end,
      l$special_period_start,
      l$archived,
      l$cost,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$get_customer_orders$restaurant_order$items$restaurant_item) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$item_type = item_type;
    final lOther$item_type = other.item_type;
    if (l$item_type != lOther$item_type) {
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
    final l$position = position;
    final lOther$position = other.position;
    if (l$position != lOther$position) {
      return false;
    }
    final l$category_id = category_id;
    final lOther$category_id = other.category_id;
    if (l$category_id != lOther$category_id) {
      return false;
    }
    final l$available = available;
    final lOther$available = other.available;
    if (l$available != lOther$available) {
      return false;
    }
    final l$restaurant_id = restaurant_id;
    final lOther$restaurant_id = other.restaurant_id;
    if (l$restaurant_id != lOther$restaurant_id) {
      return false;
    }
    final l$special_period_end = special_period_end;
    final lOther$special_period_end = other.special_period_end;
    if (l$special_period_end != lOther$special_period_end) {
      return false;
    }
    final l$special_period_start = special_period_start;
    final lOther$special_period_start = other.special_period_start;
    if (l$special_period_start != lOther$special_period_start) {
      return false;
    }
    final l$archived = archived;
    final lOther$archived = other.archived;
    if (l$archived != lOther$archived) {
      return false;
    }
    final l$cost = cost;
    final lOther$cost = other.cost;
    if (l$cost != lOther$cost) {
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

extension UtilityExtension$Query$get_customer_orders$restaurant_order$items$restaurant_item
    on Query$get_customer_orders$restaurant_order$items$restaurant_item {
  CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item<
          Query$get_customer_orders$restaurant_order$items$restaurant_item>
      get copyWith =>
          CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item<
    TRes> {
  factory CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item(
    Query$get_customer_orders$restaurant_order$items$restaurant_item instance,
    TRes Function(
            Query$get_customer_orders$restaurant_order$items$restaurant_item)
        then,
  ) = _CopyWithImpl$Query$get_customer_orders$restaurant_order$items$restaurant_item;

  factory CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_customer_orders$restaurant_order$items$restaurant_item;

  TRes call({
    String? item_type,
    Query$get_customer_orders$restaurant_order$items$restaurant_item$name? name,
    Query$get_customer_orders$restaurant_order$items$restaurant_item$description?
        description,
    int? position,
    int? category_id,
    bool? available,
    int? restaurant_id,
    String? special_period_end,
    String? special_period_start,
    bool? archived,
    double? cost,
    String? $__typename,
  });
  CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item$name<
      TRes> get name;
  CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item$description<
      TRes> get description;
}

class _CopyWithImpl$Query$get_customer_orders$restaurant_order$items$restaurant_item<
        TRes>
    implements
        CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item<
            TRes> {
  _CopyWithImpl$Query$get_customer_orders$restaurant_order$items$restaurant_item(
    this._instance,
    this._then,
  );

  final Query$get_customer_orders$restaurant_order$items$restaurant_item
      _instance;

  final TRes Function(
      Query$get_customer_orders$restaurant_order$items$restaurant_item) _then;

  static const _undefined = {};

  TRes call({
    Object? item_type = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? position = _undefined,
    Object? category_id = _undefined,
    Object? available = _undefined,
    Object? restaurant_id = _undefined,
    Object? special_period_end = _undefined,
    Object? special_period_start = _undefined,
    Object? archived = _undefined,
    Object? cost = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_customer_orders$restaurant_order$items$restaurant_item(
        item_type: item_type == _undefined || item_type == null
            ? _instance.item_type
            : (item_type as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Query$get_customer_orders$restaurant_order$items$restaurant_item$name),
        description: description == _undefined
            ? _instance.description
            : (description
                as Query$get_customer_orders$restaurant_order$items$restaurant_item$description?),
        position: position == _undefined || position == null
            ? _instance.position
            : (position as int),
        category_id: category_id == _undefined
            ? _instance.category_id
            : (category_id as int?),
        available: available == _undefined || available == null
            ? _instance.available
            : (available as bool),
        restaurant_id: restaurant_id == _undefined || restaurant_id == null
            ? _instance.restaurant_id
            : (restaurant_id as int),
        special_period_end: special_period_end == _undefined
            ? _instance.special_period_end
            : (special_period_end as String?),
        special_period_start: special_period_start == _undefined
            ? _instance.special_period_start
            : (special_period_start as String?),
        archived: archived == _undefined || archived == null
            ? _instance.archived
            : (archived as bool),
        cost: cost == _undefined || cost == null
            ? _instance.cost
            : (cost as double),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item$name<
      TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item$name(
        local$name, (e) => call(name: e));
  }

  CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item$description<
      TRes> get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item$description
            .stub(_then(_instance))
        : CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item$description(
            local$description, (e) => call(description: e));
  }
}

class _CopyWithStubImpl$Query$get_customer_orders$restaurant_order$items$restaurant_item<
        TRes>
    implements
        CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item<
            TRes> {
  _CopyWithStubImpl$Query$get_customer_orders$restaurant_order$items$restaurant_item(
      this._res);

  TRes _res;

  call({
    String? item_type,
    Query$get_customer_orders$restaurant_order$items$restaurant_item$name? name,
    Query$get_customer_orders$restaurant_order$items$restaurant_item$description?
        description,
    int? position,
    int? category_id,
    bool? available,
    int? restaurant_id,
    String? special_period_end,
    String? special_period_start,
    bool? archived,
    double? cost,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item$name<
          TRes>
      get name =>
          CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item$name
              .stub(_res);
  CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item$description<
          TRes>
      get description =>
          CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item$description
              .stub(_res);
}

class Query$get_customer_orders$restaurant_order$items$restaurant_item$name {
  Query$get_customer_orders$restaurant_order$items$restaurant_item$name({
    required this.translations,
    required this.$__typename,
  });

  factory Query$get_customer_orders$restaurant_order$items$restaurant_item$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$get_customer_orders$restaurant_order$items$restaurant_item$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$get_customer_orders$restaurant_order$items$restaurant_item$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$get_customer_orders$restaurant_order$items$restaurant_item$name$translations>
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
            is Query$get_customer_orders$restaurant_order$items$restaurant_item$name) ||
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

extension UtilityExtension$Query$get_customer_orders$restaurant_order$items$restaurant_item$name
    on Query$get_customer_orders$restaurant_order$items$restaurant_item$name {
  CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item$name<
          Query$get_customer_orders$restaurant_order$items$restaurant_item$name>
      get copyWith =>
          CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item$name<
    TRes> {
  factory CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item$name(
    Query$get_customer_orders$restaurant_order$items$restaurant_item$name
        instance,
    TRes Function(
            Query$get_customer_orders$restaurant_order$items$restaurant_item$name)
        then,
  ) = _CopyWithImpl$Query$get_customer_orders$restaurant_order$items$restaurant_item$name;

  factory CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_customer_orders$restaurant_order$items$restaurant_item$name;

  TRes call({
    List<Query$get_customer_orders$restaurant_order$items$restaurant_item$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$get_customer_orders$restaurant_order$items$restaurant_item$name$translations> Function(
              Iterable<
                  CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item$name$translations<
                      Query$get_customer_orders$restaurant_order$items$restaurant_item$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$get_customer_orders$restaurant_order$items$restaurant_item$name<
        TRes>
    implements
        CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item$name<
            TRes> {
  _CopyWithImpl$Query$get_customer_orders$restaurant_order$items$restaurant_item$name(
    this._instance,
    this._then,
  );

  final Query$get_customer_orders$restaurant_order$items$restaurant_item$name
      _instance;

  final TRes Function(
          Query$get_customer_orders$restaurant_order$items$restaurant_item$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_customer_orders$restaurant_order$items$restaurant_item$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$get_customer_orders$restaurant_order$items$restaurant_item$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$get_customer_orders$restaurant_order$items$restaurant_item$name$translations> Function(
                  Iterable<
                      CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item$name$translations<
                          Query$get_customer_orders$restaurant_order$items$restaurant_item$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_customer_orders$restaurant_order$items$restaurant_item$name<
        TRes>
    implements
        CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item$name<
            TRes> {
  _CopyWithStubImpl$Query$get_customer_orders$restaurant_order$items$restaurant_item$name(
      this._res);

  TRes _res;

  call({
    List<Query$get_customer_orders$restaurant_order$items$restaurant_item$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$get_customer_orders$restaurant_order$items$restaurant_item$name$translations {
  Query$get_customer_orders$restaurant_order$items$restaurant_item$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$get_customer_orders$restaurant_order$items$restaurant_item$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$get_customer_orders$restaurant_order$items$restaurant_item$name$translations(
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
            is Query$get_customer_orders$restaurant_order$items$restaurant_item$name$translations) ||
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

extension UtilityExtension$Query$get_customer_orders$restaurant_order$items$restaurant_item$name$translations
    on Query$get_customer_orders$restaurant_order$items$restaurant_item$name$translations {
  CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item$name$translations<
          Query$get_customer_orders$restaurant_order$items$restaurant_item$name$translations>
      get copyWith =>
          CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item$name$translations<
    TRes> {
  factory CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item$name$translations(
    Query$get_customer_orders$restaurant_order$items$restaurant_item$name$translations
        instance,
    TRes Function(
            Query$get_customer_orders$restaurant_order$items$restaurant_item$name$translations)
        then,
  ) = _CopyWithImpl$Query$get_customer_orders$restaurant_order$items$restaurant_item$name$translations;

  factory CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_customer_orders$restaurant_order$items$restaurant_item$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_customer_orders$restaurant_order$items$restaurant_item$name$translations<
        TRes>
    implements
        CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item$name$translations<
            TRes> {
  _CopyWithImpl$Query$get_customer_orders$restaurant_order$items$restaurant_item$name$translations(
    this._instance,
    this._then,
  );

  final Query$get_customer_orders$restaurant_order$items$restaurant_item$name$translations
      _instance;

  final TRes Function(
          Query$get_customer_orders$restaurant_order$items$restaurant_item$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_customer_orders$restaurant_order$items$restaurant_item$name$translations(
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

class _CopyWithStubImpl$Query$get_customer_orders$restaurant_order$items$restaurant_item$name$translations<
        TRes>
    implements
        CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$get_customer_orders$restaurant_order$items$restaurant_item$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_customer_orders$restaurant_order$items$restaurant_item$description {
  Query$get_customer_orders$restaurant_order$items$restaurant_item$description({
    required this.translations,
    required this.$__typename,
  });

  factory Query$get_customer_orders$restaurant_order$items$restaurant_item$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$get_customer_orders$restaurant_order$items$restaurant_item$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$get_customer_orders$restaurant_order$items$restaurant_item$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$get_customer_orders$restaurant_order$items$restaurant_item$description$translations>
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
            is Query$get_customer_orders$restaurant_order$items$restaurant_item$description) ||
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

extension UtilityExtension$Query$get_customer_orders$restaurant_order$items$restaurant_item$description
    on Query$get_customer_orders$restaurant_order$items$restaurant_item$description {
  CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item$description<
          Query$get_customer_orders$restaurant_order$items$restaurant_item$description>
      get copyWith =>
          CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item$description<
    TRes> {
  factory CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item$description(
    Query$get_customer_orders$restaurant_order$items$restaurant_item$description
        instance,
    TRes Function(
            Query$get_customer_orders$restaurant_order$items$restaurant_item$description)
        then,
  ) = _CopyWithImpl$Query$get_customer_orders$restaurant_order$items$restaurant_item$description;

  factory CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item$description.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_customer_orders$restaurant_order$items$restaurant_item$description;

  TRes call({
    List<Query$get_customer_orders$restaurant_order$items$restaurant_item$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$get_customer_orders$restaurant_order$items$restaurant_item$description$translations> Function(
              Iterable<
                  CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item$description$translations<
                      Query$get_customer_orders$restaurant_order$items$restaurant_item$description$translations>>)
          _fn);
}

class _CopyWithImpl$Query$get_customer_orders$restaurant_order$items$restaurant_item$description<
        TRes>
    implements
        CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item$description<
            TRes> {
  _CopyWithImpl$Query$get_customer_orders$restaurant_order$items$restaurant_item$description(
    this._instance,
    this._then,
  );

  final Query$get_customer_orders$restaurant_order$items$restaurant_item$description
      _instance;

  final TRes Function(
          Query$get_customer_orders$restaurant_order$items$restaurant_item$description)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_customer_orders$restaurant_order$items$restaurant_item$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$get_customer_orders$restaurant_order$items$restaurant_item$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$get_customer_orders$restaurant_order$items$restaurant_item$description$translations> Function(
                  Iterable<
                      CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item$description$translations<
                          Query$get_customer_orders$restaurant_order$items$restaurant_item$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_customer_orders$restaurant_order$items$restaurant_item$description<
        TRes>
    implements
        CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item$description<
            TRes> {
  _CopyWithStubImpl$Query$get_customer_orders$restaurant_order$items$restaurant_item$description(
      this._res);

  TRes _res;

  call({
    List<Query$get_customer_orders$restaurant_order$items$restaurant_item$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$get_customer_orders$restaurant_order$items$restaurant_item$description$translations {
  Query$get_customer_orders$restaurant_order$items$restaurant_item$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$get_customer_orders$restaurant_order$items$restaurant_item$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$get_customer_orders$restaurant_order$items$restaurant_item$description$translations(
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
            is Query$get_customer_orders$restaurant_order$items$restaurant_item$description$translations) ||
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

extension UtilityExtension$Query$get_customer_orders$restaurant_order$items$restaurant_item$description$translations
    on Query$get_customer_orders$restaurant_order$items$restaurant_item$description$translations {
  CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item$description$translations<
          Query$get_customer_orders$restaurant_order$items$restaurant_item$description$translations>
      get copyWith =>
          CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item$description$translations<
    TRes> {
  factory CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item$description$translations(
    Query$get_customer_orders$restaurant_order$items$restaurant_item$description$translations
        instance,
    TRes Function(
            Query$get_customer_orders$restaurant_order$items$restaurant_item$description$translations)
        then,
  ) = _CopyWithImpl$Query$get_customer_orders$restaurant_order$items$restaurant_item$description$translations;

  factory CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_customer_orders$restaurant_order$items$restaurant_item$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_customer_orders$restaurant_order$items$restaurant_item$description$translations<
        TRes>
    implements
        CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item$description$translations<
            TRes> {
  _CopyWithImpl$Query$get_customer_orders$restaurant_order$items$restaurant_item$description$translations(
    this._instance,
    this._then,
  );

  final Query$get_customer_orders$restaurant_order$items$restaurant_item$description$translations
      _instance;

  final TRes Function(
          Query$get_customer_orders$restaurant_order$items$restaurant_item$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_customer_orders$restaurant_order$items$restaurant_item$description$translations(
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

class _CopyWithStubImpl$Query$get_customer_orders$restaurant_order$items$restaurant_item$description$translations<
        TRes>
    implements
        CopyWith$Query$get_customer_orders$restaurant_order$items$restaurant_item$description$translations<
            TRes> {
  _CopyWithStubImpl$Query$get_customer_orders$restaurant_order$items$restaurant_item$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_customer_orders$restaurant_order$delivery {
  Query$get_customer_orders$restaurant_order$delivery({
    this.actual_delivered_time,
    this.actual_package_ready_time,
    this.actual_arrival_at_pickup_time,
    this.actual_arrival_at_dropoff_time,
    this.cancellation_time,
    this.current_gps,
    this.deliverer_id,
    required this.delivery_cost,
    required this.$__typename,
  });

  factory Query$get_customer_orders$restaurant_order$delivery.fromJson(
      Map<String, dynamic> json) {
    final l$actual_delivered_time = json['actual_delivered_time'];
    final l$actual_package_ready_time = json['actual_package_ready_time'];
    final l$actual_arrival_at_pickup_time =
        json['actual_arrival_at_pickup_time'];
    final l$actual_arrival_at_dropoff_time =
        json['actual_arrival_at_dropoff_time'];
    final l$cancellation_time = json['cancellation_time'];
    final l$current_gps = json['current_gps'];
    final l$deliverer_id = json['deliverer_id'];
    final l$delivery_cost = json['delivery_cost'];
    final l$$__typename = json['__typename'];
    return Query$get_customer_orders$restaurant_order$delivery(
      actual_delivered_time: (l$actual_delivered_time as String?),
      actual_package_ready_time: (l$actual_package_ready_time as String?),
      actual_arrival_at_pickup_time:
          (l$actual_arrival_at_pickup_time as String?),
      actual_arrival_at_dropoff_time:
          (l$actual_arrival_at_dropoff_time as String?),
      cancellation_time: (l$cancellation_time as String?),
      current_gps:
          l$current_gps == null ? null : geographyFromJson(l$current_gps),
      deliverer_id: (l$deliverer_id as int?),
      delivery_cost: moneyFromJson(l$delivery_cost),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? actual_delivered_time;

  final String? actual_package_ready_time;

  final String? actual_arrival_at_pickup_time;

  final String? actual_arrival_at_dropoff_time;

  final String? cancellation_time;

  final Geography? current_gps;

  final int? deliverer_id;

  final double delivery_cost;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$actual_delivered_time = actual_delivered_time;
    _resultData['actual_delivered_time'] = l$actual_delivered_time;
    final l$actual_package_ready_time = actual_package_ready_time;
    _resultData['actual_package_ready_time'] = l$actual_package_ready_time;
    final l$actual_arrival_at_pickup_time = actual_arrival_at_pickup_time;
    _resultData['actual_arrival_at_pickup_time'] =
        l$actual_arrival_at_pickup_time;
    final l$actual_arrival_at_dropoff_time = actual_arrival_at_dropoff_time;
    _resultData['actual_arrival_at_dropoff_time'] =
        l$actual_arrival_at_dropoff_time;
    final l$cancellation_time = cancellation_time;
    _resultData['cancellation_time'] = l$cancellation_time;
    final l$current_gps = current_gps;
    _resultData['current_gps'] =
        l$current_gps == null ? null : geographyToJson(l$current_gps);
    final l$deliverer_id = deliverer_id;
    _resultData['deliverer_id'] = l$deliverer_id;
    final l$delivery_cost = delivery_cost;
    _resultData['delivery_cost'] = moneyToJson(l$delivery_cost);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$actual_delivered_time = actual_delivered_time;
    final l$actual_package_ready_time = actual_package_ready_time;
    final l$actual_arrival_at_pickup_time = actual_arrival_at_pickup_time;
    final l$actual_arrival_at_dropoff_time = actual_arrival_at_dropoff_time;
    final l$cancellation_time = cancellation_time;
    final l$current_gps = current_gps;
    final l$deliverer_id = deliverer_id;
    final l$delivery_cost = delivery_cost;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$actual_delivered_time,
      l$actual_package_ready_time,
      l$actual_arrival_at_pickup_time,
      l$actual_arrival_at_dropoff_time,
      l$cancellation_time,
      l$current_gps,
      l$deliverer_id,
      l$delivery_cost,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_customer_orders$restaurant_order$delivery) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$actual_delivered_time = actual_delivered_time;
    final lOther$actual_delivered_time = other.actual_delivered_time;
    if (l$actual_delivered_time != lOther$actual_delivered_time) {
      return false;
    }
    final l$actual_package_ready_time = actual_package_ready_time;
    final lOther$actual_package_ready_time = other.actual_package_ready_time;
    if (l$actual_package_ready_time != lOther$actual_package_ready_time) {
      return false;
    }
    final l$actual_arrival_at_pickup_time = actual_arrival_at_pickup_time;
    final lOther$actual_arrival_at_pickup_time =
        other.actual_arrival_at_pickup_time;
    if (l$actual_arrival_at_pickup_time !=
        lOther$actual_arrival_at_pickup_time) {
      return false;
    }
    final l$actual_arrival_at_dropoff_time = actual_arrival_at_dropoff_time;
    final lOther$actual_arrival_at_dropoff_time =
        other.actual_arrival_at_dropoff_time;
    if (l$actual_arrival_at_dropoff_time !=
        lOther$actual_arrival_at_dropoff_time) {
      return false;
    }
    final l$cancellation_time = cancellation_time;
    final lOther$cancellation_time = other.cancellation_time;
    if (l$cancellation_time != lOther$cancellation_time) {
      return false;
    }
    final l$current_gps = current_gps;
    final lOther$current_gps = other.current_gps;
    if (l$current_gps != lOther$current_gps) {
      return false;
    }
    final l$deliverer_id = deliverer_id;
    final lOther$deliverer_id = other.deliverer_id;
    if (l$deliverer_id != lOther$deliverer_id) {
      return false;
    }
    final l$delivery_cost = delivery_cost;
    final lOther$delivery_cost = other.delivery_cost;
    if (l$delivery_cost != lOther$delivery_cost) {
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

extension UtilityExtension$Query$get_customer_orders$restaurant_order$delivery
    on Query$get_customer_orders$restaurant_order$delivery {
  CopyWith$Query$get_customer_orders$restaurant_order$delivery<
          Query$get_customer_orders$restaurant_order$delivery>
      get copyWith =>
          CopyWith$Query$get_customer_orders$restaurant_order$delivery(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_customer_orders$restaurant_order$delivery<
    TRes> {
  factory CopyWith$Query$get_customer_orders$restaurant_order$delivery(
    Query$get_customer_orders$restaurant_order$delivery instance,
    TRes Function(Query$get_customer_orders$restaurant_order$delivery) then,
  ) = _CopyWithImpl$Query$get_customer_orders$restaurant_order$delivery;

  factory CopyWith$Query$get_customer_orders$restaurant_order$delivery.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_customer_orders$restaurant_order$delivery;

  TRes call({
    String? actual_delivered_time,
    String? actual_package_ready_time,
    String? actual_arrival_at_pickup_time,
    String? actual_arrival_at_dropoff_time,
    String? cancellation_time,
    Geography? current_gps,
    int? deliverer_id,
    double? delivery_cost,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_customer_orders$restaurant_order$delivery<TRes>
    implements
        CopyWith$Query$get_customer_orders$restaurant_order$delivery<TRes> {
  _CopyWithImpl$Query$get_customer_orders$restaurant_order$delivery(
    this._instance,
    this._then,
  );

  final Query$get_customer_orders$restaurant_order$delivery _instance;

  final TRes Function(Query$get_customer_orders$restaurant_order$delivery)
      _then;

  static const _undefined = {};

  TRes call({
    Object? actual_delivered_time = _undefined,
    Object? actual_package_ready_time = _undefined,
    Object? actual_arrival_at_pickup_time = _undefined,
    Object? actual_arrival_at_dropoff_time = _undefined,
    Object? cancellation_time = _undefined,
    Object? current_gps = _undefined,
    Object? deliverer_id = _undefined,
    Object? delivery_cost = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_customer_orders$restaurant_order$delivery(
        actual_delivered_time: actual_delivered_time == _undefined
            ? _instance.actual_delivered_time
            : (actual_delivered_time as String?),
        actual_package_ready_time: actual_package_ready_time == _undefined
            ? _instance.actual_package_ready_time
            : (actual_package_ready_time as String?),
        actual_arrival_at_pickup_time:
            actual_arrival_at_pickup_time == _undefined
                ? _instance.actual_arrival_at_pickup_time
                : (actual_arrival_at_pickup_time as String?),
        actual_arrival_at_dropoff_time:
            actual_arrival_at_dropoff_time == _undefined
                ? _instance.actual_arrival_at_dropoff_time
                : (actual_arrival_at_dropoff_time as String?),
        cancellation_time: cancellation_time == _undefined
            ? _instance.cancellation_time
            : (cancellation_time as String?),
        current_gps: current_gps == _undefined
            ? _instance.current_gps
            : (current_gps as Geography?),
        deliverer_id: deliverer_id == _undefined
            ? _instance.deliverer_id
            : (deliverer_id as int?),
        delivery_cost: delivery_cost == _undefined || delivery_cost == null
            ? _instance.delivery_cost
            : (delivery_cost as double),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_customer_orders$restaurant_order$delivery<
        TRes>
    implements
        CopyWith$Query$get_customer_orders$restaurant_order$delivery<TRes> {
  _CopyWithStubImpl$Query$get_customer_orders$restaurant_order$delivery(
      this._res);

  TRes _res;

  call({
    String? actual_delivered_time,
    String? actual_package_ready_time,
    String? actual_arrival_at_pickup_time,
    String? actual_arrival_at_dropoff_time,
    String? cancellation_time,
    Geography? current_gps,
    int? deliverer_id,
    double? delivery_cost,
    String? $__typename,
  }) =>
      _res;
}
