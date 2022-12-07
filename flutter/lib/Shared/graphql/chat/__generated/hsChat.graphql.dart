import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$get_chat_info {
  factory Variables$Query$get_chat_info({required int chat_id}) =>
      Variables$Query$get_chat_info._({
        r'chat_id': chat_id,
      });

  Variables$Query$get_chat_info._(this._$data);

  factory Variables$Query$get_chat_info.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$chat_id = data['chat_id'];
    result$data['chat_id'] = (l$chat_id as int);
    return Variables$Query$get_chat_info._(result$data);
  }

  Map<String, dynamic> _$data;

  int get chat_id => (_$data['chat_id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$chat_id = chat_id;
    result$data['chat_id'] = l$chat_id;
    return result$data;
  }

  CopyWith$Variables$Query$get_chat_info<Variables$Query$get_chat_info>
      get copyWith => CopyWith$Variables$Query$get_chat_info(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_chat_info) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$chat_id = chat_id;
    final lOther$chat_id = other.chat_id;
    if (l$chat_id != lOther$chat_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$chat_id = chat_id;
    return Object.hashAll([l$chat_id]);
  }
}

abstract class CopyWith$Variables$Query$get_chat_info<TRes> {
  factory CopyWith$Variables$Query$get_chat_info(
    Variables$Query$get_chat_info instance,
    TRes Function(Variables$Query$get_chat_info) then,
  ) = _CopyWithImpl$Variables$Query$get_chat_info;

  factory CopyWith$Variables$Query$get_chat_info.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$get_chat_info;

  TRes call({int? chat_id});
}

class _CopyWithImpl$Variables$Query$get_chat_info<TRes>
    implements CopyWith$Variables$Query$get_chat_info<TRes> {
  _CopyWithImpl$Variables$Query$get_chat_info(
    this._instance,
    this._then,
  );

  final Variables$Query$get_chat_info _instance;

  final TRes Function(Variables$Query$get_chat_info) _then;

  static const _undefined = {};

  TRes call({Object? chat_id = _undefined}) =>
      _then(Variables$Query$get_chat_info._({
        ..._instance._$data,
        if (chat_id != _undefined && chat_id != null)
          'chat_id': (chat_id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_chat_info<TRes>
    implements CopyWith$Variables$Query$get_chat_info<TRes> {
  _CopyWithStubImpl$Variables$Query$get_chat_info(this._res);

  TRes _res;

  call({int? chat_id}) => _res;
}

class Query$get_chat_info {
  Query$get_chat_info({
    this.chat_by_pk,
    required this.$__typename,
  });

  factory Query$get_chat_info.fromJson(Map<String, dynamic> json) {
    final l$chat_by_pk = json['chat_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$get_chat_info(
      chat_by_pk: l$chat_by_pk == null
          ? null
          : Query$get_chat_info$chat_by_pk.fromJson(
              (l$chat_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_chat_info$chat_by_pk? chat_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$chat_by_pk = chat_by_pk;
    _resultData['chat_by_pk'] = l$chat_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$chat_by_pk = chat_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$chat_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_chat_info) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$chat_by_pk = chat_by_pk;
    final lOther$chat_by_pk = other.chat_by_pk;
    if (l$chat_by_pk != lOther$chat_by_pk) {
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

extension UtilityExtension$Query$get_chat_info on Query$get_chat_info {
  CopyWith$Query$get_chat_info<Query$get_chat_info> get copyWith =>
      CopyWith$Query$get_chat_info(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$get_chat_info<TRes> {
  factory CopyWith$Query$get_chat_info(
    Query$get_chat_info instance,
    TRes Function(Query$get_chat_info) then,
  ) = _CopyWithImpl$Query$get_chat_info;

  factory CopyWith$Query$get_chat_info.stub(TRes res) =
      _CopyWithStubImpl$Query$get_chat_info;

  TRes call({
    Query$get_chat_info$chat_by_pk? chat_by_pk,
    String? $__typename,
  });
  CopyWith$Query$get_chat_info$chat_by_pk<TRes> get chat_by_pk;
}

class _CopyWithImpl$Query$get_chat_info<TRes>
    implements CopyWith$Query$get_chat_info<TRes> {
  _CopyWithImpl$Query$get_chat_info(
    this._instance,
    this._then,
  );

  final Query$get_chat_info _instance;

  final TRes Function(Query$get_chat_info) _then;

  static const _undefined = {};

  TRes call({
    Object? chat_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_chat_info(
        chat_by_pk: chat_by_pk == _undefined
            ? _instance.chat_by_pk
            : (chat_by_pk as Query$get_chat_info$chat_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_chat_info$chat_by_pk<TRes> get chat_by_pk {
    final local$chat_by_pk = _instance.chat_by_pk;
    return local$chat_by_pk == null
        ? CopyWith$Query$get_chat_info$chat_by_pk.stub(_then(_instance))
        : CopyWith$Query$get_chat_info$chat_by_pk(
            local$chat_by_pk, (e) => call(chat_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$get_chat_info<TRes>
    implements CopyWith$Query$get_chat_info<TRes> {
  _CopyWithStubImpl$Query$get_chat_info(this._res);

  TRes _res;

  call({
    Query$get_chat_info$chat_by_pk? chat_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_chat_info$chat_by_pk<TRes> get chat_by_pk =>
      CopyWith$Query$get_chat_info$chat_by_pk.stub(_res);
}

const documentNodeQueryget_chat_info = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_chat_info'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'chat_id')),
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
        name: NameNode(value: 'chat_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'chat_id')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'messages'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'chat_info'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'creation_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'chat_participants'),
            alias: null,
            arguments: [],
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
                name: NameNode(value: 'user'),
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
Query$get_chat_info _parserFn$Query$get_chat_info(Map<String, dynamic> data) =>
    Query$get_chat_info.fromJson(data);

class Options$Query$get_chat_info
    extends graphql.QueryOptions<Query$get_chat_info> {
  Options$Query$get_chat_info({
    String? operationName,
    required Variables$Query$get_chat_info variables,
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
          document: documentNodeQueryget_chat_info,
          parserFn: _parserFn$Query$get_chat_info,
        );
}

class WatchOptions$Query$get_chat_info
    extends graphql.WatchQueryOptions<Query$get_chat_info> {
  WatchOptions$Query$get_chat_info({
    String? operationName,
    required Variables$Query$get_chat_info variables,
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
          document: documentNodeQueryget_chat_info,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_chat_info,
        );
}

class FetchMoreOptions$Query$get_chat_info extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_chat_info({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_chat_info variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_chat_info,
        );
}

extension ClientExtension$Query$get_chat_info on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_chat_info>> query$get_chat_info(
          Options$Query$get_chat_info options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$get_chat_info> watchQuery$get_chat_info(
          WatchOptions$Query$get_chat_info options) =>
      this.watchQuery(options);
  void writeQuery$get_chat_info({
    required Query$get_chat_info data,
    required Variables$Query$get_chat_info variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryget_chat_info),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_chat_info? readQuery$get_chat_info({
    required Variables$Query$get_chat_info variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryget_chat_info),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$get_chat_info.fromJson(result);
  }
}

class Query$get_chat_info$chat_by_pk {
  Query$get_chat_info$chat_by_pk({
    this.messages,
    this.chat_info,
    required this.creation_time,
    required this.chat_participants,
    required this.$__typename,
  });

  factory Query$get_chat_info$chat_by_pk.fromJson(Map<String, dynamic> json) {
    final l$messages = json['messages'];
    final l$chat_info = json['chat_info'];
    final l$creation_time = json['creation_time'];
    final l$chat_participants = json['chat_participants'];
    final l$$__typename = json['__typename'];
    return Query$get_chat_info$chat_by_pk(
      messages: (l$messages as Map<String, dynamic>?),
      chat_info: (l$chat_info as Map<String, dynamic>?),
      creation_time: (l$creation_time as String),
      chat_participants: (l$chat_participants as List<dynamic>)
          .map((e) => Query$get_chat_info$chat_by_pk$chat_participants.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Map<String, dynamic>? messages;

  final Map<String, dynamic>? chat_info;

  final String creation_time;

  final List<Query$get_chat_info$chat_by_pk$chat_participants>
      chat_participants;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$messages = messages;
    _resultData['messages'] = l$messages;
    final l$chat_info = chat_info;
    _resultData['chat_info'] = l$chat_info;
    final l$creation_time = creation_time;
    _resultData['creation_time'] = l$creation_time;
    final l$chat_participants = chat_participants;
    _resultData['chat_participants'] =
        l$chat_participants.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$messages = messages;
    final l$chat_info = chat_info;
    final l$creation_time = creation_time;
    final l$chat_participants = chat_participants;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$messages,
      l$chat_info,
      l$creation_time,
      Object.hashAll(l$chat_participants.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_chat_info$chat_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$messages = messages;
    final lOther$messages = other.messages;
    if (l$messages != lOther$messages) {
      return false;
    }
    final l$chat_info = chat_info;
    final lOther$chat_info = other.chat_info;
    if (l$chat_info != lOther$chat_info) {
      return false;
    }
    final l$creation_time = creation_time;
    final lOther$creation_time = other.creation_time;
    if (l$creation_time != lOther$creation_time) {
      return false;
    }
    final l$chat_participants = chat_participants;
    final lOther$chat_participants = other.chat_participants;
    if (l$chat_participants.length != lOther$chat_participants.length) {
      return false;
    }
    for (int i = 0; i < l$chat_participants.length; i++) {
      final l$chat_participants$entry = l$chat_participants[i];
      final lOther$chat_participants$entry = lOther$chat_participants[i];
      if (l$chat_participants$entry != lOther$chat_participants$entry) {
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

extension UtilityExtension$Query$get_chat_info$chat_by_pk
    on Query$get_chat_info$chat_by_pk {
  CopyWith$Query$get_chat_info$chat_by_pk<Query$get_chat_info$chat_by_pk>
      get copyWith => CopyWith$Query$get_chat_info$chat_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_chat_info$chat_by_pk<TRes> {
  factory CopyWith$Query$get_chat_info$chat_by_pk(
    Query$get_chat_info$chat_by_pk instance,
    TRes Function(Query$get_chat_info$chat_by_pk) then,
  ) = _CopyWithImpl$Query$get_chat_info$chat_by_pk;

  factory CopyWith$Query$get_chat_info$chat_by_pk.stub(TRes res) =
      _CopyWithStubImpl$Query$get_chat_info$chat_by_pk;

  TRes call({
    Map<String, dynamic>? messages,
    Map<String, dynamic>? chat_info,
    String? creation_time,
    List<Query$get_chat_info$chat_by_pk$chat_participants>? chat_participants,
    String? $__typename,
  });
  TRes chat_participants(
      Iterable<Query$get_chat_info$chat_by_pk$chat_participants> Function(
              Iterable<
                  CopyWith$Query$get_chat_info$chat_by_pk$chat_participants<
                      Query$get_chat_info$chat_by_pk$chat_participants>>)
          _fn);
}

class _CopyWithImpl$Query$get_chat_info$chat_by_pk<TRes>
    implements CopyWith$Query$get_chat_info$chat_by_pk<TRes> {
  _CopyWithImpl$Query$get_chat_info$chat_by_pk(
    this._instance,
    this._then,
  );

  final Query$get_chat_info$chat_by_pk _instance;

  final TRes Function(Query$get_chat_info$chat_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? messages = _undefined,
    Object? chat_info = _undefined,
    Object? creation_time = _undefined,
    Object? chat_participants = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_chat_info$chat_by_pk(
        messages: messages == _undefined
            ? _instance.messages
            : (messages as Map<String, dynamic>?),
        chat_info: chat_info == _undefined
            ? _instance.chat_info
            : (chat_info as Map<String, dynamic>?),
        creation_time: creation_time == _undefined || creation_time == null
            ? _instance.creation_time
            : (creation_time as String),
        chat_participants:
            chat_participants == _undefined || chat_participants == null
                ? _instance.chat_participants
                : (chat_participants
                    as List<Query$get_chat_info$chat_by_pk$chat_participants>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes chat_participants(
          Iterable<Query$get_chat_info$chat_by_pk$chat_participants> Function(
                  Iterable<
                      CopyWith$Query$get_chat_info$chat_by_pk$chat_participants<
                          Query$get_chat_info$chat_by_pk$chat_participants>>)
              _fn) =>
      call(
          chat_participants: _fn(_instance.chat_participants.map(
              (e) => CopyWith$Query$get_chat_info$chat_by_pk$chat_participants(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$get_chat_info$chat_by_pk<TRes>
    implements CopyWith$Query$get_chat_info$chat_by_pk<TRes> {
  _CopyWithStubImpl$Query$get_chat_info$chat_by_pk(this._res);

  TRes _res;

  call({
    Map<String, dynamic>? messages,
    Map<String, dynamic>? chat_info,
    String? creation_time,
    List<Query$get_chat_info$chat_by_pk$chat_participants>? chat_participants,
    String? $__typename,
  }) =>
      _res;
  chat_participants(_fn) => _res;
}

class Query$get_chat_info$chat_by_pk$chat_participants {
  Query$get_chat_info$chat_by_pk$chat_participants({
    required this.app_type_id,
    required this.user,
    required this.$__typename,
  });

  factory Query$get_chat_info$chat_by_pk$chat_participants.fromJson(
      Map<String, dynamic> json) {
    final l$app_type_id = json['app_type_id'];
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$get_chat_info$chat_by_pk$chat_participants(
      app_type_id: (l$app_type_id as String),
      user: Query$get_chat_info$chat_by_pk$chat_participants$user.fromJson(
          (l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String app_type_id;

  final Query$get_chat_info$chat_by_pk$chat_participants$user user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$app_type_id = app_type_id;
    _resultData['app_type_id'] = l$app_type_id;
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$app_type_id = app_type_id;
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$app_type_id,
      l$user,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_chat_info$chat_by_pk$chat_participants) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$app_type_id = app_type_id;
    final lOther$app_type_id = other.app_type_id;
    if (l$app_type_id != lOther$app_type_id) {
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

extension UtilityExtension$Query$get_chat_info$chat_by_pk$chat_participants
    on Query$get_chat_info$chat_by_pk$chat_participants {
  CopyWith$Query$get_chat_info$chat_by_pk$chat_participants<
          Query$get_chat_info$chat_by_pk$chat_participants>
      get copyWith => CopyWith$Query$get_chat_info$chat_by_pk$chat_participants(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_chat_info$chat_by_pk$chat_participants<TRes> {
  factory CopyWith$Query$get_chat_info$chat_by_pk$chat_participants(
    Query$get_chat_info$chat_by_pk$chat_participants instance,
    TRes Function(Query$get_chat_info$chat_by_pk$chat_participants) then,
  ) = _CopyWithImpl$Query$get_chat_info$chat_by_pk$chat_participants;

  factory CopyWith$Query$get_chat_info$chat_by_pk$chat_participants.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_chat_info$chat_by_pk$chat_participants;

  TRes call({
    String? app_type_id,
    Query$get_chat_info$chat_by_pk$chat_participants$user? user,
    String? $__typename,
  });
  CopyWith$Query$get_chat_info$chat_by_pk$chat_participants$user<TRes> get user;
}

class _CopyWithImpl$Query$get_chat_info$chat_by_pk$chat_participants<TRes>
    implements CopyWith$Query$get_chat_info$chat_by_pk$chat_participants<TRes> {
  _CopyWithImpl$Query$get_chat_info$chat_by_pk$chat_participants(
    this._instance,
    this._then,
  );

  final Query$get_chat_info$chat_by_pk$chat_participants _instance;

  final TRes Function(Query$get_chat_info$chat_by_pk$chat_participants) _then;

  static const _undefined = {};

  TRes call({
    Object? app_type_id = _undefined,
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_chat_info$chat_by_pk$chat_participants(
        app_type_id: app_type_id == _undefined || app_type_id == null
            ? _instance.app_type_id
            : (app_type_id as String),
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Query$get_chat_info$chat_by_pk$chat_participants$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_chat_info$chat_by_pk$chat_participants$user<TRes>
      get user {
    final local$user = _instance.user;
    return CopyWith$Query$get_chat_info$chat_by_pk$chat_participants$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$get_chat_info$chat_by_pk$chat_participants<TRes>
    implements CopyWith$Query$get_chat_info$chat_by_pk$chat_participants<TRes> {
  _CopyWithStubImpl$Query$get_chat_info$chat_by_pk$chat_participants(this._res);

  TRes _res;

  call({
    String? app_type_id,
    Query$get_chat_info$chat_by_pk$chat_participants$user? user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_chat_info$chat_by_pk$chat_participants$user<TRes>
      get user =>
          CopyWith$Query$get_chat_info$chat_by_pk$chat_participants$user.stub(
              _res);
}

class Query$get_chat_info$chat_by_pk$chat_participants$user {
  Query$get_chat_info$chat_by_pk$chat_participants$user({
    this.image,
    this.name,
    required this.id,
    required this.$__typename,
  });

  factory Query$get_chat_info$chat_by_pk$chat_participants$user.fromJson(
      Map<String, dynamic> json) {
    final l$image = json['image'];
    final l$name = json['name'];
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Query$get_chat_info$chat_by_pk$chat_participants$user(
      image: (l$image as String?),
      name: (l$name as String?),
      id: (l$id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? image;

  final String? name;

  final int id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$image = image;
    _resultData['image'] = l$image;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$image = image;
    final l$name = name;
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$image,
      l$name,
      l$id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_chat_info$chat_by_pk$chat_participants$user) ||
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

extension UtilityExtension$Query$get_chat_info$chat_by_pk$chat_participants$user
    on Query$get_chat_info$chat_by_pk$chat_participants$user {
  CopyWith$Query$get_chat_info$chat_by_pk$chat_participants$user<
          Query$get_chat_info$chat_by_pk$chat_participants$user>
      get copyWith =>
          CopyWith$Query$get_chat_info$chat_by_pk$chat_participants$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_chat_info$chat_by_pk$chat_participants$user<
    TRes> {
  factory CopyWith$Query$get_chat_info$chat_by_pk$chat_participants$user(
    Query$get_chat_info$chat_by_pk$chat_participants$user instance,
    TRes Function(Query$get_chat_info$chat_by_pk$chat_participants$user) then,
  ) = _CopyWithImpl$Query$get_chat_info$chat_by_pk$chat_participants$user;

  factory CopyWith$Query$get_chat_info$chat_by_pk$chat_participants$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_chat_info$chat_by_pk$chat_participants$user;

  TRes call({
    String? image,
    String? name,
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_chat_info$chat_by_pk$chat_participants$user<TRes>
    implements
        CopyWith$Query$get_chat_info$chat_by_pk$chat_participants$user<TRes> {
  _CopyWithImpl$Query$get_chat_info$chat_by_pk$chat_participants$user(
    this._instance,
    this._then,
  );

  final Query$get_chat_info$chat_by_pk$chat_participants$user _instance;

  final TRes Function(Query$get_chat_info$chat_by_pk$chat_participants$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? image = _undefined,
    Object? name = _undefined,
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_chat_info$chat_by_pk$chat_participants$user(
        image: image == _undefined ? _instance.image : (image as String?),
        name: name == _undefined ? _instance.name : (name as String?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_chat_info$chat_by_pk$chat_participants$user<
        TRes>
    implements
        CopyWith$Query$get_chat_info$chat_by_pk$chat_participants$user<TRes> {
  _CopyWithStubImpl$Query$get_chat_info$chat_by_pk$chat_participants$user(
      this._res);

  TRes _res;

  call({
    String? image,
    String? name,
    int? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Subscription$get_chat_info {
  factory Variables$Subscription$get_chat_info({required int chat_id}) =>
      Variables$Subscription$get_chat_info._({
        r'chat_id': chat_id,
      });

  Variables$Subscription$get_chat_info._(this._$data);

  factory Variables$Subscription$get_chat_info.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$chat_id = data['chat_id'];
    result$data['chat_id'] = (l$chat_id as int);
    return Variables$Subscription$get_chat_info._(result$data);
  }

  Map<String, dynamic> _$data;

  int get chat_id => (_$data['chat_id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$chat_id = chat_id;
    result$data['chat_id'] = l$chat_id;
    return result$data;
  }

  CopyWith$Variables$Subscription$get_chat_info<
          Variables$Subscription$get_chat_info>
      get copyWith => CopyWith$Variables$Subscription$get_chat_info(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Subscription$get_chat_info) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$chat_id = chat_id;
    final lOther$chat_id = other.chat_id;
    if (l$chat_id != lOther$chat_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$chat_id = chat_id;
    return Object.hashAll([l$chat_id]);
  }
}

abstract class CopyWith$Variables$Subscription$get_chat_info<TRes> {
  factory CopyWith$Variables$Subscription$get_chat_info(
    Variables$Subscription$get_chat_info instance,
    TRes Function(Variables$Subscription$get_chat_info) then,
  ) = _CopyWithImpl$Variables$Subscription$get_chat_info;

  factory CopyWith$Variables$Subscription$get_chat_info.stub(TRes res) =
      _CopyWithStubImpl$Variables$Subscription$get_chat_info;

  TRes call({int? chat_id});
}

class _CopyWithImpl$Variables$Subscription$get_chat_info<TRes>
    implements CopyWith$Variables$Subscription$get_chat_info<TRes> {
  _CopyWithImpl$Variables$Subscription$get_chat_info(
    this._instance,
    this._then,
  );

  final Variables$Subscription$get_chat_info _instance;

  final TRes Function(Variables$Subscription$get_chat_info) _then;

  static const _undefined = {};

  TRes call({Object? chat_id = _undefined}) =>
      _then(Variables$Subscription$get_chat_info._({
        ..._instance._$data,
        if (chat_id != _undefined && chat_id != null)
          'chat_id': (chat_id as int),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$get_chat_info<TRes>
    implements CopyWith$Variables$Subscription$get_chat_info<TRes> {
  _CopyWithStubImpl$Variables$Subscription$get_chat_info(this._res);

  TRes _res;

  call({int? chat_id}) => _res;
}

class Subscription$get_chat_info {
  Subscription$get_chat_info({
    this.chat_by_pk,
    required this.$__typename,
  });

  factory Subscription$get_chat_info.fromJson(Map<String, dynamic> json) {
    final l$chat_by_pk = json['chat_by_pk'];
    final l$$__typename = json['__typename'];
    return Subscription$get_chat_info(
      chat_by_pk: l$chat_by_pk == null
          ? null
          : Subscription$get_chat_info$chat_by_pk.fromJson(
              (l$chat_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$get_chat_info$chat_by_pk? chat_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$chat_by_pk = chat_by_pk;
    _resultData['chat_by_pk'] = l$chat_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$chat_by_pk = chat_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$chat_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$get_chat_info) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$chat_by_pk = chat_by_pk;
    final lOther$chat_by_pk = other.chat_by_pk;
    if (l$chat_by_pk != lOther$chat_by_pk) {
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

extension UtilityExtension$Subscription$get_chat_info
    on Subscription$get_chat_info {
  CopyWith$Subscription$get_chat_info<Subscription$get_chat_info>
      get copyWith => CopyWith$Subscription$get_chat_info(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$get_chat_info<TRes> {
  factory CopyWith$Subscription$get_chat_info(
    Subscription$get_chat_info instance,
    TRes Function(Subscription$get_chat_info) then,
  ) = _CopyWithImpl$Subscription$get_chat_info;

  factory CopyWith$Subscription$get_chat_info.stub(TRes res) =
      _CopyWithStubImpl$Subscription$get_chat_info;

  TRes call({
    Subscription$get_chat_info$chat_by_pk? chat_by_pk,
    String? $__typename,
  });
  CopyWith$Subscription$get_chat_info$chat_by_pk<TRes> get chat_by_pk;
}

class _CopyWithImpl$Subscription$get_chat_info<TRes>
    implements CopyWith$Subscription$get_chat_info<TRes> {
  _CopyWithImpl$Subscription$get_chat_info(
    this._instance,
    this._then,
  );

  final Subscription$get_chat_info _instance;

  final TRes Function(Subscription$get_chat_info) _then;

  static const _undefined = {};

  TRes call({
    Object? chat_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$get_chat_info(
        chat_by_pk: chat_by_pk == _undefined
            ? _instance.chat_by_pk
            : (chat_by_pk as Subscription$get_chat_info$chat_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$get_chat_info$chat_by_pk<TRes> get chat_by_pk {
    final local$chat_by_pk = _instance.chat_by_pk;
    return local$chat_by_pk == null
        ? CopyWith$Subscription$get_chat_info$chat_by_pk.stub(_then(_instance))
        : CopyWith$Subscription$get_chat_info$chat_by_pk(
            local$chat_by_pk, (e) => call(chat_by_pk: e));
  }
}

class _CopyWithStubImpl$Subscription$get_chat_info<TRes>
    implements CopyWith$Subscription$get_chat_info<TRes> {
  _CopyWithStubImpl$Subscription$get_chat_info(this._res);

  TRes _res;

  call({
    Subscription$get_chat_info$chat_by_pk? chat_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$get_chat_info$chat_by_pk<TRes> get chat_by_pk =>
      CopyWith$Subscription$get_chat_info$chat_by_pk.stub(_res);
}

const documentNodeSubscriptionget_chat_info = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'get_chat_info'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'chat_id')),
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
        name: NameNode(value: 'chat_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'chat_id')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'messages'),
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
Subscription$get_chat_info _parserFn$Subscription$get_chat_info(
        Map<String, dynamic> data) =>
    Subscription$get_chat_info.fromJson(data);

class Options$Subscription$get_chat_info
    extends graphql.SubscriptionOptions<Subscription$get_chat_info> {
  Options$Subscription$get_chat_info({
    String? operationName,
    required Variables$Subscription$get_chat_info variables,
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
          document: documentNodeSubscriptionget_chat_info,
          parserFn: _parserFn$Subscription$get_chat_info,
        );
}

class WatchOptions$Subscription$get_chat_info
    extends graphql.WatchQueryOptions<Subscription$get_chat_info> {
  WatchOptions$Subscription$get_chat_info({
    String? operationName,
    required Variables$Subscription$get_chat_info variables,
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
          document: documentNodeSubscriptionget_chat_info,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$get_chat_info,
        );
}

class FetchMoreOptions$Subscription$get_chat_info
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$get_chat_info({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$get_chat_info variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptionget_chat_info,
        );
}

extension ClientExtension$Subscription$get_chat_info on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$get_chat_info>>
      subscribe$get_chat_info(Options$Subscription$get_chat_info options) =>
          this.subscribe(options);
  graphql.ObservableQuery<Subscription$get_chat_info>
      watchSubscription$get_chat_info(
              WatchOptions$Subscription$get_chat_info options) =>
          this.watchQuery(options);
}

class Subscription$get_chat_info$chat_by_pk {
  Subscription$get_chat_info$chat_by_pk({
    this.messages,
    required this.$__typename,
  });

  factory Subscription$get_chat_info$chat_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$messages = json['messages'];
    final l$$__typename = json['__typename'];
    return Subscription$get_chat_info$chat_by_pk(
      messages: (l$messages as Map<String, dynamic>?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Map<String, dynamic>? messages;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$messages = messages;
    _resultData['messages'] = l$messages;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$messages = messages;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$messages,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$get_chat_info$chat_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$messages = messages;
    final lOther$messages = other.messages;
    if (l$messages != lOther$messages) {
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

extension UtilityExtension$Subscription$get_chat_info$chat_by_pk
    on Subscription$get_chat_info$chat_by_pk {
  CopyWith$Subscription$get_chat_info$chat_by_pk<
          Subscription$get_chat_info$chat_by_pk>
      get copyWith => CopyWith$Subscription$get_chat_info$chat_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$get_chat_info$chat_by_pk<TRes> {
  factory CopyWith$Subscription$get_chat_info$chat_by_pk(
    Subscription$get_chat_info$chat_by_pk instance,
    TRes Function(Subscription$get_chat_info$chat_by_pk) then,
  ) = _CopyWithImpl$Subscription$get_chat_info$chat_by_pk;

  factory CopyWith$Subscription$get_chat_info$chat_by_pk.stub(TRes res) =
      _CopyWithStubImpl$Subscription$get_chat_info$chat_by_pk;

  TRes call({
    Map<String, dynamic>? messages,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$get_chat_info$chat_by_pk<TRes>
    implements CopyWith$Subscription$get_chat_info$chat_by_pk<TRes> {
  _CopyWithImpl$Subscription$get_chat_info$chat_by_pk(
    this._instance,
    this._then,
  );

  final Subscription$get_chat_info$chat_by_pk _instance;

  final TRes Function(Subscription$get_chat_info$chat_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? messages = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$get_chat_info$chat_by_pk(
        messages: messages == _undefined
            ? _instance.messages
            : (messages as Map<String, dynamic>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$get_chat_info$chat_by_pk<TRes>
    implements CopyWith$Subscription$get_chat_info$chat_by_pk<TRes> {
  _CopyWithStubImpl$Subscription$get_chat_info$chat_by_pk(this._res);

  TRes _res;

  call({
    Map<String, dynamic>? messages,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$add_message {
  factory Variables$Mutation$add_message({
    required int chat_id,
    required Map<String, dynamic> msg,
  }) =>
      Variables$Mutation$add_message._({
        r'chat_id': chat_id,
        r'msg': msg,
      });

  Variables$Mutation$add_message._(this._$data);

  factory Variables$Mutation$add_message.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$chat_id = data['chat_id'];
    result$data['chat_id'] = (l$chat_id as int);
    final l$msg = data['msg'];
    result$data['msg'] = (l$msg as Map<String, dynamic>);
    return Variables$Mutation$add_message._(result$data);
  }

  Map<String, dynamic> _$data;

  int get chat_id => (_$data['chat_id'] as int);
  Map<String, dynamic> get msg => (_$data['msg'] as Map<String, dynamic>);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$chat_id = chat_id;
    result$data['chat_id'] = l$chat_id;
    final l$msg = msg;
    result$data['msg'] = l$msg;
    return result$data;
  }

  CopyWith$Variables$Mutation$add_message<Variables$Mutation$add_message>
      get copyWith => CopyWith$Variables$Mutation$add_message(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$add_message) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$chat_id = chat_id;
    final lOther$chat_id = other.chat_id;
    if (l$chat_id != lOther$chat_id) {
      return false;
    }
    final l$msg = msg;
    final lOther$msg = other.msg;
    if (l$msg != lOther$msg) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$chat_id = chat_id;
    final l$msg = msg;
    return Object.hashAll([
      l$chat_id,
      l$msg,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$add_message<TRes> {
  factory CopyWith$Variables$Mutation$add_message(
    Variables$Mutation$add_message instance,
    TRes Function(Variables$Mutation$add_message) then,
  ) = _CopyWithImpl$Variables$Mutation$add_message;

  factory CopyWith$Variables$Mutation$add_message.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$add_message;

  TRes call({
    int? chat_id,
    Map<String, dynamic>? msg,
  });
}

class _CopyWithImpl$Variables$Mutation$add_message<TRes>
    implements CopyWith$Variables$Mutation$add_message<TRes> {
  _CopyWithImpl$Variables$Mutation$add_message(
    this._instance,
    this._then,
  );

  final Variables$Mutation$add_message _instance;

  final TRes Function(Variables$Mutation$add_message) _then;

  static const _undefined = {};

  TRes call({
    Object? chat_id = _undefined,
    Object? msg = _undefined,
  }) =>
      _then(Variables$Mutation$add_message._({
        ..._instance._$data,
        if (chat_id != _undefined && chat_id != null)
          'chat_id': (chat_id as int),
        if (msg != _undefined && msg != null)
          'msg': (msg as Map<String, dynamic>),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$add_message<TRes>
    implements CopyWith$Variables$Mutation$add_message<TRes> {
  _CopyWithStubImpl$Variables$Mutation$add_message(this._res);

  TRes _res;

  call({
    int? chat_id,
    Map<String, dynamic>? msg,
  }) =>
      _res;
}

class Mutation$add_message {
  Mutation$add_message({
    this.update_chat,
    required this.$__typename,
  });

  factory Mutation$add_message.fromJson(Map<String, dynamic> json) {
    final l$update_chat = json['update_chat'];
    final l$$__typename = json['__typename'];
    return Mutation$add_message(
      update_chat: l$update_chat == null
          ? null
          : Mutation$add_message$update_chat.fromJson(
              (l$update_chat as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$add_message$update_chat? update_chat;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_chat = update_chat;
    _resultData['update_chat'] = l$update_chat?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_chat = update_chat;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_chat,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$add_message) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_chat = update_chat;
    final lOther$update_chat = other.update_chat;
    if (l$update_chat != lOther$update_chat) {
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

extension UtilityExtension$Mutation$add_message on Mutation$add_message {
  CopyWith$Mutation$add_message<Mutation$add_message> get copyWith =>
      CopyWith$Mutation$add_message(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$add_message<TRes> {
  factory CopyWith$Mutation$add_message(
    Mutation$add_message instance,
    TRes Function(Mutation$add_message) then,
  ) = _CopyWithImpl$Mutation$add_message;

  factory CopyWith$Mutation$add_message.stub(TRes res) =
      _CopyWithStubImpl$Mutation$add_message;

  TRes call({
    Mutation$add_message$update_chat? update_chat,
    String? $__typename,
  });
  CopyWith$Mutation$add_message$update_chat<TRes> get update_chat;
}

class _CopyWithImpl$Mutation$add_message<TRes>
    implements CopyWith$Mutation$add_message<TRes> {
  _CopyWithImpl$Mutation$add_message(
    this._instance,
    this._then,
  );

  final Mutation$add_message _instance;

  final TRes Function(Mutation$add_message) _then;

  static const _undefined = {};

  TRes call({
    Object? update_chat = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$add_message(
        update_chat: update_chat == _undefined
            ? _instance.update_chat
            : (update_chat as Mutation$add_message$update_chat?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$add_message$update_chat<TRes> get update_chat {
    final local$update_chat = _instance.update_chat;
    return local$update_chat == null
        ? CopyWith$Mutation$add_message$update_chat.stub(_then(_instance))
        : CopyWith$Mutation$add_message$update_chat(
            local$update_chat, (e) => call(update_chat: e));
  }
}

class _CopyWithStubImpl$Mutation$add_message<TRes>
    implements CopyWith$Mutation$add_message<TRes> {
  _CopyWithStubImpl$Mutation$add_message(this._res);

  TRes _res;

  call({
    Mutation$add_message$update_chat? update_chat,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$add_message$update_chat<TRes> get update_chat =>
      CopyWith$Mutation$add_message$update_chat.stub(_res);
}

const documentNodeMutationadd_message = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'add_message'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'chat_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'msg')),
        type: NamedTypeNode(
          name: NameNode(value: 'jsonb'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'update_chat'),
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
                    value: VariableNode(name: NameNode(value: 'chat_id')),
                  )
                ]),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: '_append'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'messages'),
                value: VariableNode(name: NameNode(value: 'msg')),
              )
            ]),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'affected_rows'),
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
Mutation$add_message _parserFn$Mutation$add_message(
        Map<String, dynamic> data) =>
    Mutation$add_message.fromJson(data);
typedef OnMutationCompleted$Mutation$add_message = FutureOr<void> Function(
  dynamic,
  Mutation$add_message?,
);

class Options$Mutation$add_message
    extends graphql.MutationOptions<Mutation$add_message> {
  Options$Mutation$add_message({
    String? operationName,
    required Variables$Mutation$add_message variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$add_message? onCompleted,
    graphql.OnMutationUpdate<Mutation$add_message>? update,
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
                    data == null ? null : _parserFn$Mutation$add_message(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationadd_message,
          parserFn: _parserFn$Mutation$add_message,
        );

  final OnMutationCompleted$Mutation$add_message? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$add_message
    extends graphql.WatchQueryOptions<Mutation$add_message> {
  WatchOptions$Mutation$add_message({
    String? operationName,
    required Variables$Mutation$add_message variables,
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
          document: documentNodeMutationadd_message,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$add_message,
        );
}

extension ClientExtension$Mutation$add_message on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$add_message>> mutate$add_message(
          Options$Mutation$add_message options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$add_message> watchMutation$add_message(
          WatchOptions$Mutation$add_message options) =>
      this.watchMutation(options);
}

class Mutation$add_message$update_chat {
  Mutation$add_message$update_chat({
    required this.affected_rows,
    required this.$__typename,
  });

  factory Mutation$add_message$update_chat.fromJson(Map<String, dynamic> json) {
    final l$affected_rows = json['affected_rows'];
    final l$$__typename = json['__typename'];
    return Mutation$add_message$update_chat(
      affected_rows: (l$affected_rows as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int affected_rows;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$affected_rows = affected_rows;
    _resultData['affected_rows'] = l$affected_rows;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$affected_rows = affected_rows;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$affected_rows,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$add_message$update_chat) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$affected_rows = affected_rows;
    final lOther$affected_rows = other.affected_rows;
    if (l$affected_rows != lOther$affected_rows) {
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

extension UtilityExtension$Mutation$add_message$update_chat
    on Mutation$add_message$update_chat {
  CopyWith$Mutation$add_message$update_chat<Mutation$add_message$update_chat>
      get copyWith => CopyWith$Mutation$add_message$update_chat(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$add_message$update_chat<TRes> {
  factory CopyWith$Mutation$add_message$update_chat(
    Mutation$add_message$update_chat instance,
    TRes Function(Mutation$add_message$update_chat) then,
  ) = _CopyWithImpl$Mutation$add_message$update_chat;

  factory CopyWith$Mutation$add_message$update_chat.stub(TRes res) =
      _CopyWithStubImpl$Mutation$add_message$update_chat;

  TRes call({
    int? affected_rows,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$add_message$update_chat<TRes>
    implements CopyWith$Mutation$add_message$update_chat<TRes> {
  _CopyWithImpl$Mutation$add_message$update_chat(
    this._instance,
    this._then,
  );

  final Mutation$add_message$update_chat _instance;

  final TRes Function(Mutation$add_message$update_chat) _then;

  static const _undefined = {};

  TRes call({
    Object? affected_rows = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$add_message$update_chat(
        affected_rows: affected_rows == _undefined || affected_rows == null
            ? _instance.affected_rows
            : (affected_rows as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$add_message$update_chat<TRes>
    implements CopyWith$Mutation$add_message$update_chat<TRes> {
  _CopyWithStubImpl$Mutation$add_message$update_chat(this._res);

  TRes _res;

  call({
    int? affected_rows,
    String? $__typename,
  }) =>
      _res;
}
