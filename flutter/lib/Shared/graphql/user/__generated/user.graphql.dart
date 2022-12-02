import '../../__generated/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$getUserByFirebaseId {
  factory Variables$Query$getUserByFirebaseId({required String firebase_id}) =>
      Variables$Query$getUserByFirebaseId._({
        r'firebase_id': firebase_id,
      });

  Variables$Query$getUserByFirebaseId._(this._$data);

  factory Variables$Query$getUserByFirebaseId.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$firebase_id = data['firebase_id'];
    result$data['firebase_id'] = (l$firebase_id as String);
    return Variables$Query$getUserByFirebaseId._(result$data);
  }

  Map<String, dynamic> _$data;

  String get firebase_id => (_$data['firebase_id'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$firebase_id = firebase_id;
    result$data['firebase_id'] = l$firebase_id;
    return result$data;
  }

  CopyWith$Variables$Query$getUserByFirebaseId<
          Variables$Query$getUserByFirebaseId>
      get copyWith => CopyWith$Variables$Query$getUserByFirebaseId(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getUserByFirebaseId) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$firebase_id = firebase_id;
    final lOther$firebase_id = other.firebase_id;
    if (l$firebase_id != lOther$firebase_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$firebase_id = firebase_id;
    return Object.hashAll([l$firebase_id]);
  }
}

abstract class CopyWith$Variables$Query$getUserByFirebaseId<TRes> {
  factory CopyWith$Variables$Query$getUserByFirebaseId(
    Variables$Query$getUserByFirebaseId instance,
    TRes Function(Variables$Query$getUserByFirebaseId) then,
  ) = _CopyWithImpl$Variables$Query$getUserByFirebaseId;

  factory CopyWith$Variables$Query$getUserByFirebaseId.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getUserByFirebaseId;

  TRes call({String? firebase_id});
}

class _CopyWithImpl$Variables$Query$getUserByFirebaseId<TRes>
    implements CopyWith$Variables$Query$getUserByFirebaseId<TRes> {
  _CopyWithImpl$Variables$Query$getUserByFirebaseId(
    this._instance,
    this._then,
  );

  final Variables$Query$getUserByFirebaseId _instance;

  final TRes Function(Variables$Query$getUserByFirebaseId) _then;

  static const _undefined = {};

  TRes call({Object? firebase_id = _undefined}) =>
      _then(Variables$Query$getUserByFirebaseId._({
        ..._instance._$data,
        if (firebase_id != _undefined && firebase_id != null)
          'firebase_id': (firebase_id as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$getUserByFirebaseId<TRes>
    implements CopyWith$Variables$Query$getUserByFirebaseId<TRes> {
  _CopyWithStubImpl$Variables$Query$getUserByFirebaseId(this._res);

  TRes _res;

  call({String? firebase_id}) => _res;
}

class Query$getUserByFirebaseId {
  Query$getUserByFirebaseId({
    required this.user,
    required this.$__typename,
  });

  factory Query$getUserByFirebaseId.fromJson(Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$getUserByFirebaseId(
      user: (l$user as List<dynamic>)
          .map((e) => Query$getUserByFirebaseId$user.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getUserByFirebaseId$user> user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user = user;
    _resultData['user'] = l$user.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$user.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getUserByFirebaseId) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user.length != lOther$user.length) {
      return false;
    }
    for (int i = 0; i < l$user.length; i++) {
      final l$user$entry = l$user[i];
      final lOther$user$entry = lOther$user[i];
      if (l$user$entry != lOther$user$entry) {
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

extension UtilityExtension$Query$getUserByFirebaseId
    on Query$getUserByFirebaseId {
  CopyWith$Query$getUserByFirebaseId<Query$getUserByFirebaseId> get copyWith =>
      CopyWith$Query$getUserByFirebaseId(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getUserByFirebaseId<TRes> {
  factory CopyWith$Query$getUserByFirebaseId(
    Query$getUserByFirebaseId instance,
    TRes Function(Query$getUserByFirebaseId) then,
  ) = _CopyWithImpl$Query$getUserByFirebaseId;

  factory CopyWith$Query$getUserByFirebaseId.stub(TRes res) =
      _CopyWithStubImpl$Query$getUserByFirebaseId;

  TRes call({
    List<Query$getUserByFirebaseId$user>? user,
    String? $__typename,
  });
  TRes user(
      Iterable<Query$getUserByFirebaseId$user> Function(
              Iterable<
                  CopyWith$Query$getUserByFirebaseId$user<
                      Query$getUserByFirebaseId$user>>)
          _fn);
}

class _CopyWithImpl$Query$getUserByFirebaseId<TRes>
    implements CopyWith$Query$getUserByFirebaseId<TRes> {
  _CopyWithImpl$Query$getUserByFirebaseId(
    this._instance,
    this._then,
  );

  final Query$getUserByFirebaseId _instance;

  final TRes Function(Query$getUserByFirebaseId) _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getUserByFirebaseId(
        user: user == _undefined || user == null
            ? _instance.user
            : (user as List<Query$getUserByFirebaseId$user>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes user(
          Iterable<Query$getUserByFirebaseId$user> Function(
                  Iterable<
                      CopyWith$Query$getUserByFirebaseId$user<
                          Query$getUserByFirebaseId$user>>)
              _fn) =>
      call(
          user: _fn(
              _instance.user.map((e) => CopyWith$Query$getUserByFirebaseId$user(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getUserByFirebaseId<TRes>
    implements CopyWith$Query$getUserByFirebaseId<TRes> {
  _CopyWithStubImpl$Query$getUserByFirebaseId(this._res);

  TRes _res;

  call({
    List<Query$getUserByFirebaseId$user>? user,
    String? $__typename,
  }) =>
      _res;
  user(_fn) => _res;
}

const documentNodeQuerygetUserByFirebaseId = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getUserByFirebaseId'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'firebase_id')),
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
        name: NameNode(value: 'user'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'firebase_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'firebase_id')),
                  )
                ]),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: 'limit'),
            value: IntValueNode(value: '1'),
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
            name: NameNode(value: 'firebase_id'),
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
            name: NameNode(value: 'deleted'),
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
Query$getUserByFirebaseId _parserFn$Query$getUserByFirebaseId(
        Map<String, dynamic> data) =>
    Query$getUserByFirebaseId.fromJson(data);

class Options$Query$getUserByFirebaseId
    extends graphql.QueryOptions<Query$getUserByFirebaseId> {
  Options$Query$getUserByFirebaseId({
    String? operationName,
    required Variables$Query$getUserByFirebaseId variables,
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
          document: documentNodeQuerygetUserByFirebaseId,
          parserFn: _parserFn$Query$getUserByFirebaseId,
        );
}

class WatchOptions$Query$getUserByFirebaseId
    extends graphql.WatchQueryOptions<Query$getUserByFirebaseId> {
  WatchOptions$Query$getUserByFirebaseId({
    String? operationName,
    required Variables$Query$getUserByFirebaseId variables,
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
          document: documentNodeQuerygetUserByFirebaseId,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getUserByFirebaseId,
        );
}

class FetchMoreOptions$Query$getUserByFirebaseId
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getUserByFirebaseId({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getUserByFirebaseId variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetUserByFirebaseId,
        );
}

extension ClientExtension$Query$getUserByFirebaseId on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getUserByFirebaseId>>
      query$getUserByFirebaseId(
              Options$Query$getUserByFirebaseId options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getUserByFirebaseId>
      watchQuery$getUserByFirebaseId(
              WatchOptions$Query$getUserByFirebaseId options) =>
          this.watchQuery(options);
  void writeQuery$getUserByFirebaseId({
    required Query$getUserByFirebaseId data,
    required Variables$Query$getUserByFirebaseId variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerygetUserByFirebaseId),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getUserByFirebaseId? readQuery$getUserByFirebaseId({
    required Variables$Query$getUserByFirebaseId variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetUserByFirebaseId),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getUserByFirebaseId.fromJson(result);
  }
}

class Query$getUserByFirebaseId$user {
  Query$getUserByFirebaseId$user({
    required this.id,
    required this.firebase_id,
    this.name,
    this.image,
    this.email,
    this.phone,
    required this.language_id,
    required this.deleted,
    required this.$__typename,
  });

  factory Query$getUserByFirebaseId$user.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$firebase_id = json['firebase_id'];
    final l$name = json['name'];
    final l$image = json['image'];
    final l$email = json['email'];
    final l$phone = json['phone'];
    final l$language_id = json['language_id'];
    final l$deleted = json['deleted'];
    final l$$__typename = json['__typename'];
    return Query$getUserByFirebaseId$user(
      id: (l$id as int),
      firebase_id: (l$firebase_id as String),
      name: (l$name as String?),
      image: (l$image as String?),
      email: (l$email as String?),
      phone: (l$phone as String?),
      language_id: (l$language_id as String),
      deleted: (l$deleted as bool),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String firebase_id;

  final String? name;

  final String? image;

  final String? email;

  final String? phone;

  final String language_id;

  final bool deleted;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$firebase_id = firebase_id;
    _resultData['firebase_id'] = l$firebase_id;
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
    final l$deleted = deleted;
    _resultData['deleted'] = l$deleted;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$firebase_id = firebase_id;
    final l$name = name;
    final l$image = image;
    final l$email = email;
    final l$phone = phone;
    final l$language_id = language_id;
    final l$deleted = deleted;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$firebase_id,
      l$name,
      l$image,
      l$email,
      l$phone,
      l$language_id,
      l$deleted,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getUserByFirebaseId$user) ||
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
    final l$deleted = deleted;
    final lOther$deleted = other.deleted;
    if (l$deleted != lOther$deleted) {
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

extension UtilityExtension$Query$getUserByFirebaseId$user
    on Query$getUserByFirebaseId$user {
  CopyWith$Query$getUserByFirebaseId$user<Query$getUserByFirebaseId$user>
      get copyWith => CopyWith$Query$getUserByFirebaseId$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getUserByFirebaseId$user<TRes> {
  factory CopyWith$Query$getUserByFirebaseId$user(
    Query$getUserByFirebaseId$user instance,
    TRes Function(Query$getUserByFirebaseId$user) then,
  ) = _CopyWithImpl$Query$getUserByFirebaseId$user;

  factory CopyWith$Query$getUserByFirebaseId$user.stub(TRes res) =
      _CopyWithStubImpl$Query$getUserByFirebaseId$user;

  TRes call({
    int? id,
    String? firebase_id,
    String? name,
    String? image,
    String? email,
    String? phone,
    String? language_id,
    bool? deleted,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getUserByFirebaseId$user<TRes>
    implements CopyWith$Query$getUserByFirebaseId$user<TRes> {
  _CopyWithImpl$Query$getUserByFirebaseId$user(
    this._instance,
    this._then,
  );

  final Query$getUserByFirebaseId$user _instance;

  final TRes Function(Query$getUserByFirebaseId$user) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? firebase_id = _undefined,
    Object? name = _undefined,
    Object? image = _undefined,
    Object? email = _undefined,
    Object? phone = _undefined,
    Object? language_id = _undefined,
    Object? deleted = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getUserByFirebaseId$user(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        firebase_id: firebase_id == _undefined || firebase_id == null
            ? _instance.firebase_id
            : (firebase_id as String),
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        email: email == _undefined ? _instance.email : (email as String?),
        phone: phone == _undefined ? _instance.phone : (phone as String?),
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        deleted: deleted == _undefined || deleted == null
            ? _instance.deleted
            : (deleted as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getUserByFirebaseId$user<TRes>
    implements CopyWith$Query$getUserByFirebaseId$user<TRes> {
  _CopyWithStubImpl$Query$getUserByFirebaseId$user(this._res);

  TRes _res;

  call({
    int? id,
    String? firebase_id,
    String? name,
    String? image,
    String? email,
    String? phone,
    String? language_id,
    bool? deleted,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getUserById {
  factory Variables$Query$getUserById({required int id}) =>
      Variables$Query$getUserById._({
        r'id': id,
      });

  Variables$Query$getUserById._(this._$data);

  factory Variables$Query$getUserById.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    return Variables$Query$getUserById._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$getUserById<Variables$Query$getUserById>
      get copyWith => CopyWith$Variables$Query$getUserById(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getUserById) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Query$getUserById<TRes> {
  factory CopyWith$Variables$Query$getUserById(
    Variables$Query$getUserById instance,
    TRes Function(Variables$Query$getUserById) then,
  ) = _CopyWithImpl$Variables$Query$getUserById;

  factory CopyWith$Variables$Query$getUserById.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getUserById;

  TRes call({int? id});
}

class _CopyWithImpl$Variables$Query$getUserById<TRes>
    implements CopyWith$Variables$Query$getUserById<TRes> {
  _CopyWithImpl$Variables$Query$getUserById(
    this._instance,
    this._then,
  );

  final Variables$Query$getUserById _instance;

  final TRes Function(Variables$Query$getUserById) _then;

  static const _undefined = {};

  TRes call({Object? id = _undefined}) => _then(Variables$Query$getUserById._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getUserById<TRes>
    implements CopyWith$Variables$Query$getUserById<TRes> {
  _CopyWithStubImpl$Variables$Query$getUserById(this._res);

  TRes _res;

  call({int? id}) => _res;
}

class Query$getUserById {
  Query$getUserById({
    this.user_by_pk,
    required this.$__typename,
  });

  factory Query$getUserById.fromJson(Map<String, dynamic> json) {
    final l$user_by_pk = json['user_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$getUserById(
      user_by_pk: l$user_by_pk == null
          ? null
          : Query$getUserById$user_by_pk.fromJson(
              (l$user_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getUserById$user_by_pk? user_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user_by_pk = user_by_pk;
    _resultData['user_by_pk'] = l$user_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$user_by_pk = user_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getUserById) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$user_by_pk = user_by_pk;
    final lOther$user_by_pk = other.user_by_pk;
    if (l$user_by_pk != lOther$user_by_pk) {
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

extension UtilityExtension$Query$getUserById on Query$getUserById {
  CopyWith$Query$getUserById<Query$getUserById> get copyWith =>
      CopyWith$Query$getUserById(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getUserById<TRes> {
  factory CopyWith$Query$getUserById(
    Query$getUserById instance,
    TRes Function(Query$getUserById) then,
  ) = _CopyWithImpl$Query$getUserById;

  factory CopyWith$Query$getUserById.stub(TRes res) =
      _CopyWithStubImpl$Query$getUserById;

  TRes call({
    Query$getUserById$user_by_pk? user_by_pk,
    String? $__typename,
  });
  CopyWith$Query$getUserById$user_by_pk<TRes> get user_by_pk;
}

class _CopyWithImpl$Query$getUserById<TRes>
    implements CopyWith$Query$getUserById<TRes> {
  _CopyWithImpl$Query$getUserById(
    this._instance,
    this._then,
  );

  final Query$getUserById _instance;

  final TRes Function(Query$getUserById) _then;

  static const _undefined = {};

  TRes call({
    Object? user_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getUserById(
        user_by_pk: user_by_pk == _undefined
            ? _instance.user_by_pk
            : (user_by_pk as Query$getUserById$user_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getUserById$user_by_pk<TRes> get user_by_pk {
    final local$user_by_pk = _instance.user_by_pk;
    return local$user_by_pk == null
        ? CopyWith$Query$getUserById$user_by_pk.stub(_then(_instance))
        : CopyWith$Query$getUserById$user_by_pk(
            local$user_by_pk, (e) => call(user_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$getUserById<TRes>
    implements CopyWith$Query$getUserById<TRes> {
  _CopyWithStubImpl$Query$getUserById(this._res);

  TRes _res;

  call({
    Query$getUserById$user_by_pk? user_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getUserById$user_by_pk<TRes> get user_by_pk =>
      CopyWith$Query$getUserById$user_by_pk.stub(_res);
}

const documentNodeQuerygetUserById = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getUserById'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
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
        name: NameNode(value: 'user_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'deleted'),
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
      
    ]),
  ),
]);
Query$getUserById _parserFn$Query$getUserById(Map<String, dynamic> data) =>
    Query$getUserById.fromJson(data);

class Options$Query$getUserById
    extends graphql.QueryOptions<Query$getUserById> {
  Options$Query$getUserById({
    String? operationName,
    required Variables$Query$getUserById variables,
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
          document: documentNodeQuerygetUserById,
          parserFn: _parserFn$Query$getUserById,
        );
}

class WatchOptions$Query$getUserById
    extends graphql.WatchQueryOptions<Query$getUserById> {
  WatchOptions$Query$getUserById({
    String? operationName,
    required Variables$Query$getUserById variables,
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
          document: documentNodeQuerygetUserById,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getUserById,
        );
}

class FetchMoreOptions$Query$getUserById extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getUserById({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getUserById variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetUserById,
        );
}

extension ClientExtension$Query$getUserById on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getUserById>> query$getUserById(
          Options$Query$getUserById options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$getUserById> watchQuery$getUserById(
          WatchOptions$Query$getUserById options) =>
      this.watchQuery(options);
  void writeQuery$getUserById({
    required Query$getUserById data,
    required Variables$Query$getUserById variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQuerygetUserById),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getUserById? readQuery$getUserById({
    required Variables$Query$getUserById variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQuerygetUserById),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getUserById.fromJson(result);
  }
}

class Query$getUserById$user_by_pk {
  Query$getUserById$user_by_pk({
    required this.deleted,
    required this.firebase_id,
    this.name,
    this.image,
    this.email,
    this.phone,
    required this.language_id,
    required this.$__typename,
  });

  factory Query$getUserById$user_by_pk.fromJson(Map<String, dynamic> json) {
    final l$deleted = json['deleted'];
    final l$firebase_id = json['firebase_id'];
    final l$name = json['name'];
    final l$image = json['image'];
    final l$email = json['email'];
    final l$phone = json['phone'];
    final l$language_id = json['language_id'];
    final l$$__typename = json['__typename'];
    return Query$getUserById$user_by_pk(
      deleted: (l$deleted as bool),
      firebase_id: (l$firebase_id as String),
      name: (l$name as String?),
      image: (l$image as String?),
      email: (l$email as String?),
      phone: (l$phone as String?),
      language_id: (l$language_id as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final bool deleted;

  final String firebase_id;

  final String? name;

  final String? image;

  final String? email;

  final String? phone;

  final String language_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleted = deleted;
    _resultData['deleted'] = l$deleted;
    final l$firebase_id = firebase_id;
    _resultData['firebase_id'] = l$firebase_id;
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
    final l$deleted = deleted;
    final l$firebase_id = firebase_id;
    final l$name = name;
    final l$image = image;
    final l$email = email;
    final l$phone = phone;
    final l$language_id = language_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$deleted,
      l$firebase_id,
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
    if (!(other is Query$getUserById$user_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleted = deleted;
    final lOther$deleted = other.deleted;
    if (l$deleted != lOther$deleted) {
      return false;
    }
    final l$firebase_id = firebase_id;
    final lOther$firebase_id = other.firebase_id;
    if (l$firebase_id != lOther$firebase_id) {
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

extension UtilityExtension$Query$getUserById$user_by_pk
    on Query$getUserById$user_by_pk {
  CopyWith$Query$getUserById$user_by_pk<Query$getUserById$user_by_pk>
      get copyWith => CopyWith$Query$getUserById$user_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getUserById$user_by_pk<TRes> {
  factory CopyWith$Query$getUserById$user_by_pk(
    Query$getUserById$user_by_pk instance,
    TRes Function(Query$getUserById$user_by_pk) then,
  ) = _CopyWithImpl$Query$getUserById$user_by_pk;

  factory CopyWith$Query$getUserById$user_by_pk.stub(TRes res) =
      _CopyWithStubImpl$Query$getUserById$user_by_pk;

  TRes call({
    bool? deleted,
    String? firebase_id,
    String? name,
    String? image,
    String? email,
    String? phone,
    String? language_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getUserById$user_by_pk<TRes>
    implements CopyWith$Query$getUserById$user_by_pk<TRes> {
  _CopyWithImpl$Query$getUserById$user_by_pk(
    this._instance,
    this._then,
  );

  final Query$getUserById$user_by_pk _instance;

  final TRes Function(Query$getUserById$user_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? deleted = _undefined,
    Object? firebase_id = _undefined,
    Object? name = _undefined,
    Object? image = _undefined,
    Object? email = _undefined,
    Object? phone = _undefined,
    Object? language_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getUserById$user_by_pk(
        deleted: deleted == _undefined || deleted == null
            ? _instance.deleted
            : (deleted as bool),
        firebase_id: firebase_id == _undefined || firebase_id == null
            ? _instance.firebase_id
            : (firebase_id as String),
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

class _CopyWithStubImpl$Query$getUserById$user_by_pk<TRes>
    implements CopyWith$Query$getUserById$user_by_pk<TRes> {
  _CopyWithStubImpl$Query$getUserById$user_by_pk(this._res);

  TRes _res;

  call({
    bool? deleted,
    String? firebase_id,
    String? name,
    String? image,
    String? email,
    String? phone,
    String? language_id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$changeUserImg {
  factory Variables$Mutation$changeUserImg({
    required Input$user_pk_columns_input id,
    required String img,
  }) =>
      Variables$Mutation$changeUserImg._({
        r'id': id,
        r'img': img,
      });

  Variables$Mutation$changeUserImg._(this._$data);

  factory Variables$Mutation$changeUserImg.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] =
        Input$user_pk_columns_input.fromJson((l$id as Map<String, dynamic>));
    final l$img = data['img'];
    result$data['img'] = (l$img as String);
    return Variables$Mutation$changeUserImg._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$user_pk_columns_input get id =>
      (_$data['id'] as Input$user_pk_columns_input);
  String get img => (_$data['img'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id.toJson();
    final l$img = img;
    result$data['img'] = l$img;
    return result$data;
  }

  CopyWith$Variables$Mutation$changeUserImg<Variables$Mutation$changeUserImg>
      get copyWith => CopyWith$Variables$Mutation$changeUserImg(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$changeUserImg) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$img = img;
    final lOther$img = other.img;
    if (l$img != lOther$img) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$img = img;
    return Object.hashAll([
      l$id,
      l$img,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$changeUserImg<TRes> {
  factory CopyWith$Variables$Mutation$changeUserImg(
    Variables$Mutation$changeUserImg instance,
    TRes Function(Variables$Mutation$changeUserImg) then,
  ) = _CopyWithImpl$Variables$Mutation$changeUserImg;

  factory CopyWith$Variables$Mutation$changeUserImg.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$changeUserImg;

  TRes call({
    Input$user_pk_columns_input? id,
    String? img,
  });
}

class _CopyWithImpl$Variables$Mutation$changeUserImg<TRes>
    implements CopyWith$Variables$Mutation$changeUserImg<TRes> {
  _CopyWithImpl$Variables$Mutation$changeUserImg(
    this._instance,
    this._then,
  );

  final Variables$Mutation$changeUserImg _instance;

  final TRes Function(Variables$Mutation$changeUserImg) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? img = _undefined,
  }) =>
      _then(Variables$Mutation$changeUserImg._({
        ..._instance._$data,
        if (id != _undefined && id != null)
          'id': (id as Input$user_pk_columns_input),
        if (img != _undefined && img != null) 'img': (img as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$changeUserImg<TRes>
    implements CopyWith$Variables$Mutation$changeUserImg<TRes> {
  _CopyWithStubImpl$Variables$Mutation$changeUserImg(this._res);

  TRes _res;

  call({
    Input$user_pk_columns_input? id,
    String? img,
  }) =>
      _res;
}

class Mutation$changeUserImg {
  Mutation$changeUserImg({
    this.update_user_by_pk,
    required this.$__typename,
  });

  factory Mutation$changeUserImg.fromJson(Map<String, dynamic> json) {
    final l$update_user_by_pk = json['update_user_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$changeUserImg(
      update_user_by_pk: l$update_user_by_pk == null
          ? null
          : Mutation$changeUserImg$update_user_by_pk.fromJson(
              (l$update_user_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$changeUserImg$update_user_by_pk? update_user_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_user_by_pk = update_user_by_pk;
    _resultData['update_user_by_pk'] = l$update_user_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_user_by_pk = update_user_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_user_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$changeUserImg) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_user_by_pk = update_user_by_pk;
    final lOther$update_user_by_pk = other.update_user_by_pk;
    if (l$update_user_by_pk != lOther$update_user_by_pk) {
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

extension UtilityExtension$Mutation$changeUserImg on Mutation$changeUserImg {
  CopyWith$Mutation$changeUserImg<Mutation$changeUserImg> get copyWith =>
      CopyWith$Mutation$changeUserImg(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$changeUserImg<TRes> {
  factory CopyWith$Mutation$changeUserImg(
    Mutation$changeUserImg instance,
    TRes Function(Mutation$changeUserImg) then,
  ) = _CopyWithImpl$Mutation$changeUserImg;

  factory CopyWith$Mutation$changeUserImg.stub(TRes res) =
      _CopyWithStubImpl$Mutation$changeUserImg;

  TRes call({
    Mutation$changeUserImg$update_user_by_pk? update_user_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$changeUserImg$update_user_by_pk<TRes> get update_user_by_pk;
}

class _CopyWithImpl$Mutation$changeUserImg<TRes>
    implements CopyWith$Mutation$changeUserImg<TRes> {
  _CopyWithImpl$Mutation$changeUserImg(
    this._instance,
    this._then,
  );

  final Mutation$changeUserImg _instance;

  final TRes Function(Mutation$changeUserImg) _then;

  static const _undefined = {};

  TRes call({
    Object? update_user_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$changeUserImg(
        update_user_by_pk: update_user_by_pk == _undefined
            ? _instance.update_user_by_pk
            : (update_user_by_pk as Mutation$changeUserImg$update_user_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$changeUserImg$update_user_by_pk<TRes>
      get update_user_by_pk {
    final local$update_user_by_pk = _instance.update_user_by_pk;
    return local$update_user_by_pk == null
        ? CopyWith$Mutation$changeUserImg$update_user_by_pk.stub(
            _then(_instance))
        : CopyWith$Mutation$changeUserImg$update_user_by_pk(
            local$update_user_by_pk, (e) => call(update_user_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$changeUserImg<TRes>
    implements CopyWith$Mutation$changeUserImg<TRes> {
  _CopyWithStubImpl$Mutation$changeUserImg(this._res);

  TRes _res;

  call({
    Mutation$changeUserImg$update_user_by_pk? update_user_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$changeUserImg$update_user_by_pk<TRes>
      get update_user_by_pk =>
          CopyWith$Mutation$changeUserImg$update_user_by_pk.stub(_res);
}

const documentNodeMutationchangeUserImg = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'changeUserImg'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'user_pk_columns_input'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'img')),
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
        name: NameNode(value: 'update_user_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'pk_columns'),
            value: VariableNode(name: NameNode(value: 'id')),
          ),
          ArgumentNode(
            name: NameNode(value: '_set'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'image'),
                value: VariableNode(name: NameNode(value: 'img')),
              )
            ]),
          ),
        ],
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
Mutation$changeUserImg _parserFn$Mutation$changeUserImg(
        Map<String, dynamic> data) =>
    Mutation$changeUserImg.fromJson(data);
typedef OnMutationCompleted$Mutation$changeUserImg = FutureOr<void> Function(
  dynamic,
  Mutation$changeUserImg?,
);

class Options$Mutation$changeUserImg
    extends graphql.MutationOptions<Mutation$changeUserImg> {
  Options$Mutation$changeUserImg({
    String? operationName,
    required Variables$Mutation$changeUserImg variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$changeUserImg? onCompleted,
    graphql.OnMutationUpdate<Mutation$changeUserImg>? update,
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
                        : _parserFn$Mutation$changeUserImg(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationchangeUserImg,
          parserFn: _parserFn$Mutation$changeUserImg,
        );

  final OnMutationCompleted$Mutation$changeUserImg? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$changeUserImg
    extends graphql.WatchQueryOptions<Mutation$changeUserImg> {
  WatchOptions$Mutation$changeUserImg({
    String? operationName,
    required Variables$Mutation$changeUserImg variables,
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
          document: documentNodeMutationchangeUserImg,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$changeUserImg,
        );
}

extension ClientExtension$Mutation$changeUserImg on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$changeUserImg>> mutate$changeUserImg(
          Options$Mutation$changeUserImg options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$changeUserImg> watchMutation$changeUserImg(
          WatchOptions$Mutation$changeUserImg options) =>
      this.watchMutation(options);
}

class Mutation$changeUserImg$update_user_by_pk {
  Mutation$changeUserImg$update_user_by_pk({
    this.image,
    required this.$__typename,
  });

  factory Mutation$changeUserImg$update_user_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Mutation$changeUserImg$update_user_by_pk(
      image: (l$image as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$image = image;
    _resultData['image'] = l$image;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$image,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$changeUserImg$update_user_by_pk) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Mutation$changeUserImg$update_user_by_pk
    on Mutation$changeUserImg$update_user_by_pk {
  CopyWith$Mutation$changeUserImg$update_user_by_pk<
          Mutation$changeUserImg$update_user_by_pk>
      get copyWith => CopyWith$Mutation$changeUserImg$update_user_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$changeUserImg$update_user_by_pk<TRes> {
  factory CopyWith$Mutation$changeUserImg$update_user_by_pk(
    Mutation$changeUserImg$update_user_by_pk instance,
    TRes Function(Mutation$changeUserImg$update_user_by_pk) then,
  ) = _CopyWithImpl$Mutation$changeUserImg$update_user_by_pk;

  factory CopyWith$Mutation$changeUserImg$update_user_by_pk.stub(TRes res) =
      _CopyWithStubImpl$Mutation$changeUserImg$update_user_by_pk;

  TRes call({
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$changeUserImg$update_user_by_pk<TRes>
    implements CopyWith$Mutation$changeUserImg$update_user_by_pk<TRes> {
  _CopyWithImpl$Mutation$changeUserImg$update_user_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$changeUserImg$update_user_by_pk _instance;

  final TRes Function(Mutation$changeUserImg$update_user_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$changeUserImg$update_user_by_pk(
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$changeUserImg$update_user_by_pk<TRes>
    implements CopyWith$Mutation$changeUserImg$update_user_by_pk<TRes> {
  _CopyWithStubImpl$Mutation$changeUserImg$update_user_by_pk(this._res);

  TRes _res;

  call({
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$changeUserName {
  factory Variables$Mutation$changeUserName({
    required Input$user_pk_columns_input id,
    required String name,
  }) =>
      Variables$Mutation$changeUserName._({
        r'id': id,
        r'name': name,
      });

  Variables$Mutation$changeUserName._(this._$data);

  factory Variables$Mutation$changeUserName.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] =
        Input$user_pk_columns_input.fromJson((l$id as Map<String, dynamic>));
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    return Variables$Mutation$changeUserName._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$user_pk_columns_input get id =>
      (_$data['id'] as Input$user_pk_columns_input);
  String get name => (_$data['name'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id.toJson();
    final l$name = name;
    result$data['name'] = l$name;
    return result$data;
  }

  CopyWith$Variables$Mutation$changeUserName<Variables$Mutation$changeUserName>
      get copyWith => CopyWith$Variables$Mutation$changeUserName(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$changeUserName) ||
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
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    return Object.hashAll([
      l$id,
      l$name,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$changeUserName<TRes> {
  factory CopyWith$Variables$Mutation$changeUserName(
    Variables$Mutation$changeUserName instance,
    TRes Function(Variables$Mutation$changeUserName) then,
  ) = _CopyWithImpl$Variables$Mutation$changeUserName;

  factory CopyWith$Variables$Mutation$changeUserName.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$changeUserName;

  TRes call({
    Input$user_pk_columns_input? id,
    String? name,
  });
}

class _CopyWithImpl$Variables$Mutation$changeUserName<TRes>
    implements CopyWith$Variables$Mutation$changeUserName<TRes> {
  _CopyWithImpl$Variables$Mutation$changeUserName(
    this._instance,
    this._then,
  );

  final Variables$Mutation$changeUserName _instance;

  final TRes Function(Variables$Mutation$changeUserName) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
  }) =>
      _then(Variables$Mutation$changeUserName._({
        ..._instance._$data,
        if (id != _undefined && id != null)
          'id': (id as Input$user_pk_columns_input),
        if (name != _undefined && name != null) 'name': (name as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$changeUserName<TRes>
    implements CopyWith$Variables$Mutation$changeUserName<TRes> {
  _CopyWithStubImpl$Variables$Mutation$changeUserName(this._res);

  TRes _res;

  call({
    Input$user_pk_columns_input? id,
    String? name,
  }) =>
      _res;
}

class Mutation$changeUserName {
  Mutation$changeUserName({
    this.update_user_by_pk,
    required this.$__typename,
  });

  factory Mutation$changeUserName.fromJson(Map<String, dynamic> json) {
    final l$update_user_by_pk = json['update_user_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$changeUserName(
      update_user_by_pk: l$update_user_by_pk == null
          ? null
          : Mutation$changeUserName$update_user_by_pk.fromJson(
              (l$update_user_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$changeUserName$update_user_by_pk? update_user_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_user_by_pk = update_user_by_pk;
    _resultData['update_user_by_pk'] = l$update_user_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_user_by_pk = update_user_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_user_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$changeUserName) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_user_by_pk = update_user_by_pk;
    final lOther$update_user_by_pk = other.update_user_by_pk;
    if (l$update_user_by_pk != lOther$update_user_by_pk) {
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

extension UtilityExtension$Mutation$changeUserName on Mutation$changeUserName {
  CopyWith$Mutation$changeUserName<Mutation$changeUserName> get copyWith =>
      CopyWith$Mutation$changeUserName(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$changeUserName<TRes> {
  factory CopyWith$Mutation$changeUserName(
    Mutation$changeUserName instance,
    TRes Function(Mutation$changeUserName) then,
  ) = _CopyWithImpl$Mutation$changeUserName;

  factory CopyWith$Mutation$changeUserName.stub(TRes res) =
      _CopyWithStubImpl$Mutation$changeUserName;

  TRes call({
    Mutation$changeUserName$update_user_by_pk? update_user_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$changeUserName$update_user_by_pk<TRes>
      get update_user_by_pk;
}

class _CopyWithImpl$Mutation$changeUserName<TRes>
    implements CopyWith$Mutation$changeUserName<TRes> {
  _CopyWithImpl$Mutation$changeUserName(
    this._instance,
    this._then,
  );

  final Mutation$changeUserName _instance;

  final TRes Function(Mutation$changeUserName) _then;

  static const _undefined = {};

  TRes call({
    Object? update_user_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$changeUserName(
        update_user_by_pk: update_user_by_pk == _undefined
            ? _instance.update_user_by_pk
            : (update_user_by_pk as Mutation$changeUserName$update_user_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$changeUserName$update_user_by_pk<TRes>
      get update_user_by_pk {
    final local$update_user_by_pk = _instance.update_user_by_pk;
    return local$update_user_by_pk == null
        ? CopyWith$Mutation$changeUserName$update_user_by_pk.stub(
            _then(_instance))
        : CopyWith$Mutation$changeUserName$update_user_by_pk(
            local$update_user_by_pk, (e) => call(update_user_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$changeUserName<TRes>
    implements CopyWith$Mutation$changeUserName<TRes> {
  _CopyWithStubImpl$Mutation$changeUserName(this._res);

  TRes _res;

  call({
    Mutation$changeUserName$update_user_by_pk? update_user_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$changeUserName$update_user_by_pk<TRes>
      get update_user_by_pk =>
          CopyWith$Mutation$changeUserName$update_user_by_pk.stub(_res);
}

const documentNodeMutationchangeUserName = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'changeUserName'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'user_pk_columns_input'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'name')),
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
        name: NameNode(value: 'update_user_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'pk_columns'),
            value: VariableNode(name: NameNode(value: 'id')),
          ),
          ArgumentNode(
            name: NameNode(value: '_set'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'name'),
                value: VariableNode(name: NameNode(value: 'name')),
              )
            ]),
          ),
        ],
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
Mutation$changeUserName _parserFn$Mutation$changeUserName(
        Map<String, dynamic> data) =>
    Mutation$changeUserName.fromJson(data);
typedef OnMutationCompleted$Mutation$changeUserName = FutureOr<void> Function(
  dynamic,
  Mutation$changeUserName?,
);

class Options$Mutation$changeUserName
    extends graphql.MutationOptions<Mutation$changeUserName> {
  Options$Mutation$changeUserName({
    String? operationName,
    required Variables$Mutation$changeUserName variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$changeUserName? onCompleted,
    graphql.OnMutationUpdate<Mutation$changeUserName>? update,
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
                        : _parserFn$Mutation$changeUserName(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationchangeUserName,
          parserFn: _parserFn$Mutation$changeUserName,
        );

  final OnMutationCompleted$Mutation$changeUserName? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$changeUserName
    extends graphql.WatchQueryOptions<Mutation$changeUserName> {
  WatchOptions$Mutation$changeUserName({
    String? operationName,
    required Variables$Mutation$changeUserName variables,
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
          document: documentNodeMutationchangeUserName,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$changeUserName,
        );
}

extension ClientExtension$Mutation$changeUserName on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$changeUserName>> mutate$changeUserName(
          Options$Mutation$changeUserName options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$changeUserName> watchMutation$changeUserName(
          WatchOptions$Mutation$changeUserName options) =>
      this.watchMutation(options);
}

class Mutation$changeUserName$update_user_by_pk {
  Mutation$changeUserName$update_user_by_pk({
    this.name,
    required this.$__typename,
  });

  factory Mutation$changeUserName$update_user_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Mutation$changeUserName$update_user_by_pk(
      name: (l$name as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$changeUserName$update_user_by_pk) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Mutation$changeUserName$update_user_by_pk
    on Mutation$changeUserName$update_user_by_pk {
  CopyWith$Mutation$changeUserName$update_user_by_pk<
          Mutation$changeUserName$update_user_by_pk>
      get copyWith => CopyWith$Mutation$changeUserName$update_user_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$changeUserName$update_user_by_pk<TRes> {
  factory CopyWith$Mutation$changeUserName$update_user_by_pk(
    Mutation$changeUserName$update_user_by_pk instance,
    TRes Function(Mutation$changeUserName$update_user_by_pk) then,
  ) = _CopyWithImpl$Mutation$changeUserName$update_user_by_pk;

  factory CopyWith$Mutation$changeUserName$update_user_by_pk.stub(TRes res) =
      _CopyWithStubImpl$Mutation$changeUserName$update_user_by_pk;

  TRes call({
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$changeUserName$update_user_by_pk<TRes>
    implements CopyWith$Mutation$changeUserName$update_user_by_pk<TRes> {
  _CopyWithImpl$Mutation$changeUserName$update_user_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$changeUserName$update_user_by_pk _instance;

  final TRes Function(Mutation$changeUserName$update_user_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$changeUserName$update_user_by_pk(
        name: name == _undefined ? _instance.name : (name as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$changeUserName$update_user_by_pk<TRes>
    implements CopyWith$Mutation$changeUserName$update_user_by_pk<TRes> {
  _CopyWithStubImpl$Mutation$changeUserName$update_user_by_pk(this._res);

  TRes _res;

  call({
    String? name,
    String? $__typename,
  }) =>
      _res;
}
