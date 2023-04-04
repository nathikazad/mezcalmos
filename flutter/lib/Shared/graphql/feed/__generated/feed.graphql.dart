import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Variables$Mutation$subscribeRestaurant {
  factory Variables$Mutation$subscribeRestaurant({
    int? customer_id,
    int? service_provider_id,
  }) =>
      Variables$Mutation$subscribeRestaurant._({
        if (customer_id != null) r'customer_id': customer_id,
        if (service_provider_id != null)
          r'service_provider_id': service_provider_id,
      });

  Variables$Mutation$subscribeRestaurant._(this._$data);

  factory Variables$Mutation$subscribeRestaurant.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('customer_id')) {
      final l$customer_id = data['customer_id'];
      result$data['customer_id'] = (l$customer_id as int?);
    }
    if (data.containsKey('service_provider_id')) {
      final l$service_provider_id = data['service_provider_id'];
      result$data['service_provider_id'] = (l$service_provider_id as int?);
    }
    return Variables$Mutation$subscribeRestaurant._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get customer_id => (_$data['customer_id'] as int?);
  int? get service_provider_id => (_$data['service_provider_id'] as int?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('customer_id')) {
      final l$customer_id = customer_id;
      result$data['customer_id'] = l$customer_id;
    }
    if (_$data.containsKey('service_provider_id')) {
      final l$service_provider_id = service_provider_id;
      result$data['service_provider_id'] = l$service_provider_id;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$subscribeRestaurant<
          Variables$Mutation$subscribeRestaurant>
      get copyWith => CopyWith$Variables$Mutation$subscribeRestaurant(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$subscribeRestaurant) ||
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
    final l$service_provider_id = service_provider_id;
    final lOther$service_provider_id = other.service_provider_id;
    if (_$data.containsKey('service_provider_id') !=
        other._$data.containsKey('service_provider_id')) {
      return false;
    }
    if (l$service_provider_id != lOther$service_provider_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$customer_id = customer_id;
    final l$service_provider_id = service_provider_id;
    return Object.hashAll([
      _$data.containsKey('customer_id') ? l$customer_id : const {},
      _$data.containsKey('service_provider_id')
          ? l$service_provider_id
          : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$subscribeRestaurant<TRes> {
  factory CopyWith$Variables$Mutation$subscribeRestaurant(
    Variables$Mutation$subscribeRestaurant instance,
    TRes Function(Variables$Mutation$subscribeRestaurant) then,
  ) = _CopyWithImpl$Variables$Mutation$subscribeRestaurant;

  factory CopyWith$Variables$Mutation$subscribeRestaurant.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$subscribeRestaurant;

  TRes call({
    int? customer_id,
    int? service_provider_id,
  });
}

class _CopyWithImpl$Variables$Mutation$subscribeRestaurant<TRes>
    implements CopyWith$Variables$Mutation$subscribeRestaurant<TRes> {
  _CopyWithImpl$Variables$Mutation$subscribeRestaurant(
    this._instance,
    this._then,
  );

  final Variables$Mutation$subscribeRestaurant _instance;

  final TRes Function(Variables$Mutation$subscribeRestaurant) _then;

  static const _undefined = {};

  TRes call({
    Object? customer_id = _undefined,
    Object? service_provider_id = _undefined,
  }) =>
      _then(Variables$Mutation$subscribeRestaurant._({
        ..._instance._$data,
        if (customer_id != _undefined) 'customer_id': (customer_id as int?),
        if (service_provider_id != _undefined)
          'service_provider_id': (service_provider_id as int?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$subscribeRestaurant<TRes>
    implements CopyWith$Variables$Mutation$subscribeRestaurant<TRes> {
  _CopyWithStubImpl$Variables$Mutation$subscribeRestaurant(this._res);

  TRes _res;

  call({
    int? customer_id,
    int? service_provider_id,
  }) =>
      _res;
}

class Mutation$subscribeRestaurant {
  Mutation$subscribeRestaurant({
    this.insert_service_provider_subscriber_one,
    required this.$__typename,
  });

  factory Mutation$subscribeRestaurant.fromJson(Map<String, dynamic> json) {
    final l$insert_service_provider_subscriber_one =
        json['insert_service_provider_subscriber_one'];
    final l$$__typename = json['__typename'];
    return Mutation$subscribeRestaurant(
      insert_service_provider_subscriber_one:
          l$insert_service_provider_subscriber_one == null
              ? null
              : Mutation$subscribeRestaurant$insert_service_provider_subscriber_one
                  .fromJson((l$insert_service_provider_subscriber_one
                      as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$subscribeRestaurant$insert_service_provider_subscriber_one?
      insert_service_provider_subscriber_one;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insert_service_provider_subscriber_one =
        insert_service_provider_subscriber_one;
    _resultData['insert_service_provider_subscriber_one'] =
        l$insert_service_provider_subscriber_one?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insert_service_provider_subscriber_one =
        insert_service_provider_subscriber_one;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$insert_service_provider_subscriber_one,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$subscribeRestaurant) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$insert_service_provider_subscriber_one =
        insert_service_provider_subscriber_one;
    final lOther$insert_service_provider_subscriber_one =
        other.insert_service_provider_subscriber_one;
    if (l$insert_service_provider_subscriber_one !=
        lOther$insert_service_provider_subscriber_one) {
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

extension UtilityExtension$Mutation$subscribeRestaurant
    on Mutation$subscribeRestaurant {
  CopyWith$Mutation$subscribeRestaurant<Mutation$subscribeRestaurant>
      get copyWith => CopyWith$Mutation$subscribeRestaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$subscribeRestaurant<TRes> {
  factory CopyWith$Mutation$subscribeRestaurant(
    Mutation$subscribeRestaurant instance,
    TRes Function(Mutation$subscribeRestaurant) then,
  ) = _CopyWithImpl$Mutation$subscribeRestaurant;

  factory CopyWith$Mutation$subscribeRestaurant.stub(TRes res) =
      _CopyWithStubImpl$Mutation$subscribeRestaurant;

  TRes call({
    Mutation$subscribeRestaurant$insert_service_provider_subscriber_one?
        insert_service_provider_subscriber_one,
    String? $__typename,
  });
  CopyWith$Mutation$subscribeRestaurant$insert_service_provider_subscriber_one<
      TRes> get insert_service_provider_subscriber_one;
}

class _CopyWithImpl$Mutation$subscribeRestaurant<TRes>
    implements CopyWith$Mutation$subscribeRestaurant<TRes> {
  _CopyWithImpl$Mutation$subscribeRestaurant(
    this._instance,
    this._then,
  );

  final Mutation$subscribeRestaurant _instance;

  final TRes Function(Mutation$subscribeRestaurant) _then;

  static const _undefined = {};

  TRes call({
    Object? insert_service_provider_subscriber_one = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$subscribeRestaurant(
        insert_service_provider_subscriber_one:
            insert_service_provider_subscriber_one == _undefined
                ? _instance.insert_service_provider_subscriber_one
                : (insert_service_provider_subscriber_one
                    as Mutation$subscribeRestaurant$insert_service_provider_subscriber_one?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$subscribeRestaurant$insert_service_provider_subscriber_one<
      TRes> get insert_service_provider_subscriber_one {
    final local$insert_service_provider_subscriber_one =
        _instance.insert_service_provider_subscriber_one;
    return local$insert_service_provider_subscriber_one == null
        ? CopyWith$Mutation$subscribeRestaurant$insert_service_provider_subscriber_one
            .stub(_then(_instance))
        : CopyWith$Mutation$subscribeRestaurant$insert_service_provider_subscriber_one(
            local$insert_service_provider_subscriber_one,
            (e) => call(insert_service_provider_subscriber_one: e));
  }
}

class _CopyWithStubImpl$Mutation$subscribeRestaurant<TRes>
    implements CopyWith$Mutation$subscribeRestaurant<TRes> {
  _CopyWithStubImpl$Mutation$subscribeRestaurant(this._res);

  TRes _res;

  call({
    Mutation$subscribeRestaurant$insert_service_provider_subscriber_one?
        insert_service_provider_subscriber_one,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$subscribeRestaurant$insert_service_provider_subscriber_one<
          TRes>
      get insert_service_provider_subscriber_one =>
          CopyWith$Mutation$subscribeRestaurant$insert_service_provider_subscriber_one
              .stub(_res);
}

const documentNodeMutationsubscribeRestaurant = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'subscribeRestaurant'),
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
        variable: VariableNode(name: NameNode(value: 'service_provider_id')),
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
        name: NameNode(value: 'insert_service_provider_subscriber_one'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'object'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'customer_id'),
                value: VariableNode(name: NameNode(value: 'customer_id')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'service_provider_id'),
                value:
                    VariableNode(name: NameNode(value: 'service_provider_id')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'service_provider_type'),
                value: StringValueNode(
                  value: 'restaurant',
                  isBlock: false,
                ),
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
Mutation$subscribeRestaurant _parserFn$Mutation$subscribeRestaurant(
        Map<String, dynamic> data) =>
    Mutation$subscribeRestaurant.fromJson(data);
typedef OnMutationCompleted$Mutation$subscribeRestaurant = FutureOr<void>
    Function(
  dynamic,
  Mutation$subscribeRestaurant?,
);

class Options$Mutation$subscribeRestaurant
    extends graphql.MutationOptions<Mutation$subscribeRestaurant> {
  Options$Mutation$subscribeRestaurant({
    String? operationName,
    Variables$Mutation$subscribeRestaurant? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$subscribeRestaurant? onCompleted,
    graphql.OnMutationUpdate<Mutation$subscribeRestaurant>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables?.toJson() ?? {},
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
                        : _parserFn$Mutation$subscribeRestaurant(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationsubscribeRestaurant,
          parserFn: _parserFn$Mutation$subscribeRestaurant,
        );

  final OnMutationCompleted$Mutation$subscribeRestaurant? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$subscribeRestaurant
    extends graphql.WatchQueryOptions<Mutation$subscribeRestaurant> {
  WatchOptions$Mutation$subscribeRestaurant({
    String? operationName,
    Variables$Mutation$subscribeRestaurant? variables,
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
          document: documentNodeMutationsubscribeRestaurant,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$subscribeRestaurant,
        );
}

extension ClientExtension$Mutation$subscribeRestaurant
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$subscribeRestaurant>>
      mutate$subscribeRestaurant(
              [Options$Mutation$subscribeRestaurant? options]) async =>
          await this.mutate(options ?? Options$Mutation$subscribeRestaurant());
  graphql.ObservableQuery<Mutation$subscribeRestaurant>
      watchMutation$subscribeRestaurant(
              [WatchOptions$Mutation$subscribeRestaurant? options]) =>
          this.watchMutation(
              options ?? WatchOptions$Mutation$subscribeRestaurant());
}

class Mutation$subscribeRestaurant$insert_service_provider_subscriber_one {
  Mutation$subscribeRestaurant$insert_service_provider_subscriber_one({
    required this.id,
    required this.$__typename,
  });

  factory Mutation$subscribeRestaurant$insert_service_provider_subscriber_one.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$subscribeRestaurant$insert_service_provider_subscriber_one(
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
            is Mutation$subscribeRestaurant$insert_service_provider_subscriber_one) ||
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

extension UtilityExtension$Mutation$subscribeRestaurant$insert_service_provider_subscriber_one
    on Mutation$subscribeRestaurant$insert_service_provider_subscriber_one {
  CopyWith$Mutation$subscribeRestaurant$insert_service_provider_subscriber_one<
          Mutation$subscribeRestaurant$insert_service_provider_subscriber_one>
      get copyWith =>
          CopyWith$Mutation$subscribeRestaurant$insert_service_provider_subscriber_one(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$subscribeRestaurant$insert_service_provider_subscriber_one<
    TRes> {
  factory CopyWith$Mutation$subscribeRestaurant$insert_service_provider_subscriber_one(
    Mutation$subscribeRestaurant$insert_service_provider_subscriber_one
        instance,
    TRes Function(
            Mutation$subscribeRestaurant$insert_service_provider_subscriber_one)
        then,
  ) = _CopyWithImpl$Mutation$subscribeRestaurant$insert_service_provider_subscriber_one;

  factory CopyWith$Mutation$subscribeRestaurant$insert_service_provider_subscriber_one.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$subscribeRestaurant$insert_service_provider_subscriber_one;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$subscribeRestaurant$insert_service_provider_subscriber_one<
        TRes>
    implements
        CopyWith$Mutation$subscribeRestaurant$insert_service_provider_subscriber_one<
            TRes> {
  _CopyWithImpl$Mutation$subscribeRestaurant$insert_service_provider_subscriber_one(
    this._instance,
    this._then,
  );

  final Mutation$subscribeRestaurant$insert_service_provider_subscriber_one
      _instance;

  final TRes Function(
          Mutation$subscribeRestaurant$insert_service_provider_subscriber_one)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$subscribeRestaurant$insert_service_provider_subscriber_one(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$subscribeRestaurant$insert_service_provider_subscriber_one<
        TRes>
    implements
        CopyWith$Mutation$subscribeRestaurant$insert_service_provider_subscriber_one<
            TRes> {
  _CopyWithStubImpl$Mutation$subscribeRestaurant$insert_service_provider_subscriber_one(
      this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$writePost {
  factory Variables$Mutation$writePost({
    int? service_provider_id,
    String? message,
    String? image,
    dynamic? likes,
    dynamic? comments,
    String? link,
  }) =>
      Variables$Mutation$writePost._({
        if (service_provider_id != null)
          r'service_provider_id': service_provider_id,
        if (message != null) r'message': message,
        if (image != null) r'image': image,
        if (likes != null) r'likes': likes,
        if (comments != null) r'comments': comments,
        if (link != null) r'link': link,
      });

  Variables$Mutation$writePost._(this._$data);

  factory Variables$Mutation$writePost.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('service_provider_id')) {
      final l$service_provider_id = data['service_provider_id'];
      result$data['service_provider_id'] = (l$service_provider_id as int?);
    }
    if (data.containsKey('message')) {
      final l$message = data['message'];
      result$data['message'] = (l$message as String?);
    }
    if (data.containsKey('image')) {
      final l$image = data['image'];
      result$data['image'] = (l$image as String?);
    }
    if (data.containsKey('likes')) {
      final l$likes = data['likes'];
      result$data['likes'] = l$likes == null ? null : mapFromJson(l$likes);
    }
    if (data.containsKey('comments')) {
      final l$comments = data['comments'];
      result$data['comments'] =
          l$comments == null ? null : mapFromJson(l$comments);
    }
    if (data.containsKey('link')) {
      final l$link = data['link'];
      result$data['link'] = (l$link as String?);
    }
    return Variables$Mutation$writePost._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get service_provider_id => (_$data['service_provider_id'] as int?);
  String? get message => (_$data['message'] as String?);
  String? get image => (_$data['image'] as String?);
  dynamic? get likes => (_$data['likes'] as dynamic?);
  dynamic? get comments => (_$data['comments'] as dynamic?);
  String? get link => (_$data['link'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('service_provider_id')) {
      final l$service_provider_id = service_provider_id;
      result$data['service_provider_id'] = l$service_provider_id;
    }
    if (_$data.containsKey('message')) {
      final l$message = message;
      result$data['message'] = l$message;
    }
    if (_$data.containsKey('image')) {
      final l$image = image;
      result$data['image'] = l$image;
    }
    if (_$data.containsKey('likes')) {
      final l$likes = likes;
      result$data['likes'] = l$likes == null ? null : mapToJson(l$likes);
    }
    if (_$data.containsKey('comments')) {
      final l$comments = comments;
      result$data['comments'] =
          l$comments == null ? null : mapToJson(l$comments);
    }
    if (_$data.containsKey('link')) {
      final l$link = link;
      result$data['link'] = l$link;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$writePost<Variables$Mutation$writePost>
      get copyWith => CopyWith$Variables$Mutation$writePost(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$writePost) ||
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
    final l$message = message;
    final lOther$message = other.message;
    if (_$data.containsKey('message') != other._$data.containsKey('message')) {
      return false;
    }
    if (l$message != lOther$message) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (_$data.containsKey('image') != other._$data.containsKey('image')) {
      return false;
    }
    if (l$image != lOther$image) {
      return false;
    }
    final l$likes = likes;
    final lOther$likes = other.likes;
    if (_$data.containsKey('likes') != other._$data.containsKey('likes')) {
      return false;
    }
    if (l$likes != lOther$likes) {
      return false;
    }
    final l$comments = comments;
    final lOther$comments = other.comments;
    if (_$data.containsKey('comments') !=
        other._$data.containsKey('comments')) {
      return false;
    }
    if (l$comments != lOther$comments) {
      return false;
    }
    final l$link = link;
    final lOther$link = other.link;
    if (_$data.containsKey('link') != other._$data.containsKey('link')) {
      return false;
    }
    if (l$link != lOther$link) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$service_provider_id = service_provider_id;
    final l$message = message;
    final l$image = image;
    final l$likes = likes;
    final l$comments = comments;
    final l$link = link;
    return Object.hashAll([
      _$data.containsKey('service_provider_id')
          ? l$service_provider_id
          : const {},
      _$data.containsKey('message') ? l$message : const {},
      _$data.containsKey('image') ? l$image : const {},
      _$data.containsKey('likes') ? l$likes : const {},
      _$data.containsKey('comments') ? l$comments : const {},
      _$data.containsKey('link') ? l$link : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$writePost<TRes> {
  factory CopyWith$Variables$Mutation$writePost(
    Variables$Mutation$writePost instance,
    TRes Function(Variables$Mutation$writePost) then,
  ) = _CopyWithImpl$Variables$Mutation$writePost;

  factory CopyWith$Variables$Mutation$writePost.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$writePost;

  TRes call({
    int? service_provider_id,
    String? message,
    String? image,
    dynamic? likes,
    dynamic? comments,
    String? link,
  });
}

class _CopyWithImpl$Variables$Mutation$writePost<TRes>
    implements CopyWith$Variables$Mutation$writePost<TRes> {
  _CopyWithImpl$Variables$Mutation$writePost(
    this._instance,
    this._then,
  );

  final Variables$Mutation$writePost _instance;

  final TRes Function(Variables$Mutation$writePost) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_id = _undefined,
    Object? message = _undefined,
    Object? image = _undefined,
    Object? likes = _undefined,
    Object? comments = _undefined,
    Object? link = _undefined,
  }) =>
      _then(Variables$Mutation$writePost._({
        ..._instance._$data,
        if (service_provider_id != _undefined)
          'service_provider_id': (service_provider_id as int?),
        if (message != _undefined) 'message': (message as String?),
        if (image != _undefined) 'image': (image as String?),
        if (likes != _undefined) 'likes': (likes as dynamic?),
        if (comments != _undefined) 'comments': (comments as dynamic?),
        if (link != _undefined) 'link': (link as String?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$writePost<TRes>
    implements CopyWith$Variables$Mutation$writePost<TRes> {
  _CopyWithStubImpl$Variables$Mutation$writePost(this._res);

  TRes _res;

  call({
    int? service_provider_id,
    String? message,
    String? image,
    dynamic? likes,
    dynamic? comments,
    String? link,
  }) =>
      _res;
}

class Mutation$writePost {
  Mutation$writePost({
    this.insert_service_provider_post_one,
    required this.$__typename,
  });

  factory Mutation$writePost.fromJson(Map<String, dynamic> json) {
    final l$insert_service_provider_post_one =
        json['insert_service_provider_post_one'];
    final l$$__typename = json['__typename'];
    return Mutation$writePost(
      insert_service_provider_post_one:
          l$insert_service_provider_post_one == null
              ? null
              : Mutation$writePost$insert_service_provider_post_one.fromJson(
                  (l$insert_service_provider_post_one as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$writePost$insert_service_provider_post_one?
      insert_service_provider_post_one;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insert_service_provider_post_one = insert_service_provider_post_one;
    _resultData['insert_service_provider_post_one'] =
        l$insert_service_provider_post_one?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insert_service_provider_post_one = insert_service_provider_post_one;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$insert_service_provider_post_one,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$writePost) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$insert_service_provider_post_one = insert_service_provider_post_one;
    final lOther$insert_service_provider_post_one =
        other.insert_service_provider_post_one;
    if (l$insert_service_provider_post_one !=
        lOther$insert_service_provider_post_one) {
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

extension UtilityExtension$Mutation$writePost on Mutation$writePost {
  CopyWith$Mutation$writePost<Mutation$writePost> get copyWith =>
      CopyWith$Mutation$writePost(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$writePost<TRes> {
  factory CopyWith$Mutation$writePost(
    Mutation$writePost instance,
    TRes Function(Mutation$writePost) then,
  ) = _CopyWithImpl$Mutation$writePost;

  factory CopyWith$Mutation$writePost.stub(TRes res) =
      _CopyWithStubImpl$Mutation$writePost;

  TRes call({
    Mutation$writePost$insert_service_provider_post_one?
        insert_service_provider_post_one,
    String? $__typename,
  });
  CopyWith$Mutation$writePost$insert_service_provider_post_one<TRes>
      get insert_service_provider_post_one;
}

class _CopyWithImpl$Mutation$writePost<TRes>
    implements CopyWith$Mutation$writePost<TRes> {
  _CopyWithImpl$Mutation$writePost(
    this._instance,
    this._then,
  );

  final Mutation$writePost _instance;

  final TRes Function(Mutation$writePost) _then;

  static const _undefined = {};

  TRes call({
    Object? insert_service_provider_post_one = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$writePost(
        insert_service_provider_post_one:
            insert_service_provider_post_one == _undefined
                ? _instance.insert_service_provider_post_one
                : (insert_service_provider_post_one
                    as Mutation$writePost$insert_service_provider_post_one?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$writePost$insert_service_provider_post_one<TRes>
      get insert_service_provider_post_one {
    final local$insert_service_provider_post_one =
        _instance.insert_service_provider_post_one;
    return local$insert_service_provider_post_one == null
        ? CopyWith$Mutation$writePost$insert_service_provider_post_one.stub(
            _then(_instance))
        : CopyWith$Mutation$writePost$insert_service_provider_post_one(
            local$insert_service_provider_post_one,
            (e) => call(insert_service_provider_post_one: e));
  }
}

class _CopyWithStubImpl$Mutation$writePost<TRes>
    implements CopyWith$Mutation$writePost<TRes> {
  _CopyWithStubImpl$Mutation$writePost(this._res);

  TRes _res;

  call({
    Mutation$writePost$insert_service_provider_post_one?
        insert_service_provider_post_one,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$writePost$insert_service_provider_post_one<TRes>
      get insert_service_provider_post_one =>
          CopyWith$Mutation$writePost$insert_service_provider_post_one.stub(
              _res);
}

const documentNodeMutationwritePost = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'writePost'),
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
        variable: VariableNode(name: NameNode(value: 'message')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'image')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'likes')),
        type: NamedTypeNode(
          name: NameNode(value: 'jsonb'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'comments')),
        type: NamedTypeNode(
          name: NameNode(value: 'jsonb'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'link')),
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
        name: NameNode(value: 'insert_service_provider_post_one'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'object'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'service_provider_type'),
                value: StringValueNode(
                  value: 'restaurant',
                  isBlock: false,
                ),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'service_provider_id'),
                value:
                    VariableNode(name: NameNode(value: 'service_provider_id')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'message'),
                value: VariableNode(name: NameNode(value: 'message')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'image'),
                value: VariableNode(name: NameNode(value: 'image')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'likes'),
                value: VariableNode(name: NameNode(value: 'likes')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'comments'),
                value: VariableNode(name: NameNode(value: 'comments')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'link'),
                value: VariableNode(name: NameNode(value: 'link')),
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
            name: NameNode(value: 'posted_on'),
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
Mutation$writePost _parserFn$Mutation$writePost(Map<String, dynamic> data) =>
    Mutation$writePost.fromJson(data);
typedef OnMutationCompleted$Mutation$writePost = FutureOr<void> Function(
  dynamic,
  Mutation$writePost?,
);

class Options$Mutation$writePost
    extends graphql.MutationOptions<Mutation$writePost> {
  Options$Mutation$writePost({
    String? operationName,
    Variables$Mutation$writePost? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$writePost? onCompleted,
    graphql.OnMutationUpdate<Mutation$writePost>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables?.toJson() ?? {},
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
                    data == null ? null : _parserFn$Mutation$writePost(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationwritePost,
          parserFn: _parserFn$Mutation$writePost,
        );

  final OnMutationCompleted$Mutation$writePost? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$writePost
    extends graphql.WatchQueryOptions<Mutation$writePost> {
  WatchOptions$Mutation$writePost({
    String? operationName,
    Variables$Mutation$writePost? variables,
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
          document: documentNodeMutationwritePost,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$writePost,
        );
}

extension ClientExtension$Mutation$writePost on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$writePost>> mutate$writePost(
          [Options$Mutation$writePost? options]) async =>
      await this.mutate(options ?? Options$Mutation$writePost());
  graphql.ObservableQuery<Mutation$writePost> watchMutation$writePost(
          [WatchOptions$Mutation$writePost? options]) =>
      this.watchMutation(options ?? WatchOptions$Mutation$writePost());
}

class Mutation$writePost$insert_service_provider_post_one {
  Mutation$writePost$insert_service_provider_post_one({
    required this.id,
    required this.posted_on,
    required this.$__typename,
  });

  factory Mutation$writePost$insert_service_provider_post_one.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$posted_on = json['posted_on'];
    final l$$__typename = json['__typename'];
    return Mutation$writePost$insert_service_provider_post_one(
      id: (l$id as int),
      posted_on: (l$posted_on as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String posted_on;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$posted_on = posted_on;
    _resultData['posted_on'] = l$posted_on;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$posted_on = posted_on;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$posted_on,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$writePost$insert_service_provider_post_one) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$posted_on = posted_on;
    final lOther$posted_on = other.posted_on;
    if (l$posted_on != lOther$posted_on) {
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

extension UtilityExtension$Mutation$writePost$insert_service_provider_post_one
    on Mutation$writePost$insert_service_provider_post_one {
  CopyWith$Mutation$writePost$insert_service_provider_post_one<
          Mutation$writePost$insert_service_provider_post_one>
      get copyWith =>
          CopyWith$Mutation$writePost$insert_service_provider_post_one(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$writePost$insert_service_provider_post_one<
    TRes> {
  factory CopyWith$Mutation$writePost$insert_service_provider_post_one(
    Mutation$writePost$insert_service_provider_post_one instance,
    TRes Function(Mutation$writePost$insert_service_provider_post_one) then,
  ) = _CopyWithImpl$Mutation$writePost$insert_service_provider_post_one;

  factory CopyWith$Mutation$writePost$insert_service_provider_post_one.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$writePost$insert_service_provider_post_one;

  TRes call({
    int? id,
    String? posted_on,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$writePost$insert_service_provider_post_one<TRes>
    implements
        CopyWith$Mutation$writePost$insert_service_provider_post_one<TRes> {
  _CopyWithImpl$Mutation$writePost$insert_service_provider_post_one(
    this._instance,
    this._then,
  );

  final Mutation$writePost$insert_service_provider_post_one _instance;

  final TRes Function(Mutation$writePost$insert_service_provider_post_one)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? posted_on = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$writePost$insert_service_provider_post_one(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        posted_on: posted_on == _undefined || posted_on == null
            ? _instance.posted_on
            : (posted_on as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$writePost$insert_service_provider_post_one<
        TRes>
    implements
        CopyWith$Mutation$writePost$insert_service_provider_post_one<TRes> {
  _CopyWithStubImpl$Mutation$writePost$insert_service_provider_post_one(
      this._res);

  TRes _res;

  call({
    int? id,
    String? posted_on,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getFeed {
  factory Variables$Query$getFeed({List<int>? $_in}) =>
      Variables$Query$getFeed._({
        if ($_in != null) r'_in': $_in,
      });

  Variables$Query$getFeed._(this._$data);

  factory Variables$Query$getFeed.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('_in')) {
      final l$$_in = data['_in'];
      result$data['_in'] =
          (l$$_in as List<dynamic>?)?.map((e) => (e as int)).toList();
    }
    return Variables$Query$getFeed._(result$data);
  }

  Map<String, dynamic> _$data;

  List<int>? get $_in => (_$data['_in'] as List<int>?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('_in')) {
      final l$$_in = $_in;
      result$data['_in'] = l$$_in?.map((e) => e).toList();
    }
    return result$data;
  }

  CopyWith$Variables$Query$getFeed<Variables$Query$getFeed> get copyWith =>
      CopyWith$Variables$Query$getFeed(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getFeed) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$_in = $_in;
    final lOther$$_in = other.$_in;
    if (_$data.containsKey('_in') != other._$data.containsKey('_in')) {
      return false;
    }
    if (l$$_in != null && lOther$$_in != null) {
      if (l$$_in.length != lOther$$_in.length) {
        return false;
      }
      for (int i = 0; i < l$$_in.length; i++) {
        final l$$_in$entry = l$$_in[i];
        final lOther$$_in$entry = lOther$$_in[i];
        if (l$$_in$entry != lOther$$_in$entry) {
          return false;
        }
      }
    } else if (l$$_in != lOther$$_in) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$$_in = $_in;
    return Object.hashAll([
      _$data.containsKey('_in')
          ? l$$_in == null
              ? null
              : Object.hashAll(l$$_in.map((v) => v))
          : const {}
    ]);
  }
}

abstract class CopyWith$Variables$Query$getFeed<TRes> {
  factory CopyWith$Variables$Query$getFeed(
    Variables$Query$getFeed instance,
    TRes Function(Variables$Query$getFeed) then,
  ) = _CopyWithImpl$Variables$Query$getFeed;

  factory CopyWith$Variables$Query$getFeed.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getFeed;

  TRes call({List<int>? $_in});
}

class _CopyWithImpl$Variables$Query$getFeed<TRes>
    implements CopyWith$Variables$Query$getFeed<TRes> {
  _CopyWithImpl$Variables$Query$getFeed(
    this._instance,
    this._then,
  );

  final Variables$Query$getFeed _instance;

  final TRes Function(Variables$Query$getFeed) _then;

  static const _undefined = {};

  TRes call({Object? $_in = _undefined}) => _then(Variables$Query$getFeed._({
        ..._instance._$data,
        if ($_in != _undefined) '_in': ($_in as List<int>?),
      }));
}

class _CopyWithStubImpl$Variables$Query$getFeed<TRes>
    implements CopyWith$Variables$Query$getFeed<TRes> {
  _CopyWithStubImpl$Variables$Query$getFeed(this._res);

  TRes _res;

  call({List<int>? $_in}) => _res;
}

class Query$getFeed {
  Query$getFeed({
    required this.service_provider_post,
    required this.$__typename,
  });

  factory Query$getFeed.fromJson(Map<String, dynamic> json) {
    final l$service_provider_post = json['service_provider_post'];
    final l$$__typename = json['__typename'];
    return Query$getFeed(
      service_provider_post: (l$service_provider_post as List<dynamic>)
          .map((e) => Query$getFeed$service_provider_post.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getFeed$service_provider_post> service_provider_post;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$service_provider_post = service_provider_post;
    _resultData['service_provider_post'] =
        l$service_provider_post.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$service_provider_post = service_provider_post;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$service_provider_post.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getFeed) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$service_provider_post = service_provider_post;
    final lOther$service_provider_post = other.service_provider_post;
    if (l$service_provider_post.length != lOther$service_provider_post.length) {
      return false;
    }
    for (int i = 0; i < l$service_provider_post.length; i++) {
      final l$service_provider_post$entry = l$service_provider_post[i];
      final lOther$service_provider_post$entry =
          lOther$service_provider_post[i];
      if (l$service_provider_post$entry != lOther$service_provider_post$entry) {
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

extension UtilityExtension$Query$getFeed on Query$getFeed {
  CopyWith$Query$getFeed<Query$getFeed> get copyWith => CopyWith$Query$getFeed(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getFeed<TRes> {
  factory CopyWith$Query$getFeed(
    Query$getFeed instance,
    TRes Function(Query$getFeed) then,
  ) = _CopyWithImpl$Query$getFeed;

  factory CopyWith$Query$getFeed.stub(TRes res) =
      _CopyWithStubImpl$Query$getFeed;

  TRes call({
    List<Query$getFeed$service_provider_post>? service_provider_post,
    String? $__typename,
  });
  TRes service_provider_post(
      Iterable<Query$getFeed$service_provider_post> Function(
              Iterable<
                  CopyWith$Query$getFeed$service_provider_post<
                      Query$getFeed$service_provider_post>>)
          _fn);
}

class _CopyWithImpl$Query$getFeed<TRes>
    implements CopyWith$Query$getFeed<TRes> {
  _CopyWithImpl$Query$getFeed(
    this._instance,
    this._then,
  );

  final Query$getFeed _instance;

  final TRes Function(Query$getFeed) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_post = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getFeed(
        service_provider_post:
            service_provider_post == _undefined || service_provider_post == null
                ? _instance.service_provider_post
                : (service_provider_post
                    as List<Query$getFeed$service_provider_post>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes service_provider_post(
          Iterable<Query$getFeed$service_provider_post> Function(
                  Iterable<
                      CopyWith$Query$getFeed$service_provider_post<
                          Query$getFeed$service_provider_post>>)
              _fn) =>
      call(
          service_provider_post: _fn(_instance.service_provider_post
              .map((e) => CopyWith$Query$getFeed$service_provider_post(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getFeed<TRes>
    implements CopyWith$Query$getFeed<TRes> {
  _CopyWithStubImpl$Query$getFeed(this._res);

  TRes _res;

  call({
    List<Query$getFeed$service_provider_post>? service_provider_post,
    String? $__typename,
  }) =>
      _res;
  service_provider_post(_fn) => _res;
}

const documentNodeQuerygetFeed = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getFeed'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: '_in')),
        type: ListTypeNode(
          type: NamedTypeNode(
            name: NameNode(value: 'Int'),
            isNonNull: true,
          ),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'service_provider_post'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: '_and'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'service_provider_type'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                        name: NameNode(value: '_eq'),
                        value: StringValueNode(
                          value: 'restaurant',
                          isBlock: false,
                        ),
                      )
                    ]),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'service_provider_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_in'),
                    value: VariableNode(name: NameNode(value: '_in')),
                  )
                ]),
              ),
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: 'order_by'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'posted_on'),
                value: EnumValueNode(name: NameNode(value: 'desc')),
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
            name: NameNode(value: 'comments'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'likes'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'message'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'posted_on'),
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
Query$getFeed _parserFn$Query$getFeed(Map<String, dynamic> data) =>
    Query$getFeed.fromJson(data);

class Options$Query$getFeed extends graphql.QueryOptions<Query$getFeed> {
  Options$Query$getFeed({
    String? operationName,
    Variables$Query$getFeed? variables,
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
          document: documentNodeQuerygetFeed,
          parserFn: _parserFn$Query$getFeed,
        );
}

class WatchOptions$Query$getFeed
    extends graphql.WatchQueryOptions<Query$getFeed> {
  WatchOptions$Query$getFeed({
    String? operationName,
    Variables$Query$getFeed? variables,
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
          document: documentNodeQuerygetFeed,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getFeed,
        );
}

class FetchMoreOptions$Query$getFeed extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getFeed({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$getFeed? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQuerygetFeed,
        );
}

extension ClientExtension$Query$getFeed on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getFeed>> query$getFeed(
          [Options$Query$getFeed? options]) async =>
      await this.query(options ?? Options$Query$getFeed());
  graphql.ObservableQuery<Query$getFeed> watchQuery$getFeed(
          [WatchOptions$Query$getFeed? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$getFeed());
  void writeQuery$getFeed({
    required Query$getFeed data,
    Variables$Query$getFeed? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQuerygetFeed),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getFeed? readQuery$getFeed({
    Variables$Query$getFeed? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQuerygetFeed),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getFeed.fromJson(result);
  }
}

class Query$getFeed$service_provider_post {
  Query$getFeed$service_provider_post({
    required this.id,
    this.image,
    this.comments,
    this.likes,
    required this.message,
    required this.posted_on,
    this.restaurant,
    required this.$__typename,
  });

  factory Query$getFeed$service_provider_post.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$image = json['image'];
    final l$comments = json['comments'];
    final l$likes = json['likes'];
    final l$message = json['message'];
    final l$posted_on = json['posted_on'];
    final l$restaurant = json['restaurant'];
    final l$$__typename = json['__typename'];
    return Query$getFeed$service_provider_post(
      id: (l$id as int),
      image: (l$image as String?),
      comments: l$comments == null ? null : mapFromJson(l$comments),
      likes: l$likes == null ? null : mapFromJson(l$likes),
      message: (l$message as String),
      posted_on: (l$posted_on as String),
      restaurant: l$restaurant == null
          ? null
          : Query$getFeed$service_provider_post$restaurant.fromJson(
              (l$restaurant as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? image;

  final dynamic? comments;

  final dynamic? likes;

  final String message;

  final String posted_on;

  final Query$getFeed$service_provider_post$restaurant? restaurant;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$comments = comments;
    _resultData['comments'] = l$comments == null ? null : mapToJson(l$comments);
    final l$likes = likes;
    _resultData['likes'] = l$likes == null ? null : mapToJson(l$likes);
    final l$message = message;
    _resultData['message'] = l$message;
    final l$posted_on = posted_on;
    _resultData['posted_on'] = l$posted_on;
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$image = image;
    final l$comments = comments;
    final l$likes = likes;
    final l$message = message;
    final l$posted_on = posted_on;
    final l$restaurant = restaurant;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$image,
      l$comments,
      l$likes,
      l$message,
      l$posted_on,
      l$restaurant,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getFeed$service_provider_post) ||
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
    final l$comments = comments;
    final lOther$comments = other.comments;
    if (l$comments != lOther$comments) {
      return false;
    }
    final l$likes = likes;
    final lOther$likes = other.likes;
    if (l$likes != lOther$likes) {
      return false;
    }
    final l$message = message;
    final lOther$message = other.message;
    if (l$message != lOther$message) {
      return false;
    }
    final l$posted_on = posted_on;
    final lOther$posted_on = other.posted_on;
    if (l$posted_on != lOther$posted_on) {
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

extension UtilityExtension$Query$getFeed$service_provider_post
    on Query$getFeed$service_provider_post {
  CopyWith$Query$getFeed$service_provider_post<
          Query$getFeed$service_provider_post>
      get copyWith => CopyWith$Query$getFeed$service_provider_post(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getFeed$service_provider_post<TRes> {
  factory CopyWith$Query$getFeed$service_provider_post(
    Query$getFeed$service_provider_post instance,
    TRes Function(Query$getFeed$service_provider_post) then,
  ) = _CopyWithImpl$Query$getFeed$service_provider_post;

  factory CopyWith$Query$getFeed$service_provider_post.stub(TRes res) =
      _CopyWithStubImpl$Query$getFeed$service_provider_post;

  TRes call({
    int? id,
    String? image,
    dynamic? comments,
    dynamic? likes,
    String? message,
    String? posted_on,
    Query$getFeed$service_provider_post$restaurant? restaurant,
    String? $__typename,
  });
  CopyWith$Query$getFeed$service_provider_post$restaurant<TRes> get restaurant;
}

class _CopyWithImpl$Query$getFeed$service_provider_post<TRes>
    implements CopyWith$Query$getFeed$service_provider_post<TRes> {
  _CopyWithImpl$Query$getFeed$service_provider_post(
    this._instance,
    this._then,
  );

  final Query$getFeed$service_provider_post _instance;

  final TRes Function(Query$getFeed$service_provider_post) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? image = _undefined,
    Object? comments = _undefined,
    Object? likes = _undefined,
    Object? message = _undefined,
    Object? posted_on = _undefined,
    Object? restaurant = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getFeed$service_provider_post(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        image: image == _undefined ? _instance.image : (image as String?),
        comments: comments == _undefined
            ? _instance.comments
            : (comments as dynamic?),
        likes: likes == _undefined ? _instance.likes : (likes as dynamic?),
        message: message == _undefined || message == null
            ? _instance.message
            : (message as String),
        posted_on: posted_on == _undefined || posted_on == null
            ? _instance.posted_on
            : (posted_on as String),
        restaurant: restaurant == _undefined
            ? _instance.restaurant
            : (restaurant as Query$getFeed$service_provider_post$restaurant?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getFeed$service_provider_post$restaurant<TRes> get restaurant {
    final local$restaurant = _instance.restaurant;
    return local$restaurant == null
        ? CopyWith$Query$getFeed$service_provider_post$restaurant.stub(
            _then(_instance))
        : CopyWith$Query$getFeed$service_provider_post$restaurant(
            local$restaurant, (e) => call(restaurant: e));
  }
}

class _CopyWithStubImpl$Query$getFeed$service_provider_post<TRes>
    implements CopyWith$Query$getFeed$service_provider_post<TRes> {
  _CopyWithStubImpl$Query$getFeed$service_provider_post(this._res);

  TRes _res;

  call({
    int? id,
    String? image,
    dynamic? comments,
    dynamic? likes,
    String? message,
    String? posted_on,
    Query$getFeed$service_provider_post$restaurant? restaurant,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getFeed$service_provider_post$restaurant<TRes>
      get restaurant =>
          CopyWith$Query$getFeed$service_provider_post$restaurant.stub(_res);
}

class Query$getFeed$service_provider_post$restaurant {
  Query$getFeed$service_provider_post$restaurant({
    this.details,
    required this.$__typename,
  });

  factory Query$getFeed$service_provider_post$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$getFeed$service_provider_post$restaurant(
      details: l$details == null
          ? null
          : Query$getFeed$service_provider_post$restaurant$details.fromJson(
              (l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getFeed$service_provider_post$restaurant$details? details;

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
    if (!(other is Query$getFeed$service_provider_post$restaurant) ||
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

extension UtilityExtension$Query$getFeed$service_provider_post$restaurant
    on Query$getFeed$service_provider_post$restaurant {
  CopyWith$Query$getFeed$service_provider_post$restaurant<
          Query$getFeed$service_provider_post$restaurant>
      get copyWith => CopyWith$Query$getFeed$service_provider_post$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getFeed$service_provider_post$restaurant<TRes> {
  factory CopyWith$Query$getFeed$service_provider_post$restaurant(
    Query$getFeed$service_provider_post$restaurant instance,
    TRes Function(Query$getFeed$service_provider_post$restaurant) then,
  ) = _CopyWithImpl$Query$getFeed$service_provider_post$restaurant;

  factory CopyWith$Query$getFeed$service_provider_post$restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getFeed$service_provider_post$restaurant;

  TRes call({
    Query$getFeed$service_provider_post$restaurant$details? details,
    String? $__typename,
  });
  CopyWith$Query$getFeed$service_provider_post$restaurant$details<TRes>
      get details;
}

class _CopyWithImpl$Query$getFeed$service_provider_post$restaurant<TRes>
    implements CopyWith$Query$getFeed$service_provider_post$restaurant<TRes> {
  _CopyWithImpl$Query$getFeed$service_provider_post$restaurant(
    this._instance,
    this._then,
  );

  final Query$getFeed$service_provider_post$restaurant _instance;

  final TRes Function(Query$getFeed$service_provider_post$restaurant) _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getFeed$service_provider_post$restaurant(
        details: details == _undefined
            ? _instance.details
            : (details
                as Query$getFeed$service_provider_post$restaurant$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getFeed$service_provider_post$restaurant$details<TRes>
      get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$getFeed$service_provider_post$restaurant$details.stub(
            _then(_instance))
        : CopyWith$Query$getFeed$service_provider_post$restaurant$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$getFeed$service_provider_post$restaurant<TRes>
    implements CopyWith$Query$getFeed$service_provider_post$restaurant<TRes> {
  _CopyWithStubImpl$Query$getFeed$service_provider_post$restaurant(this._res);

  TRes _res;

  call({
    Query$getFeed$service_provider_post$restaurant$details? details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getFeed$service_provider_post$restaurant$details<TRes>
      get details =>
          CopyWith$Query$getFeed$service_provider_post$restaurant$details.stub(
              _res);
}

class Query$getFeed$service_provider_post$restaurant$details {
  Query$getFeed$service_provider_post$restaurant$details({
    required this.name,
    required this.image,
    required this.$__typename,
  });

  factory Query$getFeed$service_provider_post$restaurant$details.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$getFeed$service_provider_post$restaurant$details(
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
    if (!(other is Query$getFeed$service_provider_post$restaurant$details) ||
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

extension UtilityExtension$Query$getFeed$service_provider_post$restaurant$details
    on Query$getFeed$service_provider_post$restaurant$details {
  CopyWith$Query$getFeed$service_provider_post$restaurant$details<
          Query$getFeed$service_provider_post$restaurant$details>
      get copyWith =>
          CopyWith$Query$getFeed$service_provider_post$restaurant$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getFeed$service_provider_post$restaurant$details<
    TRes> {
  factory CopyWith$Query$getFeed$service_provider_post$restaurant$details(
    Query$getFeed$service_provider_post$restaurant$details instance,
    TRes Function(Query$getFeed$service_provider_post$restaurant$details) then,
  ) = _CopyWithImpl$Query$getFeed$service_provider_post$restaurant$details;

  factory CopyWith$Query$getFeed$service_provider_post$restaurant$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getFeed$service_provider_post$restaurant$details;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getFeed$service_provider_post$restaurant$details<TRes>
    implements
        CopyWith$Query$getFeed$service_provider_post$restaurant$details<TRes> {
  _CopyWithImpl$Query$getFeed$service_provider_post$restaurant$details(
    this._instance,
    this._then,
  );

  final Query$getFeed$service_provider_post$restaurant$details _instance;

  final TRes Function(Query$getFeed$service_provider_post$restaurant$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getFeed$service_provider_post$restaurant$details(
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

class _CopyWithStubImpl$Query$getFeed$service_provider_post$restaurant$details<
        TRes>
    implements
        CopyWith$Query$getFeed$service_provider_post$restaurant$details<TRes> {
  _CopyWithStubImpl$Query$getFeed$service_provider_post$restaurant$details(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getSubscribedRestaurants {
  factory Variables$Query$getSubscribedRestaurants({int? $_eq}) =>
      Variables$Query$getSubscribedRestaurants._({
        if ($_eq != null) r'_eq': $_eq,
      });

  Variables$Query$getSubscribedRestaurants._(this._$data);

  factory Variables$Query$getSubscribedRestaurants.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('_eq')) {
      final l$$_eq = data['_eq'];
      result$data['_eq'] = (l$$_eq as int?);
    }
    return Variables$Query$getSubscribedRestaurants._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get $_eq => (_$data['_eq'] as int?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('_eq')) {
      final l$$_eq = $_eq;
      result$data['_eq'] = l$$_eq;
    }
    return result$data;
  }

  CopyWith$Variables$Query$getSubscribedRestaurants<
          Variables$Query$getSubscribedRestaurants>
      get copyWith => CopyWith$Variables$Query$getSubscribedRestaurants(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getSubscribedRestaurants) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$_eq = $_eq;
    final lOther$$_eq = other.$_eq;
    if (_$data.containsKey('_eq') != other._$data.containsKey('_eq')) {
      return false;
    }
    if (l$$_eq != lOther$$_eq) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$$_eq = $_eq;
    return Object.hashAll([_$data.containsKey('_eq') ? l$$_eq : const {}]);
  }
}

abstract class CopyWith$Variables$Query$getSubscribedRestaurants<TRes> {
  factory CopyWith$Variables$Query$getSubscribedRestaurants(
    Variables$Query$getSubscribedRestaurants instance,
    TRes Function(Variables$Query$getSubscribedRestaurants) then,
  ) = _CopyWithImpl$Variables$Query$getSubscribedRestaurants;

  factory CopyWith$Variables$Query$getSubscribedRestaurants.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getSubscribedRestaurants;

  TRes call({int? $_eq});
}

class _CopyWithImpl$Variables$Query$getSubscribedRestaurants<TRes>
    implements CopyWith$Variables$Query$getSubscribedRestaurants<TRes> {
  _CopyWithImpl$Variables$Query$getSubscribedRestaurants(
    this._instance,
    this._then,
  );

  final Variables$Query$getSubscribedRestaurants _instance;

  final TRes Function(Variables$Query$getSubscribedRestaurants) _then;

  static const _undefined = {};

  TRes call({Object? $_eq = _undefined}) =>
      _then(Variables$Query$getSubscribedRestaurants._({
        ..._instance._$data,
        if ($_eq != _undefined) '_eq': ($_eq as int?),
      }));
}

class _CopyWithStubImpl$Variables$Query$getSubscribedRestaurants<TRes>
    implements CopyWith$Variables$Query$getSubscribedRestaurants<TRes> {
  _CopyWithStubImpl$Variables$Query$getSubscribedRestaurants(this._res);

  TRes _res;

  call({int? $_eq}) => _res;
}

class Query$getSubscribedRestaurants {
  Query$getSubscribedRestaurants({
    required this.service_provider_subscriber,
    required this.$__typename,
  });

  factory Query$getSubscribedRestaurants.fromJson(Map<String, dynamic> json) {
    final l$service_provider_subscriber = json['service_provider_subscriber'];
    final l$$__typename = json['__typename'];
    return Query$getSubscribedRestaurants(
      service_provider_subscriber: (l$service_provider_subscriber
              as List<dynamic>)
          .map((e) => Query$getSubscribedRestaurants$service_provider_subscriber
              .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getSubscribedRestaurants$service_provider_subscriber>
      service_provider_subscriber;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$service_provider_subscriber = service_provider_subscriber;
    _resultData['service_provider_subscriber'] =
        l$service_provider_subscriber.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$service_provider_subscriber = service_provider_subscriber;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$service_provider_subscriber.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getSubscribedRestaurants) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$service_provider_subscriber = service_provider_subscriber;
    final lOther$service_provider_subscriber =
        other.service_provider_subscriber;
    if (l$service_provider_subscriber.length !=
        lOther$service_provider_subscriber.length) {
      return false;
    }
    for (int i = 0; i < l$service_provider_subscriber.length; i++) {
      final l$service_provider_subscriber$entry =
          l$service_provider_subscriber[i];
      final lOther$service_provider_subscriber$entry =
          lOther$service_provider_subscriber[i];
      if (l$service_provider_subscriber$entry !=
          lOther$service_provider_subscriber$entry) {
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

extension UtilityExtension$Query$getSubscribedRestaurants
    on Query$getSubscribedRestaurants {
  CopyWith$Query$getSubscribedRestaurants<Query$getSubscribedRestaurants>
      get copyWith => CopyWith$Query$getSubscribedRestaurants(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getSubscribedRestaurants<TRes> {
  factory CopyWith$Query$getSubscribedRestaurants(
    Query$getSubscribedRestaurants instance,
    TRes Function(Query$getSubscribedRestaurants) then,
  ) = _CopyWithImpl$Query$getSubscribedRestaurants;

  factory CopyWith$Query$getSubscribedRestaurants.stub(TRes res) =
      _CopyWithStubImpl$Query$getSubscribedRestaurants;

  TRes call({
    List<Query$getSubscribedRestaurants$service_provider_subscriber>?
        service_provider_subscriber,
    String? $__typename,
  });
  TRes service_provider_subscriber(
      Iterable<Query$getSubscribedRestaurants$service_provider_subscriber> Function(
              Iterable<
                  CopyWith$Query$getSubscribedRestaurants$service_provider_subscriber<
                      Query$getSubscribedRestaurants$service_provider_subscriber>>)
          _fn);
}

class _CopyWithImpl$Query$getSubscribedRestaurants<TRes>
    implements CopyWith$Query$getSubscribedRestaurants<TRes> {
  _CopyWithImpl$Query$getSubscribedRestaurants(
    this._instance,
    this._then,
  );

  final Query$getSubscribedRestaurants _instance;

  final TRes Function(Query$getSubscribedRestaurants) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_subscriber = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getSubscribedRestaurants(
        service_provider_subscriber: service_provider_subscriber ==
                    _undefined ||
                service_provider_subscriber == null
            ? _instance.service_provider_subscriber
            : (service_provider_subscriber as List<
                Query$getSubscribedRestaurants$service_provider_subscriber>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes service_provider_subscriber(
          Iterable<Query$getSubscribedRestaurants$service_provider_subscriber> Function(
                  Iterable<
                      CopyWith$Query$getSubscribedRestaurants$service_provider_subscriber<
                          Query$getSubscribedRestaurants$service_provider_subscriber>>)
              _fn) =>
      call(
          service_provider_subscriber: _fn(_instance.service_provider_subscriber
              .map((e) =>
                  CopyWith$Query$getSubscribedRestaurants$service_provider_subscriber(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getSubscribedRestaurants<TRes>
    implements CopyWith$Query$getSubscribedRestaurants<TRes> {
  _CopyWithStubImpl$Query$getSubscribedRestaurants(this._res);

  TRes _res;

  call({
    List<Query$getSubscribedRestaurants$service_provider_subscriber>?
        service_provider_subscriber,
    String? $__typename,
  }) =>
      _res;
  service_provider_subscriber(_fn) => _res;
}

const documentNodeQuerygetSubscribedRestaurants = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getSubscribedRestaurants'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: '_eq')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'service_provider_subscriber'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'service_provider_type'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: StringValueNode(
                      value: 'restaurant',
                      isBlock: false,
                    ),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: '_and'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'customer_id'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                        name: NameNode(value: '_eq'),
                        value: VariableNode(name: NameNode(value: '_eq')),
                      )
                    ]),
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
Query$getSubscribedRestaurants _parserFn$Query$getSubscribedRestaurants(
        Map<String, dynamic> data) =>
    Query$getSubscribedRestaurants.fromJson(data);

class Options$Query$getSubscribedRestaurants
    extends graphql.QueryOptions<Query$getSubscribedRestaurants> {
  Options$Query$getSubscribedRestaurants({
    String? operationName,
    Variables$Query$getSubscribedRestaurants? variables,
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
          document: documentNodeQuerygetSubscribedRestaurants,
          parserFn: _parserFn$Query$getSubscribedRestaurants,
        );
}

class WatchOptions$Query$getSubscribedRestaurants
    extends graphql.WatchQueryOptions<Query$getSubscribedRestaurants> {
  WatchOptions$Query$getSubscribedRestaurants({
    String? operationName,
    Variables$Query$getSubscribedRestaurants? variables,
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
          document: documentNodeQuerygetSubscribedRestaurants,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getSubscribedRestaurants,
        );
}

class FetchMoreOptions$Query$getSubscribedRestaurants
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getSubscribedRestaurants({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$getSubscribedRestaurants? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQuerygetSubscribedRestaurants,
        );
}

extension ClientExtension$Query$getSubscribedRestaurants
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getSubscribedRestaurants>>
      query$getSubscribedRestaurants(
              [Options$Query$getSubscribedRestaurants? options]) async =>
          await this.query(options ?? Options$Query$getSubscribedRestaurants());
  graphql.ObservableQuery<
      Query$getSubscribedRestaurants> watchQuery$getSubscribedRestaurants(
          [WatchOptions$Query$getSubscribedRestaurants? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$getSubscribedRestaurants());
  void writeQuery$getSubscribedRestaurants({
    required Query$getSubscribedRestaurants data,
    Variables$Query$getSubscribedRestaurants? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetSubscribedRestaurants),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getSubscribedRestaurants? readQuery$getSubscribedRestaurants({
    Variables$Query$getSubscribedRestaurants? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQuerygetSubscribedRestaurants),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$getSubscribedRestaurants.fromJson(result);
  }
}

class Query$getSubscribedRestaurants$service_provider_subscriber {
  Query$getSubscribedRestaurants$service_provider_subscriber({
    required this.id,
    this.restaurant,
    required this.$__typename,
  });

  factory Query$getSubscribedRestaurants$service_provider_subscriber.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$restaurant = json['restaurant'];
    final l$$__typename = json['__typename'];
    return Query$getSubscribedRestaurants$service_provider_subscriber(
      id: (l$id as int),
      restaurant: l$restaurant == null
          ? null
          : Query$getSubscribedRestaurants$service_provider_subscriber$restaurant
              .fromJson((l$restaurant as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$getSubscribedRestaurants$service_provider_subscriber$restaurant?
      restaurant;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$restaurant = restaurant;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
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
            is Query$getSubscribedRestaurants$service_provider_subscriber) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getSubscribedRestaurants$service_provider_subscriber
    on Query$getSubscribedRestaurants$service_provider_subscriber {
  CopyWith$Query$getSubscribedRestaurants$service_provider_subscriber<
          Query$getSubscribedRestaurants$service_provider_subscriber>
      get copyWith =>
          CopyWith$Query$getSubscribedRestaurants$service_provider_subscriber(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getSubscribedRestaurants$service_provider_subscriber<
    TRes> {
  factory CopyWith$Query$getSubscribedRestaurants$service_provider_subscriber(
    Query$getSubscribedRestaurants$service_provider_subscriber instance,
    TRes Function(Query$getSubscribedRestaurants$service_provider_subscriber)
        then,
  ) = _CopyWithImpl$Query$getSubscribedRestaurants$service_provider_subscriber;

  factory CopyWith$Query$getSubscribedRestaurants$service_provider_subscriber.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getSubscribedRestaurants$service_provider_subscriber;

  TRes call({
    int? id,
    Query$getSubscribedRestaurants$service_provider_subscriber$restaurant?
        restaurant,
    String? $__typename,
  });
  CopyWith$Query$getSubscribedRestaurants$service_provider_subscriber$restaurant<
      TRes> get restaurant;
}

class _CopyWithImpl$Query$getSubscribedRestaurants$service_provider_subscriber<
        TRes>
    implements
        CopyWith$Query$getSubscribedRestaurants$service_provider_subscriber<
            TRes> {
  _CopyWithImpl$Query$getSubscribedRestaurants$service_provider_subscriber(
    this._instance,
    this._then,
  );

  final Query$getSubscribedRestaurants$service_provider_subscriber _instance;

  final TRes Function(
      Query$getSubscribedRestaurants$service_provider_subscriber) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? restaurant = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getSubscribedRestaurants$service_provider_subscriber(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        restaurant: restaurant == _undefined
            ? _instance.restaurant
            : (restaurant
                as Query$getSubscribedRestaurants$service_provider_subscriber$restaurant?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getSubscribedRestaurants$service_provider_subscriber$restaurant<
      TRes> get restaurant {
    final local$restaurant = _instance.restaurant;
    return local$restaurant == null
        ? CopyWith$Query$getSubscribedRestaurants$service_provider_subscriber$restaurant
            .stub(_then(_instance))
        : CopyWith$Query$getSubscribedRestaurants$service_provider_subscriber$restaurant(
            local$restaurant, (e) => call(restaurant: e));
  }
}

class _CopyWithStubImpl$Query$getSubscribedRestaurants$service_provider_subscriber<
        TRes>
    implements
        CopyWith$Query$getSubscribedRestaurants$service_provider_subscriber<
            TRes> {
  _CopyWithStubImpl$Query$getSubscribedRestaurants$service_provider_subscriber(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$getSubscribedRestaurants$service_provider_subscriber$restaurant?
        restaurant,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getSubscribedRestaurants$service_provider_subscriber$restaurant<
          TRes>
      get restaurant =>
          CopyWith$Query$getSubscribedRestaurants$service_provider_subscriber$restaurant
              .stub(_res);
}

class Query$getSubscribedRestaurants$service_provider_subscriber$restaurant {
  Query$getSubscribedRestaurants$service_provider_subscriber$restaurant({
    this.details,
    required this.$__typename,
  });

  factory Query$getSubscribedRestaurants$service_provider_subscriber$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$getSubscribedRestaurants$service_provider_subscriber$restaurant(
      details: l$details == null
          ? null
          : Query$getSubscribedRestaurants$service_provider_subscriber$restaurant$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getSubscribedRestaurants$service_provider_subscriber$restaurant$details?
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
            is Query$getSubscribedRestaurants$service_provider_subscriber$restaurant) ||
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

extension UtilityExtension$Query$getSubscribedRestaurants$service_provider_subscriber$restaurant
    on Query$getSubscribedRestaurants$service_provider_subscriber$restaurant {
  CopyWith$Query$getSubscribedRestaurants$service_provider_subscriber$restaurant<
          Query$getSubscribedRestaurants$service_provider_subscriber$restaurant>
      get copyWith =>
          CopyWith$Query$getSubscribedRestaurants$service_provider_subscriber$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getSubscribedRestaurants$service_provider_subscriber$restaurant<
    TRes> {
  factory CopyWith$Query$getSubscribedRestaurants$service_provider_subscriber$restaurant(
    Query$getSubscribedRestaurants$service_provider_subscriber$restaurant
        instance,
    TRes Function(
            Query$getSubscribedRestaurants$service_provider_subscriber$restaurant)
        then,
  ) = _CopyWithImpl$Query$getSubscribedRestaurants$service_provider_subscriber$restaurant;

  factory CopyWith$Query$getSubscribedRestaurants$service_provider_subscriber$restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getSubscribedRestaurants$service_provider_subscriber$restaurant;

  TRes call({
    Query$getSubscribedRestaurants$service_provider_subscriber$restaurant$details?
        details,
    String? $__typename,
  });
  CopyWith$Query$getSubscribedRestaurants$service_provider_subscriber$restaurant$details<
      TRes> get details;
}

class _CopyWithImpl$Query$getSubscribedRestaurants$service_provider_subscriber$restaurant<
        TRes>
    implements
        CopyWith$Query$getSubscribedRestaurants$service_provider_subscriber$restaurant<
            TRes> {
  _CopyWithImpl$Query$getSubscribedRestaurants$service_provider_subscriber$restaurant(
    this._instance,
    this._then,
  );

  final Query$getSubscribedRestaurants$service_provider_subscriber$restaurant
      _instance;

  final TRes Function(
          Query$getSubscribedRestaurants$service_provider_subscriber$restaurant)
      _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getSubscribedRestaurants$service_provider_subscriber$restaurant(
        details: details == _undefined
            ? _instance.details
            : (details
                as Query$getSubscribedRestaurants$service_provider_subscriber$restaurant$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getSubscribedRestaurants$service_provider_subscriber$restaurant$details<
      TRes> get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$getSubscribedRestaurants$service_provider_subscriber$restaurant$details
            .stub(_then(_instance))
        : CopyWith$Query$getSubscribedRestaurants$service_provider_subscriber$restaurant$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$getSubscribedRestaurants$service_provider_subscriber$restaurant<
        TRes>
    implements
        CopyWith$Query$getSubscribedRestaurants$service_provider_subscriber$restaurant<
            TRes> {
  _CopyWithStubImpl$Query$getSubscribedRestaurants$service_provider_subscriber$restaurant(
      this._res);

  TRes _res;

  call({
    Query$getSubscribedRestaurants$service_provider_subscriber$restaurant$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getSubscribedRestaurants$service_provider_subscriber$restaurant$details<
          TRes>
      get details =>
          CopyWith$Query$getSubscribedRestaurants$service_provider_subscriber$restaurant$details
              .stub(_res);
}

class Query$getSubscribedRestaurants$service_provider_subscriber$restaurant$details {
  Query$getSubscribedRestaurants$service_provider_subscriber$restaurant$details({
    required this.name,
    required this.image,
    required this.$__typename,
  });

  factory Query$getSubscribedRestaurants$service_provider_subscriber$restaurant$details.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$getSubscribedRestaurants$service_provider_subscriber$restaurant$details(
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
            is Query$getSubscribedRestaurants$service_provider_subscriber$restaurant$details) ||
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

extension UtilityExtension$Query$getSubscribedRestaurants$service_provider_subscriber$restaurant$details
    on Query$getSubscribedRestaurants$service_provider_subscriber$restaurant$details {
  CopyWith$Query$getSubscribedRestaurants$service_provider_subscriber$restaurant$details<
          Query$getSubscribedRestaurants$service_provider_subscriber$restaurant$details>
      get copyWith =>
          CopyWith$Query$getSubscribedRestaurants$service_provider_subscriber$restaurant$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getSubscribedRestaurants$service_provider_subscriber$restaurant$details<
    TRes> {
  factory CopyWith$Query$getSubscribedRestaurants$service_provider_subscriber$restaurant$details(
    Query$getSubscribedRestaurants$service_provider_subscriber$restaurant$details
        instance,
    TRes Function(
            Query$getSubscribedRestaurants$service_provider_subscriber$restaurant$details)
        then,
  ) = _CopyWithImpl$Query$getSubscribedRestaurants$service_provider_subscriber$restaurant$details;

  factory CopyWith$Query$getSubscribedRestaurants$service_provider_subscriber$restaurant$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getSubscribedRestaurants$service_provider_subscriber$restaurant$details;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getSubscribedRestaurants$service_provider_subscriber$restaurant$details<
        TRes>
    implements
        CopyWith$Query$getSubscribedRestaurants$service_provider_subscriber$restaurant$details<
            TRes> {
  _CopyWithImpl$Query$getSubscribedRestaurants$service_provider_subscriber$restaurant$details(
    this._instance,
    this._then,
  );

  final Query$getSubscribedRestaurants$service_provider_subscriber$restaurant$details
      _instance;

  final TRes Function(
          Query$getSubscribedRestaurants$service_provider_subscriber$restaurant$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getSubscribedRestaurants$service_provider_subscriber$restaurant$details(
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

class _CopyWithStubImpl$Query$getSubscribedRestaurants$service_provider_subscriber$restaurant$details<
        TRes>
    implements
        CopyWith$Query$getSubscribedRestaurants$service_provider_subscriber$restaurant$details<
            TRes> {
  _CopyWithStubImpl$Query$getSubscribedRestaurants$service_provider_subscriber$restaurant$details(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$addFavouriteItem {
  factory Variables$Mutation$addFavouriteItem({
    int? customer_id,
    int? restaurant_id,
    int? restaurant_item_id,
  }) =>
      Variables$Mutation$addFavouriteItem._({
        if (customer_id != null) r'customer_id': customer_id,
        if (restaurant_id != null) r'restaurant_id': restaurant_id,
        if (restaurant_item_id != null)
          r'restaurant_item_id': restaurant_item_id,
      });

  Variables$Mutation$addFavouriteItem._(this._$data);

  factory Variables$Mutation$addFavouriteItem.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('customer_id')) {
      final l$customer_id = data['customer_id'];
      result$data['customer_id'] = (l$customer_id as int?);
    }
    if (data.containsKey('restaurant_id')) {
      final l$restaurant_id = data['restaurant_id'];
      result$data['restaurant_id'] = (l$restaurant_id as int?);
    }
    if (data.containsKey('restaurant_item_id')) {
      final l$restaurant_item_id = data['restaurant_item_id'];
      result$data['restaurant_item_id'] = (l$restaurant_item_id as int?);
    }
    return Variables$Mutation$addFavouriteItem._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get customer_id => (_$data['customer_id'] as int?);
  int? get restaurant_id => (_$data['restaurant_id'] as int?);
  int? get restaurant_item_id => (_$data['restaurant_item_id'] as int?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('customer_id')) {
      final l$customer_id = customer_id;
      result$data['customer_id'] = l$customer_id;
    }
    if (_$data.containsKey('restaurant_id')) {
      final l$restaurant_id = restaurant_id;
      result$data['restaurant_id'] = l$restaurant_id;
    }
    if (_$data.containsKey('restaurant_item_id')) {
      final l$restaurant_item_id = restaurant_item_id;
      result$data['restaurant_item_id'] = l$restaurant_item_id;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$addFavouriteItem<
          Variables$Mutation$addFavouriteItem>
      get copyWith => CopyWith$Variables$Mutation$addFavouriteItem(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$addFavouriteItem) ||
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
    final l$restaurant_id = restaurant_id;
    final lOther$restaurant_id = other.restaurant_id;
    if (_$data.containsKey('restaurant_id') !=
        other._$data.containsKey('restaurant_id')) {
      return false;
    }
    if (l$restaurant_id != lOther$restaurant_id) {
      return false;
    }
    final l$restaurant_item_id = restaurant_item_id;
    final lOther$restaurant_item_id = other.restaurant_item_id;
    if (_$data.containsKey('restaurant_item_id') !=
        other._$data.containsKey('restaurant_item_id')) {
      return false;
    }
    if (l$restaurant_item_id != lOther$restaurant_item_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$customer_id = customer_id;
    final l$restaurant_id = restaurant_id;
    final l$restaurant_item_id = restaurant_item_id;
    return Object.hashAll([
      _$data.containsKey('customer_id') ? l$customer_id : const {},
      _$data.containsKey('restaurant_id') ? l$restaurant_id : const {},
      _$data.containsKey('restaurant_item_id')
          ? l$restaurant_item_id
          : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$addFavouriteItem<TRes> {
  factory CopyWith$Variables$Mutation$addFavouriteItem(
    Variables$Mutation$addFavouriteItem instance,
    TRes Function(Variables$Mutation$addFavouriteItem) then,
  ) = _CopyWithImpl$Variables$Mutation$addFavouriteItem;

  factory CopyWith$Variables$Mutation$addFavouriteItem.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$addFavouriteItem;

  TRes call({
    int? customer_id,
    int? restaurant_id,
    int? restaurant_item_id,
  });
}

class _CopyWithImpl$Variables$Mutation$addFavouriteItem<TRes>
    implements CopyWith$Variables$Mutation$addFavouriteItem<TRes> {
  _CopyWithImpl$Variables$Mutation$addFavouriteItem(
    this._instance,
    this._then,
  );

  final Variables$Mutation$addFavouriteItem _instance;

  final TRes Function(Variables$Mutation$addFavouriteItem) _then;

  static const _undefined = {};

  TRes call({
    Object? customer_id = _undefined,
    Object? restaurant_id = _undefined,
    Object? restaurant_item_id = _undefined,
  }) =>
      _then(Variables$Mutation$addFavouriteItem._({
        ..._instance._$data,
        if (customer_id != _undefined) 'customer_id': (customer_id as int?),
        if (restaurant_id != _undefined)
          'restaurant_id': (restaurant_id as int?),
        if (restaurant_item_id != _undefined)
          'restaurant_item_id': (restaurant_item_id as int?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$addFavouriteItem<TRes>
    implements CopyWith$Variables$Mutation$addFavouriteItem<TRes> {
  _CopyWithStubImpl$Variables$Mutation$addFavouriteItem(this._res);

  TRes _res;

  call({
    int? customer_id,
    int? restaurant_id,
    int? restaurant_item_id,
  }) =>
      _res;
}

class Mutation$addFavouriteItem {
  Mutation$addFavouriteItem({
    this.insert_customer_favourited_item_one,
    required this.$__typename,
  });

  factory Mutation$addFavouriteItem.fromJson(Map<String, dynamic> json) {
    final l$insert_customer_favourited_item_one =
        json['insert_customer_favourited_item_one'];
    final l$$__typename = json['__typename'];
    return Mutation$addFavouriteItem(
      insert_customer_favourited_item_one:
          l$insert_customer_favourited_item_one == null
              ? null
              : Mutation$addFavouriteItem$insert_customer_favourited_item_one
                  .fromJson((l$insert_customer_favourited_item_one
                      as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$addFavouriteItem$insert_customer_favourited_item_one?
      insert_customer_favourited_item_one;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insert_customer_favourited_item_one =
        insert_customer_favourited_item_one;
    _resultData['insert_customer_favourited_item_one'] =
        l$insert_customer_favourited_item_one?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insert_customer_favourited_item_one =
        insert_customer_favourited_item_one;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$insert_customer_favourited_item_one,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$addFavouriteItem) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$insert_customer_favourited_item_one =
        insert_customer_favourited_item_one;
    final lOther$insert_customer_favourited_item_one =
        other.insert_customer_favourited_item_one;
    if (l$insert_customer_favourited_item_one !=
        lOther$insert_customer_favourited_item_one) {
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

extension UtilityExtension$Mutation$addFavouriteItem
    on Mutation$addFavouriteItem {
  CopyWith$Mutation$addFavouriteItem<Mutation$addFavouriteItem> get copyWith =>
      CopyWith$Mutation$addFavouriteItem(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$addFavouriteItem<TRes> {
  factory CopyWith$Mutation$addFavouriteItem(
    Mutation$addFavouriteItem instance,
    TRes Function(Mutation$addFavouriteItem) then,
  ) = _CopyWithImpl$Mutation$addFavouriteItem;

  factory CopyWith$Mutation$addFavouriteItem.stub(TRes res) =
      _CopyWithStubImpl$Mutation$addFavouriteItem;

  TRes call({
    Mutation$addFavouriteItem$insert_customer_favourited_item_one?
        insert_customer_favourited_item_one,
    String? $__typename,
  });
  CopyWith$Mutation$addFavouriteItem$insert_customer_favourited_item_one<TRes>
      get insert_customer_favourited_item_one;
}

class _CopyWithImpl$Mutation$addFavouriteItem<TRes>
    implements CopyWith$Mutation$addFavouriteItem<TRes> {
  _CopyWithImpl$Mutation$addFavouriteItem(
    this._instance,
    this._then,
  );

  final Mutation$addFavouriteItem _instance;

  final TRes Function(Mutation$addFavouriteItem) _then;

  static const _undefined = {};

  TRes call({
    Object? insert_customer_favourited_item_one = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$addFavouriteItem(
        insert_customer_favourited_item_one: insert_customer_favourited_item_one ==
                _undefined
            ? _instance.insert_customer_favourited_item_one
            : (insert_customer_favourited_item_one
                as Mutation$addFavouriteItem$insert_customer_favourited_item_one?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$addFavouriteItem$insert_customer_favourited_item_one<TRes>
      get insert_customer_favourited_item_one {
    final local$insert_customer_favourited_item_one =
        _instance.insert_customer_favourited_item_one;
    return local$insert_customer_favourited_item_one == null
        ? CopyWith$Mutation$addFavouriteItem$insert_customer_favourited_item_one
            .stub(_then(_instance))
        : CopyWith$Mutation$addFavouriteItem$insert_customer_favourited_item_one(
            local$insert_customer_favourited_item_one,
            (e) => call(insert_customer_favourited_item_one: e));
  }
}

class _CopyWithStubImpl$Mutation$addFavouriteItem<TRes>
    implements CopyWith$Mutation$addFavouriteItem<TRes> {
  _CopyWithStubImpl$Mutation$addFavouriteItem(this._res);

  TRes _res;

  call({
    Mutation$addFavouriteItem$insert_customer_favourited_item_one?
        insert_customer_favourited_item_one,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$addFavouriteItem$insert_customer_favourited_item_one<TRes>
      get insert_customer_favourited_item_one =>
          CopyWith$Mutation$addFavouriteItem$insert_customer_favourited_item_one
              .stub(_res);
}

const documentNodeMutationaddFavouriteItem = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'addFavouriteItem'),
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
        variable: VariableNode(name: NameNode(value: 'restaurant_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'restaurant_item_id')),
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
        name: NameNode(value: 'insert_customer_favourited_item_one'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'object'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'customer_id'),
                value: VariableNode(name: NameNode(value: 'customer_id')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'restaurant_id'),
                value: VariableNode(name: NameNode(value: 'restaurant_id')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'restaurant_item_id'),
                value:
                    VariableNode(name: NameNode(value: 'restaurant_item_id')),
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
Mutation$addFavouriteItem _parserFn$Mutation$addFavouriteItem(
        Map<String, dynamic> data) =>
    Mutation$addFavouriteItem.fromJson(data);
typedef OnMutationCompleted$Mutation$addFavouriteItem = FutureOr<void> Function(
  dynamic,
  Mutation$addFavouriteItem?,
);

class Options$Mutation$addFavouriteItem
    extends graphql.MutationOptions<Mutation$addFavouriteItem> {
  Options$Mutation$addFavouriteItem({
    String? operationName,
    Variables$Mutation$addFavouriteItem? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$addFavouriteItem? onCompleted,
    graphql.OnMutationUpdate<Mutation$addFavouriteItem>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables?.toJson() ?? {},
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
                        : _parserFn$Mutation$addFavouriteItem(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationaddFavouriteItem,
          parserFn: _parserFn$Mutation$addFavouriteItem,
        );

  final OnMutationCompleted$Mutation$addFavouriteItem? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$addFavouriteItem
    extends graphql.WatchQueryOptions<Mutation$addFavouriteItem> {
  WatchOptions$Mutation$addFavouriteItem({
    String? operationName,
    Variables$Mutation$addFavouriteItem? variables,
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
          document: documentNodeMutationaddFavouriteItem,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$addFavouriteItem,
        );
}

extension ClientExtension$Mutation$addFavouriteItem on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$addFavouriteItem>>
      mutate$addFavouriteItem(
              [Options$Mutation$addFavouriteItem? options]) async =>
          await this.mutate(options ?? Options$Mutation$addFavouriteItem());
  graphql.ObservableQuery<
      Mutation$addFavouriteItem> watchMutation$addFavouriteItem(
          [WatchOptions$Mutation$addFavouriteItem? options]) =>
      this.watchMutation(options ?? WatchOptions$Mutation$addFavouriteItem());
}

class Mutation$addFavouriteItem$insert_customer_favourited_item_one {
  Mutation$addFavouriteItem$insert_customer_favourited_item_one({
    required this.id,
    required this.$__typename,
  });

  factory Mutation$addFavouriteItem$insert_customer_favourited_item_one.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$addFavouriteItem$insert_customer_favourited_item_one(
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
            is Mutation$addFavouriteItem$insert_customer_favourited_item_one) ||
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

extension UtilityExtension$Mutation$addFavouriteItem$insert_customer_favourited_item_one
    on Mutation$addFavouriteItem$insert_customer_favourited_item_one {
  CopyWith$Mutation$addFavouriteItem$insert_customer_favourited_item_one<
          Mutation$addFavouriteItem$insert_customer_favourited_item_one>
      get copyWith =>
          CopyWith$Mutation$addFavouriteItem$insert_customer_favourited_item_one(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$addFavouriteItem$insert_customer_favourited_item_one<
    TRes> {
  factory CopyWith$Mutation$addFavouriteItem$insert_customer_favourited_item_one(
    Mutation$addFavouriteItem$insert_customer_favourited_item_one instance,
    TRes Function(Mutation$addFavouriteItem$insert_customer_favourited_item_one)
        then,
  ) = _CopyWithImpl$Mutation$addFavouriteItem$insert_customer_favourited_item_one;

  factory CopyWith$Mutation$addFavouriteItem$insert_customer_favourited_item_one.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$addFavouriteItem$insert_customer_favourited_item_one;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$addFavouriteItem$insert_customer_favourited_item_one<
        TRes>
    implements
        CopyWith$Mutation$addFavouriteItem$insert_customer_favourited_item_one<
            TRes> {
  _CopyWithImpl$Mutation$addFavouriteItem$insert_customer_favourited_item_one(
    this._instance,
    this._then,
  );

  final Mutation$addFavouriteItem$insert_customer_favourited_item_one _instance;

  final TRes Function(
      Mutation$addFavouriteItem$insert_customer_favourited_item_one) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$addFavouriteItem$insert_customer_favourited_item_one(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$addFavouriteItem$insert_customer_favourited_item_one<
        TRes>
    implements
        CopyWith$Mutation$addFavouriteItem$insert_customer_favourited_item_one<
            TRes> {
  _CopyWithStubImpl$Mutation$addFavouriteItem$insert_customer_favourited_item_one(
      this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getFavouriteItems {
  factory Variables$Query$getFavouriteItems({int? $_eq}) =>
      Variables$Query$getFavouriteItems._({
        if ($_eq != null) r'_eq': $_eq,
      });

  Variables$Query$getFavouriteItems._(this._$data);

  factory Variables$Query$getFavouriteItems.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('_eq')) {
      final l$$_eq = data['_eq'];
      result$data['_eq'] = (l$$_eq as int?);
    }
    return Variables$Query$getFavouriteItems._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get $_eq => (_$data['_eq'] as int?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('_eq')) {
      final l$$_eq = $_eq;
      result$data['_eq'] = l$$_eq;
    }
    return result$data;
  }

  CopyWith$Variables$Query$getFavouriteItems<Variables$Query$getFavouriteItems>
      get copyWith => CopyWith$Variables$Query$getFavouriteItems(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getFavouriteItems) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$_eq = $_eq;
    final lOther$$_eq = other.$_eq;
    if (_$data.containsKey('_eq') != other._$data.containsKey('_eq')) {
      return false;
    }
    if (l$$_eq != lOther$$_eq) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$$_eq = $_eq;
    return Object.hashAll([_$data.containsKey('_eq') ? l$$_eq : const {}]);
  }
}

abstract class CopyWith$Variables$Query$getFavouriteItems<TRes> {
  factory CopyWith$Variables$Query$getFavouriteItems(
    Variables$Query$getFavouriteItems instance,
    TRes Function(Variables$Query$getFavouriteItems) then,
  ) = _CopyWithImpl$Variables$Query$getFavouriteItems;

  factory CopyWith$Variables$Query$getFavouriteItems.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getFavouriteItems;

  TRes call({int? $_eq});
}

class _CopyWithImpl$Variables$Query$getFavouriteItems<TRes>
    implements CopyWith$Variables$Query$getFavouriteItems<TRes> {
  _CopyWithImpl$Variables$Query$getFavouriteItems(
    this._instance,
    this._then,
  );

  final Variables$Query$getFavouriteItems _instance;

  final TRes Function(Variables$Query$getFavouriteItems) _then;

  static const _undefined = {};

  TRes call({Object? $_eq = _undefined}) =>
      _then(Variables$Query$getFavouriteItems._({
        ..._instance._$data,
        if ($_eq != _undefined) '_eq': ($_eq as int?),
      }));
}

class _CopyWithStubImpl$Variables$Query$getFavouriteItems<TRes>
    implements CopyWith$Variables$Query$getFavouriteItems<TRes> {
  _CopyWithStubImpl$Variables$Query$getFavouriteItems(this._res);

  TRes _res;

  call({int? $_eq}) => _res;
}

class Query$getFavouriteItems {
  Query$getFavouriteItems({
    required this.customer_favourited_item,
    required this.$__typename,
  });

  factory Query$getFavouriteItems.fromJson(Map<String, dynamic> json) {
    final l$customer_favourited_item = json['customer_favourited_item'];
    final l$$__typename = json['__typename'];
    return Query$getFavouriteItems(
      customer_favourited_item: (l$customer_favourited_item as List<dynamic>)
          .map((e) => Query$getFavouriteItems$customer_favourited_item.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getFavouriteItems$customer_favourited_item>
      customer_favourited_item;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$customer_favourited_item = customer_favourited_item;
    _resultData['customer_favourited_item'] =
        l$customer_favourited_item.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$customer_favourited_item = customer_favourited_item;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$customer_favourited_item.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getFavouriteItems) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$customer_favourited_item = customer_favourited_item;
    final lOther$customer_favourited_item = other.customer_favourited_item;
    if (l$customer_favourited_item.length !=
        lOther$customer_favourited_item.length) {
      return false;
    }
    for (int i = 0; i < l$customer_favourited_item.length; i++) {
      final l$customer_favourited_item$entry = l$customer_favourited_item[i];
      final lOther$customer_favourited_item$entry =
          lOther$customer_favourited_item[i];
      if (l$customer_favourited_item$entry !=
          lOther$customer_favourited_item$entry) {
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

extension UtilityExtension$Query$getFavouriteItems on Query$getFavouriteItems {
  CopyWith$Query$getFavouriteItems<Query$getFavouriteItems> get copyWith =>
      CopyWith$Query$getFavouriteItems(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getFavouriteItems<TRes> {
  factory CopyWith$Query$getFavouriteItems(
    Query$getFavouriteItems instance,
    TRes Function(Query$getFavouriteItems) then,
  ) = _CopyWithImpl$Query$getFavouriteItems;

  factory CopyWith$Query$getFavouriteItems.stub(TRes res) =
      _CopyWithStubImpl$Query$getFavouriteItems;

  TRes call({
    List<Query$getFavouriteItems$customer_favourited_item>?
        customer_favourited_item,
    String? $__typename,
  });
  TRes customer_favourited_item(
      Iterable<Query$getFavouriteItems$customer_favourited_item> Function(
              Iterable<
                  CopyWith$Query$getFavouriteItems$customer_favourited_item<
                      Query$getFavouriteItems$customer_favourited_item>>)
          _fn);
}

class _CopyWithImpl$Query$getFavouriteItems<TRes>
    implements CopyWith$Query$getFavouriteItems<TRes> {
  _CopyWithImpl$Query$getFavouriteItems(
    this._instance,
    this._then,
  );

  final Query$getFavouriteItems _instance;

  final TRes Function(Query$getFavouriteItems) _then;

  static const _undefined = {};

  TRes call({
    Object? customer_favourited_item = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getFavouriteItems(
        customer_favourited_item: customer_favourited_item == _undefined ||
                customer_favourited_item == null
            ? _instance.customer_favourited_item
            : (customer_favourited_item
                as List<Query$getFavouriteItems$customer_favourited_item>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes customer_favourited_item(
          Iterable<Query$getFavouriteItems$customer_favourited_item> Function(
                  Iterable<
                      CopyWith$Query$getFavouriteItems$customer_favourited_item<
                          Query$getFavouriteItems$customer_favourited_item>>)
              _fn) =>
      call(
          customer_favourited_item: _fn(_instance.customer_favourited_item.map(
              (e) => CopyWith$Query$getFavouriteItems$customer_favourited_item(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getFavouriteItems<TRes>
    implements CopyWith$Query$getFavouriteItems<TRes> {
  _CopyWithStubImpl$Query$getFavouriteItems(this._res);

  TRes _res;

  call({
    List<Query$getFavouriteItems$customer_favourited_item>?
        customer_favourited_item,
    String? $__typename,
  }) =>
      _res;
  customer_favourited_item(_fn) => _res;
}

const documentNodeQuerygetFavouriteItems = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getFavouriteItems'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: '_eq')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'customer_favourited_item'),
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
                    value: VariableNode(name: NameNode(value: '_eq')),
                  )
                ]),
              )
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
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
      
    ]),
  ),
]);
Query$getFavouriteItems _parserFn$Query$getFavouriteItems(
        Map<String, dynamic> data) =>
    Query$getFavouriteItems.fromJson(data);

class Options$Query$getFavouriteItems
    extends graphql.QueryOptions<Query$getFavouriteItems> {
  Options$Query$getFavouriteItems({
    String? operationName,
    Variables$Query$getFavouriteItems? variables,
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
          document: documentNodeQuerygetFavouriteItems,
          parserFn: _parserFn$Query$getFavouriteItems,
        );
}

class WatchOptions$Query$getFavouriteItems
    extends graphql.WatchQueryOptions<Query$getFavouriteItems> {
  WatchOptions$Query$getFavouriteItems({
    String? operationName,
    Variables$Query$getFavouriteItems? variables,
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
          document: documentNodeQuerygetFavouriteItems,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getFavouriteItems,
        );
}

class FetchMoreOptions$Query$getFavouriteItems
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getFavouriteItems({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$getFavouriteItems? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQuerygetFavouriteItems,
        );
}

extension ClientExtension$Query$getFavouriteItems on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getFavouriteItems>> query$getFavouriteItems(
          [Options$Query$getFavouriteItems? options]) async =>
      await this.query(options ?? Options$Query$getFavouriteItems());
  graphql.ObservableQuery<Query$getFavouriteItems> watchQuery$getFavouriteItems(
          [WatchOptions$Query$getFavouriteItems? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$getFavouriteItems());
  void writeQuery$getFavouriteItems({
    required Query$getFavouriteItems data,
    Variables$Query$getFavouriteItems? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerygetFavouriteItems),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getFavouriteItems? readQuery$getFavouriteItems({
    Variables$Query$getFavouriteItems? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetFavouriteItems),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getFavouriteItems.fromJson(result);
  }
}

class Query$getFavouriteItems$customer_favourited_item {
  Query$getFavouriteItems$customer_favourited_item({
    required this.restaurant_item_id,
    required this.$__typename,
  });

  factory Query$getFavouriteItems$customer_favourited_item.fromJson(
      Map<String, dynamic> json) {
    final l$restaurant_item_id = json['restaurant_item_id'];
    final l$$__typename = json['__typename'];
    return Query$getFavouriteItems$customer_favourited_item(
      restaurant_item_id: (l$restaurant_item_id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int restaurant_item_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_item_id = restaurant_item_id;
    _resultData['restaurant_item_id'] = l$restaurant_item_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_item_id = restaurant_item_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$restaurant_item_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getFavouriteItems$customer_favourited_item) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$getFavouriteItems$customer_favourited_item
    on Query$getFavouriteItems$customer_favourited_item {
  CopyWith$Query$getFavouriteItems$customer_favourited_item<
          Query$getFavouriteItems$customer_favourited_item>
      get copyWith => CopyWith$Query$getFavouriteItems$customer_favourited_item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getFavouriteItems$customer_favourited_item<TRes> {
  factory CopyWith$Query$getFavouriteItems$customer_favourited_item(
    Query$getFavouriteItems$customer_favourited_item instance,
    TRes Function(Query$getFavouriteItems$customer_favourited_item) then,
  ) = _CopyWithImpl$Query$getFavouriteItems$customer_favourited_item;

  factory CopyWith$Query$getFavouriteItems$customer_favourited_item.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getFavouriteItems$customer_favourited_item;

  TRes call({
    int? restaurant_item_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getFavouriteItems$customer_favourited_item<TRes>
    implements CopyWith$Query$getFavouriteItems$customer_favourited_item<TRes> {
  _CopyWithImpl$Query$getFavouriteItems$customer_favourited_item(
    this._instance,
    this._then,
  );

  final Query$getFavouriteItems$customer_favourited_item _instance;

  final TRes Function(Query$getFavouriteItems$customer_favourited_item) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_item_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getFavouriteItems$customer_favourited_item(
        restaurant_item_id:
            restaurant_item_id == _undefined || restaurant_item_id == null
                ? _instance.restaurant_item_id
                : (restaurant_item_id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getFavouriteItems$customer_favourited_item<TRes>
    implements CopyWith$Query$getFavouriteItems$customer_favourited_item<TRes> {
  _CopyWithStubImpl$Query$getFavouriteItems$customer_favourited_item(this._res);

  TRes _res;

  call({
    int? restaurant_item_id,
    String? $__typename,
  }) =>
      _res;
}
