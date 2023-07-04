import '../../__generated/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$insertNotifInfo {
  factory Variables$Mutation$insertNotifInfo(
          {required Input$notification_info_insert_input notifData}) =>
      Variables$Mutation$insertNotifInfo._({
        r'notifData': notifData,
      });

  Variables$Mutation$insertNotifInfo._(this._$data);

  factory Variables$Mutation$insertNotifInfo.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$notifData = data['notifData'];
    result$data['notifData'] = Input$notification_info_insert_input.fromJson(
        (l$notifData as Map<String, dynamic>));
    return Variables$Mutation$insertNotifInfo._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$notification_info_insert_input get notifData =>
      (_$data['notifData'] as Input$notification_info_insert_input);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$notifData = notifData;
    result$data['notifData'] = l$notifData.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$insertNotifInfo<
          Variables$Mutation$insertNotifInfo>
      get copyWith => CopyWith$Variables$Mutation$insertNotifInfo(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$insertNotifInfo) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$notifData = notifData;
    final lOther$notifData = other.notifData;
    if (l$notifData != lOther$notifData) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$notifData = notifData;
    return Object.hashAll([l$notifData]);
  }
}

abstract class CopyWith$Variables$Mutation$insertNotifInfo<TRes> {
  factory CopyWith$Variables$Mutation$insertNotifInfo(
    Variables$Mutation$insertNotifInfo instance,
    TRes Function(Variables$Mutation$insertNotifInfo) then,
  ) = _CopyWithImpl$Variables$Mutation$insertNotifInfo;

  factory CopyWith$Variables$Mutation$insertNotifInfo.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$insertNotifInfo;

  TRes call({Input$notification_info_insert_input? notifData});
}

class _CopyWithImpl$Variables$Mutation$insertNotifInfo<TRes>
    implements CopyWith$Variables$Mutation$insertNotifInfo<TRes> {
  _CopyWithImpl$Variables$Mutation$insertNotifInfo(
    this._instance,
    this._then,
  );

  final Variables$Mutation$insertNotifInfo _instance;

  final TRes Function(Variables$Mutation$insertNotifInfo) _then;

  static const _undefined = {};

  TRes call({Object? notifData = _undefined}) =>
      _then(Variables$Mutation$insertNotifInfo._({
        ..._instance._$data,
        if (notifData != _undefined && notifData != null)
          'notifData': (notifData as Input$notification_info_insert_input),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$insertNotifInfo<TRes>
    implements CopyWith$Variables$Mutation$insertNotifInfo<TRes> {
  _CopyWithStubImpl$Variables$Mutation$insertNotifInfo(this._res);

  TRes _res;

  call({Input$notification_info_insert_input? notifData}) => _res;
}

class Mutation$insertNotifInfo {
  Mutation$insertNotifInfo({
    this.insert_notification_info_one,
    required this.$__typename,
  });

  factory Mutation$insertNotifInfo.fromJson(Map<String, dynamic> json) {
    final l$insert_notification_info_one = json['insert_notification_info_one'];
    final l$$__typename = json['__typename'];
    return Mutation$insertNotifInfo(
      insert_notification_info_one: l$insert_notification_info_one == null
          ? null
          : Mutation$insertNotifInfo$insert_notification_info_one.fromJson(
              (l$insert_notification_info_one as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$insertNotifInfo$insert_notification_info_one?
      insert_notification_info_one;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insert_notification_info_one = insert_notification_info_one;
    _resultData['insert_notification_info_one'] =
        l$insert_notification_info_one?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insert_notification_info_one = insert_notification_info_one;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$insert_notification_info_one,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$insertNotifInfo) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$insert_notification_info_one = insert_notification_info_one;
    final lOther$insert_notification_info_one =
        other.insert_notification_info_one;
    if (l$insert_notification_info_one != lOther$insert_notification_info_one) {
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

extension UtilityExtension$Mutation$insertNotifInfo
    on Mutation$insertNotifInfo {
  CopyWith$Mutation$insertNotifInfo<Mutation$insertNotifInfo> get copyWith =>
      CopyWith$Mutation$insertNotifInfo(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$insertNotifInfo<TRes> {
  factory CopyWith$Mutation$insertNotifInfo(
    Mutation$insertNotifInfo instance,
    TRes Function(Mutation$insertNotifInfo) then,
  ) = _CopyWithImpl$Mutation$insertNotifInfo;

  factory CopyWith$Mutation$insertNotifInfo.stub(TRes res) =
      _CopyWithStubImpl$Mutation$insertNotifInfo;

  TRes call({
    Mutation$insertNotifInfo$insert_notification_info_one?
        insert_notification_info_one,
    String? $__typename,
  });
  CopyWith$Mutation$insertNotifInfo$insert_notification_info_one<TRes>
      get insert_notification_info_one;
}

class _CopyWithImpl$Mutation$insertNotifInfo<TRes>
    implements CopyWith$Mutation$insertNotifInfo<TRes> {
  _CopyWithImpl$Mutation$insertNotifInfo(
    this._instance,
    this._then,
  );

  final Mutation$insertNotifInfo _instance;

  final TRes Function(Mutation$insertNotifInfo) _then;

  static const _undefined = {};

  TRes call({
    Object? insert_notification_info_one = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$insertNotifInfo(
        insert_notification_info_one: insert_notification_info_one == _undefined
            ? _instance.insert_notification_info_one
            : (insert_notification_info_one
                as Mutation$insertNotifInfo$insert_notification_info_one?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$insertNotifInfo$insert_notification_info_one<TRes>
      get insert_notification_info_one {
    final local$insert_notification_info_one =
        _instance.insert_notification_info_one;
    return local$insert_notification_info_one == null
        ? CopyWith$Mutation$insertNotifInfo$insert_notification_info_one.stub(
            _then(_instance))
        : CopyWith$Mutation$insertNotifInfo$insert_notification_info_one(
            local$insert_notification_info_one,
            (e) => call(insert_notification_info_one: e));
  }
}

class _CopyWithStubImpl$Mutation$insertNotifInfo<TRes>
    implements CopyWith$Mutation$insertNotifInfo<TRes> {
  _CopyWithStubImpl$Mutation$insertNotifInfo(this._res);

  TRes _res;

  call({
    Mutation$insertNotifInfo$insert_notification_info_one?
        insert_notification_info_one,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$insertNotifInfo$insert_notification_info_one<TRes>
      get insert_notification_info_one =>
          CopyWith$Mutation$insertNotifInfo$insert_notification_info_one.stub(
              _res);
}

const documentNodeMutationinsertNotifInfo = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'insertNotifInfo'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'notifData')),
        type: NamedTypeNode(
          name: NameNode(value: 'notification_info_insert_input'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'insert_notification_info_one'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'object'),
            value: VariableNode(name: NameNode(value: 'notifData')),
          ),
          ArgumentNode(
            name: NameNode(value: 'on_conflict'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'constraint'),
                value: EnumValueNode(
                    name: NameNode(
                        value: 'notification_info_app_type_id_user_id_key')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'update_columns'),
                value: EnumValueNode(name: NameNode(value: 'token')),
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
Mutation$insertNotifInfo _parserFn$Mutation$insertNotifInfo(
        Map<String, dynamic> data) =>
    Mutation$insertNotifInfo.fromJson(data);
typedef OnMutationCompleted$Mutation$insertNotifInfo = FutureOr<void> Function(
  dynamic,
  Mutation$insertNotifInfo?,
);

class Options$Mutation$insertNotifInfo
    extends graphql.MutationOptions<Mutation$insertNotifInfo> {
  Options$Mutation$insertNotifInfo({
    String? operationName,
    required Variables$Mutation$insertNotifInfo variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$insertNotifInfo? onCompleted,
    graphql.OnMutationUpdate<Mutation$insertNotifInfo>? update,
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
                        : _parserFn$Mutation$insertNotifInfo(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationinsertNotifInfo,
          parserFn: _parserFn$Mutation$insertNotifInfo,
        );

  final OnMutationCompleted$Mutation$insertNotifInfo? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$insertNotifInfo
    extends graphql.WatchQueryOptions<Mutation$insertNotifInfo> {
  WatchOptions$Mutation$insertNotifInfo({
    String? operationName,
    required Variables$Mutation$insertNotifInfo variables,
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
          document: documentNodeMutationinsertNotifInfo,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$insertNotifInfo,
        );
}

extension ClientExtension$Mutation$insertNotifInfo on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$insertNotifInfo>> mutate$insertNotifInfo(
          Options$Mutation$insertNotifInfo options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$insertNotifInfo>
      watchMutation$insertNotifInfo(
              WatchOptions$Mutation$insertNotifInfo options) =>
          this.watchMutation(options);
}

class Mutation$insertNotifInfo$insert_notification_info_one {
  Mutation$insertNotifInfo$insert_notification_info_one({
    required this.id,
    required this.$__typename,
  });

  factory Mutation$insertNotifInfo$insert_notification_info_one.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$insertNotifInfo$insert_notification_info_one(
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
    if (!(other is Mutation$insertNotifInfo$insert_notification_info_one) ||
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

extension UtilityExtension$Mutation$insertNotifInfo$insert_notification_info_one
    on Mutation$insertNotifInfo$insert_notification_info_one {
  CopyWith$Mutation$insertNotifInfo$insert_notification_info_one<
          Mutation$insertNotifInfo$insert_notification_info_one>
      get copyWith =>
          CopyWith$Mutation$insertNotifInfo$insert_notification_info_one(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$insertNotifInfo$insert_notification_info_one<
    TRes> {
  factory CopyWith$Mutation$insertNotifInfo$insert_notification_info_one(
    Mutation$insertNotifInfo$insert_notification_info_one instance,
    TRes Function(Mutation$insertNotifInfo$insert_notification_info_one) then,
  ) = _CopyWithImpl$Mutation$insertNotifInfo$insert_notification_info_one;

  factory CopyWith$Mutation$insertNotifInfo$insert_notification_info_one.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$insertNotifInfo$insert_notification_info_one;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$insertNotifInfo$insert_notification_info_one<TRes>
    implements
        CopyWith$Mutation$insertNotifInfo$insert_notification_info_one<TRes> {
  _CopyWithImpl$Mutation$insertNotifInfo$insert_notification_info_one(
    this._instance,
    this._then,
  );

  final Mutation$insertNotifInfo$insert_notification_info_one _instance;

  final TRes Function(Mutation$insertNotifInfo$insert_notification_info_one)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$insertNotifInfo$insert_notification_info_one(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$insertNotifInfo$insert_notification_info_one<
        TRes>
    implements
        CopyWith$Mutation$insertNotifInfo$insert_notification_info_one<TRes> {
  _CopyWithStubImpl$Mutation$insertNotifInfo$insert_notification_info_one(
      this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$updateNotifInfo {
  factory Variables$Mutation$updateNotifInfo({
    required int id,
    required Input$notification_info_set_input notifData,
  }) =>
      Variables$Mutation$updateNotifInfo._({
        r'id': id,
        r'notifData': notifData,
      });

  Variables$Mutation$updateNotifInfo._(this._$data);

  factory Variables$Mutation$updateNotifInfo.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    final l$notifData = data['notifData'];
    result$data['notifData'] = Input$notification_info_set_input.fromJson(
        (l$notifData as Map<String, dynamic>));
    return Variables$Mutation$updateNotifInfo._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  Input$notification_info_set_input get notifData =>
      (_$data['notifData'] as Input$notification_info_set_input);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$notifData = notifData;
    result$data['notifData'] = l$notifData.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$updateNotifInfo<
          Variables$Mutation$updateNotifInfo>
      get copyWith => CopyWith$Variables$Mutation$updateNotifInfo(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$updateNotifInfo) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$notifData = notifData;
    final lOther$notifData = other.notifData;
    if (l$notifData != lOther$notifData) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$notifData = notifData;
    return Object.hashAll([
      l$id,
      l$notifData,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$updateNotifInfo<TRes> {
  factory CopyWith$Variables$Mutation$updateNotifInfo(
    Variables$Mutation$updateNotifInfo instance,
    TRes Function(Variables$Mutation$updateNotifInfo) then,
  ) = _CopyWithImpl$Variables$Mutation$updateNotifInfo;

  factory CopyWith$Variables$Mutation$updateNotifInfo.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$updateNotifInfo;

  TRes call({
    int? id,
    Input$notification_info_set_input? notifData,
  });
}

class _CopyWithImpl$Variables$Mutation$updateNotifInfo<TRes>
    implements CopyWith$Variables$Mutation$updateNotifInfo<TRes> {
  _CopyWithImpl$Variables$Mutation$updateNotifInfo(
    this._instance,
    this._then,
  );

  final Variables$Mutation$updateNotifInfo _instance;

  final TRes Function(Variables$Mutation$updateNotifInfo) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? notifData = _undefined,
  }) =>
      _then(Variables$Mutation$updateNotifInfo._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
        if (notifData != _undefined && notifData != null)
          'notifData': (notifData as Input$notification_info_set_input),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$updateNotifInfo<TRes>
    implements CopyWith$Variables$Mutation$updateNotifInfo<TRes> {
  _CopyWithStubImpl$Variables$Mutation$updateNotifInfo(this._res);

  TRes _res;

  call({
    int? id,
    Input$notification_info_set_input? notifData,
  }) =>
      _res;
}

class Mutation$updateNotifInfo {
  Mutation$updateNotifInfo({
    this.update_notification_info_by_pk,
    required this.$__typename,
  });

  factory Mutation$updateNotifInfo.fromJson(Map<String, dynamic> json) {
    final l$update_notification_info_by_pk =
        json['update_notification_info_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$updateNotifInfo(
      update_notification_info_by_pk: l$update_notification_info_by_pk == null
          ? null
          : Mutation$updateNotifInfo$update_notification_info_by_pk.fromJson(
              (l$update_notification_info_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$updateNotifInfo$update_notification_info_by_pk?
      update_notification_info_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_notification_info_by_pk = update_notification_info_by_pk;
    _resultData['update_notification_info_by_pk'] =
        l$update_notification_info_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_notification_info_by_pk = update_notification_info_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_notification_info_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$updateNotifInfo) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_notification_info_by_pk = update_notification_info_by_pk;
    final lOther$update_notification_info_by_pk =
        other.update_notification_info_by_pk;
    if (l$update_notification_info_by_pk !=
        lOther$update_notification_info_by_pk) {
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

extension UtilityExtension$Mutation$updateNotifInfo
    on Mutation$updateNotifInfo {
  CopyWith$Mutation$updateNotifInfo<Mutation$updateNotifInfo> get copyWith =>
      CopyWith$Mutation$updateNotifInfo(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$updateNotifInfo<TRes> {
  factory CopyWith$Mutation$updateNotifInfo(
    Mutation$updateNotifInfo instance,
    TRes Function(Mutation$updateNotifInfo) then,
  ) = _CopyWithImpl$Mutation$updateNotifInfo;

  factory CopyWith$Mutation$updateNotifInfo.stub(TRes res) =
      _CopyWithStubImpl$Mutation$updateNotifInfo;

  TRes call({
    Mutation$updateNotifInfo$update_notification_info_by_pk?
        update_notification_info_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$updateNotifInfo$update_notification_info_by_pk<TRes>
      get update_notification_info_by_pk;
}

class _CopyWithImpl$Mutation$updateNotifInfo<TRes>
    implements CopyWith$Mutation$updateNotifInfo<TRes> {
  _CopyWithImpl$Mutation$updateNotifInfo(
    this._instance,
    this._then,
  );

  final Mutation$updateNotifInfo _instance;

  final TRes Function(Mutation$updateNotifInfo) _then;

  static const _undefined = {};

  TRes call({
    Object? update_notification_info_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateNotifInfo(
        update_notification_info_by_pk: update_notification_info_by_pk ==
                _undefined
            ? _instance.update_notification_info_by_pk
            : (update_notification_info_by_pk
                as Mutation$updateNotifInfo$update_notification_info_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$updateNotifInfo$update_notification_info_by_pk<TRes>
      get update_notification_info_by_pk {
    final local$update_notification_info_by_pk =
        _instance.update_notification_info_by_pk;
    return local$update_notification_info_by_pk == null
        ? CopyWith$Mutation$updateNotifInfo$update_notification_info_by_pk.stub(
            _then(_instance))
        : CopyWith$Mutation$updateNotifInfo$update_notification_info_by_pk(
            local$update_notification_info_by_pk,
            (e) => call(update_notification_info_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$updateNotifInfo<TRes>
    implements CopyWith$Mutation$updateNotifInfo<TRes> {
  _CopyWithStubImpl$Mutation$updateNotifInfo(this._res);

  TRes _res;

  call({
    Mutation$updateNotifInfo$update_notification_info_by_pk?
        update_notification_info_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$updateNotifInfo$update_notification_info_by_pk<TRes>
      get update_notification_info_by_pk =>
          CopyWith$Mutation$updateNotifInfo$update_notification_info_by_pk.stub(
              _res);
}

const documentNodeMutationupdateNotifInfo = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'updateNotifInfo'),
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
        variable: VariableNode(name: NameNode(value: 'notifData')),
        type: NamedTypeNode(
          name: NameNode(value: 'notification_info_set_input'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'update_notification_info_by_pk'),
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
            value: VariableNode(name: NameNode(value: 'notifData')),
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
Mutation$updateNotifInfo _parserFn$Mutation$updateNotifInfo(
        Map<String, dynamic> data) =>
    Mutation$updateNotifInfo.fromJson(data);
typedef OnMutationCompleted$Mutation$updateNotifInfo = FutureOr<void> Function(
  dynamic,
  Mutation$updateNotifInfo?,
);

class Options$Mutation$updateNotifInfo
    extends graphql.MutationOptions<Mutation$updateNotifInfo> {
  Options$Mutation$updateNotifInfo({
    String? operationName,
    required Variables$Mutation$updateNotifInfo variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$updateNotifInfo? onCompleted,
    graphql.OnMutationUpdate<Mutation$updateNotifInfo>? update,
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
                        : _parserFn$Mutation$updateNotifInfo(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdateNotifInfo,
          parserFn: _parserFn$Mutation$updateNotifInfo,
        );

  final OnMutationCompleted$Mutation$updateNotifInfo? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$updateNotifInfo
    extends graphql.WatchQueryOptions<Mutation$updateNotifInfo> {
  WatchOptions$Mutation$updateNotifInfo({
    String? operationName,
    required Variables$Mutation$updateNotifInfo variables,
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
          document: documentNodeMutationupdateNotifInfo,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$updateNotifInfo,
        );
}

extension ClientExtension$Mutation$updateNotifInfo on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$updateNotifInfo>> mutate$updateNotifInfo(
          Options$Mutation$updateNotifInfo options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$updateNotifInfo>
      watchMutation$updateNotifInfo(
              WatchOptions$Mutation$updateNotifInfo options) =>
          this.watchMutation(options);
}

class Mutation$updateNotifInfo$update_notification_info_by_pk {
  Mutation$updateNotifInfo$update_notification_info_by_pk({
    required this.id,
    required this.$__typename,
  });

  factory Mutation$updateNotifInfo$update_notification_info_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$updateNotifInfo$update_notification_info_by_pk(
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
    if (!(other is Mutation$updateNotifInfo$update_notification_info_by_pk) ||
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

extension UtilityExtension$Mutation$updateNotifInfo$update_notification_info_by_pk
    on Mutation$updateNotifInfo$update_notification_info_by_pk {
  CopyWith$Mutation$updateNotifInfo$update_notification_info_by_pk<
          Mutation$updateNotifInfo$update_notification_info_by_pk>
      get copyWith =>
          CopyWith$Mutation$updateNotifInfo$update_notification_info_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateNotifInfo$update_notification_info_by_pk<
    TRes> {
  factory CopyWith$Mutation$updateNotifInfo$update_notification_info_by_pk(
    Mutation$updateNotifInfo$update_notification_info_by_pk instance,
    TRes Function(Mutation$updateNotifInfo$update_notification_info_by_pk) then,
  ) = _CopyWithImpl$Mutation$updateNotifInfo$update_notification_info_by_pk;

  factory CopyWith$Mutation$updateNotifInfo$update_notification_info_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateNotifInfo$update_notification_info_by_pk;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$updateNotifInfo$update_notification_info_by_pk<
        TRes>
    implements
        CopyWith$Mutation$updateNotifInfo$update_notification_info_by_pk<TRes> {
  _CopyWithImpl$Mutation$updateNotifInfo$update_notification_info_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$updateNotifInfo$update_notification_info_by_pk _instance;

  final TRes Function(Mutation$updateNotifInfo$update_notification_info_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateNotifInfo$update_notification_info_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$updateNotifInfo$update_notification_info_by_pk<
        TRes>
    implements
        CopyWith$Mutation$updateNotifInfo$update_notification_info_by_pk<TRes> {
  _CopyWithStubImpl$Mutation$updateNotifInfo$update_notification_info_by_pk(
      this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getNotifInfoByUserId {
  factory Variables$Query$getNotifInfoByUserId({
    required int userId,
    required String app_type_id,
  }) =>
      Variables$Query$getNotifInfoByUserId._({
        r'userId': userId,
        r'app_type_id': app_type_id,
      });

  Variables$Query$getNotifInfoByUserId._(this._$data);

  factory Variables$Query$getNotifInfoByUserId.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$userId = data['userId'];
    result$data['userId'] = (l$userId as int);
    final l$app_type_id = data['app_type_id'];
    result$data['app_type_id'] = (l$app_type_id as String);
    return Variables$Query$getNotifInfoByUserId._(result$data);
  }

  Map<String, dynamic> _$data;

  int get userId => (_$data['userId'] as int);
  String get app_type_id => (_$data['app_type_id'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$userId = userId;
    result$data['userId'] = l$userId;
    final l$app_type_id = app_type_id;
    result$data['app_type_id'] = l$app_type_id;
    return result$data;
  }

  CopyWith$Variables$Query$getNotifInfoByUserId<
          Variables$Query$getNotifInfoByUserId>
      get copyWith => CopyWith$Variables$Query$getNotifInfoByUserId(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getNotifInfoByUserId) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
      return false;
    }
    final l$app_type_id = app_type_id;
    final lOther$app_type_id = other.app_type_id;
    if (l$app_type_id != lOther$app_type_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$userId = userId;
    final l$app_type_id = app_type_id;
    return Object.hashAll([
      l$userId,
      l$app_type_id,
    ]);
  }
}

abstract class CopyWith$Variables$Query$getNotifInfoByUserId<TRes> {
  factory CopyWith$Variables$Query$getNotifInfoByUserId(
    Variables$Query$getNotifInfoByUserId instance,
    TRes Function(Variables$Query$getNotifInfoByUserId) then,
  ) = _CopyWithImpl$Variables$Query$getNotifInfoByUserId;

  factory CopyWith$Variables$Query$getNotifInfoByUserId.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getNotifInfoByUserId;

  TRes call({
    int? userId,
    String? app_type_id,
  });
}

class _CopyWithImpl$Variables$Query$getNotifInfoByUserId<TRes>
    implements CopyWith$Variables$Query$getNotifInfoByUserId<TRes> {
  _CopyWithImpl$Variables$Query$getNotifInfoByUserId(
    this._instance,
    this._then,
  );

  final Variables$Query$getNotifInfoByUserId _instance;

  final TRes Function(Variables$Query$getNotifInfoByUserId) _then;

  static const _undefined = {};

  TRes call({
    Object? userId = _undefined,
    Object? app_type_id = _undefined,
  }) =>
      _then(Variables$Query$getNotifInfoByUserId._({
        ..._instance._$data,
        if (userId != _undefined && userId != null) 'userId': (userId as int),
        if (app_type_id != _undefined && app_type_id != null)
          'app_type_id': (app_type_id as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$getNotifInfoByUserId<TRes>
    implements CopyWith$Variables$Query$getNotifInfoByUserId<TRes> {
  _CopyWithStubImpl$Variables$Query$getNotifInfoByUserId(this._res);

  TRes _res;

  call({
    int? userId,
    String? app_type_id,
  }) =>
      _res;
}

class Query$getNotifInfoByUserId {
  Query$getNotifInfoByUserId({
    required this.notification_info,
    required this.$__typename,
  });

  factory Query$getNotifInfoByUserId.fromJson(Map<String, dynamic> json) {
    final l$notification_info = json['notification_info'];
    final l$$__typename = json['__typename'];
    return Query$getNotifInfoByUserId(
      notification_info: (l$notification_info as List<dynamic>)
          .map((e) => Query$getNotifInfoByUserId$notification_info.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getNotifInfoByUserId$notification_info> notification_info;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$notification_info = notification_info;
    _resultData['notification_info'] =
        l$notification_info.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$notification_info = notification_info;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$notification_info.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getNotifInfoByUserId) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$notification_info = notification_info;
    final lOther$notification_info = other.notification_info;
    if (l$notification_info.length != lOther$notification_info.length) {
      return false;
    }
    for (int i = 0; i < l$notification_info.length; i++) {
      final l$notification_info$entry = l$notification_info[i];
      final lOther$notification_info$entry = lOther$notification_info[i];
      if (l$notification_info$entry != lOther$notification_info$entry) {
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

extension UtilityExtension$Query$getNotifInfoByUserId
    on Query$getNotifInfoByUserId {
  CopyWith$Query$getNotifInfoByUserId<Query$getNotifInfoByUserId>
      get copyWith => CopyWith$Query$getNotifInfoByUserId(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getNotifInfoByUserId<TRes> {
  factory CopyWith$Query$getNotifInfoByUserId(
    Query$getNotifInfoByUserId instance,
    TRes Function(Query$getNotifInfoByUserId) then,
  ) = _CopyWithImpl$Query$getNotifInfoByUserId;

  factory CopyWith$Query$getNotifInfoByUserId.stub(TRes res) =
      _CopyWithStubImpl$Query$getNotifInfoByUserId;

  TRes call({
    List<Query$getNotifInfoByUserId$notification_info>? notification_info,
    String? $__typename,
  });
  TRes notification_info(
      Iterable<Query$getNotifInfoByUserId$notification_info> Function(
              Iterable<
                  CopyWith$Query$getNotifInfoByUserId$notification_info<
                      Query$getNotifInfoByUserId$notification_info>>)
          _fn);
}

class _CopyWithImpl$Query$getNotifInfoByUserId<TRes>
    implements CopyWith$Query$getNotifInfoByUserId<TRes> {
  _CopyWithImpl$Query$getNotifInfoByUserId(
    this._instance,
    this._then,
  );

  final Query$getNotifInfoByUserId _instance;

  final TRes Function(Query$getNotifInfoByUserId) _then;

  static const _undefined = {};

  TRes call({
    Object? notification_info = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getNotifInfoByUserId(
        notification_info:
            notification_info == _undefined || notification_info == null
                ? _instance.notification_info
                : (notification_info
                    as List<Query$getNotifInfoByUserId$notification_info>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes notification_info(
          Iterable<Query$getNotifInfoByUserId$notification_info> Function(
                  Iterable<
                      CopyWith$Query$getNotifInfoByUserId$notification_info<
                          Query$getNotifInfoByUserId$notification_info>>)
              _fn) =>
      call(
          notification_info: _fn(_instance.notification_info
              .map((e) => CopyWith$Query$getNotifInfoByUserId$notification_info(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getNotifInfoByUserId<TRes>
    implements CopyWith$Query$getNotifInfoByUserId<TRes> {
  _CopyWithStubImpl$Query$getNotifInfoByUserId(this._res);

  TRes _res;

  call({
    List<Query$getNotifInfoByUserId$notification_info>? notification_info,
    String? $__typename,
  }) =>
      _res;
  notification_info(_fn) => _res;
}

const documentNodeQuerygetNotifInfoByUserId = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getNotifInfoByUserId'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'userId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'app_type_id')),
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
        name: NameNode(value: 'notification_info'),
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
                    value: VariableNode(name: NameNode(value: 'userId')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'app_type_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'app_type_id')),
                  )
                ]),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'app_type_id'),
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
            name: NameNode(value: 'token'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'user_id'),
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
      
    ]),
  ),
]);
Query$getNotifInfoByUserId _parserFn$Query$getNotifInfoByUserId(
        Map<String, dynamic> data) =>
    Query$getNotifInfoByUserId.fromJson(data);

class Options$Query$getNotifInfoByUserId
    extends graphql.QueryOptions<Query$getNotifInfoByUserId> {
  Options$Query$getNotifInfoByUserId({
    String? operationName,
    required Variables$Query$getNotifInfoByUserId variables,
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
          document: documentNodeQuerygetNotifInfoByUserId,
          parserFn: _parserFn$Query$getNotifInfoByUserId,
        );
}

class WatchOptions$Query$getNotifInfoByUserId
    extends graphql.WatchQueryOptions<Query$getNotifInfoByUserId> {
  WatchOptions$Query$getNotifInfoByUserId({
    String? operationName,
    required Variables$Query$getNotifInfoByUserId variables,
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
          document: documentNodeQuerygetNotifInfoByUserId,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getNotifInfoByUserId,
        );
}

class FetchMoreOptions$Query$getNotifInfoByUserId
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getNotifInfoByUserId({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getNotifInfoByUserId variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetNotifInfoByUserId,
        );
}

extension ClientExtension$Query$getNotifInfoByUserId on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getNotifInfoByUserId>>
      query$getNotifInfoByUserId(
              Options$Query$getNotifInfoByUserId options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getNotifInfoByUserId>
      watchQuery$getNotifInfoByUserId(
              WatchOptions$Query$getNotifInfoByUserId options) =>
          this.watchQuery(options);
  void writeQuery$getNotifInfoByUserId({
    required Query$getNotifInfoByUserId data,
    required Variables$Query$getNotifInfoByUserId variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetNotifInfoByUserId),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getNotifInfoByUserId? readQuery$getNotifInfoByUserId({
    required Variables$Query$getNotifInfoByUserId variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetNotifInfoByUserId),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getNotifInfoByUserId.fromJson(result);
  }
}

class Query$getNotifInfoByUserId$notification_info {
  Query$getNotifInfoByUserId$notification_info({
    required this.app_type_id,
    required this.id,
    required this.token,
    required this.user_id,
    required this.turn_off_notifications,
    required this.$__typename,
  });

  factory Query$getNotifInfoByUserId$notification_info.fromJson(
      Map<String, dynamic> json) {
    final l$app_type_id = json['app_type_id'];
    final l$id = json['id'];
    final l$token = json['token'];
    final l$user_id = json['user_id'];
    final l$turn_off_notifications = json['turn_off_notifications'];
    final l$$__typename = json['__typename'];
    return Query$getNotifInfoByUserId$notification_info(
      app_type_id: (l$app_type_id as String),
      id: (l$id as int),
      token: (l$token as String),
      user_id: (l$user_id as int),
      turn_off_notifications: (l$turn_off_notifications as bool),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String app_type_id;

  final int id;

  final String token;

  final int user_id;

  final bool turn_off_notifications;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$app_type_id = app_type_id;
    _resultData['app_type_id'] = l$app_type_id;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$token = token;
    _resultData['token'] = l$token;
    final l$user_id = user_id;
    _resultData['user_id'] = l$user_id;
    final l$turn_off_notifications = turn_off_notifications;
    _resultData['turn_off_notifications'] = l$turn_off_notifications;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$app_type_id = app_type_id;
    final l$id = id;
    final l$token = token;
    final l$user_id = user_id;
    final l$turn_off_notifications = turn_off_notifications;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$app_type_id,
      l$id,
      l$token,
      l$user_id,
      l$turn_off_notifications,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getNotifInfoByUserId$notification_info) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$app_type_id = app_type_id;
    final lOther$app_type_id = other.app_type_id;
    if (l$app_type_id != lOther$app_type_id) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$token = token;
    final lOther$token = other.token;
    if (l$token != lOther$token) {
      return false;
    }
    final l$user_id = user_id;
    final lOther$user_id = other.user_id;
    if (l$user_id != lOther$user_id) {
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

extension UtilityExtension$Query$getNotifInfoByUserId$notification_info
    on Query$getNotifInfoByUserId$notification_info {
  CopyWith$Query$getNotifInfoByUserId$notification_info<
          Query$getNotifInfoByUserId$notification_info>
      get copyWith => CopyWith$Query$getNotifInfoByUserId$notification_info(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getNotifInfoByUserId$notification_info<TRes> {
  factory CopyWith$Query$getNotifInfoByUserId$notification_info(
    Query$getNotifInfoByUserId$notification_info instance,
    TRes Function(Query$getNotifInfoByUserId$notification_info) then,
  ) = _CopyWithImpl$Query$getNotifInfoByUserId$notification_info;

  factory CopyWith$Query$getNotifInfoByUserId$notification_info.stub(TRes res) =
      _CopyWithStubImpl$Query$getNotifInfoByUserId$notification_info;

  TRes call({
    String? app_type_id,
    int? id,
    String? token,
    int? user_id,
    bool? turn_off_notifications,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getNotifInfoByUserId$notification_info<TRes>
    implements CopyWith$Query$getNotifInfoByUserId$notification_info<TRes> {
  _CopyWithImpl$Query$getNotifInfoByUserId$notification_info(
    this._instance,
    this._then,
  );

  final Query$getNotifInfoByUserId$notification_info _instance;

  final TRes Function(Query$getNotifInfoByUserId$notification_info) _then;

  static const _undefined = {};

  TRes call({
    Object? app_type_id = _undefined,
    Object? id = _undefined,
    Object? token = _undefined,
    Object? user_id = _undefined,
    Object? turn_off_notifications = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getNotifInfoByUserId$notification_info(
        app_type_id: app_type_id == _undefined || app_type_id == null
            ? _instance.app_type_id
            : (app_type_id as String),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        token: token == _undefined || token == null
            ? _instance.token
            : (token as String),
        user_id: user_id == _undefined || user_id == null
            ? _instance.user_id
            : (user_id as int),
        turn_off_notifications: turn_off_notifications == _undefined ||
                turn_off_notifications == null
            ? _instance.turn_off_notifications
            : (turn_off_notifications as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getNotifInfoByUserId$notification_info<TRes>
    implements CopyWith$Query$getNotifInfoByUserId$notification_info<TRes> {
  _CopyWithStubImpl$Query$getNotifInfoByUserId$notification_info(this._res);

  TRes _res;

  call({
    String? app_type_id,
    int? id,
    String? token,
    int? user_id,
    bool? turn_off_notifications,
    String? $__typename,
  }) =>
      _res;
}
