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

class Variables$Query$get_customer_orders {
  factory Variables$Query$get_customer_orders({
    required int custId,
    required bool inProcess,
  }) =>
      Variables$Query$get_customer_orders._({
        r'custId': custId,
        r'inProcess': inProcess,
      });

  Variables$Query$get_customer_orders._(this._$data);

  factory Variables$Query$get_customer_orders.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$custId = data['custId'];
    result$data['custId'] = (l$custId as int);
    final l$inProcess = data['inProcess'];
    result$data['inProcess'] = (l$inProcess as bool);
    return Variables$Query$get_customer_orders._(result$data);
  }

  Map<String, dynamic> _$data;

  int get custId => (_$data['custId'] as int);
  bool get inProcess => (_$data['inProcess'] as bool);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$custId = custId;
    result$data['custId'] = l$custId;
    final l$inProcess = inProcess;
    result$data['inProcess'] = l$inProcess;
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
    final l$custId = custId;
    final lOther$custId = other.custId;
    if (l$custId != lOther$custId) {
      return false;
    }
    final l$inProcess = inProcess;
    final lOther$inProcess = other.inProcess;
    if (l$inProcess != lOther$inProcess) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$custId = custId;
    final l$inProcess = inProcess;
    return Object.hashAll([
      l$custId,
      l$inProcess,
    ]);
  }
}

abstract class CopyWith$Variables$Query$get_customer_orders<TRes> {
  factory CopyWith$Variables$Query$get_customer_orders(
    Variables$Query$get_customer_orders instance,
    TRes Function(Variables$Query$get_customer_orders) then,
  ) = _CopyWithImpl$Variables$Query$get_customer_orders;

  factory CopyWith$Variables$Query$get_customer_orders.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$get_customer_orders;

  TRes call({
    int? custId,
    bool? inProcess,
  });
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

  TRes call({
    Object? custId = _undefined,
    Object? inProcess = _undefined,
  }) =>
      _then(Variables$Query$get_customer_orders._({
        ..._instance._$data,
        if (custId != _undefined && custId != null) 'custId': (custId as int),
        if (inProcess != _undefined && inProcess != null)
          'inProcess': (inProcess as bool),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_customer_orders<TRes>
    implements CopyWith$Variables$Query$get_customer_orders<TRes> {
  _CopyWithStubImpl$Variables$Query$get_customer_orders(this._res);

  TRes _res;

  call({
    int? custId,
    bool? inProcess,
  }) =>
      _res;
}

class Query$get_customer_orders {
  Query$get_customer_orders({
    required this.customer_minimal_orders,
    required this.$__typename,
  });

  factory Query$get_customer_orders.fromJson(Map<String, dynamic> json) {
    final l$customer_minimal_orders = json['customer_minimal_orders'];
    final l$$__typename = json['__typename'];
    return Query$get_customer_orders(
      customer_minimal_orders: (l$customer_minimal_orders as List<dynamic>)
          .map((e) =>
              Query$get_customer_orders$customer_minimal_orders.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$get_customer_orders$customer_minimal_orders>
      customer_minimal_orders;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$customer_minimal_orders = customer_minimal_orders;
    _resultData['customer_minimal_orders'] =
        l$customer_minimal_orders.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$customer_minimal_orders = customer_minimal_orders;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$customer_minimal_orders.map((v) => v)),
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
    final l$customer_minimal_orders = customer_minimal_orders;
    final lOther$customer_minimal_orders = other.customer_minimal_orders;
    if (l$customer_minimal_orders.length !=
        lOther$customer_minimal_orders.length) {
      return false;
    }
    for (int i = 0; i < l$customer_minimal_orders.length; i++) {
      final l$customer_minimal_orders$entry = l$customer_minimal_orders[i];
      final lOther$customer_minimal_orders$entry =
          lOther$customer_minimal_orders[i];
      if (l$customer_minimal_orders$entry !=
          lOther$customer_minimal_orders$entry) {
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
    List<Query$get_customer_orders$customer_minimal_orders>?
        customer_minimal_orders,
    String? $__typename,
  });
  TRes customer_minimal_orders(
      Iterable<Query$get_customer_orders$customer_minimal_orders> Function(
              Iterable<
                  CopyWith$Query$get_customer_orders$customer_minimal_orders<
                      Query$get_customer_orders$customer_minimal_orders>>)
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
    Object? customer_minimal_orders = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_customer_orders(
        customer_minimal_orders: customer_minimal_orders == _undefined ||
                customer_minimal_orders == null
            ? _instance.customer_minimal_orders
            : (customer_minimal_orders
                as List<Query$get_customer_orders$customer_minimal_orders>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes customer_minimal_orders(
          Iterable<Query$get_customer_orders$customer_minimal_orders> Function(
                  Iterable<
                      CopyWith$Query$get_customer_orders$customer_minimal_orders<
                          Query$get_customer_orders$customer_minimal_orders>>)
              _fn) =>
      call(
          customer_minimal_orders: _fn(_instance.customer_minimal_orders.map(
              (e) => CopyWith$Query$get_customer_orders$customer_minimal_orders(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$get_customer_orders<TRes>
    implements CopyWith$Query$get_customer_orders<TRes> {
  _CopyWithStubImpl$Query$get_customer_orders(this._res);

  TRes _res;

  call({
    List<Query$get_customer_orders$customer_minimal_orders>?
        customer_minimal_orders,
    String? $__typename,
  }) =>
      _res;
  customer_minimal_orders(_fn) => _res;
}

const documentNodeQueryget_customer_orders = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_customer_orders'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'custId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'inProcess')),
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
        name: NameNode(value: 'customer_minimal_orders'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'args'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'customer_id'),
                value: VariableNode(name: NameNode(value: 'custId')),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'in_process'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'inProcess')),
                  )
                ]),
              )
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
            name: NameNode(value: 'image'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'in_process'),
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
            name: NameNode(value: 'order_time'),
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
            name: NameNode(value: 'payment_type'),
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
            name: NameNode(value: 'total_cost'),
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

class Query$get_customer_orders$customer_minimal_orders {
  Query$get_customer_orders$customer_minimal_orders({
    required this.id,
    required this.image,
    required this.in_process,
    required this.name,
    required this.order_time,
    required this.order_type,
    required this.payment_type,
    required this.status,
    required this.total_cost,
    required this.$__typename,
  });

  factory Query$get_customer_orders$customer_minimal_orders.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$image = json['image'];
    final l$in_process = json['in_process'];
    final l$name = json['name'];
    final l$order_time = json['order_time'];
    final l$order_type = json['order_type'];
    final l$payment_type = json['payment_type'];
    final l$status = json['status'];
    final l$total_cost = json['total_cost'];
    final l$$__typename = json['__typename'];
    return Query$get_customer_orders$customer_minimal_orders(
      id: (l$id as int),
      image: (l$image as String),
      in_process: (l$in_process as bool),
      name: (l$name as String),
      order_time: (l$order_time as String),
      order_type: (l$order_type as String),
      payment_type: (l$payment_type as String),
      status: (l$status as String),
      total_cost: moneyFromJson(l$total_cost),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String image;

  final bool in_process;

  final String name;

  final String order_time;

  final String order_type;

  final String payment_type;

  final String status;

  final double total_cost;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$in_process = in_process;
    _resultData['in_process'] = l$in_process;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$order_time = order_time;
    _resultData['order_time'] = l$order_time;
    final l$order_type = order_type;
    _resultData['order_type'] = l$order_type;
    final l$payment_type = payment_type;
    _resultData['payment_type'] = l$payment_type;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$total_cost = total_cost;
    _resultData['total_cost'] = moneyToJson(l$total_cost);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$image = image;
    final l$in_process = in_process;
    final l$name = name;
    final l$order_time = order_time;
    final l$order_type = order_type;
    final l$payment_type = payment_type;
    final l$status = status;
    final l$total_cost = total_cost;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$image,
      l$in_process,
      l$name,
      l$order_time,
      l$order_type,
      l$payment_type,
      l$status,
      l$total_cost,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_customer_orders$customer_minimal_orders) ||
        runtimeType != other.runtimeType) {
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
    final l$in_process = in_process;
    final lOther$in_process = other.in_process;
    if (l$in_process != lOther$in_process) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$order_time = order_time;
    final lOther$order_time = other.order_time;
    if (l$order_time != lOther$order_time) {
      return false;
    }
    final l$order_type = order_type;
    final lOther$order_type = other.order_type;
    if (l$order_type != lOther$order_type) {
      return false;
    }
    final l$payment_type = payment_type;
    final lOther$payment_type = other.payment_type;
    if (l$payment_type != lOther$payment_type) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$total_cost = total_cost;
    final lOther$total_cost = other.total_cost;
    if (l$total_cost != lOther$total_cost) {
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

extension UtilityExtension$Query$get_customer_orders$customer_minimal_orders
    on Query$get_customer_orders$customer_minimal_orders {
  CopyWith$Query$get_customer_orders$customer_minimal_orders<
          Query$get_customer_orders$customer_minimal_orders>
      get copyWith =>
          CopyWith$Query$get_customer_orders$customer_minimal_orders(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_customer_orders$customer_minimal_orders<
    TRes> {
  factory CopyWith$Query$get_customer_orders$customer_minimal_orders(
    Query$get_customer_orders$customer_minimal_orders instance,
    TRes Function(Query$get_customer_orders$customer_minimal_orders) then,
  ) = _CopyWithImpl$Query$get_customer_orders$customer_minimal_orders;

  factory CopyWith$Query$get_customer_orders$customer_minimal_orders.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_customer_orders$customer_minimal_orders;

  TRes call({
    int? id,
    String? image,
    bool? in_process,
    String? name,
    String? order_time,
    String? order_type,
    String? payment_type,
    String? status,
    double? total_cost,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_customer_orders$customer_minimal_orders<TRes>
    implements
        CopyWith$Query$get_customer_orders$customer_minimal_orders<TRes> {
  _CopyWithImpl$Query$get_customer_orders$customer_minimal_orders(
    this._instance,
    this._then,
  );

  final Query$get_customer_orders$customer_minimal_orders _instance;

  final TRes Function(Query$get_customer_orders$customer_minimal_orders) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? image = _undefined,
    Object? in_process = _undefined,
    Object? name = _undefined,
    Object? order_time = _undefined,
    Object? order_type = _undefined,
    Object? payment_type = _undefined,
    Object? status = _undefined,
    Object? total_cost = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_customer_orders$customer_minimal_orders(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        in_process: in_process == _undefined || in_process == null
            ? _instance.in_process
            : (in_process as bool),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        order_time: order_time == _undefined || order_time == null
            ? _instance.order_time
            : (order_time as String),
        order_type: order_type == _undefined || order_type == null
            ? _instance.order_type
            : (order_type as String),
        payment_type: payment_type == _undefined || payment_type == null
            ? _instance.payment_type
            : (payment_type as String),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        total_cost: total_cost == _undefined || total_cost == null
            ? _instance.total_cost
            : (total_cost as double),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_customer_orders$customer_minimal_orders<TRes>
    implements
        CopyWith$Query$get_customer_orders$customer_minimal_orders<TRes> {
  _CopyWithStubImpl$Query$get_customer_orders$customer_minimal_orders(
      this._res);

  TRes _res;

  call({
    int? id,
    String? image,
    bool? in_process,
    String? name,
    String? order_time,
    String? order_type,
    String? payment_type,
    String? status,
    double? total_cost,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Subscription$listen_on_customer_orders {
  factory Variables$Subscription$listen_on_customer_orders({
    required int custId,
    required bool inProcess,
  }) =>
      Variables$Subscription$listen_on_customer_orders._({
        r'custId': custId,
        r'inProcess': inProcess,
      });

  Variables$Subscription$listen_on_customer_orders._(this._$data);

  factory Variables$Subscription$listen_on_customer_orders.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$custId = data['custId'];
    result$data['custId'] = (l$custId as int);
    final l$inProcess = data['inProcess'];
    result$data['inProcess'] = (l$inProcess as bool);
    return Variables$Subscription$listen_on_customer_orders._(result$data);
  }

  Map<String, dynamic> _$data;

  int get custId => (_$data['custId'] as int);
  bool get inProcess => (_$data['inProcess'] as bool);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$custId = custId;
    result$data['custId'] = l$custId;
    final l$inProcess = inProcess;
    result$data['inProcess'] = l$inProcess;
    return result$data;
  }

  CopyWith$Variables$Subscription$listen_on_customer_orders<
          Variables$Subscription$listen_on_customer_orders>
      get copyWith => CopyWith$Variables$Subscription$listen_on_customer_orders(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Subscription$listen_on_customer_orders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$custId = custId;
    final lOther$custId = other.custId;
    if (l$custId != lOther$custId) {
      return false;
    }
    final l$inProcess = inProcess;
    final lOther$inProcess = other.inProcess;
    if (l$inProcess != lOther$inProcess) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$custId = custId;
    final l$inProcess = inProcess;
    return Object.hashAll([
      l$custId,
      l$inProcess,
    ]);
  }
}

abstract class CopyWith$Variables$Subscription$listen_on_customer_orders<TRes> {
  factory CopyWith$Variables$Subscription$listen_on_customer_orders(
    Variables$Subscription$listen_on_customer_orders instance,
    TRes Function(Variables$Subscription$listen_on_customer_orders) then,
  ) = _CopyWithImpl$Variables$Subscription$listen_on_customer_orders;

  factory CopyWith$Variables$Subscription$listen_on_customer_orders.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Subscription$listen_on_customer_orders;

  TRes call({
    int? custId,
    bool? inProcess,
  });
}

class _CopyWithImpl$Variables$Subscription$listen_on_customer_orders<TRes>
    implements CopyWith$Variables$Subscription$listen_on_customer_orders<TRes> {
  _CopyWithImpl$Variables$Subscription$listen_on_customer_orders(
    this._instance,
    this._then,
  );

  final Variables$Subscription$listen_on_customer_orders _instance;

  final TRes Function(Variables$Subscription$listen_on_customer_orders) _then;

  static const _undefined = {};

  TRes call({
    Object? custId = _undefined,
    Object? inProcess = _undefined,
  }) =>
      _then(Variables$Subscription$listen_on_customer_orders._({
        ..._instance._$data,
        if (custId != _undefined && custId != null) 'custId': (custId as int),
        if (inProcess != _undefined && inProcess != null)
          'inProcess': (inProcess as bool),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$listen_on_customer_orders<TRes>
    implements CopyWith$Variables$Subscription$listen_on_customer_orders<TRes> {
  _CopyWithStubImpl$Variables$Subscription$listen_on_customer_orders(this._res);

  TRes _res;

  call({
    int? custId,
    bool? inProcess,
  }) =>
      _res;
}

class Subscription$listen_on_customer_orders {
  Subscription$listen_on_customer_orders({
    required this.customer_minimal_orders,
    required this.$__typename,
  });

  factory Subscription$listen_on_customer_orders.fromJson(
      Map<String, dynamic> json) {
    final l$customer_minimal_orders = json['customer_minimal_orders'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_customer_orders(
      customer_minimal_orders: (l$customer_minimal_orders as List<dynamic>)
          .map((e) =>
              Subscription$listen_on_customer_orders$customer_minimal_orders
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Subscription$listen_on_customer_orders$customer_minimal_orders>
      customer_minimal_orders;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$customer_minimal_orders = customer_minimal_orders;
    _resultData['customer_minimal_orders'] =
        l$customer_minimal_orders.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$customer_minimal_orders = customer_minimal_orders;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$customer_minimal_orders.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$listen_on_customer_orders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$customer_minimal_orders = customer_minimal_orders;
    final lOther$customer_minimal_orders = other.customer_minimal_orders;
    if (l$customer_minimal_orders.length !=
        lOther$customer_minimal_orders.length) {
      return false;
    }
    for (int i = 0; i < l$customer_minimal_orders.length; i++) {
      final l$customer_minimal_orders$entry = l$customer_minimal_orders[i];
      final lOther$customer_minimal_orders$entry =
          lOther$customer_minimal_orders[i];
      if (l$customer_minimal_orders$entry !=
          lOther$customer_minimal_orders$entry) {
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

extension UtilityExtension$Subscription$listen_on_customer_orders
    on Subscription$listen_on_customer_orders {
  CopyWith$Subscription$listen_on_customer_orders<
          Subscription$listen_on_customer_orders>
      get copyWith => CopyWith$Subscription$listen_on_customer_orders(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_customer_orders<TRes> {
  factory CopyWith$Subscription$listen_on_customer_orders(
    Subscription$listen_on_customer_orders instance,
    TRes Function(Subscription$listen_on_customer_orders) then,
  ) = _CopyWithImpl$Subscription$listen_on_customer_orders;

  factory CopyWith$Subscription$listen_on_customer_orders.stub(TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_customer_orders;

  TRes call({
    List<Subscription$listen_on_customer_orders$customer_minimal_orders>?
        customer_minimal_orders,
    String? $__typename,
  });
  TRes customer_minimal_orders(
      Iterable<Subscription$listen_on_customer_orders$customer_minimal_orders> Function(
              Iterable<
                  CopyWith$Subscription$listen_on_customer_orders$customer_minimal_orders<
                      Subscription$listen_on_customer_orders$customer_minimal_orders>>)
          _fn);
}

class _CopyWithImpl$Subscription$listen_on_customer_orders<TRes>
    implements CopyWith$Subscription$listen_on_customer_orders<TRes> {
  _CopyWithImpl$Subscription$listen_on_customer_orders(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_customer_orders _instance;

  final TRes Function(Subscription$listen_on_customer_orders) _then;

  static const _undefined = {};

  TRes call({
    Object? customer_minimal_orders = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listen_on_customer_orders(
        customer_minimal_orders: customer_minimal_orders == _undefined ||
                customer_minimal_orders == null
            ? _instance.customer_minimal_orders
            : (customer_minimal_orders as List<
                Subscription$listen_on_customer_orders$customer_minimal_orders>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes customer_minimal_orders(
          Iterable<Subscription$listen_on_customer_orders$customer_minimal_orders> Function(
                  Iterable<
                      CopyWith$Subscription$listen_on_customer_orders$customer_minimal_orders<
                          Subscription$listen_on_customer_orders$customer_minimal_orders>>)
              _fn) =>
      call(
          customer_minimal_orders: _fn(_instance.customer_minimal_orders.map((e) =>
              CopyWith$Subscription$listen_on_customer_orders$customer_minimal_orders(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$listen_on_customer_orders<TRes>
    implements CopyWith$Subscription$listen_on_customer_orders<TRes> {
  _CopyWithStubImpl$Subscription$listen_on_customer_orders(this._res);

  TRes _res;

  call({
    List<Subscription$listen_on_customer_orders$customer_minimal_orders>?
        customer_minimal_orders,
    String? $__typename,
  }) =>
      _res;
  customer_minimal_orders(_fn) => _res;
}

const documentNodeSubscriptionlisten_on_customer_orders =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'listen_on_customer_orders'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'custId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'inProcess')),
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
        name: NameNode(value: 'customer_minimal_orders'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'args'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'customer_id'),
                value: VariableNode(name: NameNode(value: 'custId')),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'in_process'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'inProcess')),
                  )
                ]),
              )
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
            name: NameNode(value: 'image'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'in_process'),
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
            name: NameNode(value: 'order_time'),
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
            name: NameNode(value: 'payment_type'),
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
            name: NameNode(value: 'total_cost'),
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
Subscription$listen_on_customer_orders
    _parserFn$Subscription$listen_on_customer_orders(
            Map<String, dynamic> data) =>
        Subscription$listen_on_customer_orders.fromJson(data);

class Options$Subscription$listen_on_customer_orders extends graphql
    .SubscriptionOptions<Subscription$listen_on_customer_orders> {
  Options$Subscription$listen_on_customer_orders({
    String? operationName,
    required Variables$Subscription$listen_on_customer_orders variables,
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
          document: documentNodeSubscriptionlisten_on_customer_orders,
          parserFn: _parserFn$Subscription$listen_on_customer_orders,
        );
}

class WatchOptions$Subscription$listen_on_customer_orders
    extends graphql.WatchQueryOptions<Subscription$listen_on_customer_orders> {
  WatchOptions$Subscription$listen_on_customer_orders({
    String? operationName,
    required Variables$Subscription$listen_on_customer_orders variables,
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
          document: documentNodeSubscriptionlisten_on_customer_orders,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$listen_on_customer_orders,
        );
}

class FetchMoreOptions$Subscription$listen_on_customer_orders
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$listen_on_customer_orders({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$listen_on_customer_orders variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptionlisten_on_customer_orders,
        );
}

extension ClientExtension$Subscription$listen_on_customer_orders
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$listen_on_customer_orders>>
      subscribe$listen_on_customer_orders(
              Options$Subscription$listen_on_customer_orders options) =>
          this.subscribe(options);
  graphql.ObservableQuery<Subscription$listen_on_customer_orders>
      watchSubscription$listen_on_customer_orders(
              WatchOptions$Subscription$listen_on_customer_orders options) =>
          this.watchQuery(options);
}

class Subscription$listen_on_customer_orders$customer_minimal_orders {
  Subscription$listen_on_customer_orders$customer_minimal_orders({
    required this.id,
    required this.image,
    required this.in_process,
    required this.name,
    required this.order_time,
    required this.order_type,
    required this.payment_type,
    required this.status,
    required this.total_cost,
    required this.$__typename,
  });

  factory Subscription$listen_on_customer_orders$customer_minimal_orders.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$image = json['image'];
    final l$in_process = json['in_process'];
    final l$name = json['name'];
    final l$order_time = json['order_time'];
    final l$order_type = json['order_type'];
    final l$payment_type = json['payment_type'];
    final l$status = json['status'];
    final l$total_cost = json['total_cost'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_customer_orders$customer_minimal_orders(
      id: (l$id as int),
      image: (l$image as String),
      in_process: (l$in_process as bool),
      name: (l$name as String),
      order_time: (l$order_time as String),
      order_type: (l$order_type as String),
      payment_type: (l$payment_type as String),
      status: (l$status as String),
      total_cost: moneyFromJson(l$total_cost),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String image;

  final bool in_process;

  final String name;

  final String order_time;

  final String order_type;

  final String payment_type;

  final String status;

  final double total_cost;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$in_process = in_process;
    _resultData['in_process'] = l$in_process;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$order_time = order_time;
    _resultData['order_time'] = l$order_time;
    final l$order_type = order_type;
    _resultData['order_type'] = l$order_type;
    final l$payment_type = payment_type;
    _resultData['payment_type'] = l$payment_type;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$total_cost = total_cost;
    _resultData['total_cost'] = moneyToJson(l$total_cost);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$image = image;
    final l$in_process = in_process;
    final l$name = name;
    final l$order_time = order_time;
    final l$order_type = order_type;
    final l$payment_type = payment_type;
    final l$status = status;
    final l$total_cost = total_cost;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$image,
      l$in_process,
      l$name,
      l$order_time,
      l$order_type,
      l$payment_type,
      l$status,
      l$total_cost,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$listen_on_customer_orders$customer_minimal_orders) ||
        runtimeType != other.runtimeType) {
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
    final l$in_process = in_process;
    final lOther$in_process = other.in_process;
    if (l$in_process != lOther$in_process) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$order_time = order_time;
    final lOther$order_time = other.order_time;
    if (l$order_time != lOther$order_time) {
      return false;
    }
    final l$order_type = order_type;
    final lOther$order_type = other.order_type;
    if (l$order_type != lOther$order_type) {
      return false;
    }
    final l$payment_type = payment_type;
    final lOther$payment_type = other.payment_type;
    if (l$payment_type != lOther$payment_type) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$total_cost = total_cost;
    final lOther$total_cost = other.total_cost;
    if (l$total_cost != lOther$total_cost) {
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

extension UtilityExtension$Subscription$listen_on_customer_orders$customer_minimal_orders
    on Subscription$listen_on_customer_orders$customer_minimal_orders {
  CopyWith$Subscription$listen_on_customer_orders$customer_minimal_orders<
          Subscription$listen_on_customer_orders$customer_minimal_orders>
      get copyWith =>
          CopyWith$Subscription$listen_on_customer_orders$customer_minimal_orders(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_customer_orders$customer_minimal_orders<
    TRes> {
  factory CopyWith$Subscription$listen_on_customer_orders$customer_minimal_orders(
    Subscription$listen_on_customer_orders$customer_minimal_orders instance,
    TRes Function(
            Subscription$listen_on_customer_orders$customer_minimal_orders)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_customer_orders$customer_minimal_orders;

  factory CopyWith$Subscription$listen_on_customer_orders$customer_minimal_orders.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_customer_orders$customer_minimal_orders;

  TRes call({
    int? id,
    String? image,
    bool? in_process,
    String? name,
    String? order_time,
    String? order_type,
    String? payment_type,
    String? status,
    double? total_cost,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_customer_orders$customer_minimal_orders<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_orders$customer_minimal_orders<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_customer_orders$customer_minimal_orders(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_customer_orders$customer_minimal_orders
      _instance;

  final TRes Function(
      Subscription$listen_on_customer_orders$customer_minimal_orders) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? image = _undefined,
    Object? in_process = _undefined,
    Object? name = _undefined,
    Object? order_time = _undefined,
    Object? order_type = _undefined,
    Object? payment_type = _undefined,
    Object? status = _undefined,
    Object? total_cost = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listen_on_customer_orders$customer_minimal_orders(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        in_process: in_process == _undefined || in_process == null
            ? _instance.in_process
            : (in_process as bool),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        order_time: order_time == _undefined || order_time == null
            ? _instance.order_time
            : (order_time as String),
        order_type: order_type == _undefined || order_type == null
            ? _instance.order_type
            : (order_type as String),
        payment_type: payment_type == _undefined || payment_type == null
            ? _instance.payment_type
            : (payment_type as String),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        total_cost: total_cost == _undefined || total_cost == null
            ? _instance.total_cost
            : (total_cost as double),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$listen_on_customer_orders$customer_minimal_orders<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_orders$customer_minimal_orders<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_customer_orders$customer_minimal_orders(
      this._res);

  TRes _res;

  call({
    int? id,
    String? image,
    bool? in_process,
    String? name,
    String? order_time,
    String? order_type,
    String? payment_type,
    String? status,
    double? total_cost,
    String? $__typename,
  }) =>
      _res;
}
