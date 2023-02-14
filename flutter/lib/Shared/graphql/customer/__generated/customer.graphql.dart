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
    this.update_customer_customer_by_pk,
    required this.$__typename,
  });

  factory Mutation$set_customer_app_version.fromJson(
      Map<String, dynamic> json) {
    final l$update_customer_customer_by_pk =
        json['update_customer_customer_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$set_customer_app_version(
      update_customer_customer_by_pk: l$update_customer_customer_by_pk == null
          ? null
          : Mutation$set_customer_app_version$update_customer_customer_by_pk
              .fromJson(
                  (l$update_customer_customer_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$set_customer_app_version$update_customer_customer_by_pk?
      update_customer_customer_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_customer_customer_by_pk = update_customer_customer_by_pk;
    _resultData['update_customer_customer_by_pk'] =
        l$update_customer_customer_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_customer_customer_by_pk = update_customer_customer_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_customer_customer_by_pk,
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
    final l$update_customer_customer_by_pk = update_customer_customer_by_pk;
    final lOther$update_customer_customer_by_pk =
        other.update_customer_customer_by_pk;
    if (l$update_customer_customer_by_pk !=
        lOther$update_customer_customer_by_pk) {
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
    Mutation$set_customer_app_version$update_customer_customer_by_pk?
        update_customer_customer_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$set_customer_app_version$update_customer_customer_by_pk<
      TRes> get update_customer_customer_by_pk;
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
    Object? update_customer_customer_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$set_customer_app_version(
        update_customer_customer_by_pk: update_customer_customer_by_pk ==
                _undefined
            ? _instance.update_customer_customer_by_pk
            : (update_customer_customer_by_pk
                as Mutation$set_customer_app_version$update_customer_customer_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$set_customer_app_version$update_customer_customer_by_pk<
      TRes> get update_customer_customer_by_pk {
    final local$update_customer_customer_by_pk =
        _instance.update_customer_customer_by_pk;
    return local$update_customer_customer_by_pk == null
        ? CopyWith$Mutation$set_customer_app_version$update_customer_customer_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$set_customer_app_version$update_customer_customer_by_pk(
            local$update_customer_customer_by_pk,
            (e) => call(update_customer_customer_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$set_customer_app_version<TRes>
    implements CopyWith$Mutation$set_customer_app_version<TRes> {
  _CopyWithStubImpl$Mutation$set_customer_app_version(this._res);

  TRes _res;

  call({
    Mutation$set_customer_app_version$update_customer_customer_by_pk?
        update_customer_customer_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$set_customer_app_version$update_customer_customer_by_pk<
          TRes>
      get update_customer_customer_by_pk =>
          CopyWith$Mutation$set_customer_app_version$update_customer_customer_by_pk
              .stub(_res);
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
        name: NameNode(value: 'update_customer_customer_by_pk'),
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

class Mutation$set_customer_app_version$update_customer_customer_by_pk {
  Mutation$set_customer_app_version$update_customer_customer_by_pk({
    this.app_version,
    required this.$__typename,
  });

  factory Mutation$set_customer_app_version$update_customer_customer_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$app_version = json['app_version'];
    final l$$__typename = json['__typename'];
    return Mutation$set_customer_app_version$update_customer_customer_by_pk(
      app_version: (l$app_version as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? app_version;

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
    if (!(other
            is Mutation$set_customer_app_version$update_customer_customer_by_pk) ||
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

extension UtilityExtension$Mutation$set_customer_app_version$update_customer_customer_by_pk
    on Mutation$set_customer_app_version$update_customer_customer_by_pk {
  CopyWith$Mutation$set_customer_app_version$update_customer_customer_by_pk<
          Mutation$set_customer_app_version$update_customer_customer_by_pk>
      get copyWith =>
          CopyWith$Mutation$set_customer_app_version$update_customer_customer_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$set_customer_app_version$update_customer_customer_by_pk<
    TRes> {
  factory CopyWith$Mutation$set_customer_app_version$update_customer_customer_by_pk(
    Mutation$set_customer_app_version$update_customer_customer_by_pk instance,
    TRes Function(
            Mutation$set_customer_app_version$update_customer_customer_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$set_customer_app_version$update_customer_customer_by_pk;

  factory CopyWith$Mutation$set_customer_app_version$update_customer_customer_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$set_customer_app_version$update_customer_customer_by_pk;

  TRes call({
    String? app_version,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$set_customer_app_version$update_customer_customer_by_pk<
        TRes>
    implements
        CopyWith$Mutation$set_customer_app_version$update_customer_customer_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$set_customer_app_version$update_customer_customer_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$set_customer_app_version$update_customer_customer_by_pk
      _instance;

  final TRes Function(
      Mutation$set_customer_app_version$update_customer_customer_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? app_version = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$set_customer_app_version$update_customer_customer_by_pk(
        app_version: app_version == _undefined
            ? _instance.app_version
            : (app_version as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$set_customer_app_version$update_customer_customer_by_pk<
        TRes>
    implements
        CopyWith$Mutation$set_customer_app_version$update_customer_customer_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$set_customer_app_version$update_customer_customer_by_pk(
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
    required this.customer_customer,
    required this.$__typename,
  });

  factory Query$get_customer_info.fromJson(Map<String, dynamic> json) {
    final l$customer_customer = json['customer_customer'];
    final l$$__typename = json['__typename'];
    return Query$get_customer_info(
      customer_customer: (l$customer_customer as List<dynamic>)
          .map((e) => Query$get_customer_info$customer_customer.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$get_customer_info$customer_customer> customer_customer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$customer_customer = customer_customer;
    _resultData['customer_customer'] =
        l$customer_customer.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$customer_customer = customer_customer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$customer_customer.map((v) => v)),
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
    final l$customer_customer = customer_customer;
    final lOther$customer_customer = other.customer_customer;
    if (l$customer_customer.length != lOther$customer_customer.length) {
      return false;
    }
    for (int i = 0; i < l$customer_customer.length; i++) {
      final l$customer_customer$entry = l$customer_customer[i];
      final lOther$customer_customer$entry = lOther$customer_customer[i];
      if (l$customer_customer$entry != lOther$customer_customer$entry) {
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
    List<Query$get_customer_info$customer_customer>? customer_customer,
    String? $__typename,
  });
  TRes customer_customer(
      Iterable<Query$get_customer_info$customer_customer> Function(
              Iterable<
                  CopyWith$Query$get_customer_info$customer_customer<
                      Query$get_customer_info$customer_customer>>)
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
    Object? customer_customer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_customer_info(
        customer_customer:
            customer_customer == _undefined || customer_customer == null
                ? _instance.customer_customer
                : (customer_customer
                    as List<Query$get_customer_info$customer_customer>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes customer_customer(
          Iterable<Query$get_customer_info$customer_customer> Function(
                  Iterable<
                      CopyWith$Query$get_customer_info$customer_customer<
                          Query$get_customer_info$customer_customer>>)
              _fn) =>
      call(
          customer_customer: _fn(_instance.customer_customer
              .map((e) => CopyWith$Query$get_customer_info$customer_customer(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$get_customer_info<TRes>
    implements CopyWith$Query$get_customer_info<TRes> {
  _CopyWithStubImpl$Query$get_customer_info(this._res);

  TRes _res;

  call({
    List<Query$get_customer_info$customer_customer>? customer_customer,
    String? $__typename,
  }) =>
      _res;
  customer_customer(_fn) => _res;
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
        name: NameNode(value: 'customer_customer'),
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
            name: NameNode(value: 'stripe_info'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
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

class Query$get_customer_info$customer_customer {
  Query$get_customer_info$customer_customer({
    this.app_version,
    this.notification_info,
    required this.user,
    this.stripe_info,
    required this.saved_locations,
    required this.$__typename,
  });

  factory Query$get_customer_info$customer_customer.fromJson(
      Map<String, dynamic> json) {
    final l$app_version = json['app_version'];
    final l$notification_info = json['notification_info'];
    final l$user = json['user'];
    final l$stripe_info = json['stripe_info'];
    final l$saved_locations = json['saved_locations'];
    final l$$__typename = json['__typename'];
    return Query$get_customer_info$customer_customer(
      app_version: (l$app_version as String?),
      notification_info: l$notification_info == null
          ? null
          : Query$get_customer_info$customer_customer$notification_info
              .fromJson((l$notification_info as Map<String, dynamic>)),
      user: Query$get_customer_info$customer_customer$user.fromJson(
          (l$user as Map<String, dynamic>)),
      stripe_info: l$stripe_info == null ? null : mapFromJson(l$stripe_info),
      saved_locations: (l$saved_locations as List<dynamic>)
          .map((e) => Query$get_customer_info$customer_customer$saved_locations
              .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? app_version;

  final Query$get_customer_info$customer_customer$notification_info?
      notification_info;

  final Query$get_customer_info$customer_customer$user user;

  final dynamic? stripe_info;

  final List<Query$get_customer_info$customer_customer$saved_locations>
      saved_locations;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$app_version = app_version;
    _resultData['app_version'] = l$app_version;
    final l$notification_info = notification_info;
    _resultData['notification_info'] = l$notification_info?.toJson();
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$stripe_info = stripe_info;
    _resultData['stripe_info'] =
        l$stripe_info == null ? null : mapToJson(l$stripe_info);
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
    final l$notification_info = notification_info;
    final l$user = user;
    final l$stripe_info = stripe_info;
    final l$saved_locations = saved_locations;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$app_version,
      l$notification_info,
      l$user,
      l$stripe_info,
      Object.hashAll(l$saved_locations.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_customer_info$customer_customer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$app_version = app_version;
    final lOther$app_version = other.app_version;
    if (l$app_version != lOther$app_version) {
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
    final l$stripe_info = stripe_info;
    final lOther$stripe_info = other.stripe_info;
    if (l$stripe_info != lOther$stripe_info) {
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

extension UtilityExtension$Query$get_customer_info$customer_customer
    on Query$get_customer_info$customer_customer {
  CopyWith$Query$get_customer_info$customer_customer<
          Query$get_customer_info$customer_customer>
      get copyWith => CopyWith$Query$get_customer_info$customer_customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_customer_info$customer_customer<TRes> {
  factory CopyWith$Query$get_customer_info$customer_customer(
    Query$get_customer_info$customer_customer instance,
    TRes Function(Query$get_customer_info$customer_customer) then,
  ) = _CopyWithImpl$Query$get_customer_info$customer_customer;

  factory CopyWith$Query$get_customer_info$customer_customer.stub(TRes res) =
      _CopyWithStubImpl$Query$get_customer_info$customer_customer;

  TRes call({
    String? app_version,
    Query$get_customer_info$customer_customer$notification_info?
        notification_info,
    Query$get_customer_info$customer_customer$user? user,
    dynamic? stripe_info,
    List<Query$get_customer_info$customer_customer$saved_locations>?
        saved_locations,
    String? $__typename,
  });
  CopyWith$Query$get_customer_info$customer_customer$notification_info<TRes>
      get notification_info;
  CopyWith$Query$get_customer_info$customer_customer$user<TRes> get user;
  TRes saved_locations(
      Iterable<Query$get_customer_info$customer_customer$saved_locations> Function(
              Iterable<
                  CopyWith$Query$get_customer_info$customer_customer$saved_locations<
                      Query$get_customer_info$customer_customer$saved_locations>>)
          _fn);
}

class _CopyWithImpl$Query$get_customer_info$customer_customer<TRes>
    implements CopyWith$Query$get_customer_info$customer_customer<TRes> {
  _CopyWithImpl$Query$get_customer_info$customer_customer(
    this._instance,
    this._then,
  );

  final Query$get_customer_info$customer_customer _instance;

  final TRes Function(Query$get_customer_info$customer_customer) _then;

  static const _undefined = {};

  TRes call({
    Object? app_version = _undefined,
    Object? notification_info = _undefined,
    Object? user = _undefined,
    Object? stripe_info = _undefined,
    Object? saved_locations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_customer_info$customer_customer(
        app_version: app_version == _undefined
            ? _instance.app_version
            : (app_version as String?),
        notification_info: notification_info == _undefined
            ? _instance.notification_info
            : (notification_info
                as Query$get_customer_info$customer_customer$notification_info?),
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Query$get_customer_info$customer_customer$user),
        stripe_info: stripe_info == _undefined
            ? _instance.stripe_info
            : (stripe_info as dynamic?),
        saved_locations:
            saved_locations == _undefined || saved_locations == null
                ? _instance.saved_locations
                : (saved_locations as List<
                    Query$get_customer_info$customer_customer$saved_locations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_customer_info$customer_customer$notification_info<TRes>
      get notification_info {
    final local$notification_info = _instance.notification_info;
    return local$notification_info == null
        ? CopyWith$Query$get_customer_info$customer_customer$notification_info
            .stub(_then(_instance))
        : CopyWith$Query$get_customer_info$customer_customer$notification_info(
            local$notification_info, (e) => call(notification_info: e));
  }

  CopyWith$Query$get_customer_info$customer_customer$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$get_customer_info$customer_customer$user(
        local$user, (e) => call(user: e));
  }

  TRes saved_locations(
          Iterable<Query$get_customer_info$customer_customer$saved_locations> Function(
                  Iterable<
                      CopyWith$Query$get_customer_info$customer_customer$saved_locations<
                          Query$get_customer_info$customer_customer$saved_locations>>)
              _fn) =>
      call(
          saved_locations: _fn(_instance.saved_locations.map((e) =>
              CopyWith$Query$get_customer_info$customer_customer$saved_locations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_customer_info$customer_customer<TRes>
    implements CopyWith$Query$get_customer_info$customer_customer<TRes> {
  _CopyWithStubImpl$Query$get_customer_info$customer_customer(this._res);

  TRes _res;

  call({
    String? app_version,
    Query$get_customer_info$customer_customer$notification_info?
        notification_info,
    Query$get_customer_info$customer_customer$user? user,
    dynamic? stripe_info,
    List<Query$get_customer_info$customer_customer$saved_locations>?
        saved_locations,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_customer_info$customer_customer$notification_info<TRes>
      get notification_info =>
          CopyWith$Query$get_customer_info$customer_customer$notification_info
              .stub(_res);
  CopyWith$Query$get_customer_info$customer_customer$user<TRes> get user =>
      CopyWith$Query$get_customer_info$customer_customer$user.stub(_res);
  saved_locations(_fn) => _res;
}

class Query$get_customer_info$customer_customer$notification_info {
  Query$get_customer_info$customer_customer$notification_info({
    required this.token,
    required this.turn_off_notifications,
    required this.$__typename,
  });

  factory Query$get_customer_info$customer_customer$notification_info.fromJson(
      Map<String, dynamic> json) {
    final l$token = json['token'];
    final l$turn_off_notifications = json['turn_off_notifications'];
    final l$$__typename = json['__typename'];
    return Query$get_customer_info$customer_customer$notification_info(
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
    if (!(other
            is Query$get_customer_info$customer_customer$notification_info) ||
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

extension UtilityExtension$Query$get_customer_info$customer_customer$notification_info
    on Query$get_customer_info$customer_customer$notification_info {
  CopyWith$Query$get_customer_info$customer_customer$notification_info<
          Query$get_customer_info$customer_customer$notification_info>
      get copyWith =>
          CopyWith$Query$get_customer_info$customer_customer$notification_info(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_customer_info$customer_customer$notification_info<
    TRes> {
  factory CopyWith$Query$get_customer_info$customer_customer$notification_info(
    Query$get_customer_info$customer_customer$notification_info instance,
    TRes Function(Query$get_customer_info$customer_customer$notification_info)
        then,
  ) = _CopyWithImpl$Query$get_customer_info$customer_customer$notification_info;

  factory CopyWith$Query$get_customer_info$customer_customer$notification_info.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_customer_info$customer_customer$notification_info;

  TRes call({
    String? token,
    bool? turn_off_notifications,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_customer_info$customer_customer$notification_info<
        TRes>
    implements
        CopyWith$Query$get_customer_info$customer_customer$notification_info<
            TRes> {
  _CopyWithImpl$Query$get_customer_info$customer_customer$notification_info(
    this._instance,
    this._then,
  );

  final Query$get_customer_info$customer_customer$notification_info _instance;

  final TRes Function(
      Query$get_customer_info$customer_customer$notification_info) _then;

  static const _undefined = {};

  TRes call({
    Object? token = _undefined,
    Object? turn_off_notifications = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_customer_info$customer_customer$notification_info(
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

class _CopyWithStubImpl$Query$get_customer_info$customer_customer$notification_info<
        TRes>
    implements
        CopyWith$Query$get_customer_info$customer_customer$notification_info<
            TRes> {
  _CopyWithStubImpl$Query$get_customer_info$customer_customer$notification_info(
      this._res);

  TRes _res;

  call({
    String? token,
    bool? turn_off_notifications,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_customer_info$customer_customer$user {
  Query$get_customer_info$customer_customer$user({
    required this.id,
    this.name,
    this.image,
    this.email,
    this.phone,
    required this.language_id,
    required this.$__typename,
  });

  factory Query$get_customer_info$customer_customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$image = json['image'];
    final l$email = json['email'];
    final l$phone = json['phone'];
    final l$language_id = json['language_id'];
    final l$$__typename = json['__typename'];
    return Query$get_customer_info$customer_customer$user(
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
    if (!(other is Query$get_customer_info$customer_customer$user) ||
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

extension UtilityExtension$Query$get_customer_info$customer_customer$user
    on Query$get_customer_info$customer_customer$user {
  CopyWith$Query$get_customer_info$customer_customer$user<
          Query$get_customer_info$customer_customer$user>
      get copyWith => CopyWith$Query$get_customer_info$customer_customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_customer_info$customer_customer$user<TRes> {
  factory CopyWith$Query$get_customer_info$customer_customer$user(
    Query$get_customer_info$customer_customer$user instance,
    TRes Function(Query$get_customer_info$customer_customer$user) then,
  ) = _CopyWithImpl$Query$get_customer_info$customer_customer$user;

  factory CopyWith$Query$get_customer_info$customer_customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_customer_info$customer_customer$user;

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

class _CopyWithImpl$Query$get_customer_info$customer_customer$user<TRes>
    implements CopyWith$Query$get_customer_info$customer_customer$user<TRes> {
  _CopyWithImpl$Query$get_customer_info$customer_customer$user(
    this._instance,
    this._then,
  );

  final Query$get_customer_info$customer_customer$user _instance;

  final TRes Function(Query$get_customer_info$customer_customer$user) _then;

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
      _then(Query$get_customer_info$customer_customer$user(
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

class _CopyWithStubImpl$Query$get_customer_info$customer_customer$user<TRes>
    implements CopyWith$Query$get_customer_info$customer_customer$user<TRes> {
  _CopyWithStubImpl$Query$get_customer_info$customer_customer$user(this._res);

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

class Query$get_customer_info$customer_customer$saved_locations {
  Query$get_customer_info$customer_customer$saved_locations({
    required this.id,
    required this.name,
    required this.location_gps,
    required this.location_text,
    required this.$default,
    required this.$__typename,
  });

  factory Query$get_customer_info$customer_customer$saved_locations.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$location_gps = json['location_gps'];
    final l$location_text = json['location_text'];
    final l$$default = json['default'];
    final l$$__typename = json['__typename'];
    return Query$get_customer_info$customer_customer$saved_locations(
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
    if (!(other is Query$get_customer_info$customer_customer$saved_locations) ||
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

extension UtilityExtension$Query$get_customer_info$customer_customer$saved_locations
    on Query$get_customer_info$customer_customer$saved_locations {
  CopyWith$Query$get_customer_info$customer_customer$saved_locations<
          Query$get_customer_info$customer_customer$saved_locations>
      get copyWith =>
          CopyWith$Query$get_customer_info$customer_customer$saved_locations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_customer_info$customer_customer$saved_locations<
    TRes> {
  factory CopyWith$Query$get_customer_info$customer_customer$saved_locations(
    Query$get_customer_info$customer_customer$saved_locations instance,
    TRes Function(Query$get_customer_info$customer_customer$saved_locations)
        then,
  ) = _CopyWithImpl$Query$get_customer_info$customer_customer$saved_locations;

  factory CopyWith$Query$get_customer_info$customer_customer$saved_locations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_customer_info$customer_customer$saved_locations;

  TRes call({
    int? id,
    String? name,
    Geography? location_gps,
    String? location_text,
    bool? $default,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_customer_info$customer_customer$saved_locations<
        TRes>
    implements
        CopyWith$Query$get_customer_info$customer_customer$saved_locations<
            TRes> {
  _CopyWithImpl$Query$get_customer_info$customer_customer$saved_locations(
    this._instance,
    this._then,
  );

  final Query$get_customer_info$customer_customer$saved_locations _instance;

  final TRes Function(Query$get_customer_info$customer_customer$saved_locations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? location_gps = _undefined,
    Object? location_text = _undefined,
    Object? $default = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_customer_info$customer_customer$saved_locations(
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

class _CopyWithStubImpl$Query$get_customer_info$customer_customer$saved_locations<
        TRes>
    implements
        CopyWith$Query$get_customer_info$customer_customer$saved_locations<
            TRes> {
  _CopyWithStubImpl$Query$get_customer_info$customer_customer$saved_locations(
      this._res);

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

class Variables$Query$get_customer_stripe_info {
  factory Variables$Query$get_customer_stripe_info(
          {required int customer_id}) =>
      Variables$Query$get_customer_stripe_info._({
        r'customer_id': customer_id,
      });

  Variables$Query$get_customer_stripe_info._(this._$data);

  factory Variables$Query$get_customer_stripe_info.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$customer_id = data['customer_id'];
    result$data['customer_id'] = (l$customer_id as int);
    return Variables$Query$get_customer_stripe_info._(result$data);
  }

  Map<String, dynamic> _$data;

  int get customer_id => (_$data['customer_id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$customer_id = customer_id;
    result$data['customer_id'] = l$customer_id;
    return result$data;
  }

  CopyWith$Variables$Query$get_customer_stripe_info<
          Variables$Query$get_customer_stripe_info>
      get copyWith => CopyWith$Variables$Query$get_customer_stripe_info(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_customer_stripe_info) ||
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

abstract class CopyWith$Variables$Query$get_customer_stripe_info<TRes> {
  factory CopyWith$Variables$Query$get_customer_stripe_info(
    Variables$Query$get_customer_stripe_info instance,
    TRes Function(Variables$Query$get_customer_stripe_info) then,
  ) = _CopyWithImpl$Variables$Query$get_customer_stripe_info;

  factory CopyWith$Variables$Query$get_customer_stripe_info.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$get_customer_stripe_info;

  TRes call({int? customer_id});
}

class _CopyWithImpl$Variables$Query$get_customer_stripe_info<TRes>
    implements CopyWith$Variables$Query$get_customer_stripe_info<TRes> {
  _CopyWithImpl$Variables$Query$get_customer_stripe_info(
    this._instance,
    this._then,
  );

  final Variables$Query$get_customer_stripe_info _instance;

  final TRes Function(Variables$Query$get_customer_stripe_info) _then;

  static const _undefined = {};

  TRes call({Object? customer_id = _undefined}) =>
      _then(Variables$Query$get_customer_stripe_info._({
        ..._instance._$data,
        if (customer_id != _undefined && customer_id != null)
          'customer_id': (customer_id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_customer_stripe_info<TRes>
    implements CopyWith$Variables$Query$get_customer_stripe_info<TRes> {
  _CopyWithStubImpl$Variables$Query$get_customer_stripe_info(this._res);

  TRes _res;

  call({int? customer_id}) => _res;
}

class Query$get_customer_stripe_info {
  Query$get_customer_stripe_info({
    required this.customer_customer,
    required this.$__typename,
  });

  factory Query$get_customer_stripe_info.fromJson(Map<String, dynamic> json) {
    final l$customer_customer = json['customer_customer'];
    final l$$__typename = json['__typename'];
    return Query$get_customer_stripe_info(
      customer_customer: (l$customer_customer as List<dynamic>)
          .map((e) => Query$get_customer_stripe_info$customer_customer.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$get_customer_stripe_info$customer_customer>
      customer_customer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$customer_customer = customer_customer;
    _resultData['customer_customer'] =
        l$customer_customer.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$customer_customer = customer_customer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$customer_customer.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_customer_stripe_info) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$customer_customer = customer_customer;
    final lOther$customer_customer = other.customer_customer;
    if (l$customer_customer.length != lOther$customer_customer.length) {
      return false;
    }
    for (int i = 0; i < l$customer_customer.length; i++) {
      final l$customer_customer$entry = l$customer_customer[i];
      final lOther$customer_customer$entry = lOther$customer_customer[i];
      if (l$customer_customer$entry != lOther$customer_customer$entry) {
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

extension UtilityExtension$Query$get_customer_stripe_info
    on Query$get_customer_stripe_info {
  CopyWith$Query$get_customer_stripe_info<Query$get_customer_stripe_info>
      get copyWith => CopyWith$Query$get_customer_stripe_info(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_customer_stripe_info<TRes> {
  factory CopyWith$Query$get_customer_stripe_info(
    Query$get_customer_stripe_info instance,
    TRes Function(Query$get_customer_stripe_info) then,
  ) = _CopyWithImpl$Query$get_customer_stripe_info;

  factory CopyWith$Query$get_customer_stripe_info.stub(TRes res) =
      _CopyWithStubImpl$Query$get_customer_stripe_info;

  TRes call({
    List<Query$get_customer_stripe_info$customer_customer>? customer_customer,
    String? $__typename,
  });
  TRes customer_customer(
      Iterable<Query$get_customer_stripe_info$customer_customer> Function(
              Iterable<
                  CopyWith$Query$get_customer_stripe_info$customer_customer<
                      Query$get_customer_stripe_info$customer_customer>>)
          _fn);
}

class _CopyWithImpl$Query$get_customer_stripe_info<TRes>
    implements CopyWith$Query$get_customer_stripe_info<TRes> {
  _CopyWithImpl$Query$get_customer_stripe_info(
    this._instance,
    this._then,
  );

  final Query$get_customer_stripe_info _instance;

  final TRes Function(Query$get_customer_stripe_info) _then;

  static const _undefined = {};

  TRes call({
    Object? customer_customer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_customer_stripe_info(
        customer_customer:
            customer_customer == _undefined || customer_customer == null
                ? _instance.customer_customer
                : (customer_customer
                    as List<Query$get_customer_stripe_info$customer_customer>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes customer_customer(
          Iterable<Query$get_customer_stripe_info$customer_customer> Function(
                  Iterable<
                      CopyWith$Query$get_customer_stripe_info$customer_customer<
                          Query$get_customer_stripe_info$customer_customer>>)
              _fn) =>
      call(
          customer_customer: _fn(_instance.customer_customer.map(
              (e) => CopyWith$Query$get_customer_stripe_info$customer_customer(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$get_customer_stripe_info<TRes>
    implements CopyWith$Query$get_customer_stripe_info<TRes> {
  _CopyWithStubImpl$Query$get_customer_stripe_info(this._res);

  TRes _res;

  call({
    List<Query$get_customer_stripe_info$customer_customer>? customer_customer,
    String? $__typename,
  }) =>
      _res;
  customer_customer(_fn) => _res;
}

const documentNodeQueryget_customer_stripe_info = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_customer_stripe_info'),
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
        name: NameNode(value: 'customer_customer'),
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
            name: NameNode(value: 'stripe_info'),
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
Query$get_customer_stripe_info _parserFn$Query$get_customer_stripe_info(
        Map<String, dynamic> data) =>
    Query$get_customer_stripe_info.fromJson(data);

class Options$Query$get_customer_stripe_info
    extends graphql.QueryOptions<Query$get_customer_stripe_info> {
  Options$Query$get_customer_stripe_info({
    String? operationName,
    required Variables$Query$get_customer_stripe_info variables,
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
          document: documentNodeQueryget_customer_stripe_info,
          parserFn: _parserFn$Query$get_customer_stripe_info,
        );
}

class WatchOptions$Query$get_customer_stripe_info
    extends graphql.WatchQueryOptions<Query$get_customer_stripe_info> {
  WatchOptions$Query$get_customer_stripe_info({
    String? operationName,
    required Variables$Query$get_customer_stripe_info variables,
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
          document: documentNodeQueryget_customer_stripe_info,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_customer_stripe_info,
        );
}

class FetchMoreOptions$Query$get_customer_stripe_info
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_customer_stripe_info({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_customer_stripe_info variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_customer_stripe_info,
        );
}

extension ClientExtension$Query$get_customer_stripe_info
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_customer_stripe_info>>
      query$get_customer_stripe_info(
              Options$Query$get_customer_stripe_info options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$get_customer_stripe_info>
      watchQuery$get_customer_stripe_info(
              WatchOptions$Query$get_customer_stripe_info options) =>
          this.watchQuery(options);
  void writeQuery$get_customer_stripe_info({
    required Query$get_customer_stripe_info data,
    required Variables$Query$get_customer_stripe_info variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryget_customer_stripe_info),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_customer_stripe_info? readQuery$get_customer_stripe_info({
    required Variables$Query$get_customer_stripe_info variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryget_customer_stripe_info),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$get_customer_stripe_info.fromJson(result);
  }
}

class Query$get_customer_stripe_info$customer_customer {
  Query$get_customer_stripe_info$customer_customer({
    this.stripe_info,
    required this.$__typename,
  });

  factory Query$get_customer_stripe_info$customer_customer.fromJson(
      Map<String, dynamic> json) {
    final l$stripe_info = json['stripe_info'];
    final l$$__typename = json['__typename'];
    return Query$get_customer_stripe_info$customer_customer(
      stripe_info: l$stripe_info == null ? null : mapFromJson(l$stripe_info),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final dynamic? stripe_info;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$stripe_info = stripe_info;
    _resultData['stripe_info'] =
        l$stripe_info == null ? null : mapToJson(l$stripe_info);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$stripe_info = stripe_info;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$stripe_info,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_customer_stripe_info$customer_customer) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$get_customer_stripe_info$customer_customer
    on Query$get_customer_stripe_info$customer_customer {
  CopyWith$Query$get_customer_stripe_info$customer_customer<
          Query$get_customer_stripe_info$customer_customer>
      get copyWith => CopyWith$Query$get_customer_stripe_info$customer_customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_customer_stripe_info$customer_customer<TRes> {
  factory CopyWith$Query$get_customer_stripe_info$customer_customer(
    Query$get_customer_stripe_info$customer_customer instance,
    TRes Function(Query$get_customer_stripe_info$customer_customer) then,
  ) = _CopyWithImpl$Query$get_customer_stripe_info$customer_customer;

  factory CopyWith$Query$get_customer_stripe_info$customer_customer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_customer_stripe_info$customer_customer;

  TRes call({
    dynamic? stripe_info,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_customer_stripe_info$customer_customer<TRes>
    implements CopyWith$Query$get_customer_stripe_info$customer_customer<TRes> {
  _CopyWithImpl$Query$get_customer_stripe_info$customer_customer(
    this._instance,
    this._then,
  );

  final Query$get_customer_stripe_info$customer_customer _instance;

  final TRes Function(Query$get_customer_stripe_info$customer_customer) _then;

  static const _undefined = {};

  TRes call({
    Object? stripe_info = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_customer_stripe_info$customer_customer(
        stripe_info: stripe_info == _undefined
            ? _instance.stripe_info
            : (stripe_info as dynamic?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_customer_stripe_info$customer_customer<TRes>
    implements CopyWith$Query$get_customer_stripe_info$customer_customer<TRes> {
  _CopyWithStubImpl$Query$get_customer_stripe_info$customer_customer(this._res);

  TRes _res;

  call({
    dynamic? stripe_info,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$set_customer_info {
  factory Variables$Mutation$set_customer_info({
    required int user_id,
    required String app_version,
    dynamic? stripe_info,
  }) =>
      Variables$Mutation$set_customer_info._({
        r'user_id': user_id,
        r'app_version': app_version,
        if (stripe_info != null) r'stripe_info': stripe_info,
      });

  Variables$Mutation$set_customer_info._(this._$data);

  factory Variables$Mutation$set_customer_info.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$user_id = data['user_id'];
    result$data['user_id'] = (l$user_id as int);
    final l$app_version = data['app_version'];
    result$data['app_version'] = (l$app_version as String);
    if (data.containsKey('stripe_info')) {
      final l$stripe_info = data['stripe_info'];
      result$data['stripe_info'] =
          l$stripe_info == null ? null : mapFromJson(l$stripe_info);
    }
    return Variables$Mutation$set_customer_info._(result$data);
  }

  Map<String, dynamic> _$data;

  int get user_id => (_$data['user_id'] as int);
  String get app_version => (_$data['app_version'] as String);
  dynamic? get stripe_info => (_$data['stripe_info'] as dynamic?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$user_id = user_id;
    result$data['user_id'] = l$user_id;
    final l$app_version = app_version;
    result$data['app_version'] = l$app_version;
    if (_$data.containsKey('stripe_info')) {
      final l$stripe_info = stripe_info;
      result$data['stripe_info'] =
          l$stripe_info == null ? null : mapToJson(l$stripe_info);
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$set_customer_info<
          Variables$Mutation$set_customer_info>
      get copyWith => CopyWith$Variables$Mutation$set_customer_info(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$set_customer_info) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$user_id = user_id;
    final lOther$user_id = other.user_id;
    if (l$user_id != lOther$user_id) {
      return false;
    }
    final l$app_version = app_version;
    final lOther$app_version = other.app_version;
    if (l$app_version != lOther$app_version) {
      return false;
    }
    final l$stripe_info = stripe_info;
    final lOther$stripe_info = other.stripe_info;
    if (_$data.containsKey('stripe_info') !=
        other._$data.containsKey('stripe_info')) {
      return false;
    }
    if (l$stripe_info != lOther$stripe_info) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$user_id = user_id;
    final l$app_version = app_version;
    final l$stripe_info = stripe_info;
    return Object.hashAll([
      l$user_id,
      l$app_version,
      _$data.containsKey('stripe_info') ? l$stripe_info : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$set_customer_info<TRes> {
  factory CopyWith$Variables$Mutation$set_customer_info(
    Variables$Mutation$set_customer_info instance,
    TRes Function(Variables$Mutation$set_customer_info) then,
  ) = _CopyWithImpl$Variables$Mutation$set_customer_info;

  factory CopyWith$Variables$Mutation$set_customer_info.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$set_customer_info;

  TRes call({
    int? user_id,
    String? app_version,
    dynamic? stripe_info,
  });
}

class _CopyWithImpl$Variables$Mutation$set_customer_info<TRes>
    implements CopyWith$Variables$Mutation$set_customer_info<TRes> {
  _CopyWithImpl$Variables$Mutation$set_customer_info(
    this._instance,
    this._then,
  );

  final Variables$Mutation$set_customer_info _instance;

  final TRes Function(Variables$Mutation$set_customer_info) _then;

  static const _undefined = {};

  TRes call({
    Object? user_id = _undefined,
    Object? app_version = _undefined,
    Object? stripe_info = _undefined,
  }) =>
      _then(Variables$Mutation$set_customer_info._({
        ..._instance._$data,
        if (user_id != _undefined && user_id != null)
          'user_id': (user_id as int),
        if (app_version != _undefined && app_version != null)
          'app_version': (app_version as String),
        if (stripe_info != _undefined) 'stripe_info': (stripe_info as dynamic?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$set_customer_info<TRes>
    implements CopyWith$Variables$Mutation$set_customer_info<TRes> {
  _CopyWithStubImpl$Variables$Mutation$set_customer_info(this._res);

  TRes _res;

  call({
    int? user_id,
    String? app_version,
    dynamic? stripe_info,
  }) =>
      _res;
}

class Mutation$set_customer_info {
  Mutation$set_customer_info({
    this.insert_customer_customer_one,
    required this.$__typename,
  });

  factory Mutation$set_customer_info.fromJson(Map<String, dynamic> json) {
    final l$insert_customer_customer_one = json['insert_customer_customer_one'];
    final l$$__typename = json['__typename'];
    return Mutation$set_customer_info(
      insert_customer_customer_one: l$insert_customer_customer_one == null
          ? null
          : Mutation$set_customer_info$insert_customer_customer_one.fromJson(
              (l$insert_customer_customer_one as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$set_customer_info$insert_customer_customer_one?
      insert_customer_customer_one;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insert_customer_customer_one = insert_customer_customer_one;
    _resultData['insert_customer_customer_one'] =
        l$insert_customer_customer_one?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insert_customer_customer_one = insert_customer_customer_one;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$insert_customer_customer_one,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$set_customer_info) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$insert_customer_customer_one = insert_customer_customer_one;
    final lOther$insert_customer_customer_one =
        other.insert_customer_customer_one;
    if (l$insert_customer_customer_one != lOther$insert_customer_customer_one) {
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

extension UtilityExtension$Mutation$set_customer_info
    on Mutation$set_customer_info {
  CopyWith$Mutation$set_customer_info<Mutation$set_customer_info>
      get copyWith => CopyWith$Mutation$set_customer_info(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$set_customer_info<TRes> {
  factory CopyWith$Mutation$set_customer_info(
    Mutation$set_customer_info instance,
    TRes Function(Mutation$set_customer_info) then,
  ) = _CopyWithImpl$Mutation$set_customer_info;

  factory CopyWith$Mutation$set_customer_info.stub(TRes res) =
      _CopyWithStubImpl$Mutation$set_customer_info;

  TRes call({
    Mutation$set_customer_info$insert_customer_customer_one?
        insert_customer_customer_one,
    String? $__typename,
  });
  CopyWith$Mutation$set_customer_info$insert_customer_customer_one<TRes>
      get insert_customer_customer_one;
}

class _CopyWithImpl$Mutation$set_customer_info<TRes>
    implements CopyWith$Mutation$set_customer_info<TRes> {
  _CopyWithImpl$Mutation$set_customer_info(
    this._instance,
    this._then,
  );

  final Mutation$set_customer_info _instance;

  final TRes Function(Mutation$set_customer_info) _then;

  static const _undefined = {};

  TRes call({
    Object? insert_customer_customer_one = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$set_customer_info(
        insert_customer_customer_one: insert_customer_customer_one == _undefined
            ? _instance.insert_customer_customer_one
            : (insert_customer_customer_one
                as Mutation$set_customer_info$insert_customer_customer_one?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$set_customer_info$insert_customer_customer_one<TRes>
      get insert_customer_customer_one {
    final local$insert_customer_customer_one =
        _instance.insert_customer_customer_one;
    return local$insert_customer_customer_one == null
        ? CopyWith$Mutation$set_customer_info$insert_customer_customer_one.stub(
            _then(_instance))
        : CopyWith$Mutation$set_customer_info$insert_customer_customer_one(
            local$insert_customer_customer_one,
            (e) => call(insert_customer_customer_one: e));
  }
}

class _CopyWithStubImpl$Mutation$set_customer_info<TRes>
    implements CopyWith$Mutation$set_customer_info<TRes> {
  _CopyWithStubImpl$Mutation$set_customer_info(this._res);

  TRes _res;

  call({
    Mutation$set_customer_info$insert_customer_customer_one?
        insert_customer_customer_one,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$set_customer_info$insert_customer_customer_one<TRes>
      get insert_customer_customer_one =>
          CopyWith$Mutation$set_customer_info$insert_customer_customer_one.stub(
              _res);
}

const documentNodeMutationset_customer_info = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'set_customer_info'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'user_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'app_version')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'stripe_info')),
        type: NamedTypeNode(
          name: NameNode(value: 'jsonb'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'insert_customer_customer_one'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'object'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'user_id'),
                value: VariableNode(name: NameNode(value: 'user_id')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'app_version'),
                value: VariableNode(name: NameNode(value: 'app_version')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'stripe_info'),
                value: VariableNode(name: NameNode(value: 'stripe_info')),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'user_id'),
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
Mutation$set_customer_info _parserFn$Mutation$set_customer_info(
        Map<String, dynamic> data) =>
    Mutation$set_customer_info.fromJson(data);
typedef OnMutationCompleted$Mutation$set_customer_info = FutureOr<void>
    Function(
  dynamic,
  Mutation$set_customer_info?,
);

class Options$Mutation$set_customer_info
    extends graphql.MutationOptions<Mutation$set_customer_info> {
  Options$Mutation$set_customer_info({
    String? operationName,
    required Variables$Mutation$set_customer_info variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$set_customer_info? onCompleted,
    graphql.OnMutationUpdate<Mutation$set_customer_info>? update,
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
                        : _parserFn$Mutation$set_customer_info(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationset_customer_info,
          parserFn: _parserFn$Mutation$set_customer_info,
        );

  final OnMutationCompleted$Mutation$set_customer_info? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$set_customer_info
    extends graphql.WatchQueryOptions<Mutation$set_customer_info> {
  WatchOptions$Mutation$set_customer_info({
    String? operationName,
    required Variables$Mutation$set_customer_info variables,
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
          document: documentNodeMutationset_customer_info,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$set_customer_info,
        );
}

extension ClientExtension$Mutation$set_customer_info on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$set_customer_info>>
      mutate$set_customer_info(
              Options$Mutation$set_customer_info options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$set_customer_info>
      watchMutation$set_customer_info(
              WatchOptions$Mutation$set_customer_info options) =>
          this.watchMutation(options);
}

class Mutation$set_customer_info$insert_customer_customer_one {
  Mutation$set_customer_info$insert_customer_customer_one({
    required this.user_id,
    required this.$__typename,
  });

  factory Mutation$set_customer_info$insert_customer_customer_one.fromJson(
      Map<String, dynamic> json) {
    final l$user_id = json['user_id'];
    final l$$__typename = json['__typename'];
    return Mutation$set_customer_info$insert_customer_customer_one(
      user_id: (l$user_id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int user_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user_id = user_id;
    _resultData['user_id'] = l$user_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$user_id = user_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$set_customer_info$insert_customer_customer_one) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$user_id = user_id;
    final lOther$user_id = other.user_id;
    if (l$user_id != lOther$user_id) {
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

extension UtilityExtension$Mutation$set_customer_info$insert_customer_customer_one
    on Mutation$set_customer_info$insert_customer_customer_one {
  CopyWith$Mutation$set_customer_info$insert_customer_customer_one<
          Mutation$set_customer_info$insert_customer_customer_one>
      get copyWith =>
          CopyWith$Mutation$set_customer_info$insert_customer_customer_one(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$set_customer_info$insert_customer_customer_one<
    TRes> {
  factory CopyWith$Mutation$set_customer_info$insert_customer_customer_one(
    Mutation$set_customer_info$insert_customer_customer_one instance,
    TRes Function(Mutation$set_customer_info$insert_customer_customer_one) then,
  ) = _CopyWithImpl$Mutation$set_customer_info$insert_customer_customer_one;

  factory CopyWith$Mutation$set_customer_info$insert_customer_customer_one.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$set_customer_info$insert_customer_customer_one;

  TRes call({
    int? user_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$set_customer_info$insert_customer_customer_one<
        TRes>
    implements
        CopyWith$Mutation$set_customer_info$insert_customer_customer_one<TRes> {
  _CopyWithImpl$Mutation$set_customer_info$insert_customer_customer_one(
    this._instance,
    this._then,
  );

  final Mutation$set_customer_info$insert_customer_customer_one _instance;

  final TRes Function(Mutation$set_customer_info$insert_customer_customer_one)
      _then;

  static const _undefined = {};

  TRes call({
    Object? user_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$set_customer_info$insert_customer_customer_one(
        user_id: user_id == _undefined || user_id == null
            ? _instance.user_id
            : (user_id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$set_customer_info$insert_customer_customer_one<
        TRes>
    implements
        CopyWith$Mutation$set_customer_info$insert_customer_customer_one<TRes> {
  _CopyWithStubImpl$Mutation$set_customer_info$insert_customer_customer_one(
      this._res);

  TRes _res;

  call({
    int? user_id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$set_customer_stripe_info {
  factory Variables$Mutation$set_customer_stripe_info({
    required int user_id,
    dynamic? stripe_info,
  }) =>
      Variables$Mutation$set_customer_stripe_info._({
        r'user_id': user_id,
        if (stripe_info != null) r'stripe_info': stripe_info,
      });

  Variables$Mutation$set_customer_stripe_info._(this._$data);

  factory Variables$Mutation$set_customer_stripe_info.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$user_id = data['user_id'];
    result$data['user_id'] = (l$user_id as int);
    if (data.containsKey('stripe_info')) {
      final l$stripe_info = data['stripe_info'];
      result$data['stripe_info'] =
          l$stripe_info == null ? null : mapFromJson(l$stripe_info);
    }
    return Variables$Mutation$set_customer_stripe_info._(result$data);
  }

  Map<String, dynamic> _$data;

  int get user_id => (_$data['user_id'] as int);
  dynamic? get stripe_info => (_$data['stripe_info'] as dynamic?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$user_id = user_id;
    result$data['user_id'] = l$user_id;
    if (_$data.containsKey('stripe_info')) {
      final l$stripe_info = stripe_info;
      result$data['stripe_info'] =
          l$stripe_info == null ? null : mapToJson(l$stripe_info);
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$set_customer_stripe_info<
          Variables$Mutation$set_customer_stripe_info>
      get copyWith => CopyWith$Variables$Mutation$set_customer_stripe_info(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$set_customer_stripe_info) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$user_id = user_id;
    final lOther$user_id = other.user_id;
    if (l$user_id != lOther$user_id) {
      return false;
    }
    final l$stripe_info = stripe_info;
    final lOther$stripe_info = other.stripe_info;
    if (_$data.containsKey('stripe_info') !=
        other._$data.containsKey('stripe_info')) {
      return false;
    }
    if (l$stripe_info != lOther$stripe_info) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$user_id = user_id;
    final l$stripe_info = stripe_info;
    return Object.hashAll([
      l$user_id,
      _$data.containsKey('stripe_info') ? l$stripe_info : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$set_customer_stripe_info<TRes> {
  factory CopyWith$Variables$Mutation$set_customer_stripe_info(
    Variables$Mutation$set_customer_stripe_info instance,
    TRes Function(Variables$Mutation$set_customer_stripe_info) then,
  ) = _CopyWithImpl$Variables$Mutation$set_customer_stripe_info;

  factory CopyWith$Variables$Mutation$set_customer_stripe_info.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$set_customer_stripe_info;

  TRes call({
    int? user_id,
    dynamic? stripe_info,
  });
}

class _CopyWithImpl$Variables$Mutation$set_customer_stripe_info<TRes>
    implements CopyWith$Variables$Mutation$set_customer_stripe_info<TRes> {
  _CopyWithImpl$Variables$Mutation$set_customer_stripe_info(
    this._instance,
    this._then,
  );

  final Variables$Mutation$set_customer_stripe_info _instance;

  final TRes Function(Variables$Mutation$set_customer_stripe_info) _then;

  static const _undefined = {};

  TRes call({
    Object? user_id = _undefined,
    Object? stripe_info = _undefined,
  }) =>
      _then(Variables$Mutation$set_customer_stripe_info._({
        ..._instance._$data,
        if (user_id != _undefined && user_id != null)
          'user_id': (user_id as int),
        if (stripe_info != _undefined) 'stripe_info': (stripe_info as dynamic?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$set_customer_stripe_info<TRes>
    implements CopyWith$Variables$Mutation$set_customer_stripe_info<TRes> {
  _CopyWithStubImpl$Variables$Mutation$set_customer_stripe_info(this._res);

  TRes _res;

  call({
    int? user_id,
    dynamic? stripe_info,
  }) =>
      _res;
}

class Mutation$set_customer_stripe_info {
  Mutation$set_customer_stripe_info({
    this.update_customer_customer_by_pk,
    required this.$__typename,
  });

  factory Mutation$set_customer_stripe_info.fromJson(
      Map<String, dynamic> json) {
    final l$update_customer_customer_by_pk =
        json['update_customer_customer_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$set_customer_stripe_info(
      update_customer_customer_by_pk: l$update_customer_customer_by_pk == null
          ? null
          : Mutation$set_customer_stripe_info$update_customer_customer_by_pk
              .fromJson(
                  (l$update_customer_customer_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$set_customer_stripe_info$update_customer_customer_by_pk?
      update_customer_customer_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_customer_customer_by_pk = update_customer_customer_by_pk;
    _resultData['update_customer_customer_by_pk'] =
        l$update_customer_customer_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_customer_customer_by_pk = update_customer_customer_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_customer_customer_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$set_customer_stripe_info) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_customer_customer_by_pk = update_customer_customer_by_pk;
    final lOther$update_customer_customer_by_pk =
        other.update_customer_customer_by_pk;
    if (l$update_customer_customer_by_pk !=
        lOther$update_customer_customer_by_pk) {
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

extension UtilityExtension$Mutation$set_customer_stripe_info
    on Mutation$set_customer_stripe_info {
  CopyWith$Mutation$set_customer_stripe_info<Mutation$set_customer_stripe_info>
      get copyWith => CopyWith$Mutation$set_customer_stripe_info(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$set_customer_stripe_info<TRes> {
  factory CopyWith$Mutation$set_customer_stripe_info(
    Mutation$set_customer_stripe_info instance,
    TRes Function(Mutation$set_customer_stripe_info) then,
  ) = _CopyWithImpl$Mutation$set_customer_stripe_info;

  factory CopyWith$Mutation$set_customer_stripe_info.stub(TRes res) =
      _CopyWithStubImpl$Mutation$set_customer_stripe_info;

  TRes call({
    Mutation$set_customer_stripe_info$update_customer_customer_by_pk?
        update_customer_customer_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$set_customer_stripe_info$update_customer_customer_by_pk<
      TRes> get update_customer_customer_by_pk;
}

class _CopyWithImpl$Mutation$set_customer_stripe_info<TRes>
    implements CopyWith$Mutation$set_customer_stripe_info<TRes> {
  _CopyWithImpl$Mutation$set_customer_stripe_info(
    this._instance,
    this._then,
  );

  final Mutation$set_customer_stripe_info _instance;

  final TRes Function(Mutation$set_customer_stripe_info) _then;

  static const _undefined = {};

  TRes call({
    Object? update_customer_customer_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$set_customer_stripe_info(
        update_customer_customer_by_pk: update_customer_customer_by_pk ==
                _undefined
            ? _instance.update_customer_customer_by_pk
            : (update_customer_customer_by_pk
                as Mutation$set_customer_stripe_info$update_customer_customer_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$set_customer_stripe_info$update_customer_customer_by_pk<
      TRes> get update_customer_customer_by_pk {
    final local$update_customer_customer_by_pk =
        _instance.update_customer_customer_by_pk;
    return local$update_customer_customer_by_pk == null
        ? CopyWith$Mutation$set_customer_stripe_info$update_customer_customer_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$set_customer_stripe_info$update_customer_customer_by_pk(
            local$update_customer_customer_by_pk,
            (e) => call(update_customer_customer_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$set_customer_stripe_info<TRes>
    implements CopyWith$Mutation$set_customer_stripe_info<TRes> {
  _CopyWithStubImpl$Mutation$set_customer_stripe_info(this._res);

  TRes _res;

  call({
    Mutation$set_customer_stripe_info$update_customer_customer_by_pk?
        update_customer_customer_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$set_customer_stripe_info$update_customer_customer_by_pk<
          TRes>
      get update_customer_customer_by_pk =>
          CopyWith$Mutation$set_customer_stripe_info$update_customer_customer_by_pk
              .stub(_res);
}

const documentNodeMutationset_customer_stripe_info = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'set_customer_stripe_info'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'user_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'stripe_info')),
        type: NamedTypeNode(
          name: NameNode(value: 'jsonb'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'update_customer_customer_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'pk_columns'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'user_id'),
                value: VariableNode(name: NameNode(value: 'user_id')),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: '_set'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'stripe_info'),
                value: VariableNode(name: NameNode(value: 'stripe_info')),
              )
            ]),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'stripe_info'),
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
Mutation$set_customer_stripe_info _parserFn$Mutation$set_customer_stripe_info(
        Map<String, dynamic> data) =>
    Mutation$set_customer_stripe_info.fromJson(data);
typedef OnMutationCompleted$Mutation$set_customer_stripe_info = FutureOr<void>
    Function(
  dynamic,
  Mutation$set_customer_stripe_info?,
);

class Options$Mutation$set_customer_stripe_info
    extends graphql.MutationOptions<Mutation$set_customer_stripe_info> {
  Options$Mutation$set_customer_stripe_info({
    String? operationName,
    required Variables$Mutation$set_customer_stripe_info variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$set_customer_stripe_info? onCompleted,
    graphql.OnMutationUpdate<Mutation$set_customer_stripe_info>? update,
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
                        : _parserFn$Mutation$set_customer_stripe_info(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationset_customer_stripe_info,
          parserFn: _parserFn$Mutation$set_customer_stripe_info,
        );

  final OnMutationCompleted$Mutation$set_customer_stripe_info?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$set_customer_stripe_info
    extends graphql.WatchQueryOptions<Mutation$set_customer_stripe_info> {
  WatchOptions$Mutation$set_customer_stripe_info({
    String? operationName,
    required Variables$Mutation$set_customer_stripe_info variables,
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
          document: documentNodeMutationset_customer_stripe_info,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$set_customer_stripe_info,
        );
}

extension ClientExtension$Mutation$set_customer_stripe_info
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$set_customer_stripe_info>>
      mutate$set_customer_stripe_info(
              Options$Mutation$set_customer_stripe_info options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$set_customer_stripe_info>
      watchMutation$set_customer_stripe_info(
              WatchOptions$Mutation$set_customer_stripe_info options) =>
          this.watchMutation(options);
}

class Mutation$set_customer_stripe_info$update_customer_customer_by_pk {
  Mutation$set_customer_stripe_info$update_customer_customer_by_pk({
    this.stripe_info,
    required this.$__typename,
  });

  factory Mutation$set_customer_stripe_info$update_customer_customer_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$stripe_info = json['stripe_info'];
    final l$$__typename = json['__typename'];
    return Mutation$set_customer_stripe_info$update_customer_customer_by_pk(
      stripe_info: l$stripe_info == null ? null : mapFromJson(l$stripe_info),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final dynamic? stripe_info;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$stripe_info = stripe_info;
    _resultData['stripe_info'] =
        l$stripe_info == null ? null : mapToJson(l$stripe_info);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$stripe_info = stripe_info;
    final l$$__typename = $__typename;
    return Object.hashAll([
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
            is Mutation$set_customer_stripe_info$update_customer_customer_by_pk) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Mutation$set_customer_stripe_info$update_customer_customer_by_pk
    on Mutation$set_customer_stripe_info$update_customer_customer_by_pk {
  CopyWith$Mutation$set_customer_stripe_info$update_customer_customer_by_pk<
          Mutation$set_customer_stripe_info$update_customer_customer_by_pk>
      get copyWith =>
          CopyWith$Mutation$set_customer_stripe_info$update_customer_customer_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$set_customer_stripe_info$update_customer_customer_by_pk<
    TRes> {
  factory CopyWith$Mutation$set_customer_stripe_info$update_customer_customer_by_pk(
    Mutation$set_customer_stripe_info$update_customer_customer_by_pk instance,
    TRes Function(
            Mutation$set_customer_stripe_info$update_customer_customer_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$set_customer_stripe_info$update_customer_customer_by_pk;

  factory CopyWith$Mutation$set_customer_stripe_info$update_customer_customer_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$set_customer_stripe_info$update_customer_customer_by_pk;

  TRes call({
    dynamic? stripe_info,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$set_customer_stripe_info$update_customer_customer_by_pk<
        TRes>
    implements
        CopyWith$Mutation$set_customer_stripe_info$update_customer_customer_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$set_customer_stripe_info$update_customer_customer_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$set_customer_stripe_info$update_customer_customer_by_pk
      _instance;

  final TRes Function(
      Mutation$set_customer_stripe_info$update_customer_customer_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? stripe_info = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$set_customer_stripe_info$update_customer_customer_by_pk(
        stripe_info: stripe_info == _undefined
            ? _instance.stripe_info
            : (stripe_info as dynamic?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$set_customer_stripe_info$update_customer_customer_by_pk<
        TRes>
    implements
        CopyWith$Mutation$set_customer_stripe_info$update_customer_customer_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$set_customer_stripe_info$update_customer_customer_by_pk(
      this._res);

  TRes _res;

  call({
    dynamic? stripe_info,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$get_customer_restaurant_orders {
  factory Variables$Query$get_customer_restaurant_orders(
          {required int customer_id}) =>
      Variables$Query$get_customer_restaurant_orders._({
        r'customer_id': customer_id,
      });

  Variables$Query$get_customer_restaurant_orders._(this._$data);

  factory Variables$Query$get_customer_restaurant_orders.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$customer_id = data['customer_id'];
    result$data['customer_id'] = (l$customer_id as int);
    return Variables$Query$get_customer_restaurant_orders._(result$data);
  }

  Map<String, dynamic> _$data;

  int get customer_id => (_$data['customer_id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$customer_id = customer_id;
    result$data['customer_id'] = l$customer_id;
    return result$data;
  }

  CopyWith$Variables$Query$get_customer_restaurant_orders<
          Variables$Query$get_customer_restaurant_orders>
      get copyWith => CopyWith$Variables$Query$get_customer_restaurant_orders(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_customer_restaurant_orders) ||
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

abstract class CopyWith$Variables$Query$get_customer_restaurant_orders<TRes> {
  factory CopyWith$Variables$Query$get_customer_restaurant_orders(
    Variables$Query$get_customer_restaurant_orders instance,
    TRes Function(Variables$Query$get_customer_restaurant_orders) then,
  ) = _CopyWithImpl$Variables$Query$get_customer_restaurant_orders;

  factory CopyWith$Variables$Query$get_customer_restaurant_orders.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Query$get_customer_restaurant_orders;

  TRes call({int? customer_id});
}

class _CopyWithImpl$Variables$Query$get_customer_restaurant_orders<TRes>
    implements CopyWith$Variables$Query$get_customer_restaurant_orders<TRes> {
  _CopyWithImpl$Variables$Query$get_customer_restaurant_orders(
    this._instance,
    this._then,
  );

  final Variables$Query$get_customer_restaurant_orders _instance;

  final TRes Function(Variables$Query$get_customer_restaurant_orders) _then;

  static const _undefined = {};

  TRes call({Object? customer_id = _undefined}) =>
      _then(Variables$Query$get_customer_restaurant_orders._({
        ..._instance._$data,
        if (customer_id != _undefined && customer_id != null)
          'customer_id': (customer_id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_customer_restaurant_orders<TRes>
    implements CopyWith$Variables$Query$get_customer_restaurant_orders<TRes> {
  _CopyWithStubImpl$Variables$Query$get_customer_restaurant_orders(this._res);

  TRes _res;

  call({int? customer_id}) => _res;
}

class Query$get_customer_restaurant_orders {
  Query$get_customer_restaurant_orders({
    required this.restaurant_order,
    required this.$__typename,
  });

  factory Query$get_customer_restaurant_orders.fromJson(
      Map<String, dynamic> json) {
    final l$restaurant_order = json['restaurant_order'];
    final l$$__typename = json['__typename'];
    return Query$get_customer_restaurant_orders(
      restaurant_order: (l$restaurant_order as List<dynamic>)
          .map((e) =>
              Query$get_customer_restaurant_orders$restaurant_order.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$get_customer_restaurant_orders$restaurant_order>
      restaurant_order;

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
    if (!(other is Query$get_customer_restaurant_orders) ||
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

extension UtilityExtension$Query$get_customer_restaurant_orders
    on Query$get_customer_restaurant_orders {
  CopyWith$Query$get_customer_restaurant_orders<
          Query$get_customer_restaurant_orders>
      get copyWith => CopyWith$Query$get_customer_restaurant_orders(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_customer_restaurant_orders<TRes> {
  factory CopyWith$Query$get_customer_restaurant_orders(
    Query$get_customer_restaurant_orders instance,
    TRes Function(Query$get_customer_restaurant_orders) then,
  ) = _CopyWithImpl$Query$get_customer_restaurant_orders;

  factory CopyWith$Query$get_customer_restaurant_orders.stub(TRes res) =
      _CopyWithStubImpl$Query$get_customer_restaurant_orders;

  TRes call({
    List<Query$get_customer_restaurant_orders$restaurant_order>?
        restaurant_order,
    String? $__typename,
  });
  TRes restaurant_order(
      Iterable<Query$get_customer_restaurant_orders$restaurant_order> Function(
              Iterable<
                  CopyWith$Query$get_customer_restaurant_orders$restaurant_order<
                      Query$get_customer_restaurant_orders$restaurant_order>>)
          _fn);
}

class _CopyWithImpl$Query$get_customer_restaurant_orders<TRes>
    implements CopyWith$Query$get_customer_restaurant_orders<TRes> {
  _CopyWithImpl$Query$get_customer_restaurant_orders(
    this._instance,
    this._then,
  );

  final Query$get_customer_restaurant_orders _instance;

  final TRes Function(Query$get_customer_restaurant_orders) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_order = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_customer_restaurant_orders(
        restaurant_order: restaurant_order == _undefined ||
                restaurant_order == null
            ? _instance.restaurant_order
            : (restaurant_order
                as List<Query$get_customer_restaurant_orders$restaurant_order>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes restaurant_order(
          Iterable<Query$get_customer_restaurant_orders$restaurant_order> Function(
                  Iterable<
                      CopyWith$Query$get_customer_restaurant_orders$restaurant_order<
                          Query$get_customer_restaurant_orders$restaurant_order>>)
              _fn) =>
      call(
          restaurant_order: _fn(_instance.restaurant_order.map((e) =>
              CopyWith$Query$get_customer_restaurant_orders$restaurant_order(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_customer_restaurant_orders<TRes>
    implements CopyWith$Query$get_customer_restaurant_orders<TRes> {
  _CopyWithStubImpl$Query$get_customer_restaurant_orders(this._res);

  TRes _res;

  call({
    List<Query$get_customer_restaurant_orders$restaurant_order>?
        restaurant_order,
    String? $__typename,
  }) =>
      _res;
  restaurant_order(_fn) => _res;
}

const documentNodeQueryget_customer_restaurant_orders =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_customer_restaurant_orders'),
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
                    name: NameNode(value: 'language'),
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
            name: NameNode(value: 'order_time'),
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
Query$get_customer_restaurant_orders
    _parserFn$Query$get_customer_restaurant_orders(Map<String, dynamic> data) =>
        Query$get_customer_restaurant_orders.fromJson(data);

class Options$Query$get_customer_restaurant_orders
    extends graphql.QueryOptions<Query$get_customer_restaurant_orders> {
  Options$Query$get_customer_restaurant_orders({
    String? operationName,
    required Variables$Query$get_customer_restaurant_orders variables,
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
          document: documentNodeQueryget_customer_restaurant_orders,
          parserFn: _parserFn$Query$get_customer_restaurant_orders,
        );
}

class WatchOptions$Query$get_customer_restaurant_orders
    extends graphql.WatchQueryOptions<Query$get_customer_restaurant_orders> {
  WatchOptions$Query$get_customer_restaurant_orders({
    String? operationName,
    required Variables$Query$get_customer_restaurant_orders variables,
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
          document: documentNodeQueryget_customer_restaurant_orders,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_customer_restaurant_orders,
        );
}

class FetchMoreOptions$Query$get_customer_restaurant_orders
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_customer_restaurant_orders({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_customer_restaurant_orders variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_customer_restaurant_orders,
        );
}

extension ClientExtension$Query$get_customer_restaurant_orders
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_customer_restaurant_orders>>
      query$get_customer_restaurant_orders(
              Options$Query$get_customer_restaurant_orders options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$get_customer_restaurant_orders>
      watchQuery$get_customer_restaurant_orders(
              WatchOptions$Query$get_customer_restaurant_orders options) =>
          this.watchQuery(options);
  void writeQuery$get_customer_restaurant_orders({
    required Query$get_customer_restaurant_orders data,
    required Variables$Query$get_customer_restaurant_orders variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryget_customer_restaurant_orders),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_customer_restaurant_orders?
      readQuery$get_customer_restaurant_orders({
    required Variables$Query$get_customer_restaurant_orders variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryget_customer_restaurant_orders),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$get_customer_restaurant_orders.fromJson(result);
  }
}

class Query$get_customer_restaurant_orders$restaurant_order {
  Query$get_customer_restaurant_orders$restaurant_order({
    required this.id,
    required this.restaurant,
    required this.items,
    required this.payment_type,
    this.to_location_gps,
    this.to_location_address,
    this.estimated_food_ready_time,
    this.actual_food_ready_time,
    required this.refund_amount,
    this.delivery_id,
    required this.status,
    this.review_id,
    required this.order_time,
    required this.customer_app_type,
    this.notes,
    required this.tax,
    this.chat_id,
    required this.delivery_cost,
    this.delivery,
    required this.$__typename,
  });

  factory Query$get_customer_restaurant_orders$restaurant_order.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$restaurant = json['restaurant'];
    final l$items = json['items'];
    final l$payment_type = json['payment_type'];
    final l$to_location_gps = json['to_location_gps'];
    final l$to_location_address = json['to_location_address'];
    final l$estimated_food_ready_time = json['estimated_food_ready_time'];
    final l$actual_food_ready_time = json['actual_food_ready_time'];
    final l$refund_amount = json['refund_amount'];
    final l$delivery_id = json['delivery_id'];
    final l$status = json['status'];
    final l$review_id = json['review_id'];
    final l$order_time = json['order_time'];
    final l$customer_app_type = json['customer_app_type'];
    final l$notes = json['notes'];
    final l$tax = json['tax'];
    final l$chat_id = json['chat_id'];
    final l$delivery_cost = json['delivery_cost'];
    final l$delivery = json['delivery'];
    final l$$__typename = json['__typename'];
    return Query$get_customer_restaurant_orders$restaurant_order(
      id: (l$id as int),
      restaurant:
          Query$get_customer_restaurant_orders$restaurant_order$restaurant
              .fromJson((l$restaurant as Map<String, dynamic>)),
      items: (l$items as List<dynamic>)
          .map((e) =>
              Query$get_customer_restaurant_orders$restaurant_order$items
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      payment_type: (l$payment_type as String),
      to_location_gps: l$to_location_gps == null
          ? null
          : geographyFromJson(l$to_location_gps),
      to_location_address: (l$to_location_address as String?),
      estimated_food_ready_time: (l$estimated_food_ready_time as String?),
      actual_food_ready_time: (l$actual_food_ready_time as String?),
      refund_amount: moneyFromJson(l$refund_amount),
      delivery_id: (l$delivery_id as int?),
      status: (l$status as String),
      review_id: (l$review_id as int?),
      order_time: (l$order_time as String),
      customer_app_type: (l$customer_app_type as String),
      notes: (l$notes as String?),
      tax: moneyFromJson(l$tax),
      chat_id: (l$chat_id as int?),
      delivery_cost: moneyFromJson(l$delivery_cost),
      delivery: l$delivery == null
          ? null
          : Query$get_customer_restaurant_orders$restaurant_order$delivery
              .fromJson((l$delivery as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$get_customer_restaurant_orders$restaurant_order$restaurant
      restaurant;

  final List<Query$get_customer_restaurant_orders$restaurant_order$items> items;

  final String payment_type;

  final Geography? to_location_gps;

  final String? to_location_address;

  final String? estimated_food_ready_time;

  final String? actual_food_ready_time;

  final double refund_amount;

  final int? delivery_id;

  final String status;

  final int? review_id;

  final String order_time;

  final String customer_app_type;

  final String? notes;

  final double tax;

  final int? chat_id;

  final double delivery_cost;

  final Query$get_customer_restaurant_orders$restaurant_order$delivery?
      delivery;

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
    final l$refund_amount = refund_amount;
    _resultData['refund_amount'] = moneyToJson(l$refund_amount);
    final l$delivery_id = delivery_id;
    _resultData['delivery_id'] = l$delivery_id;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$review_id = review_id;
    _resultData['review_id'] = l$review_id;
    final l$order_time = order_time;
    _resultData['order_time'] = l$order_time;
    final l$customer_app_type = customer_app_type;
    _resultData['customer_app_type'] = l$customer_app_type;
    final l$notes = notes;
    _resultData['notes'] = l$notes;
    final l$tax = tax;
    _resultData['tax'] = moneyToJson(l$tax);
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
    final l$refund_amount = refund_amount;
    final l$delivery_id = delivery_id;
    final l$status = status;
    final l$review_id = review_id;
    final l$order_time = order_time;
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
      l$refund_amount,
      l$delivery_id,
      l$status,
      l$review_id,
      l$order_time,
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
    if (!(other is Query$get_customer_restaurant_orders$restaurant_order) ||
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
    final l$order_time = order_time;
    final lOther$order_time = other.order_time;
    if (l$order_time != lOther$order_time) {
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

extension UtilityExtension$Query$get_customer_restaurant_orders$restaurant_order
    on Query$get_customer_restaurant_orders$restaurant_order {
  CopyWith$Query$get_customer_restaurant_orders$restaurant_order<
          Query$get_customer_restaurant_orders$restaurant_order>
      get copyWith =>
          CopyWith$Query$get_customer_restaurant_orders$restaurant_order(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_customer_restaurant_orders$restaurant_order<
    TRes> {
  factory CopyWith$Query$get_customer_restaurant_orders$restaurant_order(
    Query$get_customer_restaurant_orders$restaurant_order instance,
    TRes Function(Query$get_customer_restaurant_orders$restaurant_order) then,
  ) = _CopyWithImpl$Query$get_customer_restaurant_orders$restaurant_order;

  factory CopyWith$Query$get_customer_restaurant_orders$restaurant_order.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_customer_restaurant_orders$restaurant_order;

  TRes call({
    int? id,
    Query$get_customer_restaurant_orders$restaurant_order$restaurant?
        restaurant,
    List<Query$get_customer_restaurant_orders$restaurant_order$items>? items,
    String? payment_type,
    Geography? to_location_gps,
    String? to_location_address,
    String? estimated_food_ready_time,
    String? actual_food_ready_time,
    double? refund_amount,
    int? delivery_id,
    String? status,
    int? review_id,
    String? order_time,
    String? customer_app_type,
    String? notes,
    double? tax,
    int? chat_id,
    double? delivery_cost,
    Query$get_customer_restaurant_orders$restaurant_order$delivery? delivery,
    String? $__typename,
  });
  CopyWith$Query$get_customer_restaurant_orders$restaurant_order$restaurant<
      TRes> get restaurant;
  TRes items(
      Iterable<Query$get_customer_restaurant_orders$restaurant_order$items> Function(
              Iterable<
                  CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items<
                      Query$get_customer_restaurant_orders$restaurant_order$items>>)
          _fn);
  CopyWith$Query$get_customer_restaurant_orders$restaurant_order$delivery<TRes>
      get delivery;
}

class _CopyWithImpl$Query$get_customer_restaurant_orders$restaurant_order<TRes>
    implements
        CopyWith$Query$get_customer_restaurant_orders$restaurant_order<TRes> {
  _CopyWithImpl$Query$get_customer_restaurant_orders$restaurant_order(
    this._instance,
    this._then,
  );

  final Query$get_customer_restaurant_orders$restaurant_order _instance;

  final TRes Function(Query$get_customer_restaurant_orders$restaurant_order)
      _then;

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
    Object? refund_amount = _undefined,
    Object? delivery_id = _undefined,
    Object? status = _undefined,
    Object? review_id = _undefined,
    Object? order_time = _undefined,
    Object? customer_app_type = _undefined,
    Object? notes = _undefined,
    Object? tax = _undefined,
    Object? chat_id = _undefined,
    Object? delivery_cost = _undefined,
    Object? delivery = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_customer_restaurant_orders$restaurant_order(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        restaurant: restaurant == _undefined || restaurant == null
            ? _instance.restaurant
            : (restaurant
                as Query$get_customer_restaurant_orders$restaurant_order$restaurant),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<
                Query$get_customer_restaurant_orders$restaurant_order$items>),
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
        refund_amount: refund_amount == _undefined || refund_amount == null
            ? _instance.refund_amount
            : (refund_amount as double),
        delivery_id: delivery_id == _undefined
            ? _instance.delivery_id
            : (delivery_id as int?),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        review_id:
            review_id == _undefined ? _instance.review_id : (review_id as int?),
        order_time: order_time == _undefined || order_time == null
            ? _instance.order_time
            : (order_time as String),
        customer_app_type:
            customer_app_type == _undefined || customer_app_type == null
                ? _instance.customer_app_type
                : (customer_app_type as String),
        notes: notes == _undefined ? _instance.notes : (notes as String?),
        tax: tax == _undefined || tax == null ? _instance.tax : (tax as double),
        chat_id: chat_id == _undefined ? _instance.chat_id : (chat_id as int?),
        delivery_cost: delivery_cost == _undefined || delivery_cost == null
            ? _instance.delivery_cost
            : (delivery_cost as double),
        delivery: delivery == _undefined
            ? _instance.delivery
            : (delivery
                as Query$get_customer_restaurant_orders$restaurant_order$delivery?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_customer_restaurant_orders$restaurant_order$restaurant<
      TRes> get restaurant {
    final local$restaurant = _instance.restaurant;
    return CopyWith$Query$get_customer_restaurant_orders$restaurant_order$restaurant(
        local$restaurant, (e) => call(restaurant: e));
  }

  TRes items(
          Iterable<Query$get_customer_restaurant_orders$restaurant_order$items> Function(
                  Iterable<
                      CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items<
                          Query$get_customer_restaurant_orders$restaurant_order$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) =>
              CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items(
                e,
                (i) => i,
              ))).toList());
  CopyWith$Query$get_customer_restaurant_orders$restaurant_order$delivery<TRes>
      get delivery {
    final local$delivery = _instance.delivery;
    return local$delivery == null
        ? CopyWith$Query$get_customer_restaurant_orders$restaurant_order$delivery
            .stub(_then(_instance))
        : CopyWith$Query$get_customer_restaurant_orders$restaurant_order$delivery(
            local$delivery, (e) => call(delivery: e));
  }
}

class _CopyWithStubImpl$Query$get_customer_restaurant_orders$restaurant_order<
        TRes>
    implements
        CopyWith$Query$get_customer_restaurant_orders$restaurant_order<TRes> {
  _CopyWithStubImpl$Query$get_customer_restaurant_orders$restaurant_order(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$get_customer_restaurant_orders$restaurant_order$restaurant?
        restaurant,
    List<Query$get_customer_restaurant_orders$restaurant_order$items>? items,
    String? payment_type,
    Geography? to_location_gps,
    String? to_location_address,
    String? estimated_food_ready_time,
    String? actual_food_ready_time,
    double? refund_amount,
    int? delivery_id,
    String? status,
    int? review_id,
    String? order_time,
    String? customer_app_type,
    String? notes,
    double? tax,
    int? chat_id,
    double? delivery_cost,
    Query$get_customer_restaurant_orders$restaurant_order$delivery? delivery,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_customer_restaurant_orders$restaurant_order$restaurant<
          TRes>
      get restaurant =>
          CopyWith$Query$get_customer_restaurant_orders$restaurant_order$restaurant
              .stub(_res);
  items(_fn) => _res;
  CopyWith$Query$get_customer_restaurant_orders$restaurant_order$delivery<TRes>
      get delivery =>
          CopyWith$Query$get_customer_restaurant_orders$restaurant_order$delivery
              .stub(_res);
}

class Query$get_customer_restaurant_orders$restaurant_order$restaurant {
  Query$get_customer_restaurant_orders$restaurant_order$restaurant({
    required this.id,
    this.details,
    required this.$__typename,
  });

  factory Query$get_customer_restaurant_orders$restaurant_order$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$get_customer_restaurant_orders$restaurant_order$restaurant(
      id: (l$id as int),
      details: l$details == null
          ? null
          : Query$get_customer_restaurant_orders$restaurant_order$restaurant$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$get_customer_restaurant_orders$restaurant_order$restaurant$details?
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
            is Query$get_customer_restaurant_orders$restaurant_order$restaurant) ||
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

extension UtilityExtension$Query$get_customer_restaurant_orders$restaurant_order$restaurant
    on Query$get_customer_restaurant_orders$restaurant_order$restaurant {
  CopyWith$Query$get_customer_restaurant_orders$restaurant_order$restaurant<
          Query$get_customer_restaurant_orders$restaurant_order$restaurant>
      get copyWith =>
          CopyWith$Query$get_customer_restaurant_orders$restaurant_order$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_customer_restaurant_orders$restaurant_order$restaurant<
    TRes> {
  factory CopyWith$Query$get_customer_restaurant_orders$restaurant_order$restaurant(
    Query$get_customer_restaurant_orders$restaurant_order$restaurant instance,
    TRes Function(
            Query$get_customer_restaurant_orders$restaurant_order$restaurant)
        then,
  ) = _CopyWithImpl$Query$get_customer_restaurant_orders$restaurant_order$restaurant;

  factory CopyWith$Query$get_customer_restaurant_orders$restaurant_order$restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_customer_restaurant_orders$restaurant_order$restaurant;

  TRes call({
    int? id,
    Query$get_customer_restaurant_orders$restaurant_order$restaurant$details?
        details,
    String? $__typename,
  });
  CopyWith$Query$get_customer_restaurant_orders$restaurant_order$restaurant$details<
      TRes> get details;
}

class _CopyWithImpl$Query$get_customer_restaurant_orders$restaurant_order$restaurant<
        TRes>
    implements
        CopyWith$Query$get_customer_restaurant_orders$restaurant_order$restaurant<
            TRes> {
  _CopyWithImpl$Query$get_customer_restaurant_orders$restaurant_order$restaurant(
    this._instance,
    this._then,
  );

  final Query$get_customer_restaurant_orders$restaurant_order$restaurant
      _instance;

  final TRes Function(
      Query$get_customer_restaurant_orders$restaurant_order$restaurant) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_customer_restaurant_orders$restaurant_order$restaurant(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        details: details == _undefined
            ? _instance.details
            : (details
                as Query$get_customer_restaurant_orders$restaurant_order$restaurant$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_customer_restaurant_orders$restaurant_order$restaurant$details<
      TRes> get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$get_customer_restaurant_orders$restaurant_order$restaurant$details
            .stub(_then(_instance))
        : CopyWith$Query$get_customer_restaurant_orders$restaurant_order$restaurant$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$get_customer_restaurant_orders$restaurant_order$restaurant<
        TRes>
    implements
        CopyWith$Query$get_customer_restaurant_orders$restaurant_order$restaurant<
            TRes> {
  _CopyWithStubImpl$Query$get_customer_restaurant_orders$restaurant_order$restaurant(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$get_customer_restaurant_orders$restaurant_order$restaurant$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_customer_restaurant_orders$restaurant_order$restaurant$details<
          TRes>
      get details =>
          CopyWith$Query$get_customer_restaurant_orders$restaurant_order$restaurant$details
              .stub(_res);
}

class Query$get_customer_restaurant_orders$restaurant_order$restaurant$details {
  Query$get_customer_restaurant_orders$restaurant_order$restaurant$details({
    required this.id,
    this.firebase_id,
    required this.image,
    required this.language,
    required this.location,
    required this.name,
    required this.$__typename,
  });

  factory Query$get_customer_restaurant_orders$restaurant_order$restaurant$details.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$firebase_id = json['firebase_id'];
    final l$image = json['image'];
    final l$language = json['language'];
    final l$location = json['location'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$get_customer_restaurant_orders$restaurant_order$restaurant$details(
      id: (l$id as int),
      firebase_id: (l$firebase_id as String?),
      image: (l$image as String),
      language: mapFromJson(l$language),
      location:
          Query$get_customer_restaurant_orders$restaurant_order$restaurant$details$location
              .fromJson((l$location as Map<String, dynamic>)),
      name: (l$name as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? firebase_id;

  final String image;

  final dynamic language;

  final Query$get_customer_restaurant_orders$restaurant_order$restaurant$details$location
      location;

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
    final l$language = language;
    _resultData['language'] = mapToJson(l$language);
    final l$location = location;
    _resultData['location'] = l$location.toJson();
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
    final l$language = language;
    final l$location = location;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$firebase_id,
      l$image,
      l$language,
      l$location,
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
            is Query$get_customer_restaurant_orders$restaurant_order$restaurant$details) ||
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
    final l$language = language;
    final lOther$language = other.language;
    if (l$language != lOther$language) {
      return false;
    }
    final l$location = location;
    final lOther$location = other.location;
    if (l$location != lOther$location) {
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

extension UtilityExtension$Query$get_customer_restaurant_orders$restaurant_order$restaurant$details
    on Query$get_customer_restaurant_orders$restaurant_order$restaurant$details {
  CopyWith$Query$get_customer_restaurant_orders$restaurant_order$restaurant$details<
          Query$get_customer_restaurant_orders$restaurant_order$restaurant$details>
      get copyWith =>
          CopyWith$Query$get_customer_restaurant_orders$restaurant_order$restaurant$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_customer_restaurant_orders$restaurant_order$restaurant$details<
    TRes> {
  factory CopyWith$Query$get_customer_restaurant_orders$restaurant_order$restaurant$details(
    Query$get_customer_restaurant_orders$restaurant_order$restaurant$details
        instance,
    TRes Function(
            Query$get_customer_restaurant_orders$restaurant_order$restaurant$details)
        then,
  ) = _CopyWithImpl$Query$get_customer_restaurant_orders$restaurant_order$restaurant$details;

  factory CopyWith$Query$get_customer_restaurant_orders$restaurant_order$restaurant$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_customer_restaurant_orders$restaurant_order$restaurant$details;

  TRes call({
    int? id,
    String? firebase_id,
    String? image,
    dynamic? language,
    Query$get_customer_restaurant_orders$restaurant_order$restaurant$details$location?
        location,
    String? name,
    String? $__typename,
  });
  CopyWith$Query$get_customer_restaurant_orders$restaurant_order$restaurant$details$location<
      TRes> get location;
}

class _CopyWithImpl$Query$get_customer_restaurant_orders$restaurant_order$restaurant$details<
        TRes>
    implements
        CopyWith$Query$get_customer_restaurant_orders$restaurant_order$restaurant$details<
            TRes> {
  _CopyWithImpl$Query$get_customer_restaurant_orders$restaurant_order$restaurant$details(
    this._instance,
    this._then,
  );

  final Query$get_customer_restaurant_orders$restaurant_order$restaurant$details
      _instance;

  final TRes Function(
          Query$get_customer_restaurant_orders$restaurant_order$restaurant$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? firebase_id = _undefined,
    Object? image = _undefined,
    Object? language = _undefined,
    Object? location = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_customer_restaurant_orders$restaurant_order$restaurant$details(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        firebase_id: firebase_id == _undefined
            ? _instance.firebase_id
            : (firebase_id as String?),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        language: language == _undefined || language == null
            ? _instance.language
            : (language as dynamic),
        location: location == _undefined || location == null
            ? _instance.location
            : (location
                as Query$get_customer_restaurant_orders$restaurant_order$restaurant$details$location),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_customer_restaurant_orders$restaurant_order$restaurant$details$location<
      TRes> get location {
    final local$location = _instance.location;
    return CopyWith$Query$get_customer_restaurant_orders$restaurant_order$restaurant$details$location(
        local$location, (e) => call(location: e));
  }
}

class _CopyWithStubImpl$Query$get_customer_restaurant_orders$restaurant_order$restaurant$details<
        TRes>
    implements
        CopyWith$Query$get_customer_restaurant_orders$restaurant_order$restaurant$details<
            TRes> {
  _CopyWithStubImpl$Query$get_customer_restaurant_orders$restaurant_order$restaurant$details(
      this._res);

  TRes _res;

  call({
    int? id,
    String? firebase_id,
    String? image,
    dynamic? language,
    Query$get_customer_restaurant_orders$restaurant_order$restaurant$details$location?
        location,
    String? name,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_customer_restaurant_orders$restaurant_order$restaurant$details$location<
          TRes>
      get location =>
          CopyWith$Query$get_customer_restaurant_orders$restaurant_order$restaurant$details$location
              .stub(_res);
}

class Query$get_customer_restaurant_orders$restaurant_order$restaurant$details$location {
  Query$get_customer_restaurant_orders$restaurant_order$restaurant$details$location({
    required this.gps,
    required this.address,
    required this.$__typename,
  });

  factory Query$get_customer_restaurant_orders$restaurant_order$restaurant$details$location.fromJson(
      Map<String, dynamic> json) {
    final l$gps = json['gps'];
    final l$address = json['address'];
    final l$$__typename = json['__typename'];
    return Query$get_customer_restaurant_orders$restaurant_order$restaurant$details$location(
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
            is Query$get_customer_restaurant_orders$restaurant_order$restaurant$details$location) ||
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

extension UtilityExtension$Query$get_customer_restaurant_orders$restaurant_order$restaurant$details$location
    on Query$get_customer_restaurant_orders$restaurant_order$restaurant$details$location {
  CopyWith$Query$get_customer_restaurant_orders$restaurant_order$restaurant$details$location<
          Query$get_customer_restaurant_orders$restaurant_order$restaurant$details$location>
      get copyWith =>
          CopyWith$Query$get_customer_restaurant_orders$restaurant_order$restaurant$details$location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_customer_restaurant_orders$restaurant_order$restaurant$details$location<
    TRes> {
  factory CopyWith$Query$get_customer_restaurant_orders$restaurant_order$restaurant$details$location(
    Query$get_customer_restaurant_orders$restaurant_order$restaurant$details$location
        instance,
    TRes Function(
            Query$get_customer_restaurant_orders$restaurant_order$restaurant$details$location)
        then,
  ) = _CopyWithImpl$Query$get_customer_restaurant_orders$restaurant_order$restaurant$details$location;

  factory CopyWith$Query$get_customer_restaurant_orders$restaurant_order$restaurant$details$location.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_customer_restaurant_orders$restaurant_order$restaurant$details$location;

  TRes call({
    Geography? gps,
    String? address,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_customer_restaurant_orders$restaurant_order$restaurant$details$location<
        TRes>
    implements
        CopyWith$Query$get_customer_restaurant_orders$restaurant_order$restaurant$details$location<
            TRes> {
  _CopyWithImpl$Query$get_customer_restaurant_orders$restaurant_order$restaurant$details$location(
    this._instance,
    this._then,
  );

  final Query$get_customer_restaurant_orders$restaurant_order$restaurant$details$location
      _instance;

  final TRes Function(
          Query$get_customer_restaurant_orders$restaurant_order$restaurant$details$location)
      _then;

  static const _undefined = {};

  TRes call({
    Object? gps = _undefined,
    Object? address = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_customer_restaurant_orders$restaurant_order$restaurant$details$location(
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

class _CopyWithStubImpl$Query$get_customer_restaurant_orders$restaurant_order$restaurant$details$location<
        TRes>
    implements
        CopyWith$Query$get_customer_restaurant_orders$restaurant_order$restaurant$details$location<
            TRes> {
  _CopyWithStubImpl$Query$get_customer_restaurant_orders$restaurant_order$restaurant$details$location(
      this._res);

  TRes _res;

  call({
    Geography? gps,
    String? address,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_customer_restaurant_orders$restaurant_order$items {
  Query$get_customer_restaurant_orders$restaurant_order$items({
    required this.restaurant_item,
    required this.cost_per_one,
    required this.id,
    this.notes,
    required this.quantity,
    required this.$__typename,
  });

  factory Query$get_customer_restaurant_orders$restaurant_order$items.fromJson(
      Map<String, dynamic> json) {
    final l$restaurant_item = json['restaurant_item'];
    final l$cost_per_one = json['cost_per_one'];
    final l$id = json['id'];
    final l$notes = json['notes'];
    final l$quantity = json['quantity'];
    final l$$__typename = json['__typename'];
    return Query$get_customer_restaurant_orders$restaurant_order$items(
      restaurant_item:
          Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item
              .fromJson((l$restaurant_item as Map<String, dynamic>)),
      cost_per_one: moneyFromJson(l$cost_per_one),
      id: (l$id as int),
      notes: (l$notes as String?),
      quantity: (l$quantity as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item
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
    if (!(other
            is Query$get_customer_restaurant_orders$restaurant_order$items) ||
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

extension UtilityExtension$Query$get_customer_restaurant_orders$restaurant_order$items
    on Query$get_customer_restaurant_orders$restaurant_order$items {
  CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items<
          Query$get_customer_restaurant_orders$restaurant_order$items>
      get copyWith =>
          CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items<
    TRes> {
  factory CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items(
    Query$get_customer_restaurant_orders$restaurant_order$items instance,
    TRes Function(Query$get_customer_restaurant_orders$restaurant_order$items)
        then,
  ) = _CopyWithImpl$Query$get_customer_restaurant_orders$restaurant_order$items;

  factory CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_customer_restaurant_orders$restaurant_order$items;

  TRes call({
    Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item?
        restaurant_item,
    double? cost_per_one,
    int? id,
    String? notes,
    int? quantity,
    String? $__typename,
  });
  CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item<
      TRes> get restaurant_item;
}

class _CopyWithImpl$Query$get_customer_restaurant_orders$restaurant_order$items<
        TRes>
    implements
        CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items<
            TRes> {
  _CopyWithImpl$Query$get_customer_restaurant_orders$restaurant_order$items(
    this._instance,
    this._then,
  );

  final Query$get_customer_restaurant_orders$restaurant_order$items _instance;

  final TRes Function(
      Query$get_customer_restaurant_orders$restaurant_order$items) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_item = _undefined,
    Object? cost_per_one = _undefined,
    Object? id = _undefined,
    Object? notes = _undefined,
    Object? quantity = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_customer_restaurant_orders$restaurant_order$items(
        restaurant_item: restaurant_item == _undefined ||
                restaurant_item == null
            ? _instance.restaurant_item
            : (restaurant_item
                as Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item),
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
  CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item<
      TRes> get restaurant_item {
    final local$restaurant_item = _instance.restaurant_item;
    return CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item(
        local$restaurant_item, (e) => call(restaurant_item: e));
  }
}

class _CopyWithStubImpl$Query$get_customer_restaurant_orders$restaurant_order$items<
        TRes>
    implements
        CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items<
            TRes> {
  _CopyWithStubImpl$Query$get_customer_restaurant_orders$restaurant_order$items(
      this._res);

  TRes _res;

  call({
    Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item?
        restaurant_item,
    double? cost_per_one,
    int? id,
    String? notes,
    int? quantity,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item<
          TRes>
      get restaurant_item =>
          CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item
              .stub(_res);
}

class Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item {
  Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item({
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

  factory Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item.fromJson(
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
    return Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item(
      item_type: (l$item_type as String),
      name:
          Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name
              .fromJson((l$name as Map<String, dynamic>)),
      description: l$description == null
          ? null
          : Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description
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

  final Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name
      name;

  final Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description?
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
            is Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item) ||
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

extension UtilityExtension$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item
    on Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item {
  CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item<
          Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item>
      get copyWith =>
          CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item<
    TRes> {
  factory CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item(
    Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item
        instance,
    TRes Function(
            Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item)
        then,
  ) = _CopyWithImpl$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item;

  factory CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item;

  TRes call({
    String? item_type,
    Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name?
        name,
    Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description?
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
  CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name<
      TRes> get name;
  CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description<
      TRes> get description;
}

class _CopyWithImpl$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item<
        TRes>
    implements
        CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item<
            TRes> {
  _CopyWithImpl$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item(
    this._instance,
    this._then,
  );

  final Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item
      _instance;

  final TRes Function(
          Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item)
      _then;

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
      _then(
          Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item(
        item_type: item_type == _undefined || item_type == null
            ? _instance.item_type
            : (item_type as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name),
        description: description == _undefined
            ? _instance.description
            : (description
                as Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description?),
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
  CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name<
      TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name(
        local$name, (e) => call(name: e));
  }

  CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description<
      TRes> get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description
            .stub(_then(_instance))
        : CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description(
            local$description, (e) => call(description: e));
  }
}

class _CopyWithStubImpl$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item<
        TRes>
    implements
        CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item<
            TRes> {
  _CopyWithStubImpl$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item(
      this._res);

  TRes _res;

  call({
    String? item_type,
    Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name?
        name,
    Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description?
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
  CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name<
          TRes>
      get name =>
          CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name
              .stub(_res);
  CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description<
          TRes>
      get description =>
          CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description
              .stub(_res);
}

class Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name {
  Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name({
    required this.translations,
    required this.$__typename,
  });

  factory Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name$translations>
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
            is Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name) ||
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

extension UtilityExtension$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name
    on Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name {
  CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name<
          Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name>
      get copyWith =>
          CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name<
    TRes> {
  factory CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name(
    Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name
        instance,
    TRes Function(
            Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name)
        then,
  ) = _CopyWithImpl$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name;

  factory CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name;

  TRes call({
    List<Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name$translations> Function(
              Iterable<
                  CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name$translations<
                      Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name<
        TRes>
    implements
        CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name<
            TRes> {
  _CopyWithImpl$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name(
    this._instance,
    this._then,
  );

  final Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name
      _instance;

  final TRes Function(
          Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name$translations> Function(
                  Iterable<
                      CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name$translations<
                          Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name<
        TRes>
    implements
        CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name<
            TRes> {
  _CopyWithStubImpl$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name(
      this._res);

  TRes _res;

  call({
    List<Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name$translations {
  Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name$translations(
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
            is Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name$translations) ||
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

extension UtilityExtension$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name$translations
    on Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name$translations {
  CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name$translations<
          Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name$translations>
      get copyWith =>
          CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name$translations<
    TRes> {
  factory CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name$translations(
    Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name$translations
        instance,
    TRes Function(
            Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name$translations)
        then,
  ) = _CopyWithImpl$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name$translations;

  factory CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name$translations<
        TRes>
    implements
        CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name$translations<
            TRes> {
  _CopyWithImpl$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name$translations(
    this._instance,
    this._then,
  );

  final Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name$translations
      _instance;

  final TRes Function(
          Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name$translations(
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

class _CopyWithStubImpl$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name$translations<
        TRes>
    implements
        CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description {
  Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description({
    required this.translations,
    required this.$__typename,
  });

  factory Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description$translations>
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
            is Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description) ||
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

extension UtilityExtension$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description
    on Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description {
  CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description<
          Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description>
      get copyWith =>
          CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description<
    TRes> {
  factory CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description(
    Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description
        instance,
    TRes Function(
            Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description)
        then,
  ) = _CopyWithImpl$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description;

  factory CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description;

  TRes call({
    List<Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description$translations> Function(
              Iterable<
                  CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description$translations<
                      Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description$translations>>)
          _fn);
}

class _CopyWithImpl$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description<
        TRes>
    implements
        CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description<
            TRes> {
  _CopyWithImpl$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description(
    this._instance,
    this._then,
  );

  final Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description
      _instance;

  final TRes Function(
          Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description$translations> Function(
                  Iterable<
                      CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description$translations<
                          Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description<
        TRes>
    implements
        CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description<
            TRes> {
  _CopyWithStubImpl$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description(
      this._res);

  TRes _res;

  call({
    List<Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description$translations {
  Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description$translations(
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
            is Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description$translations) ||
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

extension UtilityExtension$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description$translations
    on Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description$translations {
  CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description$translations<
          Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description$translations>
      get copyWith =>
          CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description$translations<
    TRes> {
  factory CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description$translations(
    Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description$translations
        instance,
    TRes Function(
            Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description$translations)
        then,
  ) = _CopyWithImpl$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description$translations;

  factory CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description$translations<
        TRes>
    implements
        CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description$translations<
            TRes> {
  _CopyWithImpl$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description$translations(
    this._instance,
    this._then,
  );

  final Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description$translations
      _instance;

  final TRes Function(
          Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description$translations(
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

class _CopyWithStubImpl$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description$translations<
        TRes>
    implements
        CopyWith$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description$translations<
            TRes> {
  _CopyWithStubImpl$Query$get_customer_restaurant_orders$restaurant_order$items$restaurant_item$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_customer_restaurant_orders$restaurant_order$delivery {
  Query$get_customer_restaurant_orders$restaurant_order$delivery({
    this.actual_delivered_time,
    this.actual_package_ready_time,
    this.actual_arrival_at_pickup_time,
    this.actual_arrival_at_dropoff_time,
    this.cancellation_time,
    this.current_gps,
    required this.delivery_cost,
    required this.$__typename,
  });

  factory Query$get_customer_restaurant_orders$restaurant_order$delivery.fromJson(
      Map<String, dynamic> json) {
    final l$actual_delivered_time = json['actual_delivered_time'];
    final l$actual_package_ready_time = json['actual_package_ready_time'];
    final l$actual_arrival_at_pickup_time =
        json['actual_arrival_at_pickup_time'];
    final l$actual_arrival_at_dropoff_time =
        json['actual_arrival_at_dropoff_time'];
    final l$cancellation_time = json['cancellation_time'];
    final l$current_gps = json['current_gps'];
    final l$delivery_cost = json['delivery_cost'];
    final l$$__typename = json['__typename'];
    return Query$get_customer_restaurant_orders$restaurant_order$delivery(
      actual_delivered_time: (l$actual_delivered_time as String?),
      actual_package_ready_time: (l$actual_package_ready_time as String?),
      actual_arrival_at_pickup_time:
          (l$actual_arrival_at_pickup_time as String?),
      actual_arrival_at_dropoff_time:
          (l$actual_arrival_at_dropoff_time as String?),
      cancellation_time: (l$cancellation_time as String?),
      current_gps:
          l$current_gps == null ? null : geographyFromJson(l$current_gps),
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
    final l$delivery_cost = delivery_cost;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$actual_delivered_time,
      l$actual_package_ready_time,
      l$actual_arrival_at_pickup_time,
      l$actual_arrival_at_dropoff_time,
      l$cancellation_time,
      l$current_gps,
      l$delivery_cost,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$get_customer_restaurant_orders$restaurant_order$delivery) ||
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

extension UtilityExtension$Query$get_customer_restaurant_orders$restaurant_order$delivery
    on Query$get_customer_restaurant_orders$restaurant_order$delivery {
  CopyWith$Query$get_customer_restaurant_orders$restaurant_order$delivery<
          Query$get_customer_restaurant_orders$restaurant_order$delivery>
      get copyWith =>
          CopyWith$Query$get_customer_restaurant_orders$restaurant_order$delivery(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_customer_restaurant_orders$restaurant_order$delivery<
    TRes> {
  factory CopyWith$Query$get_customer_restaurant_orders$restaurant_order$delivery(
    Query$get_customer_restaurant_orders$restaurant_order$delivery instance,
    TRes Function(
            Query$get_customer_restaurant_orders$restaurant_order$delivery)
        then,
  ) = _CopyWithImpl$Query$get_customer_restaurant_orders$restaurant_order$delivery;

  factory CopyWith$Query$get_customer_restaurant_orders$restaurant_order$delivery.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_customer_restaurant_orders$restaurant_order$delivery;

  TRes call({
    String? actual_delivered_time,
    String? actual_package_ready_time,
    String? actual_arrival_at_pickup_time,
    String? actual_arrival_at_dropoff_time,
    String? cancellation_time,
    Geography? current_gps,
    double? delivery_cost,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_customer_restaurant_orders$restaurant_order$delivery<
        TRes>
    implements
        CopyWith$Query$get_customer_restaurant_orders$restaurant_order$delivery<
            TRes> {
  _CopyWithImpl$Query$get_customer_restaurant_orders$restaurant_order$delivery(
    this._instance,
    this._then,
  );

  final Query$get_customer_restaurant_orders$restaurant_order$delivery
      _instance;

  final TRes Function(
      Query$get_customer_restaurant_orders$restaurant_order$delivery) _then;

  static const _undefined = {};

  TRes call({
    Object? actual_delivered_time = _undefined,
    Object? actual_package_ready_time = _undefined,
    Object? actual_arrival_at_pickup_time = _undefined,
    Object? actual_arrival_at_dropoff_time = _undefined,
    Object? cancellation_time = _undefined,
    Object? current_gps = _undefined,
    Object? delivery_cost = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_customer_restaurant_orders$restaurant_order$delivery(
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
        delivery_cost: delivery_cost == _undefined || delivery_cost == null
            ? _instance.delivery_cost
            : (delivery_cost as double),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_customer_restaurant_orders$restaurant_order$delivery<
        TRes>
    implements
        CopyWith$Query$get_customer_restaurant_orders$restaurant_order$delivery<
            TRes> {
  _CopyWithStubImpl$Query$get_customer_restaurant_orders$restaurant_order$delivery(
      this._res);

  TRes _res;

  call({
    String? actual_delivered_time,
    String? actual_package_ready_time,
    String? actual_arrival_at_pickup_time,
    String? actual_arrival_at_dropoff_time,
    String? cancellation_time,
    Geography? current_gps,
    double? delivery_cost,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Subscription$listenOnCustomerRestaurantInProcessOrders {
  factory Variables$Subscription$listenOnCustomerRestaurantInProcessOrders({
    required int customerId,
    required bool inprocess,
  }) =>
      Variables$Subscription$listenOnCustomerRestaurantInProcessOrders._({
        r'customerId': customerId,
        r'inprocess': inprocess,
      });

  Variables$Subscription$listenOnCustomerRestaurantInProcessOrders._(
      this._$data);

  factory Variables$Subscription$listenOnCustomerRestaurantInProcessOrders.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$customerId = data['customerId'];
    result$data['customerId'] = (l$customerId as int);
    final l$inprocess = data['inprocess'];
    result$data['inprocess'] = (l$inprocess as bool);
    return Variables$Subscription$listenOnCustomerRestaurantInProcessOrders._(
        result$data);
  }

  Map<String, dynamic> _$data;

  int get customerId => (_$data['customerId'] as int);
  bool get inprocess => (_$data['inprocess'] as bool);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$customerId = customerId;
    result$data['customerId'] = l$customerId;
    final l$inprocess = inprocess;
    result$data['inprocess'] = l$inprocess;
    return result$data;
  }

  CopyWith$Variables$Subscription$listenOnCustomerRestaurantInProcessOrders<
          Variables$Subscription$listenOnCustomerRestaurantInProcessOrders>
      get copyWith =>
          CopyWith$Variables$Subscription$listenOnCustomerRestaurantInProcessOrders(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Variables$Subscription$listenOnCustomerRestaurantInProcessOrders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$customerId = customerId;
    final lOther$customerId = other.customerId;
    if (l$customerId != lOther$customerId) {
      return false;
    }
    final l$inprocess = inprocess;
    final lOther$inprocess = other.inprocess;
    if (l$inprocess != lOther$inprocess) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$customerId = customerId;
    final l$inprocess = inprocess;
    return Object.hashAll([
      l$customerId,
      l$inprocess,
    ]);
  }
}

abstract class CopyWith$Variables$Subscription$listenOnCustomerRestaurantInProcessOrders<
    TRes> {
  factory CopyWith$Variables$Subscription$listenOnCustomerRestaurantInProcessOrders(
    Variables$Subscription$listenOnCustomerRestaurantInProcessOrders instance,
    TRes Function(
            Variables$Subscription$listenOnCustomerRestaurantInProcessOrders)
        then,
  ) = _CopyWithImpl$Variables$Subscription$listenOnCustomerRestaurantInProcessOrders;

  factory CopyWith$Variables$Subscription$listenOnCustomerRestaurantInProcessOrders.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Subscription$listenOnCustomerRestaurantInProcessOrders;

  TRes call({
    int? customerId,
    bool? inprocess,
  });
}

class _CopyWithImpl$Variables$Subscription$listenOnCustomerRestaurantInProcessOrders<
        TRes>
    implements
        CopyWith$Variables$Subscription$listenOnCustomerRestaurantInProcessOrders<
            TRes> {
  _CopyWithImpl$Variables$Subscription$listenOnCustomerRestaurantInProcessOrders(
    this._instance,
    this._then,
  );

  final Variables$Subscription$listenOnCustomerRestaurantInProcessOrders
      _instance;

  final TRes Function(
      Variables$Subscription$listenOnCustomerRestaurantInProcessOrders) _then;

  static const _undefined = {};

  TRes call({
    Object? customerId = _undefined,
    Object? inprocess = _undefined,
  }) =>
      _then(Variables$Subscription$listenOnCustomerRestaurantInProcessOrders._({
        ..._instance._$data,
        if (customerId != _undefined && customerId != null)
          'customerId': (customerId as int),
        if (inprocess != _undefined && inprocess != null)
          'inprocess': (inprocess as bool),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$listenOnCustomerRestaurantInProcessOrders<
        TRes>
    implements
        CopyWith$Variables$Subscription$listenOnCustomerRestaurantInProcessOrders<
            TRes> {
  _CopyWithStubImpl$Variables$Subscription$listenOnCustomerRestaurantInProcessOrders(
      this._res);

  TRes _res;

  call({
    int? customerId,
    bool? inprocess,
  }) =>
      _res;
}

class Subscription$listenOnCustomerRestaurantInProcessOrders {
  Subscription$listenOnCustomerRestaurantInProcessOrders({
    required this.restaurant_order,
    required this.$__typename,
  });

  factory Subscription$listenOnCustomerRestaurantInProcessOrders.fromJson(
      Map<String, dynamic> json) {
    final l$restaurant_order = json['restaurant_order'];
    final l$$__typename = json['__typename'];
    return Subscription$listenOnCustomerRestaurantInProcessOrders(
      restaurant_order: (l$restaurant_order as List<dynamic>)
          .map((e) =>
              Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order>
      restaurant_order;

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
    if (!(other is Subscription$listenOnCustomerRestaurantInProcessOrders) ||
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

extension UtilityExtension$Subscription$listenOnCustomerRestaurantInProcessOrders
    on Subscription$listenOnCustomerRestaurantInProcessOrders {
  CopyWith$Subscription$listenOnCustomerRestaurantInProcessOrders<
          Subscription$listenOnCustomerRestaurantInProcessOrders>
      get copyWith =>
          CopyWith$Subscription$listenOnCustomerRestaurantInProcessOrders(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listenOnCustomerRestaurantInProcessOrders<
    TRes> {
  factory CopyWith$Subscription$listenOnCustomerRestaurantInProcessOrders(
    Subscription$listenOnCustomerRestaurantInProcessOrders instance,
    TRes Function(Subscription$listenOnCustomerRestaurantInProcessOrders) then,
  ) = _CopyWithImpl$Subscription$listenOnCustomerRestaurantInProcessOrders;

  factory CopyWith$Subscription$listenOnCustomerRestaurantInProcessOrders.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listenOnCustomerRestaurantInProcessOrders;

  TRes call({
    List<Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order>?
        restaurant_order,
    String? $__typename,
  });
  TRes restaurant_order(
      Iterable<Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order> Function(
              Iterable<
                  CopyWith$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order<
                      Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order>>)
          _fn);
}

class _CopyWithImpl$Subscription$listenOnCustomerRestaurantInProcessOrders<TRes>
    implements
        CopyWith$Subscription$listenOnCustomerRestaurantInProcessOrders<TRes> {
  _CopyWithImpl$Subscription$listenOnCustomerRestaurantInProcessOrders(
    this._instance,
    this._then,
  );

  final Subscription$listenOnCustomerRestaurantInProcessOrders _instance;

  final TRes Function(Subscription$listenOnCustomerRestaurantInProcessOrders)
      _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_order = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listenOnCustomerRestaurantInProcessOrders(
        restaurant_order: restaurant_order == _undefined ||
                restaurant_order == null
            ? _instance.restaurant_order
            : (restaurant_order as List<
                Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes restaurant_order(
          Iterable<Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order> Function(
                  Iterable<
                      CopyWith$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order<
                          Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order>>)
              _fn) =>
      call(
          restaurant_order: _fn(_instance.restaurant_order.map((e) =>
              CopyWith$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$listenOnCustomerRestaurantInProcessOrders<
        TRes>
    implements
        CopyWith$Subscription$listenOnCustomerRestaurantInProcessOrders<TRes> {
  _CopyWithStubImpl$Subscription$listenOnCustomerRestaurantInProcessOrders(
      this._res);

  TRes _res;

  call({
    List<Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order>?
        restaurant_order,
    String? $__typename,
  }) =>
      _res;
  restaurant_order(_fn) => _res;
}

const documentNodeSubscriptionlistenOnCustomerRestaurantInProcessOrders =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'listenOnCustomerRestaurantInProcessOrders'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'customerId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'inprocess')),
        type: NamedTypeNode(
          name: NameNode(value: 'Boolean'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
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
                    value: VariableNode(name: NameNode(value: 'customerId')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'in_process'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'inprocess')),
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
            name: NameNode(value: 'order_time'),
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
            name: NameNode(value: 'delivery_cost'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'total_cost'),
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
Subscription$listenOnCustomerRestaurantInProcessOrders
    _parserFn$Subscription$listenOnCustomerRestaurantInProcessOrders(
            Map<String, dynamic> data) =>
        Subscription$listenOnCustomerRestaurantInProcessOrders.fromJson(data);

class Options$Subscription$listenOnCustomerRestaurantInProcessOrders
    extends graphql.SubscriptionOptions<
        Subscription$listenOnCustomerRestaurantInProcessOrders> {
  Options$Subscription$listenOnCustomerRestaurantInProcessOrders({
    String? operationName,
    required Variables$Subscription$listenOnCustomerRestaurantInProcessOrders
        variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document:
              documentNodeSubscriptionlistenOnCustomerRestaurantInProcessOrders,
          parserFn:
              _parserFn$Subscription$listenOnCustomerRestaurantInProcessOrders,
        );
}

class WatchOptions$Subscription$listenOnCustomerRestaurantInProcessOrders
    extends graphql.WatchQueryOptions<
        Subscription$listenOnCustomerRestaurantInProcessOrders> {
  WatchOptions$Subscription$listenOnCustomerRestaurantInProcessOrders({
    String? operationName,
    required Variables$Subscription$listenOnCustomerRestaurantInProcessOrders
        variables,
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
          document:
              documentNodeSubscriptionlistenOnCustomerRestaurantInProcessOrders,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn:
              _parserFn$Subscription$listenOnCustomerRestaurantInProcessOrders,
        );
}

class FetchMoreOptions$Subscription$listenOnCustomerRestaurantInProcessOrders
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$listenOnCustomerRestaurantInProcessOrders({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$listenOnCustomerRestaurantInProcessOrders
        variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document:
              documentNodeSubscriptionlistenOnCustomerRestaurantInProcessOrders,
        );
}

extension ClientExtension$Subscription$listenOnCustomerRestaurantInProcessOrders
    on graphql.GraphQLClient {
  Stream<
          graphql.QueryResult<
              Subscription$listenOnCustomerRestaurantInProcessOrders>>
      subscribe$listenOnCustomerRestaurantInProcessOrders(
              Options$Subscription$listenOnCustomerRestaurantInProcessOrders
                  options) =>
          this.subscribe(options);
  graphql.ObservableQuery<
          Subscription$listenOnCustomerRestaurantInProcessOrders>
      watchSubscription$listenOnCustomerRestaurantInProcessOrders(
              WatchOptions$Subscription$listenOnCustomerRestaurantInProcessOrders
                  options) =>
          this.watchQuery(options);
}

class Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order {
  Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order({
    required this.id,
    required this.order_time,
    required this.status,
    required this.delivery_cost,
    this.total_cost,
    this.to_location_address,
    required this.restaurant,
    required this.$__typename,
  });

  factory Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$order_time = json['order_time'];
    final l$status = json['status'];
    final l$delivery_cost = json['delivery_cost'];
    final l$total_cost = json['total_cost'];
    final l$to_location_address = json['to_location_address'];
    final l$restaurant = json['restaurant'];
    final l$$__typename = json['__typename'];
    return Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order(
      id: (l$id as int),
      order_time: (l$order_time as String),
      status: (l$status as String),
      delivery_cost: moneyFromJson(l$delivery_cost),
      total_cost: l$total_cost == null ? null : moneyFromJson(l$total_cost),
      to_location_address: (l$to_location_address as String?),
      restaurant:
          Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant
              .fromJson((l$restaurant as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String order_time;

  final String status;

  final double delivery_cost;

  final double? total_cost;

  final String? to_location_address;

  final Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant
      restaurant;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$order_time = order_time;
    _resultData['order_time'] = l$order_time;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$delivery_cost = delivery_cost;
    _resultData['delivery_cost'] = moneyToJson(l$delivery_cost);
    final l$total_cost = total_cost;
    _resultData['total_cost'] =
        l$total_cost == null ? null : moneyToJson(l$total_cost);
    final l$to_location_address = to_location_address;
    _resultData['to_location_address'] = l$to_location_address;
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$order_time = order_time;
    final l$status = status;
    final l$delivery_cost = delivery_cost;
    final l$total_cost = total_cost;
    final l$to_location_address = to_location_address;
    final l$restaurant = restaurant;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$order_time,
      l$status,
      l$delivery_cost,
      l$total_cost,
      l$to_location_address,
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
            is Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$order_time = order_time;
    final lOther$order_time = other.order_time;
    if (l$order_time != lOther$order_time) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$delivery_cost = delivery_cost;
    final lOther$delivery_cost = other.delivery_cost;
    if (l$delivery_cost != lOther$delivery_cost) {
      return false;
    }
    final l$total_cost = total_cost;
    final lOther$total_cost = other.total_cost;
    if (l$total_cost != lOther$total_cost) {
      return false;
    }
    final l$to_location_address = to_location_address;
    final lOther$to_location_address = other.to_location_address;
    if (l$to_location_address != lOther$to_location_address) {
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

extension UtilityExtension$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order
    on Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order {
  CopyWith$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order<
          Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order>
      get copyWith =>
          CopyWith$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order<
    TRes> {
  factory CopyWith$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order(
    Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order
        instance,
    TRes Function(
            Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order)
        then,
  ) = _CopyWithImpl$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order;

  factory CopyWith$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order;

  TRes call({
    int? id,
    String? order_time,
    String? status,
    double? delivery_cost,
    double? total_cost,
    String? to_location_address,
    Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant?
        restaurant,
    String? $__typename,
  });
  CopyWith$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant<
      TRes> get restaurant;
}

class _CopyWithImpl$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order<
        TRes>
    implements
        CopyWith$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order<
            TRes> {
  _CopyWithImpl$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order(
    this._instance,
    this._then,
  );

  final Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order
      _instance;

  final TRes Function(
          Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? order_time = _undefined,
    Object? status = _undefined,
    Object? delivery_cost = _undefined,
    Object? total_cost = _undefined,
    Object? to_location_address = _undefined,
    Object? restaurant = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        order_time: order_time == _undefined || order_time == null
            ? _instance.order_time
            : (order_time as String),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        delivery_cost: delivery_cost == _undefined || delivery_cost == null
            ? _instance.delivery_cost
            : (delivery_cost as double),
        total_cost: total_cost == _undefined
            ? _instance.total_cost
            : (total_cost as double?),
        to_location_address: to_location_address == _undefined
            ? _instance.to_location_address
            : (to_location_address as String?),
        restaurant: restaurant == _undefined || restaurant == null
            ? _instance.restaurant
            : (restaurant
                as Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant<
      TRes> get restaurant {
    final local$restaurant = _instance.restaurant;
    return CopyWith$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant(
        local$restaurant, (e) => call(restaurant: e));
  }
}

class _CopyWithStubImpl$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order<
        TRes>
    implements
        CopyWith$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order<
            TRes> {
  _CopyWithStubImpl$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order(
      this._res);

  TRes _res;

  call({
    int? id,
    String? order_time,
    String? status,
    double? delivery_cost,
    double? total_cost,
    String? to_location_address,
    Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant?
        restaurant,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant<
          TRes>
      get restaurant =>
          CopyWith$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant
              .stub(_res);
}

class Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant {
  Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant({
    this.details,
    required this.$__typename,
  });

  factory Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant(
      details: l$details == null
          ? null
          : Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details?
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
            is Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant) ||
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

extension UtilityExtension$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant
    on Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant {
  CopyWith$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant<
          Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant>
      get copyWith =>
          CopyWith$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant<
    TRes> {
  factory CopyWith$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant(
    Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant
        instance,
    TRes Function(
            Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant)
        then,
  ) = _CopyWithImpl$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant;

  factory CopyWith$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant;

  TRes call({
    Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details?
        details,
    String? $__typename,
  });
  CopyWith$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details<
      TRes> get details;
}

class _CopyWithImpl$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant<
        TRes>
    implements
        CopyWith$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant<
            TRes> {
  _CopyWithImpl$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant(
    this._instance,
    this._then,
  );

  final Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant
      _instance;

  final TRes Function(
          Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant)
      _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant(
        details: details == _undefined
            ? _instance.details
            : (details
                as Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details<
      TRes> get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details
            .stub(_then(_instance))
        : CopyWith$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant<
        TRes>
    implements
        CopyWith$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant<
            TRes> {
  _CopyWithStubImpl$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant(
      this._res);

  TRes _res;

  call({
    Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details<
          TRes>
      get details =>
          CopyWith$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details
              .stub(_res);
}

class Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details {
  Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details({
    required this.id,
    required this.name,
    required this.image,
    required this.$__typename,
  });

  factory Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details(
      id: (l$id as int),
      name: (l$name as String),
      image: (l$image as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String name;

  final String image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
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
    final l$id = id;
    final l$name = name;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
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
            is Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details
    on Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details {
  CopyWith$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details<
          Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details>
      get copyWith =>
          CopyWith$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details<
    TRes> {
  factory CopyWith$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details(
    Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details
        instance,
    TRes Function(
            Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details)
        then,
  ) = _CopyWithImpl$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details;

  factory CopyWith$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details;

  TRes call({
    int? id,
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details<
        TRes>
    implements
        CopyWith$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details<
            TRes> {
  _CopyWithImpl$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details(
    this._instance,
    this._then,
  );

  final Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details
      _instance;

  final TRes Function(
          Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details(
        id: id == _undefined || id == null ? _instance.id : (id as int),
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

class _CopyWithStubImpl$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details<
        TRes>
    implements
        CopyWith$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details<
            TRes> {
  _CopyWithStubImpl$Subscription$listenOnCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details(
      this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Subscription$listenOnCustomerLaundryInProcessOrders {
  factory Variables$Subscription$listenOnCustomerLaundryInProcessOrders({
    required int customerId,
    required bool inprocess,
  }) =>
      Variables$Subscription$listenOnCustomerLaundryInProcessOrders._({
        r'customerId': customerId,
        r'inprocess': inprocess,
      });

  Variables$Subscription$listenOnCustomerLaundryInProcessOrders._(this._$data);

  factory Variables$Subscription$listenOnCustomerLaundryInProcessOrders.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$customerId = data['customerId'];
    result$data['customerId'] = (l$customerId as int);
    final l$inprocess = data['inprocess'];
    result$data['inprocess'] = (l$inprocess as bool);
    return Variables$Subscription$listenOnCustomerLaundryInProcessOrders._(
        result$data);
  }

  Map<String, dynamic> _$data;

  int get customerId => (_$data['customerId'] as int);
  bool get inprocess => (_$data['inprocess'] as bool);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$customerId = customerId;
    result$data['customerId'] = l$customerId;
    final l$inprocess = inprocess;
    result$data['inprocess'] = l$inprocess;
    return result$data;
  }

  CopyWith$Variables$Subscription$listenOnCustomerLaundryInProcessOrders<
          Variables$Subscription$listenOnCustomerLaundryInProcessOrders>
      get copyWith =>
          CopyWith$Variables$Subscription$listenOnCustomerLaundryInProcessOrders(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Variables$Subscription$listenOnCustomerLaundryInProcessOrders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$customerId = customerId;
    final lOther$customerId = other.customerId;
    if (l$customerId != lOther$customerId) {
      return false;
    }
    final l$inprocess = inprocess;
    final lOther$inprocess = other.inprocess;
    if (l$inprocess != lOther$inprocess) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$customerId = customerId;
    final l$inprocess = inprocess;
    return Object.hashAll([
      l$customerId,
      l$inprocess,
    ]);
  }
}

abstract class CopyWith$Variables$Subscription$listenOnCustomerLaundryInProcessOrders<
    TRes> {
  factory CopyWith$Variables$Subscription$listenOnCustomerLaundryInProcessOrders(
    Variables$Subscription$listenOnCustomerLaundryInProcessOrders instance,
    TRes Function(Variables$Subscription$listenOnCustomerLaundryInProcessOrders)
        then,
  ) = _CopyWithImpl$Variables$Subscription$listenOnCustomerLaundryInProcessOrders;

  factory CopyWith$Variables$Subscription$listenOnCustomerLaundryInProcessOrders.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Subscription$listenOnCustomerLaundryInProcessOrders;

  TRes call({
    int? customerId,
    bool? inprocess,
  });
}

class _CopyWithImpl$Variables$Subscription$listenOnCustomerLaundryInProcessOrders<
        TRes>
    implements
        CopyWith$Variables$Subscription$listenOnCustomerLaundryInProcessOrders<
            TRes> {
  _CopyWithImpl$Variables$Subscription$listenOnCustomerLaundryInProcessOrders(
    this._instance,
    this._then,
  );

  final Variables$Subscription$listenOnCustomerLaundryInProcessOrders _instance;

  final TRes Function(
      Variables$Subscription$listenOnCustomerLaundryInProcessOrders) _then;

  static const _undefined = {};

  TRes call({
    Object? customerId = _undefined,
    Object? inprocess = _undefined,
  }) =>
      _then(Variables$Subscription$listenOnCustomerLaundryInProcessOrders._({
        ..._instance._$data,
        if (customerId != _undefined && customerId != null)
          'customerId': (customerId as int),
        if (inprocess != _undefined && inprocess != null)
          'inprocess': (inprocess as bool),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$listenOnCustomerLaundryInProcessOrders<
        TRes>
    implements
        CopyWith$Variables$Subscription$listenOnCustomerLaundryInProcessOrders<
            TRes> {
  _CopyWithStubImpl$Variables$Subscription$listenOnCustomerLaundryInProcessOrders(
      this._res);

  TRes _res;

  call({
    int? customerId,
    bool? inprocess,
  }) =>
      _res;
}

class Subscription$listenOnCustomerLaundryInProcessOrders {
  Subscription$listenOnCustomerLaundryInProcessOrders({
    required this.laundry_order,
    required this.$__typename,
  });

  factory Subscription$listenOnCustomerLaundryInProcessOrders.fromJson(
      Map<String, dynamic> json) {
    final l$laundry_order = json['laundry_order'];
    final l$$__typename = json['__typename'];
    return Subscription$listenOnCustomerLaundryInProcessOrders(
      laundry_order: (l$laundry_order as List<dynamic>)
          .map((e) =>
              Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order>
      laundry_order;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$laundry_order = laundry_order;
    _resultData['laundry_order'] =
        l$laundry_order.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$laundry_order = laundry_order;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$laundry_order.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$listenOnCustomerLaundryInProcessOrders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$laundry_order = laundry_order;
    final lOther$laundry_order = other.laundry_order;
    if (l$laundry_order.length != lOther$laundry_order.length) {
      return false;
    }
    for (int i = 0; i < l$laundry_order.length; i++) {
      final l$laundry_order$entry = l$laundry_order[i];
      final lOther$laundry_order$entry = lOther$laundry_order[i];
      if (l$laundry_order$entry != lOther$laundry_order$entry) {
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

extension UtilityExtension$Subscription$listenOnCustomerLaundryInProcessOrders
    on Subscription$listenOnCustomerLaundryInProcessOrders {
  CopyWith$Subscription$listenOnCustomerLaundryInProcessOrders<
          Subscription$listenOnCustomerLaundryInProcessOrders>
      get copyWith =>
          CopyWith$Subscription$listenOnCustomerLaundryInProcessOrders(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listenOnCustomerLaundryInProcessOrders<
    TRes> {
  factory CopyWith$Subscription$listenOnCustomerLaundryInProcessOrders(
    Subscription$listenOnCustomerLaundryInProcessOrders instance,
    TRes Function(Subscription$listenOnCustomerLaundryInProcessOrders) then,
  ) = _CopyWithImpl$Subscription$listenOnCustomerLaundryInProcessOrders;

  factory CopyWith$Subscription$listenOnCustomerLaundryInProcessOrders.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listenOnCustomerLaundryInProcessOrders;

  TRes call({
    List<Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order>?
        laundry_order,
    String? $__typename,
  });
  TRes laundry_order(
      Iterable<Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order> Function(
              Iterable<
                  CopyWith$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order<
                      Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order>>)
          _fn);
}

class _CopyWithImpl$Subscription$listenOnCustomerLaundryInProcessOrders<TRes>
    implements
        CopyWith$Subscription$listenOnCustomerLaundryInProcessOrders<TRes> {
  _CopyWithImpl$Subscription$listenOnCustomerLaundryInProcessOrders(
    this._instance,
    this._then,
  );

  final Subscription$listenOnCustomerLaundryInProcessOrders _instance;

  final TRes Function(Subscription$listenOnCustomerLaundryInProcessOrders)
      _then;

  static const _undefined = {};

  TRes call({
    Object? laundry_order = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listenOnCustomerLaundryInProcessOrders(
        laundry_order: laundry_order == _undefined || laundry_order == null
            ? _instance.laundry_order
            : (laundry_order as List<
                Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes laundry_order(
          Iterable<Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order> Function(
                  Iterable<
                      CopyWith$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order<
                          Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order>>)
              _fn) =>
      call(
          laundry_order: _fn(_instance.laundry_order.map((e) =>
              CopyWith$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$listenOnCustomerLaundryInProcessOrders<
        TRes>
    implements
        CopyWith$Subscription$listenOnCustomerLaundryInProcessOrders<TRes> {
  _CopyWithStubImpl$Subscription$listenOnCustomerLaundryInProcessOrders(
      this._res);

  TRes _res;

  call({
    List<Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order>?
        laundry_order,
    String? $__typename,
  }) =>
      _res;
  laundry_order(_fn) => _res;
}

const documentNodeSubscriptionlistenOnCustomerLaundryInProcessOrders =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'listenOnCustomerLaundryInProcessOrders'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'customerId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'inprocess')),
        type: NamedTypeNode(
          name: NameNode(value: 'Boolean'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'laundry_order'),
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
                    value: VariableNode(name: NameNode(value: 'customerId')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'in_process'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'inprocess')),
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
            name: NameNode(value: 'order_time'),
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
            name: NameNode(value: 'delivery_cost'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'customer_address'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'store'),
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
Subscription$listenOnCustomerLaundryInProcessOrders
    _parserFn$Subscription$listenOnCustomerLaundryInProcessOrders(
            Map<String, dynamic> data) =>
        Subscription$listenOnCustomerLaundryInProcessOrders.fromJson(data);

class Options$Subscription$listenOnCustomerLaundryInProcessOrders
    extends graphql.SubscriptionOptions<
        Subscription$listenOnCustomerLaundryInProcessOrders> {
  Options$Subscription$listenOnCustomerLaundryInProcessOrders({
    String? operationName,
    required Variables$Subscription$listenOnCustomerLaundryInProcessOrders
        variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document:
              documentNodeSubscriptionlistenOnCustomerLaundryInProcessOrders,
          parserFn:
              _parserFn$Subscription$listenOnCustomerLaundryInProcessOrders,
        );
}

class WatchOptions$Subscription$listenOnCustomerLaundryInProcessOrders
    extends graphql.WatchQueryOptions<
        Subscription$listenOnCustomerLaundryInProcessOrders> {
  WatchOptions$Subscription$listenOnCustomerLaundryInProcessOrders({
    String? operationName,
    required Variables$Subscription$listenOnCustomerLaundryInProcessOrders
        variables,
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
          document:
              documentNodeSubscriptionlistenOnCustomerLaundryInProcessOrders,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn:
              _parserFn$Subscription$listenOnCustomerLaundryInProcessOrders,
        );
}

class FetchMoreOptions$Subscription$listenOnCustomerLaundryInProcessOrders
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$listenOnCustomerLaundryInProcessOrders({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$listenOnCustomerLaundryInProcessOrders
        variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document:
              documentNodeSubscriptionlistenOnCustomerLaundryInProcessOrders,
        );
}

extension ClientExtension$Subscription$listenOnCustomerLaundryInProcessOrders
    on graphql.GraphQLClient {
  Stream<
          graphql
              .QueryResult<Subscription$listenOnCustomerLaundryInProcessOrders>>
      subscribe$listenOnCustomerLaundryInProcessOrders(
              Options$Subscription$listenOnCustomerLaundryInProcessOrders
                  options) =>
          this.subscribe(options);
  graphql.ObservableQuery<Subscription$listenOnCustomerLaundryInProcessOrders>
      watchSubscription$listenOnCustomerLaundryInProcessOrders(
              WatchOptions$Subscription$listenOnCustomerLaundryInProcessOrders
                  options) =>
          this.watchQuery(options);
}

class Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order {
  Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order({
    required this.id,
    required this.order_time,
    required this.status,
    required this.delivery_cost,
    this.customer_address,
    required this.store,
    required this.$__typename,
  });

  factory Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$order_time = json['order_time'];
    final l$status = json['status'];
    final l$delivery_cost = json['delivery_cost'];
    final l$customer_address = json['customer_address'];
    final l$store = json['store'];
    final l$$__typename = json['__typename'];
    return Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order(
      id: (l$id as int),
      order_time: (l$order_time as String),
      status: (l$status as String),
      delivery_cost: moneyFromJson(l$delivery_cost),
      customer_address: (l$customer_address as String?),
      store:
          Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store
              .fromJson((l$store as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String order_time;

  final String status;

  final double delivery_cost;

  final String? customer_address;

  final Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store
      store;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$order_time = order_time;
    _resultData['order_time'] = l$order_time;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$delivery_cost = delivery_cost;
    _resultData['delivery_cost'] = moneyToJson(l$delivery_cost);
    final l$customer_address = customer_address;
    _resultData['customer_address'] = l$customer_address;
    final l$store = store;
    _resultData['store'] = l$store.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$order_time = order_time;
    final l$status = status;
    final l$delivery_cost = delivery_cost;
    final l$customer_address = customer_address;
    final l$store = store;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$order_time,
      l$status,
      l$delivery_cost,
      l$customer_address,
      l$store,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$order_time = order_time;
    final lOther$order_time = other.order_time;
    if (l$order_time != lOther$order_time) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$delivery_cost = delivery_cost;
    final lOther$delivery_cost = other.delivery_cost;
    if (l$delivery_cost != lOther$delivery_cost) {
      return false;
    }
    final l$customer_address = customer_address;
    final lOther$customer_address = other.customer_address;
    if (l$customer_address != lOther$customer_address) {
      return false;
    }
    final l$store = store;
    final lOther$store = other.store;
    if (l$store != lOther$store) {
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

extension UtilityExtension$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order
    on Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order {
  CopyWith$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order<
          Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order>
      get copyWith =>
          CopyWith$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order<
    TRes> {
  factory CopyWith$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order(
    Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order instance,
    TRes Function(
            Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order)
        then,
  ) = _CopyWithImpl$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order;

  factory CopyWith$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order;

  TRes call({
    int? id,
    String? order_time,
    String? status,
    double? delivery_cost,
    String? customer_address,
    Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store?
        store,
    String? $__typename,
  });
  CopyWith$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store<
      TRes> get store;
}

class _CopyWithImpl$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order<
        TRes>
    implements
        CopyWith$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order<
            TRes> {
  _CopyWithImpl$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order(
    this._instance,
    this._then,
  );

  final Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order
      _instance;

  final TRes Function(
      Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? order_time = _undefined,
    Object? status = _undefined,
    Object? delivery_cost = _undefined,
    Object? customer_address = _undefined,
    Object? store = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        order_time: order_time == _undefined || order_time == null
            ? _instance.order_time
            : (order_time as String),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        delivery_cost: delivery_cost == _undefined || delivery_cost == null
            ? _instance.delivery_cost
            : (delivery_cost as double),
        customer_address: customer_address == _undefined
            ? _instance.customer_address
            : (customer_address as String?),
        store: store == _undefined || store == null
            ? _instance.store
            : (store
                as Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store<
      TRes> get store {
    final local$store = _instance.store;
    return CopyWith$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store(
        local$store, (e) => call(store: e));
  }
}

class _CopyWithStubImpl$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order<
        TRes>
    implements
        CopyWith$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order<
            TRes> {
  _CopyWithStubImpl$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order(
      this._res);

  TRes _res;

  call({
    int? id,
    String? order_time,
    String? status,
    double? delivery_cost,
    String? customer_address,
    Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store?
        store,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store<
          TRes>
      get store =>
          CopyWith$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store
              .stub(_res);
}

class Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store {
  Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store({
    this.details,
    required this.$__typename,
  });

  factory Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store(
      details: l$details == null
          ? null
          : Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store$details?
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
            is Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store) ||
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

extension UtilityExtension$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store
    on Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store {
  CopyWith$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store<
          Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store>
      get copyWith =>
          CopyWith$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store<
    TRes> {
  factory CopyWith$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store(
    Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store
        instance,
    TRes Function(
            Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store)
        then,
  ) = _CopyWithImpl$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store;

  factory CopyWith$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store;

  TRes call({
    Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store$details?
        details,
    String? $__typename,
  });
  CopyWith$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store$details<
      TRes> get details;
}

class _CopyWithImpl$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store<
        TRes>
    implements
        CopyWith$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store<
            TRes> {
  _CopyWithImpl$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store(
    this._instance,
    this._then,
  );

  final Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store
      _instance;

  final TRes Function(
          Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store)
      _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store(
        details: details == _undefined
            ? _instance.details
            : (details
                as Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store$details<
      TRes> get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store$details
            .stub(_then(_instance))
        : CopyWith$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store<
        TRes>
    implements
        CopyWith$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store<
            TRes> {
  _CopyWithStubImpl$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store(
      this._res);

  TRes _res;

  call({
    Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store$details<
          TRes>
      get details =>
          CopyWith$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store$details
              .stub(_res);
}

class Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store$details {
  Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store$details({
    required this.id,
    required this.name,
    required this.image,
    required this.$__typename,
  });

  factory Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store$details.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store$details(
      id: (l$id as int),
      name: (l$name as String),
      image: (l$image as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String name;

  final String image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
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
    final l$id = id;
    final l$name = name;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
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
            is Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store$details) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store$details
    on Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store$details {
  CopyWith$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store$details<
          Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store$details>
      get copyWith =>
          CopyWith$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store$details<
    TRes> {
  factory CopyWith$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store$details(
    Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store$details
        instance,
    TRes Function(
            Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store$details)
        then,
  ) = _CopyWithImpl$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store$details;

  factory CopyWith$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store$details.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store$details;

  TRes call({
    int? id,
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store$details<
        TRes>
    implements
        CopyWith$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store$details<
            TRes> {
  _CopyWithImpl$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store$details(
    this._instance,
    this._then,
  );

  final Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store$details
      _instance;

  final TRes Function(
          Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store$details(
        id: id == _undefined || id == null ? _instance.id : (id as int),
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

class _CopyWithStubImpl$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store$details<
        TRes>
    implements
        CopyWith$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store$details<
            TRes> {
  _CopyWithStubImpl$Subscription$listenOnCustomerLaundryInProcessOrders$laundry_order$store$details(
      this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getCustomerRestaurantInProcessOrders {
  factory Variables$Query$getCustomerRestaurantInProcessOrders({
    required int customerId,
    required bool inprocess,
  }) =>
      Variables$Query$getCustomerRestaurantInProcessOrders._({
        r'customerId': customerId,
        r'inprocess': inprocess,
      });

  Variables$Query$getCustomerRestaurantInProcessOrders._(this._$data);

  factory Variables$Query$getCustomerRestaurantInProcessOrders.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$customerId = data['customerId'];
    result$data['customerId'] = (l$customerId as int);
    final l$inprocess = data['inprocess'];
    result$data['inprocess'] = (l$inprocess as bool);
    return Variables$Query$getCustomerRestaurantInProcessOrders._(result$data);
  }

  Map<String, dynamic> _$data;

  int get customerId => (_$data['customerId'] as int);
  bool get inprocess => (_$data['inprocess'] as bool);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$customerId = customerId;
    result$data['customerId'] = l$customerId;
    final l$inprocess = inprocess;
    result$data['inprocess'] = l$inprocess;
    return result$data;
  }

  CopyWith$Variables$Query$getCustomerRestaurantInProcessOrders<
          Variables$Query$getCustomerRestaurantInProcessOrders>
      get copyWith =>
          CopyWith$Variables$Query$getCustomerRestaurantInProcessOrders(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getCustomerRestaurantInProcessOrders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$customerId = customerId;
    final lOther$customerId = other.customerId;
    if (l$customerId != lOther$customerId) {
      return false;
    }
    final l$inprocess = inprocess;
    final lOther$inprocess = other.inprocess;
    if (l$inprocess != lOther$inprocess) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$customerId = customerId;
    final l$inprocess = inprocess;
    return Object.hashAll([
      l$customerId,
      l$inprocess,
    ]);
  }
}

abstract class CopyWith$Variables$Query$getCustomerRestaurantInProcessOrders<
    TRes> {
  factory CopyWith$Variables$Query$getCustomerRestaurantInProcessOrders(
    Variables$Query$getCustomerRestaurantInProcessOrders instance,
    TRes Function(Variables$Query$getCustomerRestaurantInProcessOrders) then,
  ) = _CopyWithImpl$Variables$Query$getCustomerRestaurantInProcessOrders;

  factory CopyWith$Variables$Query$getCustomerRestaurantInProcessOrders.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Query$getCustomerRestaurantInProcessOrders;

  TRes call({
    int? customerId,
    bool? inprocess,
  });
}

class _CopyWithImpl$Variables$Query$getCustomerRestaurantInProcessOrders<TRes>
    implements
        CopyWith$Variables$Query$getCustomerRestaurantInProcessOrders<TRes> {
  _CopyWithImpl$Variables$Query$getCustomerRestaurantInProcessOrders(
    this._instance,
    this._then,
  );

  final Variables$Query$getCustomerRestaurantInProcessOrders _instance;

  final TRes Function(Variables$Query$getCustomerRestaurantInProcessOrders)
      _then;

  static const _undefined = {};

  TRes call({
    Object? customerId = _undefined,
    Object? inprocess = _undefined,
  }) =>
      _then(Variables$Query$getCustomerRestaurantInProcessOrders._({
        ..._instance._$data,
        if (customerId != _undefined && customerId != null)
          'customerId': (customerId as int),
        if (inprocess != _undefined && inprocess != null)
          'inprocess': (inprocess as bool),
      }));
}

class _CopyWithStubImpl$Variables$Query$getCustomerRestaurantInProcessOrders<
        TRes>
    implements
        CopyWith$Variables$Query$getCustomerRestaurantInProcessOrders<TRes> {
  _CopyWithStubImpl$Variables$Query$getCustomerRestaurantInProcessOrders(
      this._res);

  TRes _res;

  call({
    int? customerId,
    bool? inprocess,
  }) =>
      _res;
}

class Query$getCustomerRestaurantInProcessOrders {
  Query$getCustomerRestaurantInProcessOrders({
    required this.restaurant_order,
    required this.$__typename,
  });

  factory Query$getCustomerRestaurantInProcessOrders.fromJson(
      Map<String, dynamic> json) {
    final l$restaurant_order = json['restaurant_order'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerRestaurantInProcessOrders(
      restaurant_order: (l$restaurant_order as List<dynamic>)
          .map((e) =>
              Query$getCustomerRestaurantInProcessOrders$restaurant_order
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getCustomerRestaurantInProcessOrders$restaurant_order>
      restaurant_order;

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
    if (!(other is Query$getCustomerRestaurantInProcessOrders) ||
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

extension UtilityExtension$Query$getCustomerRestaurantInProcessOrders
    on Query$getCustomerRestaurantInProcessOrders {
  CopyWith$Query$getCustomerRestaurantInProcessOrders<
          Query$getCustomerRestaurantInProcessOrders>
      get copyWith => CopyWith$Query$getCustomerRestaurantInProcessOrders(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerRestaurantInProcessOrders<TRes> {
  factory CopyWith$Query$getCustomerRestaurantInProcessOrders(
    Query$getCustomerRestaurantInProcessOrders instance,
    TRes Function(Query$getCustomerRestaurantInProcessOrders) then,
  ) = _CopyWithImpl$Query$getCustomerRestaurantInProcessOrders;

  factory CopyWith$Query$getCustomerRestaurantInProcessOrders.stub(TRes res) =
      _CopyWithStubImpl$Query$getCustomerRestaurantInProcessOrders;

  TRes call({
    List<Query$getCustomerRestaurantInProcessOrders$restaurant_order>?
        restaurant_order,
    String? $__typename,
  });
  TRes restaurant_order(
      Iterable<Query$getCustomerRestaurantInProcessOrders$restaurant_order> Function(
              Iterable<
                  CopyWith$Query$getCustomerRestaurantInProcessOrders$restaurant_order<
                      Query$getCustomerRestaurantInProcessOrders$restaurant_order>>)
          _fn);
}

class _CopyWithImpl$Query$getCustomerRestaurantInProcessOrders<TRes>
    implements CopyWith$Query$getCustomerRestaurantInProcessOrders<TRes> {
  _CopyWithImpl$Query$getCustomerRestaurantInProcessOrders(
    this._instance,
    this._then,
  );

  final Query$getCustomerRestaurantInProcessOrders _instance;

  final TRes Function(Query$getCustomerRestaurantInProcessOrders) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_order = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getCustomerRestaurantInProcessOrders(
        restaurant_order: restaurant_order == _undefined ||
                restaurant_order == null
            ? _instance.restaurant_order
            : (restaurant_order as List<
                Query$getCustomerRestaurantInProcessOrders$restaurant_order>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes restaurant_order(
          Iterable<Query$getCustomerRestaurantInProcessOrders$restaurant_order> Function(
                  Iterable<
                      CopyWith$Query$getCustomerRestaurantInProcessOrders$restaurant_order<
                          Query$getCustomerRestaurantInProcessOrders$restaurant_order>>)
              _fn) =>
      call(
          restaurant_order: _fn(_instance.restaurant_order.map((e) =>
              CopyWith$Query$getCustomerRestaurantInProcessOrders$restaurant_order(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getCustomerRestaurantInProcessOrders<TRes>
    implements CopyWith$Query$getCustomerRestaurantInProcessOrders<TRes> {
  _CopyWithStubImpl$Query$getCustomerRestaurantInProcessOrders(this._res);

  TRes _res;

  call({
    List<Query$getCustomerRestaurantInProcessOrders$restaurant_order>?
        restaurant_order,
    String? $__typename,
  }) =>
      _res;
  restaurant_order(_fn) => _res;
}

const documentNodeQuerygetCustomerRestaurantInProcessOrders =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getCustomerRestaurantInProcessOrders'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'customerId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'inprocess')),
        type: NamedTypeNode(
          name: NameNode(value: 'Boolean'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
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
                    value: VariableNode(name: NameNode(value: 'customerId')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'in_process'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'inprocess')),
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
            name: NameNode(value: 'order_time'),
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
            name: NameNode(value: 'delivery_cost'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'total_cost'),
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
Query$getCustomerRestaurantInProcessOrders
    _parserFn$Query$getCustomerRestaurantInProcessOrders(
            Map<String, dynamic> data) =>
        Query$getCustomerRestaurantInProcessOrders.fromJson(data);

class Options$Query$getCustomerRestaurantInProcessOrders
    extends graphql.QueryOptions<Query$getCustomerRestaurantInProcessOrders> {
  Options$Query$getCustomerRestaurantInProcessOrders({
    String? operationName,
    required Variables$Query$getCustomerRestaurantInProcessOrders variables,
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
          document: documentNodeQuerygetCustomerRestaurantInProcessOrders,
          parserFn: _parserFn$Query$getCustomerRestaurantInProcessOrders,
        );
}

class WatchOptions$Query$getCustomerRestaurantInProcessOrders extends graphql
    .WatchQueryOptions<Query$getCustomerRestaurantInProcessOrders> {
  WatchOptions$Query$getCustomerRestaurantInProcessOrders({
    String? operationName,
    required Variables$Query$getCustomerRestaurantInProcessOrders variables,
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
          document: documentNodeQuerygetCustomerRestaurantInProcessOrders,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getCustomerRestaurantInProcessOrders,
        );
}

class FetchMoreOptions$Query$getCustomerRestaurantInProcessOrders
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getCustomerRestaurantInProcessOrders({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getCustomerRestaurantInProcessOrders variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetCustomerRestaurantInProcessOrders,
        );
}

extension ClientExtension$Query$getCustomerRestaurantInProcessOrders
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getCustomerRestaurantInProcessOrders>>
      query$getCustomerRestaurantInProcessOrders(
              Options$Query$getCustomerRestaurantInProcessOrders
                  options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getCustomerRestaurantInProcessOrders>
      watchQuery$getCustomerRestaurantInProcessOrders(
              WatchOptions$Query$getCustomerRestaurantInProcessOrders
                  options) =>
          this.watchQuery(options);
  void writeQuery$getCustomerRestaurantInProcessOrders({
    required Query$getCustomerRestaurantInProcessOrders data,
    required Variables$Query$getCustomerRestaurantInProcessOrders variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetCustomerRestaurantInProcessOrders),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getCustomerRestaurantInProcessOrders?
      readQuery$getCustomerRestaurantInProcessOrders({
    required Variables$Query$getCustomerRestaurantInProcessOrders variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQuerygetCustomerRestaurantInProcessOrders),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$getCustomerRestaurantInProcessOrders.fromJson(result);
  }
}

class Query$getCustomerRestaurantInProcessOrders$restaurant_order {
  Query$getCustomerRestaurantInProcessOrders$restaurant_order({
    required this.id,
    required this.order_time,
    required this.status,
    required this.delivery_cost,
    this.total_cost,
    this.to_location_address,
    required this.restaurant,
    required this.$__typename,
  });

  factory Query$getCustomerRestaurantInProcessOrders$restaurant_order.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$order_time = json['order_time'];
    final l$status = json['status'];
    final l$delivery_cost = json['delivery_cost'];
    final l$total_cost = json['total_cost'];
    final l$to_location_address = json['to_location_address'];
    final l$restaurant = json['restaurant'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerRestaurantInProcessOrders$restaurant_order(
      id: (l$id as int),
      order_time: (l$order_time as String),
      status: (l$status as String),
      delivery_cost: moneyFromJson(l$delivery_cost),
      total_cost: l$total_cost == null ? null : moneyFromJson(l$total_cost),
      to_location_address: (l$to_location_address as String?),
      restaurant:
          Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant
              .fromJson((l$restaurant as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String order_time;

  final String status;

  final double delivery_cost;

  final double? total_cost;

  final String? to_location_address;

  final Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant
      restaurant;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$order_time = order_time;
    _resultData['order_time'] = l$order_time;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$delivery_cost = delivery_cost;
    _resultData['delivery_cost'] = moneyToJson(l$delivery_cost);
    final l$total_cost = total_cost;
    _resultData['total_cost'] =
        l$total_cost == null ? null : moneyToJson(l$total_cost);
    final l$to_location_address = to_location_address;
    _resultData['to_location_address'] = l$to_location_address;
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$order_time = order_time;
    final l$status = status;
    final l$delivery_cost = delivery_cost;
    final l$total_cost = total_cost;
    final l$to_location_address = to_location_address;
    final l$restaurant = restaurant;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$order_time,
      l$status,
      l$delivery_cost,
      l$total_cost,
      l$to_location_address,
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
            is Query$getCustomerRestaurantInProcessOrders$restaurant_order) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$order_time = order_time;
    final lOther$order_time = other.order_time;
    if (l$order_time != lOther$order_time) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$delivery_cost = delivery_cost;
    final lOther$delivery_cost = other.delivery_cost;
    if (l$delivery_cost != lOther$delivery_cost) {
      return false;
    }
    final l$total_cost = total_cost;
    final lOther$total_cost = other.total_cost;
    if (l$total_cost != lOther$total_cost) {
      return false;
    }
    final l$to_location_address = to_location_address;
    final lOther$to_location_address = other.to_location_address;
    if (l$to_location_address != lOther$to_location_address) {
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

extension UtilityExtension$Query$getCustomerRestaurantInProcessOrders$restaurant_order
    on Query$getCustomerRestaurantInProcessOrders$restaurant_order {
  CopyWith$Query$getCustomerRestaurantInProcessOrders$restaurant_order<
          Query$getCustomerRestaurantInProcessOrders$restaurant_order>
      get copyWith =>
          CopyWith$Query$getCustomerRestaurantInProcessOrders$restaurant_order(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerRestaurantInProcessOrders$restaurant_order<
    TRes> {
  factory CopyWith$Query$getCustomerRestaurantInProcessOrders$restaurant_order(
    Query$getCustomerRestaurantInProcessOrders$restaurant_order instance,
    TRes Function(Query$getCustomerRestaurantInProcessOrders$restaurant_order)
        then,
  ) = _CopyWithImpl$Query$getCustomerRestaurantInProcessOrders$restaurant_order;

  factory CopyWith$Query$getCustomerRestaurantInProcessOrders$restaurant_order.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCustomerRestaurantInProcessOrders$restaurant_order;

  TRes call({
    int? id,
    String? order_time,
    String? status,
    double? delivery_cost,
    double? total_cost,
    String? to_location_address,
    Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant?
        restaurant,
    String? $__typename,
  });
  CopyWith$Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant<
      TRes> get restaurant;
}

class _CopyWithImpl$Query$getCustomerRestaurantInProcessOrders$restaurant_order<
        TRes>
    implements
        CopyWith$Query$getCustomerRestaurantInProcessOrders$restaurant_order<
            TRes> {
  _CopyWithImpl$Query$getCustomerRestaurantInProcessOrders$restaurant_order(
    this._instance,
    this._then,
  );

  final Query$getCustomerRestaurantInProcessOrders$restaurant_order _instance;

  final TRes Function(
      Query$getCustomerRestaurantInProcessOrders$restaurant_order) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? order_time = _undefined,
    Object? status = _undefined,
    Object? delivery_cost = _undefined,
    Object? total_cost = _undefined,
    Object? to_location_address = _undefined,
    Object? restaurant = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getCustomerRestaurantInProcessOrders$restaurant_order(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        order_time: order_time == _undefined || order_time == null
            ? _instance.order_time
            : (order_time as String),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        delivery_cost: delivery_cost == _undefined || delivery_cost == null
            ? _instance.delivery_cost
            : (delivery_cost as double),
        total_cost: total_cost == _undefined
            ? _instance.total_cost
            : (total_cost as double?),
        to_location_address: to_location_address == _undefined
            ? _instance.to_location_address
            : (to_location_address as String?),
        restaurant: restaurant == _undefined || restaurant == null
            ? _instance.restaurant
            : (restaurant
                as Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant<
      TRes> get restaurant {
    final local$restaurant = _instance.restaurant;
    return CopyWith$Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant(
        local$restaurant, (e) => call(restaurant: e));
  }
}

class _CopyWithStubImpl$Query$getCustomerRestaurantInProcessOrders$restaurant_order<
        TRes>
    implements
        CopyWith$Query$getCustomerRestaurantInProcessOrders$restaurant_order<
            TRes> {
  _CopyWithStubImpl$Query$getCustomerRestaurantInProcessOrders$restaurant_order(
      this._res);

  TRes _res;

  call({
    int? id,
    String? order_time,
    String? status,
    double? delivery_cost,
    double? total_cost,
    String? to_location_address,
    Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant?
        restaurant,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant<
          TRes>
      get restaurant =>
          CopyWith$Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant
              .stub(_res);
}

class Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant {
  Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant({
    this.details,
    required this.$__typename,
  });

  factory Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant(
      details: l$details == null
          ? null
          : Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details?
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
            is Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant) ||
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

extension UtilityExtension$Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant
    on Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant {
  CopyWith$Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant<
          Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant>
      get copyWith =>
          CopyWith$Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant<
    TRes> {
  factory CopyWith$Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant(
    Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant
        instance,
    TRes Function(
            Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant)
        then,
  ) = _CopyWithImpl$Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant;

  factory CopyWith$Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant;

  TRes call({
    Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details?
        details,
    String? $__typename,
  });
  CopyWith$Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details<
      TRes> get details;
}

class _CopyWithImpl$Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant<
        TRes>
    implements
        CopyWith$Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant<
            TRes> {
  _CopyWithImpl$Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant(
    this._instance,
    this._then,
  );

  final Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant
      _instance;

  final TRes Function(
          Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant)
      _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant(
        details: details == _undefined
            ? _instance.details
            : (details
                as Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details<
      TRes> get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details
            .stub(_then(_instance))
        : CopyWith$Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant<
        TRes>
    implements
        CopyWith$Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant<
            TRes> {
  _CopyWithStubImpl$Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant(
      this._res);

  TRes _res;

  call({
    Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details<
          TRes>
      get details =>
          CopyWith$Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details
              .stub(_res);
}

class Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details {
  Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details({
    required this.id,
    required this.name,
    required this.image,
    required this.$__typename,
  });

  factory Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details(
      id: (l$id as int),
      name: (l$name as String),
      image: (l$image as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String name;

  final String image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
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
    final l$id = id;
    final l$name = name;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
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
            is Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details
    on Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details {
  CopyWith$Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details<
          Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details>
      get copyWith =>
          CopyWith$Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details<
    TRes> {
  factory CopyWith$Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details(
    Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details
        instance,
    TRes Function(
            Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details)
        then,
  ) = _CopyWithImpl$Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details;

  factory CopyWith$Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details;

  TRes call({
    int? id,
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details<
        TRes>
    implements
        CopyWith$Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details<
            TRes> {
  _CopyWithImpl$Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details(
    this._instance,
    this._then,
  );

  final Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details
      _instance;

  final TRes Function(
          Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details(
        id: id == _undefined || id == null ? _instance.id : (id as int),
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

class _CopyWithStubImpl$Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details<
        TRes>
    implements
        CopyWith$Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details<
            TRes> {
  _CopyWithStubImpl$Query$getCustomerRestaurantInProcessOrders$restaurant_order$restaurant$details(
      this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getCustomerLaundryInProcessOrders {
  factory Variables$Query$getCustomerLaundryInProcessOrders({
    required int customerId,
    required bool inprocess,
  }) =>
      Variables$Query$getCustomerLaundryInProcessOrders._({
        r'customerId': customerId,
        r'inprocess': inprocess,
      });

  Variables$Query$getCustomerLaundryInProcessOrders._(this._$data);

  factory Variables$Query$getCustomerLaundryInProcessOrders.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$customerId = data['customerId'];
    result$data['customerId'] = (l$customerId as int);
    final l$inprocess = data['inprocess'];
    result$data['inprocess'] = (l$inprocess as bool);
    return Variables$Query$getCustomerLaundryInProcessOrders._(result$data);
  }

  Map<String, dynamic> _$data;

  int get customerId => (_$data['customerId'] as int);
  bool get inprocess => (_$data['inprocess'] as bool);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$customerId = customerId;
    result$data['customerId'] = l$customerId;
    final l$inprocess = inprocess;
    result$data['inprocess'] = l$inprocess;
    return result$data;
  }

  CopyWith$Variables$Query$getCustomerLaundryInProcessOrders<
          Variables$Query$getCustomerLaundryInProcessOrders>
      get copyWith =>
          CopyWith$Variables$Query$getCustomerLaundryInProcessOrders(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getCustomerLaundryInProcessOrders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$customerId = customerId;
    final lOther$customerId = other.customerId;
    if (l$customerId != lOther$customerId) {
      return false;
    }
    final l$inprocess = inprocess;
    final lOther$inprocess = other.inprocess;
    if (l$inprocess != lOther$inprocess) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$customerId = customerId;
    final l$inprocess = inprocess;
    return Object.hashAll([
      l$customerId,
      l$inprocess,
    ]);
  }
}

abstract class CopyWith$Variables$Query$getCustomerLaundryInProcessOrders<
    TRes> {
  factory CopyWith$Variables$Query$getCustomerLaundryInProcessOrders(
    Variables$Query$getCustomerLaundryInProcessOrders instance,
    TRes Function(Variables$Query$getCustomerLaundryInProcessOrders) then,
  ) = _CopyWithImpl$Variables$Query$getCustomerLaundryInProcessOrders;

  factory CopyWith$Variables$Query$getCustomerLaundryInProcessOrders.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Query$getCustomerLaundryInProcessOrders;

  TRes call({
    int? customerId,
    bool? inprocess,
  });
}

class _CopyWithImpl$Variables$Query$getCustomerLaundryInProcessOrders<TRes>
    implements
        CopyWith$Variables$Query$getCustomerLaundryInProcessOrders<TRes> {
  _CopyWithImpl$Variables$Query$getCustomerLaundryInProcessOrders(
    this._instance,
    this._then,
  );

  final Variables$Query$getCustomerLaundryInProcessOrders _instance;

  final TRes Function(Variables$Query$getCustomerLaundryInProcessOrders) _then;

  static const _undefined = {};

  TRes call({
    Object? customerId = _undefined,
    Object? inprocess = _undefined,
  }) =>
      _then(Variables$Query$getCustomerLaundryInProcessOrders._({
        ..._instance._$data,
        if (customerId != _undefined && customerId != null)
          'customerId': (customerId as int),
        if (inprocess != _undefined && inprocess != null)
          'inprocess': (inprocess as bool),
      }));
}

class _CopyWithStubImpl$Variables$Query$getCustomerLaundryInProcessOrders<TRes>
    implements
        CopyWith$Variables$Query$getCustomerLaundryInProcessOrders<TRes> {
  _CopyWithStubImpl$Variables$Query$getCustomerLaundryInProcessOrders(
      this._res);

  TRes _res;

  call({
    int? customerId,
    bool? inprocess,
  }) =>
      _res;
}

class Query$getCustomerLaundryInProcessOrders {
  Query$getCustomerLaundryInProcessOrders({
    required this.laundry_order,
    required this.$__typename,
  });

  factory Query$getCustomerLaundryInProcessOrders.fromJson(
      Map<String, dynamic> json) {
    final l$laundry_order = json['laundry_order'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerLaundryInProcessOrders(
      laundry_order: (l$laundry_order as List<dynamic>)
          .map((e) =>
              Query$getCustomerLaundryInProcessOrders$laundry_order.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getCustomerLaundryInProcessOrders$laundry_order>
      laundry_order;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$laundry_order = laundry_order;
    _resultData['laundry_order'] =
        l$laundry_order.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$laundry_order = laundry_order;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$laundry_order.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getCustomerLaundryInProcessOrders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$laundry_order = laundry_order;
    final lOther$laundry_order = other.laundry_order;
    if (l$laundry_order.length != lOther$laundry_order.length) {
      return false;
    }
    for (int i = 0; i < l$laundry_order.length; i++) {
      final l$laundry_order$entry = l$laundry_order[i];
      final lOther$laundry_order$entry = lOther$laundry_order[i];
      if (l$laundry_order$entry != lOther$laundry_order$entry) {
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

extension UtilityExtension$Query$getCustomerLaundryInProcessOrders
    on Query$getCustomerLaundryInProcessOrders {
  CopyWith$Query$getCustomerLaundryInProcessOrders<
          Query$getCustomerLaundryInProcessOrders>
      get copyWith => CopyWith$Query$getCustomerLaundryInProcessOrders(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerLaundryInProcessOrders<TRes> {
  factory CopyWith$Query$getCustomerLaundryInProcessOrders(
    Query$getCustomerLaundryInProcessOrders instance,
    TRes Function(Query$getCustomerLaundryInProcessOrders) then,
  ) = _CopyWithImpl$Query$getCustomerLaundryInProcessOrders;

  factory CopyWith$Query$getCustomerLaundryInProcessOrders.stub(TRes res) =
      _CopyWithStubImpl$Query$getCustomerLaundryInProcessOrders;

  TRes call({
    List<Query$getCustomerLaundryInProcessOrders$laundry_order>? laundry_order,
    String? $__typename,
  });
  TRes laundry_order(
      Iterable<Query$getCustomerLaundryInProcessOrders$laundry_order> Function(
              Iterable<
                  CopyWith$Query$getCustomerLaundryInProcessOrders$laundry_order<
                      Query$getCustomerLaundryInProcessOrders$laundry_order>>)
          _fn);
}

class _CopyWithImpl$Query$getCustomerLaundryInProcessOrders<TRes>
    implements CopyWith$Query$getCustomerLaundryInProcessOrders<TRes> {
  _CopyWithImpl$Query$getCustomerLaundryInProcessOrders(
    this._instance,
    this._then,
  );

  final Query$getCustomerLaundryInProcessOrders _instance;

  final TRes Function(Query$getCustomerLaundryInProcessOrders) _then;

  static const _undefined = {};

  TRes call({
    Object? laundry_order = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getCustomerLaundryInProcessOrders(
        laundry_order: laundry_order == _undefined || laundry_order == null
            ? _instance.laundry_order
            : (laundry_order
                as List<Query$getCustomerLaundryInProcessOrders$laundry_order>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes laundry_order(
          Iterable<Query$getCustomerLaundryInProcessOrders$laundry_order> Function(
                  Iterable<
                      CopyWith$Query$getCustomerLaundryInProcessOrders$laundry_order<
                          Query$getCustomerLaundryInProcessOrders$laundry_order>>)
              _fn) =>
      call(
          laundry_order: _fn(_instance.laundry_order.map((e) =>
              CopyWith$Query$getCustomerLaundryInProcessOrders$laundry_order(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getCustomerLaundryInProcessOrders<TRes>
    implements CopyWith$Query$getCustomerLaundryInProcessOrders<TRes> {
  _CopyWithStubImpl$Query$getCustomerLaundryInProcessOrders(this._res);

  TRes _res;

  call({
    List<Query$getCustomerLaundryInProcessOrders$laundry_order>? laundry_order,
    String? $__typename,
  }) =>
      _res;
  laundry_order(_fn) => _res;
}

const documentNodeQuerygetCustomerLaundryInProcessOrders =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getCustomerLaundryInProcessOrders'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'customerId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'inprocess')),
        type: NamedTypeNode(
          name: NameNode(value: 'Boolean'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'laundry_order'),
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
                    value: VariableNode(name: NameNode(value: 'customerId')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'in_process'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'inprocess')),
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
            name: NameNode(value: 'order_time'),
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
            name: NameNode(value: 'delivery_cost'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'customer_address'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'store'),
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
Query$getCustomerLaundryInProcessOrders
    _parserFn$Query$getCustomerLaundryInProcessOrders(
            Map<String, dynamic> data) =>
        Query$getCustomerLaundryInProcessOrders.fromJson(data);

class Options$Query$getCustomerLaundryInProcessOrders
    extends graphql.QueryOptions<Query$getCustomerLaundryInProcessOrders> {
  Options$Query$getCustomerLaundryInProcessOrders({
    String? operationName,
    required Variables$Query$getCustomerLaundryInProcessOrders variables,
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
          document: documentNodeQuerygetCustomerLaundryInProcessOrders,
          parserFn: _parserFn$Query$getCustomerLaundryInProcessOrders,
        );
}

class WatchOptions$Query$getCustomerLaundryInProcessOrders
    extends graphql.WatchQueryOptions<Query$getCustomerLaundryInProcessOrders> {
  WatchOptions$Query$getCustomerLaundryInProcessOrders({
    String? operationName,
    required Variables$Query$getCustomerLaundryInProcessOrders variables,
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
          document: documentNodeQuerygetCustomerLaundryInProcessOrders,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getCustomerLaundryInProcessOrders,
        );
}

class FetchMoreOptions$Query$getCustomerLaundryInProcessOrders
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getCustomerLaundryInProcessOrders({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getCustomerLaundryInProcessOrders variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetCustomerLaundryInProcessOrders,
        );
}

extension ClientExtension$Query$getCustomerLaundryInProcessOrders
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getCustomerLaundryInProcessOrders>>
      query$getCustomerLaundryInProcessOrders(
              Options$Query$getCustomerLaundryInProcessOrders options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getCustomerLaundryInProcessOrders>
      watchQuery$getCustomerLaundryInProcessOrders(
              WatchOptions$Query$getCustomerLaundryInProcessOrders options) =>
          this.watchQuery(options);
  void writeQuery$getCustomerLaundryInProcessOrders({
    required Query$getCustomerLaundryInProcessOrders data,
    required Variables$Query$getCustomerLaundryInProcessOrders variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetCustomerLaundryInProcessOrders),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getCustomerLaundryInProcessOrders?
      readQuery$getCustomerLaundryInProcessOrders({
    required Variables$Query$getCustomerLaundryInProcessOrders variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQuerygetCustomerLaundryInProcessOrders),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$getCustomerLaundryInProcessOrders.fromJson(result);
  }
}

class Query$getCustomerLaundryInProcessOrders$laundry_order {
  Query$getCustomerLaundryInProcessOrders$laundry_order({
    required this.id,
    required this.order_time,
    required this.status,
    required this.delivery_cost,
    this.customer_address,
    required this.store,
    required this.$__typename,
  });

  factory Query$getCustomerLaundryInProcessOrders$laundry_order.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$order_time = json['order_time'];
    final l$status = json['status'];
    final l$delivery_cost = json['delivery_cost'];
    final l$customer_address = json['customer_address'];
    final l$store = json['store'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerLaundryInProcessOrders$laundry_order(
      id: (l$id as int),
      order_time: (l$order_time as String),
      status: (l$status as String),
      delivery_cost: moneyFromJson(l$delivery_cost),
      customer_address: (l$customer_address as String?),
      store:
          Query$getCustomerLaundryInProcessOrders$laundry_order$store.fromJson(
              (l$store as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String order_time;

  final String status;

  final double delivery_cost;

  final String? customer_address;

  final Query$getCustomerLaundryInProcessOrders$laundry_order$store store;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$order_time = order_time;
    _resultData['order_time'] = l$order_time;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$delivery_cost = delivery_cost;
    _resultData['delivery_cost'] = moneyToJson(l$delivery_cost);
    final l$customer_address = customer_address;
    _resultData['customer_address'] = l$customer_address;
    final l$store = store;
    _resultData['store'] = l$store.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$order_time = order_time;
    final l$status = status;
    final l$delivery_cost = delivery_cost;
    final l$customer_address = customer_address;
    final l$store = store;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$order_time,
      l$status,
      l$delivery_cost,
      l$customer_address,
      l$store,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getCustomerLaundryInProcessOrders$laundry_order) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$order_time = order_time;
    final lOther$order_time = other.order_time;
    if (l$order_time != lOther$order_time) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$delivery_cost = delivery_cost;
    final lOther$delivery_cost = other.delivery_cost;
    if (l$delivery_cost != lOther$delivery_cost) {
      return false;
    }
    final l$customer_address = customer_address;
    final lOther$customer_address = other.customer_address;
    if (l$customer_address != lOther$customer_address) {
      return false;
    }
    final l$store = store;
    final lOther$store = other.store;
    if (l$store != lOther$store) {
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

extension UtilityExtension$Query$getCustomerLaundryInProcessOrders$laundry_order
    on Query$getCustomerLaundryInProcessOrders$laundry_order {
  CopyWith$Query$getCustomerLaundryInProcessOrders$laundry_order<
          Query$getCustomerLaundryInProcessOrders$laundry_order>
      get copyWith =>
          CopyWith$Query$getCustomerLaundryInProcessOrders$laundry_order(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerLaundryInProcessOrders$laundry_order<
    TRes> {
  factory CopyWith$Query$getCustomerLaundryInProcessOrders$laundry_order(
    Query$getCustomerLaundryInProcessOrders$laundry_order instance,
    TRes Function(Query$getCustomerLaundryInProcessOrders$laundry_order) then,
  ) = _CopyWithImpl$Query$getCustomerLaundryInProcessOrders$laundry_order;

  factory CopyWith$Query$getCustomerLaundryInProcessOrders$laundry_order.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCustomerLaundryInProcessOrders$laundry_order;

  TRes call({
    int? id,
    String? order_time,
    String? status,
    double? delivery_cost,
    String? customer_address,
    Query$getCustomerLaundryInProcessOrders$laundry_order$store? store,
    String? $__typename,
  });
  CopyWith$Query$getCustomerLaundryInProcessOrders$laundry_order$store<TRes>
      get store;
}

class _CopyWithImpl$Query$getCustomerLaundryInProcessOrders$laundry_order<TRes>
    implements
        CopyWith$Query$getCustomerLaundryInProcessOrders$laundry_order<TRes> {
  _CopyWithImpl$Query$getCustomerLaundryInProcessOrders$laundry_order(
    this._instance,
    this._then,
  );

  final Query$getCustomerLaundryInProcessOrders$laundry_order _instance;

  final TRes Function(Query$getCustomerLaundryInProcessOrders$laundry_order)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? order_time = _undefined,
    Object? status = _undefined,
    Object? delivery_cost = _undefined,
    Object? customer_address = _undefined,
    Object? store = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getCustomerLaundryInProcessOrders$laundry_order(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        order_time: order_time == _undefined || order_time == null
            ? _instance.order_time
            : (order_time as String),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        delivery_cost: delivery_cost == _undefined || delivery_cost == null
            ? _instance.delivery_cost
            : (delivery_cost as double),
        customer_address: customer_address == _undefined
            ? _instance.customer_address
            : (customer_address as String?),
        store: store == _undefined || store == null
            ? _instance.store
            : (store
                as Query$getCustomerLaundryInProcessOrders$laundry_order$store),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getCustomerLaundryInProcessOrders$laundry_order$store<TRes>
      get store {
    final local$store = _instance.store;
    return CopyWith$Query$getCustomerLaundryInProcessOrders$laundry_order$store(
        local$store, (e) => call(store: e));
  }
}

class _CopyWithStubImpl$Query$getCustomerLaundryInProcessOrders$laundry_order<
        TRes>
    implements
        CopyWith$Query$getCustomerLaundryInProcessOrders$laundry_order<TRes> {
  _CopyWithStubImpl$Query$getCustomerLaundryInProcessOrders$laundry_order(
      this._res);

  TRes _res;

  call({
    int? id,
    String? order_time,
    String? status,
    double? delivery_cost,
    String? customer_address,
    Query$getCustomerLaundryInProcessOrders$laundry_order$store? store,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getCustomerLaundryInProcessOrders$laundry_order$store<TRes>
      get store =>
          CopyWith$Query$getCustomerLaundryInProcessOrders$laundry_order$store
              .stub(_res);
}

class Query$getCustomerLaundryInProcessOrders$laundry_order$store {
  Query$getCustomerLaundryInProcessOrders$laundry_order$store({
    this.details,
    required this.$__typename,
  });

  factory Query$getCustomerLaundryInProcessOrders$laundry_order$store.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerLaundryInProcessOrders$laundry_order$store(
      details: l$details == null
          ? null
          : Query$getCustomerLaundryInProcessOrders$laundry_order$store$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getCustomerLaundryInProcessOrders$laundry_order$store$details?
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
            is Query$getCustomerLaundryInProcessOrders$laundry_order$store) ||
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

extension UtilityExtension$Query$getCustomerLaundryInProcessOrders$laundry_order$store
    on Query$getCustomerLaundryInProcessOrders$laundry_order$store {
  CopyWith$Query$getCustomerLaundryInProcessOrders$laundry_order$store<
          Query$getCustomerLaundryInProcessOrders$laundry_order$store>
      get copyWith =>
          CopyWith$Query$getCustomerLaundryInProcessOrders$laundry_order$store(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerLaundryInProcessOrders$laundry_order$store<
    TRes> {
  factory CopyWith$Query$getCustomerLaundryInProcessOrders$laundry_order$store(
    Query$getCustomerLaundryInProcessOrders$laundry_order$store instance,
    TRes Function(Query$getCustomerLaundryInProcessOrders$laundry_order$store)
        then,
  ) = _CopyWithImpl$Query$getCustomerLaundryInProcessOrders$laundry_order$store;

  factory CopyWith$Query$getCustomerLaundryInProcessOrders$laundry_order$store.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCustomerLaundryInProcessOrders$laundry_order$store;

  TRes call({
    Query$getCustomerLaundryInProcessOrders$laundry_order$store$details?
        details,
    String? $__typename,
  });
  CopyWith$Query$getCustomerLaundryInProcessOrders$laundry_order$store$details<
      TRes> get details;
}

class _CopyWithImpl$Query$getCustomerLaundryInProcessOrders$laundry_order$store<
        TRes>
    implements
        CopyWith$Query$getCustomerLaundryInProcessOrders$laundry_order$store<
            TRes> {
  _CopyWithImpl$Query$getCustomerLaundryInProcessOrders$laundry_order$store(
    this._instance,
    this._then,
  );

  final Query$getCustomerLaundryInProcessOrders$laundry_order$store _instance;

  final TRes Function(
      Query$getCustomerLaundryInProcessOrders$laundry_order$store) _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getCustomerLaundryInProcessOrders$laundry_order$store(
        details: details == _undefined
            ? _instance.details
            : (details
                as Query$getCustomerLaundryInProcessOrders$laundry_order$store$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getCustomerLaundryInProcessOrders$laundry_order$store$details<
      TRes> get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$getCustomerLaundryInProcessOrders$laundry_order$store$details
            .stub(_then(_instance))
        : CopyWith$Query$getCustomerLaundryInProcessOrders$laundry_order$store$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$getCustomerLaundryInProcessOrders$laundry_order$store<
        TRes>
    implements
        CopyWith$Query$getCustomerLaundryInProcessOrders$laundry_order$store<
            TRes> {
  _CopyWithStubImpl$Query$getCustomerLaundryInProcessOrders$laundry_order$store(
      this._res);

  TRes _res;

  call({
    Query$getCustomerLaundryInProcessOrders$laundry_order$store$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getCustomerLaundryInProcessOrders$laundry_order$store$details<
          TRes>
      get details =>
          CopyWith$Query$getCustomerLaundryInProcessOrders$laundry_order$store$details
              .stub(_res);
}

class Query$getCustomerLaundryInProcessOrders$laundry_order$store$details {
  Query$getCustomerLaundryInProcessOrders$laundry_order$store$details({
    required this.id,
    required this.name,
    required this.image,
    required this.$__typename,
  });

  factory Query$getCustomerLaundryInProcessOrders$laundry_order$store$details.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerLaundryInProcessOrders$laundry_order$store$details(
      id: (l$id as int),
      name: (l$name as String),
      image: (l$image as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String name;

  final String image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
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
    final l$id = id;
    final l$name = name;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
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
            is Query$getCustomerLaundryInProcessOrders$laundry_order$store$details) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getCustomerLaundryInProcessOrders$laundry_order$store$details
    on Query$getCustomerLaundryInProcessOrders$laundry_order$store$details {
  CopyWith$Query$getCustomerLaundryInProcessOrders$laundry_order$store$details<
          Query$getCustomerLaundryInProcessOrders$laundry_order$store$details>
      get copyWith =>
          CopyWith$Query$getCustomerLaundryInProcessOrders$laundry_order$store$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerLaundryInProcessOrders$laundry_order$store$details<
    TRes> {
  factory CopyWith$Query$getCustomerLaundryInProcessOrders$laundry_order$store$details(
    Query$getCustomerLaundryInProcessOrders$laundry_order$store$details
        instance,
    TRes Function(
            Query$getCustomerLaundryInProcessOrders$laundry_order$store$details)
        then,
  ) = _CopyWithImpl$Query$getCustomerLaundryInProcessOrders$laundry_order$store$details;

  factory CopyWith$Query$getCustomerLaundryInProcessOrders$laundry_order$store$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCustomerLaundryInProcessOrders$laundry_order$store$details;

  TRes call({
    int? id,
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getCustomerLaundryInProcessOrders$laundry_order$store$details<
        TRes>
    implements
        CopyWith$Query$getCustomerLaundryInProcessOrders$laundry_order$store$details<
            TRes> {
  _CopyWithImpl$Query$getCustomerLaundryInProcessOrders$laundry_order$store$details(
    this._instance,
    this._then,
  );

  final Query$getCustomerLaundryInProcessOrders$laundry_order$store$details
      _instance;

  final TRes Function(
          Query$getCustomerLaundryInProcessOrders$laundry_order$store$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getCustomerLaundryInProcessOrders$laundry_order$store$details(
        id: id == _undefined || id == null ? _instance.id : (id as int),
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

class _CopyWithStubImpl$Query$getCustomerLaundryInProcessOrders$laundry_order$store$details<
        TRes>
    implements
        CopyWith$Query$getCustomerLaundryInProcessOrders$laundry_order$store$details<
            TRes> {
  _CopyWithStubImpl$Query$getCustomerLaundryInProcessOrders$laundry_order$store$details(
      this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}
