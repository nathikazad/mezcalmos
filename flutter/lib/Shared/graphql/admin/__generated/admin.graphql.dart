import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$set_admin_app_version {
  factory Variables$Mutation$set_admin_app_version({
    required int admin_id,
    required String version,
  }) =>
      Variables$Mutation$set_admin_app_version._({
        r'admin_id': admin_id,
        r'version': version,
      });

  Variables$Mutation$set_admin_app_version._(this._$data);

  factory Variables$Mutation$set_admin_app_version.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$admin_id = data['admin_id'];
    result$data['admin_id'] = (l$admin_id as int);
    final l$version = data['version'];
    result$data['version'] = (l$version as String);
    return Variables$Mutation$set_admin_app_version._(result$data);
  }

  Map<String, dynamic> _$data;

  int get admin_id => (_$data['admin_id'] as int);
  String get version => (_$data['version'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$admin_id = admin_id;
    result$data['admin_id'] = l$admin_id;
    final l$version = version;
    result$data['version'] = l$version;
    return result$data;
  }

  CopyWith$Variables$Mutation$set_admin_app_version<
          Variables$Mutation$set_admin_app_version>
      get copyWith => CopyWith$Variables$Mutation$set_admin_app_version(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$set_admin_app_version) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$admin_id = admin_id;
    final lOther$admin_id = other.admin_id;
    if (l$admin_id != lOther$admin_id) {
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
    final l$admin_id = admin_id;
    final l$version = version;
    return Object.hashAll([
      l$admin_id,
      l$version,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$set_admin_app_version<TRes> {
  factory CopyWith$Variables$Mutation$set_admin_app_version(
    Variables$Mutation$set_admin_app_version instance,
    TRes Function(Variables$Mutation$set_admin_app_version) then,
  ) = _CopyWithImpl$Variables$Mutation$set_admin_app_version;

  factory CopyWith$Variables$Mutation$set_admin_app_version.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$set_admin_app_version;

  TRes call({
    int? admin_id,
    String? version,
  });
}

class _CopyWithImpl$Variables$Mutation$set_admin_app_version<TRes>
    implements CopyWith$Variables$Mutation$set_admin_app_version<TRes> {
  _CopyWithImpl$Variables$Mutation$set_admin_app_version(
    this._instance,
    this._then,
  );

  final Variables$Mutation$set_admin_app_version _instance;

  final TRes Function(Variables$Mutation$set_admin_app_version) _then;

  static const _undefined = {};

  TRes call({
    Object? admin_id = _undefined,
    Object? version = _undefined,
  }) =>
      _then(Variables$Mutation$set_admin_app_version._({
        ..._instance._$data,
        if (admin_id != _undefined && admin_id != null)
          'admin_id': (admin_id as int),
        if (version != _undefined && version != null)
          'version': (version as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$set_admin_app_version<TRes>
    implements CopyWith$Variables$Mutation$set_admin_app_version<TRes> {
  _CopyWithStubImpl$Variables$Mutation$set_admin_app_version(this._res);

  TRes _res;

  call({
    int? admin_id,
    String? version,
  }) =>
      _res;
}

class Mutation$set_admin_app_version {
  Mutation$set_admin_app_version({
    this.update_mez_admin_by_pk,
    required this.$__typename,
  });

  factory Mutation$set_admin_app_version.fromJson(Map<String, dynamic> json) {
    final l$update_mez_admin_by_pk = json['update_mez_admin_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$set_admin_app_version(
      update_mez_admin_by_pk: l$update_mez_admin_by_pk == null
          ? null
          : Mutation$set_admin_app_version$update_mez_admin_by_pk.fromJson(
              (l$update_mez_admin_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$set_admin_app_version$update_mez_admin_by_pk?
      update_mez_admin_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_mez_admin_by_pk = update_mez_admin_by_pk;
    _resultData['update_mez_admin_by_pk'] = l$update_mez_admin_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_mez_admin_by_pk = update_mez_admin_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_mez_admin_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$set_admin_app_version) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_mez_admin_by_pk = update_mez_admin_by_pk;
    final lOther$update_mez_admin_by_pk = other.update_mez_admin_by_pk;
    if (l$update_mez_admin_by_pk != lOther$update_mez_admin_by_pk) {
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

extension UtilityExtension$Mutation$set_admin_app_version
    on Mutation$set_admin_app_version {
  CopyWith$Mutation$set_admin_app_version<Mutation$set_admin_app_version>
      get copyWith => CopyWith$Mutation$set_admin_app_version(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$set_admin_app_version<TRes> {
  factory CopyWith$Mutation$set_admin_app_version(
    Mutation$set_admin_app_version instance,
    TRes Function(Mutation$set_admin_app_version) then,
  ) = _CopyWithImpl$Mutation$set_admin_app_version;

  factory CopyWith$Mutation$set_admin_app_version.stub(TRes res) =
      _CopyWithStubImpl$Mutation$set_admin_app_version;

  TRes call({
    Mutation$set_admin_app_version$update_mez_admin_by_pk?
        update_mez_admin_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$set_admin_app_version$update_mez_admin_by_pk<TRes>
      get update_mez_admin_by_pk;
}

class _CopyWithImpl$Mutation$set_admin_app_version<TRes>
    implements CopyWith$Mutation$set_admin_app_version<TRes> {
  _CopyWithImpl$Mutation$set_admin_app_version(
    this._instance,
    this._then,
  );

  final Mutation$set_admin_app_version _instance;

  final TRes Function(Mutation$set_admin_app_version) _then;

  static const _undefined = {};

  TRes call({
    Object? update_mez_admin_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$set_admin_app_version(
        update_mez_admin_by_pk: update_mez_admin_by_pk == _undefined
            ? _instance.update_mez_admin_by_pk
            : (update_mez_admin_by_pk
                as Mutation$set_admin_app_version$update_mez_admin_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$set_admin_app_version$update_mez_admin_by_pk<TRes>
      get update_mez_admin_by_pk {
    final local$update_mez_admin_by_pk = _instance.update_mez_admin_by_pk;
    return local$update_mez_admin_by_pk == null
        ? CopyWith$Mutation$set_admin_app_version$update_mez_admin_by_pk.stub(
            _then(_instance))
        : CopyWith$Mutation$set_admin_app_version$update_mez_admin_by_pk(
            local$update_mez_admin_by_pk,
            (e) => call(update_mez_admin_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$set_admin_app_version<TRes>
    implements CopyWith$Mutation$set_admin_app_version<TRes> {
  _CopyWithStubImpl$Mutation$set_admin_app_version(this._res);

  TRes _res;

  call({
    Mutation$set_admin_app_version$update_mez_admin_by_pk?
        update_mez_admin_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$set_admin_app_version$update_mez_admin_by_pk<TRes>
      get update_mez_admin_by_pk =>
          CopyWith$Mutation$set_admin_app_version$update_mez_admin_by_pk.stub(
              _res);
}

const documentNodeMutationset_admin_app_version = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'set_admin_app_version'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'admin_id')),
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
        name: NameNode(value: 'update_mez_admin_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'pk_columns'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'user_id'),
                value: VariableNode(name: NameNode(value: 'admin_id')),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: '_set'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'version'),
                value: VariableNode(name: NameNode(value: 'version')),
              )
            ]),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'version'),
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
Mutation$set_admin_app_version _parserFn$Mutation$set_admin_app_version(
        Map<String, dynamic> data) =>
    Mutation$set_admin_app_version.fromJson(data);
typedef OnMutationCompleted$Mutation$set_admin_app_version = FutureOr<void>
    Function(
  dynamic,
  Mutation$set_admin_app_version?,
);

class Options$Mutation$set_admin_app_version
    extends graphql.MutationOptions<Mutation$set_admin_app_version> {
  Options$Mutation$set_admin_app_version({
    String? operationName,
    required Variables$Mutation$set_admin_app_version variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$set_admin_app_version? onCompleted,
    graphql.OnMutationUpdate<Mutation$set_admin_app_version>? update,
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
                        : _parserFn$Mutation$set_admin_app_version(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationset_admin_app_version,
          parserFn: _parserFn$Mutation$set_admin_app_version,
        );

  final OnMutationCompleted$Mutation$set_admin_app_version?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$set_admin_app_version
    extends graphql.WatchQueryOptions<Mutation$set_admin_app_version> {
  WatchOptions$Mutation$set_admin_app_version({
    String? operationName,
    required Variables$Mutation$set_admin_app_version variables,
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
          document: documentNodeMutationset_admin_app_version,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$set_admin_app_version,
        );
}

extension ClientExtension$Mutation$set_admin_app_version
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$set_admin_app_version>>
      mutate$set_admin_app_version(
              Options$Mutation$set_admin_app_version options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$set_admin_app_version>
      watchMutation$set_admin_app_version(
              WatchOptions$Mutation$set_admin_app_version options) =>
          this.watchMutation(options);
}

class Mutation$set_admin_app_version$update_mez_admin_by_pk {
  Mutation$set_admin_app_version$update_mez_admin_by_pk({
    this.version,
    required this.$__typename,
  });

  factory Mutation$set_admin_app_version$update_mez_admin_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$version = json['version'];
    final l$$__typename = json['__typename'];
    return Mutation$set_admin_app_version$update_mez_admin_by_pk(
      version: (l$version as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? version;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$version = version;
    _resultData['version'] = l$version;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$version = version;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$version,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$set_admin_app_version$update_mez_admin_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$version = version;
    final lOther$version = other.version;
    if (l$version != lOther$version) {
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

extension UtilityExtension$Mutation$set_admin_app_version$update_mez_admin_by_pk
    on Mutation$set_admin_app_version$update_mez_admin_by_pk {
  CopyWith$Mutation$set_admin_app_version$update_mez_admin_by_pk<
          Mutation$set_admin_app_version$update_mez_admin_by_pk>
      get copyWith =>
          CopyWith$Mutation$set_admin_app_version$update_mez_admin_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$set_admin_app_version$update_mez_admin_by_pk<
    TRes> {
  factory CopyWith$Mutation$set_admin_app_version$update_mez_admin_by_pk(
    Mutation$set_admin_app_version$update_mez_admin_by_pk instance,
    TRes Function(Mutation$set_admin_app_version$update_mez_admin_by_pk) then,
  ) = _CopyWithImpl$Mutation$set_admin_app_version$update_mez_admin_by_pk;

  factory CopyWith$Mutation$set_admin_app_version$update_mez_admin_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$set_admin_app_version$update_mez_admin_by_pk;

  TRes call({
    String? version,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$set_admin_app_version$update_mez_admin_by_pk<TRes>
    implements
        CopyWith$Mutation$set_admin_app_version$update_mez_admin_by_pk<TRes> {
  _CopyWithImpl$Mutation$set_admin_app_version$update_mez_admin_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$set_admin_app_version$update_mez_admin_by_pk _instance;

  final TRes Function(Mutation$set_admin_app_version$update_mez_admin_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? version = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$set_admin_app_version$update_mez_admin_by_pk(
        version:
            version == _undefined ? _instance.version : (version as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$set_admin_app_version$update_mez_admin_by_pk<
        TRes>
    implements
        CopyWith$Mutation$set_admin_app_version$update_mez_admin_by_pk<TRes> {
  _CopyWithStubImpl$Mutation$set_admin_app_version$update_mez_admin_by_pk(
      this._res);

  TRes _res;

  call({
    String? version,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$set_notif_token {
  factory Variables$Mutation$set_notif_token({
    required int admin_id,
    required String token,
  }) =>
      Variables$Mutation$set_notif_token._({
        r'admin_id': admin_id,
        r'token': token,
      });

  Variables$Mutation$set_notif_token._(this._$data);

  factory Variables$Mutation$set_notif_token.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$admin_id = data['admin_id'];
    result$data['admin_id'] = (l$admin_id as int);
    final l$token = data['token'];
    result$data['token'] = (l$token as String);
    return Variables$Mutation$set_notif_token._(result$data);
  }

  Map<String, dynamic> _$data;

  int get admin_id => (_$data['admin_id'] as int);
  String get token => (_$data['token'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$admin_id = admin_id;
    result$data['admin_id'] = l$admin_id;
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
    final l$admin_id = admin_id;
    final lOther$admin_id = other.admin_id;
    if (l$admin_id != lOther$admin_id) {
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
    final l$admin_id = admin_id;
    final l$token = token;
    return Object.hashAll([
      l$admin_id,
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
    int? admin_id,
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
    Object? admin_id = _undefined,
    Object? token = _undefined,
  }) =>
      _then(Variables$Mutation$set_notif_token._({
        ..._instance._$data,
        if (admin_id != _undefined && admin_id != null)
          'admin_id': (admin_id as int),
        if (token != _undefined && token != null) 'token': (token as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$set_notif_token<TRes>
    implements CopyWith$Variables$Mutation$set_notif_token<TRes> {
  _CopyWithStubImpl$Variables$Mutation$set_notif_token(this._res);

  TRes _res;

  call({
    int? admin_id,
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
        variable: VariableNode(name: NameNode(value: 'admin_id')),
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
                    value: VariableNode(name: NameNode(value: 'admin_id')),
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

class Variables$Query$get_admin_info {
  factory Variables$Query$get_admin_info({required int admin_id}) =>
      Variables$Query$get_admin_info._({
        r'admin_id': admin_id,
      });

  Variables$Query$get_admin_info._(this._$data);

  factory Variables$Query$get_admin_info.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$admin_id = data['admin_id'];
    result$data['admin_id'] = (l$admin_id as int);
    return Variables$Query$get_admin_info._(result$data);
  }

  Map<String, dynamic> _$data;

  int get admin_id => (_$data['admin_id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$admin_id = admin_id;
    result$data['admin_id'] = l$admin_id;
    return result$data;
  }

  CopyWith$Variables$Query$get_admin_info<Variables$Query$get_admin_info>
      get copyWith => CopyWith$Variables$Query$get_admin_info(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_admin_info) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$admin_id = admin_id;
    final lOther$admin_id = other.admin_id;
    if (l$admin_id != lOther$admin_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$admin_id = admin_id;
    return Object.hashAll([l$admin_id]);
  }
}

abstract class CopyWith$Variables$Query$get_admin_info<TRes> {
  factory CopyWith$Variables$Query$get_admin_info(
    Variables$Query$get_admin_info instance,
    TRes Function(Variables$Query$get_admin_info) then,
  ) = _CopyWithImpl$Variables$Query$get_admin_info;

  factory CopyWith$Variables$Query$get_admin_info.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$get_admin_info;

  TRes call({int? admin_id});
}

class _CopyWithImpl$Variables$Query$get_admin_info<TRes>
    implements CopyWith$Variables$Query$get_admin_info<TRes> {
  _CopyWithImpl$Variables$Query$get_admin_info(
    this._instance,
    this._then,
  );

  final Variables$Query$get_admin_info _instance;

  final TRes Function(Variables$Query$get_admin_info) _then;

  static const _undefined = {};

  TRes call({Object? admin_id = _undefined}) =>
      _then(Variables$Query$get_admin_info._({
        ..._instance._$data,
        if (admin_id != _undefined && admin_id != null)
          'admin_id': (admin_id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_admin_info<TRes>
    implements CopyWith$Variables$Query$get_admin_info<TRes> {
  _CopyWithStubImpl$Variables$Query$get_admin_info(this._res);

  TRes _res;

  call({int? admin_id}) => _res;
}

class Query$get_admin_info {
  Query$get_admin_info({
    required this.mez_admin,
    required this.$__typename,
  });

  factory Query$get_admin_info.fromJson(Map<String, dynamic> json) {
    final l$mez_admin = json['mez_admin'];
    final l$$__typename = json['__typename'];
    return Query$get_admin_info(
      mez_admin: (l$mez_admin as List<dynamic>)
          .map((e) => Query$get_admin_info$mez_admin.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$get_admin_info$mez_admin> mez_admin;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$mez_admin = mez_admin;
    _resultData['mez_admin'] = l$mez_admin.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$mez_admin = mez_admin;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$mez_admin.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_admin_info) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$mez_admin = mez_admin;
    final lOther$mez_admin = other.mez_admin;
    if (l$mez_admin.length != lOther$mez_admin.length) {
      return false;
    }
    for (int i = 0; i < l$mez_admin.length; i++) {
      final l$mez_admin$entry = l$mez_admin[i];
      final lOther$mez_admin$entry = lOther$mez_admin[i];
      if (l$mez_admin$entry != lOther$mez_admin$entry) {
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

extension UtilityExtension$Query$get_admin_info on Query$get_admin_info {
  CopyWith$Query$get_admin_info<Query$get_admin_info> get copyWith =>
      CopyWith$Query$get_admin_info(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$get_admin_info<TRes> {
  factory CopyWith$Query$get_admin_info(
    Query$get_admin_info instance,
    TRes Function(Query$get_admin_info) then,
  ) = _CopyWithImpl$Query$get_admin_info;

  factory CopyWith$Query$get_admin_info.stub(TRes res) =
      _CopyWithStubImpl$Query$get_admin_info;

  TRes call({
    List<Query$get_admin_info$mez_admin>? mez_admin,
    String? $__typename,
  });
  TRes mez_admin(
      Iterable<Query$get_admin_info$mez_admin> Function(
              Iterable<
                  CopyWith$Query$get_admin_info$mez_admin<
                      Query$get_admin_info$mez_admin>>)
          _fn);
}

class _CopyWithImpl$Query$get_admin_info<TRes>
    implements CopyWith$Query$get_admin_info<TRes> {
  _CopyWithImpl$Query$get_admin_info(
    this._instance,
    this._then,
  );

  final Query$get_admin_info _instance;

  final TRes Function(Query$get_admin_info) _then;

  static const _undefined = {};

  TRes call({
    Object? mez_admin = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_admin_info(
        mez_admin: mez_admin == _undefined || mez_admin == null
            ? _instance.mez_admin
            : (mez_admin as List<Query$get_admin_info$mez_admin>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes mez_admin(
          Iterable<Query$get_admin_info$mez_admin> Function(
                  Iterable<
                      CopyWith$Query$get_admin_info$mez_admin<
                          Query$get_admin_info$mez_admin>>)
              _fn) =>
      call(
          mez_admin: _fn(_instance.mez_admin
              .map((e) => CopyWith$Query$get_admin_info$mez_admin(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$get_admin_info<TRes>
    implements CopyWith$Query$get_admin_info<TRes> {
  _CopyWithStubImpl$Query$get_admin_info(this._res);

  TRes _res;

  call({
    List<Query$get_admin_info$mez_admin>? mez_admin,
    String? $__typename,
  }) =>
      _res;
  mez_admin(_fn) => _res;
}

const documentNodeQueryget_admin_info = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_admin_info'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'admin_id')),
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
        name: NameNode(value: 'mez_admin'),
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
                    value: VariableNode(name: NameNode(value: 'admin_id')),
                  )
                ]),
              )
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'version'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'notification_info'),
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
                name: NameNode(value: 'turn_off_notifications'),
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
Query$get_admin_info _parserFn$Query$get_admin_info(
        Map<String, dynamic> data) =>
    Query$get_admin_info.fromJson(data);

class Options$Query$get_admin_info
    extends graphql.QueryOptions<Query$get_admin_info> {
  Options$Query$get_admin_info({
    String? operationName,
    required Variables$Query$get_admin_info variables,
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
          document: documentNodeQueryget_admin_info,
          parserFn: _parserFn$Query$get_admin_info,
        );
}

class WatchOptions$Query$get_admin_info
    extends graphql.WatchQueryOptions<Query$get_admin_info> {
  WatchOptions$Query$get_admin_info({
    String? operationName,
    required Variables$Query$get_admin_info variables,
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
          document: documentNodeQueryget_admin_info,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_admin_info,
        );
}

class FetchMoreOptions$Query$get_admin_info extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_admin_info({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_admin_info variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_admin_info,
        );
}

extension ClientExtension$Query$get_admin_info on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_admin_info>> query$get_admin_info(
          Options$Query$get_admin_info options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$get_admin_info> watchQuery$get_admin_info(
          WatchOptions$Query$get_admin_info options) =>
      this.watchQuery(options);
  void writeQuery$get_admin_info({
    required Query$get_admin_info data,
    required Variables$Query$get_admin_info variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryget_admin_info),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_admin_info? readQuery$get_admin_info({
    required Variables$Query$get_admin_info variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryget_admin_info),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$get_admin_info.fromJson(result);
  }
}

class Query$get_admin_info$mez_admin {
  Query$get_admin_info$mez_admin({
    this.version,
    this.notification_info,
    this.user,
    required this.$__typename,
  });

  factory Query$get_admin_info$mez_admin.fromJson(Map<String, dynamic> json) {
    final l$version = json['version'];
    final l$notification_info = json['notification_info'];
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$get_admin_info$mez_admin(
      version: (l$version as String?),
      notification_info: l$notification_info == null
          ? null
          : Query$get_admin_info$mez_admin$notification_info.fromJson(
              (l$notification_info as Map<String, dynamic>)),
      user: l$user == null
          ? null
          : Query$get_admin_info$mez_admin$user.fromJson(
              (l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? version;

  final Query$get_admin_info$mez_admin$notification_info? notification_info;

  final Query$get_admin_info$mez_admin$user? user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$version = version;
    _resultData['version'] = l$version;
    final l$notification_info = notification_info;
    _resultData['notification_info'] = l$notification_info?.toJson();
    final l$user = user;
    _resultData['user'] = l$user?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$version = version;
    final l$notification_info = notification_info;
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$version,
      l$notification_info,
      l$user,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_admin_info$mez_admin) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$version = version;
    final lOther$version = other.version;
    if (l$version != lOther$version) {
      return false;
    }
    final l$notification_info = notification_info;
    final lOther$notification_info = other.notification_info;
    if (l$notification_info != lOther$notification_info) {
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

extension UtilityExtension$Query$get_admin_info$mez_admin
    on Query$get_admin_info$mez_admin {
  CopyWith$Query$get_admin_info$mez_admin<Query$get_admin_info$mez_admin>
      get copyWith => CopyWith$Query$get_admin_info$mez_admin(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_admin_info$mez_admin<TRes> {
  factory CopyWith$Query$get_admin_info$mez_admin(
    Query$get_admin_info$mez_admin instance,
    TRes Function(Query$get_admin_info$mez_admin) then,
  ) = _CopyWithImpl$Query$get_admin_info$mez_admin;

  factory CopyWith$Query$get_admin_info$mez_admin.stub(TRes res) =
      _CopyWithStubImpl$Query$get_admin_info$mez_admin;

  TRes call({
    String? version,
    Query$get_admin_info$mez_admin$notification_info? notification_info,
    Query$get_admin_info$mez_admin$user? user,
    String? $__typename,
  });
  CopyWith$Query$get_admin_info$mez_admin$notification_info<TRes>
      get notification_info;
  CopyWith$Query$get_admin_info$mez_admin$user<TRes> get user;
}

class _CopyWithImpl$Query$get_admin_info$mez_admin<TRes>
    implements CopyWith$Query$get_admin_info$mez_admin<TRes> {
  _CopyWithImpl$Query$get_admin_info$mez_admin(
    this._instance,
    this._then,
  );

  final Query$get_admin_info$mez_admin _instance;

  final TRes Function(Query$get_admin_info$mez_admin) _then;

  static const _undefined = {};

  TRes call({
    Object? version = _undefined,
    Object? notification_info = _undefined,
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_admin_info$mez_admin(
        version:
            version == _undefined ? _instance.version : (version as String?),
        notification_info: notification_info == _undefined
            ? _instance.notification_info
            : (notification_info
                as Query$get_admin_info$mez_admin$notification_info?),
        user: user == _undefined
            ? _instance.user
            : (user as Query$get_admin_info$mez_admin$user?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_admin_info$mez_admin$notification_info<TRes>
      get notification_info {
    final local$notification_info = _instance.notification_info;
    return local$notification_info == null
        ? CopyWith$Query$get_admin_info$mez_admin$notification_info.stub(
            _then(_instance))
        : CopyWith$Query$get_admin_info$mez_admin$notification_info(
            local$notification_info, (e) => call(notification_info: e));
  }

  CopyWith$Query$get_admin_info$mez_admin$user<TRes> get user {
    final local$user = _instance.user;
    return local$user == null
        ? CopyWith$Query$get_admin_info$mez_admin$user.stub(_then(_instance))
        : CopyWith$Query$get_admin_info$mez_admin$user(
            local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$get_admin_info$mez_admin<TRes>
    implements CopyWith$Query$get_admin_info$mez_admin<TRes> {
  _CopyWithStubImpl$Query$get_admin_info$mez_admin(this._res);

  TRes _res;

  call({
    String? version,
    Query$get_admin_info$mez_admin$notification_info? notification_info,
    Query$get_admin_info$mez_admin$user? user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_admin_info$mez_admin$notification_info<TRes>
      get notification_info =>
          CopyWith$Query$get_admin_info$mez_admin$notification_info.stub(_res);
  CopyWith$Query$get_admin_info$mez_admin$user<TRes> get user =>
      CopyWith$Query$get_admin_info$mez_admin$user.stub(_res);
}

class Query$get_admin_info$mez_admin$notification_info {
  Query$get_admin_info$mez_admin$notification_info({
    required this.token,
    required this.turn_off_notifications,
    required this.$__typename,
  });

  factory Query$get_admin_info$mez_admin$notification_info.fromJson(
      Map<String, dynamic> json) {
    final l$token = json['token'];
    final l$turn_off_notifications = json['turn_off_notifications'];
    final l$$__typename = json['__typename'];
    return Query$get_admin_info$mez_admin$notification_info(
      token: (l$token as String),
      turn_off_notifications: (l$turn_off_notifications as bool),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String token;

  final bool turn_off_notifications;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$token = token;
    _resultData['token'] = l$token;
    final l$turn_off_notifications = turn_off_notifications;
    _resultData['turn_off_notifications'] = l$turn_off_notifications;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$token = token;
    final l$turn_off_notifications = turn_off_notifications;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$token,
      l$turn_off_notifications,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_admin_info$mez_admin$notification_info) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$token = token;
    final lOther$token = other.token;
    if (l$token != lOther$token) {
      return false;
    }
    final l$turn_off_notifications = turn_off_notifications;
    final lOther$turn_off_notifications = other.turn_off_notifications;
    if (l$turn_off_notifications != lOther$turn_off_notifications) {
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

extension UtilityExtension$Query$get_admin_info$mez_admin$notification_info
    on Query$get_admin_info$mez_admin$notification_info {
  CopyWith$Query$get_admin_info$mez_admin$notification_info<
          Query$get_admin_info$mez_admin$notification_info>
      get copyWith => CopyWith$Query$get_admin_info$mez_admin$notification_info(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_admin_info$mez_admin$notification_info<TRes> {
  factory CopyWith$Query$get_admin_info$mez_admin$notification_info(
    Query$get_admin_info$mez_admin$notification_info instance,
    TRes Function(Query$get_admin_info$mez_admin$notification_info) then,
  ) = _CopyWithImpl$Query$get_admin_info$mez_admin$notification_info;

  factory CopyWith$Query$get_admin_info$mez_admin$notification_info.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_admin_info$mez_admin$notification_info;

  TRes call({
    String? token,
    bool? turn_off_notifications,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_admin_info$mez_admin$notification_info<TRes>
    implements CopyWith$Query$get_admin_info$mez_admin$notification_info<TRes> {
  _CopyWithImpl$Query$get_admin_info$mez_admin$notification_info(
    this._instance,
    this._then,
  );

  final Query$get_admin_info$mez_admin$notification_info _instance;

  final TRes Function(Query$get_admin_info$mez_admin$notification_info) _then;

  static const _undefined = {};

  TRes call({
    Object? token = _undefined,
    Object? turn_off_notifications = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_admin_info$mez_admin$notification_info(
        token: token == _undefined || token == null
            ? _instance.token
            : (token as String),
        turn_off_notifications: turn_off_notifications == _undefined ||
                turn_off_notifications == null
            ? _instance.turn_off_notifications
            : (turn_off_notifications as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_admin_info$mez_admin$notification_info<TRes>
    implements CopyWith$Query$get_admin_info$mez_admin$notification_info<TRes> {
  _CopyWithStubImpl$Query$get_admin_info$mez_admin$notification_info(this._res);

  TRes _res;

  call({
    String? token,
    bool? turn_off_notifications,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_admin_info$mez_admin$user {
  Query$get_admin_info$mez_admin$user({
    required this.id,
    this.name,
    this.image,
    this.email,
    this.phone,
    required this.language_id,
    required this.$__typename,
  });

  factory Query$get_admin_info$mez_admin$user.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$image = json['image'];
    final l$email = json['email'];
    final l$phone = json['phone'];
    final l$language_id = json['language_id'];
    final l$$__typename = json['__typename'];
    return Query$get_admin_info$mez_admin$user(
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
    if (!(other is Query$get_admin_info$mez_admin$user) ||
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

extension UtilityExtension$Query$get_admin_info$mez_admin$user
    on Query$get_admin_info$mez_admin$user {
  CopyWith$Query$get_admin_info$mez_admin$user<
          Query$get_admin_info$mez_admin$user>
      get copyWith => CopyWith$Query$get_admin_info$mez_admin$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_admin_info$mez_admin$user<TRes> {
  factory CopyWith$Query$get_admin_info$mez_admin$user(
    Query$get_admin_info$mez_admin$user instance,
    TRes Function(Query$get_admin_info$mez_admin$user) then,
  ) = _CopyWithImpl$Query$get_admin_info$mez_admin$user;

  factory CopyWith$Query$get_admin_info$mez_admin$user.stub(TRes res) =
      _CopyWithStubImpl$Query$get_admin_info$mez_admin$user;

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

class _CopyWithImpl$Query$get_admin_info$mez_admin$user<TRes>
    implements CopyWith$Query$get_admin_info$mez_admin$user<TRes> {
  _CopyWithImpl$Query$get_admin_info$mez_admin$user(
    this._instance,
    this._then,
  );

  final Query$get_admin_info$mez_admin$user _instance;

  final TRes Function(Query$get_admin_info$mez_admin$user) _then;

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
      _then(Query$get_admin_info$mez_admin$user(
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

class _CopyWithStubImpl$Query$get_admin_info$mez_admin$user<TRes>
    implements CopyWith$Query$get_admin_info$mez_admin$user<TRes> {
  _CopyWithStubImpl$Query$get_admin_info$mez_admin$user(this._res);

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

class Variables$Mutation$set_service_status {
  factory Variables$Mutation$set_service_status({
    required int id,
    required String status,
  }) =>
      Variables$Mutation$set_service_status._({
        r'id': id,
        r'status': status,
      });

  Variables$Mutation$set_service_status._(this._$data);

  factory Variables$Mutation$set_service_status.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    final l$status = data['status'];
    result$data['status'] = (l$status as String);
    return Variables$Mutation$set_service_status._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  String get status => (_$data['status'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$status = status;
    result$data['status'] = l$status;
    return result$data;
  }

  CopyWith$Variables$Mutation$set_service_status<
          Variables$Mutation$set_service_status>
      get copyWith => CopyWith$Variables$Mutation$set_service_status(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$set_service_status) ||
        runtimeType != other.runtimeType) {
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
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$status = status;
    return Object.hashAll([
      l$id,
      l$status,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$set_service_status<TRes> {
  factory CopyWith$Variables$Mutation$set_service_status(
    Variables$Mutation$set_service_status instance,
    TRes Function(Variables$Mutation$set_service_status) then,
  ) = _CopyWithImpl$Variables$Mutation$set_service_status;

  factory CopyWith$Variables$Mutation$set_service_status.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$set_service_status;

  TRes call({
    int? id,
    String? status,
  });
}

class _CopyWithImpl$Variables$Mutation$set_service_status<TRes>
    implements CopyWith$Variables$Mutation$set_service_status<TRes> {
  _CopyWithImpl$Variables$Mutation$set_service_status(
    this._instance,
    this._then,
  );

  final Variables$Mutation$set_service_status _instance;

  final TRes Function(Variables$Mutation$set_service_status) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? status = _undefined,
  }) =>
      _then(Variables$Mutation$set_service_status._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
        if (status != _undefined && status != null)
          'status': (status as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$set_service_status<TRes>
    implements CopyWith$Variables$Mutation$set_service_status<TRes> {
  _CopyWithStubImpl$Variables$Mutation$set_service_status(this._res);

  TRes _res;

  call({
    int? id,
    String? status,
  }) =>
      _res;
}

class Mutation$set_service_status {
  Mutation$set_service_status({
    this.update_restaurant_restaurant,
    required this.$__typename,
  });

  factory Mutation$set_service_status.fromJson(Map<String, dynamic> json) {
    final l$update_restaurant_restaurant = json['update_restaurant_restaurant'];
    final l$$__typename = json['__typename'];
    return Mutation$set_service_status(
      update_restaurant_restaurant: l$update_restaurant_restaurant == null
          ? null
          : Mutation$set_service_status$update_restaurant_restaurant.fromJson(
              (l$update_restaurant_restaurant as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$set_service_status$update_restaurant_restaurant?
      update_restaurant_restaurant;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_restaurant_restaurant = update_restaurant_restaurant;
    _resultData['update_restaurant_restaurant'] =
        l$update_restaurant_restaurant?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_restaurant_restaurant = update_restaurant_restaurant;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_restaurant_restaurant,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$set_service_status) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_restaurant_restaurant = update_restaurant_restaurant;
    final lOther$update_restaurant_restaurant =
        other.update_restaurant_restaurant;
    if (l$update_restaurant_restaurant != lOther$update_restaurant_restaurant) {
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

extension UtilityExtension$Mutation$set_service_status
    on Mutation$set_service_status {
  CopyWith$Mutation$set_service_status<Mutation$set_service_status>
      get copyWith => CopyWith$Mutation$set_service_status(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$set_service_status<TRes> {
  factory CopyWith$Mutation$set_service_status(
    Mutation$set_service_status instance,
    TRes Function(Mutation$set_service_status) then,
  ) = _CopyWithImpl$Mutation$set_service_status;

  factory CopyWith$Mutation$set_service_status.stub(TRes res) =
      _CopyWithStubImpl$Mutation$set_service_status;

  TRes call({
    Mutation$set_service_status$update_restaurant_restaurant?
        update_restaurant_restaurant,
    String? $__typename,
  });
  CopyWith$Mutation$set_service_status$update_restaurant_restaurant<TRes>
      get update_restaurant_restaurant;
}

class _CopyWithImpl$Mutation$set_service_status<TRes>
    implements CopyWith$Mutation$set_service_status<TRes> {
  _CopyWithImpl$Mutation$set_service_status(
    this._instance,
    this._then,
  );

  final Mutation$set_service_status _instance;

  final TRes Function(Mutation$set_service_status) _then;

  static const _undefined = {};

  TRes call({
    Object? update_restaurant_restaurant = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$set_service_status(
        update_restaurant_restaurant: update_restaurant_restaurant == _undefined
            ? _instance.update_restaurant_restaurant
            : (update_restaurant_restaurant
                as Mutation$set_service_status$update_restaurant_restaurant?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$set_service_status$update_restaurant_restaurant<TRes>
      get update_restaurant_restaurant {
    final local$update_restaurant_restaurant =
        _instance.update_restaurant_restaurant;
    return local$update_restaurant_restaurant == null
        ? CopyWith$Mutation$set_service_status$update_restaurant_restaurant
            .stub(_then(_instance))
        : CopyWith$Mutation$set_service_status$update_restaurant_restaurant(
            local$update_restaurant_restaurant,
            (e) => call(update_restaurant_restaurant: e));
  }
}

class _CopyWithStubImpl$Mutation$set_service_status<TRes>
    implements CopyWith$Mutation$set_service_status<TRes> {
  _CopyWithStubImpl$Mutation$set_service_status(this._res);

  TRes _res;

  call({
    Mutation$set_service_status$update_restaurant_restaurant?
        update_restaurant_restaurant,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$set_service_status$update_restaurant_restaurant<TRes>
      get update_restaurant_restaurant =>
          CopyWith$Mutation$set_service_status$update_restaurant_restaurant
              .stub(_res);
}

const documentNodeMutationset_service_status = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'set_service_status'),
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
        variable: VariableNode(name: NameNode(value: 'status')),
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
        name: NameNode(value: 'update_restaurant_restaurant'),
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
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: '_set'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'open_status'),
                value: VariableNode(name: NameNode(value: 'status')),
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
                name: NameNode(value: 'open_status'),
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
Mutation$set_service_status _parserFn$Mutation$set_service_status(
        Map<String, dynamic> data) =>
    Mutation$set_service_status.fromJson(data);
typedef OnMutationCompleted$Mutation$set_service_status = FutureOr<void>
    Function(
  dynamic,
  Mutation$set_service_status?,
);

class Options$Mutation$set_service_status
    extends graphql.MutationOptions<Mutation$set_service_status> {
  Options$Mutation$set_service_status({
    String? operationName,
    required Variables$Mutation$set_service_status variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$set_service_status? onCompleted,
    graphql.OnMutationUpdate<Mutation$set_service_status>? update,
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
                        : _parserFn$Mutation$set_service_status(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationset_service_status,
          parserFn: _parserFn$Mutation$set_service_status,
        );

  final OnMutationCompleted$Mutation$set_service_status? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$set_service_status
    extends graphql.WatchQueryOptions<Mutation$set_service_status> {
  WatchOptions$Mutation$set_service_status({
    String? operationName,
    required Variables$Mutation$set_service_status variables,
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
          document: documentNodeMutationset_service_status,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$set_service_status,
        );
}

extension ClientExtension$Mutation$set_service_status on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$set_service_status>>
      mutate$set_service_status(
              Options$Mutation$set_service_status options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$set_service_status>
      watchMutation$set_service_status(
              WatchOptions$Mutation$set_service_status options) =>
          this.watchMutation(options);
}

class Mutation$set_service_status$update_restaurant_restaurant {
  Mutation$set_service_status$update_restaurant_restaurant({
    required this.returning,
    required this.$__typename,
  });

  factory Mutation$set_service_status$update_restaurant_restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$returning = json['returning'];
    final l$$__typename = json['__typename'];
    return Mutation$set_service_status$update_restaurant_restaurant(
      returning: (l$returning as List<dynamic>)
          .map((e) =>
              Mutation$set_service_status$update_restaurant_restaurant$returning
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Mutation$set_service_status$update_restaurant_restaurant$returning>
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
    if (!(other is Mutation$set_service_status$update_restaurant_restaurant) ||
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

extension UtilityExtension$Mutation$set_service_status$update_restaurant_restaurant
    on Mutation$set_service_status$update_restaurant_restaurant {
  CopyWith$Mutation$set_service_status$update_restaurant_restaurant<
          Mutation$set_service_status$update_restaurant_restaurant>
      get copyWith =>
          CopyWith$Mutation$set_service_status$update_restaurant_restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$set_service_status$update_restaurant_restaurant<
    TRes> {
  factory CopyWith$Mutation$set_service_status$update_restaurant_restaurant(
    Mutation$set_service_status$update_restaurant_restaurant instance,
    TRes Function(Mutation$set_service_status$update_restaurant_restaurant)
        then,
  ) = _CopyWithImpl$Mutation$set_service_status$update_restaurant_restaurant;

  factory CopyWith$Mutation$set_service_status$update_restaurant_restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$set_service_status$update_restaurant_restaurant;

  TRes call({
    List<Mutation$set_service_status$update_restaurant_restaurant$returning>?
        returning,
    String? $__typename,
  });
  TRes returning(
      Iterable<Mutation$set_service_status$update_restaurant_restaurant$returning> Function(
              Iterable<
                  CopyWith$Mutation$set_service_status$update_restaurant_restaurant$returning<
                      Mutation$set_service_status$update_restaurant_restaurant$returning>>)
          _fn);
}

class _CopyWithImpl$Mutation$set_service_status$update_restaurant_restaurant<
        TRes>
    implements
        CopyWith$Mutation$set_service_status$update_restaurant_restaurant<
            TRes> {
  _CopyWithImpl$Mutation$set_service_status$update_restaurant_restaurant(
    this._instance,
    this._then,
  );

  final Mutation$set_service_status$update_restaurant_restaurant _instance;

  final TRes Function(Mutation$set_service_status$update_restaurant_restaurant)
      _then;

  static const _undefined = {};

  TRes call({
    Object? returning = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$set_service_status$update_restaurant_restaurant(
        returning: returning == _undefined || returning == null
            ? _instance.returning
            : (returning as List<
                Mutation$set_service_status$update_restaurant_restaurant$returning>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes returning(
          Iterable<Mutation$set_service_status$update_restaurant_restaurant$returning> Function(
                  Iterable<
                      CopyWith$Mutation$set_service_status$update_restaurant_restaurant$returning<
                          Mutation$set_service_status$update_restaurant_restaurant$returning>>)
              _fn) =>
      call(
          returning: _fn(_instance.returning.map((e) =>
              CopyWith$Mutation$set_service_status$update_restaurant_restaurant$returning(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Mutation$set_service_status$update_restaurant_restaurant<
        TRes>
    implements
        CopyWith$Mutation$set_service_status$update_restaurant_restaurant<
            TRes> {
  _CopyWithStubImpl$Mutation$set_service_status$update_restaurant_restaurant(
      this._res);

  TRes _res;

  call({
    List<Mutation$set_service_status$update_restaurant_restaurant$returning>?
        returning,
    String? $__typename,
  }) =>
      _res;
  returning(_fn) => _res;
}

class Mutation$set_service_status$update_restaurant_restaurant$returning {
  Mutation$set_service_status$update_restaurant_restaurant$returning({
    required this.open_status,
    required this.$__typename,
  });

  factory Mutation$set_service_status$update_restaurant_restaurant$returning.fromJson(
      Map<String, dynamic> json) {
    final l$open_status = json['open_status'];
    final l$$__typename = json['__typename'];
    return Mutation$set_service_status$update_restaurant_restaurant$returning(
      open_status: (l$open_status as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String open_status;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$open_status = open_status;
    _resultData['open_status'] = l$open_status;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$open_status = open_status;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$open_status,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$set_service_status$update_restaurant_restaurant$returning) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$open_status = open_status;
    final lOther$open_status = other.open_status;
    if (l$open_status != lOther$open_status) {
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

extension UtilityExtension$Mutation$set_service_status$update_restaurant_restaurant$returning
    on Mutation$set_service_status$update_restaurant_restaurant$returning {
  CopyWith$Mutation$set_service_status$update_restaurant_restaurant$returning<
          Mutation$set_service_status$update_restaurant_restaurant$returning>
      get copyWith =>
          CopyWith$Mutation$set_service_status$update_restaurant_restaurant$returning(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$set_service_status$update_restaurant_restaurant$returning<
    TRes> {
  factory CopyWith$Mutation$set_service_status$update_restaurant_restaurant$returning(
    Mutation$set_service_status$update_restaurant_restaurant$returning instance,
    TRes Function(
            Mutation$set_service_status$update_restaurant_restaurant$returning)
        then,
  ) = _CopyWithImpl$Mutation$set_service_status$update_restaurant_restaurant$returning;

  factory CopyWith$Mutation$set_service_status$update_restaurant_restaurant$returning.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$set_service_status$update_restaurant_restaurant$returning;

  TRes call({
    String? open_status,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$set_service_status$update_restaurant_restaurant$returning<
        TRes>
    implements
        CopyWith$Mutation$set_service_status$update_restaurant_restaurant$returning<
            TRes> {
  _CopyWithImpl$Mutation$set_service_status$update_restaurant_restaurant$returning(
    this._instance,
    this._then,
  );

  final Mutation$set_service_status$update_restaurant_restaurant$returning
      _instance;

  final TRes Function(
      Mutation$set_service_status$update_restaurant_restaurant$returning) _then;

  static const _undefined = {};

  TRes call({
    Object? open_status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$set_service_status$update_restaurant_restaurant$returning(
        open_status: open_status == _undefined || open_status == null
            ? _instance.open_status
            : (open_status as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$set_service_status$update_restaurant_restaurant$returning<
        TRes>
    implements
        CopyWith$Mutation$set_service_status$update_restaurant_restaurant$returning<
            TRes> {
  _CopyWithStubImpl$Mutation$set_service_status$update_restaurant_restaurant$returning(
      this._res);

  TRes _res;

  call({
    String? open_status,
    String? $__typename,
  }) =>
      _res;
}
