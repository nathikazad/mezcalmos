import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Variables$Query$fetch_subscribed_posts {
  factory Variables$Query$fetch_subscribed_posts({
    int? customer_id,
    int? limit,
    int? offset,
  }) =>
      Variables$Query$fetch_subscribed_posts._({
        if (customer_id != null) r'customer_id': customer_id,
        if (limit != null) r'limit': limit,
        if (offset != null) r'offset': offset,
      });

  Variables$Query$fetch_subscribed_posts._(this._$data);

  factory Variables$Query$fetch_subscribed_posts.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('customer_id')) {
      final l$customer_id = data['customer_id'];
      result$data['customer_id'] = (l$customer_id as int?);
    }
    if (data.containsKey('limit')) {
      final l$limit = data['limit'];
      result$data['limit'] = (l$limit as int?);
    }
    if (data.containsKey('offset')) {
      final l$offset = data['offset'];
      result$data['offset'] = (l$offset as int?);
    }
    return Variables$Query$fetch_subscribed_posts._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get customer_id => (_$data['customer_id'] as int?);
  int? get limit => (_$data['limit'] as int?);
  int? get offset => (_$data['offset'] as int?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('customer_id')) {
      final l$customer_id = customer_id;
      result$data['customer_id'] = l$customer_id;
    }
    if (_$data.containsKey('limit')) {
      final l$limit = limit;
      result$data['limit'] = l$limit;
    }
    if (_$data.containsKey('offset')) {
      final l$offset = offset;
      result$data['offset'] = l$offset;
    }
    return result$data;
  }

  CopyWith$Variables$Query$fetch_subscribed_posts<
          Variables$Query$fetch_subscribed_posts>
      get copyWith => CopyWith$Variables$Query$fetch_subscribed_posts(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$fetch_subscribed_posts) ||
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
    final l$limit = limit;
    final lOther$limit = other.limit;
    if (_$data.containsKey('limit') != other._$data.containsKey('limit')) {
      return false;
    }
    if (l$limit != lOther$limit) {
      return false;
    }
    final l$offset = offset;
    final lOther$offset = other.offset;
    if (_$data.containsKey('offset') != other._$data.containsKey('offset')) {
      return false;
    }
    if (l$offset != lOther$offset) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$customer_id = customer_id;
    final l$limit = limit;
    final l$offset = offset;
    return Object.hashAll([
      _$data.containsKey('customer_id') ? l$customer_id : const {},
      _$data.containsKey('limit') ? l$limit : const {},
      _$data.containsKey('offset') ? l$offset : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$fetch_subscribed_posts<TRes> {
  factory CopyWith$Variables$Query$fetch_subscribed_posts(
    Variables$Query$fetch_subscribed_posts instance,
    TRes Function(Variables$Query$fetch_subscribed_posts) then,
  ) = _CopyWithImpl$Variables$Query$fetch_subscribed_posts;

  factory CopyWith$Variables$Query$fetch_subscribed_posts.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$fetch_subscribed_posts;

  TRes call({
    int? customer_id,
    int? limit,
    int? offset,
  });
}

class _CopyWithImpl$Variables$Query$fetch_subscribed_posts<TRes>
    implements CopyWith$Variables$Query$fetch_subscribed_posts<TRes> {
  _CopyWithImpl$Variables$Query$fetch_subscribed_posts(
    this._instance,
    this._then,
  );

  final Variables$Query$fetch_subscribed_posts _instance;

  final TRes Function(Variables$Query$fetch_subscribed_posts) _then;

  static const _undefined = {};

  TRes call({
    Object? customer_id = _undefined,
    Object? limit = _undefined,
    Object? offset = _undefined,
  }) =>
      _then(Variables$Query$fetch_subscribed_posts._({
        ..._instance._$data,
        if (customer_id != _undefined) 'customer_id': (customer_id as int?),
        if (limit != _undefined) 'limit': (limit as int?),
        if (offset != _undefined) 'offset': (offset as int?),
      }));
}

class _CopyWithStubImpl$Variables$Query$fetch_subscribed_posts<TRes>
    implements CopyWith$Variables$Query$fetch_subscribed_posts<TRes> {
  _CopyWithStubImpl$Variables$Query$fetch_subscribed_posts(this._res);

  TRes _res;

  call({
    int? customer_id,
    int? limit,
    int? offset,
  }) =>
      _res;
}

class Query$fetch_subscribed_posts {
  Query$fetch_subscribed_posts({
    required this.service_provider_post,
    required this.$__typename,
  });

  factory Query$fetch_subscribed_posts.fromJson(Map<String, dynamic> json) {
    final l$service_provider_post = json['service_provider_post'];
    final l$$__typename = json['__typename'];
    return Query$fetch_subscribed_posts(
      service_provider_post: (l$service_provider_post as List<dynamic>)
          .map((e) =>
              Query$fetch_subscribed_posts$service_provider_post.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$fetch_subscribed_posts$service_provider_post>
      service_provider_post;

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
    if (!(other is Query$fetch_subscribed_posts) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$fetch_subscribed_posts
    on Query$fetch_subscribed_posts {
  CopyWith$Query$fetch_subscribed_posts<Query$fetch_subscribed_posts>
      get copyWith => CopyWith$Query$fetch_subscribed_posts(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_subscribed_posts<TRes> {
  factory CopyWith$Query$fetch_subscribed_posts(
    Query$fetch_subscribed_posts instance,
    TRes Function(Query$fetch_subscribed_posts) then,
  ) = _CopyWithImpl$Query$fetch_subscribed_posts;

  factory CopyWith$Query$fetch_subscribed_posts.stub(TRes res) =
      _CopyWithStubImpl$Query$fetch_subscribed_posts;

  TRes call({
    List<Query$fetch_subscribed_posts$service_provider_post>?
        service_provider_post,
    String? $__typename,
  });
  TRes service_provider_post(
      Iterable<Query$fetch_subscribed_posts$service_provider_post> Function(
              Iterable<
                  CopyWith$Query$fetch_subscribed_posts$service_provider_post<
                      Query$fetch_subscribed_posts$service_provider_post>>)
          _fn);
}

class _CopyWithImpl$Query$fetch_subscribed_posts<TRes>
    implements CopyWith$Query$fetch_subscribed_posts<TRes> {
  _CopyWithImpl$Query$fetch_subscribed_posts(
    this._instance,
    this._then,
  );

  final Query$fetch_subscribed_posts _instance;

  final TRes Function(Query$fetch_subscribed_posts) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_post = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$fetch_subscribed_posts(
        service_provider_post: service_provider_post == _undefined ||
                service_provider_post == null
            ? _instance.service_provider_post
            : (service_provider_post
                as List<Query$fetch_subscribed_posts$service_provider_post>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes service_provider_post(
          Iterable<Query$fetch_subscribed_posts$service_provider_post> Function(
                  Iterable<
                      CopyWith$Query$fetch_subscribed_posts$service_provider_post<
                          Query$fetch_subscribed_posts$service_provider_post>>)
              _fn) =>
      call(
          service_provider_post: _fn(_instance.service_provider_post.map((e) =>
              CopyWith$Query$fetch_subscribed_posts$service_provider_post(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$fetch_subscribed_posts<TRes>
    implements CopyWith$Query$fetch_subscribed_posts<TRes> {
  _CopyWithStubImpl$Query$fetch_subscribed_posts(this._res);

  TRes _res;

  call({
    List<Query$fetch_subscribed_posts$service_provider_post>?
        service_provider_post,
    String? $__typename,
  }) =>
      _res;
  service_provider_post(_fn) => _res;
}

const documentNodeQueryfetch_subscribed_posts = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'fetch_subscribed_posts'),
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
        variable: VariableNode(name: NameNode(value: 'limit')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'offset')),
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
        name: NameNode(value: 'service_provider_post'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'limit'),
            value: VariableNode(name: NameNode(value: 'limit')),
          ),
          ArgumentNode(
            name: NameNode(value: 'offset'),
            value: VariableNode(name: NameNode(value: 'offset')),
          ),
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: '_or'),
                value: ListValueNode(values: [
                  ObjectValueNode(fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'business'),
                      value: ObjectValueNode(fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'subscribers'),
                          value: ObjectValueNode(fields: [
                            ObjectFieldNode(
                              name: NameNode(value: 'customer_id'),
                              value: ObjectValueNode(fields: [
                                ObjectFieldNode(
                                  name: NameNode(value: '_eq'),
                                  value: VariableNode(
                                      name: NameNode(value: 'customer_id')),
                                )
                              ]),
                            )
                          ]),
                        )
                      ]),
                    )
                  ]),
                  ObjectValueNode(fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'laundry'),
                      value: ObjectValueNode(fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'subscribers'),
                          value: ObjectValueNode(fields: [
                            ObjectFieldNode(
                              name: NameNode(value: 'customer_id'),
                              value: ObjectValueNode(fields: [
                                ObjectFieldNode(
                                  name: NameNode(value: '_eq'),
                                  value: VariableNode(
                                      name: NameNode(value: 'customer_id')),
                                )
                              ]),
                            )
                          ]),
                        )
                      ]),
                    )
                  ]),
                  ObjectValueNode(fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'delivery_company'),
                      value: ObjectValueNode(fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'subscribers'),
                          value: ObjectValueNode(fields: [
                            ObjectFieldNode(
                              name: NameNode(value: 'customer_id'),
                              value: ObjectValueNode(fields: [
                                ObjectFieldNode(
                                  name: NameNode(value: '_eq'),
                                  value: VariableNode(
                                      name: NameNode(value: 'customer_id')),
                                )
                              ]),
                            )
                          ]),
                        )
                      ]),
                    )
                  ]),
                  ObjectValueNode(fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'restaurant'),
                      value: ObjectValueNode(fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'subscribers'),
                          value: ObjectValueNode(fields: [
                            ObjectFieldNode(
                              name: NameNode(value: 'customer_id'),
                              value: ObjectValueNode(fields: [
                                ObjectFieldNode(
                                  name: NameNode(value: '_eq'),
                                  value: VariableNode(
                                      name: NameNode(value: 'customer_id')),
                                )
                              ]),
                            )
                          ]),
                        )
                      ]),
                    )
                  ]),
                ]),
              )
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
            name: NameNode(value: 'comments'),
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
            name: NameNode(value: 'image'),
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
            name: NameNode(value: 'link'),
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
            name: NameNode(value: 'service_provider_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'service_provider_type'),
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
            name: NameNode(value: 'laundry'),
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
            name: NameNode(value: 'delivery_company'),
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
            name: NameNode(value: 'business'),
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
Query$fetch_subscribed_posts _parserFn$Query$fetch_subscribed_posts(
        Map<String, dynamic> data) =>
    Query$fetch_subscribed_posts.fromJson(data);

class Options$Query$fetch_subscribed_posts
    extends graphql.QueryOptions<Query$fetch_subscribed_posts> {
  Options$Query$fetch_subscribed_posts({
    String? operationName,
    Variables$Query$fetch_subscribed_posts? variables,
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
          document: documentNodeQueryfetch_subscribed_posts,
          parserFn: _parserFn$Query$fetch_subscribed_posts,
        );
}

class WatchOptions$Query$fetch_subscribed_posts
    extends graphql.WatchQueryOptions<Query$fetch_subscribed_posts> {
  WatchOptions$Query$fetch_subscribed_posts({
    String? operationName,
    Variables$Query$fetch_subscribed_posts? variables,
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
          document: documentNodeQueryfetch_subscribed_posts,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$fetch_subscribed_posts,
        );
}

class FetchMoreOptions$Query$fetch_subscribed_posts
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$fetch_subscribed_posts({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$fetch_subscribed_posts? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQueryfetch_subscribed_posts,
        );
}

extension ClientExtension$Query$fetch_subscribed_posts
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$fetch_subscribed_posts>>
      query$fetch_subscribed_posts(
              [Options$Query$fetch_subscribed_posts? options]) async =>
          await this.query(options ?? Options$Query$fetch_subscribed_posts());
  graphql.ObservableQuery<
      Query$fetch_subscribed_posts> watchQuery$fetch_subscribed_posts(
          [WatchOptions$Query$fetch_subscribed_posts? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$fetch_subscribed_posts());
  void writeQuery$fetch_subscribed_posts({
    required Query$fetch_subscribed_posts data,
    Variables$Query$fetch_subscribed_posts? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryfetch_subscribed_posts),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$fetch_subscribed_posts? readQuery$fetch_subscribed_posts({
    Variables$Query$fetch_subscribed_posts? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryfetch_subscribed_posts),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$fetch_subscribed_posts.fromJson(result);
  }
}

class Query$fetch_subscribed_posts$service_provider_post {
  Query$fetch_subscribed_posts$service_provider_post({
    this.comments,
    required this.id,
    this.image,
    this.likes,
    this.link,
    required this.message,
    required this.posted_on,
    required this.service_provider_id,
    required this.service_provider_type,
    this.restaurant,
    this.laundry,
    this.delivery_company,
    this.business,
    required this.$__typename,
  });

  factory Query$fetch_subscribed_posts$service_provider_post.fromJson(
      Map<String, dynamic> json) {
    final l$comments = json['comments'];
    final l$id = json['id'];
    final l$image = json['image'];
    final l$likes = json['likes'];
    final l$link = json['link'];
    final l$message = json['message'];
    final l$posted_on = json['posted_on'];
    final l$service_provider_id = json['service_provider_id'];
    final l$service_provider_type = json['service_provider_type'];
    final l$restaurant = json['restaurant'];
    final l$laundry = json['laundry'];
    final l$delivery_company = json['delivery_company'];
    final l$business = json['business'];
    final l$$__typename = json['__typename'];
    return Query$fetch_subscribed_posts$service_provider_post(
      comments: l$comments == null ? null : mapFromJson(l$comments),
      id: (l$id as int),
      image: (l$image as String?),
      likes: l$likes == null ? null : mapFromJson(l$likes),
      link: (l$link as String?),
      message: (l$message as String),
      posted_on: (l$posted_on as String),
      service_provider_id: (l$service_provider_id as int),
      service_provider_type: (l$service_provider_type as String),
      restaurant: l$restaurant == null
          ? null
          : Query$fetch_subscribed_posts$service_provider_post$restaurant
              .fromJson((l$restaurant as Map<String, dynamic>)),
      laundry: l$laundry == null
          ? null
          : Query$fetch_subscribed_posts$service_provider_post$laundry.fromJson(
              (l$laundry as Map<String, dynamic>)),
      delivery_company: l$delivery_company == null
          ? null
          : Query$fetch_subscribed_posts$service_provider_post$delivery_company
              .fromJson((l$delivery_company as Map<String, dynamic>)),
      business: l$business == null
          ? null
          : Query$fetch_subscribed_posts$service_provider_post$business
              .fromJson((l$business as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final dynamic? comments;

  final int id;

  final String? image;

  final dynamic? likes;

  final String? link;

  final String message;

  final String posted_on;

  final int service_provider_id;

  final String service_provider_type;

  final Query$fetch_subscribed_posts$service_provider_post$restaurant?
      restaurant;

  final Query$fetch_subscribed_posts$service_provider_post$laundry? laundry;

  final Query$fetch_subscribed_posts$service_provider_post$delivery_company?
      delivery_company;

  final Query$fetch_subscribed_posts$service_provider_post$business? business;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$comments = comments;
    _resultData['comments'] = l$comments == null ? null : mapToJson(l$comments);
    final l$id = id;
    _resultData['id'] = l$id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$likes = likes;
    _resultData['likes'] = l$likes == null ? null : mapToJson(l$likes);
    final l$link = link;
    _resultData['link'] = l$link;
    final l$message = message;
    _resultData['message'] = l$message;
    final l$posted_on = posted_on;
    _resultData['posted_on'] = l$posted_on;
    final l$service_provider_id = service_provider_id;
    _resultData['service_provider_id'] = l$service_provider_id;
    final l$service_provider_type = service_provider_type;
    _resultData['service_provider_type'] = l$service_provider_type;
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant?.toJson();
    final l$laundry = laundry;
    _resultData['laundry'] = l$laundry?.toJson();
    final l$delivery_company = delivery_company;
    _resultData['delivery_company'] = l$delivery_company?.toJson();
    final l$business = business;
    _resultData['business'] = l$business?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$comments = comments;
    final l$id = id;
    final l$image = image;
    final l$likes = likes;
    final l$link = link;
    final l$message = message;
    final l$posted_on = posted_on;
    final l$service_provider_id = service_provider_id;
    final l$service_provider_type = service_provider_type;
    final l$restaurant = restaurant;
    final l$laundry = laundry;
    final l$delivery_company = delivery_company;
    final l$business = business;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$comments,
      l$id,
      l$image,
      l$likes,
      l$link,
      l$message,
      l$posted_on,
      l$service_provider_id,
      l$service_provider_type,
      l$restaurant,
      l$laundry,
      l$delivery_company,
      l$business,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$fetch_subscribed_posts$service_provider_post) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$comments = comments;
    final lOther$comments = other.comments;
    if (l$comments != lOther$comments) {
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
    final l$likes = likes;
    final lOther$likes = other.likes;
    if (l$likes != lOther$likes) {
      return false;
    }
    final l$link = link;
    final lOther$link = other.link;
    if (l$link != lOther$link) {
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
    final l$service_provider_id = service_provider_id;
    final lOther$service_provider_id = other.service_provider_id;
    if (l$service_provider_id != lOther$service_provider_id) {
      return false;
    }
    final l$service_provider_type = service_provider_type;
    final lOther$service_provider_type = other.service_provider_type;
    if (l$service_provider_type != lOther$service_provider_type) {
      return false;
    }
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (l$restaurant != lOther$restaurant) {
      return false;
    }
    final l$laundry = laundry;
    final lOther$laundry = other.laundry;
    if (l$laundry != lOther$laundry) {
      return false;
    }
    final l$delivery_company = delivery_company;
    final lOther$delivery_company = other.delivery_company;
    if (l$delivery_company != lOther$delivery_company) {
      return false;
    }
    final l$business = business;
    final lOther$business = other.business;
    if (l$business != lOther$business) {
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

extension UtilityExtension$Query$fetch_subscribed_posts$service_provider_post
    on Query$fetch_subscribed_posts$service_provider_post {
  CopyWith$Query$fetch_subscribed_posts$service_provider_post<
          Query$fetch_subscribed_posts$service_provider_post>
      get copyWith =>
          CopyWith$Query$fetch_subscribed_posts$service_provider_post(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_subscribed_posts$service_provider_post<
    TRes> {
  factory CopyWith$Query$fetch_subscribed_posts$service_provider_post(
    Query$fetch_subscribed_posts$service_provider_post instance,
    TRes Function(Query$fetch_subscribed_posts$service_provider_post) then,
  ) = _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post;

  factory CopyWith$Query$fetch_subscribed_posts$service_provider_post.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post;

  TRes call({
    dynamic? comments,
    int? id,
    String? image,
    dynamic? likes,
    String? link,
    String? message,
    String? posted_on,
    int? service_provider_id,
    String? service_provider_type,
    Query$fetch_subscribed_posts$service_provider_post$restaurant? restaurant,
    Query$fetch_subscribed_posts$service_provider_post$laundry? laundry,
    Query$fetch_subscribed_posts$service_provider_post$delivery_company?
        delivery_company,
    Query$fetch_subscribed_posts$service_provider_post$business? business,
    String? $__typename,
  });
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant<TRes>
      get restaurant;
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry<TRes>
      get laundry;
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company<
      TRes> get delivery_company;
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$business<TRes>
      get business;
}

class _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post<TRes>
    implements
        CopyWith$Query$fetch_subscribed_posts$service_provider_post<TRes> {
  _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post(
    this._instance,
    this._then,
  );

  final Query$fetch_subscribed_posts$service_provider_post _instance;

  final TRes Function(Query$fetch_subscribed_posts$service_provider_post) _then;

  static const _undefined = {};

  TRes call({
    Object? comments = _undefined,
    Object? id = _undefined,
    Object? image = _undefined,
    Object? likes = _undefined,
    Object? link = _undefined,
    Object? message = _undefined,
    Object? posted_on = _undefined,
    Object? service_provider_id = _undefined,
    Object? service_provider_type = _undefined,
    Object? restaurant = _undefined,
    Object? laundry = _undefined,
    Object? delivery_company = _undefined,
    Object? business = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$fetch_subscribed_posts$service_provider_post(
        comments: comments == _undefined
            ? _instance.comments
            : (comments as dynamic?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        image: image == _undefined ? _instance.image : (image as String?),
        likes: likes == _undefined ? _instance.likes : (likes as dynamic?),
        link: link == _undefined ? _instance.link : (link as String?),
        message: message == _undefined || message == null
            ? _instance.message
            : (message as String),
        posted_on: posted_on == _undefined || posted_on == null
            ? _instance.posted_on
            : (posted_on as String),
        service_provider_id:
            service_provider_id == _undefined || service_provider_id == null
                ? _instance.service_provider_id
                : (service_provider_id as int),
        service_provider_type:
            service_provider_type == _undefined || service_provider_type == null
                ? _instance.service_provider_type
                : (service_provider_type as String),
        restaurant: restaurant == _undefined
            ? _instance.restaurant
            : (restaurant
                as Query$fetch_subscribed_posts$service_provider_post$restaurant?),
        laundry: laundry == _undefined
            ? _instance.laundry
            : (laundry
                as Query$fetch_subscribed_posts$service_provider_post$laundry?),
        delivery_company: delivery_company == _undefined
            ? _instance.delivery_company
            : (delivery_company
                as Query$fetch_subscribed_posts$service_provider_post$delivery_company?),
        business: business == _undefined
            ? _instance.business
            : (business
                as Query$fetch_subscribed_posts$service_provider_post$business?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant<TRes>
      get restaurant {
    final local$restaurant = _instance.restaurant;
    return local$restaurant == null
        ? CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant
            .stub(_then(_instance))
        : CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant(
            local$restaurant, (e) => call(restaurant: e));
  }

  CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry<TRes>
      get laundry {
    final local$laundry = _instance.laundry;
    return local$laundry == null
        ? CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry
            .stub(_then(_instance))
        : CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry(
            local$laundry, (e) => call(laundry: e));
  }

  CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company<
      TRes> get delivery_company {
    final local$delivery_company = _instance.delivery_company;
    return local$delivery_company == null
        ? CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company
            .stub(_then(_instance))
        : CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company(
            local$delivery_company, (e) => call(delivery_company: e));
  }

  CopyWith$Query$fetch_subscribed_posts$service_provider_post$business<TRes>
      get business {
    final local$business = _instance.business;
    return local$business == null
        ? CopyWith$Query$fetch_subscribed_posts$service_provider_post$business
            .stub(_then(_instance))
        : CopyWith$Query$fetch_subscribed_posts$service_provider_post$business(
            local$business, (e) => call(business: e));
  }
}

class _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post<TRes>
    implements
        CopyWith$Query$fetch_subscribed_posts$service_provider_post<TRes> {
  _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post(
      this._res);

  TRes _res;

  call({
    dynamic? comments,
    int? id,
    String? image,
    dynamic? likes,
    String? link,
    String? message,
    String? posted_on,
    int? service_provider_id,
    String? service_provider_type,
    Query$fetch_subscribed_posts$service_provider_post$restaurant? restaurant,
    Query$fetch_subscribed_posts$service_provider_post$laundry? laundry,
    Query$fetch_subscribed_posts$service_provider_post$delivery_company?
        delivery_company,
    Query$fetch_subscribed_posts$service_provider_post$business? business,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant<TRes>
      get restaurant =>
          CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant
              .stub(_res);
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry<TRes>
      get laundry =>
          CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry
              .stub(_res);
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company<
          TRes>
      get delivery_company =>
          CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company
              .stub(_res);
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$business<TRes>
      get business =>
          CopyWith$Query$fetch_subscribed_posts$service_provider_post$business
              .stub(_res);
}

class Query$fetch_subscribed_posts$service_provider_post$restaurant {
  Query$fetch_subscribed_posts$service_provider_post$restaurant({
    this.details,
    required this.$__typename,
  });

  factory Query$fetch_subscribed_posts$service_provider_post$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$fetch_subscribed_posts$service_provider_post$restaurant(
      details: l$details == null
          ? null
          : Query$fetch_subscribed_posts$service_provider_post$restaurant$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$fetch_subscribed_posts$service_provider_post$restaurant$details?
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
            is Query$fetch_subscribed_posts$service_provider_post$restaurant) ||
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

extension UtilityExtension$Query$fetch_subscribed_posts$service_provider_post$restaurant
    on Query$fetch_subscribed_posts$service_provider_post$restaurant {
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant<
          Query$fetch_subscribed_posts$service_provider_post$restaurant>
      get copyWith =>
          CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant<
    TRes> {
  factory CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant(
    Query$fetch_subscribed_posts$service_provider_post$restaurant instance,
    TRes Function(Query$fetch_subscribed_posts$service_provider_post$restaurant)
        then,
  ) = _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$restaurant;

  factory CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$restaurant;

  TRes call({
    Query$fetch_subscribed_posts$service_provider_post$restaurant$details?
        details,
    String? $__typename,
  });
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant$details<
      TRes> get details;
}

class _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$restaurant<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant<
            TRes> {
  _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$restaurant(
    this._instance,
    this._then,
  );

  final Query$fetch_subscribed_posts$service_provider_post$restaurant _instance;

  final TRes Function(
      Query$fetch_subscribed_posts$service_provider_post$restaurant) _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$fetch_subscribed_posts$service_provider_post$restaurant(
        details: details == _undefined
            ? _instance.details
            : (details
                as Query$fetch_subscribed_posts$service_provider_post$restaurant$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant$details<
      TRes> get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant$details
            .stub(_then(_instance))
        : CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$restaurant<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant<
            TRes> {
  _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$restaurant(
      this._res);

  TRes _res;

  call({
    Query$fetch_subscribed_posts$service_provider_post$restaurant$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant$details<
          TRes>
      get details =>
          CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant$details
              .stub(_res);
}

class Query$fetch_subscribed_posts$service_provider_post$restaurant$details {
  Query$fetch_subscribed_posts$service_provider_post$restaurant$details({
    required this.name,
    required this.image,
    required this.$__typename,
  });

  factory Query$fetch_subscribed_posts$service_provider_post$restaurant$details.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$fetch_subscribed_posts$service_provider_post$restaurant$details(
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
            is Query$fetch_subscribed_posts$service_provider_post$restaurant$details) ||
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

extension UtilityExtension$Query$fetch_subscribed_posts$service_provider_post$restaurant$details
    on Query$fetch_subscribed_posts$service_provider_post$restaurant$details {
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant$details<
          Query$fetch_subscribed_posts$service_provider_post$restaurant$details>
      get copyWith =>
          CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant$details<
    TRes> {
  factory CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant$details(
    Query$fetch_subscribed_posts$service_provider_post$restaurant$details
        instance,
    TRes Function(
            Query$fetch_subscribed_posts$service_provider_post$restaurant$details)
        then,
  ) = _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$restaurant$details;

  factory CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$restaurant$details;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$restaurant$details<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant$details<
            TRes> {
  _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$restaurant$details(
    this._instance,
    this._then,
  );

  final Query$fetch_subscribed_posts$service_provider_post$restaurant$details
      _instance;

  final TRes Function(
          Query$fetch_subscribed_posts$service_provider_post$restaurant$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$fetch_subscribed_posts$service_provider_post$restaurant$details(
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

class _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$restaurant$details<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant$details<
            TRes> {
  _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$restaurant$details(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Query$fetch_subscribed_posts$service_provider_post$laundry {
  Query$fetch_subscribed_posts$service_provider_post$laundry({
    this.details,
    required this.$__typename,
  });

  factory Query$fetch_subscribed_posts$service_provider_post$laundry.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$fetch_subscribed_posts$service_provider_post$laundry(
      details: l$details == null
          ? null
          : Query$fetch_subscribed_posts$service_provider_post$laundry$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$fetch_subscribed_posts$service_provider_post$laundry$details?
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
            is Query$fetch_subscribed_posts$service_provider_post$laundry) ||
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

extension UtilityExtension$Query$fetch_subscribed_posts$service_provider_post$laundry
    on Query$fetch_subscribed_posts$service_provider_post$laundry {
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry<
          Query$fetch_subscribed_posts$service_provider_post$laundry>
      get copyWith =>
          CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry<
    TRes> {
  factory CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry(
    Query$fetch_subscribed_posts$service_provider_post$laundry instance,
    TRes Function(Query$fetch_subscribed_posts$service_provider_post$laundry)
        then,
  ) = _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$laundry;

  factory CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$laundry;

  TRes call({
    Query$fetch_subscribed_posts$service_provider_post$laundry$details? details,
    String? $__typename,
  });
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry$details<
      TRes> get details;
}

class _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$laundry<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry<
            TRes> {
  _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$laundry(
    this._instance,
    this._then,
  );

  final Query$fetch_subscribed_posts$service_provider_post$laundry _instance;

  final TRes Function(
      Query$fetch_subscribed_posts$service_provider_post$laundry) _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$fetch_subscribed_posts$service_provider_post$laundry(
        details: details == _undefined
            ? _instance.details
            : (details
                as Query$fetch_subscribed_posts$service_provider_post$laundry$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry$details<
      TRes> get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry$details
            .stub(_then(_instance))
        : CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$laundry<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry<
            TRes> {
  _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$laundry(
      this._res);

  TRes _res;

  call({
    Query$fetch_subscribed_posts$service_provider_post$laundry$details? details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry$details<
          TRes>
      get details =>
          CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry$details
              .stub(_res);
}

class Query$fetch_subscribed_posts$service_provider_post$laundry$details {
  Query$fetch_subscribed_posts$service_provider_post$laundry$details({
    required this.name,
    required this.image,
    required this.$__typename,
  });

  factory Query$fetch_subscribed_posts$service_provider_post$laundry$details.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$fetch_subscribed_posts$service_provider_post$laundry$details(
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
            is Query$fetch_subscribed_posts$service_provider_post$laundry$details) ||
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

extension UtilityExtension$Query$fetch_subscribed_posts$service_provider_post$laundry$details
    on Query$fetch_subscribed_posts$service_provider_post$laundry$details {
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry$details<
          Query$fetch_subscribed_posts$service_provider_post$laundry$details>
      get copyWith =>
          CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry$details<
    TRes> {
  factory CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry$details(
    Query$fetch_subscribed_posts$service_provider_post$laundry$details instance,
    TRes Function(
            Query$fetch_subscribed_posts$service_provider_post$laundry$details)
        then,
  ) = _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$laundry$details;

  factory CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$laundry$details;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$laundry$details<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry$details<
            TRes> {
  _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$laundry$details(
    this._instance,
    this._then,
  );

  final Query$fetch_subscribed_posts$service_provider_post$laundry$details
      _instance;

  final TRes Function(
      Query$fetch_subscribed_posts$service_provider_post$laundry$details) _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$fetch_subscribed_posts$service_provider_post$laundry$details(
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

class _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$laundry$details<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry$details<
            TRes> {
  _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$laundry$details(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Query$fetch_subscribed_posts$service_provider_post$delivery_company {
  Query$fetch_subscribed_posts$service_provider_post$delivery_company({
    this.details,
    required this.$__typename,
  });

  factory Query$fetch_subscribed_posts$service_provider_post$delivery_company.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$fetch_subscribed_posts$service_provider_post$delivery_company(
      details: l$details == null
          ? null
          : Query$fetch_subscribed_posts$service_provider_post$delivery_company$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$fetch_subscribed_posts$service_provider_post$delivery_company$details?
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
            is Query$fetch_subscribed_posts$service_provider_post$delivery_company) ||
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

extension UtilityExtension$Query$fetch_subscribed_posts$service_provider_post$delivery_company
    on Query$fetch_subscribed_posts$service_provider_post$delivery_company {
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company<
          Query$fetch_subscribed_posts$service_provider_post$delivery_company>
      get copyWith =>
          CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company<
    TRes> {
  factory CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company(
    Query$fetch_subscribed_posts$service_provider_post$delivery_company
        instance,
    TRes Function(
            Query$fetch_subscribed_posts$service_provider_post$delivery_company)
        then,
  ) = _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$delivery_company;

  factory CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$delivery_company;

  TRes call({
    Query$fetch_subscribed_posts$service_provider_post$delivery_company$details?
        details,
    String? $__typename,
  });
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company$details<
      TRes> get details;
}

class _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$delivery_company<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company<
            TRes> {
  _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$delivery_company(
    this._instance,
    this._then,
  );

  final Query$fetch_subscribed_posts$service_provider_post$delivery_company
      _instance;

  final TRes Function(
          Query$fetch_subscribed_posts$service_provider_post$delivery_company)
      _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$fetch_subscribed_posts$service_provider_post$delivery_company(
        details: details == _undefined
            ? _instance.details
            : (details
                as Query$fetch_subscribed_posts$service_provider_post$delivery_company$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company$details<
      TRes> get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company$details
            .stub(_then(_instance))
        : CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$delivery_company<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company<
            TRes> {
  _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$delivery_company(
      this._res);

  TRes _res;

  call({
    Query$fetch_subscribed_posts$service_provider_post$delivery_company$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company$details<
          TRes>
      get details =>
          CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company$details
              .stub(_res);
}

class Query$fetch_subscribed_posts$service_provider_post$delivery_company$details {
  Query$fetch_subscribed_posts$service_provider_post$delivery_company$details({
    required this.name,
    required this.image,
    required this.$__typename,
  });

  factory Query$fetch_subscribed_posts$service_provider_post$delivery_company$details.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$fetch_subscribed_posts$service_provider_post$delivery_company$details(
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
            is Query$fetch_subscribed_posts$service_provider_post$delivery_company$details) ||
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

extension UtilityExtension$Query$fetch_subscribed_posts$service_provider_post$delivery_company$details
    on Query$fetch_subscribed_posts$service_provider_post$delivery_company$details {
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company$details<
          Query$fetch_subscribed_posts$service_provider_post$delivery_company$details>
      get copyWith =>
          CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company$details<
    TRes> {
  factory CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company$details(
    Query$fetch_subscribed_posts$service_provider_post$delivery_company$details
        instance,
    TRes Function(
            Query$fetch_subscribed_posts$service_provider_post$delivery_company$details)
        then,
  ) = _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$delivery_company$details;

  factory CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$delivery_company$details;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$delivery_company$details<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company$details<
            TRes> {
  _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$delivery_company$details(
    this._instance,
    this._then,
  );

  final Query$fetch_subscribed_posts$service_provider_post$delivery_company$details
      _instance;

  final TRes Function(
          Query$fetch_subscribed_posts$service_provider_post$delivery_company$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$fetch_subscribed_posts$service_provider_post$delivery_company$details(
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

class _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$delivery_company$details<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company$details<
            TRes> {
  _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$delivery_company$details(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Query$fetch_subscribed_posts$service_provider_post$business {
  Query$fetch_subscribed_posts$service_provider_post$business({
    required this.details,
    required this.$__typename,
  });

  factory Query$fetch_subscribed_posts$service_provider_post$business.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$fetch_subscribed_posts$service_provider_post$business(
      details:
          Query$fetch_subscribed_posts$service_provider_post$business$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$fetch_subscribed_posts$service_provider_post$business$details
      details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$details = details;
    _resultData['details'] = l$details.toJson();
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
            is Query$fetch_subscribed_posts$service_provider_post$business) ||
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

extension UtilityExtension$Query$fetch_subscribed_posts$service_provider_post$business
    on Query$fetch_subscribed_posts$service_provider_post$business {
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$business<
          Query$fetch_subscribed_posts$service_provider_post$business>
      get copyWith =>
          CopyWith$Query$fetch_subscribed_posts$service_provider_post$business(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_subscribed_posts$service_provider_post$business<
    TRes> {
  factory CopyWith$Query$fetch_subscribed_posts$service_provider_post$business(
    Query$fetch_subscribed_posts$service_provider_post$business instance,
    TRes Function(Query$fetch_subscribed_posts$service_provider_post$business)
        then,
  ) = _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$business;

  factory CopyWith$Query$fetch_subscribed_posts$service_provider_post$business.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$business;

  TRes call({
    Query$fetch_subscribed_posts$service_provider_post$business$details?
        details,
    String? $__typename,
  });
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$business$details<
      TRes> get details;
}

class _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$business<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_posts$service_provider_post$business<
            TRes> {
  _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$business(
    this._instance,
    this._then,
  );

  final Query$fetch_subscribed_posts$service_provider_post$business _instance;

  final TRes Function(
      Query$fetch_subscribed_posts$service_provider_post$business) _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$fetch_subscribed_posts$service_provider_post$business(
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Query$fetch_subscribed_posts$service_provider_post$business$details),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$business$details<
      TRes> get details {
    final local$details = _instance.details;
    return CopyWith$Query$fetch_subscribed_posts$service_provider_post$business$details(
        local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$business<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_posts$service_provider_post$business<
            TRes> {
  _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$business(
      this._res);

  TRes _res;

  call({
    Query$fetch_subscribed_posts$service_provider_post$business$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$business$details<
          TRes>
      get details =>
          CopyWith$Query$fetch_subscribed_posts$service_provider_post$business$details
              .stub(_res);
}

class Query$fetch_subscribed_posts$service_provider_post$business$details {
  Query$fetch_subscribed_posts$service_provider_post$business$details({
    required this.name,
    required this.image,
    required this.$__typename,
  });

  factory Query$fetch_subscribed_posts$service_provider_post$business$details.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$fetch_subscribed_posts$service_provider_post$business$details(
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
            is Query$fetch_subscribed_posts$service_provider_post$business$details) ||
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

extension UtilityExtension$Query$fetch_subscribed_posts$service_provider_post$business$details
    on Query$fetch_subscribed_posts$service_provider_post$business$details {
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$business$details<
          Query$fetch_subscribed_posts$service_provider_post$business$details>
      get copyWith =>
          CopyWith$Query$fetch_subscribed_posts$service_provider_post$business$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_subscribed_posts$service_provider_post$business$details<
    TRes> {
  factory CopyWith$Query$fetch_subscribed_posts$service_provider_post$business$details(
    Query$fetch_subscribed_posts$service_provider_post$business$details
        instance,
    TRes Function(
            Query$fetch_subscribed_posts$service_provider_post$business$details)
        then,
  ) = _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$business$details;

  factory CopyWith$Query$fetch_subscribed_posts$service_provider_post$business$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$business$details;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$business$details<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_posts$service_provider_post$business$details<
            TRes> {
  _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$business$details(
    this._instance,
    this._then,
  );

  final Query$fetch_subscribed_posts$service_provider_post$business$details
      _instance;

  final TRes Function(
          Query$fetch_subscribed_posts$service_provider_post$business$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$fetch_subscribed_posts$service_provider_post$business$details(
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

class _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$business$details<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_posts$service_provider_post$business$details<
            TRes> {
  _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$business$details(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}
